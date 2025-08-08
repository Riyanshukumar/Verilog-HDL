module numberRep();
  reg [2:0] a;     // 3-bit register for octal 5
  reg [0:0] b;     // 1-bit register for binary 1
  reg [3:0] c;     // 4-bit register for octal 6
  reg [7:0] d;     // 8-bit register for octal 52
  reg [5:0] e;

  initial begin
    a = 3'o5;     // Octal representation: 5 (octal) = 5 (decimal)
    b = 1'b1;     // Binary representation: 1
    c = 4'o6;     // Octal representation: 6 (octal) = 6 (decimal)
    d = 8'o52;    // Octal representation: 52 (octal) = 5*8 + 2 = 42 (decimal)
    e = 6'o44;    

    $display("a = %d", a);  // Display a in decimal
    $display("b = %d", b);  // Display b in decimal
    $display("c = %d", c);  // Display c in decimal
    $display("d = %d", d);  // Display d in decimal
    $display("e = %d", e);  // Display e in decimal

  end
endmodule
