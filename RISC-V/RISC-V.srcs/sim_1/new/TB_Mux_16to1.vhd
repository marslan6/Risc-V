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
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity TB_Mux_16to1 is
    --  Port ( );
end entity TB_Mux_16to1;

architecture RTL of TB_Mux_16to1 is
    constant tb_W : integer range 1 to 64 := 8;
    signal tb_select_i : std_logic_vector(3 downto 0); -- 16 Inputs / 4 Bits is enough
    signal tb_input0_i : std_logic_vector(tb_W - 1 downto 0);
    signal tb_input1_i : std_logic_vector(tb_W - 1 downto 0);
    signal tb_input2_i : std_logic_vector(tb_W - 1 downto 0);
    signal tb_input3_i : std_logic_vector(tb_W - 1 downto 0);
    signal tb_input4_i : std_logic_vector(tb_W - 1 downto 0);
    signal tb_input5_i : std_logic_vector(tb_W - 1 downto 0);
    signal tb_input6_i : std_logic_vector(tb_W - 1 downto 0);
    signal tb_input7_i : std_logic_vector(tb_W - 1 downto 0);
    signal tb_input8_i : std_logic_vector(tb_W - 1 downto 0);
    signal tb_input9_i : std_logic_vector(tb_W - 1 downto 0);
    signal tb_input10_i : std_logic_vector(tb_W - 1 downto 0);
    signal tb_input11_i : std_logic_vector(tb_W - 1 downto 0);
    signal tb_input12_i : std_logic_vector(tb_W - 1 downto 0);
    signal tb_input13_i : std_logic_vector(tb_W - 1 downto 0);
    signal tb_input14_i : std_logic_vector(tb_W - 1 downto 0);
    signal tb_input15_i : std_logic_vector(tb_W - 1 downto 0);
    signal tb_output_o : std_logic_vector(tb_W - 1 downto 0);
begin

    DUT_MUX16X1 : entity WORK.Mux_16to1(RTL)
        generic map(
            W => tb_W
        )
        port map(
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

    P_COMBINATIONAL : process
    begin
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
        wait for 10 ns;
        assert (tb_output_o = x"00") report "TEST : 0 [FAILED]" severity warning;

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
        wait for 2 ns;
        assert (tb_output_o = x"11") report "TEST : 0 [FAILED]" severity warning;

        tb_input0_i <= x"98";
        wait for 2 ns;
        assert (tb_output_o = x"98") report "TEST : 1 [FAILED]" severity warning;
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_select_i <= x"1";
        wait for 2 ns;
        assert (tb_output_o = x"22") report "TEST : 2 [FAILED]" severity warning;

        tb_input1_i <= x"87";
        wait for 2 ns;
        assert (tb_output_o = x"87") report "TEST : 3 [FAILED]" severity warning;
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_select_i <= x"2";
        wait for 2 ns;
        assert (tb_output_o = x"33") report "TEST : 4 [FAILED]" severity warning;

        tb_input2_i <= x"76";
        wait for 2 ns;
        assert (tb_output_o = x"76") report "TEST : 5 [FAILED]" severity warning;
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_select_i <= x"3";
        wait for 2 ns;
        assert (tb_output_o = x"44") report "TEST : 6 [FAILED]" severity warning;

        tb_input3_i <= x"65";
        wait for 2 ns;
        assert (tb_output_o = x"65") report "TEST : 7 [FAILED]" severity warning;
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_select_i <= x"4";
        wait for 2 ns;
        assert (tb_output_o = x"55") report "TEST : 8 [FAILED]" severity warning;

        tb_input4_i <= x"54";
        wait for 2 ns;
        assert (tb_output_o = x"54") report "TEST : 9 [FAILED]" severity warning;
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_select_i <= x"5";
        wait for 2 ns;
        assert (tb_output_o = x"66") report "TEST : 10 [FAILED]" severity warning;

        tb_input5_i <= x"43";
        wait for 2 ns;
        assert (tb_output_o = x"43") report "TEST : 11 [FAILED]" severity warning;
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_select_i <= x"6";
        wait for 2 ns;
        assert (tb_output_o = x"77") report "TEST : 12 [FAILED]" severity warning;

        tb_input6_i <= x"32";
        wait for 2 ns;
        assert (tb_output_o = x"32") report "TEST : 13 [FAILED]" severity warning;
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_select_i <= x"7";
        wait for 2 ns;
        assert (tb_output_o = x"88") report "TEST : 14 [FAILED]" severity warning;

        tb_input7_i <= x"21";
        wait for 2 ns;
        assert (tb_output_o = x"21") report "TEST : 15 [FAILED]" severity warning;
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_select_i <= x"8";
        wait for 2 ns;
        assert (tb_output_o = x"99") report "TEST : 16 [FAILED]" severity warning;

        tb_input8_i <= x"12";
        wait for 2 ns;
        assert (tb_output_o = x"12") report "TEST : 17 [FAILED]" severity warning;
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_select_i <= x"9";
        wait for 2 ns;
        assert (tb_output_o = x"AA") report "TEST : 18 [FAILED]" severity warning;

        tb_input9_i <= x"23";
        wait for 2 ns;
        assert (tb_output_o = x"23") report "TEST : 19 [FAILED]" severity warning;
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_select_i <= x"A";
        wait for 2 ns;
        assert (tb_output_o = x"BB") report "TEST : 20 [FAILED]" severity warning;

        tb_input10_i <= x"34";
        wait for 2 ns;
        assert (tb_output_o = x"34") report "TEST : 21 [FAILED]" severity warning;
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_select_i <= x"B";
        wait for 2 ns;
        assert (tb_output_o = x"CC") report "TEST : 22 [FAILED]" severity warning;

        tb_input11_i <= x"45";
        wait for 2 ns;
        assert (tb_output_o = x"45") report "TEST : 23 [FAILED]" severity warning;
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_select_i <= x"C";
        wait for 2 ns;
        assert (tb_output_o = x"DD") report "TEST : 24 [FAILED]" severity warning;

        tb_input12_i <= x"56";
        wait for 2 ns;
        assert (tb_output_o = x"56") report "TEST : 25 [FAILED]" severity warning;
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_select_i <= x"D";
        wait for 2 ns;
        assert (tb_output_o = x"EE") report "TEST : 26 [FAILED]" severity warning;

        tb_input13_i <= x"67";
        wait for 2 ns;
        assert (tb_output_o = x"67") report "TEST : 27 [FAILED]" severity warning;
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_select_i <= x"E";
        wait for 2 ns;
        assert (tb_output_o = x"FF") report "TEST : 28 [FAILED]" severity warning;

        tb_input14_i <= x"78";
        wait for 2 ns;
        assert (tb_output_o = x"78") report "TEST : 29 [FAILED]" severity warning;
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_select_i <= x"F";
        wait for 2 ns;
        assert (tb_output_o = x"9A") report "TEST : 30 [FAILED]" severity warning;

        tb_input15_i <= x"89";
        wait for 2 ns;
        assert (tb_output_o = x"89") report "TEST : 31 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        assert (false) report "ALL TESTS PASSED" severity failure;
    end process;

end architecture RTL;