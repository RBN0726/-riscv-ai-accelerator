module ai_accelerator(
    input clk,
    input start,
    input [31:0] vector_a,
    input [31:0] vector_b,
    output reg [31:0] result,
    output reg done
);

wire [7:0] a0 = vector_a[7:0];
wire [7:0] a1 = vector_a[15:8];
wire [7:0] a2 = vector_a[23:16];
wire [7:0] a3 = vector_a[31:24];

wire [7:0] b0 = vector_b[7:0];
wire [7:0] b1 = vector_b[15:8];
wire [7:0] b2 = vector_b[23:16];
wire [7:0] b3 = vector_b[31:24];

always @(posedge clk) begin

    if(start) begin
        result <= (a0*b0) + (a1*b1) + (a2*b2) + (a3*b3);
        done <= 1;
    end
    else begin
        done <= 0;
    end

end

endmodule

