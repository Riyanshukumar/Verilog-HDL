//Asynchronous counter: in this counter the flip-flops are triggered by the output of the previous flip-flop.
//The output of the first flip-flop is connected to the clock input of the second flip-flop, the output of the second flip-flop is connected to the clock input of the third flip-flop, and so on.
// all flip-flops are triggered differently, so the counter is called asynchronous counter.

module Asynchronous_Counter(
    input wire clk,
    input wire rst,
    output wire [3:0] out,
    output reg q1, q2, q3, q4
);
    
    always @(negedge clk or posedge rst) begin
        if(rst) begin
            q1 <= 1'b0;
            q2 <= 1'b0;
            q3 <= 1'b0;
            q4 <= 1'b0;
        end
        else begin
            q1 <= ~q1;
        end
    end

    always @(negedge q1 or posedge rst) begin
        if(rst) begin
            q2 <= 1'b0;
            q3 <= 1'b0;
            q4 <= 1'b0;
        end
        else begin
            q2 <= ~q2;
        end
    end

    always @(negedge q2 or posedge rst) begin
        if(rst) begin
            q3 <= 1'b0;
            q4 <= 1'b0;
        end
        else begin
            q3 <= ~q3;
        end
    end

    always @(negedge q3 or posedge rst) begin
        if(rst) begin
            q4 <= 1'b0;
        end
        else begin
            q4 <= ~q4;
        end
    end

    assign out = {q4, q3, q2, q1};
    
endmodule