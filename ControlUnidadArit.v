`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:56:58 11/05/2015 
// Design Name: 
// Module Name:    ControlUnidadArit 
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
module ControlUnidadArit
(
	input wire clk,reset, //	Clock y reset
	input wire datolisto,// Banderas de entrada
	output reg enpk,endk1,endk2,enik1,enik2,operacionlisto// enables de 1:y(k), 2:f(k), 3:f(k-1), 4:f(k-2)
);
//*********************************************************

localparam [4:0] // Codificación de los estados o etiquetas
	espera = 3'b000,
	wait1 = 3'b001,
	wait2 = 3'b010,
	wait3 = 3'b011,
	wait4 = 3'b100,
	suma = 3'b101;
/*	espera = 5'b00000,
	oper1 = 5'b00001,
	wait11 = 5'b00010,
	wait12 = 5'b00011,
	wait13 = 5'b00100,
	wait14 = 5'b00101,
	oper2 = 5'b00110,
	wait21 = 5'b00111,
	wait22 = 5'b01000,
	wait23 = 5'b01001,
	wait24 = 5'b01010,
	oper3 = 5'b01011,
	wait31 = 5'b01100,
	wait32 = 5'b01101,
	wait33 = 5'b01110,
	wait34 = 5'b01111,
	oper4 = 5'b10000,
	wait41 = 5'b10001,
	wait42 = 5'b10010,
	wait43 = 5'b10011,
	wait44 = 5'b10100,
	oper5 = 5'b10101,
	wait51 = 5'b10110,
	wait52 = 5'b10111,
	wait53 = 5'b11000,
	wait54 = 5'b11001,
	oper6 = 5'b11010,
	result = 5'b11011;*/

reg [2:0] estadoactual, estadosig; // Reg, estado actual y siguiente

//*********************************************************

//Parte Secuencial

always@(posedge clk, posedge reset)
begin
	if(reset)
		estadoactual <= espera;
	else
		estadoactual <= estadosig;
end

//*********************************************************

//Parte Combinacional
always@*
begin
	estadosig = estadoactual;
	enpk = 0;
	endk1 = 0;
	endk2 = 0;
	enik1 = 0;
	enik2 = 0;
	operacionlisto = 0;

	case(estadoactual)
		espera:
			if(datolisto)
				estadosig = wait1;

		wait1:
			estadosig = wait2;						
		
		wait2:
		begin
			endk1 = 1'b1;
			estadosig = wait3;
		end
		
		wait3:
		begin
			enpk = 1'b1;
			estadosig = wait4;
		end
		
		wait4:
		begin
			endk2 = 1'b1;
			enik1 = 1'b1;
			enik2 = 1'b1;
			estadosig = suma;
		end
		
		suma:
		begin
			operacionlisto = 1'b1;
			estadosig = espera;
		end
		
		default: 
			estadosig = espera;
			
	endcase
end

endmodule
