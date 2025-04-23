----------------------------------------------------------------------------------
-- Engineer: Mehmet Arslan
-- 
-- Create Date: 04/23/2025 08:35:59 PM
-- Design Name: TB_Register_Write_Enable
-- Module Name: TB_Register_Write_Enable - RTL
-- Project Name: TB_Register_Write_Enable Module
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

entity TB_Register_Write_Enable is
    --  Port ( );
end TB_Register_Write_Enable;

architecture RTL of TB_Register_Write_Enable is
    constant clk_period : time := 20 ns; -- 50 MHz
    constant tb_W : integer range 1 to 64 := 32;
    signal tb_clk : std_logic;
    signal tb_reset_i : std_logic;
    signal tb_write_enable_i : std_logic;
    signal tb_data_i : std_logic_vector(tb_W - 1 downto 0);
    signal tb_data_o : std_logic_vector(tb_W - 1 downto 0);
begin

    DUT_REGISTER_WRITE_ENABLE : entity work.Register_Write_Enable(RTL)
        generic map(
            W => tb_W
        )
        port map(
            clk => tb_clk,
            reset_i => tb_reset_i,
            write_enable_i => tb_write_enable_i,
            data_i => tb_data_i,
            data_o => tb_data_o
        );

    P_SEQUENTIAL_CLK : process
    begin
        tb_clk <= '0';
        wait for (clk_period / 2);
        tb_clk <= '1';
        wait for (clk_period / 2);
    end process;

    P_SEQUENTIAL : process
    begin
        wait until rising_edge(tb_clk);
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        wait for 15 ns;
        tb_reset_i <= '1';
        tb_write_enable_i <= '0';
        tb_data_i <= x"AAAABBBB";
        wait until rising_edge(tb_clk);
        wait for 1 ns;
        assert (tb_data_o = x"00000000") report "TEST : 0 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        wait for 15 ns;
        tb_write_enable_i <= '1';
        tb_data_i <= x"FFFFEEEE";
        wait until rising_edge(tb_clk);
        wait for 1 ns;
        assert (tb_data_o = x"00000000") report "TEST : 1 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        wait for 15 ns;
        tb_reset_i <= '0';
        -- tb_write_enable_i == '1' already
        wait until rising_edge(tb_clk);
        wait for 1 ns;
        assert (tb_data_o = x"FFFFEEEE") report "TEST : 2 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        wait for 15 ns;
        tb_data_i <= x"AAAABBBB";
        wait until rising_edge(tb_clk);
        wait for 1 ns;
        assert (tb_data_o = x"AAAABBBB") report "TEST : 3 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        wait for 15 ns;
        tb_write_enable_i <= '0';
        wait until rising_edge(tb_clk);
        wait for 1 ns;
        assert (tb_data_o = x"AAAABBBB") report "TEST : 4 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        wait for 15 ns;
        tb_data_i <= x"CCCCDDDD";
        -- tb_write_enable_i == '0' already. Hence output will stay same
        wait until rising_edge(tb_clk);
        wait for 1 ns;
        assert (tb_data_o = x"AAAABBBB") report "TEST : 3 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        assert (false) report "ALL TESTS PASSED" severity failure;
    end process;

end RTL;