----------------------------------------------------------------------------------
-- Engineer: Mehmet Arslan
-- 
-- Create Date: 04/23/2025 07:50:12 PM
-- Design Name: TB_Register_Simple
-- Module Name: TB_Register_Simple - RTL
-- Project Name: TB_Register_Simple Module
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

entity TB_Register_Simple is
    --  Port ( );
end entity TB_Register_Simple;

architecture RTL of TB_Register_Simple is
    constant clk_period : time := 20 ns; -- 50 MHz
    constant tb_W : integer range 1 to 64 := 32;
    signal tb_clk : std_logic;
    signal tb_reset_i : std_logic;
    signal tb_data_i : std_logic_vector(tb_W - 1 downto 0);
    signal tb_data_o : std_logic_vector(tb_W - 1 downto 0);
begin

    DUT_REGISTER_SIMPLE : entity work.Register_Simple(RTL)
        generic map(
            W => tb_W
        )
        port map(
            clk => tb_clk,
            reset_i => tb_reset_i,
            data_i => tb_data_i,
            data_o => tb_data_o
        );

    -- Generate clock with 50 MHz. 20 ns clock period.    
    P_SEQUENTIAL_CLK : process
    begin
        tb_clk <= '0';
        wait for (clk_period / 2);
        tb_clk <= '1';
        wait for (clk_period / 2);
    end process;

    -- Sequential test block simple register
    P_SEQUENTIAL : process
    begin
        wait until rising_edge(tb_clk);

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        wait for 15 ns; -- Just to see changes on signals more clear and understandable
        tb_reset_i <= '1';
        tb_data_i <= x"EEEEFFFF";
        wait until rising_edge(tb_clk);
        wait for 1 ns;
        assert (tb_data_o = x"00000000") report "TEST : 0 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        wait for 15 ns; -- Just to see changes on signals more clear and understandable
        tb_data_i <= x"AAAABBBB";
        wait until rising_edge(tb_clk);
        wait for 1 ns;
        assert (tb_data_o = x"00000000") report "TEST : 1 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        wait for 15 ns; -- Just to see changes on signals more clear and understandable
        tb_reset_i <= '0';
        tb_data_i <= x"EEEEFFFF";
        wait until rising_edge(tb_clk);
        wait for 1 ns;
        assert (tb_data_o = x"EEEEFFFF") report "TEST : 2 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        wait for 15 ns; -- Just to see changes on signals more clear and understandable
        tb_data_i <= x"AAAABBBB";
        wait until rising_edge(tb_clk);
        wait for 1 ns;
        assert (tb_data_o = x"AAAABBBB") report "TEST : 3 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        assert (false) report "ALL TESTS PASSED" severity failure;

    end process;
end architecture RTL;