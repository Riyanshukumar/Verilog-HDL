module mux8to1_case(in, sel, out);
    input [7:0] in;
    input [2:0] sel;
    output out;
    wire out0, out1;

    mux4to1_case m1(in[3:0], sel[1:0], out0);
    mux4to1_case m2(in[7:4], sel[1:0], out1);
    mux2to1_case m3({out1, out0}, sel[2], out);

    /*always @(*)begin
        case(sel[2])
          1'b0: out = out0;
          1'b1: out = out1;
          default: out = 1'bx;
        endcase
    end*/
endmodule

module mux4to1_case(in, sel, out);
    input [3:0] in;
    input [1:0] sel;
    output reg out;
    wire out0, out1;

    mux2to1_case m1(in[1:0], sel[0], out0);
    mux2to1_case m2(in[3:2], sel[0], out1);

    always @(*)begin
        case(sel[1])
          1'b0: out = out0;
          1'b1: out = out1;
          default: out = 1'bx;
        endcase
    end
endmodule

module mux2to1_case(in, sel, out);
    input [1:0] in;
    input sel;
    output reg out;

    always @(*) begin
        case(sel)
            1'b0: out = in[0];
            1'b1: out = in[1];
            default: out = 1'bx;
        endcase
    end
endmodule