module four_bit_adder(A, B, Cin, Sum, Cout);
  input [3:0] A, B;
  input Cin;
  output [3:0] Sum;
  output Cout;
  wire [3:0] Sum;
  wire Cout;
  wire c1, c2, c3;

  full_adder FA1(.A(A[0]), .B(B[0]), .Cin(Cin), .Sum(Sum[0]), .Cout(c1));
  full_adder FA2(.A(A[1]), .B(B[1]), .Cin(c1), .Sum(Sum[1]), .Cout(c2));
  full_adder FA3(.A(A[2]), .B(B[2]), .Cin(c2), .Sum(Sum[2]), .Cout(c3));
  full_adder FA4(.A(A[3]), .B(B[3]), .Cin(c3), .Sum(Sum[3]), .Cout(Cout));

endmodule

module full_adder(A, B, Cin, Sum, Cout);
  input A, B, Cin;
  output Sum, Cout;
  wire Sum, Cout;
  wire t1, t2, t3;

  half_adder HA1(.A(A), .B(B), .Sum(t1), .Cout(t2));
  half_adder HA2(.A(t1), .B(Cin), .Sum(Sum), .Cout(t3));
  or o1(Cout, t2, t3);
endmodule

module half_adder(A, B, Sum, Cout);
  input A, B;
  output Sum, Cout;
  wire Sum, Cout;
 
  assign Sum = A ^ B;
  assign Cout = A & B;
endmodule