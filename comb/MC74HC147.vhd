----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.10.2025 10:01:55
-- Design Name: 
-- Module Name: MC74HC147 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity MC74HC147 is
    Port (
        I1  : in  STD_LOGIC;
        I2  : in  STD_LOGIC;
        I3  : in  STD_LOGIC;
        I4  : in  STD_LOGIC;
        I5  : in  STD_LOGIC;
        I6  : in  STD_LOGIC;
        I7  : in  STD_LOGIC;
        I8  : in  STD_LOGIC;
        I9  : in  STD_LOGIC;
        A3  : out STD_LOGIC;  -- MSB (activo bajo)
        A2  : out STD_LOGIC;
        A1  : out STD_LOGIC;
        A0  : out STD_LOGIC   -- LSB (activo bajo)
    );
end entity MC74HC147;

architecture Behavioral of MC74HC147 is
    signal code : STD_LOGIC_VECTOR(3 downto 0);  -- BCD normal (no invertido)
begin

    -- Proceso combinacional: codificador de prioridad
    process(I1, I2, I3, I4, I5, I6, I7, I8, I9)
    begin
        -- Por defecto: todas las entradas inactivas → código 0
        code <= "0000";

        -- Prioridad más alta: I9
        if I9 = '0' then
            code <= "1001";  -- 9
        elsif I8 = '0' then
            code <= "1000";  -- 8
        elsif I7 = '0' then
            code <= "0111";  -- 7
        elsif I6 = '0' then
            code <= "0110";  -- 6
        elsif I5 = '0' then
            code <= "0101";  -- 5
        elsif I4 = '0' then
            code <= "0100";  -- 4
        elsif I3 = '0' then
            code <= "0011";  -- 3
        elsif I2 = '0' then
            code <= "0010";  -- 2
        elsif I1 = '0' then
            code <= "0001";  -- 1
        else
            code <= "0000";  -- 0 (cuando todas I1-I9 = '1')
        end if;
    end process;

    -- Salidas activas bajas: invertir el código BCD
    A3 <= not code(3);
    A2 <= not code(2);
    A1 <= not code(1);
    A0 <= not code(0);

end architecture Behavioral;
