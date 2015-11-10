`timescale 1ns / 1ps
`include "constantes.h"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:02:07 11/05/2015 
// Design Name: 
// Module Name:    RegistroEnable_doble 
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
module RegistroEnable_doble(
   input wire clk,reset,enable,
	input wire [2*`N-1:0] D,
	output wire [2*`N-1:0] Q
 );
 
reg [2*`N-1:0] Q_actual,Q_next;

always@(posedge clk , posedge reset)
if(reset)
	Q_actual <=2*`N'b0;
else
	Q_actual<= Q_next;


always @*
if(enable)
	Q_next = D;
else
	Q_next = Q_actual;


assign Q = Q_next;

endmodule

