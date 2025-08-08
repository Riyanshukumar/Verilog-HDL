`timescale 1ns/1ns
`include "halfAdder.v"

module halfAdder_tb;
    reg a, b;
    wire sum, carry;

    halfAdder G1(.a(a), .b(b), .sum(sum), .carry(carry));
    always @(*) begin
        $display("time=%d: %b + %b = %b %b", $time, a, b, sum, carry);
    end

    initial begin
        $dumpfile("halfAdder_tb.vcd");
        $dumpvars(0, halfAdder_tb);
        a = 1'b0; b = 1'b0; #20;
        a = 1'b0; b = 1'b1; #20;
        a = 1'b1; b = 1'b0; #20;
        a = 1'b1; b = 1'b1; #20;
        $display("Simulation complete");
    end
endmodule