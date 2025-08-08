`timescale 1ps/1ps
`include "encoder.v"

module Encoder4to2_tb;
    reg [3:0] A;
    wire [1:0] D;

    Encoder4to2 UUT(.A(A), .D(D));
    initial begin
        $dumpfile("encoder4to2_tb.vcd");
        $dumpvars(0, Encoder4to2_tb);
        $monitor("time=%d: %b = %b", $time, A, D);
        A = 4'b0001; #20;
        A = 4'b0010; #20;
        A = 4'b0100; #20;
        A = 4'b1000; #20;
        A = 4'b0000; #20;
        $display("Simulation complete");
    end
endmodule