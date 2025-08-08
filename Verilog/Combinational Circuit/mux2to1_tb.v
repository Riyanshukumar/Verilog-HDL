`timescale 1ps/1ps
`include "Multiplexer.v"

module mux_2to1_tb;
  reg [1:0] I;
  reg S;
  wire O;

  mux_2to1 UUT(.in(I), .sel(S), .out(O));

  initial begin
    $dumpfile("mux_2to1_tb.vcd");
    $dumpvars(0, mux_2to1_tb);

    $monitor("time=%d: I=%b, S=%b, O=%b", $time, I, S, O);

    I = 2'b00;
    S = 1'b0;
    #10;
    I = 2'b01;
    S = 1'b0;
    #10;
    I = 2'b10;
    S = 1'b0;
    #10;
    I = 2'b11;
    S = 1'b0;
    #10;
    I = 2'b00;
    S = 1'b1;
    #10;
    I = 2'b01;
    S = 1'b1;
    #10;
    I = 2'b10;
    S = 1'b1;
    #10;
    I = 2'b11;
    S = 1'b1;
    #10;
    $finish;
  end
endmodule