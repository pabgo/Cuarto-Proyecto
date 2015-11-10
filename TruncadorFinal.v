`timescale 1ns / 1ps
`include "constantes.h"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:25:22 11/05/2015 
// Design Name: 
// Module Name:    truncador 
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
module truncador(
	input wire [`N-1:0]Dato_In,
	input wire CS,
	output reg [`F-2:0]Dato_Out = 0
    );

//always@(negedge CS)
//begin
//	Dato_Out = {~{Dato_In[`N-1]},Dato_In[`F-3:0]};
//	//Dato_Out = {~{Dato_In[`F-1]},Dato_In[`F-3:0]};
//end

always@(negedge CS)
begin
if(Dato_In[`N-3:`F-1]!= 8'b00000000 && Dato_In[`N-1]==0 )
	Dato_Out = 8'b11111111;
else if(Dato_In[`N-3:`F-1]!= 8'b11111111 && Dato_In[`N-1]==1)
	Dato_Out = 8'b00000000;
else
	Dato_Out = {~{Dato_In[`N-1]},Dato_In[`F-3:0]};
end

endmodule
