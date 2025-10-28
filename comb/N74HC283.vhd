
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SN74HC283 is
    Port (
        A  : in  STD_LOGIC_VECTOR(3 downto 0);  -- A1 (LSB) a A4 (MSB)
        B  : in  STD_LOGIC_VECTOR(3 downto 0);  -- B1 (LSB) a B4 (MSB)
        C0 : in  STD_LOGIC;                     -- Acarreo de entrada
        S  : out STD_LOGIC_VECTOR(3 downto 0);  -- S1 (LSB) a S4 (MSB)
        C4 : out STD_LOGIC                      -- Acarreo de salida
    );
end entity SN74HC283;

architecture Behavioral of SN74HC283 is
    signal sum_full : UNSIGNED(4 downto 0);  -- 5 bits para acarreo
    signal carry_slv : std_logic_vector(4 downto 0);
begin

    -- Sumar A + B + C0 (extender A y B a 5 bits, incluir C0 como LSB)
    carry_slv(0) <= C0;
    sum_full <= resize(unsigned('0' & A), 5) + resize(unsigned('0' & B), 5) + to_integer(unsigned(carry_slv));

    -- Asignar resultado y acarreo
    S <= STD_LOGIC_VECTOR(sum_full(3 downto 0));
    C4 <= sum_full(4);

end architecture Behavioral;