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
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

ENTITY Mux_16to1 IS
    GENERIC (
        W : INTEGER RANGE 1 TO 64 := 8
    );
    PORT (
        select_i : IN STD_LOGIC_VECTOR(3 DOWNTO 0); -- 16 Inputs / 4 Bits is enough
        input0_i : IN STD_LOGIC_VECTOR(W - 1 DOWNTO 0);
        input1_i : IN STD_LOGIC_VECTOR(W - 1 DOWNTO 0);
        input2_i : IN STD_LOGIC_VECTOR(W - 1 DOWNTO 0);
        input3_i : IN STD_LOGIC_VECTOR(W - 1 DOWNTO 0);
        input4_i : IN STD_LOGIC_VECTOR(W - 1 DOWNTO 0);
        input5_i : IN STD_LOGIC_VECTOR(W - 1 DOWNTO 0);
        input6_i : IN STD_LOGIC_VECTOR(W - 1 DOWNTO 0);
        input7_i : IN STD_LOGIC_VECTOR(W - 1 DOWNTO 0);
        input8_i : IN STD_LOGIC_VECTOR(W - 1 DOWNTO 0);
        input9_i : IN STD_LOGIC_VECTOR(W - 1 DOWNTO 0);
        input10_i : IN STD_LOGIC_VECTOR(W - 1 DOWNTO 0);
        input11_i : IN STD_LOGIC_VECTOR(W - 1 DOWNTO 0);
        input12_i : IN STD_LOGIC_VECTOR(W - 1 DOWNTO 0);
        input13_i : IN STD_LOGIC_VECTOR(W - 1 DOWNTO 0);
        input14_i : IN STD_LOGIC_VECTOR(W - 1 DOWNTO 0);
        input15_i : IN STD_LOGIC_VECTOR(W - 1 DOWNTO 0);
        output_o : OUT STD_LOGIC_VECTOR(W - 1 DOWNTO 0)
    );

END ENTITY Mux_16to1;

ARCHITECTURE RTL OF Mux_16to1 IS
BEGIN

    P_COMBINATIONAL : PROCESS (select_i, input0_i, input1_i, input2_i, input3_i,
        input4_i, input5_i, input6_i, input7_i, input8_i, input9_i, input10_i,
        input11_i, input12_i, input13_i, input14_i, input15_i)
    BEGIN

        CASE (select_i) IS

            WHEN x"0" =>
                output_o <= input0_i;
            WHEN x"1" =>
                output_o <= input1_i;
            WHEN x"2" =>
                output_o <= input2_i;
            WHEN x"3" =>
                output_o <= input3_i;
            WHEN x"4" =>
                output_o <= input4_i;
            WHEN x"5" =>
                output_o <= input5_i;
            WHEN x"6" =>
                output_o <= input6_i;
            WHEN x"7" =>
                output_o <= input7_i;
            WHEN x"8" =>
                output_o <= input8_i;
            WHEN x"9" =>
                output_o <= input9_i;
            WHEN x"A" =>
                output_o <= input10_i;
            WHEN x"B" =>
                output_o <= input11_i;
            WHEN x"C" =>
                output_o <= input12_i;
            WHEN x"D" =>
                output_o <= input13_i;
            WHEN x"E" =>
                output_o <= input14_i;
            WHEN x"F" =>
                output_o <= input15_i;
            WHEN OTHERS =>
                output_o <= (others => '0');
        END CASE;

    END PROCESS;

END ARCHITECTURE RTL;