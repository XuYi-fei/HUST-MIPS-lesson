`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/24 15:13:25
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
    In1,
    In2,
    In3,
    sel,
    Out
    );
    parameter n = 32;
    input [n-1:0] In1;
    input [n-1:0] In2;
    input [n-1:0] In3;
    output [n-1:0] Out;
    input [1:0] sel;
    // 调用两个2选1选择器即可，其控制变量分别为sel[0],sel[1]
    wire [n-1:0] tmpOut;
    Mux2_1 #(n)mux21_module1(.In1(In1), .In2(In2), .sel(sel[0]), .Out(tmpOut));
    Mux2_1 #(n)mux21_module2(.In1(tmpOut), .In2(In3), .sel(sel[1]), .Out(Out));
    
endmodule
