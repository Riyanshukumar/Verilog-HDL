`timescale 1ns/1ns
`include "halfSub.v"

module halfSub_tb;
    reg A, B;
    wire diff, borrow;

    half_subtractor G1(A, B, diff, borrow);
    always @(diff or borrow) begin
        $display("time=%d: %b - %b = %b, borrow = %b", $time, A, B, diff, borrow);
    end

    initial begin
        $dumpfile("halfSub_tb.vcd");
        $dumpvars(0, halfSub_tb);
        A = 0; B = 0; #20; 
        A = 0; B = 1; #20;
        A = 1; B = 0; #20;
        A = 1; B = 1; #20;
        $display("Simulation complete");
    end
endmodule