`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: half_adder_case
// Description: Half Adder implementation using case behavioral statement
//////////////////////////////////////////////////////////////////////////////////

module half_adder_case (
    input  wire DIP1, // Input A
    input  wire DIP2, // Input B
    output reg  LED1, // Sum
    output reg  LED2  // Carry
);

    always @(*) begin
        case ({DIP1, DIP2})
            2'b00: begin
                LED1 = 1'b0;
                LED2 = 1'b0;
            end
            2'b01: begin
                LED1 = 1'b1;
                LED2 = 1'b0;
            end
            2'b10: begin
                LED1 = 1'b1;
                LED2 = 1'b0;
            end
            2'b11: begin
                LED1 = 1'b0;
                LED2 = 1'b1;
            end
            default: begin
                LED1 = 1'b0;
                LED2 = 1'b0;
            end
        endcase
    end

endmodule
