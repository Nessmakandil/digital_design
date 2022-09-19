module regfile8x16 (
	input  wire  [15:0] WrData,
    input  wire  [2:0] Address,
    input  wire 		WrEn,
	input  wire 		RdEn,
	input  wire         CLK,
	input  wire         RST,

    output reg   [15:0]  RdData

);

    // 2D Array
    reg [7:0] regfile [15:0]; 
	integer i;
	
    always @(posedge CLK or negedge RST) 
	  begin
		if (!RST) begin			
			for (i=0; i<8; i=i+1) begin: loop
				regfile[i] <= 16'b0;
			end
		end
        
		else if (WrEn && !RdEn) begin
            regfile[Address] <= WrData;
		end
		
		else if (RdEn && !WrEn) begin
            RdData <= regfile[Address]; 
          end
       end

endmodule