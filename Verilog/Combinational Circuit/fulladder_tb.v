`include "fulladder.v"
module fulladder_top;
    reg a, b, c;
    wire sum, carry;

    fulladder G1(a, b, c, sum, carry);
    always @(*) begin
        $display("time=%d: %b + %b + %b = %b, carry = %b", $time, a, b, c, sum, carry);
    end
  
    initial begin
        $dumpfile("fulladder_top.vcd");
        $dumpvars(0, fulladder_top);
        a = 1'b0; b = 1'b0; c = 1'b0; #20;
        a = 1'b0; b = 1'b0; c = 1'b1; #20;
        a = 1'b0; b = 1'b1; c = 1'b0; #20;
        a = 1'b0; b = 1'b1; c = 1'b1; #20;
        a = 1'b1; b = 1'b0; c = 1'b0; #20;
        a = 1'b1; b = 1'b0; c = 1'b1; #20;
        a = 1'b1; b = 1'b1; c = 1'b0; #20;
        a = 1'b1; b = 1'b1; c = 1'b1; #20;

        $display("Simulation complete");
    end

endmodule