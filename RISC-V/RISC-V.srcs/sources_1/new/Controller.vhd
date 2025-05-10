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
        zero : in std_logic;
        PC_src : out std_logic;
        PC_src_additional : out std_logic;
        result_src : out std_logic_vector(1 downto 0);
        mem_write : out std_logic;
        alu_control : out std_logic_vector(2 downto 0);
        alu_src_a : out std_logic;
        alu_src_b : out std_logic;
        imm_src : out std_logic_vector(2 downto 0);
        reg_write : out std_logic
    );
end entity Controller;

architecture RTL of Controller is

    -- Instruction fields
    signal opcode : std_logic_vector(6 downto 0);
    signal funct3 : std_logic_vector(2 downto 0);
    signal funct7_5 : std_logic;
    signal op5_fn7_comb : std_logic_vector(1 downto 0);

    -- Internal control signals
    signal jump : std_logic;
    signal branch_s : std_logic;
    signal alu_op : std_logic_vector(1 downto 0);

begin

    -- Extract instruction fields
    opcode <= instruction_i(6 downto 0);
    funct3 <= instruction_i(14 downto 12);
    funct7_5 <= instruction_i(30);
    op5_fn7_comb <= opcode(5) & funct7_5;

    -- PC source depends on branch signal and ALU zero flag
    PC_src <= (branch_s and zero) or jump;

    -- Main decoder
    P_COMB_MAIN_DECODER : process (opcode)
    begin
        case opcode is
                -- R-type
            when "0110011" =>
                reg_write <= '1';
                imm_src <= "XXX";
                alu_src_a <= '1'; -- 0:PC 1:RD1 
                alu_src_b <= '0';
                mem_write <= '0';
                result_src <= "00";
                branch_s <= '0';
                alu_op <= "10"; -- Depends on INSTRUCTION
                jump <= '0';
                PC_src_additional <= '0';

                -- I-type
            when "0010011" =>
                reg_write <= '1';
                imm_src <= "000";
                alu_src_a <= '1'; -- 0:PC 1:RD1 
                alu_src_b <= '1';
                mem_write <= '0';
                result_src <= "00";
                branch_s <= '0';
                alu_op <= "10"; -- Depends on INSTRUCTION
                jump <= '0';
                PC_src_additional <= '0';

                -- S-type
            when "0100011" =>
                reg_write <= '0';
                imm_src <= "001";
                alu_src_a <= '1'; -- 0:PC 1:RD1 
                alu_src_b <= '1';
                mem_write <= '1';
                result_src <= "XX";
                branch_s <= '0';
                alu_op <= "00"; -- ADD
                jump <= '0';
                PC_src_additional <= '0';

                -- B-type
            when "1100011" =>
                reg_write <= '0';
                imm_src <= "010";
                alu_src_a <= '1'; -- 0:PC 1:RD1 
                alu_src_b <= '0';
                mem_write <= '0';
                result_src <= "XX";
                branch_s <= '1';
                alu_op <= "10"; -- based on funct3
                jump <= '0';
                PC_src_additional <= '0';

                -- J-type
            when "1101111" =>
                reg_write <= '1';
                imm_src <= "011";
                alu_src_a <= 'X'; -- 0:PC 1:RD1 
                alu_src_b <= 'X';
                mem_write <= '0';
                result_src <= "10";
                branch_s <= '0';
                alu_op <= "XX";
                jump <= '1';
                PC_src_additional <= '0';

                -- L-type
            when "0000011" =>
                reg_write <= '1';
                imm_src <= "000";
                alu_src_a <= '1'; -- 0:PC 1:RD1 
                alu_src_b <= '1';
                mem_write <= '0';
                result_src <= "01";
                branch_s <= '0';
                alu_op <= "00"; -- ADD
                jump <= '0';
                PC_src_additional <= '0';

                -- LUI Instruction
                -- LUI x5, 0x12345  ; Load upper 20 bits of 0x12345 into x5 (x5 = 0x12345000)
            when "0110111" =>
                reg_write <= '1';
                imm_src <= "100"; -- TO DO : update extender
                alu_src_a <= 'X'; -- 0:PC 1:RD1 
                alu_src_b <= '1';
                mem_write <= '0';
                result_src <= "00";
                branch_s <= '0';
                alu_op <= ""; -- Assign SrcB directly to ALUResult
                jump <= '0';
                PC_src_additional <= '0';

                -- AUIPC Instruction
                -- AUIPC x3, 0x12345  ; Set x3 to (PC + 0x12345000)
                -- Add 2x1 MUX to entrance of SrcA of ALU
            when "0010111" =>
                reg_write <= '1';
                imm_src <= "100"; -- TO DO : update extender
                alu_src_a <= '0'; -- 0:PC 1:RD1 
                alu_src_b <= '1';
                mem_write <= '0';
                result_src <= "00"; -- ALU sum result
                branch_s <= '0';
                alu_op <= "00"; -- ADD
                jump <= '0';
                PC_src_additional <= '0';

                -- JALR Instruction
                -- JALR rd, rs1, imm
                -- jump to the address stored in PC = rs1 + imm
                -- stores the return address (PC + 4) in register rd
            when "1100111" =>
                reg_write <= '1';
                imm_src <= "000"; -- I-type immediate
                alu_src_a <= '1'; -- 0:PC 1:RD1 
                alu_src_b <= '1';
                mem_write <= '0';
                result_src <= "10";
                branch_s <= '0';
                alu_op <= "00"; -- ADD
                jump <= '1';
                PC_src_additional <= '1';

            when others =>
                reg_write <= '0';
                imm_src <= "000";
                alu_src_a <= '0';
                alu_src_b <= '0';
                mem_write <= '0';
                result_src <= "00";
                branch_s <= '0';
                alu_op <= "00";
                jump <= '0';
                PC_src_additional <= '0';
        end case;
    end process;

    -- ALU decoder
    P_COMB_ALU_DECODER : process (funct3, funct7_5, alu_op)
    begin

        case alu_op is
            when "00" => -- For lw/sw
                alu_control <= "000"; -- ADD
            when "01" => -- For beq
                alu_control <= "001"; -- SUB
            when "10" => -- R-type
                case funct3 is -- R-type or I-type ALU
                    when "000" =>
                        if op5_fn7_comb = "11" then
                            alu_control <= "001"; -- SUB
                        else
                            alu_control <= "000"; -- ADD
                        end if;
                    when "010" => alu_control <= "101"; -- SLT
                    when "110" => alu_control <= "011"; -- OR
                    when "111" => alu_control <= "010"; -- AND
                    when others => alu_control <= "000";
                end case;
            when others =>
                alu_control <= "000";
        end case;

    end process;

end architecture RTL;