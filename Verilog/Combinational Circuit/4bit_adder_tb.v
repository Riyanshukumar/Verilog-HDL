`timescale 1ns/1ns
`include "4bit_adder.v"

module four_bit_adder_tb;
    reg [3:0] A, B;
    reg Cin;
    wire [3:0] Sum;
    wire Cout;

    four_bit_adder G1(.A(A), .B(B), .Cin(Cin), .Sum(Sum), .Cout(Cout));
    
    initial begin
        $dumpfile("4bit_adder_tb.vcd");
        $dumpvars(0, four_bit_adder_tb);

        $monitor("time=%d: %b + %b + %b = %b, carry = %b", $time, A, B, Cin, Sum, Cout);

        A = 4'b0000; B = 4'b0000; Cin = 1'b0; #20;
        A = 4'b0000; B = 4'b0000; Cin = 1'b1; #20;
        A = 4'b0000; B = 4'b0001; Cin = 1'b0; #20;
        A = 4'b0000; B = 4'b0001; Cin = 1'b1; #20;
        A = 4'b0001; B = 4'b0000; Cin = 1'b0; #20;
        A = 4'b0001; B = 4'b0000; Cin = 1'b1; #20;
        A = 4'b0001; B = 4'b0001; Cin = 1'b0; #20;
        A = 4'b0001; B = 4'b0001; Cin = 1'b1; #20;
        A = 4'b0011; B = 4'b0011; Cin = 1'b0; #20;
        A = 4'b0011; B = 4'b0011; Cin = 1'b1; #20;
        A = 4'b0101; B = 4'b0101; Cin = 1'b0; #20;
        A = 4'b0101; B = 4'b0101; Cin = 1'b1; #20;
        A = 4'b0111; B = 4'b0111; Cin = 1'b0; #20;
        A = 4'b0111; B = 4'b0111; Cin = 1'b1; #20;
        A = 4'b1011; B = 4'b1011; Cin = 1'b0; #20;
        A = 4'b1011; B = 4'b1011; Cin = 1'b1; #20;
        A = 4'b1111; B = 4'b1111; Cin = 1'b0; #20;
        A = 4'b1111; B = 4'b1111; Cin = 1'b1; #20;

        $display("Simulation complete");
    end

endmodule