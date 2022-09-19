.`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:54:51 08/11/2022 
// Design Name: 
// Module Name:    ALU_module 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ALU_module(input  [15:0] A,
						input  [15:0] B,						
						input  [3:0]  ALU_FUN,
						input         CLK,
						
						output reg [15:0] ALU_OUT,
						output        Arith_flag,
						output        Logic_flag,
						output        CMP_flag,
						output        Shift_flag
						); 
						
	 // Internal Signals
	 reg [15:0]   ALU_OUT_comb ;


	 always @(posedge CLK)begin
				ALU_OUT <= ALU_OUT_comb;
	 end
	 
	 always @(*)begin
				case(ALU_FUN)
					4'b0000: ALU_OUT_comb = A + B; 
					4'b0001: ALU_OUT_comb = A - B; 
					4'b0010: ALU_OUT_comb = A * B; 
					4'b0011: ALU_OUT_comb = A / B; 
					
					4'b0100: ALU_OUT_comb = A & B; 
					4'b0101: ALU_OUT_comb = A | B; 
					4'b0110: ALU_OUT_comb = ~(A & B); 
					4'b0111: ALU_OUT_comb = ~(A | B); 					
					4'b1000: ALU_OUT_comb = A ^ B; 
					4'b1001: ALU_OUT_comb = ~(A ^ B); 
					
					4'b1010: ALU_OUT_comb = (A == B)? 16'd1: 16'b0; 
					4'b1011: ALU_OUT_comb = (A > B)? 16'd2: 16'b0;		
					4'b1100: ALU_OUT_comb = (A < B)? 16'd3: 16'b0;
					
					4'b1101: ALU_OUT_comb = A >> 1; 
					4'b1110: ALU_OUT_comb = A << 1;
					default: ALU_OUT_comb = 16'b0;
				endcase
	 end
	 
	 assign Arith_flag = (ALU_FUN == 4'b0000 || ALU_FUN == 4'b0001 || ALU_FUN == 4'b0010 || ALU_FUN == 4'b0011) ? 1 : 0;
	 assign Logic_flag = (ALU_FUN==4'b0100||ALU_FUN==4'b0101||ALU_FUN==4'b0110||ALU_FUN==4'b0111||ALU_FUN==4'b1000||ALU_FUN==4'b1001) ? 1 : 0;
	 assign CMP_flag = (ALU_FUN == 4'b1010 || ALU_FUN == 4'b1011 || ALU_FUN == 4'b1100) ? 1 : 0;
	 assign Shift_flag = (ALU_FUN == 4'b1101 || ALU_FUN == 4'b1110) ? 1 : 0;

endmodule

 
