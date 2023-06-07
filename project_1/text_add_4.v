`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/11 10:14:22
// Design Name: 
// Module Name: text_add_4
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


module text_add_4();

reg [3:0] a;
reg [3:0] b;
reg in_carry;
wire [3:0] sum;
wire out_carry;

//instantiate an object of module add_4
add_4 instance_add_4 (
    .in_0(a),
    .in_1(b),
    .cin(in_carry),
    .out(sum),    
    .cout(out_carry)
);

initial begin
    a = 4'h1;
    b = 4'h0;
    in_carry = 1'b0;
end

always begin
    #2;
    a = $random() % 16;
    b = $random() % 16;
    in_carry = $random() % 2;
end
           
endmodule
