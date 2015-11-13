`timescale 1ns / 1ps
`include "constantes.h"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:42:45 10/26/2015 
// Design Name: 
// Module Name:    Truncador 
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
module Truncador(
	input wire signed [2*`N-1:0] dato,
	output wire signed [`N-1:0]resultado
    );

wire [31:0]aux1,aux0;

<<<<<<< HEAD

assign aux0 = 32'h00000000;
assign aux1 = 32'hffffffff;
assign resultado = (dato[2*`N-1]==0 && dato[2*`N-3:(2*`F)-1]==0) ? {dato[2*`N-1],dato[(2*`F)-2:0]}:
					    (dato[2*`N-1]==0 && dato[2*`N-3:(2*`F)-1]>0) ? {dato[2*`N-1],aux1[(2*`F)-2:0]}:
						 (dato[2*`N-1]==1 && (dato[2*`N-3:(2*`F)-1]==aux1[(2*`F)-2:0])) ? {dato[2*`N-1],dato[(2*`F)-2:0]}:
					    {dato[2*`N-1],aux0[(2*`F)-2:0]};
=======
always@(negedge CS)
begin
if(Dato_In[`N-3:`F-1]!= 8'b00000000 && Dato_In[`N-1]==0 )
	Dato_Out = 8'b11111111;
else if(Dato_In[`N-3:`F-1]!= 8'b11111111 && Dato_In[`N-1]==1)
	Dato_Out = 8'b00000000;
else
	Dato_Out = {~{Dato_In[`N-1]},Dato_In[`F-2:1]};
end
>>>>>>> origin/master

endmodule
