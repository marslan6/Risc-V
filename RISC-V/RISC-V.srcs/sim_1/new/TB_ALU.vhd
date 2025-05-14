----------------------------------------------------------------------------------
-- Engineer: Mehmet Arslan
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity TB_ALU is
end entity TB_ALU;

architecture RTL of TB_ALU is
    constant tb_W : integer range 8 to 64 := 32;
    signal tb_src_a_i : std_logic_vector(tb_W - 1 downto 0);
    signal tb_src_b_i : std_logic_vector(tb_W - 1 downto 0);
    signal tb_alu_control_i : std_logic_vector(3 downto 0);
    signal tb_alu_res_o : std_logic_vector(tb_W - 1 downto 0);
    signal tb_alu_zero_o : std_logic;
begin

    U_ALU : entity work.ALU(rtl)
        generic map(
            W => tb_W
        )
        port map(
            src_a_i => tb_src_a_i,
            src_b_i => tb_src_b_i,
            alu_control_i => tb_alu_control_i,
            alu_res_o => tb_alu_res_o,
            alu_zero_o => tb_alu_zero_o
        );

    P_COMBINATIONAL : process
    begin
        wait for 10 ns;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_alu_control_i <= "0000";
        tb_src_a_i <= x"12341234";
        tb_src_b_i <= x"43214321";
        wait for 2 ns;
        assert (tb_alu_res_o = x"55555555") report "TEST : 0 [FAILED]" severity warning;
        assert (tb_alu_zero_o = '0') report "TEST : 1 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_src_a_i <= x"98765432";
        tb_src_b_i <= x"85365486";
        wait for 2 ns;
        assert (tb_alu_res_o = x"1DACA8B8") report "TEST : 2 [FAILED]" severity warning;
        assert (tb_alu_zero_o = '0') report "TEST : 3 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_alu_control_i <= "0001";
        tb_src_a_i <= x"85365486";
        tb_src_b_i <= x"85365486";
        wait for 2 ns;
        assert (tb_alu_res_o = x"00000000") report "TEST : 4 [FAILED]" severity warning;
        assert (tb_alu_zero_o = '1') report "TEST : 5 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_src_a_i <= x"85365486";
        tb_src_b_i <= x"43215263";
        wait for 2 ns;
        assert (tb_alu_res_o = x"42150223") report "TEST : 6 [FAILED]" severity warning;
        assert (tb_alu_zero_o = '0') report "TEST : 7 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_alu_control_i <= "0010";
        tb_src_a_i <= x"AAAAAAAA";
        tb_src_b_i <= x"55555555";
        wait for 2 ns;
        assert (tb_alu_res_o = x"00000000") report "TEST : 8 [FAILED]" severity warning;
        assert (tb_alu_zero_o = '1') report "TEST : 9 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_src_a_i <= x"AAAAAAAA";
        tb_src_b_i <= x"55558002";
        wait for 2 ns;
        assert (tb_alu_res_o = x"00008002") report "TEST : 10 [FAILED]" severity warning;
        assert (tb_alu_zero_o = '0') report "TEST : 11 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_alu_control_i <= "0011";
        tb_src_a_i <= x"AAAAAAAA";
        tb_src_b_i <= x"55555555";
        wait for 2 ns;
        assert (tb_alu_res_o = x"FFFFFFFF") report "TEST : 12 [FAILED]" severity warning;
        assert (tb_alu_zero_o = '0') report "TEST : 13 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_alu_control_i <= "0100";
        tb_src_a_i <= x"FFFFFFFF";
        tb_src_b_i <= x"FFFFFFE4";
        wait for 2 ns;
        assert (tb_alu_res_o = x"FFFFFFF0") report "TEST : 13 [FAILED]" severity warning;
        assert (tb_alu_zero_o = '0') report "TEST : 14 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_src_a_i <= x"FFFFFFFF";
        tb_src_b_i <= x"FFFFFFFF";
        wait for 2 ns;
        assert (tb_alu_res_o = x"80000000") report "TEST : 15 [FAILED]" severity warning;
        assert (tb_alu_zero_o = '0') report "TEST : 16 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_src_a_i <= x"FFFFFFFF";
        tb_src_b_i <= x"FFFFFFFE";
        wait for 2 ns;
        assert (tb_alu_res_o = x"C0000000") report "TEST : 17 [FAILED]" severity warning;
        assert (tb_alu_zero_o = '0') report "TEST : 18 [FAILED]" severity warning;

        assert (false) report "ALL TESTS PASSED" severity failure;

    end process;
end architecture RTL;