`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: half_adder_logic
// Description: Half Adder implementation using boolean logic expressions
//////////////////////////////////////////////////////////////////////////////////

module half_adder_logic (
    input  wire DIP1, // Input A
    input  wire DIP2, // Input B
    output wire LED1, // Sum
    output wire LED2  // Carry
);

    assign LED1 = DIP1 ^ DIP2; // Sum
    assign LED2 = DIP1 & DIP2; // Carry

endmodule
