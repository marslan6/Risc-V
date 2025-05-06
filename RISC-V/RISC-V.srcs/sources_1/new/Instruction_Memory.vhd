----------------------------------------------------------------------------------
-- Engineer: Mehmet Arslan
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity Instruction_Memory is
    generic (
        RAM_DEPTH : integer range 1 to 512 := 128;
        RAM_WIDTH : integer range 1 to 64 := 32;
        ADDR_WIDTH : integer range 1 to 9 := 7;
        MEMORY_FILE : string := "instruction_mem_init_file.mem"
    );
    port (
        address_i : in std_logic_vector(ADDR_WIDTH - 1 downto 0);
        instruction_o : out std_logic_vector(RAM_WIDTH - 1 downto 0)
    );
end entity Instruction_Memory;

architecture RTL of Instruction_Memory is
begin

    U_DRAM : entity work.DRAM(RTL)
        generic map(
            RAM_DEPTH => RAM_DEPTH,
            RAM_WIDTH => RAM_WIDTH,
            ADDR_WIDTH => ADDR_WIDTH,
            MEMORY_FILE => MEMORY_FILE
        )
        port map(
            clk => '0',
            write_enable_i => '0',
            address_i => address_i,
            data_in_i => (others => '0'),
            data_out_o => instruction_o
        );

end architecture RTL;