module D_FF (input D, CLK, CLR, output reg Q, Q_bar);
    
    always @(posedge CLK or posedge CLR) begin
        if (CLR)
            Q <= 1'b0;
        else
            Q <= D;
    end 

    always @(Q) begin
        Q_bar <= ~Q;
    end
endmodule