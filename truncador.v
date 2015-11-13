`timescale 1ns / 1ps
`include "constantes.h"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:42:45 10/26/2015 
// Design Name: 
// Module Name:    Truncador 
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
module Truncador(
	input wire signed [2*`N-1:0] dato,
	output wire signed [`N-1:0]resultado
    );

wire [31:0]aux1,aux0;


assign aux0 = 32'h00000000;
assign aux1 = 32'hffffffff;
assign resultado = (dato[2*`N-1]==0 && dato[2*`N-3:(2*`F)-1]==0) ? {dato[2*`N-1],dato[(2*`F)-2:0]}:
					    (dato[2*`N-1]==0 && dato[2*`N-3:(2*`F)-1]>0) ? {dato[2*`N-1],aux1[(2*`F)-2:0]}:
						 (dato[2*`N-1]==1 && (dato[2*`N-3:(2*`F)-1]==aux1[(2*`F)-2:0])) ? {dato[2*`N-1],dato[(2*`F)-2:0]}:
					    {dato[2*`N-1],aux0[(2*`F)-2:0]};

endmodule
