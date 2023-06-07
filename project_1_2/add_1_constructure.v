`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/11 11:25:51
// Design Name: 
// Module Name: add_1_constructure
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


module add_1_constructure(
    input a,
    input b,
    input cin,
    output s,
    output cout
    );
    wire [2:0] w;
    and
        a1(w[0],a,cin),
        a2(w[1],a,b),
        a3(w[2],b,cin);
    xor a4(s,a,b,cin);
    or  a5(cout,w[0],w[1],w[2]);
endmodule
