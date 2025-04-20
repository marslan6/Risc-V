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
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

ENTITY TB_Decoder_2to4 IS
    --  Port ( );
END ENTITY TB_Decoder_2to4;

ARCHITECTURE RTL OF TB_Decoder_2to4 IS

    SIGNAL tb_input_i : STD_LOGIC_VECTOR(1 DOWNTO 0);
    SIGNAL tb_output_o : STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN

    DUT_DECODER2X4 : ENTITY WORK.Decoder_2to4(RTL)
        PORT MAP(
            input_i => tb_input_i,
            output_o => tb_output_o
        );

    P_COMBINATIONAL : PROCESS
    BEGIN
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_input_i <= "00";  
        WAIT FOR 2 ns;  
        ASSERT (tb_output_o = "0001") REPORT "TEST : 0 [FAILED]" SEVERITY warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_input_i <= "01";   
        WAIT FOR 2 ns;   
        ASSERT (tb_output_o = "0010") REPORT "TEST : 1 [FAILED]" SEVERITY warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_input_i <= "10"; 
        WAIT FOR 2 ns;     
        ASSERT (tb_output_o = "0100") REPORT "TEST : 2 [FAILED]" SEVERITY warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_input_i <= "11";  
        WAIT FOR 2 ns;    
        ASSERT (tb_output_o = "1000") REPORT "TEST : 3 [FAILED]" SEVERITY warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_input_i <= "01";
        WAIT FOR 2 ns;      
        ASSERT (tb_output_o = "0010") REPORT "TEST : 4 [FAILED]" SEVERITY warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ASSERT (false) REPORT "ALL TESTS PASSED" SEVERITY failure;

    END PROCESS;

END ARCHITECTURE RTL;