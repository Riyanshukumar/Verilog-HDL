`timescale 1ps/1ps
`include "decoder.v"

module decoder3to8_tb;
    reg [2:0] A;
    wire [7:0] D;

    decoder3to8 G1(A, D);
    
    initial begin
        $dumpfile("decoder3to8_tb.vcd");
        $dumpvars(0, decoder3to8_tb);
        $monitor("time=%d: %b = %b", $time, A, D);

        A = 3'b000; #20;
        A = 3'b001; #20;
        A = 3'b010; #20;
        A = 3'b011; #20;
        A = 3'b100; #20;
        A = 3'b101; #20;
        A = 3'b110; #20;
        A = 3'b111; #20;
        $display("Simulation complete");
    end
endmodule