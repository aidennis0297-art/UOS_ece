`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/09/06 21:38:10
// Design Name: 
// Module Name: logic_table
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module tb_logic_gate;
reg DIP1, DIP2;
wire LED1, LED2, LED3, LED4, LED5;

logic_gate_top uut (
    .DIP1(DIP1),
    .DIP2(DIP2),
    .LED1(LED1),
    .LED2(LED2),
    .LED3(LED3),
    .LED4(LED4),
    .LED5(LED5)
);

initial begin
    DIP1 = 0; DIP2 = 0;
    #20;
    DIP1 = 0; DIP2 = 1;
    #20;
    DIP1 = 1; DIP2 = 0;
    #20;
    DIP1 = 1; DIP2 = 1;
    #20;
    $finish;
end
endmodule
