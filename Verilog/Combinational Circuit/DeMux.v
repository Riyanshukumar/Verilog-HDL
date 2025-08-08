module DeMux_1to8(in, sel, out);
    input in;
    input [2:0] sel;
    output reg [7:0] out;
   
    always @(*) begin
        case(sel)
            3'b000: out = 8'b00000001;
            3'b001: out = 8'b00000010;
            3'b010: out = 8'b00000100;
            3'b011: out = 8'b00001000;
            3'b100: out = 8'b00010000;
            3'b101: out = 8'b00100000;
            3'b110: out = 8'b01000000;
            3'b111: out = 8'b10000000;
            default: out = 8'b00000000;
        endcase

        // Set the appropriate output based on the select signal
        out = out & {8{in}};
    end  
endmodule

module DeMux_1to4(in, sel, out);
    input in;
    input [1:0] sel;
    output reg [3:0] out;
    
    always @(*) begin
        case(sel)
            2'b00: out = 4'b0001;
            2'b01: out = 4'b0010;
            2'b10: out = 4'b0100;
            2'b11: out = 4'b1000;
            default: out = 4'b0000;
        endcase

        // Set the appropriate output based on the select signal
        out = out & {4{in}};
    end
    
    /*always @(*) begin
        case(sel)
            2'b00: out = {3'b000, in};
            2'b01: out = {2'b00, in, 1'b0};
            2'b10: out = {1'b0, in, 2'b00};
            2'b11: out = {in, 3'b000};
            default: out = 4'bxxxx;
        endcase
    end*/

endmodule
    

module DeMux_1to2(in, sel, out);
    input in;
    input sel;
    output reg [1:0] out;
    
    always @(*) begin
        case(sel)
            1'b1: out = {in, 1'b0};
            1'b0: out = {1'b0, in};
            default: out = 2'bxx;
        endcase
    end
    
endmodule