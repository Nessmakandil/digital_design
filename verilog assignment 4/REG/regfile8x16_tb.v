`timescale 1us/1ns

module regfile8x16_tb ();

 // Inputs

	reg  [15:0] WrData_tb;
    reg  [3:0]  Address_tb;
    reg 		WrEn_tb;
	reg 		RdEn_tb;
	reg         CLK_tb;
	reg         RST_tb;

 // Outputs
    wire   [15:0]  RdData_tb;


// instantiate Design Unit
 regfile8x16 DUT (

               .WrData(WrData_tb), 

               .Address(Address_tb), 

               .WrEn(WrEn_tb), 

               .RdEn(RdEn_tb), 

               .CLK(CLK_tb), 

               .RST(RST_tb), 

               .RdData(RdData_tb)

              );

 initial begin
    $dumpfile("regfile8x16.vcd");
    $dumpvars ;
    
//initial values
CLK_tb = 1'b0;
    
    $display ("*** TEST CASE 1 ***");
    
WrData_tb = 16'd15;
Address_tb = 4'd6;
WrEn_tb = 1;
RdEn_tb = 0; 

#10

WrData_tb = 16'd5;
Address_tb = 4'd6;
WrEn_tb = 0;
RdEn_tb = 1; 

#10
    
   if (RdData_tb != 16'd15)      
      $display ("TEST IS FAILED") ; 
   else
      $display ("TEST IS PASSED") ;

    
    $display ("*** TEST CASE 2 ***") ;

WrData_tb = 16'd5;
Address_tb = 4'd6;
WrEn_tb = 1;
RdEn_tb = 1;  

#10
    
    if (RdData_tb == 16'd5)      
      $display ("Error: Read and write occur at the same time") ; 
   else
      $display ("Pass: Read and write cannot occur at the same time") ;
    
    
#100 $finish;  //finished with simulation 

 end 

// Clock Generator with 100 KHz (10 us)
   always #5 CLK_tb = ~CLK_tb;

endmodule