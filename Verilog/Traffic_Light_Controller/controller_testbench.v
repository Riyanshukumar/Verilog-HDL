`timescale 1ns/1ns
`include "controller_code.v"

module traffic_light_tb();
    reg clk, rst_n, c;
    wire [2:0] light_farm, light_highway;
    
    traffic_light uut(.c(c), .clk(clk), .rst_n(rst_n), .light_farm(light_farm), .light_highway(light_highway));
    
    initial begin
        clk = 0;
        forever begin
            #2 clk = ~clk;
        end
    end

    initial begin
        $dumpfile("traffic_light_tb.vcd");
        $dumpvars(0, traffic_light_tb);
        $monitor("time = %d: clk = %b, rst_n = %b, c = %b, light_farm = %b, light_highway = %b", $time, clk, rst_n, c, light_farm, light_highway);

            rst_n = 0; c = 0;
        #10 rst_n = 1; c = 0;
        #10 c = 1;
        #10 c = 0;
        #10 c = 1;
        #10 c = 0;
        #10 c = 0;
        #10 c = 1;
        #10 c = 1;
        #10 c = 1;
        #10 c = 0;

        $display("End simulation");
        $finish;
    end
endmodule