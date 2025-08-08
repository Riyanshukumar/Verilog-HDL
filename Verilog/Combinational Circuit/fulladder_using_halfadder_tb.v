`timescale 1ns/1ns
`include "fullAdder_using_halfadder.v"

module fulladder_using_halfadder_tb;
    reg a, b, c;
    wire sum, carry;

    full_adder G1(.A(a), .B(b), .C(c), .Sum(sum), .Carry(carry));
      always @(sum or carry) begin
        $display("time=%d: %b + %b + %b = %b, carry = %b", $time, a, b, c, sum, carry);
    end

    initial begin
        $dumpfile("fulladder_using_halfadder_tb.vcd");
        $dumpvars(0, fulladder_using_halfadder_tb);
        a = 1'b0; b = 1'b0; c = 1'b0; #20;
        a = 1'b0; b = 1'b0; c = 1'b1; #20;
        a = 1'b0; b = 1'b1; c = 1'b0; #20;
        a = 1'b0; b = 1'b1; c = 1'b1; #20;
        a = 1'b1; b = 1'b0; c = 1'b0; #20;
        a = 1'b1; b = 1'b0; c = 1'b1; #20;
        a = 1'b1; b = 1'b1; c = 1'b0; #20;
        a = 1'b1; b = 1'b1; c = 1'b1; #20;

        $display("Simulation complete");
    end

endmodule