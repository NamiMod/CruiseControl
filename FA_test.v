`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:58:42 09/10/2020
// Design Name:   FA8
// Module Name:   C:/Users/Home/Desktop/lab5/CruiseControl/FA_test.v
// Project Name:  CruiseControl
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FA8
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module FA_test;

	// Inputs
	reg [7:0] A;
	reg [7:0] B;
	reg Select;

	// Outputs
	wire [7:0] Sum;
	wire Cout;

	// Instantiate the Unit Under Test (UUT)
	FA8 uut (
		.A(A), 
		.B(B), 
		.Select(Select), 
		.Sum(Sum), 
		.Cout(Cout)
	);

	initial begin
		
		A = 8'b00000001;
		B = 8'b00000001;
		Select = 0;

		#100;
		
		A = 8'b10000000;
		B = 8'b00000000;
		Select = 0;

		#100;
		
		A = 8'b01101010;
		B = 8'b00011010;
		Select = 0;

		#100;
		
		A = 8'b00110000;
		B = 8'b00000001;
		Select = 1;
		
		#100;
		
		A = 8'b11111000;
		B = 8'b00000111;
		Select = 1;
		
		#100;
		
		A = 8'b11111111;
		B = 8'b11111111;
		Select = 0;
		
		#100
		
		A = 8'b00000000;
		B = 8'b00000011;
		Select = 1;
		
		
	end
   
endmodule

