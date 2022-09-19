module LFSR (

input 	wire 			CLK, RST,
input 	wire 	[3:0]	seed,
output 	reg 			OUT, Valid
);

reg[3:0] LFSR;         
reg [3:0] count1, count2;
reg	Feedback1, Feedback2, lfsr_en, shift_en;


always@(posedge CLK or negedge RST) begin
	if(!RST) begin    
	  count1 <= 0;
	  count2 <= 0;
	  
	  lfsr_en <= 0;	  
	  shift_en <= 0;
	  
	  LFSR <= seed;
	  
	end
	
	else begin	
		if (!lfsr_en) begin  
			count1<=count1+1;
			lfsr_en <= (count1 <= 7)? 1'b0 : 1'b1;
		end	
		
		if (lfsr_en) begin
			Feedback1 <= LFSR[0] ^ LFSR[1];
			Feedback2 <= Feedback1 ^ LFSR[2];
			LFSR[3] <= Feedback2; 	 
			LFSR[2] <= LFSR[3];
			LFSR[1] <= LFSR[2];
			LFSR[0] <= LFSR[1];				
		end
		
		if (!shift_en && lfsr_en) begin  
			count2<=count2+1;
			shift_en <= (count2 <= 3)? 1'b0 : 1'b1;
			{LFSR[2:0], OUT} <= LFSR;
			Valid <= 1'b1;
		end	

	end
end

endmodule


