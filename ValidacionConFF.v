`timescale 1ns / 1ps
`include "constantes.h"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:36:18 09/05/2015 
// Design Name: 
// Module Name:    ValidacionConFF 
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
module ValidacionConFF
#(parameter N = 8)
	(
	input wire clk, reset, //	Clock y reset
	input wire [N-1:0] data_in,// Banderas de entrada
	output wire [`N-1:0] ref
    );
	 
wire enable;
wire [`N-1:0] datovalido;


ValidacionDato DatoValido (
    .clk(clk), 
    .reset(reset), 
    .data_in(data_in), 
    .enable(enable), 
    .ref(datovalido)
    );


FFDSinc9 RegistroSalida (
    .clk(clk), 
    .reset(reset), 
    .datos(datovalido), 
    .enable(enable), 
    .Q_out(ref)
    );

endmodule

