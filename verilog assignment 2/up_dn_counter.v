`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:19:21 08/03/2022 
// Design Name: 
// Module Name:    up_dn_counter 
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
module up_dn_counter(
input [4:0] in,
input load,
input up,
input down,
input clk,
output high,
output reg [4:0] counter,
output low
    );

always @(posedge clk)begin
if (load)
counter <= in;
else if (down && !low)
counter <= counter - 1;
else if (up && !high)
counter <= counter + 1;
end

assign high = counter == 31;
assign low = counter == 0;

endmodule
