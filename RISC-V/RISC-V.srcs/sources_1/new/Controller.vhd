----------------------------------------------------------------------------------
-- Engineer: Mehmet Arslan
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity Controller is
    generic (
        W : integer range 32 downto 32 := 32
    );
    port (
        instruction_i : in std_logic_vector(W - 1 downto 0);
        zero          : in std_logic;
        PC_src        : out std_logic;
        result_src    : out std_logic;
        mem_write     : out std_logic;
        alu_control   : out std_logic_vector(2 downto 0);
        alu_src       : out std_logic;
        imm_src       : out std_logic_vector(1 downto 0);
        reg_write     : out std_logic
    );
end entity Controller;

architecture RTL of Controller is

    -- Instruction fields
    signal opcode       : std_logic_vector(6 downto 0);
    signal funct3       : std_logic_vector(2 downto 0);
    signal funct7_5     : std_logic;
    signal op5_fn7_comb : std_logic_vector(1 downto 0);

    -- Internal control signals
    signal branch_s     : std_logic;
    signal alu_op       : std_logic_vector(1 downto 0);

begin

    -- Extract instruction fields
    opcode       <= instruction_i(6 downto 0);
    funct3       <= instruction_i(14 downto 12);
    funct7_5     <= instruction_i(30);
    op5_fn7_comb <= opcode(5) & funct7_5;

    -- PC source depends on branch signal and ALU zero flag
    PC_src <= branch_s and zero;

    -- Main decoder
    P_COMB_MAIN_DECODER : process(opcode)
    begin
        case opcode is
            when "0000011" =>  -- lw
                reg_write   <= '1';
                imm_src     <= "00";
                alu_src     <= '1';
                mem_write   <= '0';
                result_src  <= '1';
                branch_s    <= '0';
                alu_op      <= "00";
            when "0100011" =>  -- sw
                reg_write   <= '0';
                imm_src     <= "01";
                alu_src     <= '1';
                mem_write   <= '1';
                result_src  <= 'X';
                branch_s    <= '0';
                alu_op      <= "00";
            when "0110011" =>  -- R-type
                reg_write   <= '1';
                imm_src     <= "XX";
                alu_src     <= '0';
                mem_write   <= '0';
                result_src  <= '0';
                branch_s    <= '0';
                alu_op      <= "10";
            when "1100011" =>  -- beq
                reg_write   <= '0';
                imm_src     <= "10";
                alu_src     <= '0';
                mem_write   <= '0';
                result_src  <= 'X';
                branch_s    <= '1';
                alu_op      <= "01";
            when others =>
                reg_write   <= '0';
                imm_src     <= "00";
                alu_src     <= '0';
                mem_write   <= '0';
                result_src  <= '0';
                branch_s    <= '0';
                alu_op      <= "00";
        end case;
    end process;

    -- ALU decoder
    P_COMB_ALU_DECODER : process(funct3, funct7_5, alu_op)
    begin
        
        case alu_op is
            when "00" =>  -- For lw/sw
                alu_control <= "000";  -- ADD
            when "01" =>  -- For beq
                alu_control <= "001";  -- SUB
            when "10" =>  -- R-type
                case funct3 is
                    when "000" =>
                        if op5_fn7_comb = "11" then
                            alu_control <= "001";  -- SUB
                        else
                            alu_control <= "000";  -- ADD
                        end if;
                    when "010" => alu_control <= "101";  -- SLT
                    when "110" => alu_control <= "011";  -- OR
                    when "111" => alu_control <= "010";  -- AND
                    when others => alu_control <= "000";
                end case;
            when others =>
                alu_control <= "000";
        end case;

    end process;

end architecture RTL;