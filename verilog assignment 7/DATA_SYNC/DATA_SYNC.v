module BIT_SYNC
	#(parameter NUM_STAGES = 2,
	  parameter	BUS_WIDTH = 8)
	 
	 (input  wire[BUS_WIDTH - 1 : 0] UNSYNC_BUS,
	  input  wire					 BUS_ENABLE,
	  input  wire					 RST,
	  input  wire					 CLK,
	  output reg [BUS_WIDTH - 1 : 0] SYNC_BUS,
	  output reg 					 enable_pulse
	  ); 
 
	 //================= Internal signals ==================
	 reg   [NUM_STAGES-1:0] Qnext;
	 reg 					Qnot;
	 wire					pulse_gen;
	 wire	[BUS_WIDTH - 1 : 0] mux_out;
	 
	 //================= MULTI FLIP-FLOP ===================
	 always @(posedge CLK or negedge RST) 
	 begin
		if (!RST) 
			Qnext <= 0;	
		
		else  
			Qnext <= {Qnext [NUM_STAGES-2:0], BUS_ENABLE};		
	 end
	 
	 //================= PULSE GEN =========================
	 always @(posedge CLK or negedge RST) 
	 begin
		if (!RST) 
			Qnot <= 0;	
		
		else  
			Qnot <= Qnext[NUM_STAGES-1];		
	 end
	 
	 assign pulse_gen = Qnext[NUM_STAGES-1] && Qnot;
	 
	 //================= Enable PULSE =======================
	 always @(posedge CLK or negedge RST) 	 
	 begin
		if (!RST) 
			enable_pulse <= 0;	
		
		else  
			enable_pulse <= pulse_gen;		
	 end
	 
	 //================= Multiplixer =======================
	 /*always @(*) 	 
	 begin
		case (pulse_gen)
			1'b0: mux_out = SYNC_BUS;
			1'b1: mux_out = UNSYNC_BUS;
		endcase
	 end*/
	 assign mux_out = pulse_gen ? UNSYNC_BUS : SYNC_BUS;
	 
	 //================= SYNC BUS ===========================
	 always @(posedge CLK or negedge RST) 	 
	 begin
		if (!RST) 
			SYNC_BUS <= 0;	
		
		else  
			SYNC_BUS <= mux_out;		
	 end
	 
endmodule
