module full_adder(A, B, C, Sum, Carry);
  input A, B, C;
  output Sum, Carry;
  wire Sum, Carry;
  wire t1, t2, t3;

  half_adder HA1(.A(A), .B(B), .Sum(t1), .Carry(t2));
  half_adder HA2(.A(t1), .B(C), .Sum(Sum), .Carry(t3));
  or o1(Carry, t2, t3);

endmodule


module half_adder(A, B, Sum, Carry);
  input A, B;
  output Sum, Carry;
  wire Sum, Carry;
  xor x1(Sum, A, B);
  and a1(Carry, A, B);
endmodule