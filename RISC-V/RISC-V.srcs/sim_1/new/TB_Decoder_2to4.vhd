----------------------------------------------------------------------------------
-- Engineer: Mehmet Arslan
-- 
-- Create Date: 04/20/2025 10:19:07 PM
-- Design Name: Test Bench for TB_Decoder_2to4
-- Module Name: TB_Decoder_2to4 - Behavioral
-- Project Name: Test Bench for TB_Decoder_2to4
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

entity TB_Decoder_2to4 is
    --  Port ( );
end entity TB_Decoder_2to4;

architecture RTL of TB_Decoder_2to4 is
    signal tb_input_i : std_logic_vector(1 downto 0);
    signal tb_output_o : std_logic_vector(3 downto 0);
begin

    DUT_DECODER2X4 : entity WORK.Decoder_2to4(RTL)
        port map(
            input_i => tb_input_i,
            output_o => tb_output_o
        );

    P_COMBINATIONAL : process
    begin
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_input_i <= "00";
        wait for 2 ns;
        assert (tb_output_o = "0001") report "TEST : 0 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_input_i <= "01";
        wait for 2 ns;
        assert (tb_output_o = "0010") report "TEST : 1 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_input_i <= "10";
        wait for 2 ns;
        assert (tb_output_o = "0100") report "TEST : 2 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_input_i <= "11";
        wait for 2 ns;
        assert (tb_output_o = "1000") report "TEST : 3 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_input_i <= "01";
        wait for 2 ns;
        assert (tb_output_o = "0010") report "TEST : 4 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        assert (false) report "ALL TESTS PASSED" severity failure;
    end process;

end architecture RTL;