----------------------------------------------------------------------------------
-- Engineer: Mehmet Arslan
----------------------------------------------------------------------------------
library IEEE;
library STD;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use STD.TEXTIO.all;

entity DRAM is
    generic (
        RAM_DEPTH : integer range 1 to 512 := 128;
        RAM_WIDTH : integer range 1 to 64 := 32
    );
    port (
        clk : in std_logic;
        write_enable_i : in std_logic;
        address_i : in std_logic_vector(log2(RAM_DEPTH) - 1 downto 0);
        data_in_i : in std_logic_vector(RAM_WIDTH - 1 downto 0);
        data_out_o : out std_logic_vector(RAM_WIDTH - 1 downto 0)
    );
end entity DRAM;

architecture RTL of DRAM is
    -- Define log2 function inside architecture
    function log2(val : integer) return natural is
        variable result : natural := 0;
    begin
        for i in 0 to 31 loop
            if (val <= (2 ** i)) then
                result := i;
                exit;
            end if;
        end loop;
        return result;
    end function;

    -- RAM type declaration
    type t_distributed_ram is array (0 to RAM_DEPTH - 1) of std_logic_vector(RAM_WIDTH - 1 downto 0);

    -- Initialize memory content from a file
    impure function fill_ram_from_file(ram_file_name : in string) return t_distributed_ram is
        file ram_file : text is in ram_file_name;
        variable ram_file_line : line;
        variable RAM : t_distributed_ram;
    begin
        for i in 0 to (RAM_DEPTH - 1) loop
            readline(ram_file, ram_file_line);
            read(ram_file_line, RAM(i));
        end loop;
        return RAM;
    end function;

    -- RAM instance
    signal RAM : t_distributed_ram := fill_ram_from_file("rams_init_file.data");
    -- Resolved address input width
    constant ADDR_WIDTH : natural := log2(RAM_DEPTH);

begin
    -- Combinational read
    data_out_o <= RAM(to_integer(unsigned(address_i(ADDR_WIDTH - 1 downto 0))));

    -- Sequential write
    process (clk)
    begin
        if rising_edge(clk) then
            if (write_enable_i = '1') then
                RAM(to_integer(unsigned(address_i(ADDR_WIDTH - 1 downto 0)))) <= data_in_i;
            end if;
        end if;
    end process;

end architecture RTL;