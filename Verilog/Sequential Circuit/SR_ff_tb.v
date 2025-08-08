`timescale 1ps/1ps
`include "SR_ff.v"

module SR_FF_tb;
    reg s, R, CLK;
    wire Q, Q_bar;

    SR_FF UUT(.S(s), .R(R), .CLK(CLK), .Q(Q), .Q_bar(Q_bar));
   
    initial begin
        CLK = 1'b0;
        forever #5 CLK = ~CLK;
    end

    initial begin
        $dumpfile("SR_FF_tb.vcd");
        $dumpvars(0, SR_FF_tb);
        $monitor("time=%d: S=%b, R=%b, CLK=%b, Q=%b, Q_bar=%b", $time, s, R, CLK, Q, Q_bar);

        s = 1'b1; R = 1'b0;  #10;
        s = 1'b0; R = 1'b0;  #10;
        s = 1'b0; R = 1'b1;  #10;
        s = 1'b0; R = 1'b0;  #10;
        s = 1'b1; R = 1'b1;  #10;
        s = 1'b0; R = 1'b0;  #10;
        $display("Simulation complete");

        $finish;
    end
endmodule