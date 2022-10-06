module BIT_SYNC_TB ();
	  
	  parameter NUM_STAGES_TB = 4;
	  parameter	BUS_WIDTH_TB = 3;
	  
	  reg  		[BUS_WIDTH_TB-1:0]			 ASYNC_TB;
	  reg  					 RST_TB;
	  reg  					 CLK_TB;
	  wire 	[BUS_WIDTH_TB-1:0]				 SYNC_TB;
	  
	  initial 
	  	begin 			
	    // initialization
	    CLK_TB = 1'b0 ;
		RST_TB = 1'b1 ;
		ASYNC_TB = 'b0 ;

		#7 
		RST_TB = 1'b0 ;    

		#8 
		RST_TB = 1'b1 ; 

		#13    
		ASYNC_TB = 'b101;
		
		#100
		$stop ;
		end  
	
	// Clock Generator  
	always #5  CLK_TB = ~CLK_TB ;
	
	// instaniate design instance 
	BIT_SYNC #(.NUM_STAGES(NUM_STAGES_TB),
			  .BUS_WIDTH(BUS_WIDTH_TB)) DUT (
		
		.ASYNC(ASYNC_TB),
		.RST(RST_TB),
		.CLK(CLK_TB),
	    .SYNC(SYNC_TB)

	);
  
endmodule