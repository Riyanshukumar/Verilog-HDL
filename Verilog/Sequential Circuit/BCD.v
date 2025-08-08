module BCD(input wire clk, rst, output wire [3:0] out, output reg q0, q1, q2, q3);

  always @(negedge clk or posedge rst) begin
    if(rst) begin
      q0 <= 1'b0;
      q1 <= 1'b0;
      q2 <= 1'b0;
      q3 <= 1'b0;
    end
    
    else begin
        if(q3 & ~q2 & ~q1 &q0) begin
            q0 <= 1'b0;
            q1 <= 1'b0;
            q2 <= 1'b0;
            q3 <= 1'b0;
        end     
    else begin
      q0 <= ~q0;
        if(q0) begin
            q1 <= ~q1;
            if(q1) begin
            q2 <= ~q2;
            if(q2) begin
                q3 <= ~q3;
            end
            end
        end
    end
  end
end

    assign out = {q3, q2, q1, q0};  

endmodule