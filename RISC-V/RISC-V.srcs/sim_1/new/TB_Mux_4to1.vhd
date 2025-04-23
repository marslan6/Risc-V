----------------------------------------------------------------------------------
-- Engineer: Mehmet Arslan
-- 
-- Create Date: 04/17/2025 07:31:30 PM
-- Design Name: Test Bench for TB_Mux_4to1
-- Module Name: TB_Mux_4to1 - Behavioral
-- Project Name: Test Bench for TB_Mux_4to1
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

entity TB_Mux_4to1 is
    --  Port ( );
end entity TB_Mux_4to1;

architecture RTL of TB_Mux_4to1 is
    constant tb_W : integer range 1 to 64 := 8;
    signal tb_select_i : std_logic_vector(1 downto 0);
    signal tb_input0_i : std_logic_vector(tb_W - 1 downto 0);
    signal tb_input1_i : std_logic_vector(tb_W - 1 downto 0);
    signal tb_input2_i : std_logic_vector(tb_W - 1 downto 0);
    signal tb_input3_i : std_logic_vector(tb_W - 1 downto 0);
    signal tb_output_o : std_logic_vector(tb_W - 1 downto 0);
begin

    DUT_MUX4X1 : entity WORK.Mux_4to1(RTL)
        generic map(
            W => tb_W
        )
        port map(
            select_i => tb_select_i,
            input0_i => tb_input0_i,
            input1_i => tb_input1_i,
            input2_i => tb_input2_i,
            input3_i => tb_input3_i,
            output_o => tb_output_o
        );

    P_COMBINATIONAL : process
    begin
        tb_select_i <= "00";
        tb_input0_i <= x"00";
        tb_input1_i <= x"00";
        tb_input2_i <= x"00";
        tb_input3_i <= x"00";
        wait for 10 ns;
        assert (tb_output_o = x"00") report "TEST : 0 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_input0_i <= x"AA";
        tb_input1_i <= x"BB";
        tb_input2_i <= x"CC";
        tb_input3_i <= x"DD";
        wait for 10 ns;
        assert (tb_output_o = x"AA") report "TEST : 1 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_select_i <= "01";
        wait for 10 ns;
        assert (tb_output_o = x"BB") report "TEST : 2 [FAILED]" severity warning;

        tb_input1_i <= x"11";
        wait for 10 ns;
        assert (tb_output_o = x"11") report "TEST : 3 [FAILED]" severity warning;
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_select_i <= "10";
        wait for 10 ns;
        assert (tb_output_o = x"CC") report "TEST : 4 [FAILED]" severity warning;

        tb_input2_i <= x"22";
        wait for 10 ns;
        assert (tb_output_o = x"22") report "TEST : 5 [FAILED]" severity warning;
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_select_i <= "11";
        wait for 10 ns;
        assert (tb_output_o = x"DD") report "TEST : 6 [FAILED]" severity warning;

        tb_input3_i <= x"33";
        wait for 10 ns;
        assert (tb_output_o = x"33") report "TEST : 7 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        assert (false) report "ALL TESTS PASSED" severity failure;
    end process;

end architecture RTL;