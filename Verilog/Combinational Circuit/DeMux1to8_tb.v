`timescale 1ps/1ps
`include "DeMux.v"

module DeMux_1to8_tb;
    reg I;
    reg [2:0] S;
    wire [7:0] O;

    DeMux_1to8 UUT(.in(I), .sel(S), .out(O));
    initial begin
        $dumpfile("DeMux_1to8_tb.vcd");
        $dumpvars(0, DeMux_1to8_tb);
        $monitor("time=%d: I=%b, S=%b, O=%b", $time, I, S, O);

        I = 1'b0; S = 3'b000; #10;
        I = 1'b0; S = 3'b001; #10;
        I = 1'b0; S = 3'b010; #10;
        I = 1'b0; S = 3'b011; #10;
        I = 1'b0; S = 3'b100; #10;
        I = 1'b0; S = 3'b101; #10;
        I = 1'b0; S = 3'b110; #10;
        I = 1'b0; S = 3'b111; #10;
        I = 1'b1; S = 3'b000; #10;
        I = 1'b1; S = 3'b001; #10;
        I = 1'b1; S = 3'b010; #10;
        I = 1'b1; S = 3'b011; #10;
        I = 1'b1; S = 3'b100; #10;
        I = 1'b1; S = 3'b101; #10;
        I = 1'b1; S = 3'b110; #10;
        I = 1'b1; S = 3'b111; #10;

        $finish;
    end
endmodule


