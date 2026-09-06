# Week 2: Logic Gate & Adder

서울시립대학교 전자전기컴퓨터공학 설계 및 실험 II - 2주차 Verilog 소스 코드 및 시뮬레이션 테스트벤치입니다.

---

## 📌 모듈 목록 (Modules)

| 모듈명 | 설명 | 구현 방식 | 소스 디렉토리 |
| :--- | :--- | :--- | :--- |
| `logic_gate_top` | 2-Input 5-Output Logic Gates (AND, OR, XOR, NOR, NAND) | Continuous Assign | [`N02_logic_gate/`](./N02_logic_gate/) |
| `half_adder_logic` | Half Adder (논리식 기반) | Dataflow (`assign`) | [`half_adder_logic/`](./half_adder_logic/) |
| `half_adder_case` | Half Adder (`case`문 기반) | Behavioral (`always`) | [`half_adder_case/`](./half_adder_case/) |
| `full_adder` | Full Adder (Half Adder 서브모듈 계층 설계) | Structural (Sub-module) | [`full_adder/`](./full_adder/) |

---

## 🔬 시뮬레이션 테스트벤치 (Testbenches)

- `tb_logic_gate.v`: 2-input 5-output 게이트 진리표 파형 검증 (`2'b00` ~ `2'b11`)
- `tb_half_adder_logic.v`: 논리식 기반 Half Adder 파형 검증 (`2'b00` ~ `2'b11`)
- `tb_half_adder_case.v`: `case`문 기반 Half Adder 파형 검증 (`2'b00` ~ `2'b11`)
- `tb_full_adder.v`: Full Adder 3비트 입력 파형 검증 (`3'b000` ~ `3'b111`)
