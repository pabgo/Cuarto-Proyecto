`timescale 1ns / 1ps
`include "constantes.h"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:32:29 11/04/2015 
// Design Name: 
// Module Name:    Registro 
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
module Registro(
	input wire clk,reset,
	input wire [`N-1:0] D,
	output reg [`N-1:0] Q
 );

always@(posedge clk,posedge reset)
if(reset)
	Q <= 0;
else
	Q <= D;


endmodule
