`timescale 1ns/1ns
`include "BCD.v"

module BCD_tb;
    reg clk, rst;
    wire [3:0] out;
    wire q0, q1, q2, q3;
    
    BCD UUT(.clk(clk), .rst(rst), .out(out), .q0(q0), .q1(q1), .q2(q2), .q3(q3));
    
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end
    
    initial begin
        $dumpfile("BCD_tb.vcd");
        $dumpvars(0, BCD_tb);
        $monitor("time=%d: clk=%b, rst=%b, out=%b, q0=%b, q1=%b, q2=%b, q3=%b", $time, clk, rst, out, q0, q1, q2, q3);

        rst = 1'b1; #10;
        rst = 1'b0; #100;
        
        $display("Simulation complete");
        $finish;
    end
endmodule