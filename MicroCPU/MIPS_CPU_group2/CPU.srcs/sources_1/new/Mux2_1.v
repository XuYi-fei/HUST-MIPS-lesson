`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/24 22:11:47
// Design Name: 
// Module Name: Mux2_1
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


module Mux2_1(
    In1, In2, sel, Out
    );
    parameter n=32;
    input [n-1:0] In1;
    input [n-1:0] In2;
    input sel;
    output [n-1:0] Out;
    assign Out = sel ? In2:In1;
endmodule
