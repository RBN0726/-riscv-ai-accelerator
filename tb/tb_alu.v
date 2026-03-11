`timescale 1ns/1ps

module tb_alu;

reg [31:0] a;
reg [31:0] b;
reg [3:0] alu_op;

wire [31:0] result;

alu uut(
    .a(a),
    .b(b),
    .alu_op(alu_op),
    .result(result)
);

initial begin

    $dumpfile("alu.vcd");
    $dumpvars(0, tb_alu);

    a = 10;
    b = 5;

    alu_op = 4'b0000; // ADD
    #10;

    alu_op = 4'b0001; // SUB
    #10;

    alu_op = 4'b0010; // AND
    #10;

    alu_op = 4'b0011; // OR
    #10;

    alu_op = 4'b0100; // XOR
    #10;

    $finish;

end

endmodule

