module SR_FF (input S, R, CLK, output reg Q, Q_bar);
   
    always @(posedge CLK) begin
        if (S & ~R)
            Q <= 1'b1;
        else if (~S & R)
            Q <= 1'b0;
    end

    always @(Q) begin
        Q_bar <= ~Q;
    end
    
endmodule

