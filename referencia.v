`timescale 1ns / 1ps
`include "constantes.h"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:42:44 11/10/2015 
// Design Name: 
// Module Name:    Referencia 
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
module Referencia(
	input wire clk,reset,
	input wire sw0, sw1, sw2, sw3, sw4, sw5, sw6, sw7, sw8, enable,
	output wire signed [`N-1:0]ref
    );

wire signed [`N-1:0]combinacion;

assign combinacion = {{9{sw8}},sw8,sw7,sw6,sw5,sw4,sw3,sw2,sw1,sw0};

RegistroEnable RegistroEnable (
    .clk(clk), 
    .reset(reset), 
    .enable(enable), 
    .D(combinacion), 
    .Q(ref)
    );
	 
endmodule
