----------------------------------------------------------------------------------
-- Engineer: Mehmet Arslan
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity Decoder_5to32 is
    port (
        input_i : in std_logic_vector(4 downto 0);
        output_o : out std_logic_vector(31 downto 0)
    );
end entity Decoder_5to32;

architecture RTL of Decoder_5to32 is
begin

    P_COMBINATIONAL : process (input_i)
    begin
        case (input_i) is
            when x"00" =>
                output_o <= x"00000001";
            when x"01" =>
                output_o <= x"00000002";
            when x"02" =>
                output_o <= x"00000004";
            when x"03" =>
                output_o <= x"00000008";
            when x"04" =>
                output_o <= x"00000010";
            when x"05" =>
                output_o <= x"00000020";
            when x"06" =>
                output_o <= x"00000040";
            when x"07" =>
                output_o <= x"00000080";
            when x"08" =>
                output_o <= x"00000100";
            when x"09" =>
                output_o <= x"00000200";
            when x"0A" =>
                output_o <= x"00000400";
            when x"0B" =>
                output_o <= x"00000800";
            when x"0C" =>
                output_o <= x"00001000";
            when x"0D" =>
                output_o <= x"00002000";
            when x"0E" =>
                output_o <= x"00004000";
            when x"0F" =>
                output_o <= x"00008000";
            when x"10" =>
                output_o <= x"00010000";
            when x"11" =>
                output_o <= x"00020000";
            when x"12" =>
                output_o <= x"00040000";
            when x"13" =>
                output_o <= x"00080000";
            when x"14" =>
                output_o <= x"00100000";
            when x"15" =>
                output_o <= x"00200000";
            when x"16" =>
                output_o <= x"00400000";
            when x"17" =>
                output_o <= x"00800000";
            when x"18" =>
                output_o <= x"01000000";
            when x"19" =>
                output_o <= x"02000000";
            when x"1A" =>
                output_o <= x"04000000";
            when x"1B" =>
                output_o <= x"08000000";
            when x"1C" =>
                output_o <= x"10000000";
            when x"1D" =>
                output_o <= x"20000000";
            when x"1E" =>
                output_o <= x"40000000";
            when x"1F" =>
                output_o <= x"80000000";
            when others =>
                output_o <= x"00000000";
        end case;
    end process;

end architecture RTL;