module fulladder(a, b, c, sum, carry);
    input a, b, c;
    output sum, carry;
    wire sum, carry;
    
    /*assign sum = a ^ b ^ c;
    assign carry = ((a & b) | (b & c) | (c & a));*/
 
    wire t1, t2, t3;
    xor x1(t1, a, b);
    xor x2(sum, t1, c);
    and a1(t2, a, b);
    and a2(t3, t1, c);
    or o1(carry, t2, t3);

endmodule