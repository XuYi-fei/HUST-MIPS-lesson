`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/23 08:00:39
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
    In1,
    In2,
    sel,
    Out
    );
    parameter n = 32;
    input [n-1:0] In1;
    input [n-1:0] In2;
    input sel;
    output [n-1:0] Out;

    // reg [31:0] tmpOut;
    // assign Out = tmpOut;
    assign Out = (sel == 1'b0)? In1: In2;

        

endmodule
