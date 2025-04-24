----------------------------------------------------------------------------------
-- Engineer: Mehmet Arslan
-- 
-- Create Date: 04/24/2025 10:42:45 PM
-- Design Name: Program_Counter
-- Module Name: Program_Counter - RTL
-- Project Name: Program_Counter Module
-- Target Devices: Xilinx FPGAs
-- 
-- 
-- Revision: 0.0.0.1
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity Program_Counter is
    generic (
        W : integer range 1 to 64 := 32
    );
    port (
        clk : in std_logic;
        reset_i : in std_logic;
        input_i : in std_logic_vector(W - 1 downto 0);
        output_o : out std_logic_vector(W - 1 downto 0)
    );
end entity Program_Counter;

architecture RTL of Program_Counter is
begin
    P_SEQUENTIAL : process (clk) 
    begin
        if (rising_edge(clk)) then

            if (reset_i = '1') then 
                output_o <= (others => '0');
            else
                output_o <= input_i;            
            end if;

        end if;
    end process;
end architecture RTL;