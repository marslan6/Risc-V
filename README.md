# RV32I RISC-V Processor Core

[![Architecture](https://img.shields.io/badge/ISA-RISC--V%20RV32I-blue)](https://riscv.org/)
[![Language](https://img.shields.io/badge/HDL-VHDL-green)](https://en.wikipedia.org/wiki/VHDL)
[![Platform](https://img.shields.io/badge/FPGA-Xilinx%20Vivado-red)](https://www.xilinx.com/products/design-tools/vivado.html)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

A modular, educational **RV32I RISC-V processor core** implemented in VHDL for FPGA synthesis and simulation. Designed for learning computer architecture fundamentals with clean, parameterized RTL and comprehensive testbenches.

## Table of Contents
- [Overview](#overview)
- [Features](#features)
- [Architecture](#architecture)
- [Project Structure](#project-structure)
- [Supported Instructions](#supported-instructions)
- [Getting Started](#getting-started)
- [Module Descriptions](#module-descriptions)
- [Simulation](#simulation)
- [Technical Specifications](#technical-specifications)
- [Author](#author)

---

## Overview

This project implements a **single-cycle, non-pipelined RISC-V processor** based on the **RV32I base integer instruction set**. The design prioritizes **clarity and modularity** over performance, making it ideal for:

- **Educational purposes**: Learning processor design and RISC-V ISA
- **FPGA prototyping**: Synthesizable for Xilinx FPGAs
- **Architecture exploration**: Easily extendable to pipelined versions
- **Digital design coursework**: Comprehensive testbenches included

**Key Characteristics:**
- 32-bit datapath with parameterized word width
- Harvard architecture (separate instruction and data memories)
- Memory-mapped I/O support ready
- External memory initialization via `.mem` files
- Full Vivado project for one-click synthesis and simulation

---

## Features

### Core Capabilities
- **Complete RV32I Base ISA Subset**: Arithmetic, logical, load/store, branch, and jump instructions
- **32 General-Purpose Registers**: 32×32-bit register file with dual read ports
- **Flexible Memory System**: Parameterized instruction and data memories with file initialization
- **Modular Design**: 23 synthesizable VHDL modules with clear separation of concerns
- **Comprehensive Verification**: 17 dedicated testbenches for component-level testing

### Design Philosophy
- **Parameterized Components**: Generic word width (W), memory depth, and address width
- **VHDL Best Practices**: Synchronous design, proper reset handling, type safety
- **Educational Focus**: Readable code over optimization, extensive comments
- **FPGA-Ready**: Synthesizable on Xilinx 7-series and later devices

---

## Architecture

### Block Diagram

```
┌──────────────────────────────────────────────────────────────┐
│                      RV32I Processor Core                     │
└───────────────────────┬──────────────────────────────────────┘
                        │
    ┌───────────────────┼───────────────────┐
    │                   │                   │
    ▼                   ▼                   ▼
┌─────────┐      ┌──────────┐       ┌──────────┐
│ Control │      │ Datapath │       │  Memory  │
│  Unit   │      │          │       │ Subsystem│
└────┬────┘      └────┬─────┘       └────┬─────┘
     │                │                   │
┌────▼────────────────▼───────────────────▼──────┐
│                                                 │
│  ┌──────────┐  ┌─────┐  ┌──────────────┐      │
│  │Controller│  │ ALU │  │Register File │      │
│  │          │  │     │  │  (32×32-bit) │      │
│  └──────────┘  └─────┘  └──────────────┘      │
│                                                 │
│  ┌────────┐   ┌──────────┐   ┌──────────┐    │
│  │  PC    │   │Instruction│   │   Data   │    │
│  │        │   │  Memory   │   │  Memory  │    │
│  └────────┘   └──────────┘   └──────────┘    │
│                                                 │
│  ┌────────────────────────────────────┐       │
│  │ Glue Logic (Muxes, Decoders, etc.) │       │
│  └────────────────────────────────────┘       │
└─────────────────────────────────────────────────┘
```

### Execution Model

**Single-Cycle Architecture:**
```
Clock Cycle N:
  1. Fetch instruction from memory[PC]
  2. Decode instruction → generate control signals
  3. Read registers (if needed)
  4. Execute ALU operation / compute address
  5. Access data memory (load/store)
  6. Write back to register file
  7. Update PC (sequential or branch target)

Clock Cycle N+1: Repeat
```

**No pipelining** - Each instruction completes in one clock cycle.

---

## Project Structure

```
Risc-V/
├── README.md                          # This file
├── .git/                              # Version control
│
└── RISC-V/                            # Vivado project root
    ├── RISC-V.xpr                     # Vivado project file
    │
    ├── RISC-V.srcs/
    │   ├── sources_1/new/             # RTL source files (23 VHDL modules)
    │   │   ├── Controller.vhd         # Instruction decoder & control unit
    │   │   ├── ALU.vhd                # Arithmetic logic unit
    │   │   ├── Register_File.vhd      # 32×32-bit register file
    │   │   ├── Program_Counter.vhd    # PC register
    │   │   ├── Instruction_Memory.vhd # ROM for program storage
    │   │   ├── Data_Memory.vhd        # RAM for data storage
    │   │   ├── DRAM.vhd               # Generic memory primitive
    │   │   ├── Extend_Immediate.vhd   # Immediate sign extender
    │   │   ├── Adder.vhd              # 32-bit adder
    │   │   ├── Register_*.vhd         # Register variants (2 files)
    │   │   ├── Mux_*.vhd              # Multiplexers (4 files)
    │   │   ├── Decoder_*.vhd          # Decoders (3 files)
    │   │   └── *.mem                  # Memory initialization files (4 files)
    │   │
    │   └── sim_1/new/                 # Testbenches (17 VHDL files)
    │       ├── TB_ALU.vhd
    │       ├── TB_Controller.vhd
    │       ├── TB_Register_File.vhd
    │       ├── TB_Data_Memory.vhd
    │       └── ... (13 more testbenches)
    │
    ├── RISC-V.sim/                    # Simulation artifacts
    │   └── sim_1/behav/xsim/          # Vivado simulator scripts
    │
    ├── RISC-V.runs/                   # Synthesis/implementation runs
    │   ├── synth_1/                   # Synthesis outputs
    │   └── impl_1/                    # Implementation outputs
    │
    └── RISC-V.gen/                    # Generated files
```

### File Count Summary

| Category | Count | Total Lines |
|----------|-------|-------------|
| **RTL Modules** | 23 | ~1,061 |
| **Testbenches** | 17 | ~850 |
| **Memory Files** | 4 | - |

---

## Supported Instructions

### Instruction Set Coverage

The processor implements a **functional subset of RV32I** sufficient for basic programs:

#### R-Type (Register-Register)
```
ADD, SUB, AND, OR, XOR, SLL, SRL, SRA, SLT, SLTU
```

#### I-Type (Immediate)
```
ADDI, SLTI, SLTIU, ANDI, ORI, XORI, SLLI, SRLI, SRAI
LW, LHU, LBU, JALR
```

#### S-Type (Store)
```
SW, SH, SB
```

#### B-Type (Branch)
```
BEQ, BNE, BLT, BGE, BLTU, BGEU
```

#### U-Type (Upper Immediate)
```
LUI, AUIPC
```

#### J-Type (Jump)
```
JAL
```

### Instruction Format Encoding

**R-Type:**
```
┌───────┬────┬────┬───────┬────┬───────┐
│ funct7│ rs2│ rs1│ funct3│ rd │ opcode│
│ [6:0] │[4:0]│[4:0]│ [2:0] │[4:0]│ [6:0] │
└───────┴────┴────┴───────┴────┴───────┘
  31:25  24:20 19:15 14:12 11:7   6:0
```

**I-Type:**
```
┌──────────────┬────┬───────┬────┬───────┐
│   imm[11:0]  │ rs1│ funct3│ rd │ opcode│
│   [11:0]     │[4:0]│ [2:0] │[4:0]│ [6:0] │
└──────────────┴────┴───────┴────┴───────┘
     31:20      19:15 14:12 11:7   6:0
```

**S-Type:**
```
┌───────┬────┬────┬───────┬───────┬───────┐
│imm[11:5]│rs2│ rs1│ funct3│imm[4:0]│opcode│
└───────┴────┴────┴───────┴───────┴───────┘
  31:25  24:20 19:15 14:12   11:7    6:0
```

---

## Getting Started

### Prerequisites

**Software:**
- **Xilinx Vivado**: 2020.1 or later (tested up to 2023.2)
  - Download: https://www.xilinx.com/support/download.html
  - Free WebPACK edition is sufficient
- **Operating System**: Windows 10/11, Linux (RHEL/CentOS/Ubuntu)

**Hardware (for FPGA deployment):**
- Xilinx FPGA board (7-series or later)
- Examples: Basys 3, Arty A7, Nexys A7

### Quick Start (Vivado GUI)

#### 1. Open the Project

```bash
# Clone repository
git clone <repository-url>
cd Risc-V

# Launch Vivado
vivado RISC-V/RISC-V.xpr
```

#### 2. Run Simulation

1. **Select Testbench**:
   - In Sources pane → Simulation Sources
   - Choose a testbench (e.g., `TB_ALU`)

2. **Run Behavioral Simulation**:
   - Flow Navigator → Simulation → Run Simulation → Run Behavioral Simulation
   - Or click the simulation icon in toolbar

3. **Observe Waveforms**:
   - Waveform window shows signal values
   - Console displays assertion messages

#### 3. Synthesize for FPGA

1. **Run Synthesis**:
   - Flow Navigator → Synthesis → Run Synthesis
   - Wait for completion (~2-5 minutes)

2. **Run Implementation**:
   - Flow Navigator → Implementation → Run Implementation
   - Generates bitstream for FPGA programming

3. **View Utilization**:
   - Reports → Utilization Report
   - Check LUT/FF/BRAM usage

### Command-Line Usage (TCL)

```bash
# Run specific testbench in batch mode
vivado -mode batch -source RISC-V/RISC-V.sim/sim_1/behav/xsim/TB_ALU.tcl

# Synthesize via TCL
vivado -mode batch -source synth_script.tcl
```

---

## Module Descriptions

### Core Processing Elements

#### **Controller.vhd** (231 lines)
- **Purpose**: Instruction decoder and control signal generator
- **Inputs**: 32-bit instruction word
- **Outputs**: Control signals for all datapath components
- **Functionality**:
  - Decodes opcode (bits [6:0])
  - Decodes funct3 (bits [14:12]) and funct7 (bits [31:25])
  - Generates: ALU operation, register write enable, memory read/write, branch/jump control
  - Supports all R/I/S/B/U/J instruction formats

**Key Control Signals:**
```vhdl
ALUSrc      : Select ALU input (register or immediate)
MemtoReg    : Select writeback source (ALU or memory)
RegWrite    : Register file write enable
MemRead     : Data memory read enable
MemWrite    : Data memory write enable
Branch      : Branch instruction flag
ALUOp       : ALU operation selector
```

#### **ALU.vhd** (32-bit Arithmetic Logic Unit)
- **Operations**: 10 functions
  ```
  0: ADD    (addition)
  1: SUB    (subtraction)
  2: AND    (bitwise AND)
  3: OR     (bitwise OR)
  4: XOR    (bitwise XOR)
  5: SLL    (shift left logical)
  6: SRL    (shift right logical)
  7: SRA    (shift right arithmetic)
  8: SLT    (set less than - signed)
  9: SLTU   (set less than - unsigned)
  ```
- **Inputs**: Two 32-bit operands, 4-bit operation selector
- **Outputs**: 32-bit result, zero flag
- **Features**: Parameterized width via generic `W`

#### **Register_File.vhd** (32×32-bit Register File)
- **Structure**: 32 registers (R0-R31)
- **Ports**:
  - 2 read ports (simultaneous access)
  - 1 write port (synchronous)
- **Special Behavior**:
  - R0 is hardwired to zero (handled externally)
  - Write occurs on rising clock edge when write_enable='1'
- **Implementation**: Uses VHDL GENERATE to instantiate 32 individual registers

#### **Program_Counter.vhd**
- **Function**: Stores current instruction address
- **Features**:
  - Synchronous update on rising clock edge
  - Asynchronous reset to address 0
  - Input from PC adder or branch target

### Memory Subsystem

#### **DRAM.vhd** (Generic Memory Primitive)
- **Parameterized**:
  - `RAM_DEPTH`: Number of words (default 128)
  - `RAM_WIDTH`: Bits per word (default 32)
  - `ADDR_WIDTH`: Address bus width (default 7)
  - `MEMORY_FILE`: Initialization file path
- **Initialization**: Loads from `.mem` file using VHDL TEXTIO
- **Format**: One 32-bit binary word per line
  ```
  00010001001000100011001101000100
  00100010001000100011001101000100
  ...
  ```

#### **Instruction_Memory.vhd**
- **Type**: Read-only memory (ROM-style)
- **Implementation**: Instantiates DRAM with write_enable='0'
- **Usage**: Stores program instructions
- **File**: `instruction_mem_init_file.mem`

#### **Data_Memory.vhd**
- **Type**: Read-write memory (RAM)
- **Implementation**: Instantiates DRAM with synchronous write
- **Usage**: Runtime data storage
- **File**: `data_mem_init_file.mem`

### Datapath Components

#### **Extend_Immediate.vhd**
- **Function**: Sign-extends immediate values
- **Supports**: I-type (12-bit), S-type (12-bit), B-type (13-bit), U-type (20-bit), J-type (21-bit)
- **Algorithm**: Replicates sign bit to fill 32 bits

#### **Adder.vhd**
- **Type**: Combinational 32-bit adder
- **Usage**: PC increment, branch target calculation

#### **Multiplexers**
- `Mux_2to1.vhd`: 2-input mux (generic width)
- `Mux_4to1.vhd`: 4-input mux
- `Mux_16to1.vhd`: 16-input mux
- `Mux_32to1.vhd`: 32-input mux (121 lines - for register file read)

#### **Decoders**
- `Decoder_2to4.vhd`: 2-bit to 4-bit one-hot
- `Decoder_4to16.vhd`: 4-bit to 16-bit one-hot
- `Decoder_5to32.vhd`: 5-bit to 32-bit one-hot (register write address)

---

## Simulation

### Available Testbenches

All 17 testbenches located in `RISC-V/RISC-V.srcs/sim_1/new/`:

| Testbench | Component Under Test | Purpose |
|-----------|---------------------|---------|
| `TB_ALU.vhd` | ALU | Arithmetic/logic operations |
| `TB_Controller.vhd` | Controller | Instruction decoding |
| `TB_Register_File.vhd` | Register File | Register read/write |
| `TB_Program_Counter.vhd` | Program Counter | PC update logic |
| `TB_Instruction_Memory.vhd` | Instruction Memory | Program fetch |
| `TB_Data_Memory.vhd` | Data Memory | Load/store operations |
| `TB_DRAM.vhd` | DRAM | Generic memory primitive |
| `TB_Extend_Immediate.vhd` | Immediate Extender | Sign extension |
| `TB_Adder.vhd` | Adder | 32-bit addition |
| `TB_Register_Simple.vhd` | Simple Register | Basic register |
| `TB_Register_Write_Enable.vhd` | WE Register | Conditional write |
| `TB_Mux_2to1.vhd` | 2:1 Mux | Multiplexer |
| `TB_Mux_4to1.vhd` | 4:1 Mux | Multiplexer |
| `TB_Mux_16to1.vhd` | 16:1 Mux | Multiplexer |
| `TB_Decoder_2to4.vhd` | 2:4 Decoder | Decoder |
| `TB_Decoder_4to16.vhd` | 4:16 Decoder | Decoder |
| `TB_Decoder_5to32.vhd` | 5:32 Decoder | Decoder |

### Example: Running ALU Testbench

**TB_ALU.vhd** tests arithmetic operations:
```vhdl
-- Test vector: 0x12341234 + 0x43214321 = 0x55555555
in_A <= x"12341234";
in_B <= x"43214321";
alu_operation <= "0000";  -- ADD
wait for 10 ns;

assert (out_result = x"55555555")
    report "ADD operation failed!"
    severity error;
```

**Expected Output:**
```
Time: 10 ns  Iteration: 1  Instance: /tb_alu
Info: ALU ADD test passed
Time: 20 ns  Iteration: 1  Instance: /tb_alu
Info: ALU SUB test passed
...
```

### Viewing Waveforms

1. After simulation starts, Vivado opens waveform viewer
2. Add signals: Scope → tb_alu → Add to Wave Window
3. Zoom: Fit, Zoom In/Out buttons
4. Cursors: Click on waveform to measure timing

---

## Technical Specifications

### Processor Characteristics

| Parameter | Value |
|-----------|-------|
| **ISA** | RISC-V RV32I (base integer) |
| **Word Size** | 32 bits (parameterized) |
| **Registers** | 32 × 32-bit general purpose |
| **Architecture** | Single-cycle, non-pipelined |
| **Memory Organization** | Harvard (separate I-mem, D-mem) |
| **Default I-Mem Size** | 128 words (512 bytes) |
| **Default D-Mem Size** | 128 words (512 bytes) |
| **Clock Domains** | Single clock, synchronous design |
| **Reset** | Asynchronous active-high |

### FPGA Resource Requirements

**Note**: Actual synthesis has not been completed for this design. The following are **typical estimates** for similar RV32I cores on Xilinx 7-series FPGAs. Your actual results will vary based on:
- Memory size configuration (default: 128 words I-mem + D-mem)
- FPGA family and speed grade
- Synthesis settings and optimizations
- Timing constraints

**Expected Resource Usage** (Xilinx Artix-7 XC7A35T):

| Resource | Estimated Range | Available | Notes |
|----------|----------------|-----------|-------|
| **LUTs** | 500-1500 | 20,800 | Depends on ALU implementation |
| **Flip-Flops** | 300-600 | 41,600 | Registers + control logic |
| **BRAM** | 2-8 blocks | 50 | Based on memory size |
| **Max Frequency** | 50-150 MHz | - | Depends on timing closure |

**To get actual data, run synthesis in Vivado:**
1. Flow Navigator → Synthesis → Run Synthesis
2. Open Synthesized Design → Reports → Utilization Report
3. Implementation → Reports → Timing Summary

### Performance Metrics

| Metric | Value |
|--------|-------|
| **CPI** (Cycles Per Instruction) | 1.0 (single-cycle design) |
| **Theoretical Performance** | Frequency × 1 instruction/cycle |
| **Memory Latency** | 1 clock cycle (synchronous) |
| **Pipeline Depth** | None (single-cycle) |

---

## Memory Initialization

### File Format

Memory files use **binary text format** (one 32-bit word per line):

**Example: `instruction_mem_init_file.mem`**
```
00000000000000000000000000000000  // NOP (or ADD x0, x0, x0)
00000000001000001000000010010011  // ADDI x1, x1, 2
00000000001000010000000100110011  // ADD x2, x2, x2
...
```

### Loading Custom Programs

1. **Write Assembly Code**:
   ```asm
   ADDI x1, x0, 5     # x1 = 5
   ADDI x2, x0, 10    # x2 = 10
   ADD x3, x1, x2     # x3 = x1 + x2 = 15
   SW x3, 0(x0)       # Store to memory[0]
   ```

2. **Assemble to Binary**:
   - Use RISC-V assembler (e.g., `riscv32-unknown-elf-as`)
   - Convert to 32-bit binary format

3. **Create `.mem` File**:
   ```
   00000000010100000000000010010011
   00000000101000000000000100010011
   00000000001000001000000110110011
   00000000001100000010000000100011
   ```

4. **Update Memory File Path**:
   ```vhdl
   -- In Instruction_Memory.vhd or DRAM instantiation
   MEMORY_FILE => "instruction_mem_init_file.mem"
   ```

5. **Re-run Simulation**

---

## Design Limitations

### Not Implemented (Educational Scope)

The following features are **intentionally omitted** to keep the design simple:

- **Pipelining**: No IF/ID/EX/MEM/WB stages
- **Hazard Handling**: No forwarding, stalls, or branch prediction
- **CSRs**: No Control and Status Registers
- **Interrupts/Exceptions**: No trap handling
- **Privileged Modes**: No M/S/U modes
- **Memory Protection**: No MMU or PMP
- **Floating Point**: No F/D extensions
- **Multiplication/Division**: No M extension
- **Atomic Operations**: No A extension
- **Compressed Instructions**: No C extension

### Known Issues

- **R0 Write Protection**: Must be enforced externally
- **Memory Size**: Limited by FPGA BRAM availability
- **Timing**: May not meet timing at high frequencies without optimization

---

## Future Enhancements

Potential extensions for advanced learning:

1. **5-Stage Pipeline**: Add IF, ID, EX, MEM, WB stages
2. **Hazard Detection**: Data forwarding, stall logic
3. **Branch Prediction**: Static or dynamic predictors
4. **M Extension**: Hardware multiplier/divider
5. **CSR Support**: System registers and instructions
6. **Interrupt Controller**: External interrupt handling
7. **Cache Hierarchy**: I-cache, D-cache
8. **UART Interface**: Serial communication for I/O
9. **Debugger Support**: JTAG, breakpoints

---

## Contributing

Contributions are welcome! Please follow these guidelines:

1. **File Issues**: Report bugs or suggest features via issue tracker
2. **Pull Requests**:
   - Keep changes focused and atomic
   - Include/update testbenches for modified modules
   - Maintain VHDL coding style consistency
   - Add comments for complex logic
3. **Testing**: Ensure all testbenches pass before submitting
4. **Documentation**: Update README for significant changes

### Coding Style

- **Indentation**: 2 or 4 spaces (consistent)
- **Naming**:
  - Signals: `snake_case` or `camelCase`
  - Generics: `UPPERCASE`
  - Components: `PascalCase`
- **Comments**: Explain "why", not "what"
- **Generics**: Prefer parameterization over hardcoding

---

## License

This project is licensed under the **MIT License** - see [LICENSE](LICENSE) file for details.

```
Copyright (c) 2024 Mehmet Arslan

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software...
```

---

## Author

**Mehmet Arslan**

Hardware design engineer specializing in digital logic design, processor architecture, and FPGA development.

**Technical Skills Demonstrated:**
- RISC-V ISA implementation
- RTL design in VHDL
- FPGA synthesis and timing closure
- Modular hardware architecture
- Testbench development and verification
- Xilinx Vivado toolchain
- Computer architecture fundamentals

**GitHub**: [@htmos6](https://github.com/htmos6)

---

## Acknowledgments

- **RISC-V Foundation**: For the open RISC-V ISA specification
  - Spec: https://riscv.org/technical/specifications/
- **Xilinx**: For Vivado Design Suite and documentation
- **Digital Design Resources**:
  - "Computer Organization and Design: RISC-V Edition" by Patterson & Hennessy
  - RISC-V community tutorials and implementations
- **Educational Institutions**: For fostering open-source hardware education

---

## References

### RISC-V Resources
- [RISC-V ISA Specification](https://riscv.org/technical/specifications/)
- [RISC-V Assembly Programmer's Manual](https://github.com/riscv/riscv-asm-manual)
- [RISC-V Green Card](https://inst.eecs.berkeley.edu/~cs61c/resources/RISCV_Green_Sheet.pdf) - Quick reference

### VHDL Learning
- [Free Range VHDL](https://github.com/fabriziotappero/Free-Range-VHDL-book)
- [VHDL Tutorial](http://www.vhdl-online.de/tutorial/)
- [Vivado Design Suite User Guide](https://www.xilinx.com/support/documentation/sw_manuals/xilinx2020_1/ug901-vivado-synthesis.pdf)

### Tools
- **RISC-V GNU Toolchain**: https://github.com/riscv/riscv-gnu-toolchain
- **RISC-V Online Assembler**: https://riscvasm.lucasteske.dev/
- **Vivado WebPACK** (Free): https://www.xilinx.com/products/design-tools/vivado/vivado-webpack.html

---

**Last Updated**: January 2026
**Version**: 1.0
**Project Status**: Active Development
