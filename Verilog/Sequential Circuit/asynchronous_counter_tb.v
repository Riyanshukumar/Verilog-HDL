`timescale 1ps/1ps
`include "Asynchronous_Counter.v"

module Asynchronous_Counter_tb;
    reg clk, rst;
    wire [3:0] out;
    wire q1, q2, q3, q4;

    Asynchronous_Counter UUT(.clk(clk), .rst(rst), .out(out), .q1(q1), .q2(q2), .q3(q3), .q4(q4));

    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end
    initial begin 
        $dumpfile("Asynchronous_Counter_tb.vcd");
        $dumpvars(0, Asynchronous_Counter_tb);
        $monitor("time=%d: clk=%b, rst=%b, out=%b, q1=%b, q2=%b, q3=%b, q4=%b", $time, clk, rst, out, q1, q2, q3, q4);

        rst = 1'b1; #10; //initialise the signal
        rst = 1'b0; #100;

        $finish;
        $display("Simulation complete");

      end
endmodule  