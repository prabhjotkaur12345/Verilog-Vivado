module clock(

input CCLK,

input [31:0] clkscale,

output reg clk

);

 

reg [31:0]  clkq=0;

 

always @(posedge CCLK)

    begin

        clkq=clkq+1;

            if(clkq>=clkscale)

                begin

                    #10 clk = ~clk;

                    clkq=0;

                end

    end

endmodule