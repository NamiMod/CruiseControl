`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:57:28 09/10/2020 
// Design Name: 
// Module Name:    FA2 
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
module FA2(
    input A, 
	 input B,
    input Cin,
    output Sum,
    output Cout
	 );
	 
    wire e1,e2,e3,e4;
	 //sum
	 xor x1(e1,A,B);
    xor x2(Sum,e1,Cin);
	 // carry out
    and g1(e2,A,B);
    and g2(e3,Cin,B);
    and g3(e4,Cin,A);
    or  g4(Cout,e2,e3,e4);  
	 
endmodule
