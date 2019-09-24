`timescale 1ns / 1ps

module exor_bitwise(
    input [5:0] x,//input 
    input [5:0] y,// input
    output [5:0] z // output
    );
    
    assign z[0] = x[0]^y[0];// bit wise exor ......also can perform simply in one line but it is ok
    assign z[1] = x[1]^y[1];
    assign z[2] = x[2]^y[2];
    assign z[3] = x[3]^y[3];
    assign z[4] = x[4]^y[4];
    assign z[5] = x[5]^y[5];
    
endmodule
