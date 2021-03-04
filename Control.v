`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:49:45 09/11/2020 
// Design Name: 
// Module Name:    Control 
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
module Control(
	 // start value of c_speed and speed : 5
    output reg [7:0] c_speed = 8'b00000101,
    output reg [7:0] speed = 8'b00000101,
    input [2:0] awareness,
    input speed_up,
    input speed_down,
    input clock,
	 // start value of fuel : 2
    output reg [2:0] fuel = 3'b010,
	 output reg L = 0,
	 output reg EQ = 1,
	 output reg G = 0,
    output reg brake = 0
   );
	
	wire [7:0] c_speed_check;
	wire [7:0] speed_check ;
	wire [7:0] speed_check_pos ;
	wire [7:0] speed_check_neg ;
	wire l0,e0,g0;
	wire l1,e1,g1;
	wire [7:0] D;
	
	// mode_0 : compare
	// mode_1 : add
	// mode_2 : sub
	
	wire [1:0] mode_0 = 2'b01;
	wire [1:0] mode_1 = 2'b10;
	wire [1:0] mode_2 = 2'b11;
		
	ALU a1(mode_1,c_speed,speed,clock,speed_check_pos,l0,e0,g0);
	ALU a2(mode_2,c_speed,speed,clock,speed_check_neg,l1,e1,g1);
	// speed : up/down
	always @ (posedge clock)	
		if (speed_up == 1'b1)
			speed = speed_check_pos;
		else if (speed_down == 1'b1)
			speed = speed_check_neg;	
		
	assign D = (c_speed>speed)?(c_speed-speed):(speed-c_speed);
	// conditions
	always @ (posedge clock)
		if (L == 0 && EQ == 1 && G == 0 && awareness > 3'b100)begin
			L = 0;
			EQ = 0;
			G = 1;
			fuel = 3'b100;
			c_speed = c_speed + 1;
		end
		else if (L == 0 && EQ == 1 && G == 0 && awareness == 3'b000)begin
			L = 1;
			EQ = 0;
			G = 0;
			fuel = 3'b000;
			c_speed = 8'b00000000;
			brake = 1;
		end
		else if (L == 0 && EQ == 1 && G == 0 && awareness == 3'b001)begin
			L = 1;
			EQ = 0;
			G = 0;
			fuel = 3'b000;
			c_speed = c_speed - 1;
		end
		else if (L == 0 && EQ == 1 && G == 0 && awareness == 3'b010)begin
			L = 0;
			EQ = 1;
			G = 0;
		end
		else if (L == 0 && EQ == 1 && G == 0 && awareness == 3'b011)begin
			L = 0;
			EQ = 1;
			G = 0;
		end
	always @ (posedge clock)
		 if (L == 0 && EQ == 0 && G == 1 && awareness > 3'b100 && D == 1)begin
			L = 0;
			EQ = 1;
			G = 0;
			fuel = fuel - 1;
			c_speed = c_speed - 1;
		end
		else if (L == 0 && EQ == 0 && G == 1 && awareness > 3'b100 && D > 1)begin
			L = 0;
			EQ = 0;
			G = 1;
			fuel = fuel - 1;
			c_speed = c_speed - 1;
		end
		else if (L == 0 && EQ == 0 && G == 1 && awareness > 3'b010 )begin
			L = 0;
			EQ = 0;
			G = 1;
		end
		else if (L == 0 && EQ == 0 && G == 1 && awareness > 3'b011 )begin
			L = 0;
			EQ = 0;
			G = 1;
		end
		else if (L == 0 && EQ == 0 && G == 1 && awareness == 3'b001 )begin
			L = 1;
			EQ = 0;
			G = 0;
			fuel = 3'b000;
			c_speed = c_speed - 1;
		end
		else if (L == 0 && EQ == 0 && G == 1 && awareness == 3'b000 )begin
			L = 1;
			EQ = 0;
			G = 0;
			fuel = 3'b000;
			c_speed = 8'b00000000;
			brake = 1;
		end
		always @ (posedge clock)
		 if (L == 1 && EQ == 0 && G == 0 && awareness > 3'b100 && D == 1 )begin
			L = 0;
			EQ = 1;
			G = 0;
			fuel = fuel +1;
			c_speed = c_speed + 1;
		end
		else if (L == 1 && EQ == 0 && G == 0 && awareness > 3'b100 && D > 1 )begin
			L = 1;
			EQ = 0;
			G = 0;
			fuel = fuel +1;
			c_speed = c_speed + 1;
		end
		else if (L == 1 && EQ == 0 && G == 0 && awareness == 3'b010  )begin
			L = 1;
			EQ = 0;
			G = 0;
		end
		else if (L == 1 && EQ == 0 && G == 0 && awareness == 3'b011  )begin
			L = 1;
			EQ = 0;
			G = 0;
		end
		else if (L == 1 && EQ == 0 && G == 0 && awareness == 3'b001 )begin
			L = 1;
			EQ = 0;
			G = 0;
			fuel = 3'b000;
			c_speed = c_speed - 1;
		end
		else if (L == 1 && EQ == 0 && G == 0 && awareness == 3'b000 )begin
			L = 1;
			EQ = 0;
			G = 0;
			fuel = 3'b000;
			c_speed = 8'b00000000;
			brake = 1;
		end
			
endmodule
