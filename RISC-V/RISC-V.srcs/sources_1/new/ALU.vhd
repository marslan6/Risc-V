----------------------------------------------------------------------------------
-- Engineer: Mehmet Arslan (Corrected Version)
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity ALU is
    generic (
        W : integer range 8 to 64 := 32
    );
    port (
        src_a_i : in std_logic_vector(W - 1 downto 0);
        src_b_i : in std_logic_vector(W - 1 downto 0);
        alu_control_i : in std_logic_vector(3 downto 0);
        alu_res_o : out std_logic_vector(W - 1 downto 0);
        alu_zero_o : out std_logic
    );
end entity ALU;

architecture RTL of ALU is
    signal a_signed, b_signed : signed(W - 1 downto 0);
    signal a_unsigned, b_unsigned : unsigned(W - 1 downto 0);
    signal result : std_logic_vector(W - 1 downto 0);
begin

    a_signed <= signed(src_a_i);
    b_signed <= signed(src_b_i);
    a_unsigned <= unsigned(src_a_i);
    b_unsigned <= unsigned(src_b_i);

    alu_zero_o <= '1' when result = std_logic_vector(to_signed(0, W)) else '0';

    P_COMBINATIONAL : process (a_signed, b_signed, a_unsigned, b_unsigned, alu_control_i)
    begin

        case (alu_control_i) is
            when "0000" => -- ADD
                result <= std_logic_vector(a_signed + b_signed);

            when "0001" => -- SUB
                result <= std_logic_vector(a_signed - b_signed);

            when "0010" => -- AND
                result <= src_a_i and src_b_i;

            when "0011" => -- OR
                result <= src_a_i or src_b_i;

            when "0100" => -- SLL (Shift Left Logical)
                result <= std_logic_vector(shift_left(a_unsigned, to_integer(b_unsigned(4 downto 0))));

            when "0101" => -- SLT (Set Less Than Signed)
                if a_signed < b_signed then
                    result <= (others => '0');
                    result(0) <= '1';
                else
                    result <= (others => '0');
                end if;

            when "0110" => -- SLTU (Set Less Than Unsigned)
                if a_unsigned < b_unsigned then
                    result <= (others => '0');
                    result(0) <= '1';
                else
                    result <= (others => '0');
                end if;

            when "0111" => -- XOR
                result <= src_a_i xor src_b_i;

            when "1000" => -- SRL (Shift Right Logical)
                result <= std_logic_vector(shift_right(a_unsigned, to_integer(b_unsigned(4 downto 0))));

            when "1001" => -- SRA (Shift Right Arithmetic)
                result <= std_logic_vector(shift_right(a_signed, to_integer(b_unsigned(4 downto 0))));

            when others =>
                result <= (others => '0');
        end case;

        alu_res_o <= result;
    end process;

end architecture RTL;