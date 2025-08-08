module SISO_register (in, clk, rst, out);
    input wire in;
    input clk, rst;
    output wire out; // it is a 4-bit register
    
    reg [3:0] shift_reg;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            shift_reg <= 4'b0000;
        end else begin
            shift_reg <= {shift_reg[2:0], in};
        end
    end
    
   assign out = shift_reg[3];

endmodule