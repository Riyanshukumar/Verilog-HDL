`timescale 1 ns/ 1 ns
`include "two_bit_comp.v"

module two_bit_comp_tb;
    reg [1:0] A, B;
    wire F;

    comp G1(A, B, F);
    always @(F) begin
        $display("time=%d: %b > %b = %b", $time, A, B, F);
    end

    initial begin
        $dumpfile("two_bit_comp_tb.vcd");
        $dumpvars(0, two_bit_comp_tb);
        A = 2'b00; B = 2'b00; #20;
        A = 2'b00; B = 2'b01; #20;
        A = 2'b00; B = 2'b10; #20;
        A = 2'b00; B = 2'b11; #20;
        A = 2'b10; B = 2'b00; #20;
        A = 2'b10; B = 2'b01; #20;
        A = 2'b10; B = 2'b10; #20;
        A = 2'b10; B = 2'b11; #20;
        A = 2'b11; B = 2'b10; #20;
        $display("Simulation complete");
    end
endmodule    