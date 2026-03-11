# AI-Accelerated 5-Stage Pipelined RISC-V Processor

## Overview
This project implements a simplified RISC-V processor with a custom AI accelerator integrated into the execution stage. The processor demonstrates core computer architecture concepts including pipelining, register file design, ALU operations, and hardware acceleration for vector computations.

The system is implemented in Verilog HDL and verified through simulation using Icarus Verilog and waveform visualization.

---

## Architecture

The processor uses a classic **5-stage pipeline architecture**:

IF → Instruction Fetch  
ID → Instruction Decode  
EX → Execute (ALU / AI Accelerator)  
MEM → Memory Stage  
WB → Write Back  

The AI accelerator performs a **dot-product computation**, commonly used in neural networks and machine learning workloads.

---

## Key Components

### ALU
Supports arithmetic and logical operations:
- ADD
- SUB
- AND
- OR
- XOR

### Register File
- 32 registers
- 32-bit width
- dual read ports
- single write port

### AI Accelerator
Performs vector dot-product computation:

result = a0×b0 + a1×b1 + a2×b2 + a3×b3

Used for accelerating neural network operations.

---

## Pipeline Stages

| Stage | Module |
|------|------|
| Instruction Fetch | pipeline_if.v |
| Instruction Decode | pipeline_id.v |
| Execute | pipeline_ex.v |
| Memory | pipeline_mem.v |
| Write Back | pipeline_wb.v |

---

## Simulation

Compile the system:iverilog -o cpu_sim tb/tb_system.v rtl/*.v

Run simulation:vvp cpu_sim

Open waveform viewer:surfer system.vcd

---

## Project Structure

AI_RISCV_Processor
├── rtl
├── tb
├── docs
├── simulation
└── README.md

---

## Technologies Used

- Verilog HDL
- Icarus Verilog
- Surfer waveform viewer
- Digital processor architecture

---

## Future Improvements

- Full RISC-V instruction decoder
- Hazard detection and forwarding
- Branch prediction
- Matrix multiplication accelerator
- Integration with RISC-V ISA extensions

---

## Author

Rajat Nair  
Electronics & Instrumentation Engineering  
VIT Vellore


