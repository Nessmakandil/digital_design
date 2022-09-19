`timescale 1ns / 1ps

module garage_control_tb ();

//INPUTS
reg        Activate_tb;
reg		   UP_Max_tb;
reg		   DN_Max_tb;
reg        rst_tb;
reg        clk_tb;

//OUTPUTS
wire       UP_M_tb;
wire       DN_M_tb;
   
 
////////////////////////////////////////////////////////
////////////////// initial block /////////////////////// 
////////////////////////////////////////////////////////


initial 
 begin
   
 // Save Waveform
   $dumpfile("garage_control.vcd") ;       
   $dumpvars; 
 

 // initialization
   initialize();

 // Reset
   reset();
   
 // Input Sequence
   sensors_states(5'b011110,5'b10100,5'b01011); // input_1 for button_0 
                                     // input_2 for button_1

 // check output time
   wait(UP_M_tb)
    $display("DOOR IS OPENED AT TIME %d", $time) ;
	
   wait(DN_M_tb)
    $display("DOOR IS CLOSED AT TIME %d", $time) ;
   
  #100
  $finish ;
 
 end  


////////////////////////////////////////////////////////
/////////////////////// TASKS //////////////////////////
////////////////////////////////////////////////////////

/////////////// Signals Initialization //////////////////

task initialize;
 begin
  Activate_tb = 1'b0 ;
  UP_Max_tb = 1'b0 ;
  DN_Max_tb = 1'b0;
  clk_tb = 1'b0 ; 
 end
endtask

///////////////////////// RESET /////////////////////////
  
task reset;
 begin
 rst_tb =  'b1;
 #20
 rst_tb  = 'b0;
 #20
 rst_tb  = 'b1;
 end
endtask  

////////////////////// sensors_states /////////////////////
  
task sensors_states(
  input  reg   [4:0]     Activate,
  input  reg   [4:0]     UP_Max,
  input  reg   [4:0]     DN_Max  
);
  
  integer   loop ;
  
begin
  for(loop=0;loop<5;loop=loop+1)
   begin
     @(negedge clk_tb) 
	 Activate_tb = Activate[loop] ;
     UP_Max_tb = UP_Max[loop] ;
     DN_Max_tb = DN_Max[loop] ;
   end   
 end
endtask    
////////////////////////////////////////////////////////
////////////////// Clock Generator  ////////////////////
////////////////////////////////////////////////////////

always #10  clk_tb = ~clk_tb ;
  

////////////////////////////////////////////////////////
/////////////////// DUT Instantation ///////////////////
////////////////////////////////////////////////////////

garage_control DUT (
.Activate(Activate_tb),
.UP_Max(UP_Max_tb),
.DN_Max(DN_Max_tb),
.clk(clk_tb),
.rst(rst_tb),
.UP_M(UP_M_tb),
.DN_M(DN_M_tb)
);


endmodule  