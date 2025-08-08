//3 bit synchronous counter using T flip-flops

module Synchronous_3bit_counter(
    input wire clk,
    input wire rst,
    output wire [2:0] out
);

    wire t1, t2, t3;
    wire [2:0] q;

    assign t1 = 1;
    assign t2 = q[0];
    assign t3 = q[1] & q[0];

    t_ff tff1(.clk(clk), .rst(rst), .T(t1), .Q(q[0]));
    t_ff tff2(.clk(clk), .rst(rst), .T(t2), .Q(q[1]));
    t_ff tff3(.clk(clk), .rst(rst), .T(t3), .Q(q[2]));

    assign out = q;

endmodule

module t_ff(input clk, rst, T, output reg Q);

    always @(posedge clk or posedge rst) begin
        if (rst)
            Q <= 1'b0;
        else begin
            if (T)
                Q <= ~Q;
        end
    end

endmodule
