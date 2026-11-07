# Week 10: DAC / ADC

AD7302 DAC 실험용 Verilog 소스이다. 실제 보드의 동작과 전압은 실험에서 확인한다.

- `dac_core.v`: 버튼 입력과 8비트 DAC 쓰기 제어
- `dac_d.v`: DAC 제어용 최상위 모듈
- `dac_e.v`: DAC 제어와 7-segment 및 Text LCD 표시 기능

FPGA: `xc7s75fgga484-1`, 장비 클록: 1 kHz. SW1은 active-low 리셋, SW2는 DAC A/B 선택이다.
