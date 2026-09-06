`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 과제 6.9: Full Adder (Half Adder 서브모듈을 이용한 구현)
//
// 입력: DIP switch 1, 2, 3 (A, B, Cin)
// 출력: LED 1 (Sum), LED 2 (Cout)
//
// 교안 37~38페이지의 계층 구조 (Sub-module) 설계 적용:
//  - HA 2개 (u1, u2) 와 1개의 OR 게이트로 Full Adder 구성
//////////////////////////////////////////////////////////////////////////////////

// 1. Sub-module: Half Adder (HA)
module HA (
    input  wire x,
    input  wire y,
    output wire s,
    output wire c
);
    assign s = x ^ y;
    assign c = x & y;
endmodule

// 2. Top module: Full Adder
module full_adder (
    input  wire DIP1, // 입력 A   (Switch 1, Y1)
    input  wire DIP2, // 입력 B   (Switch 2, W3)
    input  wire DIP3, // 입력 Cin (Switch 3, U2)
    output wire LED1, // 출력 Sum (LED 1, L4)
    output wire LED2  // 출력 Cout(LED 2, M4)
);

    wire s1, c1, c2;

    // 첫 번째 Half Adder: A와 B의 덧셈
    HA u1 (
        .x(DIP1),
        .y(DIP2),
        .s(s1),
        .c(c1)
    );

    // 두 번째 Half Adder: (A+B의 중간합 s1)과 Cin의 덧셈
    HA u2 (
        .x(s1),
        .y(DIP3),
        .s(LED1), // 최종 Sum
        .c(c2)
    );

    // 자리올림수(Carry-out) 병합
    assign LED2 = c1 | c2;

endmodule
