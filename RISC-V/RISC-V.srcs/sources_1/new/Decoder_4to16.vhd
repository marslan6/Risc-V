----------------------------------------------------------------------------------
-- Engineer: Mehmet Arslan
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity Decoder_4to16 is
    port (
        input_i : in std_logic_vector(3 downto 0);
        output_o : out std_logic_vector(15 downto 0)
    );
end entity Decoder_4to16;

architecture RTL of Decoder_4to16 is
begin

    P_COMBINATIONAL : process (input_i)
    begin
        case (input_i) is
            when x"0" =>
                output_o <= x"0001";
            when x"1" =>
                output_o <= x"0002";
            when x"2" =>
                output_o <= x"0004";
            when x"3" =>
                output_o <= x"0008";
            when x"4" =>
                output_o <= x"0010";
            when x"5" =>
                output_o <= x"0020";
            when x"6" =>
                output_o <= x"0040";
            when x"7" =>
                output_o <= x"0080";
            when x"8" =>
                output_o <= x"0100";
            when x"9" =>
                output_o <= x"0200";
            when x"A" =>
                output_o <= x"0400";
            when x"B" =>
                output_o <= x"0800";
            when x"C" =>
                output_o <= x"1000";
            when x"D" =>
                output_o <= x"2000";
            when x"E" =>
                output_o <= x"4000";
            when x"F" =>
                output_o <= x"8000";
            when others =>
                output_o <= x"0000";
        end case;
    end process;

end architecture RTL;