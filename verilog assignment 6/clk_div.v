module clk_div ( 
	 
	 input  i_ref_clk,
	 input  i_rst_n,
	 input  i_clk_en,
	 input [31:0] i_div_ratio,
	 
	 output reg o_div_clk
);

reg [31:0] count, pos_count, neg_count;
wire even;
assign even = (i_div_ratio % 2 == 0)? 1'b1 : 1'b0;

always @(posedge i_ref_clk or negedge i_rst_n) 
	begin
		if (!i_rst_n)
			begin
				count <= 0;
				o_div_clk <= 0;
			end
		else if (i_clk_en && even)
			begin
				if(count < (i_div_ratio/2)-1)
					count <= count +1;
				else 
					begin 
						o_div_clk <= ~ o_div_clk;
						count <= 0;
					end							
			end	
	end
always @(posedge i_ref_clk or negedge i_rst_n) 
	begin
		if (!i_rst_n)
			pos_count <= 0;
		else
			pos_count <= pos_count==i_div_ratio-1?0:pos_count+1;
	end

always @(negedge i_ref_clk or negedge i_rst_n) 
	begin
		if (!i_rst_n)
			neg_count <= 0;
		else 
			neg_count <= neg_count==i_div_ratio-1?0:neg_count+1;
	end
	
	
always @(negedge i_ref_clk or negedge i_rst_n) 
	begin
		if (!i_rst_n)
			o_div_clk <= 0;
		else if (i_clk_en && !even)
			o_div_clk = ((pos_count > (i_div_ratio>>1)) | (neg_count > (i_div_ratio>>1)));
	end
	
endmodule


