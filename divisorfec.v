`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    
// Design Name: 
// Module Name:    Divisores_Frecuencia 
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
module Divisores_Frecuencias(
	input wire MasterClk,       //Se�al de entrada, referente a comportamiento de reloj.
	input wire reset,     //Reset de se�al.
	output reg SClk,Divisor50,CS    //Se�ales de salida del divisor, se�ales ya divididas.
    );

reg [11:0] Scuenta; //Contadores
reg [5:0] Ccuenta;
					   
 always @(posedge MasterClk, posedge reset) 
	begin
		if (reset)
			begin
				SClk <= 0;
				Scuenta <= 0;
			end 
		else 
			begin		
				if (Scuenta == 12'd3906)
					begin                    
						Scuenta <= 12'd0;    
						SClk <= ~SClk;  //
					end 
				else 
					Scuenta <= Scuenta + 1'b1; 
			end
	end
 
 always @(negedge SClk,  posedge reset) 
 begin
		if (reset) 
			begin
				CS <= 0;
				Ccuenta <= 0;
			end 
		
		else 
			begin		
				if (Ccuenta == 6'd32)    
					begin                    
						Ccuenta <= 6'd0;    
						CS <= ~CS;
					end 
				else 
					Ccuenta <= Ccuenta + 1'b1; 
			end
	end

always @(posedge MasterClk, posedge reset) 
	begin
		if (reset)
				Divisor50 <= 0;
		else 
			Divisor50 <= ~Divisor50;
	end
	
endmodule
