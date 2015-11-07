`timescale 1ns / 1ps
`include "constantes.h"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:12:06 09/30/2015 
// Design Name: 
// Module Name:    ADCVersion4 
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
module PWM(
	input wire clk_in,						//clock for counter
	input wire [7:0] Dato, 				//control value that
	output reg PWM_out );		//PWM signal out

	reg [7:0] counter = 0;
	
	always@ (posedge clk_in)
		begin
			if (counter < Dato)
				PWM_out <= 1;
			else
				PWM_out <= 0;
		counter <= counter+1'b1;
		end
endmodule
   