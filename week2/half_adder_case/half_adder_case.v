`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 과제 6.6: Half Adder (case문 기반 구현)
//
// case ({DIP1, DIP2}) 동작 정의
//////////////////////////////////////////////////////////////////////////////////

module half_adder_case (
    input  wire DIP1, // 입력 A (Switch 1)
    input  wire DIP2, // 입력 B (Switch 2)
    output reg  LED1, // 출력 Sum (S)
    output reg  LED2  // 출력 Carry (C)
);

    always @(*) begin
        case ({DIP1, DIP2})
            2'b00: begin
                LED1 = 1'b0; // Sum
                LED2 = 1'b0; // Carry
            end
            2'b01: begin
                LED1 = 1'b1; // Sum
                LED2 = 1'b0; // Carry
            end
            2'b10: begin
                LED1 = 1'b1; // Sum
                LED2 = 1'b0; // Carry
            end
            2'b11: begin
                LED1 = 1'b0; // Sum
                LED2 = 1'b1; // Carry
            end
            default: begin
                LED1 = 1'b0;
                LED2 = 1'b0;
            end
        endcase
    end

endmodule
