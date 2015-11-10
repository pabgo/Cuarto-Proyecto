`timescale 1ns / 1ps
`include "constantes.h"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:10:26 11/05/2015 
// Design Name: 
// Module Name:    SumadorEcuaciones 
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
module SumadorEcuaciones(
	input wire signed [`N-1:0]ik,
	input wire signed [`N-1:0]pk,
	input wire signed [`N-1:0]dk,
	input wire clk, reset, enable, 
	output wire signed [`N-1:0]resultado
    );

reg [`N-1:0] Q_actual,Q_next;

always@(posedge clk , posedge reset)
if(reset)
	Q_actual <=`N'b0;
else
	Q_actual<= Q_next;


always @*
if(enable)
	Q_next = ik-pk-dk;
else
	Q_next = Q_actual;


assign resultado = Q_next;

endmodule



