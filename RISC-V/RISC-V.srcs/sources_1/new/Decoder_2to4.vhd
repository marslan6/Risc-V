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

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Decoder_2to4 is
    port (
        input_i : in std_logic_vector(1 downto 0);
        output_o : out std_logic_vector(3 downto 0)
    );
end entity Decoder_2to4;

architecture RTL of Decoder_2to4 is
begin

    P_COMBINATIONAL : process (input_i)
    begin
        case (input_i) is
            when "00" =>
                output_o <= "0001";
            when "01" =>
                output_o <= "0010";
            when "10" =>
                output_o <= "0100";
            when "11" =>
                output_o <= "1000";
            when others =>
                output_o <= "0000";
        end case;
    end process;

end architecture RTL;