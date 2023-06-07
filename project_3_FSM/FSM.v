`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/10 10:30:09
// Design Name: 
// Module Name: FSM
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


module FSM(
    input clk,
    input rstn,
    input in,
    output reg out
    );

    localparam S0 = 3'b000;
    localparam S1 = 3'b001;
    localparam S2 = 3'b010;
    localparam S3 = 3'b011;
    localparam S4 = 3'b100;

    reg [2:0] state;
    reg [2:0] next_state;

    always@(negedge rstn or posedge clk)begin
        if(!rstn) begin
            state <= S0;
        end
        else begin
            state <= next_state;
        end    
    end

    always@(*) begin
        case(state)
        S0:begin
             next_state = in ? S0 : S1;
        end
        S1:begin
             next_state = in ? S2 : S1;
        end
        S2:begin
             next_state = in ? S3 : S1;
        end
        S3:begin
             next_state = in ? S0 : S4;
        end
        S4:begin
             next_state = in ? S2 : S1;
        end
        default: next_state = S0;
        endcase
    end

    always@(*) begin
        case(state)
        S4:out = 1'b1;
        S0:out = 1'b0;
        S1:out = 1'b0;
        S2:out = 1'b0;
        S3:out = 1'b0;
        default: out = 1'bx;
        endcase
    end
endmodule
