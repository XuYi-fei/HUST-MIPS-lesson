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
    reg Clk;
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

    MainCtr main_module(.OpCode(OpCode), .ALUOp(ALUOp), .RegDst(RegDst), .RegWr(RegWr), .ALUSrc(ALUSrc), .MemWr(MemWr), .B(B), .J(J), .Mem2Reg(Mem2Reg));



    initial begin
      Clk = 1'b0;
      OpCode = 0;
      
    //   #(PERIOD/2);
      forever
         #(PERIOD/2) Clk = ~Clk;
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
    end

endmodule
