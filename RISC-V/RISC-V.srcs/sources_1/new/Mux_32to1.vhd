library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity Mux_32to1 is
    generic (
        W : integer range 1 to 64 := 32
    );
    port (
        select_i : in std_logic_vector(4 downto 0); -- 32 Inputs / 5 Bits is enough
        input0_i : in std_logic_vector(W - 1 downto 0);
        input1_i : in std_logic_vector(W - 1 downto 0);
        input2_i : in std_logic_vector(W - 1 downto 0);
        input3_i : in std_logic_vector(W - 1 downto 0);
        input4_i : in std_logic_vector(W - 1 downto 0);
        input5_i : in std_logic_vector(W - 1 downto 0);
        input6_i : in std_logic_vector(W - 1 downto 0);
        input7_i : in std_logic_vector(W - 1 downto 0);
        input8_i : in std_logic_vector(W - 1 downto 0);
        input9_i : in std_logic_vector(W - 1 downto 0);
        input10_i : in std_logic_vector(W - 1 downto 0);
        input11_i : in std_logic_vector(W - 1 downto 0);
        input12_i : in std_logic_vector(W - 1 downto 0);
        input13_i : in std_logic_vector(W - 1 downto 0);
        input14_i : in std_logic_vector(W - 1 downto 0);
        input15_i : in std_logic_vector(W - 1 downto 0);
        input16_i : in std_logic_vector(W - 1 downto 0);
        input17_i : in std_logic_vector(W - 1 downto 0);
        input18_i : in std_logic_vector(W - 1 downto 0);
        input19_i : in std_logic_vector(W - 1 downto 0);
        input20_i : in std_logic_vector(W - 1 downto 0);
        input21_i : in std_logic_vector(W - 1 downto 0);
        input22_i : in std_logic_vector(W - 1 downto 0);
        input23_i : in std_logic_vector(W - 1 downto 0);
        input24_i : in std_logic_vector(W - 1 downto 0);
        input25_i : in std_logic_vector(W - 1 downto 0);
        input26_i : in std_logic_vector(W - 1 downto 0);
        input27_i : in std_logic_vector(W - 1 downto 0);
        input28_i : in std_logic_vector(W - 1 downto 0);
        input29_i : in std_logic_vector(W - 1 downto 0);
        input30_i : in std_logic_vector(W - 1 downto 0);
        input31_i : in std_logic_vector(W - 1 downto 0);
        output_o : out std_logic_vector(W - 1 downto 0)
    );
end entity Mux_32to1;

architecture RTL of Mux_32to1 is
begin

    P_COMBINATIONAL : process (all)
    begin
        case (select_i) is
            when x"00" =>
                output_o <= input0_i;
            when x"01" =>
                output_o <= input1_i;
            when x"02" =>
                output_o <= input2_i;
            when x"03" =>
                output_o <= input3_i;
            when x"04" =>
                output_o <= input4_i;
            when x"05" =>
                output_o <= input5_i;
            when x"06" =>
                output_o <= input6_i;
            when x"07" =>
                output_o <= input7_i;
            when x"08" =>
                output_o <= input8_i;
            when x"09" =>
                output_o <= input9_i;
            when x"0A" =>
                output_o <= input10_i;
            when x"0B" =>
                output_o <= input11_i;
            when x"0C" =>
                output_o <= input12_i;
            when x"0D" =>
                output_o <= input13_i;
            when x"0E" =>
                output_o <= input14_i;
            when x"0F" =>
                output_o <= input15_i;
            when x"10" =>
                output_o <= input16_i;
            when x"11" =>
                output_o <= input17_i;
            when x"12" =>
                output_o <= input18_i;
            when x"13" =>
                output_o <= input19_i;
            when x"14" =>
                output_o <= input20_i;
            when x"15" =>
                output_o <= input21_i;
            when x"16" =>
                output_o <= input22_i;
            when x"17" =>
                output_o <= input23_i;
            when x"18" =>
                output_o <= input24_i;
            when x"19" =>
                output_o <= input25_i;
            when x"1A" =>
                output_o <= input26_i;
            when x"1B" =>
                output_o <= input27_i;
            when x"1C" =>
                output_o <= input28_i;
            when x"1D" =>
                output_o <= input29_i;
            when x"1E" =>
                output_o <= input30_i;
            when x"1F" =>
                output_o <= input31_i;
            when others =>
                output_o <= (others => '0');
        end case;
    end process;

end architecture RTL;