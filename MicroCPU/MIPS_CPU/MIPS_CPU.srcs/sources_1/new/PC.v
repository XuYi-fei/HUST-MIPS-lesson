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


    // reg [n-1:0] tmpOut;
    // assign Q = tmpOut;
    always@(posedge Clk or posedge Reset)
        // $display("Clk: %d\t Reset: %d", Clk, Reset);
        if(Reset)
            Q <= 0;
        else
            Q <= D;
endmodule
