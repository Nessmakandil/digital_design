`timescale 1us / 1ns

module clk_div_tb ();	
 
reg i_ref_clk_tb;
reg i_rst_n_tb;
reg i_clk_en_tb;
reg [31:0] i_div_ratio_tb1;
reg [31:0] i_div_ratio_tb2;
reg [31:0] i_div_ratio_tb3;
reg [31:0] i_div_ratio_tb4;
wire o_div_clk_tb1;
wire o_div_clk_tb2;
wire o_div_clk_tb3;
wire o_div_clk_tb4;

//initial block
    initial 
    begin 	
	$dumpfile("clk_div.vcd") ;
    $dumpvars ;
    //initial values    
    i_div_ratio_tb1 = 32'd0;
	i_div_ratio_tb2 = 32'd0;
	i_div_ratio_tb3 = 32'd0;
	i_div_ratio_tb4 = 32'd0;
	
    i_clk_en_tb = 1;    
    i_ref_clk_tb = 0;
	i_rst_n_tb = 1;
	
	reset();
	
	i_div_ratio_tb1 = 32'd2;
	i_div_ratio_tb2 = 32'd3;
	i_div_ratio_tb3 = 32'd4;
	i_div_ratio_tb4 = 32'd5;

	#50
  $stop ;
 
 end  
    

// RESET
task reset;
 begin
 i_rst_n_tb =  'b1;
 #1
 i_rst_n_tb  = 'b0;
 #1
 i_rst_n_tb  = 'b1;
 end
endtask 

// Clock Generator
always #0.5  i_ref_clk_tb = ~i_ref_clk_tb ;

// DUT Instantation
clk_div DUT1 (
.i_ref_clk(i_ref_clk_tb),
.i_rst_n(i_rst_n_tb),
.i_clk_en(i_clk_en_tb),
.i_div_ratio(i_div_ratio_tb1),
.o_div_clk(o_div_clk_tb1)
);

clk_div DUT2 (
.i_ref_clk(i_ref_clk_tb),
.i_rst_n(i_rst_n_tb),
.i_clk_en(i_clk_en_tb),
.i_div_ratio(i_div_ratio_tb2),
.o_div_clk(o_div_clk_tb2)
);

clk_div DUT3 (
.i_ref_clk(i_ref_clk_tb),
.i_rst_n(i_rst_n_tb),
.i_clk_en(i_clk_en_tb),
.i_div_ratio(i_div_ratio_tb3),
.o_div_clk(o_div_clk_tb3)
);

clk_div DUT4 (
.i_ref_clk(i_ref_clk_tb),
.i_rst_n(i_rst_n_tb),
.i_clk_en(i_clk_en_tb),
.i_div_ratio(i_div_ratio_tb4),
.o_div_clk(o_div_clk_tb4)
);


endmodule  