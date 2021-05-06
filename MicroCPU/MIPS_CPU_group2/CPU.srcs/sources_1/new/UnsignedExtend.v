`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/24 22:14:24
// Design Name: 
// Module Name: UnsignedExtend
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


module UnsignedExtend(
    In, Out
    );
    parameter n=16,m=32;
    input [n-1:0] In;
    output [m-1:0] Out;
    assign Out = In;
endmodule
