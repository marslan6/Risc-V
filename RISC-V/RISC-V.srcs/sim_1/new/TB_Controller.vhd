----------------------------------------------------------------------------------
-- Engineer: Mehmet Arslan
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity TB_Controller is
    --  Port ( );
end entity TB_Controller;

architecture RTL of TB_Controller is

    constant tb_W : integer range 32 downto 32 := 32;

    signal tb_instruction_i : std_logic_vector(tb_W - 1 downto 0);
    signal tb_zero : std_logic;
    signal tb_PC_src : std_logic;
    signal tb_result_src : std_logic;
    signal tb_mem_write : std_logic;
    signal tb_alu_control : std_logic_vector(2 downto 0);
    signal tb_alu_src : std_logic;
    signal tb_imm_src : std_logic_vector(1 downto 0);
    signal tb_reg_write : std_logic;

begin
    U_DUT_CONTROLLER : entity work.Controller(RTL)
        generic map(
            W => tb_W
        )
        port map(
            instruction_i => tb_instruction_i,
            zero => tb_zero,
            PC_src => tb_PC_src,
            result_src => tb_result_src,
            mem_write => tb_mem_write,
            alu_control => tb_alu_control,
            alu_src => tb_alu_src,
            imm_src => tb_imm_src,
            reg_write => tb_reg_write
        );

    P_DUT : process
    begin
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        -- lw
        wait for 2 ns;
        tb_instruction_i <= "XXXX" & x"FFF" & "X000" & x"F" & "X0000011";
        tb_zero <= '1';
        wait for 1 ns;
        assert (tb_PC_src = '0') report "TEST : 0 [FAILED]" severity warning;
        assert (tb_result_src = '1') report "TEST : 1 [FAILED]" severity warning;
        assert (tb_mem_write = '0') report "TEST : 2 [FAILED]" severity warning;
        assert (tb_alu_control = "000") report "TEST : 3 [FAILED]" severity warning;
        assert (tb_alu_src = '1') report "TEST : 4 [FAILED]" severity warning;
        assert (tb_imm_src = "00") report "TEST : 5 [FAILED]" severity warning;
        assert (tb_reg_write = '1') report "TEST : 6 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        wait for 10 ns;
        tb_instruction_i <= "XXXX" & x"FFF" & "X101" & x"F" & "X0000011";
        tb_zero <= '1';
        wait for 1 ns;
        assert (tb_PC_src = '0') report "TEST : 7 [FAILED]" severity warning;
        assert (tb_result_src = '1') report "TEST : 8 [FAILED]" severity warning;
        assert (tb_mem_write = '0') report "TEST : 9 [FAILED]" severity warning;
        assert (tb_alu_control = "000") report "TEST : 10 [FAILED]" severity warning;
        assert (tb_alu_src = '1') report "TEST : 11 [FAILED]" severity warning;
        assert (tb_imm_src = "00") report "TEST : 12 [FAILED]" severity warning;
        assert (tb_reg_write = '1') report "TEST : 13 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        -- sw
        wait for 10 ns;
        tb_instruction_i <= "XXXX" & x"FFF" & "X111" & x"F" & "X0100011";
        tb_zero <= '1';
        wait for 1 ns;
        assert (tb_PC_src = '0') report "TEST : 14 [FAILED]" severity warning;
        assert (tb_result_src = 'X') report "TEST : 15 [FAILED]" severity warning;
        assert (tb_mem_write = '1') report "TEST : 16 [FAILED]" severity warning;
        assert (tb_alu_control = "000") report "TEST : 17 [FAILED]" severity warning;
        assert (tb_alu_src = '1') report "TEST : 18 [FAILED]" severity warning;
        assert (tb_imm_src = "01") report "TEST : 19 [FAILED]" severity warning;
        assert (tb_reg_write = '0') report "TEST : 20 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        -- beq
        wait for 10 ns;
        tb_instruction_i <= "XXXX" & x"FFF" & "X010" & x"F" & "X1100011";
        tb_zero <= '1';
        wait for 1 ns;
        assert (tb_PC_src = '1') report "TEST : 21 [FAILED]" severity warning;
        assert (tb_result_src = 'X') report "TEST : 22 [FAILED]" severity warning;
        assert (tb_mem_write = '0') report "TEST : 23 [FAILED]" severity warning;
        assert (tb_alu_control = "001") report "TEST : 24 [FAILED]" severity warning;
        assert (tb_alu_src = '0') report "TEST : 25 [FAILED]" severity warning;
        assert (tb_imm_src = "10") report "TEST : 26 [FAILED]" severity warning;
        assert (tb_reg_write = '0') report "TEST : 27 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        wait for 10 ns;
        tb_instruction_i <= "XXXX" & x"FFF" & "X010" & x"F" & "X1100011";
        tb_zero <= '1';
        wait for 1 ns;
        assert (tb_PC_src = '1') report "TEST : 28 [FAILED]" severity warning;
        assert (tb_result_src = 'X') report "TEST : 29 [FAILED]" severity warning;
        assert (tb_mem_write = '0') report "TEST : 30 [FAILED]" severity warning;
        assert (tb_alu_control = "001") report "TEST : 31 [FAILED]" severity warning;
        assert (tb_alu_src = '0') report "TEST : 32 [FAILED]" severity warning;
        assert (tb_imm_src = "10") report "TEST : 33 [FAILED]" severity warning;
        assert (tb_reg_write = '0') report "TEST : 34 [FAILED]" severity warning;
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        wait for 10 ns;
        tb_instruction_i <= "XXXX" & x"FFF" & "X010" & x"F" & "X1100011"; -- x010 does not change any result
        tb_zero <= '1';

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        -- Aluop - 10 -
        tb_instruction_i <= "XXXX" & x"FFF" & "XXXX" & x"F" & "X0110011";
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_instruction_i <= "XXXX" & x"FFF" & "XXXX" & x"F" & "X1100011";
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------

        assert (false) report "ALL TESTS PASSED" severity failure;
    end process;

end architecture RTL;