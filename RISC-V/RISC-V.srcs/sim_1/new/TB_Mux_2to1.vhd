----------------------------------------------------------------------------------
-- Engineer: Mehmet Arslan
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity TB_Mux_2to1 is
    --  Port ( );
end entity TB_Mux_2to1;

architecture RTL of TB_Mux_2to1 is
    --component Mux_2to1 is
    --    generic 
    --    (
    --        W : integer range 1 to 64 := 8
    --    );
    --    port 
    --    (	
    --        sel_i : in std_logic;
    --        input0_i : in std_logic_vector(W-1 downto 0);
    --        input1_i : in std_logic_vector(W-1 downto 0);
    --        output0_o : out std_logic_vector(W-1 downto 0)
    --    );
    --end component;
    constant tb_W : integer range 1 to 64 := 8;
    signal tb_sel_i : std_logic;
    signal tb_input0_i : std_logic_vector(tb_W - 1 downto 0);
    signal tb_input1_i : std_logic_vector(tb_W - 1 downto 0);
    signal tb_output0_o : std_logic_vector(tb_W - 1 downto 0);
begin

    DUT_MUX2X1 : entity work.Mux_2to1(Rtl) -- Architecture name of imported component
        generic map
        (
            W => tb_W
        )
        port map
        (
            sel_i => tb_sel_i,
            input0_i => tb_input0_i,
            input1_i => tb_input1_i,
            output0_o => tb_output0_o
        );

    P_COMB : process
    begin
        tb_sel_i <= '0';
        tb_input0_i <= (others => '0');
        tb_input1_i <= (others => '0');
        wait for 10 ns;

        tb_input0_i <= x"A5";
        tb_input1_i <= x"B6";
        wait for 1 ns;
        assert (tb_output0_o = x"A5") report "TEST : 0" severity warning;

        tb_sel_i <= '1';
        wait for 1ns;
        assert (tb_output0_o = x"B6") report "TEST : 1" severity warning;

        tb_input1_i <= x"77";
        wait for 1ns;
        assert (tb_output0_o = x"77") report "TEST : 2" severity warning;

        tb_sel_i <= '0';
        tb_input0_i <= x"99";
        wait for 1ns;
        assert (tb_output0_o = x"99") report "TEST : 3" severity warning;

        assert false report "ALL TESTS PASSED" severity failure;
    end process;
    
end architecture RTL;