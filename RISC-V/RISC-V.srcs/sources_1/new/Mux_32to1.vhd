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
            when ('0' & x"0") =>
                output_o <= input0_i;
            when ('0' & x"1") =>
                output_o <= input1_i;
            when ('0' & x"2") =>
                output_o <= input2_i;
            when ('0' & x"3") =>
                output_o <= input3_i;
            when ('0' & x"4") =>
                output_o <= input4_i;
            when ('0' & x"5") =>
                output_o <= input5_i;
            when ('0' & x"6") =>
                output_o <= input6_i;
            when ('0' & x"7") =>
                output_o <= input7_i;
            when ('0' & x"8") =>
                output_o <= input8_i;
            when ('0' & x"9") =>
                output_o <= input9_i;
            when ('0' & x"A") =>
                output_o <= input10_i;
            when ('0' & x"B") =>
                output_o <= input11_i;
            when ('0' & x"C") =>
                output_o <= input12_i;
            when ('0' & x"D") =>
                output_o <= input13_i;
            when ('0' & x"E") =>
                output_o <= input14_i;
            when ('0' & x"F") =>
                output_o <= input15_i;
            when ('1' & x"0") =>
                output_o <= input16_i;
            when ('1' & x"1") =>
                output_o <= input17_i;
            when ('1' & x"2") =>
                output_o <= input18_i;
            when ('1' & x"3") =>
                output_o <= input19_i;
            when ('1' & x"4") =>
                output_o <= input20_i;
            when ('1' & x"5") =>
                output_o <= input21_i;
            when ('1' & x"6") =>
                output_o <= input22_i;
            when ('1' & x"7") =>
                output_o <= input23_i;
            when ('1' & x"8") =>
                output_o <= input24_i;
            when ('1' & x"9") =>
                output_o <= input25_i;
            when ('1' & x"A") =>
                output_o <= input26_i;
            when ('1' & x"B") =>
                output_o <= input27_i;
            when ('1' & x"C") =>
                output_o <= input28_i;
            when ('1' & x"D") =>
                output_o <= input29_i;
            when ('1' & x"E") =>
                output_o <= input30_i;
            when ('1' & x"F") =>
                output_o <= input31_i;
            when others =>
                output_o <= (others => '0');
        end case;
    end process;

end architecture RTL;