----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/24/2025 10:43:29 PM
-- Design Name: 
-- Module Name: Extend_Immediate - RTL
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
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity Extend_Immediate is
    generic (
        W : integer range 1 to 64 := 32
    );
    port (
        imm_src_i : in std_logic_vector (1 downto 0);
        instruction_i : in std_logic_vector (W - 1 downto 0);
        extended_instruction_o : out std_logic_vector (W - 1 downto 0)
    );
end entity Extend_Immediate;

architecture RTL of Extend_Immediate is
begin
    P_COMBINATIONAL : process (imm_src_i, instruction_i)
    begin

        case (imm_src_i) is
            when "00" =>
                extended_instruction_o <= (31 downto 12 => instruction_i(31)) & instruction_i(31 downto 20);
            when "01" =>
                extended_instruction_o <= (31 downto 12 => instruction_i(31)) & instruction_i(31 downto 25) & instruction_i(11 downto 7);
            when "10" =>
                extended_instruction_o <= (31 downto 12 => instruction_i(31)) & instruction_i(7) & instruction_i(30 downto 25) & instruction_i(11 downto 8) & '0';
            when others =>
                extended_instruction_o <= (others => '0');
        end case;

    end process;
end architecture RTL;