
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SN74LVC138A is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : in STD_LOGIC;
           G1 : in STD_LOGIC;
           G2A : in STD_LOGIC;
           G2B : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end SN74LVC138A;

architecture Behavioral of SN74LVC138A is

signal sel : unsigned(2 downto 0);

begin
    sel <= (C & B & A);

    process(A, B, C, G1, G2A, G2B)
        variable vY : STD_LOGIC_VECTOR (7 downto 0) := (others => '1');
    begin
        if (G1 = '1' and G2A = '0' and G2B = '0') then
            vY := (others => '1');
            vY(to_integer(sel)) := '0';
        else
            vY := (others => '1');
        end if;
        Y <= vY;
    end process;
end Behavioral;
