----------------------------------------------------------------------------------
-- Engineer: Mehmet Arslan
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity Register_Write_Enable is
    generic (
        W : integer range 1 to 64 := 32
    );
    port (
        clk : in std_logic;
        reset_i : in std_logic;
        write_enable_i : std_logic;
        data_i : in std_logic_vector(W - 1 downto 0);
        data_o : out std_logic_vector(W - 1 downto 0)
    );
end entity Register_Write_Enable;

architecture RTL of Register_Write_Enable is
    signal data : std_logic_vector(W - 1 downto 0);
begin

    P_SEQUENTIAL : process (clk)
    begin
        if (rising_edge(clk)) then
            if (reset_i = '1') then
                data_o <= (others => '0');
            elsif (write_enable_i = '1') then 
                data_o <= data_i;
                data <= data_i;
            else
                data_o <= data;    
            end if;
        end if;
    end process;
    
end architecture RTL;