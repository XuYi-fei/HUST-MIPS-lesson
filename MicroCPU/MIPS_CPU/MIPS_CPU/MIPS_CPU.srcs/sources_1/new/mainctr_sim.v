`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/22 23:40:54
// Design Name: 
// Module Name: mainctr_sim
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


module mainctr_sim(

    );
    parameter PERIOD = 10;
    reg [5:0] OpCode;
    wire [1:0] ALUOp;
    wire RegDst;
    wire RegWr;
    wire ALUSrc;
    wire MemWr;
    wire B;
    wire J;
    wire Mem2Reg;
    wire LGSrc;
    wire OpSrc;
    wire NESrc;
    MainCtr main_module(.OpCode(OpCode),.LGSrc(LGSrc), .OpSrc(OpSrc), .NESrc(NESrc), .ALUOp(ALUOp), .RegDst(RegDst), .RegWr(RegWr), .ALUSrc(ALUSrc), .MemWr(MemWr), .B(B), .J(J), .Mem2Reg(Mem2Reg));

    initial begin
      OpCode = 0;
    end

    initial begin
        OpCode = 6'h0;
        # PERIOD;
        OpCode = 6'h23;
        # PERIOD;
        OpCode = 6'h2b;
        # PERIOD;
        OpCode = 6'h04;
        # PERIOD;
        OpCode = 6'h02;
        # PERIOD;
        $stop;
    end
endmodule
