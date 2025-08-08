module mux8to1(In, Sel, Out);
  input [7:0] In;
  input [2:0] Sel;
  output Out;
  wire Out;
  wire Out0, Out1;

  mux4to1 m1(In[3:0], Sel[1:0], Out0);
  mux4to1 m2(In[7:4], Sel[1:0], Out1);

  assign Out = (Sel[2] == 1'b0) ? Out0 : Out1;
endmodule

module mux_4to1(In, Sel, Out);
  input [3:0] In;
  input [1:0] Sel;
  output Out;
  wire Out;

    assign Out = (Sel == 2'b00) ? In[0] : 
                 (Sel == 2'b01) ? In[1] : 
                 (Sel == 2'b10) ? In[2] : 
                 In[3];
endmodule

module mux_2to1(in, sel, out);
  input [1:0] in;
  input sel;
  output out;
  wire out;

  assign out = (sel == 1'b0) ? in[0] : in[1];
endmodule
