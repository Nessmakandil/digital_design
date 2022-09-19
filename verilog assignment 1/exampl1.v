module exampl1(input in1,
		input in2,
		input in3,
		input in4,
		input clk,
		output reg out1,
		output reg out2,
		output reg out3
);

reg out_nor, out_nand, out_or;

always @(in1,in2)begin 
out_nor = ~(in1||in2);
end
always @(posedge clk)begin 
out1 <= out_nor;
end

always @(in2,in3)begin 
out_nand = ~(in2&&in3);
end
always @(posedge clk)begin 
out2 <= out_nand;
end

always @(in3,in4)begin 
out_or = (in3||in4);
end
always @(posedge clk)begin 
out3 <= out_or;
end

endmodule

