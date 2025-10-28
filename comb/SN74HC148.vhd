
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SN74HC148 is
    Port (
        EI   : in  STD_LOGIC;                     -- Enable Input (active low)
        D    : in  STD_LOGIC_VECTOR(7 downto 0);  -- D7 (MSB) to D0 (LSB), active low
        A    : out STD_LOGIC_VECTOR(2 downto 0);  -- A2 (MSB), A1, A0 (active low)
        GS   : out STD_LOGIC;                     -- Group Signal (active low)
        EO   : out STD_LOGIC                      -- Enable Output (active low)
    );
end entity SN74HC148;

architecture Behavioral of SN74HC148 is
    signal active_input : boolean;
    signal highest_index : integer range 0 to 7;
    signal code_bin : STD_LOGIC_VECTOR(2 downto 0);  -- BCD normal (no invertido)
begin

    -- Proceso combinacional para detectar prioridad
    process(EI, D)
    begin
        if EI = '1' then
            -- Deshabilitado
            code_bin <= "111";  -- valor irrelevante, pero se sobrescribe abajo
            active_input <= false;
            highest_index <= 0;
        else
            -- Buscar la entrada activa de mayor prioridad (D7 → D0)
            active_input <= false;
            for i in 7 downto 0 loop
                if D(i) = '0' then
                    highest_index <= i;
                    active_input <= true;
                    exit;  -- salir en la primera (más alta) encontrada
                end if;
            end loop;
            -- Si ninguna está activa, highest_index no importa
        end if;
    end process;

    -- Generar código binario (normal, no invertido)
    code_bin <= std_logic_vector(to_unsigned(highest_index, 3));

    -- Salidas A2-A0: invertidas (activas bajas)
    A <= not code_bin;

    -- GS: '0' si hay al menos una entrada activa y EI='0'
    GS <= '0' when (EI = '0' and active_input) else '1';

    -- EO: '0' solo si EI='0' y TODAS las entradas están inactivas ('1')
    EO <= '0' when (EI = '0' and D = "11111111") else '1';

end architecture Behavioral;