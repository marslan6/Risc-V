----------------------------------------------------------------------------------
-- Engineer: Mehmet Arslan
----------------------------------------------------------------------------------
library IEEE;
library STD;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use STD.TEXTIO.ALL;

entity TB_DRAM is
    --  Port ( );
end entity TB_DRAM;

architecture RTL of TB_DRAM is
    constant TIME_PERIOD : time := 20 ns;
    constant C_RAM_DEPTH : integer range 1 to 32 := 16; -- 4 bits for addressing row
    constant C_RAM_WIDTH : integer range 1 to 64 := 32; -- 32 bits for each data size 
    constant C_ADDR_WIDTH : integer range 1 to 9 := 4;
    signal tb_clk : std_logic;
    signal tb_write_enable_i : std_logic;
    signal tb_address_i : std_logic_vector(3 downto 0);
    signal tb_data_in_i : std_logic_vector(C_RAM_WIDTH - 1 downto 0);
    signal tb_data_out_o : std_logic_vector(C_RAM_WIDTH - 1 downto 0);
begin
    U_DRAM : entity work.DRAM(RTL)
        generic map(
            RAM_DEPTH => C_RAM_DEPTH,
            RAM_WIDTH => C_RAM_WIDTH,
            ADDR_WIDTH => C_ADDR_WIDTH
        )
        port map(
            clk => tb_clk,
            write_enable_i => tb_write_enable_i,
            address_i => tb_address_i,
            data_in_i => tb_data_in_i,
            data_out_o => tb_data_out_o
        );

    P_CLK : process
    begin
        tb_clk <= '0';
        wait for TIME_PERIOD / 2;
        tb_clk <= '1';
        wait for TIME_PERIOD / 2;
    end process;

    P_SEQUENTIAL : process
    begin
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        wait until rising_edge(tb_clk);
        wait for 15 ns;
        tb_write_enable_i <= '0';
        tb_address_i <= x"0";
        tb_data_in_i <= x"00000000";
        wait until rising_edge(tb_clk);
        wait for 1 ns;
        assert (tb_data_out_o = x"FFFFFFFF") report "TEST : 0 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        wait for 14 ns;
        tb_address_i <= x"1";
        wait until rising_edge(tb_clk);
        wait for 1 ns;
        assert (tb_data_out_o = x"EEEEEEEE") report "TEST : 1 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        wait for 14 ns;
        tb_address_i <= x"2";
        wait until rising_edge(tb_clk);
        wait for 1 ns;
        assert (tb_data_out_o = x"DDDDDDDD") report "TEST : 2 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        assert (false) report "ALL TESTS PASSED" severity failure;

    end process;
end architecture RTL;