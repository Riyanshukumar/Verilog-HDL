`timescale 1ps/1ps
`include "DeMux.v"

module DeMux_1to2_tb;
    reg I;
    reg S;
    wire [1:0] O;

    DeMux_1to2 UUT(.in(I), .sel(S), .out(O));   
    initial begin
        $dumpfile("DeMux_1to2_tb.vcd");
        $dumpvars(0, DeMux_1to2_tb);
        $monitor("time=%d: I=%b, S=%b, O=%b", $time, I, S, O);

        I = 1'b0;
        S = 1'b0;
        #10;
        I = 1'b0;
        S = 1'b1;
        #10;
        I = 1'b1;
        S = 1'b0;
        #10;
        I = 1'b1;
        S = 1'b1;
        #10;
        $finish;
    end
endmodule