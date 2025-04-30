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
        reset_i : in std_logic;
        read_data_1_o : out std_logic_vector(W - 1 downto 0);
        read_data_2_o : out std_logic_vector(W - 1 downto 0)
    );
end entity Register_File;

architecture RTL of Register_File is
    signal decoder_5x32_sig_o : std_logic_vector(31 downto 0); -- Output signal for 5x32 decoder's output port
    type t_register_file_array is array (0 to 31) of std_logic_vector(W - 1 downto 0);
    signal register_files_sig_o : t_register_file_array; -- Output signal for register files' output port 
begin
    -- Instantiate decoder
    U_DECODER : entity work.Decoder_5to32(RTL)
        port map(
            input_i => write_address_3_i,
            output_o => decoder_5x32_sig_o
        );

    read_data_1_o <= register_files_sig_o(to_integer(unsigned(read_address_1_i)));
    read_data_2_o <= register_files_sig_o(to_integer(unsigned(read_address_2_i)));

    -- Generate 32 Register Files with Synchronous Reset with GENERATE feature of VHDL
    U_REG_GEN : for i in 0 to 31 generate
        U_REG : entity work.Register_Write_Enable (RTL)
            port map(
                clk => clk,
                reset_i => reset_i,
                write_enable_i => (write_enable_3_i and decoder_5x32_sig_o(i)),
                data_i => write_data_3_i,
                data_o => register_files_sig_o(i)
            );
    end generate;
    
end architecture RTL;