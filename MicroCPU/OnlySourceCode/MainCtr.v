`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/24 20:41:53
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
    OpCode,
    J,
    B,
    RegDst,
    RegWr,
    ALUSrc,
    MemWr,
    Mem2Reg,
    ALUOp
    );
    input [5:0] OpCode;
    output [1:0] ALUOp;
    output RegDst;
    output RegWr;
    output ALUSrc;
    output MemWr;
    output B;
    output J;
    output Mem2Reg;

    
    reg [8:0] outputtemp;
    assign J = outputtemp[8];
    assign B = outputtemp[7];
    assign RegDst = outputtemp[6];
    assign RegWr = outputtemp[5];
    assign ALUSrc = outputtemp[4];
    assign MemWr = outputtemp[3];
    assign Mem2Reg = outputtemp[2];
    assign ALUOp = outputtemp[1:0];
   always @(OpCode)
    case(OpCode)
        6'b000000:outputtemp = 9'b0011_000_10;
        6'b100011:outputtemp = 9'b0001_101_00;
        6'b101011:outputtemp = 9'b00x0_11x_00;
        6'b000100:outputtemp = 9'b01x0_00x_01;
        6'b000010:outputtemp = 9'b1xx0_x0x_xx;
        // 6'b000010:outputtemp = 9'b10x0_x0x_xx;
        default: outputtemp = 9'b000000000;
    endcase
endmodule
