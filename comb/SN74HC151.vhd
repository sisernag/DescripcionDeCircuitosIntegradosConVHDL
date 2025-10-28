
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SN74HC151 is
    Port (
        I  : in  STD_LOGIC_VECTOR(7 downto 0);  -- I7 (MSB) a I0 (LSB)
        S  : in  STD_LOGIC_VECTOR(2 downto 0);  -- S2 (MSB), S1, S0 (LSB)
        E_L: in  STD_LOGIC;                     -- Enable (activo bajo)
        Y  : out STD_LOGIC;                     -- Salida normal (activo alta)
        W  : out STD_LOGIC                      -- Salida complementaria (activo bajo)
    );
end entity SN74HC151;

architecture Behavioral of SN74HC151 is
    signal selected_input : STD_LOGIC;
begin

    -- Proceso combinacional para seleccionar la entrada
    process(I, S, E_L)
        variable index : integer range 0 to 7;
    begin
        if E_L = '1' then
            -- Deshabilitado: alta impedancia
            selected_input <= 'Z';
        else
            -- Seleccionar entrada según S2, S1, S0
            index := to_integer(unsigned(S));
            selected_input <= I(index);
        end if;
    end process;

    -- Asignar salidas
    Y <= selected_input;
    W <= not selected_input;

end architecture Behavioral;
