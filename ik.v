`timescale 1ns / 1ps
`include "constantes.h"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:09:38 11/05/2015 
// Design Name: 
// Module Name:    ik 
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
module ik(
	input wire signed [`N-1:0]ek,
	input wire clk, reset, en1, en2,
	output wire signed [`N-1:0]ik
    );

wire signed [`N-1:0]salidaFFD1;
wire signed [2*`N-1:0]salidaFFD2;
wire signed [2*`N-1:0]salidaFFD3;
wire signed [2*`N-1:0]salidaik1;
wire signed [2*`N-1:0]salidasumador;
wire signed [`N-1:0]salidatruncador;
wire signed [2*`N-1:0]salidamultiplicador;
wire signed [`N-1:0]constante = 18'd7;
wire m;

Registro FFD1 (
    .clk(clk), 
    .reset(reset), 
    .D(ek), 
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

Sumador_doble SumadorDobleAncho (
    .num1(salidaFFD2), 
    .num2(salidaik1), 
    .result(salidasumador)
    );
	 
Registro_doble FFD3 (
    .clk(clk), 
    .reset(reset), 
    .D(salidasumador), 
    .Q(salidaFFD3)
    );
	 
RegistroEnable_doble ik1 (
    .clk(clk), 
    .reset(reset), 
    .enable(en1), 
    .D(salidaFFD3), 
    .Q(salidaik1)
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
    .Q(ik)
    );

	 
endmodule
