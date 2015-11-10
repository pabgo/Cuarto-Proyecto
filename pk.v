`timescale 1ns / 1ps
`include "constantes.h"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:29:26 11/05/2015 
// Design Name: 
// Module Name:    pk 
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
module pk(
	input wire signed [`N-1:0]yk,
	input wire clk, reset, enable,
	output wire signed [`N-1:0]pk
    );

wire signed [2*`N-1:0]salidamultiplicador;
wire signed [`N-1:0]salidaFFD1;
wire signed [2*`N-1:0]salidaFFD2;
wire signed [`N-1:0]salidatruncador;
wire signed [`N-1:0]constante = 18'd18;

Registro FFD1 (
    .clk(clk), 
    .reset(reset), 
    .D(yk), 
    .Q(salidaFFD1)
    );
	 
Multiplicador Multiplicador (
    .A(salidaFFD1), 
    .B(constante), 
    .Z(salidamultiplicador)
    );
	
Registro_doble FFD2 (
    .clk(clk), 
    .reset(reset), 
    .D(salidamultiplicador), 
    .Q(salidaFFD2)
    );	
	
Truncador Truncador (
    .dato(salidaFFD2), 
    .resultado(salidatruncador)
    );

RegistroEnable RegistroEnable (
    .clk(clk), 
    .reset(reset), 
    .enable(enable), 
    .D(salidatruncador), 
    .Q(pk)
    );


endmodule
