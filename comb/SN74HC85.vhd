----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.10.2025 19:19:32
-- Design Name: 
-- Module Name: SN74HC85 - Behavioral
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

entity SN74HC85 is
    Port (
        -- Números a comparar
        A0 : in  STD_LOGIC;
        A1 : in  STD_LOGIC;
        A2 : in  STD_LOGIC;
        A3 : in  STD_LOGIC;
        B0 : in  STD_LOGIC;
        B1 : in  STD_LOGIC;
        B2 : in  STD_LOGIC;
        B3 : in  STD_LOGIC;
        -- Entradas en cascada
        IAgtB : in  STD_LOGIC;  -- A > B en cascada
        IAltB : in  STD_LOGIC;  -- A < B en cascada
        IAEqB : in  STD_LOGIC;  -- A = B en cascada
        -- Salidas
        OAgTB : out STD_LOGIC;  -- A > B
        OAlTB : out STD_LOGIC;  -- A < B
        OAEqB : out STD_LOGIC   -- A = B
    );
end entity SN74HC85;

architecture Behavioral of SN74HC85 is
    signal A_int : UNSIGNED(3 downto 0);
    signal B_int : UNSIGNED(3 downto 0);
begin

    -- Convertir entradas a enteros sin signo
    A_int <= UNSIGNED'(A3 & A2 & A1 & A0);
    B_int <= UNSIGNED'(B3 & B2 & B1 & B0);

    -- Comparar y asignar salidas considerando cascada
    process(A_int, B_int, IAgtB, IAltB, IAEqB)
    begin
        if A_int > B_int then
            OAgTB <= '1';
            OAlTB <= '0';
            OAEqB <= '0';
        elsif A_int < B_int then
            OAgTB <= '0';
            OAlTB <= '1';
            OAEqB <= '0';
        else  -- A_int = B_int
            OAgTB <= IAgtB;
            OAlTB <= IAltB;
            OAEqB <= IAEqB;
        end if;
    end process;

end architecture Behavioral;