`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/28 19:43:06
// Design Name: 
// Module Name: Jal_CPU
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


module Jal_CPU(
    Clk, Reset
    );
    input Clk;
    input Reset;
    
    wire Jal2Reg;
    wire JrCtr;
    wire [31:0] tempData2Reg;
    wire [4:0] tempWrAddr;
    wire [31:0] tempPC;
    wire tempJ;
    
    wire [31:0] CurrentPC, SequencePC, JumpPC, BranchPC, NextPC, Boffset, Instr,  MemData, Data2Reg, Res, RsData, RtData,ALUIn2, SignExtended;
    wire Branch,J,B,Zero,RegDst,RegWr,ALUSrc,MemWr,Mem2Reg, BZero;
    wire [1:0] ALUOp, PCsel;
    wire [4:0] WrAddr;
    wire [27:0] JumpTarget;
    wire [3:0] ALUCtr;
    
    PC #(32) U0_PC(NextPC, Clk, Reset, CurrentPC);
    InstrROM #(5) ROM_U0(CurrentPC[6:2], ~Clk, Instr);
    Controller U2_Contr(Instr[31:26], Instr[5:0], tempJ, B, RegDst, RegWr, ALUSrc, MemWr, Mem2Reg, ALUCtr, Jal2Reg, JrCtr);
    //Mux2_1 #(5) U3(Instr[20:16], Instr[15:11], RegDst, WrAddr);
    Mux2_1 #(5) U3(Instr[20:16], Instr[15:11], RegDst, tempWrAddr);
    LeftShift #(26, 28, 2) U4(Instr[25:0], JumpTarget);
    Adder #(32) U5(CurrentPC, 'h4, SequencePC);
    Concat #(4, 28) U6(SequencePC[31:28], JumpTarget, JumpPC);
    Adder #(32) U7(SequencePC, Boffset, BranchPC);
    Mux3_1 #(32) U8(SequencePC, BranchPC, JumpPC, PCsel, tempPC);
    LeftShift #(32, 32, 2) U9(SignExtended, Boffset);
    RegFile RegFile_U1(Instr[25:21], Instr[20:16], WrAddr,Data2Reg, RegWr,Clk, RsData, RtData);
    SignedExtend #(16, 32) U11(Instr[15:0], SignExtended);
    Mux2_1 #(32) U12(RtData, SignExtended, ALUSrc, ALUIn2);
    ALU U13(RsData, ALUIn2, ALUCtr, Res, Zero);
    //Mux2_1 #(32) U14(Res, MemData, Mem2Reg, Data2Reg);
    Mux2_1 #(32) U14(Res, MemData, Mem2Reg, tempData2Reg);
    Concat #(1, 1) U15(J, BZero, PCsel);
    DataRAM #(5, 32) RAM_U3(Res[6:2], RtData, MemWr, Clk, MemData);
    and (BZero, B, Zero);
    
    //Jal
    Mux2_1 #(32) M1(tempData2Reg, SequencePC, Jal2Reg, Data2Reg);
    Mux2_1 #(5) M2(tempWrAddr, 5'b11111, Jal2Reg, WrAddr);
    or(J, tempJ, Jal2Reg);
    
    //Jr
    Mux2_1 #(32) M3(tempPC, RsData, JrCtr, NextPC);
endmodule
