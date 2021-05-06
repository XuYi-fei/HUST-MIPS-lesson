`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/24 22:21:39
// Design Name: 
// Module Name: MainCtr
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


module MainCtr(
    OpCode, J, B, RegDst, RegWr, ALUSrc, MemWr, Mem2Reg, ALUOp, Jal2Reg
    );
    input [5:0] OpCode;
    output [1:0] ALUOp;
    output RegDst;
    output RegWr;
    output ALUSrc;
    output MemWr;
    output Mem2Reg;
    output B;
    output J;
    output Jal2Reg;
    
    reg [9:0] outputtemp;
    assign Jal2Reg = outputtemp[9];
    assign RegDst = outputtemp[8];
    assign ALUSrc = outputtemp[7];
    assign Mem2Reg = outputtemp[6];
    assign RegWr = outputtemp[5];
    assign MemWr = outputtemp[4];
    assign B = outputtemp[3];
    assign J = outputtemp[2];
    assign ALUOp = outputtemp[1:0];
   always @(OpCode)
    case(OpCode)
        6'b000010:outputtemp = 10'b0xxx0001xx;//j
        6'b000000:outputtemp = 10'b0100100010;//R
        6'b100011:outputtemp = 10'b0011100000;//lw
        6'b101011:outputtemp = 10'b0x1x010000;//sw
        6'b000100:outputtemp = 10'b0x0x001001;//beq
        6'b000011:outputtemp = 10'b1xxx1xx1xx;//Jal
        default: outputtemp = 10'b0000000000;
    endcase
endmodule
