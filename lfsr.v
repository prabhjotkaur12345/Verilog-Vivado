module lfsr(

input wire clk,reset,

output wire lfsr_out,max_tick_reg

    );

   

    reg[18:0] lfsr_reg;

    reg[18:0] lfsr_next;

    reg tap_reg;
    localparam seed_value=19'b 1010101010101010101;

   

    always@(posedge clk,posedge reset)

        if(reset)

            lfsr_reg <= seed_value;

        else

            if(!max_tick_reg)

                lfsr_reg <= lfsr_next;

           

    always@*

        begin
                    // XNOR feedback
               tap_reg = ~(lfsr_reg[18] ^ lfsr_reg[5] ^ lfsr_reg[1] ^ lfsr_reg[0]); 

               lfsr_next = {lfsr_reg[10:0],tap_reg};

        end

   

    assign max_tick_reg= (lfsr_next==seed_value)? 1'b1 : 1'b0 ;    

    assign lfsr_out=lfsr_reg[17];

        

endmodule

 