`timescale 1ns / 1ps
`include "constantes.h"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:04:47 08/27/2015 
// Design Name: 
// Module Name:    RecepcionPS2 
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
module RecepcionPS2(
	input wire clk,reset, //	Clock y reset
	input wire [7:0] datos,
	input wire rx_done_tick,
	output wire [`N-1:0] ref
    );
	 
wire [7:0] datosFF1, datosFF2;
wire enableF0;

// Instantiate the module
FFDSinc FF1_entrada (
    .clk(clk), 
    .reset(reset), 
    .datos(datos), 
    .enable(rx_done_tick), 
    .Q_out(datosFF1)
    );

// Instantiate the module
MaquinaF0 detectorF0 (
    .clk(clk), 
    .reset(reset), 
    .data_in(datosFF1), 
    .enableFF(enableF0)
    );
	 
// Instantiate the module
FFDSinc FF1_F0_Validacion (
    .clk(clk), 
    .reset(reset), 
    .datos(datosFF1), 
    .enable(enableF0), 
    .Q_out(datosFF2)
    );
	 
// Instantiate the module
ValidacionConFF Tecla_Valida (
    .clk(clk), 
    .reset(reset), 
    .data_in(datosFF2), 
    .ref(ref)
    );
	 
endmodule
