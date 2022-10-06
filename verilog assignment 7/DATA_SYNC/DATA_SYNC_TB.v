module BIT_SYNC_TB ();
	  
	  parameter NUM_STAGES_TB = 3;
	  parameter	BUS_WIDTH_TB = 8;
	  
	  reg  	[BUS_WIDTH_TB-1:0]	UNSYNC_BUS;
	  reg 					 	BUS_ENABLE;
	  reg  					 	RST_TB;
	  reg  					 	CLK_TB;
	  wire 	[BUS_WIDTH_TB-1:0]	SYNC_BUS;
	  wire						enable_pulse;
	  
	  initial 
	  	begin 			
	    // initialization
	    CLK_TB = 1'b0 ;
		RST_TB = 1'b1 ;
		UNSYNC_BUS = 'b0 ;
		BUS_ENABLE = 1'b0;

		#7 
		RST_TB = 1'b0 ;    

		#8 
		RST_TB = 1'b1 ; 

		#13    
		BUS_ENABLE = 1'b1;
		UNSYNC_BUS = 'b10111100;
		
		#100
		$stop ;
		end  
	
	// Clock Generator  
	always #5  CLK_TB = ~CLK_TB ;
	
	// instaniate design instance 
	BIT_SYNC #(.NUM_STAGES(NUM_STAGES_TB),
			  .BUS_WIDTH(BUS_WIDTH_TB)) DUT (
		
		.UNSYNC_BUS(UNSYNC_BUS),
		.BUS_ENABLE(BUS_ENABLE),
		.RST(RST_TB),
		.CLK(CLK_TB),
	    .SYNC_BUS(SYNC_BUS),
		.enable_pulse(enable_pulse)

	);
  
endmodule