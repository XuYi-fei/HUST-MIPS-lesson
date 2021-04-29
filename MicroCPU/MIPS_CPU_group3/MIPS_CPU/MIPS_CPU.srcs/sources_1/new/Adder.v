`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/23 08:08:40
// Design Name: 
// Module Name: Adder
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


module Adder(
    In1,
    In2,
    Out
    );
    // 执行普通加法
    parameter n = 32;
    input [n-1:0] In1;
    input [n-1:0] In2;
    output [n-1:0] Out;
    assign Out = In1 + In2;
endmodule
