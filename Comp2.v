`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:12:55 09/10/2020 
// Design Name: 
// Module Name:    Comp2 
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
module Comp2(
    input A,
    input B,
	 input ll,
	 input eqq,
	 input gg,
    output L,
    output EQ,
    output G
    );

	 wire A_not,B_not;
	 wire e1,e2,e3,e4,e5;
	 
	 not n1 (A_not,A);
	 not n2 (B_not,B);
	 xnor x1 (e1,A,B);
	 and a1 (e2,A,B_not);
	 and a2 (e3,A_not,B);
	 and a3 (e4,e1,gg);
	 and a4 (e5,e1,ll);
	 
	 //output
	 
	 or o1 (G,e2,e4);
	 and a5 (EQ,e1,e);
	 or o2 (L,e3,e5);
	

		
endmodule
  
