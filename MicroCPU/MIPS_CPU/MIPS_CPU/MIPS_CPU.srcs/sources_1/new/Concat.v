`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/24 14:12:28
// Design Name: 
// Module Name: Concat
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


module Concat(
    In1,
    In2,
    Out
    );
    // 直接使用拼接运算实现功能
    parameter n = 4, m = 28;
    input [n-1:0] In1;
    input [m-1:0] In2;
    output [n+m-1:0] Out;
    assign Out = {In1, In2};
endmodule
