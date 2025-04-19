----------------------------------------------------------------------------------
-- Engineer: Mehmet Arslan
-- 
-- Create Date: 19/17/2025 10:46:30 PM
-- Design Name: Mux_4to1 Module
-- Module Name: Mux_4to1 - Behavioral
-- Project Name: Mux_4to1 Module
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

ENTITY Mux_4to1 IS
    GENERIC (
        W : INTEGER RANGE 1 TO 64 := 8
    );
    PORT (
        select_i : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
        input0_i : IN STD_LOGIC_VECTOR(W - 1 DOWNTO 0);
        input1_i : IN STD_LOGIC_VECTOR(W - 1 DOWNTO 0);
        input2_i : IN STD_LOGIC_VECTOR(W - 1 DOWNTO 0);
        input3_i : IN STD_LOGIC_VECTOR(W - 1 DOWNTO 0);
        output_o : OUT STD_LOGIC_VECTOR(W - 1 DOWNTO 0)
    );
END ENTITY Mux_4to1;

ARCHITECTURE RTL OF Mux_4to1 IS
BEGIN

    P_COMBINATIONAL : PROCESS (select_i, input0_i, input1_i, input2_i, input3_i) BEGIN

        CASE (select_i) IS
            WHEN "00" =>
                output_o <= input0_i;
            WHEN "01" =>
                output_o <= input1_i;
            WHEN "10" =>
                output_o <= input2_i;
            WHEN "11" =>
                output_o <= input3_i;
            WHEN OTHERS =>
                output_o <= (OTHERS => '0');
        END CASE;

    END PROCESS;

END ARCHITECTURE RTL;