----------------------------------------------------------------------------------
-- Engineer: Mehmet Arslan
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity Adder is
    generic (
        W : integer range 1 to 64 := 32
    );
    port (
        input0_i : in std_logic_vector (W - 1 downto 0);
        input1_i : in std_logic_vector (W - 1 downto 0);
        output_o : out std_logic_vector (W - 1 downto 0)
    );
end entity Adder;

architecture RTL of Adder is
begin
    P_COMBINATIONAL : process (input0_i, input1_i)
    begin
        output_o <= std_logic_vector(unsigned(input0_i) + unsigned(input1_i));
    end process;
end architecture RTL;