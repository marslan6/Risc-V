----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/15/2025 09:21:19 PM
-- Design Name: 
-- Module Name: Mux_2to1 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Mux_2to1 is
	generic 
	(
		-- Required for parametric design

		c_clk_frequency : integer := 100_000_000;
		c_sclk_frequency : integer := 100_000_000;
		c_i2c_frequency : integer := 400_000;
		c_bitnum : integer range 1 to 8;
		c_will_simulate : std_logic := '0';
		c_will_ring : boolean := false;
		c_config_regs: std_logic_vector(7 downto 0) := x"A7"
	);
	port 
	(
		-- Either std_logic or std_logic_vector is used as a in/out type
		-- Other types could be used but not suggested.
	  	input1_i : in std_logic_vector(c_bitnum-1 downto 0);
		input2_i : in std_logic;
		clk : in std_logic;
		output1_o : out std_logic; 	
		output2_o : out std_logic 
	);
end entity Mux_2to1;


architecture Behavioral of Mux_2to1 is
	-- (others => '0')
	constant c_constant1 : integer := 30;
	constant c_constant2 : std_logic_vector(c_bitnum-1 downto 0) := (others => '0');
	constant c_timer_1ms_slim : c_clk_frequency / 1000;

	type t_state is (S_START, S_OPERATION, S_TERMINATE, S_IDLE); -- enum type
	type r_uart_pars is record -- record type / structs in C
		param1 : std_logic;
		param2 : std_logic_vector(3 downto 0); 
	end record;

	signal s0 : std_logic_vector(c_bitnum-1 downto 0) := x"00";
	signal s1 : std_logic_vector(c_bitnum-1 downto 0) := x"00";
	signal s2 : integer range 0 to 255 := 0; -- 8 bit hardware used
	signal s3 : integer := 0; -- 32 bit hardware



begin





end Behavioral;
