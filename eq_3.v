module eq_3
// I/O ports
(
input wire [7:0]a,b, // 8 bit input two wires
output wire agreqb // 1 bit output
);

wire e0,e1,e2,e3,e4,e5,e6,e7; //internal wires
// internal logic to solve
eq1 eq_bit0_unit (.a(a[7:6]), .b(b[7:6]), .agreb(e0)); //chk if a(7,6)>b(7,6)
eq1 eq_bit1_unit (.agreb(e1), .a(a[5:4]), .b(b[5:4])); //chk if a(5,4)>b(5,4)
eq1 eq_bit2_unit (.agreb(e2), .a(a[3:2]), .b(b[3:2])); //chk if a(3,2)>b(3,2)
eq1 eq_bit3_unit (.agreb(e3), .a(a[1:0]), .b(b[1:0])); //chk if a(1,0)>b(1,0)

eq2 eq_bit4_unit (.aeqb(e4), .a(a[7:6]), .b(b[7:6])); //chk if a(7,6)=b(7,6)
eq2 eq_bit5_unit (.aeqb(e5), .a(a[5:4]), .b(b[5:4])); //chk if a(5,4)=b(5,4)
eq2 eq_bit6_unit (.aeqb(e6), .a(a[3:2]), .b(b[3:2])); //chk if a(3,2)=b(3,2)
eq2 eq_bit7_unit (.aeqb(e7), .a(a[1:0]), .b(b[1:0])); //chk if a(1,0)=b(1,0)


assign agreqb= e0 | (e4 & e1) | (e4 & e5 & e2) | (e4 & e5 & e6 & e3) | (e4 & e5 & e6 &7) ;
// final OR condition for each case

endmodule
