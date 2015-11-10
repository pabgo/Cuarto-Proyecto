`timescale 1ns / 1ps
`include "constantes.h"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:48:04 11/08/2015 
// Design Name: 
// Module Name:    FFDSinc9 
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
module FFDSinc9(
   input wire clk,reset,
	input wire [`N-1:0] datos,
	input wire enable,
	output wire [`N-1:0] Q_out );
 
 reg [`N-1:0] Q_actual,Q_next;
 
always@(posedge clk , posedge reset)

if(reset)
	begin
	Q_actual <=18'b0;

	end

else

	begin

	Q_actual<= Q_next;
	
	end

always @*

	if(enable)

		Q_next=datos;

	else

		Q_next = Q_actual;


assign Q_out = Q_next;

endmodule
