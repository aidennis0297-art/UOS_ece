# 2-Input 5-Output Logic Gate Design

## 1. Description
Spartan-7 FPGA를 이용하여 2개의 DIP 스위치 입력을 받아 5개의 기본 논리 연산(AND, OR, XOR, NOR, NAND)을 수행하고, 결과를 5개의 LED로 출력하는 RTL 모듈 설계 및 검증 프로젝트입니다.

## 2. Pin Assignment (FPGA: Spartan-7 xc7s75fgga484-1)

| Signal Name | Port Type | Target Device | Pin Number | I/O Standard | Logic Function |
| :--- | :--- | :--- | :--- | :--- | :--- |
| `DIP1` | Input | DIP Switch 1 | `Y1` | LVCMOS33 | Input A |
| `DIP2` | Input | DIP Switch 2 | `W3` | LVCMOS33 | Input B |
| `LED1` | Output | LED 1 | `L4` | LVCMOS33 | **AND** (`DIP1 & DIP2`) |
| `LED2` | Output | LED 2 | `M4` | LVCMOS33 | **OR** (`DIP1 \| DIP2`) |
| `LED3` | Output | LED 3 | `M2` | LVCMOS33 | **XOR** (`DIP1 ^ DIP2`) |
| `LED4` | Output | LED 4 | `N7` | LVCMOS33 | **NOR** (`~(DIP1 \| DIP2)`) |
| `LED5` | Output | LED 5 | `M7` | LVCMOS33 | **NAND** (`~(DIP1 & DIP2)`) |

## 3. Truth Table

| DIP1 | DIP2 | LED1 (AND) | LED2 (OR) | LED3 (XOR) | LED4 (NOR) | LED5 (NAND) |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| 0 | 0 | 0 | 0 | 0 | 1 | 1 |
| 0 | 1 | 0 | 1 | 1 | 0 | 1 |
| 1 | 0 | 0 | 1 | 1 | 0 | 1 |
| 1 | 1 | 1 | 1 | 0 | 0 | 0 |

## 4. File Structure
- **Design Source**: [`N02_logic_gate.srcs/sources_1/new/logic_gate1.v`](./N02_logic_gate.srcs/sources_1/new/logic_gate1.v)
- **Testbench**: [`N02_logic_gate.srcs/sources_1/new/logic_table.v`](./N02_logic_gate.srcs/sources_1/new/logic_table.v)
- **Constraints (XDC)**: [`N02_logic_gate.srcs/constrs_1/new/logic_gate1.xdc`](./N02_logic_gate.srcs/constrs_1/new/logic_gate1.xdc)
- **Vivado Project**: [`N02_logic_gate.xpr`](./N02_logic_gate.xpr)
