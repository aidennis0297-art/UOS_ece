module logic_gate_top (
    input  wire DIP1, DIP2,
    output wire LED1, // AND
    output wire LED2, // OR
    output wire LED3, // XOR
    output wire LED4, // NOR
    output wire LED5  // NAND
);

    assign LED1 = DIP1 & DIP2;        // AND
    assign LED2 = DIP1 | DIP2;        // OR
    assign LED3 = DIP1 ^ DIP2;        // XOR
    assign LED4 = ~(DIP1 | DIP2);     // NOR
    assign LED5 = ~(DIP1 & DIP2);     // NAND

endmodule