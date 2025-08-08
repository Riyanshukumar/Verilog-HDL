`timescale 1ns/1ns
`include "Synchronous_counter.v"

module Synchronous_3bit_counter_tb;
        reg clk, rst;
        wire [2:0] out;

    Synchronous_3bit_counter uut(.clk(clk), .rst(rst), .out(out));
        
        initial begin
        clk = 0;
        forever #5 clk = ~clk;
        end

    initial begin
        $dumpfile("Synchronous_3bit_counter_tb.vcd");
        $dumpvars(0, Synchronous_3bit_counter_tb);
        $monitor("time=%d: clk=%b, rst=%b, out=%b", $time, clk, rst, out);

        rst = 0; #10; //initialise the signal
        rst = 1; #10;
        rst = 0; #200;

        $finish;
        $display("Simulation complete");
    end
endmodule

