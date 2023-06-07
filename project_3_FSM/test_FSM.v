`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/10 10:58:36
// Design Name: 
// Module Name: test_FSM
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


module test_FSM(

    );
    reg clk, rstn, in;
    wire out;
    FSM instance_FSM(
        .clk(clk),
        .rstn(rstn),
        .in(in),
        .out(out)
    );

    initial begin
        clk = 0;
        rstn = 1;
        #0.1 rstn = 0;
        #1.1 rstn = 1;
    end

    initial begin
        in = 0;
        #4 in = 1;
        #4 in = 0;
    end

    always begin
        #1 clk = ~clk;
    end

    always begin
        #2 in = $random() % 2;
    end
endmodule
