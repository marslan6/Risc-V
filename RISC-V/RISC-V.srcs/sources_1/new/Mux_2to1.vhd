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
library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Mux_2to1 is
	generic (
		W : integer range 1 to 64 := 32
	);
	port (
		sel_i : in std_logic;
		input0_i : in std_logic_vector(W - 1 downto 0);
		input1_i : in std_logic_vector(W - 1 downto 0);
		output0_o : out std_logic_vector(W - 1 downto 0)
	);
end entity;

architecture Rtl of Mux_2to1 is
begin

	P_COMBINATIONAL : process (sel_i, input0_i, input1_i)
	begin
		case (sel_i) is
			when '0' =>
				output0_o <= input0_i;
			when '1' =>
				output0_o <= input1_i;
			when others =>
				output0_o <= (others => '0');
		end case;
	end process;

end architecture;