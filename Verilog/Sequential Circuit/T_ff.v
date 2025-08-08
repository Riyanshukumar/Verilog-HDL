module T_ff(
    input T, CLK, CLR,
    output reg Q, Q_bar
);
    always @(posedge CLK or posedge CLR) begin
        if (CLR)
            Q <= 1'b0;
        else begin
            if (T)
                Q <= ~Q;
        end
    end 

    always @(Q) begin
        Q_bar <= ~Q;
    end
endmodule