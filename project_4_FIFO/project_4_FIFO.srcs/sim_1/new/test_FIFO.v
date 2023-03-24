`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/29 17:03:05
// Design Name: 
// Module Name: test_FIFO
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


module test_FIFO(

    );
    reg clk, rstn, input_valid, output_enable;
    reg [7:0] data_in;
    wire [3:0] data_out;
    FIFO instance_FIFO(
        .clk(clk),
        .rstn(rstn),
        .input_valid(input_valid),
        .output_enable(output_enable),
        .data_in(data_in),
        .data_out(data_out)
    );

    initial begin
        clk = 0;
        rstn = 1;
        input_valid = 0;
        output_enable = 0;
        #0.1 rstn = 0;
        #1.1 rstn = 1;
    end

    always begin 
        #1;
        clk = ~clk;
    end

    always begin
        #2;
        data_in=$random()%9'b100000000;
        input_valid=$random()%2;
        output_enable=$random()%2;
    end

    always begin
    #400;
    $finish;
    end
endmodule
