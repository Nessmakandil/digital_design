`timescale 1ns / 1ps

module LFSR_tb ();

reg 			CLK_tb, RST_tb;
reg 	[3:0]	seed_tb;

wire 			OUT_tb, Valid_tb;

initial 
 begin
   
 // Save Waveform
   $dumpfile("LFSR.vcd") ;       
   $dumpvars; 
 

 // initialization
   initialize();

 // Reset
   reset();
   
   #1500   
  $stop ;
 
 end  

/////////////// Signals Initialization //////////////////

task initialize;
 begin
  seed_tb = 4'b1001;
  CLK_tb = 1'b0; 
 end
endtask

///////////////////////// RESET /////////////////////////
  
task reset;
 begin
 RST_tb =  'b1;
 #100
 RST_tb  = 'b0;
 #100
 RST_tb  = 'b1;
 end
endtask  

////////////////////////////////////////////////////////
////////////////// Clock Generator  ////////////////////
////////////////////////////////////////////////////////

always #50  CLK_tb = ~CLK_tb ;
  

////////////////////////////////////////////////////////
/////////////////// DUT Instantation ///////////////////
////////////////////////////////////////////////////////

LFSR DUT (
.seed(seed_tb),
.CLK(CLK_tb),
.RST(RST_tb),
.OUT(OUT_tb),
.Valid(Valid_tb)
);


endmodule  