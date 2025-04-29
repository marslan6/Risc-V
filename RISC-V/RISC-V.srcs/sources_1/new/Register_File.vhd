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
    signal decoded_write_enable_32_regs : std_logic_vector(31 downto 0);
    signal register_file_out0_i, register_file_out1_i, register_file_out2_i, register_file_out3_i,
            register_file_out4_i, register_file_out5_i, register_file_out6_i, register_file_out7_i, register_file_out8_i,
            register_file_out9_i, register_file_out10_i, register_file_out11_i, register_file_out12_i, register_file_out13_i,
            register_file_out14_i, register_file_out15_i, register_file_out16_i, register_file_out17_i, register_file_out18_i,
            register_file_out19_i, register_file_out20_i, register_file_out21_i, register_file_out22_i, register_file_out23_i,
            register_file_out24_i, register_file_out25_i, register_file_out26_i, register_file_out27_i, register_file_out28_i,
            register_file_out29_i, register_file_out30_i, register_file_out31_i : std_logic_vector(W - 1 downto 0);

begin

    -- Instantiate decoder
    U_DECODER : entity work.Decoder_5to32(RTL)
        port map(
            input_i => write_address_3_i,
            output_o => decoded_write_enable_32_regs
        );

    -- Instantiate 32x1 MUX for Read 1 Output
    U_MUX_32X1_ADDR_1 : entity work.Mux_32to1 (RTL)
        port map(
            select_i => read_address_1_i,
            input0_i => register_file_out0_i,
            input1_i => register_file_out1_i,
            input2_i => register_file_out2_i,
            input3_i => register_file_out3_i,
            input4_i => register_file_out4_i,
            input5_i => register_file_out5_i,
            input6_i => register_file_out6_i,
            input7_i => register_file_out7_i,
            input8_i => register_file_out8_i,
            input9_i => register_file_out9_i,
            input10_i => register_file_out10_i,
            input11_i => register_file_out11_i,
            input12_i => register_file_out12_i,
            input13_i => register_file_out13_i,
            input14_i => register_file_out14_i,
            input15_i => register_file_out15_i,
            input16_i => register_file_out16_i,
            input17_i => register_file_out17_i,
            input18_i => register_file_out18_i,
            input19_i => register_file_out19_i,
            input20_i => register_file_out20_i,
            input21_i => register_file_out21_i,
            input22_i => register_file_out22_i,
            input23_i => register_file_out23_i,
            input24_i => register_file_out24_i,
            input25_i => register_file_out25_i,
            input26_i => register_file_out26_i,
            input27_i => register_file_out27_i,
            input28_i => register_file_out28_i,
            input29_i => register_file_out29_i,
            input30_i => register_file_out30_i,
            input31_i => register_file_out31_i,
            output_o => read_data_1_o
        );

    -- Instantiate 32x1 MUX for Read 2 Output
    U_MUX_32X1_ADDR_2 : entity work.Mux_32to1 (RTL)
        port map(
            select_i => read_address_2_i,
            input0_i => register_file_out0_i,
            input1_i => register_file_out1_i,
            input2_i => register_file_out2_i,
            input3_i => register_file_out3_i,
            input4_i => register_file_out4_i,
            input5_i => register_file_out5_i,
            input6_i => register_file_out6_i,
            input7_i => register_file_out7_i,
            input8_i => register_file_out8_i,
            input9_i => register_file_out9_i,
            input10_i => register_file_out10_i,
            input11_i => register_file_out11_i,
            input12_i => register_file_out12_i,
            input13_i => register_file_out13_i,
            input14_i => register_file_out14_i,
            input15_i => register_file_out15_i,
            input16_i => register_file_out16_i,
            input17_i => register_file_out17_i,
            input18_i => register_file_out18_i,
            input19_i => register_file_out19_i,
            input20_i => register_file_out20_i,
            input21_i => register_file_out21_i,
            input22_i => register_file_out22_i,
            input23_i => register_file_out23_i,
            input24_i => register_file_out24_i,
            input25_i => register_file_out25_i,
            input26_i => register_file_out26_i,
            input27_i => register_file_out27_i,
            input28_i => register_file_out28_i,
            input29_i => register_file_out29_i,
            input30_i => register_file_out30_i,
            input31_i => register_file_out31_i,
            output_o => read_data_2_o
        );

    U0_REG : entity work.Register_Write_Enable (RTL) port map (clk => clk, reset_i => reset_i, write_enable_i => (write_enable_3_i and decoded_write_enable_32_regs(0)), data_i => write_data_3_i, data_o => register_file_out0_i);
    U1_REG : entity work.Register_Write_Enable (RTL) port map (clk => clk, reset_i => reset_i, write_enable_i => (write_enable_3_i and decoded_write_enable_32_regs(1)), data_i => write_data_3_i, data_o => register_file_out1_i);
    U2_REG : entity work.Register_Write_Enable (RTL) port map (clk => clk, reset_i => reset_i, write_enable_i => (write_enable_3_i and decoded_write_enable_32_regs(2)), data_i => write_data_3_i, data_o => register_file_out2_i);
    U3_REG : entity work.Register_Write_Enable (RTL) port map (clk => clk, reset_i => reset_i, write_enable_i => (write_enable_3_i and decoded_write_enable_32_regs(3)), data_i => write_data_3_i, data_o => register_file_out3_i);
    U4_REG : entity work.Register_Write_Enable (RTL) port map (clk => clk, reset_i => reset_i, write_enable_i => (write_enable_3_i and decoded_write_enable_32_regs(4)), data_i => write_data_3_i, data_o => register_file_out4_i);
    U5_REG : entity work.Register_Write_Enable (RTL) port map (clk => clk, reset_i => reset_i, write_enable_i => (write_enable_3_i and decoded_write_enable_32_regs(5)), data_i => write_data_3_i, data_o => register_file_out5_i);
    U6_REG : entity work.Register_Write_Enable (RTL) port map (clk => clk, reset_i => reset_i, write_enable_i => (write_enable_3_i and decoded_write_enable_32_regs(6)), data_i => write_data_3_i, data_o => register_file_out6_i);
    U7_REG : entity work.Register_Write_Enable (RTL) port map (clk => clk, reset_i => reset_i, write_enable_i => (write_enable_3_i and decoded_write_enable_32_regs(7)), data_i => write_data_3_i, data_o => register_file_out7_i);
    U8_REG : entity work.Register_Write_Enable (RTL) port map (clk => clk, reset_i => reset_i, write_enable_i => (write_enable_3_i and decoded_write_enable_32_regs(8)), data_i => write_data_3_i, data_o => register_file_out8_i);
    U9_REG : entity work.Register_Write_Enable (RTL) port map (clk => clk, reset_i => reset_i, write_enable_i => (write_enable_3_i and decoded_write_enable_32_regs(9)), data_i => write_data_3_i, data_o => register_file_out9_i);
    U10_REG : entity work.Register_Write_Enable (RTL) port map (clk => clk, reset_i => reset_i, write_enable_i => (write_enable_3_i and decoded_write_enable_32_regs(10)), data_i => write_data_3_i, data_o => register_file_out10_i);
    U11_REG : entity work.Register_Write_Enable (RTL) port map (clk => clk, reset_i => reset_i, write_enable_i => (write_enable_3_i and decoded_write_enable_32_regs(11)), data_i => write_data_3_i, data_o => register_file_out11_i);
    U12_REG : entity work.Register_Write_Enable (RTL) port map (clk => clk, reset_i => reset_i, write_enable_i => (write_enable_3_i and decoded_write_enable_32_regs(12)), data_i => write_data_3_i, data_o => register_file_out12_i);
    U13_REG : entity work.Register_Write_Enable (RTL) port map (clk => clk, reset_i => reset_i, write_enable_i => (write_enable_3_i and decoded_write_enable_32_regs(13)), data_i => write_data_3_i, data_o => register_file_out13_i);
    U14_REG : entity work.Register_Write_Enable (RTL) port map (clk => clk, reset_i => reset_i, write_enable_i => (write_enable_3_i and decoded_write_enable_32_regs(14)), data_i => write_data_3_i, data_o => register_file_out14_i);
    U15_REG : entity work.Register_Write_Enable (RTL) port map (clk => clk, reset_i => reset_i, write_enable_i => (write_enable_3_i and decoded_write_enable_32_regs(15)), data_i => write_data_3_i, data_o => register_file_out15_i);
    U16_REG : entity work.Register_Write_Enable (RTL) port map (clk => clk, reset_i => reset_i, write_enable_i => (write_enable_3_i and decoded_write_enable_32_regs(16)), data_i => write_data_3_i, data_o => register_file_out16_i);
    U17_REG : entity work.Register_Write_Enable (RTL) port map (clk => clk, reset_i => reset_i, write_enable_i => (write_enable_3_i and decoded_write_enable_32_regs(17)), data_i => write_data_3_i, data_o => register_file_out17_i);
    U18_REG : entity work.Register_Write_Enable (RTL) port map (clk => clk, reset_i => reset_i, write_enable_i => (write_enable_3_i and decoded_write_enable_32_regs(18)), data_i => write_data_3_i, data_o => register_file_out18_i);
    U19_REG : entity work.Register_Write_Enable (RTL) port map (clk => clk, reset_i => reset_i, write_enable_i => (write_enable_3_i and decoded_write_enable_32_regs(19)), data_i => write_data_3_i, data_o => register_file_out19_i);
    U20_REG : entity work.Register_Write_Enable (RTL) port map (clk => clk, reset_i => reset_i, write_enable_i => (write_enable_3_i and decoded_write_enable_32_regs(20)), data_i => write_data_3_i, data_o => register_file_out20_i);
    U21_REG : entity work.Register_Write_Enable (RTL) port map (clk => clk, reset_i => reset_i, write_enable_i => (write_enable_3_i and decoded_write_enable_32_regs(21)), data_i => write_data_3_i, data_o => register_file_out21_i);
    U22_REG : entity work.Register_Write_Enable (RTL) port map (clk => clk, reset_i => reset_i, write_enable_i => (write_enable_3_i and decoded_write_enable_32_regs(22)), data_i => write_data_3_i, data_o => register_file_out22_i);
    U23_REG : entity work.Register_Write_Enable (RTL) port map (clk => clk, reset_i => reset_i, write_enable_i => (write_enable_3_i and decoded_write_enable_32_regs(23)), data_i => write_data_3_i, data_o => register_file_out23_i);
    U24_REG : entity work.Register_Write_Enable (RTL) port map (clk => clk, reset_i => reset_i, write_enable_i => (write_enable_3_i and decoded_write_enable_32_regs(24)), data_i => write_data_3_i, data_o => register_file_out24_i);
    U25_REG : entity work.Register_Write_Enable (RTL) port map (clk => clk, reset_i => reset_i, write_enable_i => (write_enable_3_i and decoded_write_enable_32_regs(25)), data_i => write_data_3_i, data_o => register_file_out25_i);
    U26_REG : entity work.Register_Write_Enable (RTL) port map (clk => clk, reset_i => reset_i, write_enable_i => (write_enable_3_i and decoded_write_enable_32_regs(26)), data_i => write_data_3_i, data_o => register_file_out26_i);
    U27_REG : entity work.Register_Write_Enable (RTL) port map (clk => clk, reset_i => reset_i, write_enable_i => (write_enable_3_i and decoded_write_enable_32_regs(27)), data_i => write_data_3_i, data_o => register_file_out27_i);
    U28_REG : entity work.Register_Write_Enable (RTL) port map (clk => clk, reset_i => reset_i, write_enable_i => (write_enable_3_i and decoded_write_enable_32_regs(28)), data_i => write_data_3_i, data_o => register_file_out28_i);
    U29_REG : entity work.Register_Write_Enable (RTL) port map (clk => clk, reset_i => reset_i, write_enable_i => (write_enable_3_i and decoded_write_enable_32_regs(29)), data_i => write_data_3_i, data_o => register_file_out29_i);
    U30_REG : entity work.Register_Write_Enable (RTL) port map (clk => clk, reset_i => reset_i, write_enable_i => (write_enable_3_i and decoded_write_enable_32_regs(30)), data_i => write_data_3_i, data_o => register_file_out30_i);
    U31_REG : entity work.Register_Write_Enable (RTL) port map (clk => clk, reset_i => reset_i, write_enable_i => (write_enable_3_i and decoded_write_enable_32_regs(31)), data_i => write_data_3_i, data_o => register_file_out31_i);
end architecture RTL;