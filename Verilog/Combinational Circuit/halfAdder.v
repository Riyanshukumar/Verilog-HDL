module halfAdder(a, b, sum, carry);
    input a, b;
    output reg sum, carry;

//structural modeling 
    //xor (sum, a, b);  
    //and (carry, a, b);

//dataflow modeling
   // assign sum = a ^ b;
   // assign carry = a & b;    

//behavioral modeling
    always @(*) begin
        sum = a ^ b;
        carry = a & b;
    end

endmodule