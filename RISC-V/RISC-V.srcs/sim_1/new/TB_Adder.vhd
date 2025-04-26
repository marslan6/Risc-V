----------------------------------------------------------------------------------
-- Engineer: Mehmet Arslan
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity TB_Adder is
--  Port ( );
end entity TB_Adder;

architecture RTL of TB_Adder is
    constant tb_W : integer range 1 to 64 := 32;
    signal tb_input0_i : std_logic_vector (tb_W - 1 downto 0);
    signal tb_input1_i : std_logic_vector (tb_W - 1 downto 0);
    signal tb_output_o : std_logic_vector (tb_W - 1 downto 0);
begin
    DUT_ADDER : entity work.Adder(RTL)
        generic map(
            W => tb_W
        )
        port map(
            input0_i => tb_input0_i,
            input1_i => tb_input1_i,
            output_o => tb_output_o
        );

    P_COMBINATIONAL : process 
    begin

        tb_input0_i <= x"00000000";
        tb_input1_i <= x"00000000";
        wait for 20 ns;
        assert (tb_output_o = x"00000000") report "TEST : 0 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_input0_i <= x"AAAAAAAA";
        tb_input1_i <= x"11111111";
        wait for 2 ns;
        assert (tb_output_o = x"BBBBBBBB") report "TEST : 1 [FAILED]" severity warning;

        
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_input1_i <= x"22222222";
        wait for 2 ns;
        assert (tb_output_o = x"CCCCCCCC") report "TEST : 2 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_input0_i <= x"33333333";
        wait for 2 ns;
        assert (tb_output_o = x"55555555") report "TEST : 3 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        assert (false) report "ALL TESTS PASSED" severity failure;

    end process;
end architecture RTL;
