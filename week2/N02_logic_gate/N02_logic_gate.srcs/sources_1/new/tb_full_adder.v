`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 과제 6.9: Full Adder 시뮬레이션 테스트벤치
//
// 요구사항: input을 3'b000부터 3'b111까지 변경하며 파형 확인
//////////////////////////////////////////////////////////////////////////////////

module tb_full_adder;
    reg DIP1, DIP2, DIP3;
    wire LED1, LED2;

    full_adder uut (
        .DIP1(DIP1),
        .DIP2(DIP2),
        .DIP3(DIP3),
        .LED1(LED1),
        .LED2(LED2)
    );

    integer i;

    initial begin
        // 3'b000 ~ 3'b111 순차 검증 (20ns 간격)
        for (i = 0; i < 8; i = i + 1) begin
            {DIP1, DIP2, DIP3} = i[2:0];
            #20;
        end
        $finish;
    end
endmodule
