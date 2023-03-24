`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/16 22:44:28
// Design Name: 
// Module Name: test_adder_1_constructure
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


module test_adder_1_constructure();
reg a,b,cin;
wire s,cout;
adder_1_constructure instance_adder_1_constructure(
    .a(a),
    .b(b),
    .cin(cin),
    .s(s),
    .cout(cout)
);
initial begin
    a = 1'b0;
    b = 1'b1;
    cin = 1'b0;
end

always begin
    #2;
    a = $random()%2;
    b = $random()%2;
    cin = $random()%2;
end
    
endmodule
