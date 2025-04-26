----------------------------------------------------------------------------------
-- Engineer: Mehmet Arslan
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity TB_Program_Counter is
    --  Port ( );
end entity TB_Program_Counter;

architecture RTL of TB_Program_Counter is
    constant tb_W : integer range 1 to 64 := 32;
    constant clock_period : time := 20 ns;
    signal tb_clk : std_logic;
    signal tb_reset_i : std_logic;
    signal tb_input_i : std_logic_vector(tb_W - 1 downto 0);
    signal tb_output_o : std_logic_vector(tb_W - 1 downto 0);
begin

    DUT_PROGRAM_COUNTER : entity work.Program_Counter(RTL)
        generic map(
            W => tb_W
        )
        port map(
            clk => tb_clk,
            reset_i => tb_reset_i,
            input_i => tb_input_i,
            output_o => tb_output_o
        );

    P_SEQUENTIAL_CLK : process
    begin
        tb_clk <= '0';
        wait for clock_period / 2;
        tb_clk <= '1';
        wait for clock_period / 2;
    end process;

    P_SEQUENTIAL : process
    begin
        wait until rising_edge(tb_clk);
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        wait for 15 ns;
        tb_reset_i <= '1';
        tb_input_i <= x"AABBCCDD";
        wait until rising_edge(tb_clk);
        wait for 1 ns;
        assert (tb_output_o = x"00000000") report "TEST : 0 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        wait for 15 ns;
        tb_reset_i <= '1';
        tb_input_i <= x"22334455";
        wait until rising_edge(tb_clk);
        wait for 1 ns;
        assert (tb_output_o = x"00000000") report "TEST : 1 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        assert (false) report "ALL TESTS PASSED (MIDDLE)" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        
        wait for 15 ns;
        tb_reset_i <= '0';
        tb_input_i <= x"22334455";
        wait until rising_edge(tb_clk);
        wait for 1 ns;
        assert (tb_output_o = x"22334455") report "TEST : 1 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        wait for 15 ns;
        tb_reset_i <= '0';
        tb_input_i <= x"AABBCCDD";
        wait until rising_edge(tb_clk);
        wait for 1 ns;
        assert (tb_output_o = x"AABBCCDD") report "TEST : 1 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_input_i <= x"99999999";
        wait for 5 ns;
        assert (tb_output_o = x"AABBCCDD") report "TEST : 1 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        assert (false) report "ALL TESTS PASSED" severity failure;

    end process;
end architecture RTL;