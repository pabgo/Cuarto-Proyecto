`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:32:57 11/06/2015
// Design Name:   adcpwm
// Module Name:   D:/TEC/Lab Digitales/Proyecto 4/proyecto4/pruebaadcpwm.v
// Project Name:  proyecto4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: adcpwm
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module pruebaadcpwm;

	// Inputs
	reg sdata;
	reg clk;
	reg reset;

	// Outputs
	wire sclk;
	wire cs;
	wire pwm;
	wire datolisto;
	wire Divisor50;
	wire [15:0] regdesp;

	// Instantiate the Unit Under Test (UUT)
	adcpwm uut (
		.sdata(sdata), 
		.clk(clk), 
		.reset(reset), 
		.sclk(sclk), 
		.cs(cs), 
		.pwm(pwm), 
		.datolisto(datolisto), 
		.Divisor50(Divisor50), 
		.regdesp(regdesp)
	);

	integer i,j;
	reg [15:0] aux;
	reg [15:0] data [0:99];
	
	initial begin
		// Initialize Inputs
		sdata = 0;
		reset = 1;
		i = 0;
		j = 0;
		aux = 16'h0000;
		$readmemb("adc.txt",data);
		repeat(2) @(posedge sclk);
		reset = 1'b0;

	end
	
	initial begin
	@(negedge reset);
	for(i=0;i<100;i=i+1)
	begin
	@(negedge cs);
	aux = data[i];
	for(j=16;j>0;j=j-1)
	@(negedge sclk) 
	sdata = aux[j-1];
	end
	$stop;
	end

	
	initial forever begin
	#5 clk = ~clk;
	end
      
endmodule

