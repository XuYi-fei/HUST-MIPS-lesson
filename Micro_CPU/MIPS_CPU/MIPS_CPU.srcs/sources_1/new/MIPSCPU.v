`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/08 22:00:42
// Design Name: 
// Module Name: mipscpu
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
module mipscpu(
    Clk,
    Reset
    );
    input Clk;
    input Reset;

    wire [31:0] CurrentPC, SequencePC, JumpPC, BranPC, TempPC, Boffset, Instr,  MemData, Data2Reg, Res, RsData, RtData,ALUIn2, SignExtended;

    // wire [31:0] TempPC,MuxPC,JumpPC,BranPC,SeqPC,Imm32,ImmL2,RegWD,RsData,RtData,ALUIn2,ALURes,MemRD;
    // wire [4:0] RegWA;
    // wire [27:0]PsudeoPC;
    wire Branch,J,B,Zero,RegDst,RegWr,ALUSrc,MemWr,Mem2Reg, BZero;
    wire [1:0] ALUOp, PCsel;
    wire [4:0] WrAddr;
    wire [27:0] JumpTarget;

    wire [3:0] ALUCtr;
    // reg [31:0] PC,Instr;
    // reg [31:0] PC;
    // wire [31:0] Instr;

    // assign PsudeoPC = {Instr[25:0],2'b00};
    // assign JumpPC = {SeqPC[31:28],PsudeoPC};
    // assign SeqPC = PC + 4;
    // assign BranPC = ImmL2 + SeqPC;
    // assign MuxPC = Branch?BranPC:SeqPC;
    // assign TempPC = J?JumpPC:MuxPC;
    // assign Branch = B & Zero;
    // assign ImmL2 = {Imm32[29:0],2'b00};
    // assign Imm32 = {Instr[15]?16'hffff:16'h0,Instr[15:0]};
    // assign ALUSrc2 = ALUSrc?Imm32:RtData;
    // assign RegWA = RegDst?Instr[15:11]:Instr[20:16];
    // assign RegWD = Mem2Reg?MemRD:ALURes;
    PC U0_PC(TempPC, Clk, Reset, CurrentPC);
    defparam U0_PC.n = 32;
    InstrROM U1_ROM(CurrentPC[6:0], ~Clk, Instr);
    defparam U1_ROM.n = 5;
    Controller U2_Contr(Instr[31:26], Instr[5:0], J, B, RegDst, RgsWr, ALUSrc, MemWr, Mem2Reg, ALUCtr);
    Mux2_1 U3(Instr[20:16], Instr[15:11], RegDst, WrAddr);
    defparam U3.n=5;
    LeftShift U4(Instr[25:0], JumpTarget);
    defparam U4.n = 26, U4.n=28, U4.x = 2;
    Adder U5(CurrentPC, 'h4, SequencePC);
    defparam U5.n=32;
    Concat U6(SequencePC[31:28], JumpTarget, JumpPC);
    defparam U6.n=4, U6.m=28;
    Adder U7(SequencePC, Boffset, SequencePC);
    defparam U7.n=32;
    Mux3_1 U8(SequencePC, BranPC, JumpPC, PCsel, TempPC);
    defparam U8.n=32;
    LeftShift U9(SignedExtended, Boffset);
    defparam U9.n = 32, U9.n=32, U9.x = 2;
    RegFile U10(Data2Reg, Instr[25:21], Instr[20:16], WrAddr, RegWr, RsData, RtData);
    SignedExtend U11(Instr[15:0], SignExtended);
    defparam U11.n=16, U11.m=32;
    Mux2_1 U12(RtData, SignExtended, ALUSrc, ALUSrc2);
    defparam U12.n=32;
    ALU U13(RsData, ALUSrc2, ALUCtr, Res, Zero);
    Mux2_1 U14(Res, MemData, Mem2Reg, Data2Reg);
    defparam U14.n=32;
    Concat U15(J, BZero, PCSel);
    defparam U15.n=1, U15.m=1;
    DataRAM U16(Res[6:2], RtData, MemWr, Clk, MemData);
    defparam U16.n=5, U16.m=32;
    and (BZero, B, Zero);
    


    // ALU UnitALU(RsData,ALUIn2,ALUCtr,ALURes,Zero);
    // DataRAM UnitDram(ALURes[6:2],MemRD,RtData,MemWr);
    // InstrROM Unitirom(PC[6:2],Instr);
    // RegFile UnitRegFile(Instr[25:21],Instr[20:16],RegWA,RegWr,RegWD,Clk,Reset,RsData,RtData);
    // MainCtr Unitmainctr(Instr[31:26],ALUOp,RegDst,RegWr,ALUSrc,MemWr,B,J,Mem2Reg);
    // ALUControl Unitaluctr(ALUOp,Instr[5:0],ALUCtr);
    // always @ (posedge Clk)
    // begin
    //     if(Reset)
    //         PC <= 0;
    //     else
    //         PC <= TempPC;
    // end
endmodule

// module mipscpu(
//     Clk,
//     Reset
//     );
//     input Clk;
//     input Reset;

//     wire [31:0] TempPC,MuxPC,JumpPC,BranPC,SeqPC,Imm32,ImmL2,RegWD,RsData,RtData,ALUIn2,ALURes,MemRD;
//     wire [4:0] RegWA;
//     wire [27:0]PsudeoPC;
//     wire Branch,J,B,Zero,RegDst,RegWr,ALUSrc,MemWr,Mem2Reg;
//     wire [1:0] ALUOp;
//     wire [3:0] ALUCtr;
//     // reg [31:0] PC,Instr;
//     reg [31:0] PC;
//     wire [31:0] Instr;

//     assign PsudeoPC = {Instr[25:0],2'b00};
//     assign JumpPC = {SeqPC[31:28],PsudeoPC};
//     assign SeqPC = PC + 4;
//     assign BranPC = ImmL2 + SeqPC;
//     assign MuxPC = Branch?BranPC:SeqPC;
//     assign TempPC = J?JumpPC:MuxPC;
//     assign Branch = B & Zero;
//     assign ImmL2 = {Imm32[29:0],2'b00};
//     assign Imm32 = {Instr[15]?16'hffff:16'h0,Instr[15:0]};
//     assign ALUIn2 = ALUSrc?Imm32:RtData;
//     assign RegWA = RegDst?Instr[15:11]:Instr[20:16];
//     assign RegWD = Mem2Reg?MemRD:ALURes;
//     ALU UnitALU(RsData,ALUIn2,ALUCtr,ALURes,Zero);
//     DataRAM UnitDram(ALURes[6:2],MemRD,RtData,MemWr);
//     InstrROM Unitirom(PC[6:2],Instr);
//     RegFile UnitRegFile(Instr[25:21],Instr[20:16],RegWA,RegWr,RegWD,Clk,Reset,RsData,RtData);
//     MainCtr Unitmainctr(Instr[31:26],ALUOp,RegDst,RegWr,ALUSrc,MemWr,B,J,Mem2Reg);
//     ALUControl Unitaluctr(ALUOp,Instr[5:0],ALUCtr);
//     always @ (posedge Clk)
//     begin
//         if(Reset)
//             PC <= 0;
//         else
//             PC <= TempPC;
//     end
// endmodule
