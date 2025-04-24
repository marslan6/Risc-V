----------------------------------------------------------------------------------
-- Engineer: Mehmet Arslan
-- 
-- Create Date: 04/24/2025 10:42:45 PM
-- Design Name: Adder
-- Module Name: Adder - RTL
-- Project Name: Adder Module
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

entity Adder is
    generic (
        W : integer range 1 to 64 := 32
    );
    port (
        input0_o : in std_logic_vector (W - 1 downto 0);
        input1_o : in std_logic_vector (W - 1 downto 0);
        output_o : out std_logic_vector (W - 1 downto 0)
    );
end entity Adder;

architecture RTL of Adder is
begin
    P_COMBINATIONAL : process (input0_o, input1_o)
    begin
        output_o <= std_logic_vector(unsigned(input0_o) + unsigned(input1_o));
    end process;
end architecture RTL;