----------------------------------------------------------------------------------
-- Engineer: Mehmet Arslan
-- 
-- Create Date: 04/20/2025 09:38:35 PM
-- Design Name: Decoder_4to16 Module
-- Module Name: Decoder_4to16 - Behavioral
-- Project Name: Decoder_4to16 Module
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

ENTITY Decoder_4to16 IS
    PORT (
        input_i : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        output_o : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
END ENTITY Decoder_4to16;

ARCHITECTURE RTL OF Decoder_4to16 IS
BEGIN

    P_COMBINATIONAL : PROCESS (input_i)
    BEGIN

        CASE (input_i) IS
            WHEN x"0" =>
                output_o <= x"0001";
            WHEN x"1" =>
                output_o <= x"0002";
            WHEN x"2" =>
                output_o <= x"0004";
            WHEN x"3" =>
                output_o <= x"0008";
            WHEN x"4" =>
                output_o <= x"0010";
            WHEN x"5" =>
                output_o <= x"0020";
            WHEN x"6" =>
                output_o <= x"0040";
            WHEN x"7" =>
                output_o <= x"0080";
            WHEN x"8" =>
                output_o <= x"0100";
            WHEN x"9" =>
                output_o <= x"0200";
            WHEN x"A" =>
                output_o <= x"0400";
            WHEN x"B" =>
                output_o <= x"0800";
            WHEN x"C" =>
                output_o <= x"1000";
            WHEN x"D" =>
                output_o <= x"2000";
            WHEN x"E" =>
                output_o <= x"4000";
            WHEN x"F" =>
                output_o <= x"8000";
            WHEN OTHERS =>
                output_o <= x"0000";
        END CASE;

    END PROCESS;

END ARCHITECTURE RTL;