module eq1
(
input wire [1:0]a , b ,// two bit input wires a and b
output wire agreb // get the output in wire named agreb
);
wire e0,e1,e2; // wires for the
//internal logic to obtain the and logic outputs
assign e0 = a[1] & (~b[1]); // first product set
assign e1 = a[0] & (~b[1]) & (~b[0]); //second product sets
assign e2 = a[1] & a[0] & (~b[0]); //third product set

assign agreb= e0 | e1 | e2; // Sum of the product sets OR

endmodule


