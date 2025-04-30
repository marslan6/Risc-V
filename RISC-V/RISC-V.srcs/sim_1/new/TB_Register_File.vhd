library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity TB_Register_File is
    --  Port ( );
end entity TB_Register_File;

architecture RTL of TB_Register_File is
    constant tb_W : integer range 1 to 64 := 32;
    constant clock_period : time := 20 ns;
    signal tb_clk : std_logic;
    signal tb_read_address_1_i : std_logic_vector(4 downto 0);
    signal tb_read_address_2_i : std_logic_vector(4 downto 0);
    signal tb_write_address_3_i : std_logic_vector(4 downto 0);
    signal tb_write_data_3_i : std_logic_vector(tb_W - 1 downto 0);
    signal tb_write_enable_3_i : std_logic;
    signal tb_reset_i : std_logic;
    signal tb_read_data_1_o : std_logic_vector(tb_W - 1 downto 0);
    signal tb_read_data_2_o : std_logic_vector(tb_W - 1 downto 0);

begin
    U_REGISTER_FILE : entity work.Register_File(RTL)
        generic map(
            W => tb_W
        )
        port map(
            clk => tb_clk,
            read_address_1_i => tb_read_address_1_i,
            read_address_2_i => tb_read_address_2_i,
            write_address_3_i => tb_write_address_3_i,
            write_data_3_i => tb_write_data_3_i,
            write_enable_3_i => tb_write_enable_3_i,
            reset_i => tb_reset_i,
            read_data_1_o => tb_read_data_1_o,
            read_data_2_o => tb_read_data_2_o
        );

    P_CLK : process
    begin
        tb_clk <= '0';
        wait for 10 ns;
        tb_clk <= '1';
        wait for 10 ns;
    end process;

    P_SEQUENTIAL : process
    begin
        wait until rising_edge(tb_clk);
        wait for 15 ns;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        tb_read_address_1_i <= (others => '0');
        tb_read_address_2_i <= (others => '0');
        tb_write_address_3_i <= (others => '0');
        tb_write_data_3_i <= (others => '0');
        tb_write_enable_3_i <= '0';
        tb_reset_i <= '1';
        wait until rising_edge(tb_clk);
        wait for 1 ns;

        assert (tb_read_data_1_o = x"00000000") report "TEST : 0 [FAILED]" severity warning;
        assert (tb_read_data_2_o = x"00000000") report "TEST : 0 [FAILED]" severity warning;
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------



        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        assert (false) report "ALL TESTS PASSED" severity failure;
    end process;

end architecture RTL;