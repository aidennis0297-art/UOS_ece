# Week 2: Logic Gate & Adder

서울시립대학교 전자전기컴퓨터공학 설계 및 실험 II - 2주차 실습 및 설계 코드입니다.

---

## 📌 모듈 구성 (Module List)

| 모듈명 | 설명 | 구현 방식 | 위치 |
| :--- | :--- | :--- | :--- |
| `logic_gate_top` | 2-Input 5-Output Logic Gates (AND, OR, XOR, NOR, NAND) | Dataflow (`assign`) | [`N02_logic_gate/`](./N02_logic_gate/) |
| `half_adder_logic` | Half Adder (논리식 기반 설계) | Dataflow (`assign`) | [`half_adder_logic/`](./half_adder_logic/) |
| `half_adder_case` | Half Adder (조건문 기반 설계) | Behavioral (`always @(*) case`) | [`half_adder_case/`](./half_adder_case/) |
| `full_adder` | Full Adder (Half Adder 서브모듈 조합) | Structural (Sub-module) | [`full_adder/`](./full_adder/) |

---

## 📋 FPGA 핀 할당 (Spartan-7 xc7s75fgga484-1)

- **I/O Standard**: `LVCMOS33` (3.3V)
- **DIP Switch (Inputs)**:
  - `DIP1`: `Y1`
  - `DIP2`: `W3`
  - `DIP3`: `U2`
- **LED (Outputs)**:
  - `LED1`: `L4`
  - `LED2`: `M4`
  - `LED3`: `M2`
  - `LED4`: `N7`
  - `LED5`: `M7`

---

## 🔬 시뮬레이션 (Simulation)

각 모듈별로 시뮬레이션 검증을 위한 테스트벤치(`tb_*.v`)가 포함되어 있습니다:
- `tb_logic_gate.v`: `2'b00` ~ `2'b11` 입력 인가 및 5대 게이트 출력 검증
- `tb_half_adder_logic.v`: `2'b00` ~ `2'b11` 입력 인가 및 Sum / Carry 검증
- `tb_half_adder_case.v`: `2'b00` ~ `2'b11` 입력 인가 및 Sum / Carry 검증
- `tb_full_adder.v`: `3'b000` ~ `3'b111` 입력 순차 인가 및 Sum / Cout 검증
