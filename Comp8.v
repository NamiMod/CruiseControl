`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:13:28 09/10/2020 
// Design Name: 
// Module Name:    Comp8 
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
module Comp8(
    input[7:0] A,
    input[7:0] B,
    output L,
    output EQ,
    output G
    );
	 
	wire ll=1'b0;
	wire ee=1'b1;
	wire gg=1'b0;
	wire EQ_d;
	wire p;
	
	wire l0,l1,l2,l3,l4,l5,l6;
	wire eq0,eq1,eq2,eq3,eq4,eq5,eq6;
	wire g0,g1,g2,g3,g4,g5,g6;	
	
	// order of inputs -> A,B,l,eq,g,L,EQ,G
	Comp2 c1(A[0],B[0],ll,ee,gg,l0,eq0,g0);
	Comp2 c2(A[1],B[1],l0,eq0,g0,l1,eq1,g1);
	Comp2 c3(A[2],B[2],l1,eq1,g1,l2,eq2,g2);
	Comp2 c4(A[3],B[3],l2,eq2,g2,l3,eq3,g3);
	Comp2 c5(A[4],B[4],l3,eq3,g3,l4,eq4,g4);
	Comp2 c6(A[5],B[5],l4,eq4,g4,l5,eq5,g5);
	Comp2 c7(A[6],B[6],l5,eq5,g5,l6,eq6,g6);
	Comp2 c8(A[7],B[7],l6,eq6,g6,L,EQ_d,G);
   or o1(p,L,G);
   not n1(EQ,p);	

endmodule

