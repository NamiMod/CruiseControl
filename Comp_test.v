`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:14:15 09/10/2020
// Design Name:   Comp8
// Module Name:   C:/Users/Home/Desktop/lab5/CruiseControl/Comp_test.v
// Project Name:  CruiseControl
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Comp8
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Comp_test;

	// Inputs
	reg [7:0] A;
	reg [7:0] B;

	// Outputs
	wire L;
	wire EQ;
	wire G;

	// Instantiate the Unit Under Test (UUT)
	Comp8 uut (
		.A(A), 
		.B(B), 
		.L(L), 
		.EQ(EQ), 
		.G(G)
	);

	initial begin
		
		A = 8'b00010001;
		B = 8'b00010001;
		#100;
		
		A = 8'b00010010;
		B = 8'b00010001;
		#100;
		
		A = 8'b01000100;
		B = 8'b00010000;
		#100
		
		A = 8'b00110000;
		B = 8'b00110001;
		#100;
		
		A = 8'b00010001;
		B = 8'b00010000;
		#100;
		
		A = 8'b00000101;
		B = 8'b00010100;
		#100;
		
		A = 8'b00000000;
		B = 8'b00000000;
		
	end
      
endmodule

