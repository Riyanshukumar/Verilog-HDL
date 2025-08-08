`timescale 1ns/1ns
`include "Ring_Counter.v"

module ring_counter_tb;
    reg clk, rst;
    wire [3:0] q;
    
    ring_counter uut(.clk(clk), .rst(rst), .q(q));
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("Ring_Counter_tb.vcd");
        $dumpvars(0, ring_counter_tb);
        $monitor("time=%d: clk=%b, rst=%b, q=%b", $time, clk, rst, q);
        rst = 0;#10;
        rst = 1;#10;
        rst = 0;#100;

        $finish;
        $display("Simulation complete");
       
    end
endmodule