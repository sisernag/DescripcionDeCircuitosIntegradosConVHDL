
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SN74HC139 is
    Port (
        -- Decodificador 1
        A0_1   : in  STD_LOGIC;
        A1_1   : in  STD_LOGIC;
        G1_L   : in  STD_LOGIC;  -- Enable (active low)
        Y1     : out STD_LOGIC_VECTOR(3 downto 0);  -- Salidas activas bajas

        -- Decodificador 2
        A0_2   : in  STD_LOGIC;
        A1_2   : in  STD_LOGIC;
        G2_L   : in  STD_LOGIC;  -- Enable (active low)
        Y2     : out STD_LOGIC_VECTOR(3 downto 0)   -- Salidas activas bajas
    );
end entity SN74HC139;

architecture Behavioral of SN74HC139 is

    -- Función auxiliar para decodificar un decodificador 2-a-4 con enable activo bajo
    function decode_2to4(addr : STD_LOGIC_VECTOR(1 downto 0); enable_L : STD_LOGIC)
        return STD_LOGIC_VECTOR is
        variable result : STD_LOGIC_VECTOR(3 downto 0);
        variable addr_int : integer;
    begin
        if enable_L = '0' then  -- Habilitado
            addr_int := to_integer(unsigned(addr));
            case addr_int is
                when 0 => result := "1110";
                when 1 => result := "1101";
                when 2 => result := "1011";
                when 3 => result := "0111";
                when others => result := "1111";  -- No debería ocurrir
            end case;
        else
            result := "1111";  -- Deshabilitado: todas altas
        end if;
        return result;
    end function;

begin

    -- Instanciar ambos decodificadores usando la función
    Y1 <= decode_2to4(A1_1 & A0_1, G1_L);
    Y2 <= decode_2to4(A1_2 & A0_2, G2_L);

end architecture Behavioral;
