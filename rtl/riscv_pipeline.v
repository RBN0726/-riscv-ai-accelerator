module riscv_pipeline(

    input clk,
    input reset

);

wire [31:0] instruction;
wire [31:0] pc;

wire [4:0] rs1;
wire [4:0] rs2;
wire [4:0] rd;

wire [3:0] alu_op;

pipeline_if IF_stage(
    .clk(clk),
    .reset(reset),
    .instruction(instruction),
    .pc(pc)
);

pipeline_id ID_stage(
    .instruction(instruction),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),
    .alu_op(alu_op)
);

endmodule

