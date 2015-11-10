`timescale 1ns / 1ps
`include "constantes.h"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:32:17 11/09/2015 
// Design Name: 
// Module Name:    Principal 
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
module Principal(
	input wire clk, reset,  ///Clock de la Nexys y reset 
	input wire ps2d, ps2c,   ////ps2c es el clock del PS2, rx_en es usado para abilitar o no la operación de recepción de datos
//// psd2 
	input wire sdata,
	output wire Divisor50, sclk, cs,
	output wire [15:0] regdesp,
	output wire pwm
	);

wire datolisto;
wire signed [`N-1:0] ref, yk, resultado;
wire [7:0] salidatruncadorfinal;

Divisores_Frecuencias Relojes (
    .MasterClk(clk), 
    .reset(reset), 
    .SClk(sclk), 
    .Divisor50(Divisor50), 
    .CS(cs)
    );


Recepcion_ADC ADC (
    .SDATA(sdata), 
    .reset(reset), 
    .CS(cs), 
    .SCLK(sclk), 
    .rx_done_tick(datolisto), 
    .b_reg(regdesp), 
    .data_Out(yk)
    );
	
PrincipalTeclado TecladoReferencia (
    .clk(clk), 
    .reset(reset), 
    .ps2d(ps2d), 
    .ps2c(ps2c), 
    .ref(ref)
    );
	
SalidaOperacionesEk Operaciones (
    .clk(clk), 
    .reset(reset), 
    .datolisto(datolisto), 
    .yk(yk), 
    .ref(ref), 
    .resultado(resultado)
    );

Truncador18 TruncadorFinal (
    .Dato_In(resultado), 
    .CS(cs), 
    .Dato_Out(salidatruncadorfinal)
    );

PWM PWMFinal (
    .clk_in(clk), 
    .Dato(salidatruncadorfinal), 
    .PWM_out(pwm)
    );
	 
endmodule
