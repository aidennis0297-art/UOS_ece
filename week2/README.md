# Week 2: Logic Gate & Adder 예비보고서 과제 모음

서울시립대학교 전자전기컴퓨터공학 설계 및 실험 II - 2주차 과제 코드 모음입니다.

---

## 📌 과제별 요약 및 바로가기

| 과제 번호 | 주제 | 구현 방식 | 폴더 링크 | 핵심 소스 파일 |
| :--- | :--- | :--- | :--- | :--- |
| **6.3** | 2-input 5-output Logic Gate | Continuous Assign (Gate Level) | [N02_logic_gate](./N02_logic_gate/) | [`logic_gate1.v`](./N02_logic_gate/N02_logic_gate.srcs/sources_1/new/logic_gate1.v) |
| **6.5** | Half Adder (논리식) | Dataflow Modeling (`assign`) | [half_adder_logic](./half_adder_logic/) | [`half_adder_logic.v`](./half_adder_logic/half_adder_logic.v) |
| **6.6** | Half Adder (case문) | Behavioral Modeling (`always`) | [half_adder_case](./half_adder_case/) | [`half_adder_case.v`](./half_adder_case/half_adder_case.v) |
| **6.9** | Full Adder (계층 설계) | Structural Modeling (Sub-module) | [full_adder](./full_adder/) | [`full_adder.v`](./full_adder/full_adder.v) |

---

## 📋 FPGA (Spartan-7 xc7s75fgga484-1) 입출력 핀 맵핑 요약

- **DIP 스위치**: DIP1 = `Y1`, DIP2 = `W3`, DIP3 = `U2`
- **LED**: LED1 = `L4`, LED2 = `M4`, LED3 = `M2`, LED4 = `N7`, LED5 = `M7`
- **I/O Standard**: `LVCMOS33` (3.3V)

---

## 💡 예비보고서 이론 질문 정답 요약 (보고서 작성용)

### 6.4 Half Adder 카르노맵 및 논리식
- **Sum (S)**: $S = \bar{A}B + A\bar{B} = A \oplus B$
- **Carry (C)**: $C = AB$

### 6.7 Synthesis 전 (6.5.1 vs 6.6.1) Schematic 차이 여부
- **답: Yes**
- **이유**: Elaborated RTL 레벨에서는 논리식으로 기술한 코드는 기본 게이트(`RTL_XOR`, `RTL_AND`) 심볼로 전개되는 반면, case문으로 기술한 코드는 조건 분기를 처리하는 멀티플렉서(`RTL_MUX`) 구조로 전개되므로 차이가 있습니다.

### 6.8 Implementation 후 (6.5.2 vs 6.6.2) Schematic 차이 여부
- **답: No**
- **이유**: 합성 및 구현의 최적화(Technology Mapping) 단계를 거치면서 입력 2개, 출력 2개의 불리언 함수는 동일한 FPGA 하드웨어 기본 단위 소자인 동일한 Look-Up Table(LUT) primitive로 최종 매핑되기 때문에 실제 회로 차이가 없습니다.
