module full_Subtractor(A, B, Cin, Diff, Borrow);
    input A, B, Cin;
    output Diff, Borrow;
    //Data Flow Modeling
    assign Diff = A ^ B ^ Cin;;
    assign Borrow = (~A & B) | (~A & Cin) | (B & Cin);

endmodule