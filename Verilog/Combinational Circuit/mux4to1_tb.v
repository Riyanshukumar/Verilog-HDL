`timescale 1ps/1ps
`include "Multiplexer.v"

module mux_4to1_tb;
   reg [3:0] I;
   reg [1:0] S;
   wire O;

    mux_4to1 UUT(.In(I), .Sel(S), .Out(O));

    initial begin
        $dumpfile("mux_4to1_tb.vcd");
        $dumpvars(0, mux_4to1_tb);
        $monitor("time=%d: I=%b, S=%b, O=%b", $time, I, S, O);

        I = 4'b0000;
        S = 2'b00;
        #10;
        I = 4'b0001;
        S = 2'b00;
        #10;
        I = 4'b0010;
        S = 2'b00;
        #10;
        I = 4'b0011;
        S = 2'b00;
        #10;
        I = 4'b0000;
        S = 2'b01;
        #10;
        I = 4'b0001;
        S = 2'b01;
        #10;
        I = 4'b0010;
        S = 2'b01;
        #10;
        I = 4'b0011;
        S = 2'b01;
        #10;
        I = 4'b1111;
        S = 2'b10;
        #10;
        I = 4'b0001;
        S = 2'b10;
        #10;
        I = 4'b0010;
        S = 2'b10;
        #10;
        I = 4'b0011;
        S = 2'b10;
        #10;
        I = 4'b1111;
        S = 2'b11;
        #10;
        I = 4'b0001;
        S = 2'b11;
        #10;
        end
endmodule    
