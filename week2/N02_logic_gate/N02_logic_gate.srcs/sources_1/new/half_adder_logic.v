`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 과제 6.5: Half Adder (카르노맵 유도 논리식 기반 구현)
//
// 6.4 유도 논리식:
// Sum   (S) = A ^ B  (= ~A&B | A&~B)
// Carry (C) = A & B
//////////////////////////////////////////////////////////////////////////////////

module half_adder_logic (
    input  wire DIP1, // 입력 A (Switch 1)
    input  wire DIP2, // 입력 B (Switch 2)
    output wire LED1, // 출력 Sum (S)
    output wire LED2  // 출력 Carry (C)
);

    assign LED1 = DIP1 ^ DIP2; // Sum
    assign LED2 = DIP1 & DIP2; // Carry

endmodule
