`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/20 10:16:22
// Design Name: 
// Module Name: comp_4
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


module comp_4(
    input [3:0] A,
    input [3:0] B,
    input in_A_G_B,
    input in_A_E_B,
    input in_A_L_B,
    output reg out_A_G_B,
    output reg out_A_E_B,
    output reg out_A_L_B
    );
    always@ (A or B or in_A_G_B or in_A_E_B or in_A_L_B)
    begin
        if(in_A_G_B == 1)
        begin
            out_A_G_B <= 1;
            out_A_E_B <= 0;
            out_A_L_B <= 0;
        end 
        else if(in_A_L_B == 1) 
        begin
            out_A_G_B <= 0;
            out_A_E_B <= 0;
            out_A_L_B <= 1;
        end
        else if(in_A_E_B == 1)
        begin
            if(A > B)
            begin
                out_A_G_B <= 1;
                out_A_E_B <= 0;
                out_A_L_B <= 0;    
            end
            else if(A == B)
            begin
                out_A_G_B <= 0;
                out_A_E_B <= 1;
                out_A_L_B <= 0;    
            end
            else if(A < B)
            begin
                out_A_G_B <= 0;
                out_A_E_B <= 0;
                out_A_L_B <= 1;    
            end
        end
    end      
      
endmodule          
        
     
