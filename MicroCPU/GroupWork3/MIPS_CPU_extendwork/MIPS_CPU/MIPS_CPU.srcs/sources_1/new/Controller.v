`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/24 15:03:26
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
    OpCode,
    Funct,
    J,
    B,
    RegDst,
    RegWr,
    ALUSrc,
    MemWr,
    Mem2Reg,
    ALUCtr,
    OpSrc,
    NESrc,
    LGSrc
    );
    input [5:0] OpCode;
    input [5:0] Funct;
    output RegDst;
    output RegWr;
    output ALUSrc;
    output MemWr;
    output B;
    output J;
    output [3:0]ALUCtr;
    output Mem2Reg;
    output OpSrc, NESrc, LGSrc;
    // ALUOp 中间变量
    wire [1:0] ALUOp;

    MainCtr mainctr_module(.OpCode(OpCode), .ALUOp(ALUOp), .RegDst(RegDst), .RegWr(RegWr), .ALUSrc(ALUSrc), .MemWr(MemWr), .B(B), .J(J), .Mem2Reg(Mem2Reg), .OpSrc(OpSrc), .NESrc(NESrc), .LGSrc(LGSrc));

    ALUControl alucontrol_module(.ALUOp(ALUOp), .Funct(Funct), .ALUCtr(ALUCtr));




endmodule
