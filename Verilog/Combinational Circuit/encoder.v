/*module Encoder8to3(A, D);
    input [7:0] A;
    output wire [2:0] D;
    
    assign D[0] = A[1] | A[3] | A[5] | A[7];
    assign D[1] = A[2] | A[3] | A[6] | A[7];
    assign D[2] = A[4] | A[5] | A[6] | A[7];

endmodule*/

module Encoder8to3 (
    input [7:0] A,  // 8 input lines
    output reg [2:0] D  // 3 output lines
);

always @(*) begin
    case (A)
        8'b00000001: D = 3'b000;
        8'b00000010: D = 3'b001;
        8'b00000100: D = 3'b010;
        8'b00001000: D = 3'b011;
        8'b00010000: D = 3'b100;
        8'b00100000: D = 3'b101;
        8'b01000000: D = 3'b110;
        8'b10000000: D = 3'b111;
        default: D = 3'bxxx; // For invalid or multiple inputs
    endcase
end
endmodule

/*module Encoder4to2(
    input [3:0] A,
    output reg [1:0] D
);
 always @(*) begin
    case (A)
        4'b0001: D = 2'b00;
        4'b0010: D = 2'b01;
        4'b0100: D = 2'b10;
        4'b1000: D = 2'b11;
        default: D = 2'bxx; // For invalid or multiple inputs
    endcase
end
endmodule*/

module Encoder4to2(A, D);
    input[3:0] A;
    output wire[1:0] D;
    
    assign D[0] = A[1] | A[3];
    assign D[1] = A[2] | A[3];

endmodule    

module Encoder2to1(
    input [1:0] A,
    output reg D
);
 always @(*) begin
    case (A)
        2'b01: D = 1'b0;
        2'b10: D = 1'b1;
        default: D = 1'bx; // For invalid or multiple inputs
    endcase
end
endmodule
