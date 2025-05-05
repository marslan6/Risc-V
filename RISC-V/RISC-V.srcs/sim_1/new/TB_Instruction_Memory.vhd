----------------------------------------------------------------------------------
-- Engineer: Mehmet Arslan
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity TB_Instruction_Memory is
    -- No ports in a testbench entity
end entity TB_Instruction_Memory;

architecture RTL of TB_Instruction_Memory is
    -- RAM parameters
    constant C_RAM_DEPTH : integer range 1 to 512 := 64;
    constant C_RAM_WIDTH : integer range 1 to 64 := 32;
    constant C_ADDR_WIDTH : integer range 1 to 9 := 6;

    -- Signal declarations for INSTRUCTION MEMORY I/O
    signal tb_address_i : std_logic_vector(C_ADDR_WIDTH - 1 downto 0);
    signal tb_instruction_o : std_logic_vector(C_RAM_WIDTH - 1 downto 0);
begin
    U_INSTRUCTION_MEMORY : entity work.Instruction_Memory(RTL)
        generic map(
            RAM_DEPTH => C_RAM_DEPTH,
            RAM_WIDTH => C_RAM_WIDTH,
            ADDR_WIDTH => C_ADDR_WIDTH
        )
        port map(
            address_i => tb_address_i,
            instruction_o => tb_instruction_o
        );

    DUT_TEST : process
    begin
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        wait for 15 ns;
        tb_address_i <= "00" & x"0";
        wait for 1 ns;
        assert (tb_instruction_o = x"FFFFFFFF") report "TEST : 0 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        wait for 5 ns;
        tb_address_i <= "00" & x"1";
        wait for 1 ns;
        assert (tb_instruction_o = x"EEEEEEEE") report "TEST : 1 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        wait for 5 ns;
        tb_address_i <= "00" & x"2";
        wait for 1 ns;
        assert (tb_instruction_o = x"DDDDDDDD") report "TEST : 2 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        wait for 5 ns;
        tb_address_i <= "00" & x"3";
        wait for 1 ns;
        assert (tb_instruction_o = x"ABCDEFAB") report "TEST : 3 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        wait for 5 ns;
        tb_address_i <= "00" & x"4";
        wait for 1 ns;
        assert (tb_instruction_o = x"11223344") report "TEST : 4 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        wait for 5 ns;
        tb_address_i <= "00" & x"5";
        wait for 1 ns;
        assert (tb_instruction_o = x"44332211") report "TEST : 5 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        assert (false) report "ALL TESTS PASSED" severity failure;

    end process;
end architecture RTL;