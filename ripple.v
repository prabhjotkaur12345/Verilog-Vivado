module ripple(
    input [5:0] x,//input 
    input [5:0] y,//input
    input  sel,// to let the user know if you wanna add or subtract
    output   c_out,// for the carry bit 
    output [5:0] sum,// for the desired result storage 
    output   overflow// if ypu get overflow
    );
    wire c0, c1, c2, c3, c4, c5 , c6;//wires for storing the carry bits per bit
    wire b0, b1, b2, b3, b4, b5;//wires to store result


assign c0=sel; //first carry bit to be set 0

full_Adder eq_bit0_unit (.a(x[0]), .b(b0), .s(sum[0]), .cin(c0), .cout(c1));//adder
full_Adder eq_bit1_unit (.a(x[1]), .b(b1), .s(sum[1]), .cin(c1), .cout(c2));
full_Adder eq_bit2_unit (.a(x[2]), .b(b2), .s(sum[2]), .cin(c2), .cout(c3));
full_Adder eq_bit3_unit (.a(x[3]), .b(b3), .s(sum[3]), .cin(c3), .cout(c4));
full_Adder eq_bit4_unit (.a(x[4]), .b(b4), .s(sum[4]), .cin(c4), .cout(c5));
full_Adder eq_bit5_unit (.a(x[5]), .b(b5), .s(sum[5]), .cin(c5), .cout(c6));


assign b0=sel^y[0];//for subtraction sel=1 
assign b1=sel^y[1];
assign b2=sel^y[2];
assign b3=sel^y[3];
assign b4=sel^y[4];
assign b5=sel^y[5];

assign c_out=c6;//last carry bit

assign overflow = c5 ^ c6;//for overflow

endmodule

