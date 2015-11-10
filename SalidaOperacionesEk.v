`timescale 1ns / 1ps
`include "constantes.h"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:37:11 11/08/2015 
// Design Name: 
// Module Name:    SalidaOperacionesEk 
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
module SalidaOperacionesEk(
	input wire clk,reset, //	Clock y reset
	input wire datolisto,// Banderas de entrada
	input wire signed [`N-1:0]yk, ref,
	output wire signed [`N-1:0]resultado
	);
	
wire [`N-1:0]ek,ik,dk,pk;
wire enpk,endk1,endk2,enik1,enik2,operacionlisto;
	
ControlUnidadAritmetica Control (
    .clk(clk), 
    .reset(reset), 
    .datolisto(datolisto), 
    .enpk(enpk), 
    .endk1(endk1), 
    .endk2(endk2), 
    .enik1(enik1), 
    .enik2(enik2), 
    .operacionlisto(operacionlisto)
    );

pk ecuacionpk (
    .yk(yk), 
    .clk(clk), 
    .reset(reset), 
    .enable(enpk), 
    .pk(pk)
    );

dk ecuaciondk (
    .yk(yk), 
    .clk(clk), 
    .reset(reset), 
    .en1(endk1), 
    .en2(endk2), 
    .dk(dk)
    );
	 
ek ecuacionek (
    .ref(ref), 
    .yk(yk), 
    .ek(ek)
    );
	 
ik ecuacionik (
    .ek(ek), 
    .clk(clk), 
    .reset(reset), 
    .en1(enik1), 
    .en2(enik2), 
    .ik(ik)
    );	
	 
SumadorEcuaciones Suma (
    .ik(ik), 
    .pk(pk), 
    .dk(dk), 
    .clk(clk), 
    .reset(reset), 
    .enable(operacionlisto), 
    .resultado(resultado)
    );


endmodule
