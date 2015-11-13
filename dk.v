`timescale 1ns / 1ps
`include "constantes.h"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:16:12 11/05/2015 
// Design Name: 
// Module Name:    dk 
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
module dk(
	input wire signed [`N-1:0]yk,
	input wire clk, reset, en1, en2,
	output wire signed [`N-1:0]dk
    );

wire signed [`N-1:0]salidaFFD1;
wire signed [`N-1:0]salidaFFD2;
wire signed [2*`N-1:0]salidaFFD3;
wire signed [`N-1:0]salidayk1;
wire signed [`N-1:0]entradasumador;
wire signed [`N-1:0]salidasumador;
wire signed [`N-1:0]salidatruncador;
wire signed [2*`N-1:0]salidamultiplicador;
wire signed [`N-1:0]salidaFFDEnabledk;
wire signed [`N-1:0]constante = 18'd150;

Registro FFD1 (
    .clk(clk), 
    .reset(reset), 
    .D(yk), 
    .Q(salidaFFD1)
    );
	 
RegistroEnable Yk1 (
    .clk(clk), 
    .reset(reset), 
    .enable(en1), 
    .D(salidaFFD1), 
    .Q(salidayk1)
    );
	 
assign entradasumador = ((~(salidayk1))+16'd1);

Sumador Sumador (
    .num1(salidaFFD1), 
    .num2(entradasumador), 
    .result(salidasumador)
    );
	 
Registro FFD2 (
    .clk(clk), 
    .reset(reset), 
    .D(salidasumador), 
    .Q(salidaFFD2)
    );

Multiplicador Multiplicador (
    .A(salidaFFD2), 
    .B(constante), 
    .Z(salidamultiplicador)
    );
	 
Registro_doble FFD3 (
    .clk(clk), 
    .reset(reset), 
    .D(salidamultiplicador), 
    .Q(salidaFFD3)
    );	

Truncador Truncador (
    .dato(salidaFFD3), 
    .resultado(salidatruncador)
    );

RegistroEnable RegistroEnable (
    .clk(clk), 
    .reset(reset), 
    .enable(en2), 
    .D(salidatruncador), 
    .Q(salidaFFDEnabledk)
    );

assign dk = salidaFFDEnabledk;

endmodule
