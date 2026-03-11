module riscv_core(

    input clk,
    input start,

    input [4:0] rs1,
    input [4:0] rs2,
    input [4:0] rd,

    input [3:0] alu_op,
    input use_ai,

    input we,
    input [31:0] write_data,

    output [31:0] result_out

);

wire [31:0] reg1;
wire [31:0] reg2;

wire [31:0] alu_result;
wire [31:0] ai_result;

wire ai_done;

reg [31:0] final_result;


// Register File
register_file rf(
    .clk(clk),
    .we(we),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),
    .wd(write_data),
    .rd1(reg1),
    .rd2(reg2)
);


// ALU
alu alu_unit(
    .a(reg1),
    .b(reg2),
    .alu_op(alu_op),
    .result(alu_result)
);


// AI Accelerator
ai_accelerator ai_unit(
    .clk(clk),
    .start(start),
    .vector_a(reg1),
    .vector_b(reg2),
    .result(ai_result),
    .done(ai_done)
);


// Result Selection
always @(*) begin

    if(use_ai)
        final_result = ai_result;
    else
        final_result = alu_result;

end

assign result_out = final_result;

endmodule

