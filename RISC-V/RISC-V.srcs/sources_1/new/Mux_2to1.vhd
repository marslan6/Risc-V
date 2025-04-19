----------------------------------------------------------------------------------
-- Engineer: Mehmet Arslan
-- 
-- Create Date: 04/17/2025 07:31:30 PM
-- Design Name: Mux_2to1 Module
-- Module Name: Mux_2to1 - Behavioral
-- Project Name: Mux_2to1 Module
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

ENTITY Mux_2to1 IS
	GENERIC (
		W : INTEGER RANGE 1 TO 64 := 8
	);
	PORT (
		sel_i : IN STD_LOGIC;
		input0_i : IN STD_LOGIC_VECTOR(W - 1 DOWNTO 0);
		input1_i : IN STD_LOGIC_VECTOR(W - 1 DOWNTO 0);
		output0_o : OUT STD_LOGIC_VECTOR(W - 1 DOWNTO 0)
	);
END ENTITY;

ARCHITECTURE Rtl OF Mux_2to1 IS
BEGIN

	P_COMBINATIONAL : PROCESS (sel_i, input0_i, input1_i)
	BEGIN

		CASE (sel_i) IS
			WHEN '0' =>
				output0_o <= input0_i;
			WHEN '1' =>
				output0_o <= input1_i;
			WHEN OTHERS =>
				output0_o <= (OTHERS => '0');
		END CASE;

	END PROCESS;

END ARCHITECTURE;