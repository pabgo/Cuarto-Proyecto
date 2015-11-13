`timescale 1ns / 1ps
`include "constantes.h"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:04:47 11/07/2015 
// Design Name: 
// Module Name:    Restador 
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
module Restador(
	input wire signed [`N-1:0]num1,
	input wire signed [`N-1:0]num2,
	output wire signed [`N-1:0]result
    );
	 
wire signed [`N-1:0]aux;
wire [65:0]aux1,aux2;

assign aux1 = 66'h00000000000000000;
assign aux2 = 66'hfffffffffffffffff;
assign aux = num1 - num2;
assign result = (num1[`N-1]==0 && num2[`N-1]==0 && aux[`N-1]==1) ? {2'b00,aux2[`N-3:0]}:
					 (num1[`N-1]==1 && num2[`N-1]==1 && aux[`N-1]==0) ? {2'b11,aux1[`N-3:0]}:
					  aux;

endmodule
