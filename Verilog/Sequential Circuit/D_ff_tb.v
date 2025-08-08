`timescale 1ps/1ps
`include "D_ff.v"

module D_ff_tb;
    reg D, CLK, CLR;
    wire Q, Q_bar;

    D_FF UUT(.D(D), .CLK(CLK), .CLR(CLR), .Q(Q), .Q_bar(Q_bar));

     initial begin
        CLK = 1'b0;
        forever #5 CLK = ~CLK;
    end
    initial begin 
        $dumpfile("D_ff_tb.vcd");
        $dumpvars(0, D_ff_tb);
        $monitor("time=%d: D=%b, CLK=%b, CLR=%b, Q=%b, Q_bar=%b", $time, D, CLK, CLR, Q, Q_bar);

        D = 1'b1; CLR = 1'b0; #10;
        D = 1'b0; CLR = 1'b0; #10;
        D = 1'b1; CLR = 1'b1; #10;
        D = 1'b0; CLR = 1'b0; #10;
        D = 1'b1; CLR = 1'b0; #10;
        D = 1'b0; CLR = 1'b0; #10;
        $display("Simulation complete");

        $finish;
    end
endmodule