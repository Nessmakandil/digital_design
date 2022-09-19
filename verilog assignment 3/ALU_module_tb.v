`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:10:12 08/11/2022 
// Design Name: 
// Module Name:    ALU_module_tb 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ALU_module_tb ();
	reg  [15:0] A_tb , B_tb;						
	reg  [3:0]  ALU_FUN_tb;
	reg         CLK_tb;
	
	wire [15:0] ALU_OUT_tb;
	wire        Arith_flag_tb, Logic_flag_tb, CMP_flag_tb, Shift_flag_tb;
	
	//initial block
	initial 
	begin
    $dumpfile("ALU_module.vcd") ;
    $dumpvars ;
    //initial values
    A_tb = 16'd0;   
    B_tb = 16'd0 ;
    ALU_FUN_tb = 4'b0 ;    
    CLK_tb = 1'b0 ;
    
    $display ("TEST CASE 1") ;  // Arithmatic Addition
    #3
    A_tb = 16'd10;   
    B_tb = 16'd20 ;
    ALU_FUN_tb = 4'b0 ;  
    #7
    if(ALU_OUT_tb != 16'd30)
      $display ("TEST CASE 1 IS FAILED") ;
    else
      $display ("TEST CASE 1 IS PASSED") ;

    $display ("TEST CASE 2") ;  // Arithmatic Subtraction
    #3
    A_tb = 16'd20;   
    B_tb = 16'd10 ;
    ALU_FUN_tb = 4'b0001 ;  
    #7
    if(ALU_OUT_tb != 16'd10)
      $display ("TEST CASE 2 IS FAILED") ;
    else
      $display ("TEST CASE 2 IS PASSED") ;    

    $display ("TEST CASE 3") ;  // Arithmatic Multiplication
    #3
    A_tb = 16'd20;   
    B_tb = 16'd10 ;
    ALU_FUN_tb = 4'b0010 ;  
    #7
    if(ALU_OUT_tb != 16'd200)
      $display ("TEST CASE 3 IS FAILED") ;
    else
      $display ("TEST CASE 3 IS PASSED") ;
    
    $display ("TEST CASE 4") ;  // Arithmatic Division
    #3
    A_tb = 16'd20;   
    B_tb = 16'd10 ;
    ALU_FUN_tb = 4'b0011 ;  
    #7
    if(ALU_OUT_tb != 16'd2)
      $display ("TEST CASE 4 IS FAILED") ;
    else
      $display ("TEST CASE 4 IS PASSED") ;        

    $display ("TEST CASE 5") ;  // Logic AND
    #3
    A_tb = 16'd20;   
    B_tb = 16'd10 ;
    ALU_FUN_tb = 4'b0100 ;  
    #7
    if(ALU_OUT_tb != 16'd0)
      $display ("TEST CASE 5 IS FAILED") ;
    else
      $display ("TEST CASE 5 IS PASSED") ; 

    $display ("TEST CASE 6") ;  // Logic OR
    #3
    A_tb = 16'd20;   
    B_tb = 16'd10 ;
    ALU_FUN_tb = 4'b0101 ;  
    #7
    if(ALU_OUT_tb != 16'd30)
      $display ("TEST CASE 6 IS FAILED") ;
    else
      $display ("TEST CASE 6 IS PASSED") ;    

    $display ("TEST CASE 7") ;  // Logic NAND
    #3
    A_tb = 16'd20;   
    B_tb = 16'd10 ;
    ALU_FUN_tb = 4'b0110 ;  
    #7
    if(ALU_OUT_tb != 16'd65535)
      $display ("TEST CASE 7 IS FAILED") ;
    else
      $display ("TEST CASE 7 IS PASSED") ; 
    
    $display ("TEST CASE 8") ;  // Logic NOR
    #3
    A_tb = 16'd20;   
    B_tb = 16'd10 ;
    ALU_FUN_tb = 4'b0111 ;  
    #7
    if(ALU_OUT_tb != 16'd65505)
      $display ("TEST CASE 8 IS FAILED") ;
    else
      $display ("TEST CASE 8 IS PASSED") ;
		
    $display ("TEST CASE 9") ;  // Logic XOR
    #3
    A_tb = 16'd20;   
    B_tb = 16'd10;
    ALU_FUN_tb = 4'b1000;  
    #7
    if(ALU_OUT_tb != 16'd30)
      $display ("TEST CASE 9 IS FAILED") ;
    else
      $display ("TEST CASE 9 IS PASSED") ; 

    $display ("TEST CASE 10") ;  // Logic XNOR
    #3
    A_tb = 16'd20;   
    B_tb = 16'd10;
    ALU_FUN_tb = 4'b1001;  
    #7
    if(ALU_OUT_tb != 16'd65505)
      $display ("TEST CASE 10 IS FAILED") ;
    else
      $display ("TEST CASE 10 IS PASSED") ; 
		
    $display ("TEST CASE 11") ;  // equality Comparator
    #3
    A_tb = 16'd20;   
    B_tb = 16'd10;
    ALU_FUN_tb = 4'b1010;  
    #7
    if(ALU_OUT_tb != 16'd0)
      $display ("TEST CASE 11 IS FAILED") ;
    else
      $display ("TEST CASE 11 IS PASSED") ; 
		
    $display ("TEST CASE 12") ;  // Comparator
    #3
    A_tb = 16'd20;   
    B_tb = 16'd10;
    ALU_FUN_tb = 4'b1011;  
    #7
    if(ALU_OUT_tb != 16'd2)
      $display ("TEST CASE 12 IS FAILED") ;
    else
      $display ("TEST CASE 12 IS PASSED") ; 

    $display ("TEST CASE 13") ;  // Comparator
    #3
    A_tb = 16'd20;   
    B_tb = 16'd10;
    ALU_FUN_tb = 4'b1100;  
    #7
    if(ALU_OUT_tb != 16'd0)
      $display ("TEST CASE 13 IS FAILED") ;
    else
      $display ("TEST CASE 13 IS PASSED") ;

    $display ("TEST CASE 14") ;  // Shift Right
    #3
    A_tb = 16'd20;   
    B_tb = 16'd0;
    ALU_FUN_tb = 4'b1101;  
    #7
    if(ALU_OUT_tb != 16'd10)
      $display ("TEST CASE 13 IS FAILED") ;
    else
      $display ("TEST CASE 13 IS PASSED") ;		

    $display ("TEST CASE 14") ;  // Shift Left
    #3
    A_tb = 16'd20;   
    B_tb = 16'd0;
    ALU_FUN_tb = 4'b1110;  
    #7
    if(ALU_OUT_tb != 16'd40)
      $display ("TEST CASE 13 IS FAILED") ;
    else
      $display ("TEST CASE 13 IS PASSED") ;
		
    #100
    $finish ;
    
  end
  
// Clock Generator  
  always #5 CLK_tb = !CLK_tb ;
  
// instaniate design instance 
  ALU_module DUT (
    .A(A_tb),
    .B(B_tb), 
    .ALU_FUN(ALU_FUN_tb), 
    .CLK(CLK_tb),
    .ALU_OUT(ALU_OUT_tb),
    .Arith_flag(Arith_flag_tb),
    .Logic_flag(Logic_flag_tb),
	 .CMP_flag(CMP_flag_tb),
	 .Shift_flag(Shift_flag_tb)
  );

endmodule
