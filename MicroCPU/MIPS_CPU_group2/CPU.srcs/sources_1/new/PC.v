`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/24 22:07:43
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
    D, Clk, Reset, Q
    );
    parameter n=32;
    input [n-1:0] D;
    input Clk;
    input Reset;
    output reg [n-1:0] Q;
    always @(posedge Clk or posedge Reset) begin
        if(Reset) Q <= 0;
        else Q <= D;
    end
endmodule
