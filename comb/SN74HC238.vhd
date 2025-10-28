
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SN74HC238 is
    Port (
        A0    : in  STD_LOGIC;  -- LSB
        A1    : in  STD_LOGIC;
        A2    : in  STD_LOGIC;  -- MSB
        E1    : in  STD_LOGIC;  -- Enable (activo alta)
        E2    : in  STD_LOGIC;  -- Enable (activo alta)
        E3_L  : in  STD_LOGIC;  -- Enable (activo baja)
        Y     : out STD_LOGIC_VECTOR(7 downto 0)  -- Y0 a Y7 (activo alta)
    );
end entity SN74HC238;

architecture Behavioral of SN74HC238 is
    signal addr   : INTEGER range 0 to 7;
    signal enable : BOOLEAN;
begin

    -- Decodificar la dirección
    addr <= to_integer(unsigned'(A2 & A1 & A0));

    -- Señal de habilitación
    enable <= (E1 = '1') and (E2 = '1') and (E3_L = '0');

    -- Proceso combinacional
    process(enable, addr)
    begin
        if enable then
            Y <= (others => '0');
            case addr is
                when 0 => Y <= "00000001";
                when 1 => Y <= "00000010";
                when 2 => Y <= "00000100";
                when 3 => Y <= "00001000";
                when 4 => Y <= "00010000";
                when 5 => Y <= "00100000";
                when 6 => Y <= "01000000";
                when 7 => Y <= "10000000";
                when others => Y <= (others => '0');
            end case;
        else
            Y <= (others => '0');  -- Deshabilitado: todas salidas en '0'
        end if;
    end process;

end architecture Behavioral;