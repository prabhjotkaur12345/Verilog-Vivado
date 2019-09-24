

module Sequence_Detector(sequence_in,clk,reset,detector_out
    );
input clk; // input clock
input reset; // input reset 
input sequence_in; // binary input
output reg detector_out; // output of the sequence detector


parameter  a=3'b000, 
  b=3'b001, 
  c=3'b011,
  d=3'b010, 
  e=3'b110;// 
  
reg [2:0] current_state, next_state; // current state and next state

// sequential memory of t FSM
always @(posedge clk, posedge reset)
begin
 if(reset==1) 
 current_state <= a;// reset the value by comparing with 1
 else
 current_state <= next_state; 
end 
always @(current_state,sequence_in)
begin
 case(current_state) 
 a:begin//test cases 
  if(sequence_in==1)
   next_state <= b;
  else
   next_state <= a;
 end
 b:begin
  if(sequence_in==0)
   next_state <= c;
  else
   next_state <= b;
 end
 c:begin
  if(sequence_in==0)
   next_state <= d;
  else
   next_state <= b;
 end 
 d:begin
  if(sequence_in==0)
   next_state <= a;
  else
   next_state <= e;
 end
 e:begin
  if(sequence_in==0)
   next_state <= a;
  else
   next_state <= b;
 end
 default:next_state <= a;
 endcase
end
// logic to determine the output
//  FSM, output only depends on current state
always @(current_state)
begin 
 case(current_state) 
 a:   detector_out <= 0;
 b:   detector_out <= 0;
 c:  detector_out <= 0;
 d:  detector_out <= 0;
 e:  begin
        detector_out <= 1;//detected
     end
 default:  detector_out <= 0;
 endcase
end 
endmodule