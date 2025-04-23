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

library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Mux_4to1 is
    generic (
        W : integer range 1 to 64 := 32
    );
    port (
        select_i : in std_logic_vector(1 downto 0);
        input0_i : in std_logic_vector(W - 1 downto 0);
        input1_i : in std_logic_vector(W - 1 downto 0);
        input2_i : in std_logic_vector(W - 1 downto 0);
        input3_i : in std_logic_vector(W - 1 downto 0);
        output_o : out std_logic_vector(W - 1 downto 0)
    );
end entity Mux_4to1;

architecture RTL of Mux_4to1 is
begin

    P_COMBINATIONAL : process (select_i, input0_i, input1_i, input2_i, input3_i)
    begin
        case (select_i) is
            when "00" =>
                output_o <= input0_i;
            when "01" =>
                output_o <= input1_i;
            when "10" =>
                output_o <= input2_i;
            when "11" =>
                output_o <= input3_i;
            when others =>
                output_o <= (others => '0');
        end case;
    end process;

end architecture RTL;