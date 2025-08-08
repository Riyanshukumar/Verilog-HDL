`timescale 1ns/1ns
`include "fullSub.v"

module fullSubtractor_tb;
    reg a, b, c;
    wire diff, borrow;

    full_Subtractor G1(.A(a), .B(b), .Cin(c), .Diff(diff), .Borrow(borrow));
      always @(diff or borrow) begin
        $display("time=%d: %b - %b - %b = %b, borrow = %b", $time, a, b, c, diff, borrow);
    end

    initial begin
        $dumpfile("fullSubtractor_tb.vcd");
        $dumpvars(0, fullSubtractor_tb);
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