`timescale 1ps/1ps
`include "Shift_Register.v"

module SISO_tb;
    reg in, clk, rst;
    wire out;

    SISO_register UUT(.in(in), .clk(clk), .rst(rst), .out(out));

    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end
    initial begin 
        $dumpfile("SISO_tb.vcd");
        $dumpvars(0, SISO_tb);
        $monitor("time=%d: in=%b, clk=%b, rst=%b, out=%b", $time, in, clk, rst, out);

        in = 1'b0; rst = 1'b1; #10; //initialise the signal

        in = 1'b1; rst = 1'b0; #10;
        in = 1'b0; rst = 1'b0; #10;
        in = 1'b1; rst = 1'b0; #10;
        in = 1'b1; rst = 1'b0; #10;   
            rst = 1'b1; #10;
        in = 1'b1; rst = 1'b0; #10;
        in = 1'b0; rst = 1'b0; #10;
        in = 1'b1; rst = 1'b0; #10;
        in = 1'b0; rst = 1'b0; #10;
        
        $display("Simulation complete");

        $finish;
    end
endmodule