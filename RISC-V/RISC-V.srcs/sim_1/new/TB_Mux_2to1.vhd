----------------------------------------------------------------------------------
-- Engineer: Mehmet Arslan
-- 
-- Create Date: 04/17/2025 07:31:30 PM
-- Design Name: Test Bench for Mux_2to1
-- Module Name: TB_Mux_2to1 - Behavioral
-- Project Name: Test Bench for Mux_2to1
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

ENTITY TB_Mux_2to1 IS
    --  Port ( );
END TB_Mux_2to1;

ARCHITECTURE Behavioral OF TB_Mux_2to1 IS

    --component Mux_2to1 is
    --    generic 
    --    (
    --        W : integer range 1 to 64 := 8
    --    );
    --    port 
    --    (	
    --        sel_i : in std_logic;
    --        input0_i : in std_logic_vector(W-1 downto 0);
    --        input1_i : in std_logic_vector(W-1 downto 0);
    --        output0_o : out std_logic_vector(W-1 downto 0)
    --    );
    --end component;

    CONSTANT tb_W : INTEGER RANGE 1 TO 64 := 8;
    SIGNAL tb_sel_i : STD_LOGIC;
    SIGNAL tb_input0_i : STD_LOGIC_VECTOR(tb_W - 1 DOWNTO 0);
    SIGNAL tb_input1_i : STD_LOGIC_VECTOR(tb_W - 1 DOWNTO 0);
    SIGNAL tb_output0_o : STD_LOGIC_VECTOR(tb_W - 1 DOWNTO 0);

BEGIN

    DUT_MUX2X1 : ENTITY work.Mux_2to1(Rtl) -- Architecture name of imported component
        GENERIC MAP
        (
            W => tb_W
        )
        PORT MAP
        (
            sel_i => tb_sel_i,
            input0_i => tb_input0_i,
            input1_i => tb_input1_i,
            output0_o => tb_output0_o
        );

    P_COMB : PROCESS
    BEGIN

        tb_sel_i <= '0';
        tb_input0_i <= (OTHERS => '0');
        tb_input1_i <= (OTHERS => '0');
        WAIT FOR 10 ns;

        tb_input0_i <= x"A5";
        tb_input1_i <= x"B6";
        WAIT FOR 1 ns;
        ASSERT (tb_output0_o = x"A5") REPORT "TEST : 0" SEVERITY warning;

        tb_sel_i <= '1';
        WAIT FOR 1ns;
        ASSERT (tb_output0_o = x"B6") REPORT "TEST : 1" SEVERITY warning;

        tb_input1_i <= x"77";
        WAIT FOR 1ns;
        ASSERT (tb_output0_o = x"77") REPORT "TEST : 2" SEVERITY warning;

        tb_sel_i <= '0';
        tb_input0_i <= x"99";
        WAIT FOR 1ns;
        ASSERT (tb_output0_o = x"99") REPORT "TEST : 3" SEVERITY warning;

        ASSERT false REPORT "ALL TESTS PASSED" SEVERITY failure;

    END PROCESS;

END Behavioral;