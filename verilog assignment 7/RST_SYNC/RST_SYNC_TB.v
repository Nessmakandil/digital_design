module RST_SYNC_TB ();
	  
	  parameter NUM_STAGES_TB = 4;
	  
	  reg  					 RST_TB;
	  reg  					 CLK_TB;
	  wire 					 SYNC_RST_TB;
	  
	  initial 
	  	begin 			
	    // initialization
	    CLK_TB = 1'b0 ;
		RST_TB = 1'b1 ;

		#7 
		RST_TB = 1'b0 ;    

		#8 
		RST_TB = 1'b1 ; 

		
		#100
		$stop ;
		end  
	
	// Clock Generator  
	always #5  CLK_TB = ~CLK_TB ;
	
	// instaniate design instance 
	RST_SYNC #(.NUM_STAGES(NUM_STAGES_TB)) DUT (		
		.RST(RST_TB),
		.CLK(CLK_TB),
	    .SYNC_RST(SYNC_RST_TB)

	);
  
endmodule