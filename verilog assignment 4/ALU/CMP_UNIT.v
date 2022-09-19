module CMP_UNIT #(
	parameter Width =   16
	)
	(
	input  wire  [Width-1:0] A,
	input  wire  [Width-1:0] B,
	input  wire  [1:0] 		 ALU_FUNC,
	input  wire  			 CLK,
	input  wire  			 RST,
	input  wire  			 CMP_Enable,
	
	output reg   [Width-1:0] CMP_OUT,	
	output reg	   		     CMP_Flag
);
	
	// Internal Signals
	 reg [Width-1:0]   CMP_OUT_comb;
	 reg 			   CMP_Flag_comb;
	
	// Register with Clock and Asynchronous Active Low Reset 
	 always @(posedge CLK or negedge RST) begin		
		if (!RST) begin
			CMP_OUT <= 0;	
			CMP_Flag <= 0;
		end
		else begin
			CMP_OUT <= CMP_OUT_comb;
			CMP_Flag <= CMP_Flag_comb;
		end
	 end
	
	// Combinational Block
	 always @(*)begin
		if(CMP_Enable)begin 
			CMP_Flag_comb = 1'b1;
			casex(ALU_FUNC)
				2'b00 : CMP_OUT_comb = 0;
				2'b01 : CMP_OUT_comb = (A == B)? 1: 0; 
				2'b10 : CMP_OUT_comb = (A > B)?  2: 0;	
				2'b11 : CMP_OUT_comb = (A < B)?  3: 0;
			endcase 
		end
		else begin
			CMP_OUT_comb = 0;
			CMP_Flag_comb = 1'b0;
		end
	 end
endmodule