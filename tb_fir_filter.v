// tb_fir_filter.v
`timescale 1ns/1ps

module tb_fir_filter;
    reg clk;
    reg reset;
    reg signed [15:0] x_in;
    wire signed [31:0] y_out;

    fir_filter uut (
        .clk(clk),
        .reset(reset),
        .x_in(x_in),
        .y_out(y_out)
    );

    // Clock
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Stimulus
    initial begin
        $dumpfile("fir_wave.vcd");
        $dumpvars(0, tb_fir_filter);
        $monitor("Time=%t | x_in=%d | y_out=%d", $time, x_in, y_out);

        reset = 1; 
        x_in = 0;
        #10; 
        reset = 0;

        #10; 
        x_in = 1;
        #10; 
        x_in = 2;
        #10; 
        x_in = 3;
        #10; 
        x_in = 4;
        #10; 
        x_in = 5;
        #10; 
        x_in = 6;
        #10; 
        x_in = 0;
        #50; 
        $finish;
    end
endmodule
