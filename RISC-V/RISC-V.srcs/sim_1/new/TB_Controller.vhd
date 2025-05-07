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

        wait for 10 ns;
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_instruction_i <= "XXXX" & x"FFF" & "XXXX" & x"F" & "X0100011";

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