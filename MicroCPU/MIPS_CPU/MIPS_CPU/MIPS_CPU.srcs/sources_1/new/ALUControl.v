`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/08 21:48:14
// Design Name: 
// Module Name: ALUCtr
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


module ALUControl(
    ALUOp,
    Funct,
    ALUCtr
    );
    input[1:0] ALUOp;
    input[5:0] Funct;
    output reg [3:0] ALUCtr;

    // 本质上是一个译码器，直接对译码表进行解析即可
    always @(*)
    casex ({ALUOp,Funct})
        8'b00xxxxxx: ALUCtr = 4'b0010;
        8'b01xxxxxx: ALUCtr = 4'b0110;
        8'b10100000: ALUCtr = 4'b0010;
        8'b10100010: ALUCtr = 4'b0110;
        8'b10100100: ALUCtr = 4'b0000;
        8'b10100101: ALUCtr = 4'b0001;
        8'b10101010: ALUCtr = 4'b0111;
        // default : ALUCtr = 4'b0000;
        endcase
endmodule
