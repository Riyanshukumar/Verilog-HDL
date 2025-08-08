module SR_latch(S, R, Q, Qn);
    input S, R;
    output Q, Qn;

    assign Q = ~(S & Qn);
    assign Qn = ~(R & Q);
endmodule