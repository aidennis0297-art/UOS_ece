`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: tb_full_adder
// Description: Testbench for full_adder module (3-bit input sweep)
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
        for (i = 0; i < 8; i = i + 1) begin
            {DIP1, DIP2, DIP3} = i[2:0];
            #20;
        end
        $finish;
    end
endmodule
