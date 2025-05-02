----------------------------------------------------------------------------------
-- Engineer: Mehmet Arslan
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use STD.TEXTIO.ALL;

entity DRAM is
    generic (
        RAM_DEPTH : integer range 1 to 512 := 128;
        RAM_WIDTH : integer range 1 to 64 := 32;
        ADDR_WIDTH : integer range 1 to 9 := 7
    );
    port (
        clk             : in  std_logic;
        write_enable_i  : in  std_logic;
        address_i       : in  std_logic_vector(ADDR_WIDTH - 1 downto 0);
        data_in_i       : in  std_logic_vector(RAM_WIDTH - 1 downto 0);
        data_out_o      : out std_logic_vector(RAM_WIDTH - 1 downto 0)
    );
end entity DRAM;

architecture RTL of DRAM is

    -- RAM type declaration
    type t_distributed_ram is array (0 to RAM_DEPTH - 1) of bit_vector(RAM_WIDTH - 1 downto 0);

    -- Initialize memory content from external file
    impure function fill_ram_from_file(ram_file_name : in string) return t_distributed_ram is
        file ram_file : text is in ram_file_name;
        variable ram_file_line : line;
        variable RAM : t_distributed_ram;
    begin
        for i in RAM'range loop
            readline(ram_file, ram_file_line);
            read(ram_file_line, RAM(i));
        end loop;
        return RAM;
    end function;

    -- RAM instance initialized from external file
    signal RAM : t_distributed_ram := fill_ram_from_file("rams_init_file.mem");

begin
    
    data_out_o <= to_stdlogicvector(RAM(to_integer(unsigned(address_i))));

    -- Sequential write and read
    process(clk)
    begin
        if rising_edge(clk) then
            if write_enable_i = '1' then
                RAM(to_integer(unsigned(address_i))) <= to_bitvector(data_in_i);
            end if;
        end if;
    end process;

end architecture RTL;