`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:07:51 11/06/2015
// Design Name:   PWM
// Module Name:   D:/TEC/Lab Digitales/Proyecto 4/proyecto4/pruebapwm.v
// Project Name:  proyecto4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PWM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module pruebapwm;

	// Inputs
	reg clk_in;
	reg [7:0] Dato;

	// Outputs
	wire PWM_out;

	// Instantiate the Unit Under Test (UUT)
	PWM uut (
		.clk_in(clk_in), 
		.Dato(Dato), 
		.PWM_out(PWM_out)
	);

	integer j;
	reg iniciar;
	reg [7:0] data [0:14];
	
	initial begin
		// Initialize Inputs
		clk_in = 0;
		iniciar = 1;
		$readmemb("datospwm.txt",data);
		repeat(5) @(posedge clk_in)
		iniciar = 0;
	end

	initial begin
	@(negedge iniciar)
	for(j=0;j<15;j=j+1)
	begin
		Dato = data[j];
		repeat(256) @(posedge clk_in);
	end
	$stop;
	end
	
	initial forever begin
	#5 clk_in = ~clk_in;
	end
	
      
endmodule

