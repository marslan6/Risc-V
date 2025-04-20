----------------------------------------------------------------------------------
-- Engineer: Mehmet Arslan
-- 
-- Create Date: 20/04/2025 08:32:30 PM
-- Design Name: Test Bench for TB_Mux_16to1
-- Module Name: TB_Mux_16to1 - Behavioral
-- Project Name: Test Bench for TB_Mux_16to1
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
USE IEEE.NUMERIC_STD.ALL;

ENTITY TB_Mux_16to1 IS
    --  Port ( );
END ENTITY TB_Mux_16to1;

ARCHITECTURE RTL OF TB_Mux_16to1 IS

    CONSTANT tb_W : INTEGER RANGE 1 TO 64 := 8;
    SIGNAL tb_select_i : STD_LOGIC_VECTOR(3 DOWNTO 0); -- 16 Inputs / 4 Bits is enough
    SIGNAL tb_input0_i : STD_LOGIC_VECTOR(tb_W - 1 DOWNTO 0);
    SIGNAL tb_input1_i : STD_LOGIC_VECTOR(tb_W - 1 DOWNTO 0);
    SIGNAL tb_input2_i : STD_LOGIC_VECTOR(tb_W - 1 DOWNTO 0);
    SIGNAL tb_input3_i : STD_LOGIC_VECTOR(tb_W - 1 DOWNTO 0);
    SIGNAL tb_input4_i : STD_LOGIC_VECTOR(tb_W - 1 DOWNTO 0);
    SIGNAL tb_input5_i : STD_LOGIC_VECTOR(tb_W - 1 DOWNTO 0);
    SIGNAL tb_input6_i : STD_LOGIC_VECTOR(tb_W - 1 DOWNTO 0);
    SIGNAL tb_input7_i : STD_LOGIC_VECTOR(tb_W - 1 DOWNTO 0);
    SIGNAL tb_input8_i : STD_LOGIC_VECTOR(tb_W - 1 DOWNTO 0);
    SIGNAL tb_input9_i : STD_LOGIC_VECTOR(tb_W - 1 DOWNTO 0);
    SIGNAL tb_input10_i : STD_LOGIC_VECTOR(tb_W - 1 DOWNTO 0);
    SIGNAL tb_input11_i : STD_LOGIC_VECTOR(tb_W - 1 DOWNTO 0);
    SIGNAL tb_input12_i : STD_LOGIC_VECTOR(tb_W - 1 DOWNTO 0);
    SIGNAL tb_input13_i : STD_LOGIC_VECTOR(tb_W - 1 DOWNTO 0);
    SIGNAL tb_input14_i : STD_LOGIC_VECTOR(tb_W - 1 DOWNTO 0);
    SIGNAL tb_input15_i : STD_LOGIC_VECTOR(tb_W - 1 DOWNTO 0);
    SIGNAL tb_output_o : STD_LOGIC_VECTOR(tb_W - 1 DOWNTO 0);

