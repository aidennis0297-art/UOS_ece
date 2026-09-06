# UOS 전자전기컴퓨터공학 설계 및 실험 II

서울시립대학교 전자전기컴퓨터공학부 전자전기컴퓨터공학 설계 및 실험 II 실습 및 과제 저장소입니다.

## 주차별 과제 목록

### [Week 2: Logic Gate & Adder](./week2/)
- **[과제 6.3] 2-input 5-output Logic Gate** ([코드 바로가기](./week2/N02_logic_gate))
  - 2개 입력(DIP1, DIP2) $\rightarrow$ 5개 출력(AND, OR, XOR, NOR, NAND)
  - 소스 코드: [`logic_gate1.v`](./week2/N02_logic_gate/N02_logic_gate.srcs/sources_1/new/logic_gate1.v)
  - 테스트벤치: [`logic_table.v`](./week2/N02_logic_gate/N02_logic_gate.srcs/sources_1/new/logic_table.v)
  - 제약 파일 (XDC): [`logic_gate1.xdc`](./week2/N02_logic_gate/N02_logic_gate.srcs/constrs_1/new/logic_gate1.xdc)
- **[과제 6.5] Half Adder (논리식 기반 Dataflow 모델링)** ([코드 바로가기](./week2/half_adder_logic))
  - 카르노맵 유도 논리식 기반 구현 (`Sum = A ^ B`, `Carry = A & B`)
  - 소스 코드: [`half_adder_logic.v`](./week2/half_adder_logic/half_adder_logic.v)
  - 테스트벤치: [`tb_half_adder_logic.v`](./week2/half_adder_logic/tb_half_adder_logic.v)
- **[과제 6.6] Half Adder (case문 기반 Behavioral 모델링)** ([코드 바로가기](./week2/half_adder_case))
  - `case ({DIP1, DIP2})` 조건문 기반 구현
  - 소스 코드: [`half_adder_case.v`](./week2/half_adder_case/half_adder_case.v)
  - 테스트벤치: [`tb_half_adder_case.v`](./week2/half_adder_case/tb_half_adder_case.v)
- **[과제 6.9] Full Adder (Half Adder 서브모듈 계층 설계)** ([코드 바로가기](./week2/full_adder))
  - HA 모듈 2개와 OR 게이트를 조합한 계층적 설계
  - 소스 코드: [`full_adder.v`](./week2/full_adder/full_adder.v)
  - 테스트벤치: [`tb_full_adder.v`](./week2/full_adder/tb_full_adder.v) (`3'b000` ~ `3'b111` 파형 검증)
