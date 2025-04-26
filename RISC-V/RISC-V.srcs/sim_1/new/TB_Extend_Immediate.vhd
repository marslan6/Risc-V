----------------------------------------------------------------------------------
-- Engineer: Mehmet Arslan
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TB_Extend_Immediate is
--  Port ( );
end entity TB_Extend_Immediate;

architecture RTL of TB_Extend_Immediate is
    constant tb_W : integer range 1 to 64 := 32;
    signal tb_imm_src_i : std_logic_vector (1 downto 0);
    signal tb_instruction_i : std_logic_vector (tb_W - 1 downto 0);
    signal tb_extended_instruction_o : std_logic_vector (tb_W - 1 downto 0);
begin
    DUT_EXTEND_IMMEDIATE : entity work.Extend_Immediate(RTL)
        generic map(
            W => tb_W
        )
        port map (
            imm_src_i => tb_imm_src_i,
            instruction_i => tb_instruction_i,
            extended_instruction_o => tb_extended_instruction_o
        );

    P_COMBINATIONAL : process
    begin
        tb_imm_src_i <= "00";
        tb_instruction_i <= x"00000000";
        wait for 2 ns;
        assert (tb_extended_instruction_o = x"00000000") report "TEST : 0 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_instruction_i <= x"76C19D24";
        wait for 2 ns;
        assert (tb_extended_instruction_o = x"0000076C") report "TEST : 1 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_instruction_i <= x"F1234567";
        wait for 2 ns;
        assert (tb_extended_instruction_o = x"FFFFFF12") report "TEST : 2 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_instruction_i <= x"81234567";
        wait for 2 ns;
        assert (tb_extended_instruction_o = x"FFFFF812") report "TEST : 3 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_imm_src_i <= "01";
        tb_instruction_i <= x"76C19D24";
        wait for 2 ns;
        assert (tb_extended_instruction_o = x"0000077A") report "TEST : 4 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_instruction_i <= x"F1234567";
        wait for 2 ns;
        assert (tb_extended_instruction_o = x"FFFFFF0A") report "TEST : 5 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_instruction_i <= x"81234567";
        wait for 2 ns;
        assert (tb_extended_instruction_o = x"FFFFF80A") report "TEST : 6 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_imm_src_i <= "10";
        tb_instruction_i <= x"76C19D24";
        wait for 2 ns;
        assert (tb_extended_instruction_o = x"0000077A") report "TEST : 7 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_instruction_i <= x"F1234567";
        wait for 2 ns;
        assert (tb_extended_instruction_o = x"FFFFF70A") report "TEST : 8 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_instruction_i <= x"81234567";
        wait for 2 ns;
        assert (tb_extended_instruction_o = x"FFFFF00A") report "TEST : 9 [FAILED]" severity warning;



        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        assert (false) report "ALL TESTS PASSED" severity failure;

    end process;

end architecture RTL;
