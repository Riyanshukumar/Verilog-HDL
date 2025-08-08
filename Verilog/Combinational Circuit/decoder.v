module decoder3to8(A, D);
    input [2:0] A;
    output wire [7:0] D;

    assign D[0] = ~A[2] & ~A[1] & ~A[0];
    assign D[1] = ~A[2] & ~A[1] & A[0];
    assign D[2] = ~A[2] & A[1] & ~A[0];
    assign D[3] = ~A[2] & A[1] & A[0];
    assign D[4] = A[2] & ~A[1] & ~A[0];
    assign D[5] = A[2] & ~A[1] & A[0];
    assign D[6] = A[2] & A[1] & ~A[0];
    assign D[7] = A[2] & A[1] & A[0];

endmodule

module decoder2to4(A, D);
    input [1:0] A;
    output wire [3:0] D;

    assign D[0] = ~A[1] & ~A[0];
    assign D[1] = ~A[1] & A[0];
    assign D[2] = A[1] & ~A[0];
    assign D[3] = A[1] & A[0];

   /* wire [3:0] W;
    decoder1to2 G1(.A(A[0]), .D(W[3:2]));
    decoder1to2 G2(.A(A[1]), .D(W[1:0]));

    assign D[3] = W[3] & W[1];
    assign D[2] = W[2] & W[1];
    assign D[1] = W[3] & W[0];
    assign D[0] = W[2] & W[0];*/

endmodule

module decoder1to2(A, D);
    input A;
    output [1:0] D;

    assign D[0] = ~A;
    assign D[1] = A;

endmodule    