BEGIN

    DUT_MUX16X1 : ENTITY WORK.Mux_16to1(RTL)
        GENERIC MAP(
            W => tb_W
        )
        PORT MAP(
            select_i => tb_select_i,
            input0_i => tb_input0_i,
            input1_i => tb_input1_i,
            input2_i => tb_input2_i,
            input3_i => tb_input3_i,
            input4_i => tb_input4_i,
            input5_i => tb_input5_i,
            input6_i => tb_input6_i,
            input7_i => tb_input7_i,
            input8_i => tb_input8_i,
            input9_i => tb_input9_i,
            input10_i => tb_input10_i,
            input11_i => tb_input11_i,
            input12_i => tb_input12_i,
            input13_i => tb_input13_i,
            input14_i => tb_input14_i,
            input15_i => tb_input15_i,
            output_o => tb_output_o
        );

    P_COMBINATIONAL : PROCESS
    BEGIN
        tb_select_i <= x"0";
        tb_input0_i <= x"00";
        tb_input1_i <= x"00";
        tb_input2_i <= x"00";
        tb_input3_i <= x"00";
        tb_input4_i <= x"00";
        tb_input5_i <= x"00";
        tb_input6_i <= x"00";
        tb_input7_i <= x"00";
        tb_input8_i <= x"00";
        tb_input9_i <= x"00";
        tb_input10_i <= x"00";
        tb_input11_i <= x"00";
        tb_input12_i <= x"00";
        tb_input13_i <= x"00";
        tb_input14_i <= x"00";
        tb_input15_i <= x"00";
        WAIT FOR 10 ns;
        ASSERT (tb_output_o = x"00") REPORT "TEST : 0 [FAILED]" SEVERITY warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_input0_i <= x"11";
        tb_input1_i <= x"22";
        tb_input2_i <= x"33";
        tb_input3_i <= x"44";
        tb_input4_i <= x"55";
        tb_input5_i <= x"66";
        tb_input6_i <= x"77";
        tb_input7_i <= x"88";
        tb_input8_i <= x"99";
        tb_input9_i <= x"AA";
        tb_input10_i <= x"BB";
        tb_input11_i <= x"CC";
        tb_input12_i <= x"DD";
        tb_input13_i <= x"EE";
        tb_input14_i <= x"FF";
        tb_input15_i <= x"9A";
        WAIT FOR 2 ns;
        ASSERT (tb_output_o = x"11") REPORT "TEST : 0 [FAILED]" SEVERITY warning;

        tb_input0_i <= x"98";
        WAIT FOR 2 ns;
        ASSERT (tb_output_o = x"98") REPORT "TEST : 1 [FAILED]" SEVERITY warning;
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_select_i <= x"1";
        WAIT FOR 2 ns;
        ASSERT (tb_output_o = x"22") REPORT "TEST : 2 [FAILED]" SEVERITY warning;

        tb_input1_i <= x"87";
        WAIT FOR 2 ns;
        ASSERT (tb_output_o = x"87") REPORT "TEST : 3 [FAILED]" SEVERITY warning;
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_select_i <= x"2";
        WAIT FOR 2 ns;
        ASSERT (tb_output_o = x"33") REPORT "TEST : 4 [FAILED]" SEVERITY warning;

        tb_input2_i <= x"76";
        WAIT FOR 2 ns;
        ASSERT (tb_output_o = x"76") REPORT "TEST : 5 [FAILED]" SEVERITY warning;
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_select_i <= x"3";
        WAIT FOR 2 ns;
        ASSERT (tb_output_o = x"44") REPORT "TEST : 6 [FAILED]" SEVERITY warning;

        tb_input3_i <= x"65";
        WAIT FOR 2 ns;
        ASSERT (tb_output_o = x"65") REPORT "TEST : 7 [FAILED]" SEVERITY warning;
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_select_i <= x"4";
        WAIT FOR 2 ns;
        ASSERT (tb_output_o = x"55") REPORT "TEST : 8 [FAILED]" SEVERITY warning;

        tb_input4_i <= x"54";
        WAIT FOR 2 ns;
        ASSERT (tb_output_o = x"54") REPORT "TEST : 9 [FAILED]" SEVERITY warning;
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_select_i <= x"5";
        WAIT FOR 2 ns;
        ASSERT (tb_output_o = x"66") REPORT "TEST : 10 [FAILED]" SEVERITY warning;

        tb_input5_i <= x"43";
        WAIT FOR 2 ns;
        ASSERT (tb_output_o = x"43") REPORT "TEST : 11 [FAILED]" SEVERITY warning;
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_select_i <= x"6";
        WAIT FOR 2 ns;
        ASSERT (tb_output_o = x"77") REPORT "TEST : 12 [FAILED]" SEVERITY warning;

        tb_input6_i <= x"32";
        WAIT FOR 2 ns;
        ASSERT (tb_output_o = x"32") REPORT "TEST : 13 [FAILED]" SEVERITY warning;
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_select_i <= x"7";
        WAIT FOR 2 ns;
        ASSERT (tb_output_o = x"88") REPORT "TEST : 14 [FAILED]" SEVERITY warning;

        tb_input7_i <= x"21";
        WAIT FOR 2 ns;
        ASSERT (tb_output_o = x"21") REPORT "TEST : 15 [FAILED]" SEVERITY warning;
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_select_i <= x"8";
        WAIT FOR 2 ns;
        ASSERT (tb_output_o = x"99") REPORT "TEST : 16 [FAILED]" SEVERITY warning;

        tb_input8_i <= x"12";
        WAIT FOR 2 ns;
        ASSERT (tb_output_o = x"12") REPORT "TEST : 17 [FAILED]" SEVERITY warning;
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_select_i <= x"9";
        WAIT FOR 2 ns;
        ASSERT (tb_output_o = x"AA") REPORT "TEST : 18 [FAILED]" SEVERITY warning;

        tb_input9_i <= x"23";
        WAIT FOR 2 ns;
        ASSERT (tb_output_o = x"23") REPORT "TEST : 19 [FAILED]" SEVERITY warning;
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_select_i <= x"A";
        WAIT FOR 2 ns;
        ASSERT (tb_output_o = x"BB") REPORT "TEST : 20 [FAILED]" SEVERITY warning;

        tb_input10_i <= x"34";
        WAIT FOR 2 ns;
        ASSERT (tb_output_o = x"34") REPORT "TEST : 21 [FAILED]" SEVERITY warning;
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_select_i <= x"B";
        WAIT FOR 2 ns;
        ASSERT (tb_output_o = x"CC") REPORT "TEST : 22 [FAILED]" SEVERITY warning;

        tb_input11_i <= x"45";
        WAIT FOR 2 ns;
        ASSERT (tb_output_o = x"45") REPORT "TEST : 23 [FAILED]" SEVERITY warning;
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_select_i <= x"C";
        WAIT FOR 2 ns;
        ASSERT (tb_output_o = x"DD") REPORT "TEST : 24 [FAILED]" SEVERITY warning;

        tb_input12_i <= x"56";
        WAIT FOR 2 ns;
        ASSERT (tb_output_o = x"56") REPORT "TEST : 25 [FAILED]" SEVERITY warning;
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_select_i <= x"D";
        WAIT FOR 2 ns;
        ASSERT (tb_output_o = x"EE") REPORT "TEST : 26 [FAILED]" SEVERITY warning;

        tb_input13_i <= x"67";
        WAIT FOR 2 ns;
        ASSERT (tb_output_o = x"67") REPORT "TEST : 27 [FAILED]" SEVERITY warning;
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_select_i <= x"E";
        WAIT FOR 2 ns;
        ASSERT (tb_output_o = x"FF") REPORT "TEST : 28 [FAILED]" SEVERITY warning;

        tb_input14_i <= x"78";
        WAIT FOR 2 ns;
        ASSERT (tb_output_o = x"78") REPORT "TEST : 29 [FAILED]" SEVERITY warning;
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_select_i <= x"F";
        WAIT FOR 2 ns;
        ASSERT (tb_output_o = x"9A") REPORT "TEST : 30 [FAILED]" SEVERITY warning;

        tb_input15_i <= x"89";
        WAIT FOR 2 ns;
        ASSERT (tb_output_o = x"89") REPORT "TEST : 31 [FAILED]" SEVERITY warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------

        ASSERT (false) REPORT "ALL TESTS PASSED" SEVERITY failure;

    END PROCESS;

END ARCHITECTURE RTL;