`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/06 22:56:28
// Design Name: 
// Module Name: test_FSM_addition
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


module test_FSM_addition(

    );
    reg clk, rstn, in;
    wire out;
    FSM_addition instance_FSM_addition(
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
