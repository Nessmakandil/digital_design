module digct(input in1,
		input in2,
		input in3,
		input in4,
		input in5,
		input clk,
		output reg out1,
		output reg out2,
		output reg out3
);

reg out_nor, out_nand_1, out_nand_2, out_or_1, out_or_2;

always @(*)begin 
out_nor = ~(in1||in2);
out_nand_1 = ~(out_nor&&in3);
end

always @(*)begin
out_nand_2 = ~(in2&&in3);
end

always @(*)begin
out_or_1 = (in3||~in4);
out_or_2 = (out_or_1||in5);
end

always @(posedge clk)begin 
out1 <= out_nand_1;
out2 <= out_nand_2;
out3 <= out_or_2;
end

endmodule
