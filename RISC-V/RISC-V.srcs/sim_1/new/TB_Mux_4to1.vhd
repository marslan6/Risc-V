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
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY TB_Mux_4to1 IS
    --  Port ( );
END ENTITY TB_Mux_4to1;

ARCHITECTURE RTL OF TB_Mux_4to1 IS

    CONSTANT tb_W : INTEGER RANGE 1 TO 64 := 8;
    SIGNAL tb_select_i : STD_LOGIC_VECTOR(1 DOWNTO 0);
    SIGNAL tb_input0_i : STD_LOGIC_VECTOR(tb_W - 1 DOWNTO 0);
    SIGNAL tb_input1_i : STD_LOGIC_VECTOR(tb_W - 1 DOWNTO 0);
    SIGNAL tb_input2_i : STD_LOGIC_VECTOR(tb_W - 1 DOWNTO 0);
    SIGNAL tb_input3_i : STD_LOGIC_VECTOR(tb_W - 1 DOWNTO 0);
    SIGNAL tb_output_o : STD_LOGIC_VECTOR(tb_W - 1 DOWNTO 0);

BEGIN

    DUT_MUX4X1 : ENTITY WORK.Mux_4to1(RTL)
    GENERIC MAP(
        W => tb_W
    )
    PORT MAP(
        select_i => tb_select_i,
        input0_i => tb_input0_i,
        input1_i => tb_input1_i,
        input2_i => tb_input2_i,
        input3_i => tb_input3_i,
        output_o => tb_output_o
    );

    P_COMBINATIONAL : PROCESS
    BEGIN

        tb_select_i <= "00";
        tb_input0_i <= x"00";
        tb_input1_i <= x"00";
        tb_input2_i <= x"00";
        tb_input3_i <= x"00";
        WAIT FOR 10 ns;
        ASSERT (tb_output_o = x"00") REPORT "TEST : 0 [FAILED]" SEVERITY warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_input0_i <= x"AA";
        tb_input1_i <= x"BB";
        tb_input2_i <= x"CC";
        tb_input3_i <= x"DD";
        WAIT FOR 10 ns;
        ASSERT (tb_output_o = x"AA") REPORT "TEST : 1 [FAILED]" SEVERITY warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_select_i <= "01";
        WAIT FOR 10 ns;
        ASSERT (tb_output_o = x"BB") REPORT "TEST : 2 [FAILED]" SEVERITY warning;

        tb_input1_i <= x"11";
        WAIT FOR 10 ns;
        ASSERT (tb_output_o = x"11") REPORT "TEST : 3 [FAILED]" SEVERITY warning;
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_select_i <= "10";
        WAIT FOR 10 ns;
        ASSERT (tb_output_o = x"CC") REPORT "TEST : 4 [FAILED]" SEVERITY warning;

        tb_input2_i <= x"22";
        WAIT FOR 10 ns;
        ASSERT (tb_output_o = x"22") REPORT "TEST : 5 [FAILED]" SEVERITY warning;
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------

        tb_select_i <= "11";
        WAIT FOR 10 ns;
        ASSERT (tb_output_o = x"DD") REPORT "TEST : 6 [FAILED]" SEVERITY warning;

        tb_input3_i <= x"33";
        WAIT FOR 10 ns;
        ASSERT (tb_output_o = x"33") REPORT "TEST : 7 [FAILED]" SEVERITY warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------

        ASSERT (false) REPORT "ALL TESTS PASSED" SEVERITY failure;

    END PROCESS;

END ARCHITECTURE RTL;