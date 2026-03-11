`timescale 1ns/1ps

module tb_system;

reg clk;
reg start;

reg [4:0] rs1;
reg [4:0] rs2;
reg [4:0] rd;

reg [3:0] alu_op;
reg use_ai;

reg we;
reg [31:0] write_data;

wire [31:0] result_out;


// Instantiate Processor
riscv_core cpu(

    .clk(clk),
    .start(start),

    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),

    .alu_op(alu_op),
    .use_ai(use_ai),

    .we(we),
    .write_data(write_data),

    .result_out(result_out)

);


// Clock generation
always #5 clk = ~clk;


initial begin

    $dumpfile("system.vcd");
    $dumpvars(0,tb_system);

    clk = 0;
    start = 0;
    we = 0;

    // Write 10 to x1
    rd = 5'd1;
    write_data = 32'd10;
    we = 1;
    #10;

    // Write 5 to x2
    rd = 5'd2;
    write_data = 32'd5;
    #10;

    we = 0;

    // ALU ADD
    rs1 = 5'd1;
    rs2 = 5'd2;
    alu_op = 4'b0000;
    use_ai = 0;

    #20;

    // AI accelerator test
    start = 1;
    use_ai = 1;

    #20;

    start = 0;

    #20;

    $finish;

end

endmodule

