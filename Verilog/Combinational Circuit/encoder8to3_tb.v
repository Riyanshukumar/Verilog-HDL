`timescale 1ps/1ps
`include "encoder.v"

module Encoder8to3_tb;
  reg [7:0] A;
    wire [2:0] D;

    Encoder8to3 UUT(.A(A), .D(D));
    initial begin
        $dumpfile("encoder8to3_tb.vcd");
        $dumpvars(0, Encoder8to3_tb);
        $monitor("time=%d: %b = %b", $time, A, D);
        A = 8'b00000001; #20;
        A = 8'b00000010; #20;
        A = 8'b00000100; #20;
        A = 8'b00001000; #20;
        A = 8'b00010000; #20;
        A = 8'b00100000; #20;
        A = 8'b01000000; #20;
        A = 8'b10000000; #20;
        A = 8'b00000000; #20;
        $display("Simulation complete");
    end
endmodule