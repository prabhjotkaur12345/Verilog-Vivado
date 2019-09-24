// Listing 4.18
module stop_watch_if
   (
    input wire clk,
    input wire  clr,detector_out,max_tick,
    output wire [3:0] d2, d1, d0, d3
   );

   // declaration
   localparam  DVSR = 100000;
   reg [31:0] ms_reg;
   wire [31:0] ms_next;
   reg [3:0] d2_reg, d1_reg, d0_reg, d3_reg;
   reg [3:0] d2_next, d1_next, d0_next, d3_next;
   wire ms_tick;

   // body
   // register
   always @(posedge clk)
   begin
      ms_reg <= ms_next;
      d3_reg <= d3_next;
      d2_reg <= d2_next;
      d1_reg <= d1_next;
      d0_reg <= d0_next;
   end

   assign ms_next = (clr || (ms_reg==DVSR && ~max_tick )) ? 4'b0 :
                    (~max_tick ) ? ms_reg + 1 :
                           ms_reg;
   assign ms_tick = (ms_reg==DVSR) ? 1'b1 : 1'b0;

   always @*
   begin
      d0_next = d0_reg;
      d1_next = d1_reg;
      d2_next = d2_reg;
      d3_next = d3_reg;
      if (clr)
         begin
            d0_next = 4'b0;
            d1_next = 4'b0;
            d2_next = 4'b0;
            d3_next = 4'b0;
         end
      else if (ms_tick)
         if (d0_reg != 9)
            d0_next = d0_reg + 1;
           
         else             
            begin
               d0_next = 4'b0;
               if (d1_reg != 9)
                    d1_next = d1_reg + 1;
               else   
                  begin
                     d1_next = 4'b0;
                     if (d2_reg != 9) 
                            d2_next = d2_reg + 1; 
                     else 
                        begin
                            d2_next = 4'b0;
                            if (d3_reg != 9)
                                    d3_next = d3_reg + 1;
                             else 
                                d3_next = 4'b0;
                        end
                  end
            end
   end

   // output logic
   assign d0 = d0_reg;
   assign d1 = d1_reg;
   assign d2 = d2_reg;
   assign d3 = d3_reg;

endmodule


