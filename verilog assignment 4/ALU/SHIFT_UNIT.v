module SHIFT_UNIT #(
	parameter Width =   16
	)
	(
	input  wire  [Width-1:0] A,
	input  wire  [Width-1:0] B,
	input  wire  [1:0] 		 ALU_FUNC,
	input  wire  			 CLK,
	input  wire  			 RST,
	input  wire  			 SHIFT_Enable,
	
	output reg   [Width-1:0] SHIFT_OUT,	
	output reg	   		     SHIFT_Flag
);
	
	// Internal Signals
	 reg [Width-1:0]   SHIFT_OUT_comb;
	 reg 			   SHIFT_Flag_comb;
	
	// Register with Clock and Asynchronous Active Low Reset 
	 always @(posedge CLK or negedge RST) begin		
		if (!RST) begin
			SHIFT_OUT <= 0;	
			SHIFT_Flag <= 0;
		end
		else begin
			SHIFT_Flag <= SHIFT_Flag_comb;
			SHIFT_OUT <= SHIFT_OUT_comb;
		end
	 end
	
	// Combinational Block
	 always @(*) begin
		if(SHIFT_Enable) begin 
			SHIFT_Flag_comb = 1'b1;
			casex(ALU_FUNC)
				2'b00 : SHIFT_OUT_comb = A >> 1;
				2'b01 : SHIFT_OUT_comb = A << 1; 
				2'b10 : SHIFT_OUT_comb = B >> 1;	
				2'b11 : SHIFT_OUT_comb = B << 1;
			endcase 
		end
		else begin
			SHIFT_OUT_comb = 0 ;
			SHIFT_Flag_comb = 1'b0;
		end
	 end
endmodule