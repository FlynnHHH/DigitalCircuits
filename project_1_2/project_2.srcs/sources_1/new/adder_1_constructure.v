`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/16 22:39:02
// Design Name: 
// Module Name: adder_1_constructure
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module adder_1_constructure(
    input a,
    input b,
    input cin,
    output s,
    output cout
    );
    wire [2:0]	w;
    and
        g1(w[0],a,cin),
        g2(w[1],a,b),
        g3(w[2],b,cin);
    xor g4(s,a,b,cin);
    or  g5(cout,w[0],w[1],w[2]);
endmodule
