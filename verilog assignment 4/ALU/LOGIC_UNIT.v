module LOGIC_UNIT #(
	parameter Width =  16
	)
	(
	input  wire  [Width-1:0] A,
	input  wire  [Width-1:0] B,
	input  wire  [1:0] 		 ALU_FUNC,
	input  wire  			 CLK,
	input  wire  			 RST,
	input  wire  			 Logic_Enable,
	
	output reg   [Width-1:0] Logic_OUT,	
	output reg	   		     Logic_Flag
);
	
	// Internal Signals
	 reg [Width-1:0]   Logic_OUT_comb;
	 reg 			   Logic_Flag_comb;
	
	// Register with Clock and Asynchronous Active Low Reset 
	 always @(posedge CLK or negedge RST)begin		
		if (!RST) begin
			Logic_OUT <= 0;	
			Logic_Flag <= 0;
		end
		else begin
			Logic_OUT <= Logic_OUT_comb;
			Logic_Flag <= Logic_Flag_comb;
		end
	 end
	
	// Combinational Block
	 always @(*)begin
		if(Logic_Enable)begin 
			Logic_Flag_comb <= 1'b1;
			casex(ALU_FUNC)
				2'b00 : Logic_OUT_comb = A & B;
				2'b01 : Logic_OUT_comb = A | B;
				2'b10 : Logic_OUT_comb = ~(A & B);
				2'b11 : Logic_OUT_comb = ~(A | B);
			endcase 
		end
		else begin
			Logic_OUT_comb = 0;
			Logic_Flag_comb <= 1'b0;
		end
	 end
endmodule