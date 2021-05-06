`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/24 21:38:08
// Design Name: 
// Module Name: Controller
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


module Controller(
OpCode, Funct, J, B, RegDst, RegWr, ALUSrc, MemWr, Mem2Reg, ALUCtr, Jal2Reg, JrCtr
    );
    input [5:0] OpCode;
    input [5:0] Funct;
    output B;
    output J;
    output RegDst;
    output RegWr;
    output ALUSrc;
    output MemWr;
    output Mem2Reg;
    output [3:0] ALUCtr;
    output Jal2Reg;
    output JrCtr;
    wire [1:0] ALUOp;
    MainCtr e(OpCode, J, B, RegDst, RegWr, ALUSrc, MemWr, Mem2Reg, ALUOp, Jal2Reg);
    ALUControl d(ALUOp, Funct, ALUCtr, JrCtr);
endmodule
