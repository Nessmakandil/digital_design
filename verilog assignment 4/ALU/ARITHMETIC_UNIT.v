module ARITHMETIC_UNIT #(
	parameter Width =  16
	)
	(
	input  wire  [Width-1:0] A,
	input  wire  [Width-1:0] B,
	input  wire  [1:0] 		 ALU_FUNC,
	input  wire  			 CLK,
	input  wire  			 RST,
	input  wire  			 Arith_Enable,
	
	output reg   [Width-1:0] Arith_OUT,	
	output reg	   		     Carry_OUT,
	output reg		   		 Arith_Flag
);
	
 
	
	// Register with Clock and Asynchronous Active Low Reset 
	 always @(posedge CLK or negedge RST)begin
		if (!RST) begin
			Arith_OUT <= 0;
			Carry_OUT <= 0;
		end
		else begin
				if(Arith_Enable)begin
					Arith_Flag <= 1'b1;
					casex(ALU_FUNC)
						2'b00 : {Carry_OUT, Arith_OUT } <= A + B;
						2'b01 : {Carry_OUT, Arith_OUT } <= A - B;
						2'b10 : {Carry_OUT, Arith_OUT } <= A * B;
						2'b11 : {Carry_OUT, Arith_OUT } <= A / B;
					endcase 
				end
				else begin
					Carry_OUT <= 0;
					Arith_OUT <= 0;
					Arith_Flag <= 0;
				end
		end
	 end
endmodule