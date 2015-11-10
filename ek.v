`timescale 1ns / 1ps
`include "constantes.h"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:35:02 11/05/2015 
// Design Name: 
// Module Name:    ek 
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
module ek(
	input wire signed [`N-1:0]ref,
	input wire signed [`N-1:0]yk,
	output wire signed [`N-1:0]ek
    );
	 
wire signed [`N-1:0]aux;

assign aux = ref - yk;
assign ek = (aux[`N-1]==0 && aux[`N-3:`F-1]!=8'b00000000) ? {aux[`N-1:`N-2],8'b00000000,8'b11111111}:
					 (aux[`N-1]==1 && aux[`N-3:`F-1]!=8'b11111111) ? {aux[`N-1:`N-2],8'b11111111,8'b00000000}:
					  aux;

endmodule
