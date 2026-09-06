`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 과제 6.5: Half Adder (논리식 기반) 시뮬레이션 테스트벤치
//////////////////////////////////////////////////////////////////////////////////

module tb_half_adder_logic;
    reg DIP1, DIP2;
    wire LED1, LED2;

    half_adder_logic uut (
        .DIP1(DIP1),
        .DIP2(DIP2),
        .LED1(LED1),
        .LED2(LED2)
    );

    initial begin
        DIP1 = 0; DIP2 = 0; #20;
        DIP1 = 0; DIP2 = 1; #20;
        DIP1 = 1; DIP2 = 0; #20;
        DIP1 = 1; DIP2 = 1; #20;
        $finish;
    end
endmodule
