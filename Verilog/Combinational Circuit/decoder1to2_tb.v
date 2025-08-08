`timescale 1ns/1ns
`include "decoder.v"

module decoder1to2_tb;
    reg A;
    wire [1:0] D;

    decoder1to2 G1(A, D);
   
    initial begin
        $dumpfile("decoder1to2_tb.vcd");
        $dumpvars(0, decoder1to2_tb);
        $monitor("time=%d: %b = %b", $time, A, D);

        A = 1'b0; #20;
        A = 1'b1; #20;
        $display("Simulation complete");
    end
endmodule    