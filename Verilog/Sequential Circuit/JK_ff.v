module JK_ff(
    input J, K, CLK, CLR, PR,
    output reg Q, Q_bar
);
    always @(posedge CLK or posedge CLR) begin
        if (CLR)
            Q <= 1'b0;
        else begin
            if (PR)
                Q <= 1'b1;
            else begin
                case ({J, K})
                    2'b00: Q <= Q;
                    2'b01: Q <= 1'b0;
                    2'b10: Q <= 1'b1;
                    2'b11: Q <= ~Q; 
                endcase
            end
        end
    end 

    always @(Q) begin
        Q_bar <= ~Q;
    end
endmodule