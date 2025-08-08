`timescale 1ps/1ps
`include "MultiplexerCases.v"

module mux8to1_case_tb;
   reg [7:0] I;
    reg [2:0] S;
    wire O;

    mux8to1_case UUT(.in(I), .sel(S), .out(O));
        initial begin
            $dumpfile("mux8to1_case_tb.vcd");
            $dumpvars(0, mux8to1_case_tb);
            $monitor("time=%d: I=%b, S=%b, O=%b", $time, I, S, O);  
            I = 8'b00000000;
            S = 3'b000;
            #10;
            I = 8'b00000001;
            S = 3'b000;
            #10;
            I = 8'b00000010;
            S = 3'b001;
            #10;
            I = 8'b00000100;
            S = 3'b010;
            #10;
            I = 8'b00001000;
            S = 3'b011;
            #10;
            I = 8'b00010000;
            S = 3'b100;
            #10;
            I = 8'b00100000;
            S = 3'b101;
            #10;
            I = 8'b01000000;
            S = 3'b110;
            #10;
            I = 8'b10000000;
            S = 3'b111;
            #10;

            $finish;
        end
endmodule
 