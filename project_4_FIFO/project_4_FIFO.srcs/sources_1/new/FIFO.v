`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/29 10:54:31
// Design Name: 
// Module Name: FIFO
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


module FIFO(
    input clk,
    input rstn,
    input input_valid,
    input output_enable,
    input [7:0] data_in,
    output reg [3:0] data_out
    );
    reg [7:0] mem [7:0];
    reg [2:0] write_addr;
    reg [2:0] read_addr;
    reg [3:0] flag;
    reg input_enable, output_valid;
    
    always @(posedge clk or negedge rstn) begin
        if (rstn == 0) begin
            write_addr <= 3'b000;
            flag <= 4'b0000;
            input_enable <= 1'b1;
            output_valid <= 1'b0;
        end
        else begin
            if (input_valid & input_enable) begin
                write_addr <= write_addr + 3'b001; 
                mem[write_addr] [7:0] <= data_in[7:0];//使用非阻塞赋值
                if (write_addr == 3'b111) begin
                    output_valid = 1'b1;
                    input_enable = 1'b0;
                end
                else begin
                    output_valid = 1'b0;
                    input_enable = 1'b1;
                end
            end
            else if (output_valid & output_enable) begin
                flag <= flag + 4'b0001;
                if (!(flag % 2)) begin
                    read_addr = flag / 2; 
                    data_out[3:0] = mem[read_addr] [3:0];
                end
                else if (flag % 2) begin
                    read_addr = (flag-1) / 2; 
                    data_out[3:0] = mem[read_addr] [7:4];
                end
                //flag每加2read_addr加1
                if(flag == 4'b1111) begin
                    input_enable = 1'b1;
                    output_valid = 1'b0;
                    read_addr <= 3'b000;
                    flag <= 4'b0000;
                    write_addr <= 3'b000;
                end
                else begin
                    input_enable = 1'b0;
                    output_valid = 1'b1;
                end
            end
        end
    end
endmodule