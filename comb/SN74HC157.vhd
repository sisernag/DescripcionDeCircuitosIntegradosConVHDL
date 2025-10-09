----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.10.2025 07:24:53
-- Design Name: 
-- Module Name: SN74HC157 - Behavioral
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

entity SN74HC157 is
    Port (
        -- Entradas A (4 bits)
        A : in  STD_LOGIC_VECTOR(3 downto 0);  -- A1 a A4
        -- Entradas B (4 bits)
        B : in  STD_LOGIC_VECTOR(3 downto 0);  -- B1 a B4
        -- Selector común
        S : in  STD_LOGIC;
        -- Habilitación común (activo bajo)
        E_L : in  STD_LOGIC;
        -- Salidas (4 bits)
        Y : out STD_LOGIC_VECTOR(3 downto 0)   -- Y1 a Y4
    );
end entity SN74HC157;

architecture Behavioral of SN74HC157 is
begin

    -- Multiplexar cada par A/B usando S y E_L
    process(A, B, S, E_L)
    begin
        if E_L = '1' then
            -- Deshabilitado: todas las salidas en alta impedancia
            Y <= (others => 'Z');
        else
            -- Seleccionar según S
            if S = '0' then
                Y <= A;
            else
                Y <= B;
            end if;
        end if;
    end process;

end architecture Behavioral;