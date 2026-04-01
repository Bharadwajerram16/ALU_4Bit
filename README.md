# 🔧 4-Bit ALU Design in Verilog

## Overview
This project implements a **4-bit Arithmetic Logic Unit (ALU)** using Verilog.
The ALU performs arithmetic, logical, shift, multiplication, and division operations using a modular design approach.

---

## Features
- 4-bit CLA-based Adder/Subtractor  
- Logic Unit (AND, OR, XOR, NOT, NAND, NOR, XNOR)  
- Shifter (Left, Right, Rotate)  
- Booth Multiplier  
- Restoring Divider  
- Multiplexer-based operation selection  
- Flag Generator (Z, C, S, V)

---

## Modules

### 1. CLA (Carry Look Ahead Adder)
- Fast addition using generate & propagate logic  
- Supports carry-in and carry-out  

### 2. Logic Unit
- Performs bitwise operations:
  - AND, OR, XOR
  - NOT, NAND, NOR, XNOR  

### 3. Shifter
- Logical shift left/right  
- Rotate operations  

### 4. Booth Multiplier
- Efficient signed multiplication  
- Reduces number of partial products  

### 5. Restoring Divider
- Sequential division algorithm  
- Produces quotient and remainder  

### 6. Flag Generator
Generates status flags:
- Z (Zero) → Result is zero  
- C (Carry) → Carry out  
- S (Sign) → MSB of result  
- V (Overflow) → Signed overflow  

### 7. Top Module (ALU)
- Integrates all modules  
- Uses opcode-based selection (MUX logic inside)  

---

## Operation Selection

| Opcode | Operation |
|--------|----------|
| 000 | CLA (Add/Sub) |
| 001 | Logic Unit |
| 010 | Shifter |
| 011 | Multiplier |
| 100 | Divider |

---

## Testbenches
Each module has its own testbench:
- CLA_tb  
- Logic_unit_tb  
- shifter_tb  
- booth_multiplier_tb  
- restoring_divider_tb  
- top_module_tb  

---

## File Structure
- CLA.v  
- CLA_tb.v  
- Logic_unit.v  
- Logic_unit_tb.v  
- shifter.v  
- shifter_tb.v  
- booth_multiplier.v  
- booth_multiplier_tb.v  
- restoring_divider.v  
- restoring_divider_tb.v  
- top_module.v  
- top_module_tb.v  

---

## How to Run
1. Open project in Vivado / ModelSim  
2. Compile all `.v` files  
3. Run respective testbench  
4. Observe waveform and outputs  

---

## Key Concepts Used
- Combinational & Sequential Logic  
- Carry Look Ahead Logic  
- Booth Algorithm  
- Restoring Division Algorithm  
- Multiplexer-based ALU design  

---

## Conclusion
This project demonstrates a modular and scalable ALU design combining multiple digital design concepts.

---

## Author
Bharadwaj Erram  
ECE Student | VNR VJIET