`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/20 11:17:42
// Design Name: 
// Module Name: comp_16
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
    input in_A_G_B,
    input in_A_E_B,
    input in_A_L_B,
    input [3:0] A,
    input [3:0] B,
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
        else
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
     
module comp_16(
    input [15:0] A,
    input [15:0] B,
    output A_G_B,
    output A_E_B,
    output A_L_B
    );
    wire [2:0] G, E, L;
    wire [3:0] AC3,BC3,AC2,BC2,AC1,BC1,AC0,BC0;
    wire in_A_G_B = 0;
    wire in_A_E_B = 1;
    wire in_A_L_B = 0;
    genvar k;
    for(k=15; k>=12; k=k-1)
    begin
        assign  AC3[k-12] = A[k];
        assign  BC3[k-12] = B[k];
    end
    for(k=11; k>=8; k=k-1)
    begin
        assign  AC2[k-8] = A[k];
        assign  BC2[k-8] = B[k];
    end
    for(k=7; k>=4; k=k-1)
    begin
        assign  AC1[k-4] = A[k];
        assign  BC1[k-4] = B[k];
    end    
      for(k=3; k>=0; k=k-1)
    begin
        assign  AC0[k] = A[k];
        assign  BC0[k] = B[k];
    end
    comp_4 C3(in_A_G_B, in_A_E_B, in_A_L_B, AC3, BC3, G[0], E[0], L[0]);
    comp_4 C2(G[0], E[0], L[0], AC2, BC2, G[1], E[1], L[1]);
    comp_4 C1(G[1], E[1], L[1], AC1, BC1, G[2], E[2], L[2]);
    comp_4 C0(G[2], E[2], L[2], AC0, BC0, A_G_B, A_E_B, A_L_B);

endmodule
