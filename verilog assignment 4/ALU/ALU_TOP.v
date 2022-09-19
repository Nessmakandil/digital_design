module ALU_TOP #(
	parameter Width =  16
)
(
	input  wire  [Width-1:0] A,
	input  wire  [Width-1:0] B,
	input  wire  [3:0] 		 ALU_FUNC,
	input  wire  			 CLK,
	input  wire  			 RST,
	
	output wire   [Width-1:0] Arith_OUT,
	output wire		   		 Carry_OUT,
	output wire		   		 Arith_Flag,
	
	output wire   [Width-1:0] Logic_OUT,
	output wire		   		 Logic_Flag,
	
	output wire   [Width-1:0] CMP_OUT,
	output wire		   		 CMP_Flag,
	
	output wire   [Width-1:0] SHIFT_OUT,
	output wire		   		 SHIFT_Flag

);
	// Internal Signals
	wire Arith_Enable;
	wire Logic_Enable;
	wire CMP_Enable;
	wire SHIFT_Enable;
	

	Decoder_Unit D1(
		.ALU_FUNC(ALU_FUNC[3:2]),
		.Arith_Enable(Arith_Enable),
		.Logic_Enable(Logic_Enable),
		.CMP_Enable(CMP_Enable),
		.SHIFT_Enable(SHIFT_Enable)
		);

	ARITHMETIC_UNIT #(.Width(Width)) A1 (
		.A(A),
		.B(B),
		.ALU_FUNC(ALU_FUNC[1:0]),
		.CLK(CLK),
	    .RST(RST),
		.Arith_Enable(Arith_Enable),
	
		.Arith_OUT(Arith_OUT),	
		.Carry_OUT(Carry_OUT),
		.Arith_Flag(Arith_Flag)
		);
    
	LOGIC_UNIT #(.Width(Width)) L1 (
		.A(A),
		.B(B),
		.ALU_FUNC(ALU_FUNC[1:0]),
		.CLK(CLK),
	    .RST(RST),
		.Logic_Enable(Logic_Enable),
	
		.Logic_OUT(Logic_OUT),	
		.Logic_Flag(Logic_Flag)
		);
		
	CMP_UNIT #(.Width(Width)) C1 (
		.A(A),
		.B(B),
		.ALU_FUNC(ALU_FUNC[1:0]),
		.CLK(CLK),
	    .RST(RST),
		.CMP_Enable(CMP_Enable),
	
		.CMP_OUT(CMP_OUT),	
		.CMP_Flag(CMP_Flag)
		);
		
    SHIFT_UNIT #(.Width(Width)) S1 (
		.A(A),
		.B(B),
		.ALU_FUNC(ALU_FUNC[1:0]),
		.CLK(CLK),
	    .RST(RST),
		.SHIFT_Enable(SHIFT_Enable),
	
		.SHIFT_OUT(SHIFT_OUT),	
		.SHIFT_Flag(SHIFT_Flag)
		);
	 

endmodule 