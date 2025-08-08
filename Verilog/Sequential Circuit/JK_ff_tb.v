`timescale 1ps/1ps
`include "JK_ff.v"

module JK_ff_tb;
    reg J, K, CLK, CLR, PR;
    wire Q, Q_bar;

    JK_ff UUT(.J(J), .K(K), .CLK(CLK), .CLR(CLR), .PR(PR), .Q(Q), .Q_bar(Q_bar));

    initial begin
        CLK = 1'b0;
        forever #5 CLK = ~CLK;
    end

    initial begin
        $dumpfile("JK_ff_tb.vcd");
        $dumpvars(0, JK_ff_tb);
        $monitor("time=%d: J=%b, K=%b, CLK=%b, CLR=%b, PR=%b, Q=%b, Q_bar=%b", $time, J, K, CLK, CLR, PR, Q, Q_bar);

        J = 1'b1; K = 1'b0; CLR = 1'b0; PR = 1'b0; #10;
        J = 1'b0; K = 1'b1; CLR = 1'b0; PR = 1'b0; #10;
        J = 1'b1; K = 1'b1; CLR = 1'b0; PR = 1'b0; #10;
        J = 1'b0; K = 1'b0; CLR = 1'b1; PR = 1'b0; #10;
        J = 1'b0; K = 1'b0; CLR = 1'b0; PR = 1'b1; #10;
        J = 1'b0; K = 1'b0; CLR = 1'b0; PR = 1'b0; #10;
        $display("Simulation complete");

        $finish;
    end
    
endmodule