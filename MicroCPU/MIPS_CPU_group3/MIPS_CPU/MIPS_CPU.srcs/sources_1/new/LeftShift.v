`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/24 14:38:12
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
    In,
    Out
    );
    // 直接使用左移运算符即可
    parameter n = 32, m = 32, x = 2;
    input [n-1:0] In;
    output [m-1:0] Out;
    assign Out = In << x;
    
endmodule
