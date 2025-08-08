`timescale 1ps/1ps
`include "DeMux.v"

module DeMux_1to4_tb;
    reg I;   
    reg [1:0] S;
    wire [3:0] O;

    DeMux_1to4 UUT(.in(I), .sel(S), .out(O));
    initial begin
        $dumpfile("DeMux_1to4_tb.vcd");
        $dumpvars(0, DeMux_1to4_tb);
        $monitor("time=%d: I=%b, S=%b, O=%b", $time, I, S, O);

        I = 1'b0;
        S = 2'b00;
        #10;
        I = 1'b0;
        S = 2'b01;
        #10;
        I = 1'b0;
        S = 2'b10;
        #10;
        I = 1'b0;
        S = 2'b11;
        #10;
        I = 1'b1;
        S = 2'b00;
        #10;
        I = 1'b1;
        S = 2'b01;
        #10;
        I = 1'b1;
        S = 2'b10;
        #10;
        I = 1'b1;
        S = 2'b11;
        #10;
        $finish;
    end
endmodule