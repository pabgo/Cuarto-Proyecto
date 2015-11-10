`timescale 1ns / 1ps
`include "constantes.h"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:12:49 11/05/2015 
// Design Name: 
// Module Name:    Registro_doble 
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
module Registro_doble(
  	input wire clk,reset,
	input wire [2*`N-1:0] D,
	output reg [2*`N-1:0] Q
 );

always@(posedge clk,posedge reset)
if(reset)
	Q <= 0;
else
	Q <= D;


endmodule