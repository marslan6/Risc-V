----------------------------------------------------------------------------------
-- Engineer: Mehmet Arslan
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity Register_Simple is
    generic (
        W : integer range 1 to 64 := 32
    );
    port (
        clk : in std_logic;
        reset_i : in std_logic;
        data_i : in std_logic_vector(W - 1 downto 0);
        data_o : out std_logic_vector(W - 1 downto 0)
    );
end entity Register_Simple;

architecture RTL of Register_Simple is
begin

    P_SEQUENTIAL : process (clk)
    begin
        if (rising_edge(clk)) then
            if (reset_i = '1') then
                data_o <= (others => '0');
            else -- reset_i = '0'
                data_o <= data_i;
            end if;
        end if;
    end process;
    
end architecture RTL;