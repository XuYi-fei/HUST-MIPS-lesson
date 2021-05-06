`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/24 22:02:04
// Design Name: 
// Module Name: LeftShift
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


module LeftShift(
    In, Out
    );
    parameter n=32, m=32, x=2;
    input [n-1:0] In;
    output [m-1:0] Out;
    assign Out = In<<x;
endmodule
