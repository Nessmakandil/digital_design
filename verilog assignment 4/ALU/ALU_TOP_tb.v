`timescale 1us / 1ns
	
module ALU_TOP_tb (); 
	
	parameter 	     	Width_tb = 16;	
	reg  [Width_tb-1:0] A_tb;
	reg  [Width_tb-1:0] B_tb;
	reg  [3:0] 		 	ALU_FUNC_tb;
	reg  			 	CLK_tb;
	reg  			 	RST_tb;
	
	wire [Width_tb-1:0] Arith_OUT_tb;
	wire   	   		 	Carry_OUT_tb;
	wire   	   		 	Arith_Flag_tb;
	
	wire [Width_tb-1:0] Logic_OUT_tb;
	wire		   	 	Logic_Flag_tb;
	
	wire [Width_tb-1:0] CMP_OUT_tb;
	wire		  	 	CMP_Flag_tb;
	
	wire [Width_tb-1:0] SHIFT_OUT_tb;
	wire  	   	     	SHIFT_Flag_tb;
	
	//initial block
    initial 
    begin 	
	$dumpfile("ALU_TOP.vcd") ;
    $dumpvars ;
    //initial values    
	A_tb = 0;   
    B_tb = 0;
    ALU_FUNC_tb = 0;    
    CLK_tb = 0;
	RST_tb = 1;
    
    $display ("TEST CASE 1") ;  // Arithmatic Addition
    #3
    A_tb = 10;   
    B_tb = 20;
    ALU_FUNC_tb = 0 ;  
    #7
    if(Arith_OUT_tb != 30 && Carry_OUT_tb != 0 && Arith_Flag_tb != 1)
      $display ("TEST CASE 1 IS FAILED") ;
    else
      $display ("TEST CASE 1 IS PASSED") ;
	  
	  
	$display ("TEST CASE 2") ;  // Arithmatic Subtraction
    #3
    A_tb = 20;   
    B_tb = 10;
    ALU_FUNC_tb = 1;  
    #7
    if(Arith_OUT_tb != 10 && Carry_OUT_tb != 0 && Arith_Flag_tb != 1)
      $display ("TEST CASE 2 IS FAILED") ;
    else
      $display ("TEST CASE 2 IS PASSED") ;    

    $display ("TEST CASE 3") ;  // Arithmatic Multiplication
    #3
    A_tb = 20;   
    B_tb = 10;
    ALU_FUNC_tb = 2;  
    #7
    if(Arith_OUT_tb != 200 && Carry_OUT_tb != 0 && Arith_Flag_tb != 1)
      $display ("TEST CASE 3 IS FAILED") ;
    else
      $display ("TEST CASE 3 IS PASSED") ;
    
    $display ("TEST CASE 4") ;  // Arithmatic Division
    #3
    A_tb = 20;   
    B_tb = 10;
    ALU_FUNC_tb = 3;  
    #7
    if(Arith_OUT_tb != 2 && Carry_OUT_tb != 0 && Arith_Flag_tb != 1)
      $display ("TEST CASE 4 IS FAILED") ;
    else
      $display ("TEST CASE 4 IS PASSED") ;        
//-------------------------------------------------------------

    $display ("TEST CASE 5") ;  // Logic AND
    #3
    A_tb = 20;   
    B_tb = 10;
    ALU_FUNC_tb = 4 ;  
    #7
    if(Logic_OUT_tb != 0 && Logic_Flag_tb != 1)
      $display ("TEST CASE 5 IS FAILED") ;
    else
      $display ("TEST CASE 5 IS PASSED") ; 

    $display ("TEST CASE 6") ;  // Logic OR
    #3
    A_tb = 20;   
    B_tb = 10;
    ALU_FUNC_tb = 5;  
    #7
    if(Logic_OUT_tb != 30 && Logic_Flag_tb != 1)
      $display ("TEST CASE 6 IS FAILED") ;
    else
      $display ("TEST CASE 6 IS PASSED") ;    

    $display ("TEST CASE 7") ;  // Logic NAND
    #3
    A_tb = 20;   
    B_tb = 10;
    ALU_FUNC_tb = 6;  
    #7
    if(Logic_OUT_tb != 65535 && Logic_Flag_tb != 1)
      $display ("TEST CASE 7 IS FAILED") ;
    else
      $display ("TEST CASE 7 IS PASSED") ; 
    
    $display ("TEST CASE 8") ;  // Logic NOR
    #3
    A_tb = 20;   
    B_tb = 10;
    ALU_FUNC_tb = 7;  
    #7
    if(Logic_OUT_tb != 65505 && Logic_Flag_tb != 1)
      $display ("TEST CASE 8 IS FAILED") ;
    else
      $display ("TEST CASE 8 IS PASSED") ;
	  
	//--------------------------------------------------------------
		
    $display ("TEST CASE 9") ;  // CMP NOP
    #3
    A_tb = 20;   
    B_tb = 10;
    ALU_FUNC_tb = 8;  
    #7
    if(CMP_OUT_tb != 0 && CMP_Flag_tb != 1)
      $display ("TEST CASE 9 IS FAILED") ;
    else
      $display ("TEST CASE 9 IS PASSED") ; 

    $display ("TEST CASE 10") ;  // CMP 1
    #3
    A_tb = 20;   
    B_tb = 10;
    ALU_FUNC_tb = 9;  
    #7
    if(CMP_OUT_tb != 0 && CMP_Flag_tb != 1)
      $display ("TEST CASE 10 IS FAILED") ;
    else
      $display ("TEST CASE 10 IS PASSED") ; 
		
    $display ("TEST CASE 11") ;  // CMP 2
    #3
    A_tb = 20;   
    B_tb = 10;
    ALU_FUNC_tb = 10;  
    #7
    if(CMP_OUT_tb != 2 && CMP_Flag_tb != 1)
      $display ("TEST CASE 11 IS FAILED") ;
    else
      $display ("TEST CASE 11 IS PASSED") ; 
		
    $display ("TEST CASE 12") ;  // CMP 3
    #3
    A_tb = 20;   
    B_tb = 10;
    ALU_FUNC_tb = 11;  
    #7
    if(CMP_OUT_tb != 0 && CMP_Flag_tb != 1)
      $display ("TEST CASE 12 IS FAILED") ;
    else
      $display ("TEST CASE 12 IS PASSED") ; 
	  
	//--------------------------------------------------------

    $display ("TEST CASE 13") ;  // Shift Right
    #3
    A_tb = 20;   
    B_tb = 10;
    ALU_FUNC_tb = 12;  
    #7
    if(SHIFT_OUT_tb != 10 && SHIFT_Flag_tb != 1)
      $display ("TEST CASE 13 IS FAILED") ;
    else
      $display ("TEST CASE 13 IS PASSED") ;

    $display ("TEST CASE 14") ;  // Shift Right
    #3
    A_tb = 20;   
    B_tb = 0;
    ALU_FUNC_tb = 13;  
    #7
    if(SHIFT_OUT_tb != 40 && SHIFT_Flag_tb != 1)
      $display ("TEST CASE 14 IS FAILED") ;
    else
      $display ("TEST CASE 14 IS PASSED") ;		

    $display ("TEST CASE 15") ;  // Shift Left
    #3
    A_tb = 0;   
    B_tb = 20;
    ALU_FUNC_tb = 14;  
    #7
    if(SHIFT_OUT_tb != 10 && SHIFT_Flag_tb != 1)
      $display ("TEST CASE 15 IS FAILED") ;
    else
      $display ("TEST CASE 15 IS PASSED") ;
	  
	$display ("TEST CASE 16") ;  // Shift Left
    #3
    A_tb = 0;   
    B_tb = 20;
    ALU_FUNC_tb = 15;  
    #7
    if(SHIFT_OUT_tb != 40 && SHIFT_Flag_tb != 1)
      $display ("TEST CASE 16 IS FAILED") ;
    else
      $display ("TEST CASE 16 IS PASSED") ;
		
    #100
    $finish ;
    
  end  
	
	// Clock Generator  
	always @(posedge CLK_tb) begin
		#4 CLK_tb = 0;
		#6 CLK_tb = 1;
	end 
  
	// instaniate design instance 
	ALU_TOP #(.Width(Width_tb)) DUT (
		.A(A_tb),
		.B(B_tb),
		.ALU_FUNC(ALU_FUNC_tb),
		.CLK(CLK_tb),
	    .RST(RST_tb),
	
		.Arith_OUT(Arith_OUT_tb),	
		.Carry_OUT(Carry_OUT_tb),
		.Arith_Flag(Arith_Flag_tb),
		
		.Logic_OUT(Logic_OUT_tb),	
		.Logic_Flag(Logic_Flag_tb),
		
		.CMP_OUT(CMP_OUT_tb),	
		.CMP_Flag(CMP_Flag_tb),
		
		.SHIFT_OUT(SHIFT_OUT_tb),	
		.SHIFT_Flag(SHIFT_Flag_tb)
	);
  
endmodule 