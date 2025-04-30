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
    P_COMBNATIONAL : process (input_i) is
        variable value_to_shift : std_logic_vector(31 downto 0);
    begin
        value_to_shift := x"00000001";
        output_o <= std_logic_vector(shift_left(
                                                unsigned(value_to_shift), -- Number to shift. convert number to binary representation like "00001111"
                                                to_integer(unsigned(input_i)) -- Shift amount. unsigned(input_i) gives a binary value like "00001111" 
                                                                              -- not a number like 5 or x"0005"
                                               )
                                    );
    end process;
end architecture RTL;