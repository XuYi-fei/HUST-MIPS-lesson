`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/23 08:16:31
// Design Name: 
// Module Name: PC
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


module PC(
    D,
    Clk,
    Reset,
    Q
    );
    parameter n = 32;
    input [n-1:0] D;
    output reg [n-1:0] Q;
    input Clk;
    input Reset;
    // Reset高时，Q直接为0，否则同步输出D
    always@(posedge Clk or posedge Reset)
        if(Reset)
            Q <= 0;
        else
            Q <= D;
endmodule
