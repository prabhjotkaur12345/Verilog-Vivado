`timescale 1 ns/10 ps

module eq2tb;
    
   // signal declaration
   reg  [5:0] test_in0,test_in1; // register to store the inputs 
   reg  [2:0] fnx ;   //  to get to know which operation you want to run
   wire  [5:0]test_out;        // remember output should be stored in wire 
   wire  couy,over,greater_ab;    

   // instantiate the circuit under test
   assignment uut
      (.a(test_in0), .b(test_in1), .ans(test_out), .fxn(fnx), .cout(couy), .over_flow(over), .greater(greater_ab));

   //  test vector generator
   initial
   begin
    $display ("time test_in0  test_in1    test_out  fnx  greater  overfolw   cout " ); 
        $monitor ("%d  %b  %b  %b  %b  %b %b  %b " ,     $time, test_in0 , test_in1 , test_out , fnx, greater_ab, over, couy) ;
      // test vector 1
      fnx = 3'b000;
      test_in0 = 6'b011100;
      test_in1 = 6'b101100;
      
      # 200;
       //test vector 2
      fnx = 3'b001;
     test_in0 = 6'b001111;
        test_in1 = 6'b101100;
            
      # 200;
      // test vector 3
      fnx = 3'b010;
     test_in0 = 6'b110110;
            test_in1 = 6'b110000;
            
      # 200;
      // test vector 4
      fnx = 3'b011;
      test_in0 = 6'b011000;
            test_in1 = 6'b101010;
            
      # 200;
      // test vector 5
      fnx = 3'b100;
      test_in0 = 6'b100100;
            test_in1 = 6'b0101010;
            
       // test vector 1         Comment the previous testbenches to test the next because the time for the 
       //                       simulation is 100000
                  fnx = 3'b100;
                  test_in0 = 6'b011100;
                  test_in1 = 6'b101100;
                  
                  # 200;
                   //test vector 2
                  fnx = 3'b101;
                 test_in0 = 6'b001111;
                    test_in1 = 6'b101100;
                        
                  # 200;
                  // test vector 3
                  fnx = 3'b110;
                 test_in0 = 6'b110110;
                        test_in1 = 6'b110000;
                        
                  # 200;
                  // test vector 4
                  fnx = 3'b111;
                  test_in0 = 6'b011000;
                        test_in1 = 6'b101010;
                        
                  # 200;
                  // test vector 5
                  fnx = 3'b111;
                  test_in0 = 6'b100100;
                        test_in1 = 6'b0101010;         
 
      $stop;
   end
   

endmodule
//
