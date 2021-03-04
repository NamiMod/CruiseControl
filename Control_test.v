`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:38:17 09/14/2020
// Design Name:   Control
// Module Name:   C:/Users/Home/Desktop/lab5/CruiseControl/Control_test.v
// Project Name:  CruiseControl
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Control
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Control_test;

	// Inputs
	reg [2:0] awareness;
	reg speed_up;
	reg speed_down;
	reg clock;

	// Outputs
	wire [2:0] fuel;
	wire [7:0] c_speed;
	wire [7:0] speed;
	wire brake;
	wire EQ;
	wire L;
	wire G;

	// Instantiate the Unit Under Test (UUT)
	Control uut (
		.c_speed(c_speed), 
		.speed(speed), 
		.awareness(awareness), 
		.speed_up(speed_up), 
		.speed_down(speed_down), 
		.clock(clock), 
		.fuel(fuel), 
		.L(L),
		.G(G),
		.EQ(EQ),
		.brake(brake)
	);
	initial begin
	
		clock = 0;
		repeat(10000)
		#25
		clock = ~ clock;
	
	end
	initial begin

	#50
	
	speed_up = 1;
	speed_down = 0;
	
	#50
	
	speed_up = 0;
	speed_down = 0;
	
	#50
	speed_up = 1;
	speed_down = 0;
	
	#50
	
	speed_up = 0;
	speed_down = 0;
	
	#50
	
	speed_up = 0;
	speed_down = 1;
	
	#50
	
	speed_up = 0;
	speed_down = 0;
		
	#50
	
	speed_up = 0;
	speed_down = 1;
	#50
	speed_down=0;
	speed_up=0;
	
	#50
	speed_up = 0;
	speed_down = 0;
	awareness = 3'b101;
	
	#50
	
	speed_up = 0;
	speed_down=0;
	awareness = 3'b010;
	
	#50
	
	speed_up=1;
	speed_down=0;
	awareness = 3'b011;
	
	#50
	
	speed_up=0;
	speed_down=0;
	awareness = 3'b101;
	 
	#50
	speed_up=0;
	speed_down=0;
	awareness = 3'b001;
	
	#50
	speed_up=0;
	speed_down=0;
	awareness = 3'b000;
	
	
	
	end
endmodule

