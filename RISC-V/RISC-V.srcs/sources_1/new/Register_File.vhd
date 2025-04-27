----------------------------------------------------------------------------------
-- Engineer: Mehmet Arslan
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity Register_File is
    generic (
        W : integer range 1 to 64 := 32
    );
    port (
        clk : in std_logic;
        read_address_1_i : in std_logic_vector(4 downto 0);
        read_address_2_i : in std_logic_vector(4 downto 0);
        write_address_3_i : in std_logic_vector(4 downto 0);
        write_data_3_i : in std_logic_vector(W - 1 downto 0);
        write_enable_3_i : in std_logic;
        read_data_1_o : out std_logic_vector(W - 1 downto 0);
        read_data_2_o : out std_logic_vector(W - 1 downto 0)
    );
end entity Register_File;

architecture RTL of Register_File is
begin

end architecture RTL;