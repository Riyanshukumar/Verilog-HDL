module half_subtractor(A,B,diff,borrow);
    input A,B;
    output diff,borrow;
    assign diff = A^B;
    assign borrow = ~A & B;

endmodule