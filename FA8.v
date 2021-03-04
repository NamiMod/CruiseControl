`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:57:58 09/10/2020 
// Design Name: 
// Module Name:    FA8 
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
module FA8(
    input [7:0] A,
	 input [7:0] B,
    input Select,
    output [7:0] Sum,
    output Cout
	 );
	 
    wire e0,e1,e2,e3,e4,e5,e6,e7;
	 wire c1,c2,c3,c4,c5,c6,c7;
	 
	 // add / sub
	 
    xor x1(e0,B[0],Select);
	 xor x2(e1,B[1],Select);
	 xor x3(e2,B[2],Select);
	 xor x4(e3,B[3],Select);
	 xor x5(e4,B[4],Select);
	 xor x6(e5,B[5],Select);
	 xor x7(e6,B[6],Select);
	 xor x8(e7,B[7],Select);
	 
	 // order of inputs -> A,B,cin,Sum,Cout
	 
	 FA2 f1(A[0],e0,Select,Sum[0],c1);
	 FA2 f2(A[1],e1,c1,Sum[1],c2);
	 FA2 f3(A[2],e2,c2,Sum[2],c3);
	 FA2 f4(A[3],e3,c3,Sum[3],c4);  
	 FA2 f5(A[4],e4,c4,Sum[4],c5);
	 FA2 f6(A[5],e5,c5,Sum[5],c6);
	 FA2 f7(A[6],e6,c6,Sum[6],c7);
	 FA2 f8(A[7],e7,c7,Sum[7],Cout); 

endmodule
