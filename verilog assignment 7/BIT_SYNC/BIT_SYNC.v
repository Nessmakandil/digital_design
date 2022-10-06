module BIT_SYNC
	#(parameter NUM_STAGES = 2,
	  parameter	BUS_WIDTH = 1)
	 
	 (input  [BUS_WIDTH - 1 : 0] ASYNC,
	  input  					 RST,
	  input  					 CLK,
	  output reg [BUS_WIDTH - 1 : 0] SYNC
	  ); 
 
	 reg   [NUM_STAGES-1:0] Qnext [BUS_WIDTH - 1 : 0];
	 integer i;
	 
	 always @(posedge CLK or negedge RST) begin
		if (!RST) begin
			for (i = 0; i < BUS_WIDTH; i = i +1)
				Qnext [i] <= 0;
		end
		
		else begin 
			for (i = 0; i < BUS_WIDTH; i = i +1) 
				Qnext [i] <= {Qnext [i][NUM_STAGES-2:0], ASYNC [i]};									
		end
	 end
		
	 always @(*) begin
		for (i=0; i<BUS_WIDTH; i=i+1)
			SYNC[i] = Qnext[i][NUM_STAGES-1] ; 
	 end
	 
endmodule

/*
module synchronizer #(
  parameter NUM_STAGES = 2
) (
  output    sync_out,
  input     async_in,
  input     clk
);
 
  reg   [NUM_STAGES:1]    sync_reg;
 
  always @ (posedge clk) begin
    sync_reg <= {sync_reg[NUM_STAGES-1:1], async_in};
  end
 
  assign sync_out = sync_reg[NUM_STAGES];
 
endmodule

//===================================================================

module synchronizer (
// line up signals verically makes it easier to read code
//--\/\/\/------\/\/\/--
  input       clk,      // all signals on different lines
  input       adata,    // can add comments for each signal
  output reg  synched   // this is the output of a DFF
);
 
  // use consistent formatting and line up things in columns so they are easier to see at a glance.
  // my rule: if you can't glance at a piece of simple code for 1 second and determine what it might
  // be doing then you formatted it badly. If it has a complex if/case/etc statement then you should
  // be able to only take the time to look at each if expression to determine what the code is doing,
  // if it takes longer than the time it takes to read each if expression then the code is badly formatted.
  always @ (posedge clk)
    // why would you do this to implement a simple DFF!?
    if (!adata)  synched <= 0;
    else         synched <= 1;
 
  // the equivalent, traditional way of writing a simple DFF
  // that others will immediately recognize without having to
  // analyze your code
  always @ (posedge clk)
    synched <= adata;
 
  // this is my preferred style, which allows you to add more signals in the if statement
  // if needed without affecting other lines that are not part of the change. This is helpful
  // when you use some form of source control and the diff will now show actual changes
  // instead of formatting changes because you had to add the begin-end block because
  // of the addition of a new signal.
  always @(posedge clk) begin
    if (!adata) begin
      synched <= 1'b0;
    end else begin
      synched <= 1'b1;
    end
  end
 
endmodule
 
// 2 ff
module ff2 (input clk, dataIn,  // ugh, reformat these like
            output dataOut);    // my example above. No reg!
            wire synch; // use some whitespace above and below for readability!
   synchronizer u1 (clk, dataIn, synch);  // No,no,no, use named association
   synchronizer u2 (clk, synch, dataOut); // i.e. .synched (dataOut)
                                          // the order then doesn't matter and
                                          // you can add new ports without having
                                          // to count which position it is in.
                                          // this is critical when you start writing
                                          // code that has 100's of ports.
endmodule
*/