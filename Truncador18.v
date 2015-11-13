`timescale 1ns / 1ps
`include "constantes.h"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:47:00 11/09/2015 
// Design Name: 
// Module Name:    Truncador18 
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
module Truncador18(
	input wire signed[`N-1:0]Dato_In,
	output wire [`F-2:0]Dato_Out
    );

wire signed [`N-1:0]aux;
//always@(negedge CS)
//begin
//	Dato_Out = {~{Dato_In[`N-1]},Dato_In[`F-3:0]};
//	//Dato_Out = {~{Dato_In[`F-1]},Dato_In[`F-3:0]};
//end

//always@(negedge CS)
//begin
	assign Dato_Out = {/*~*/{aux[`N-1]},aux[`N-2:`N-8]};//`N-2:`N-8``
	assign aux = Dato_In + `N'd128;
//end

endmodule
