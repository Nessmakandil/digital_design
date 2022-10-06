module RST_SYNC
	#(parameter NUM_STAGES = 2)
	 
	 (input  					 RST,
	  input  					 CLK,
	  output wire 			     SYNC_RST
	  ); 
 
	 reg   [NUM_STAGES-1:0] Qnext;
	 
	 always @(posedge CLK or negedge RST) begin
		if (!RST) begin
			Qnext <= 0;
		end
		
		else begin 
				Qnext <= {Qnext[NUM_STAGES-2:0], 1'b1};									
		end
	 end
		

     assign SYNC_RST = Qnext[NUM_STAGES-1] ; 
	 
endmodule
