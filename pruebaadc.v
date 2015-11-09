`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:15:12 11/06/2015
// Design Name:   Recepcion_ADC
// Module Name:   D:/TEC/Lab Digitales/Proyecto 4/proyecto4/pruebaadc.v
// Project Name:  proyecto4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Recepcion_ADC
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module pruebaadc;

	// Inputs
	reg SDATA;
	reg reset;
	reg CS;
	reg SCLK;

	// Outputs
	wire rx_done_tick;
	wire [15:0] b_reg;
	wire [7:0] data_Out;

	// Instantiate the Unit Under Test (UUT)
	Recepcion_ADC uut (
		.SDATA(SDATA), 
		.reset(reset), 
		.CS(CS), 
		.SCLK(SCLK), 
		.rx_done_tick(rx_done_tick), 
		.b_reg(b_reg), 
		.data_Out(data_Out)
	);

	integer i,j;
	reg [15:0] aux;
	reg [15:0] data [0:99];
	
	initial begin
		// Initialize Inputs
		SDATA = 0;
		reset = 1;
		CS = 1;
		SCLK = 0;
		i = 0;
		j = 0;
		aux = 16'h0000;
		$readmemb("adc.txt",data);
		repeat(2) @(posedge SCLK);
		reset = 1'b0;

	end
	
	initial begin
	@(negedge reset);
	for(i=0;i<100;i=i+1)
	begin
	@(negedge CS);
	aux = data[i];
	for(j=16;j>0;j=j-1)
	@(negedge SCLK) 
	SDATA = aux[j-1];
	end
	$stop;
	end

	
	initial forever begin
	#39063 SCLK = ~SCLK;
	end

	initial forever begin
	#2500000 CS = ~CS;
	end

      
endmodule

