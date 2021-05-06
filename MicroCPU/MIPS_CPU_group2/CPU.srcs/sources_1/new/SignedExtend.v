`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/24 22:16:02
// Design Name: 
// Module Name: SignedExtend
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


module SignedExtend(
    In, Out
    );
    parameter n=16,m=32;
    input [n-1:0] In;
    output [m-1:0] Out;
    assign Out = In[n-1]? In|32'hffff0000: In;
endmodule
