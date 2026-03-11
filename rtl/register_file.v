module register_file(
    input clk,
    input we,
    input [4:0] rs1,
    input [4:0] rs2,
    input [4:0] rd,
    input [31:0] wd,
    output [31:0] rd1,
    output [31:0] rd2
);

reg [31:0] registers [31:0];

assign rd1 = registers[rs1];
assign rd2 = registers[rs2];

always @(posedge clk) begin
    if (we && rd != 0)
        registers[rd] <= wd;
end

endmodule

