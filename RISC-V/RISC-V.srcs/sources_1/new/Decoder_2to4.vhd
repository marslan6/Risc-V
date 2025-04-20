----------------------------------------------------------------------------------
-- Engineer: Mehmet Arslan
-- 
-- Create Date: 04/20/2025 09:38:35 PM
-- Design Name: Decoder_2to4 Module
-- Module Name: Decoder_2to4 - Behavioral
-- Project Name: Decoder_2to4 Module
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

ENTITY Decoder_2to4 IS
    PORT (
        input_i : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
        output_o : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
END ENTITY Decoder_2to4;

ARCHITECTURE RTL OF Decoder_2to4 IS
BEGIN

    P_COMBINATIONAL : PROCESS (input_i)
    BEGIN

        CASE (input_i) IS
            WHEN "00" =>
                output_o <= "0001";
            WHEN "01" =>
                output_o <= "0010";
            WHEN "10" =>
                output_o <= "0100";
            WHEN "11" =>
                output_o <= "1000";
            WHEN OTHERS =>
                output_o <= "0000";
        END CASE;

    END PROCESS;

END ARCHITECTURE RTL;