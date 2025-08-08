`timescale 1ps/1ps
`include "SR_Latch.v"

module SR_Latch_tb;
    reg S, R;
    wire Q, Qn;

    SR_latch UUT(.S(S), .R(R), .Q(Q), .Qn(Qn));
    initial begin
        $dumpfile("SR_Latch_tb.vcd");
        $dumpvars(0, SR_Latch_tb);
        $monitor("time=%d: S=%b, R=%b, Q=%b, Qn=%b", $time, S, R, Q, Qn);

        S = 1'b0; R = 1'b0; #20;
        S = 1'b0; R = 1'b1; #20;
        S = 1'b1; R = 1'b0; #20;
        S = 1'b1; R = 1'b1; #20;
        $display("Simulation complete");
    end
endmodule