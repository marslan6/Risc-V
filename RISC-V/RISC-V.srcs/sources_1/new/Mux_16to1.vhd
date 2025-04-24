----------------------------------------------------------------------------------
-- Engineer: Mehmet Arslan
-- 
-- Create Date: 20/04/2025 08:19:52 PM
-- Design Name: Mux_16to1 Module
-- Module Name: Mux_16to1 - Behavioral
-- Project Name: Mux_16to1 Module
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
use IEEE.NUMERIC_STD.ALL;

entity Mux_16to1 is
    generic (
        W : integer range 1 to 64 := 32
    );
    port (
        select_i : in std_logic_vector(3 downto 0); -- 16 Inputs / 4 Bits is enough
        input0_i : in std_logic_vector(W - 1 downto 0);
        input1_i : in std_logic_vector(W - 1 downto 0);
        input2_i : in std_logic_vector(W - 1 downto 0);
        input3_i : in std_logic_vector(W - 1 downto 0);
        input4_i : in std_logic_vector(W - 1 downto 0);
        input5_i : in std_logic_vector(W - 1 downto 0);
        input6_i : in std_logic_vector(W - 1 downto 0);
        input7_i : in std_logic_vector(W - 1 downto 0);
        input8_i : in std_logic_vector(W - 1 downto 0);
        input9_i : in std_logic_vector(W - 1 downto 0);
        input10_i : in std_logic_vector(W - 1 downto 0);
        input11_i : in std_logic_vector(W - 1 downto 0);
        input12_i : in std_logic_vector(W - 1 downto 0);
        input13_i : in std_logic_vector(W - 1 downto 0);
        input14_i : in std_logic_vector(W - 1 downto 0);
        input15_i : in std_logic_vector(W - 1 downto 0);
        output_o : out std_logic_vector(W - 1 downto 0)
    );

end entity Mux_16to1;

architecture RTL of Mux_16to1 is
begin

    P_COMBINATIONAL : process (select_i, input0_i, input1_i, input2_i, input3_i,
        input4_i, input5_i, input6_i, input7_i, input8_i, input9_i, input10_i,
        input11_i, input12_i, input13_i, input14_i, input15_i)
    begin
        case (select_i) is
            when x"0" =>
                output_o <= input0_i;
            when x"1" =>
                output_o <= input1_i;
            when x"2" =>
                output_o <= input2_i;
            when x"3" =>
                output_o <= input3_i;
            when x"4" =>
                output_o <= input4_i;
            when x"5" =>
                output_o <= input5_i;
            when x"6" =>
                output_o <= input6_i;
            when x"7" =>
                output_o <= input7_i;
            when x"8" =>
                output_o <= input8_i;
            when x"9" =>
                output_o <= input9_i;
            when x"A" =>
                output_o <= input10_i;
            when x"B" =>
                output_o <= input11_i;
            when x"C" =>
                output_o <= input12_i;
            when x"D" =>
                output_o <= input13_i;
            when x"E" =>
                output_o <= input14_i;
            when x"F" =>
                output_o <= input15_i;
            when others =>
                output_o <= (others => '0');
        end case;
    end process;

end architecture RTL;