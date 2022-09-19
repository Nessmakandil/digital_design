module Decoder_Unit 
(
	input  wire  [1:0] 		 ALU_FUNC,
	
	output reg 				 Arith_Enable,
	output reg				 Logic_Enable,
	output reg				 CMP_Enable,
	output reg		  		 SHIFT_Enable
);
	
	always @(*)begin 
		Arith_Enable =1'b0;
		Logic_Enable =1'b0;
		CMP_Enable =1'b0;
		SHIFT_Enable =1'b0;
			
		case(ALU_FUNC)
			2'b00: Arith_Enable =1'b1;						
			2'b01: Logic_Enable =1'b1;					
			2'b10: CMP_Enable =1'b1;					
			2'b11: SHIFT_Enable =1'b1;
		endcase		
	end	 

endmodule 