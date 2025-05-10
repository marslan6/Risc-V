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

   -- Main decoder process to generate control signals based on the opcode
P_COMB_MAIN_DECODER : process (opcode)
begin
    -- R-type instruction (Register Type)
    -- ADD, SUB, AND, OR, XOR, SLL, SRL, SRA
    when "0110011" =>
        reg_write <= '1';  -- Write to register is enabled
        imm_src <= "XXX";  -- No immediate source for R-type
        alu_src_a <= '1';  -- ALU input A comes from RD1 (first operand)
        alu_src_b <= '0';  -- ALU input B comes from second register (RD2)
        mem_write <= '0';  -- No memory write for R-type instructions
        result_src <= "00"; -- ALU result is the source for the result
        branch_s <= '0';   -- No branching for R-type
        alu_op <= "10";    -- ALU operation depends on the instruction (e.g., ADD, SUB, AND)
        jump <= '0';       -- No jump for R-type
        PC_src_additional <= '0'; -- No additional PC source for R-type

    -- I-type instruction (Immediate Type)
    -- ADDI, SLTI, ANDI, ORI, XORI, SLLI, SRLI, SRAI, SLTIU
    when "0010011" =>
        reg_write <= '1';  -- Write to register is enabled
        imm_src <= "000";  -- Immediate source is from I-type instruction format (12-bit immediate)
        alu_src_a <= '1';  -- ALU input A comes from RD1 (first operand)
        alu_src_b <= '1';  -- ALU input B comes from the immediate
        mem_write <= '0';  -- No memory write for I-type
        result_src <= "00"; -- ALU result is the source for the result
        branch_s <= '0';   -- No branching for I-type
        alu_op <= "10";    -- ALU operation depends on the instruction
        jump <= '0';       -- No jump for I-type
        PC_src_additional <= '0'; -- No additional PC source for I-type

    -- S-type instruction (Store Type)
    -- SW, SH, SB
    when "0100011" =>
        reg_write <= '0';  -- No register write for S-type
        imm_src <= "001";  -- Immediate source is from S-type format (12-bit immediate)
        alu_src_a <= '1';  -- ALU input A comes from RD1 (first operand)
        alu_src_b <= '1';  -- ALU input B comes from the immediate
        mem_write <= '1';  -- Memory write is enabled
        result_src <= "XX"; -- No result to store in register
        branch_s <= '0';   -- No branching for S-type
        alu_op <= "00";    -- ALU operation is ADD (to calculate memory address)
        jump <= '0';       -- No jump for S-type
        PC_src_additional <= '0'; -- No additional PC source for S-type

    -- B-type instruction (Branch Type)
    -- BEQ, BNE, BLTU, BGEU
    when "1100011" =>
        reg_write <= '0';  -- No register write for B-type
        imm_src <= "010";  -- Immediate source is from B-type format (12-bit immediate)
        alu_src_a <= '1';  -- ALU input A comes from RD1 (first operand)
        alu_src_b <= '0';  -- ALU input B is 0 (because the immediate is added directly)
        mem_write <= '0';  -- No memory write for B-type
        result_src <= "XX"; -- No result to store in register
        branch_s <= '1';   -- Branching is enabled
        alu_op <= "10";    -- ALU operation depends on funct3 (e.g., BEQ, BNE)
        jump <= '0';       -- No jump for B-type
        PC_src_additional <= '0'; -- No additional PC source for B-type

    -- J-type instruction (Jump Type)
    -- JAL
    when "1101111" =>
        reg_write <= '1';  -- Write to register is enabled (to store the return address)
        imm_src <= "011";  -- Immediate source is from J-type format (20-bit immediate)
        alu_src_a <= 'X';  -- ALU input A is 'X' (irrelevant)
        alu_src_b <= 'X';  -- ALU input B is 'X' (irrelevant)
        mem_write <= '0';  -- No memory write for J-type
        result_src <= "10"; -- The return address (PC + 4) will be written to the register
        branch_s <= '0';   -- No branching for J-type
        alu_op <= "XX";    -- ALU operation is irrelevant for J-type
        jump <= '1';       -- Jump is enabled for J-type
        PC_src_additional <= '0'; -- No additional PC source for J-type

    -- L-type instruction (Load Type)
    -- LW, LHU, LBU
    when "0000011" =>
        reg_write <= '1';  -- Write to register is enabled
        imm_src <= "000";  -- Immediate source is from I-type format (12-bit immediate)
        alu_src_a <= '1';  -- ALU input A comes from RD1 (first operand)
        alu_src_b <= '1';  -- ALU input B comes from the immediate (address offset)
        mem_write <= '0';  -- No memory write for L-type
        result_src <= "01"; -- Memory data is the result to be stored in the register
        branch_s <= '0';   -- No branching for L-type
        alu_op <= "00";    -- ALU operation is ADD (to calculate memory address)
        jump <= '0';       -- No jump for L-type
        PC_src_additional <= '0'; -- No additional PC source for L-type

    -- LUI Instruction (Load Upper Immediate)
    when "0110111" =>
        reg_write <= '1';  -- Write to register is enabled
        imm_src <= "100";  -- Immediate source is from LUI (20-bit upper immediate)
        alu_src_a <= 'X';  -- ALU input A is 'X' (irrelevant)
        alu_src_b <= '1';  -- ALU input B comes from the immediate (shifted)
        mem_write <= '0';  -- No memory write for LUI
        result_src <= "00"; -- ALU result (upper immediate) is the result to be stored in the register
        branch_s <= '0';   -- No branching for LUI
        alu_op <= "";      -- ALU operation is not used in LUI
        jump <= '0';       -- No jump for LUI
        PC_src_additional <= '0'; -- No additional PC source for LUI

    -- AUIPC Instruction (Add Upper Immediate to PC)
    when "0010111" =>
        reg_write <= '1';  -- Write to register is enabled
        imm_src <= "100";  -- Immediate source is from AUIPC (20-bit upper immediate)
        alu_src_a <= '0';  -- ALU input A comes from PC (add immediate to PC)
        alu_src_b <= '1';  -- ALU input B comes from the immediate (shifted)
        mem_write <= '0';  -- No memory write for AUIPC
        result_src <= "00"; -- ALU result (PC + immediate) is the result to be stored in the register
        branch_s <= '0';   -- No branching for AUIPC
        alu_op <= "00";    -- ALU operation is ADD (PC + immediate)
        jump <= '0';       -- No jump for AUIPC
        PC_src_additional <= '0'; -- No additional PC source for AUIPC

    -- JALR Instruction (Jump and Link Register)
    when "1100111" =>
        reg_write <= '1';  -- Write to register is enabled (to store the return address)
        imm_src <= "000";  -- Immediate source is from I-type format (12-bit immediate)
        alu_src_a <= '1';  -- ALU input A comes from RD1 (rs1 value)
        alu_src_b <= '1';  -- ALU input B comes from the immediate
        mem_write <= '0';  -- No memory write for JALR
        result_src <= "10"; -- The return address (PC + 4) will be written to the register
        branch_s <= '0';   -- No branching for JALR
        alu_op <= "00";    -- ALU operation is ADD (PC + immediate)
        jump <= '1';       -- Jump is enabled for JALR
        PC_src_additional <= '1'; -- The jump target is calculated from the ALU result

    -- Default case for undefined opcodes (set all control signals to their default values)
    when others =>
        reg_write <= '0';  -- No register write
        imm_src <= "000";  -- Default immediate source
        alu_src_a <= '0';  -- Default ALU input A
        alu_src_b <= '0';  -- Default ALU input B
        mem_write <= '0';  -- No memory write
        result_src <= "00"; -- Default result source
        branch_s <= '0';   -- No branching
        alu_op <= "00";    -- Default ALU operation
        jump <= '0';       -- No jump
        PC_src_additional <= '0'; -- No additional PC source

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