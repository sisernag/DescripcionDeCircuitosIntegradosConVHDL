
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SN74HC153 is
    Port (
        -- Entradas de datos del primer multiplexor
        C1 : in  STD_LOGIC_VECTOR(3 downto 0);  -- C1_0 a C1_3 (C1_3 = MSB)
        -- Entradas de datos del segundo multiplexor
        C2 : in  STD_LOGIC_VECTOR(3 downto 0);  -- C2_0 a C2_3 (C2_3 = MSB)
        -- Seleccionadores (comunes)
        S  : in  STD_LOGIC_VECTOR(1 downto 0);  -- S1 (MSB), S0 (LSB)
        -- Habilitaciones (independientes)
        E1_L : in  STD_LOGIC;  -- Enable para el primer multiplexor (activo bajo)
        E2_L : in  STD_LOGIC;  -- Enable para el segundo multiplexor (activo bajo)
        -- Salidas
        Y1 : out STD_LOGIC;    -- Salida del primer multiplexor
        Y2 : out STD_LOGIC     -- Salida del segundo multiplexor
    );
end entity SN74HC153;

architecture Behavioral of SN74HC153 is
    signal selected_1 : STD_LOGIC;
    signal selected_2 : STD_LOGIC;
begin

    -- Seleccionar entrada para el primer multiplexor
    process(C1, S, E1_L)
        variable index : integer range 0 to 3;
    begin
        if E1_L = '1' then
            selected_1 <= 'Z';
        else
            index := to_integer(unsigned(S));
            selected_1 <= C1(index);
        end if;
    end process;

    -- Seleccionar entrada para el segundo multiplexor
    process(C2, S, E2_L)
        variable index : integer range 0 to 3;
    begin
        if E2_L = '1' then
            selected_2 <= 'Z';
        else
            index := to_integer(unsigned(S));
            selected_2 <= C2(index);
        end if;
    end process;

    -- Asignar salidas
    Y1 <= selected_1;
    Y2 <= selected_2;

end architecture Behavioral;