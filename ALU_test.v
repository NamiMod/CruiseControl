`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:54:30 09/11/2020
// Design Name:   ALU
// Module Name:   C:/Users/Home/Desktop/lab5/CruiseControl/ALU_test.v
// Project Name:  CruiseControl
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALU_test;

	// Inputs
	reg [1:0] mode;
	reg [7:0] d_speed;
	reg [7:0] c_speed;
	reg clock;

	// Outputs
	wire G;
	wire EQ;
	wire L;
	wire [7:0] out_speed;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.mode(mode), 
		.d_speed(d_speed), 
		.c_speed(c_speed), 
		.clock(clock), 
		.G(G), 
		.EQ(EQ), 
		.L(L), 
		.out_speed(out_speed)
	);
	initial begin
	
	clock=0;
	repeat(50)
	#100
	clock=~clock;
	
	end
	
	initial begin
	
		#100
		
		mode = 2'b00;
		d_speed = 8'b00001000;
		c_speed = 8'b00000001;
		
		#200
		
		mode = 2'b01;
		d_speed = 8'b00101000;
		c_speed = 8'b00010001;
		
		#200
		
		mode = 2'b10;
		d_speed = 8'b00001000;
		c_speed = 8'b00000001;
		
		#200
	
		mode = 2'b11;
		d_speed = 8'b00001000;
		c_speed = 8'b00000001;
		
		
	end
      
endmodule

