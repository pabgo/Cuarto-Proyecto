`timescale 1ns / 1ps
`include "constantes.h"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:48:05 11/05/2015 
// Design Name: 
// Module Name:    adcpwm 
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
module adcpwm(
	input wire sdata,clk,reset,
	output wire sclk,cs,pwm,datolisto,Divisor50,
	output wire [15:0] regdesp
    );

wire [`F-1:0] saladc,saltrunca;

Divisores_Frecuencias relojs (
    .MasterClk(clk), 
    .reset(reset), 
    .SClk(sclk), 
    .Divisor50(Divisor50), 
    .CS(cs)
    );
	 
Recepcion_ADC adc (
    .SDATA(sdata), 
    .reset(reset), 
    .CS(cs), 
    .SCLK(sclk), 
    .rx_done_tick(datolisto), 
    .b_reg(regdesp), 
    .data_Out(saladc)
    );

truncador instance_nam (
    .Dato_In(saladc), 
    .CS(cs), 
    .Dato_Out(saltrunca)
    );

PWM instance_name (
    .clk_in(clk), 
    .Dato(saltrunca), 
    .PWM_out(pwm)
    );


endmodule
