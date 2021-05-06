`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/24 22:00:23
// Design Name: 
// Module Name: Mux3_1
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


module Mux3_1(
In1, In2, In3, sel, Out
    );
    parameter n=32;
    input [n-1:0] In1;
    input [n-1:0] In2;
    input [n-1:0] In3;
    input [1:0] sel;
    output [n-1:0] Out;
    wire [n-1:0] tempOut;
    Mux2_1 #(n) m1(In1, In2, sel[0], tempOut);
    Mux2_1 #(n) m2(tempOut, In3, sel[1], Out);
endmodule
