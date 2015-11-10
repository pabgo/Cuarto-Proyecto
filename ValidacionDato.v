`timescale 1ns / 1ps
`include "constantes.h"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:52:47 08/25/2015 
// Design Name: 
// Module Name:    ValidacionDato 
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
module ValidacionDato
#(parameter N = 8)
	(
	input wire clk, reset, //	Clock y reset
	input wire [N-1:0] data_in,// Banderas de entrada
//	output reg [1:0] estado_actual,
	output reg enable,
	output reg [`N-1:0] ref
);

//*********************************************************

localparam [1:0] // Codificacion de los estados o etiquetas 
	inicio = 2'b00,
	estado_1 = 2'b01,
	estado_2 = 2'b10,
	estado_3 = 2'b11;

reg [1:0] estado, estado_proximo; // Reg, estado actual y siguiente 
//reg [2:0] aux_corriente = 3'b000;
//reg aux_humo = 1'b0;




//*********************************************************
//Parte Secuencial

always@(posedge clk, posedge reset)
	if (reset)
		estado <= inicio;
	else
		estado <= estado_proximo;


//*********************************************************

//Parte Combinacional
always@*
begin
   		
	estado_proximo = estado;
//	estado_actual = 2'b00;
	ref = 32'h00000000;
	enable = 1'b0;


	//se quita la inicializacion de variables pues otorga un error
	
	case(estado)
		
		inicio: // decide actuar si el dato es enter
			begin
//			estado_actual = 2'b00;
			case (data_in)
				
				8'h5a:
					begin
					estado_proximo = estado_1;
					end
				
				default:
					begin
					estado_proximo = inicio;
					end
			endcase
			end
			
		estado_1: // decide si el dato luego de enter es valido para realizar alguna accion en el circuito
			begin
//			estado_actual = 2'b01;
			case (data_in)
			
					
				8'h16:// tecla 1
					begin
					estado_proximo = estado_1;
					ref  = 18'b111111111100000000;
					enable = 1'b1;
					end
					
				8'h1e:// tecla 2
					begin
					estado_proximo = estado_1;
					ref  = 18'b111111111101000001;
					enable = 1'b1;
					end
					
				8'h26:// tecla 3
					begin
					estado_proximo = estado_1;
					ref  = 18'b111111111110000000;
					enable = 1'b1;
					end
					
				8'h25:// tecla 4
					begin
					estado_proximo = estado_1;
					ref  = 18'b111111111111000000;
					enable = 1'b1;
					end
					
				8'h2e:// tecla 5
					begin
					estado_proximo = estado_1;
					ref  = 18'b000000000000000000;
					enable = 1'b1;
					end
					
				8'h36:// tecla 6
					begin
					estado_proximo = estado_1;
					ref  = 18'b000000000001000000;
					enable = 1'b1;
					end
					
				8'h3d:// tecla 7
					begin
					estado_proximo = estado_1;
					ref  = 18'b000000000010000000;
					enable = 1'b1;
					end
					
				8'h3e:// tecla 8
					begin
					estado_proximo = estado_1;
					ref  = 18'b000000000010111111;
					enable = 1'b1;
					end
					
				8'h46://tecla 9
					begin
					estado_proximo = estado_1;
					ref  = 18'b000000000011111111;
					enable = 1'b1;
					end
					
				8'h24: //tecla e
					begin
					estado_proximo = inicio;
					end
				
				default:
					begin
					estado_proximo = estado_1;
					end
			endcase
			end	
			
		
		default:
			begin
			estado_proximo = inicio;
			ref = 3'b000;
			end
			
	endcase
end
endmodule

