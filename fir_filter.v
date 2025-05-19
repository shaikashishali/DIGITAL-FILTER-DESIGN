module fir_filter(
    input clk,
    input reset,
    input signed [15:0] x_in,
    output reg signed [31:0] y_out
);

    reg signed [15:0] shift_reg0, shift_reg1, shift_reg2, shift_reg3;
    wire signed [31:0] mult0, mult1, mult2, mult3;

    assign mult0 = shift_reg0 * 16'sd1;
    assign mult1 = shift_reg1 * 16'sd2;
    assign mult2 = shift_reg2 * 16'sd3;
    assign mult3 = shift_reg3 * 16'sd4;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            shift_reg0 <= 0;
            shift_reg1 <= 0;
            shift_reg2 <= 0;
            shift_reg3 <= 0;
            y_out <= 0;
        end else begin
            shift_reg3 <= shift_reg2;
            shift_reg2 <= shift_reg1;
            shift_reg1 <= shift_reg0;
            shift_reg0 <= x_in;

            y_out <= mult0 + mult1 + mult2 + mult3;
        end
    end
endmodule
