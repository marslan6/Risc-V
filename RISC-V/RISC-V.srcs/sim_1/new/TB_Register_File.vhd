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
        tb_write_address_3_i <= (others => '0');
        tb_write_data_3_i <= (others => '0');
        tb_write_enable_3_i <= '0';
        tb_reset_i <= '1';
        wait until rising_edge(tb_clk);
        wait for 1 ns;
        tb_read_address_1_i <= (others => '0');
        tb_read_address_2_i <= (others => '0');
        wait for 1 ns;
        assert (tb_read_data_1_o = x"00000000") report "TEST : 0 [FAILED]" severity warning;
        assert (tb_read_data_2_o = x"00000000") report "TEST : 1 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ---------------------- RESET TEST SCENARIO -----------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        wait for 13 ns;
        tb_read_address_1_i <= std_logic_vector(to_unsigned(1, 5));
        tb_read_address_2_i <= std_logic_vector(to_unsigned(2, 5));
        wait for 1 ns;
        assert (tb_read_data_1_o = x"00000000") report "TEST : 1.1 [FAILED]" severity warning;
        assert (tb_read_data_2_o = x"00000000") report "TEST : 1.2 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        wait for 13 ns;
        tb_read_address_1_i <= std_logic_vector(to_unsigned(3, 5));
        tb_read_address_2_i <= std_logic_vector(to_unsigned(4, 5));
        wait for 1 ns;
        assert (tb_read_data_1_o = x"00000000") report "TEST : 1.3 [FAILED]" severity warning;
        assert (tb_read_data_2_o = x"00000000") report "TEST : 1.4 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        wait for 13 ns;
        tb_read_address_1_i <= std_logic_vector(to_unsigned(5, 5));
        tb_read_address_2_i <= std_logic_vector(to_unsigned(6, 5));
        wait for 1 ns;
        assert (tb_read_data_1_o = x"00000000") report "TEST : 1.5 [FAILED]" severity warning;
        assert (tb_read_data_2_o = x"00000000") report "TEST : 1.6 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        wait for 13 ns;
        tb_read_address_1_i <= std_logic_vector(to_unsigned(7, 5));
        tb_read_address_2_i <= std_logic_vector(to_unsigned(8, 5));
        wait for 1 ns;
        assert (tb_read_data_1_o = x"00000000") report "TEST : 1.7 [FAILED]" severity warning;
        assert (tb_read_data_2_o = x"00000000") report "TEST : 1.8 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        wait for 13 ns;
        tb_read_address_1_i <= std_logic_vector(to_unsigned(9, 5));
        tb_read_address_2_i <= std_logic_vector(to_unsigned(10, 5));
        wait for 1 ns;
        assert (tb_read_data_1_o = x"00000000") report "TEST : 1.9 [FAILED]" severity warning;
        assert (tb_read_data_2_o = x"00000000") report "TEST : 1.10 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        wait for 13 ns;
        tb_read_address_1_i <= std_logic_vector(to_unsigned(11, 5));
        tb_read_address_2_i <= std_logic_vector(to_unsigned(12, 5));
        wait for 1 ns;
        assert (tb_read_data_1_o = x"00000000") report "TEST : 1.11 [FAILED]" severity warning;
        assert (tb_read_data_2_o = x"00000000") report "TEST : 1.12 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        wait for 13 ns;
        tb_read_address_1_i <= std_logic_vector(to_unsigned(13, 5));
        tb_read_address_2_i <= std_logic_vector(to_unsigned(14, 5));
        wait for 1 ns;
        assert (tb_read_data_1_o = x"00000000") report "TEST : 1.13 [FAILED]" severity warning;
        assert (tb_read_data_2_o = x"00000000") report "TEST : 1.14 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        wait for 13 ns;
        tb_read_address_1_i <= std_logic_vector(to_unsigned(15, 5));
        tb_read_address_2_i <= std_logic_vector(to_unsigned(16, 5));
        wait for 1 ns;
        assert (tb_read_data_1_o = x"00000000") report "TEST : 1.15 [FAILED]" severity warning;
        assert (tb_read_data_2_o = x"00000000") report "TEST : 1.16 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        -------------------- RESET TEST SCENARIO END ---------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        wait for 14 ns;
        tb_write_address_3_i <= std_logic_vector(to_unsigned(0, 5)); -- Write to REG0
        tb_write_data_3_i <= x"11111111";
        tb_write_enable_3_i <= '1';
        tb_reset_i <= '0';
        wait until rising_edge(tb_clk);
        wait for 1 ns;
        tb_read_address_1_i <= (others => '0');
        tb_read_address_2_i <= (others => '0');
        wait for 1 ns;
        assert (tb_read_data_1_o = x"11111111") report "TEST : 2 [FAILED]" severity warning;
        assert (tb_read_data_2_o = x"11111111") report "TEST : 3 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        wait for 14 ns;
        tb_write_address_3_i <= std_logic_vector(to_unsigned(1, 5)); -- Write to REG1
        tb_write_data_3_i <= x"22222222";
        wait until rising_edge(tb_clk);
        wait for 1 ns;
        tb_read_address_1_i <= "00000";
        tb_read_address_2_i <= "00001";
        wait for 1 ns;
        assert (tb_read_data_1_o = x"11111111") report "TEST : 4 [FAILED]" severity warning;
        assert (tb_read_data_2_o = x"22222222") report "TEST : 5 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        wait for 14 ns;
        tb_write_address_3_i <= std_logic_vector(to_unsigned(2, 5)); -- Write to REG2
        tb_write_data_3_i <= x"33333333";
        wait until rising_edge(tb_clk);
        wait for 1 ns;
        tb_read_address_1_i <= "00001";
        tb_read_address_2_i <= "00010";
        wait for 1 ns;
        assert (tb_read_data_1_o = x"22222222") report "TEST : 6 [FAILED]" severity warning;
        assert (tb_read_data_2_o = x"33333333") report "TEST : 7 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        wait for 14 ns;
        tb_write_address_3_i <= std_logic_vector(to_unsigned(3, 5)); -- Write to REG3
        tb_write_data_3_i <= x"44444444";
        wait until rising_edge(tb_clk);
        wait for 1 ns;
        tb_read_address_1_i <= "00010";
        tb_read_address_2_i <= "00011";
        wait for 1 ns;
        assert (tb_read_data_1_o = x"33333333") report "TEST : 8 [FAILED]" severity warning;
        assert (tb_read_data_2_o = x"44444444") report "TEST : 9 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        wait for 14 ns;
        tb_write_address_3_i <= std_logic_vector(to_unsigned(4, 5)); -- Write to REG4
        tb_write_data_3_i <= x"55555555";
        wait until rising_edge(tb_clk);
        wait for 1 ns;
        tb_read_address_1_i <= "00011";
        tb_read_address_2_i <= "00100";
        wait for 1 ns;
        assert (tb_read_data_1_o = x"44444444") report "TEST : 10 [FAILED]" severity warning;
        assert (tb_read_data_2_o = x"55555555") report "TEST : 11 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        wait for 14 ns;
        tb_write_address_3_i <= std_logic_vector(to_unsigned(5, 5)); -- Write to REG5
        tb_write_data_3_i <= x"66666666";
        wait until rising_edge(tb_clk);
        wait for 1 ns;
        tb_read_address_1_i <= "00100";
        tb_read_address_2_i <= "00101";
        wait for 1 ns;
        assert (tb_read_data_1_o = x"55555555") report "TEST : 12 [FAILED]" severity warning;
        assert (tb_read_data_2_o = x"66666666") report "TEST : 13 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        wait for 14 ns;
        tb_write_address_3_i <= std_logic_vector(to_unsigned(6, 5)); -- Write to REG6
        tb_write_data_3_i <= x"77777777";
        wait until rising_edge(tb_clk);
        wait for 1 ns;
        tb_read_address_1_i <= "00101";
        tb_read_address_2_i <= "00110";
        wait for 1 ns;
        assert (tb_read_data_1_o = x"66666666") report "TEST : 14 [FAILED]" severity warning;
        assert (tb_read_data_2_o = x"77777777") report "TEST : 15 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        wait for 14 ns;
        tb_write_address_3_i <= std_logic_vector(to_unsigned(7, 5)); -- Write to REG7
        tb_write_data_3_i <= x"88888888";
        wait until rising_edge(tb_clk);
        wait for 1 ns;
        tb_read_address_1_i <= "00110";
        tb_read_address_2_i <= "00111";
        wait for 1 ns;
        assert (tb_read_data_1_o = x"77777777") report "TEST : 16 [FAILED]" severity warning;
        assert (tb_read_data_2_o = x"88888888") report "TEST : 17 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        wait for 14 ns;
        tb_write_address_3_i <= std_logic_vector(to_unsigned(8, 5)); -- Write to REG8
        tb_write_data_3_i <= x"99999999";
        wait until rising_edge(tb_clk);
        wait for 1 ns;
        tb_read_address_1_i <= "00111";
        tb_read_address_2_i <= "01000";
        wait for 1 ns;
        assert (tb_read_data_1_o = x"88888888") report "TEST : 18 [FAILED]" severity warning;
        assert (tb_read_data_2_o = x"99999999") report "TEST : 19 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        wait for 14 ns;
        tb_write_address_3_i <= std_logic_vector(to_unsigned(9, 5)); -- Write to REG9
        tb_write_data_3_i <= x"10101010";
        wait until rising_edge(tb_clk);
        wait for 1 ns;
        tb_read_address_1_i <= "01000";
        tb_read_address_2_i <= "01001";
        wait for 1 ns;
        assert (tb_read_data_1_o = x"99999999") report "TEST : 20 [FAILED]" severity warning;
        assert (tb_read_data_2_o = x"10101010") report "TEST : 21 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        wait for 14 ns;
        tb_write_address_3_i <= std_logic_vector(to_unsigned(10, 5)); -- Write to REG10
        tb_write_data_3_i <= x"11111111";
        wait until rising_edge(tb_clk);
        wait for 1 ns;
        tb_read_address_1_i <= "01001";
        tb_read_address_2_i <= "01010";
        wait for 1 ns;
        assert (tb_read_data_1_o = x"10101010") report "TEST : 22 [FAILED]" severity warning;
        assert (tb_read_data_2_o = x"11111111") report "TEST : 23 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        wait for 14 ns;
        tb_write_address_3_i <= std_logic_vector(to_unsigned(11, 5)); -- Write to REG11
        tb_write_data_3_i <= x"12121212";
        wait until rising_edge(tb_clk);
        wait for 1 ns;
        tb_read_address_1_i <= "01010";
        tb_read_address_2_i <= "01011";
        wait for 1 ns;
        assert (tb_read_data_1_o = x"11111111") report "TEST : 24 [FAILED]" severity warning;
        assert (tb_read_data_2_o = x"12121212") report "TEST : 25 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        wait for 14 ns;
        tb_write_address_3_i <= std_logic_vector(to_unsigned(12, 5)); -- Write to REG12
        tb_write_data_3_i <= x"13131313";
        wait until rising_edge(tb_clk);
        wait for 1 ns;
        tb_read_address_1_i <= "01011";
        tb_read_address_2_i <= "01100";
        wait for 1 ns;
        assert (tb_read_data_1_o = x"12121212") report "TEST : 26 [FAILED]" severity warning;
        assert (tb_read_data_2_o = x"13131313") report "TEST : 27 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        wait for 14 ns;
        tb_write_address_3_i <= std_logic_vector(to_unsigned(13, 5)); -- Write to REG13
        tb_write_data_3_i <= x"14141414";
        wait until rising_edge(tb_clk);
        wait for 1 ns;
        tb_read_address_1_i <= "01100";
        tb_read_address_2_i <= "01101";
        wait for 1 ns;
        assert (tb_read_data_1_o = x"13131313") report "TEST : 28 [FAILED]" severity warning;
        assert (tb_read_data_2_o = x"14141414") report "TEST : 29 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        wait for 14 ns;
        tb_write_address_3_i <= std_logic_vector(to_unsigned(14, 5)); -- Write to REG14
        tb_write_data_3_i <= x"15151515";
        wait until rising_edge(tb_clk);
        wait for 1 ns;
        tb_read_address_1_i <= "01101";
        tb_read_address_2_i <= "01110";
        wait for 1 ns;
        assert (tb_read_data_1_o = x"14141414") report "TEST : 30 [FAILED]" severity warning;
        assert (tb_read_data_2_o = x"15151515") report "TEST : 31 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        wait for 14 ns;
        tb_write_address_3_i <= std_logic_vector(to_unsigned(15, 5)); -- Write to REG15
        tb_write_data_3_i <= x"16161616";
        wait until rising_edge(tb_clk);
        wait for 1 ns;
        tb_read_address_1_i <= "01110";
        tb_read_address_2_i <= "01111";
        wait for 1 ns;
        assert (tb_read_data_1_o = x"15151515") report "TEST : 32 [FAILED]" severity warning;
        assert (tb_read_data_2_o = x"16161616") report "TEST : 33 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        wait for 14 ns;
        tb_write_address_3_i <= std_logic_vector(to_unsigned(16, 5)); -- Write to REG16
        tb_write_data_3_i <= x"17171717";
        wait until rising_edge(tb_clk);
        wait for 1 ns;
        tb_read_address_1_i <= "01111";
        tb_read_address_2_i <= "10000";
        wait for 1 ns;
        assert (tb_read_data_1_o = x"16161616") report "TEST : 34 [FAILED]" severity warning;
        assert (tb_read_data_2_o = x"17171717") report "TEST : 35 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        wait for 14 ns;
        tb_write_address_3_i <= std_logic_vector(to_unsigned(17, 5)); -- Write to REG17
        tb_write_data_3_i <= x"18181818";
        wait until rising_edge(tb_clk);
        wait for 1 ns;
        tb_read_address_1_i <= "10000";
        tb_read_address_2_i <= "10001";
        wait for 1 ns;
        assert (tb_read_data_1_o = x"17171717") report "TEST : 36 [FAILED]" severity warning;
        assert (tb_read_data_2_o = x"18181818") report "TEST : 37 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        wait for 14 ns;
        tb_write_address_3_i <= std_logic_vector(to_unsigned(18, 5)); -- Write to REG18
        tb_write_data_3_i <= x"19191919";
        wait until rising_edge(tb_clk);
        wait for 1 ns;
        tb_read_address_1_i <= "10001";
        tb_read_address_2_i <= "10010";
        wait for 1 ns;
        assert (tb_read_data_1_o = x"18181818") report "TEST : 38 [FAILED]" severity warning;
        assert (tb_read_data_2_o = x"19191919") report "TEST : 39 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        wait for 14 ns;
        tb_write_address_3_i <= std_logic_vector(to_unsigned(19, 5));
        tb_write_data_3_i <= x"20202020";
        wait until rising_edge(tb_clk);
        wait for 1 ns;
        tb_read_address_1_i <= "10010";
        tb_read_address_2_i <= "10011";
        wait for 1 ns;
        assert (tb_read_data_1_o = x"19191919") report "TEST : 40 [FAILED]" severity warning;
        assert (tb_read_data_2_o = x"20202020") report "TEST : 41 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        wait for 14 ns;
        tb_write_address_3_i <= std_logic_vector(to_unsigned(20, 5));
        tb_write_data_3_i <= x"21212121";
        wait until rising_edge(tb_clk);
        wait for 1 ns;
        tb_read_address_1_i <= "10011";
        tb_read_address_2_i <= "10100";
        wait for 1 ns;
        assert (tb_read_data_1_o = x"20202020") report "TEST : 42 [FAILED]" severity warning;
        assert (tb_read_data_2_o = x"21212121") report "TEST : 43 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        wait for 14 ns;
        tb_write_address_3_i <= std_logic_vector(to_unsigned(21, 5));
        tb_write_data_3_i <= x"22222222";
        wait until rising_edge(tb_clk);
        wait for 1 ns;
        tb_read_address_1_i <= "10100";
        tb_read_address_2_i <= "10101";
        wait for 1 ns;
        assert (tb_read_data_1_o = x"21212121") report "TEST : 44 [FAILED]" severity warning;
        assert (tb_read_data_2_o = x"22222222") report "TEST : 45 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        wait for 14 ns;
        tb_write_address_3_i <= std_logic_vector(to_unsigned(22, 5));
        tb_write_data_3_i <= x"23232323";
        wait until rising_edge(tb_clk);
        wait for 1 ns;
        tb_read_address_1_i <= "10101";
        tb_read_address_2_i <= "10110";
        wait for 1 ns;
        assert (tb_read_data_1_o = x"22222222") report "TEST : 46 [FAILED]" severity warning;
        assert (tb_read_data_2_o = x"23232323") report "TEST : 47 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        wait for 14 ns;
        tb_write_address_3_i <= std_logic_vector(to_unsigned(23, 5));
        tb_write_data_3_i <= x"24242424";
        wait until rising_edge(tb_clk);
        wait for 1 ns;
        tb_read_address_1_i <= "10110";
        tb_read_address_2_i <= "10111";
        wait for 1 ns;
        assert (tb_read_data_1_o = x"23232323") report "TEST : 48 [FAILED]" severity warning;
        assert (tb_read_data_2_o = x"24242424") report "TEST : 49 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        wait for 14 ns;
        tb_write_address_3_i <= std_logic_vector(to_unsigned(24, 5));
        tb_write_data_3_i <= x"25252525";
        wait until rising_edge(tb_clk);
        wait for 1 ns;
        tb_read_address_1_i <= "10111";
        tb_read_address_2_i <= "11000";
        wait for 1 ns;
        assert (tb_read_data_1_o = x"24242424") report "TEST : 50 [FAILED]" severity warning;
        assert (tb_read_data_2_o = x"25252525") report "TEST : 51 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        wait for 14 ns;
        tb_write_address_3_i <= std_logic_vector(to_unsigned(25, 5));
        tb_write_data_3_i <= x"26262626";
        wait until rising_edge(tb_clk);
        wait for 1 ns;
        tb_read_address_1_i <= "11000";
        tb_read_address_2_i <= "11001";
        wait for 1 ns;
        assert (tb_read_data_1_o = x"25252525") report "TEST : 52 [FAILED]" severity warning;
        assert (tb_read_data_2_o = x"26262626") report "TEST : 53 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        wait for 14 ns;
        tb_write_address_3_i <= std_logic_vector(to_unsigned(26, 5));
        tb_write_data_3_i <= x"27272727";
        wait until rising_edge(tb_clk);
        wait for 1 ns;
        tb_read_address_1_i <= "11001";
        tb_read_address_2_i <= "11010";
        wait for 1 ns;
        assert (tb_read_data_1_o = x"26262626") report "TEST : 54 [FAILED]" severity warning;
        assert (tb_read_data_2_o = x"27272727") report "TEST : 55 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        wait for 14 ns;
        tb_write_address_3_i <= std_logic_vector(to_unsigned(27, 5));
        tb_write_data_3_i <= x"28282828";
        wait until rising_edge(tb_clk);
        wait for 1 ns;
        tb_read_address_1_i <= "11010";
        tb_read_address_2_i <= "11011";
        wait for 1 ns;
        assert (tb_read_data_1_o = x"27272727") report "TEST : 56 [FAILED]" severity warning;
        assert (tb_read_data_2_o = x"28282828") report "TEST : 57 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        wait for 14 ns;
        tb_write_address_3_i <= std_logic_vector(to_unsigned(28, 5));
        tb_write_data_3_i <= x"29292929";
        wait until rising_edge(tb_clk);
        wait for 1 ns;
        tb_read_address_1_i <= "11011";
        tb_read_address_2_i <= "11100";
        wait for 1 ns;
        assert (tb_read_data_1_o = x"28282828") report "TEST : 58 [FAILED]" severity warning;
        assert (tb_read_data_2_o = x"29292929") report "TEST : 59 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        wait for 14 ns;
        tb_write_address_3_i <= std_logic_vector(to_unsigned(29, 5));
        tb_write_data_3_i <= x"30303030";
        wait until rising_edge(tb_clk);
        wait for 1 ns;
        tb_read_address_1_i <= "11100";
        tb_read_address_2_i <= "11101";
        wait for 1 ns;
        assert (tb_read_data_1_o = x"29292929") report "TEST : 60 [FAILED]" severity warning;
        assert (tb_read_data_2_o = x"30303030") report "TEST : 61 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        wait for 14 ns;
        tb_write_address_3_i <= std_logic_vector(to_unsigned(30, 5));
        tb_write_data_3_i <= x"31313131";
        wait until rising_edge(tb_clk);
        wait for 1 ns;
        tb_read_address_1_i <= "11101";
        tb_read_address_2_i <= "11110";
        wait for 1 ns;
        assert (tb_read_data_1_o = x"30303030") report "TEST : 62 [FAILED]" severity warning;
        assert (tb_read_data_2_o = x"31313131") report "TEST : 63 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        wait for 14 ns;
        tb_write_address_3_i <= std_logic_vector(to_unsigned(31, 5)); -- Write to REG31
        tb_write_data_3_i <= x"32323232";
        wait until rising_edge(tb_clk);
        wait for 1 ns;
        tb_read_address_1_i <= "11110";
        tb_read_address_2_i <= "11111";
        wait for 1 ns;
        assert (tb_read_data_1_o = x"31313131") report "TEST : 64 [FAILED]" severity warning;
        assert (tb_read_data_2_o = x"32323232") report "TEST : 65 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        wait for 14 ns;
        tb_read_address_1_i <= "11001";
        tb_read_address_2_i <= "11010";
        wait for 1 ns;
        assert (tb_read_data_1_o = x"26262626") report "TEST : 66 [FAILED]" severity warning;
        assert (tb_read_data_2_o = x"27272727") report "TEST : 67 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        wait for 14 ns;
        tb_read_address_1_i <= "10000";
        tb_read_address_2_i <= "10001";
        wait for 1 ns;
        assert (tb_read_data_1_o = x"17171717") report "TEST : 68 [FAILED]" severity warning;
        assert (tb_read_data_2_o = x"18181818") report "TEST : 69 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        wait for 14 ns;
        tb_reset_i <= '1';
        wait until rising_edge(tb_clk);
        wait for 1 ns;
        assert (tb_read_data_1_o = x"00000000") report "TEST : 66 [FAILED]" severity warning;
        assert (tb_read_data_2_o = x"00000000") report "TEST : 67 [FAILED]" severity warning;

        ------------------------------------------------------------------
        ------------------------------------------------------------------
        ------------------------------------------------------------------
        assert (false) report "ALL TESTS PASSED" severity failure;
    end process;

end architecture RTL;