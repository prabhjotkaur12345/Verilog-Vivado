module singhp_top(
output wire [3:0] an,
output wire [7:0] sseg,
input wire clk, reset,
output wire max_tick 
);

    wire a; 
    wire b;
    wire seq;
    wire code_found;
wire [3:0]  d3, d2, d1, d0;
localparam T=20; 
 assign max_tick = b;
 assign a = clk;
wire clk_n;


 
lfsr sock1
(.reset(reset), .clk(clk_n), .lfsr_out(seq), .max_tick_reg(b));


 

  disp_hex_mux disp_unit
      (.clk(clk_n), .reset(reset),  
        .hex3(d3), .hex2(d2), .hex1(d1), .hex0(d0),
       .dp_in(4'b1111), .an(an), .sseg(sseg));// changing the state 
       
 Sequence_Detector sock2 (
  .sequence_in(seq), 
  .clk(clk_n), 
  .reset(reset), 
  .detector_out(code_found)
 );
                                            
 clock clock_divider (.CCLK(a),.clkscale(),.clk(clk_n));
   // instantiate stopwatch
   stop_watch_if counter_unit
      (.clk(clk_n), .clr(reset), .detector_out(code_found),.max_tick(b),
       .d2(d2), .d1(d1), .d0(d0), .d3(d3) );// added d3
       
   assign an = an | 4'b0000; 
 

 
endmodule
