`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:26:08 09/11/2020 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
   input [1:0] mode,
   input [7:0] c_speed,   
   input [7:0] d_speed,
   input clock, 
	output reg [7:0] out_speed,     
	output reg L,   
	output reg EQ,  
   output reg G
	);

	wire l,e,g;   
	wire [7:0] d_speed_add;  
	wire [7:0] d_speed_sub;	
	wire cout1,cout2;
	// constant values
	wire [7:0] five = 8'b00000101; 
	wire add = 1'b0;  
	wire sub = 1'b1;	
   
	// d_speed + 5 -> d_speed_add	
	FA8 fa1(d_speed,five,add,d_speed_add,cout1); 
	// d_speed - 5 -> d_speed_sub
	FA8 fa2(d_speed,five,sub,d_speed_sub,cout2);  
	// compare c_speed and d_speed -> l,e,g
	Comp8 co1(c_speed,d_speed,l,e,g);  
	
	always @ (posedge clock) 
	
		if (mode == 2'b10) 
			out_speed = d_speed_add;
			
		else if (mode == 2'b11) 
			out_speed = d_speed_sub;
			
		else if (mode == 2'b00) 
			out_speed = d_speed;  
			
		else if (mode == 2'b01)
			begin  
				L = l;     
				EQ = e;     
				G = g;     
			end   

endmodule
