`timescale 1ps/1ps
`include "T_ff.v"   

module T_ff_tb;
    reg T, CLK, CLR;
    wire Q, Q_bar;
   
    T_ff UUT(.T(T), .CLK(CLK), .CLR(CLR), .Q(Q), .Q_bar(Q_bar));

    initial begin
        CLK = 1'b0;
        forever #5 CLK = ~CLK;
    end

    initial begin
        $dumpfile("T_ff_tb.vcd");
        $dumpvars(0, T_ff_tb);
        $monitor("time=%d: T=%b, CLK=%b, CLR=%b, Q=%b, Q_bar=%b", $time, T, CLK, CLR, Q, Q_bar);

        T = 1'b1; CLR = 1'b0; #10;
        T = 1'b0; CLR = 1'b0; #10;
        T = 1'b1; CLR = 1'b1; #10;
        T = 1'b0; CLR = 1'b0; #10;
        T = 1'b1; CLR = 1'b0; #10;
        T = 1'b0; CLR = 1'b0; #10;
        $display("Simulation complete");

        $finish;
    end
endmodule