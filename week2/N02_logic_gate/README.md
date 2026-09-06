# Week 2 예비과제 6.3: 2-input 5-output Logic Gate

## 1. 개요
2개의 입력(DIP switch 1, 2)을 받아 5개의 기본 논리 연산(AND, OR, XOR, NOR, NAND)을 수행하고, 결과를 5개의 LED(LED1 ~ LED5)로 출력하는 Verilog 모듈 설계 및 검증 과제입니다.

## 2. 입출력 핀 맵핑 (FPGA: Spartan-7 xc7s75fgga484-1)

| Signal Name | Port Type | Target Device | Pin Number | I/O Standard | 기능 / 연산 |
| :--- | :--- | :--- | :--- | :--- | :--- |
| `DIP1` | Input | DIP Switch 1 | `Y1` | LVCMOS33 | 입력 A |
| `DIP2` | Input | DIP Switch 2 | `W3` | LVCMOS33 | 입력 B |
| `LED1` | Output | LED 1 | `L4` | LVCMOS33 | **AND** (`DIP1 & DIP2`) |
| `LED2` | Output | LED 2 | `M4` | LVCMOS33 | **OR** (`DIP1 \| DIP2`) |
| `LED3` | Output | LED 3 | `M2` | LVCMOS33 | **XOR** (`DIP1 ^ DIP2`) |
| `LED4` | Output | LED 4 | `N7` | LVCMOS33 | **NOR** (`~(DIP1 \| DIP2)`) |
| `LED5` | Output | LED 5 | `M7` | LVCMOS33 | **NAND** (`~(DIP1 & DIP2)`) |

## 3. 진리표 (Truth Table)

| DIP1 | DIP2 | LED1 (AND) | LED2 (OR) | LED3 (XOR) | LED4 (NOR) | LED5 (NAND) |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| 0 | 0 | 0 | 0 | 0 | 1 | 1 |
| 0 | 1 | 0 | 1 | 1 | 0 | 1 |
| 1 | 0 | 0 | 1 | 1 | 0 | 1 |
| 1 | 1 | 1 | 1 | 0 | 0 | 0 |

## 4. 파일 구성
- **설계 소스 코드**: [`N02_logic_gate.srcs/sources_1/new/logic_gate1.v`](./N02_logic_gate.srcs/sources_1/new/logic_gate1.v)
  - `logic_gate_top` 모듈 정의
- **시뮬레이션 테스트벤치**: [`N02_logic_gate.srcs/sources_1/new/logic_table.v`](./N02_logic_gate.srcs/sources_1/new/logic_table.v)
  - `tb_logic_gate` 테스트벤치 (`2'b00` ~ `2'b11` 파형 검증)
- **제약 파일 (Constraints)**: [`N02_logic_gate.srcs/constrs_1/new/logic_gate1.xdc`](./N02_logic_gate.srcs/constrs_1/new/logic_gate1.xdc)
  - 보드 핀 맵핑 및 IOSTANDARD 설정
- **프로젝트 파일**: [`N02_logic_gate.xpr`](./N02_logic_gate.xpr)
