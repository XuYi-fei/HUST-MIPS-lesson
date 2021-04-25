`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/24 14:44:52
// Design Name: 
// Module Name: controller_sim
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


module controller_sim(

    );
    parameter PERIOD = 10;
    reg [5:0] OpCode;
    reg [5:0] Funct;
    wire RegDst;
    wire RegWr;
    wire ALUSrc;
    wire MemWr;
    wire B;
    wire J;
    wire [3:0] ALUCtr;
    wire Mem2Reg;
    // wire [1:0] ALUOp;


    Controller controller_module(.OpCode(OpCode), .Funct(Funct), .RegDst(RegDst), .RegWr(RegWr), .ALUSrc(ALUSrc), .MemWr(MemWr), .B(B), .J(J), .ALUCtr(ALUCtr), .Mem2Reg(Mem2Reg));

    initial begin
        OpCode = 0;
        Funct = 6'h20;
        # PERIOD;
        Funct = 6'h22;
        # PERIOD;
        Funct = 6'h24;
        # PERIOD;
        Funct = 6'h25;
        # PERIOD;
        Funct = 6'h2a;
        # PERIOD;

        OpCode = 6'h23;
        Funct = 6'h20;
        # PERIOD;
        Funct = 6'h22;
        # PERIOD;
        Funct = 6'h24;
        # PERIOD;
        Funct = 6'h25;
        # PERIOD;
        Funct = 6'h2a;
        # PERIOD;

        OpCode = 6'h2b;
        Funct = 6'h20;
        # PERIOD;
        Funct = 6'h22;
        # PERIOD;
        Funct = 6'h24;
        # PERIOD;
        Funct = 6'h25;
        # PERIOD;
        Funct = 6'h2a;
        # PERIOD;

        OpCode = 6'h04;
        Funct = 6'h20;
        # PERIOD;
        Funct = 6'h22;
        # PERIOD;
        Funct = 6'h24;
        # PERIOD;
        Funct = 6'h25;
        # PERIOD;
        Funct = 6'h2a;
        # PERIOD;

        OpCode = 6'h02;
        Funct = 6'h20;
        # PERIOD;
        Funct = 6'h22;
        # PERIOD;
        Funct = 6'h24;
        # PERIOD;
        Funct = 6'h25;
        # PERIOD;
        Funct = 6'h2a;
        # PERIOD;

        $stop;
    end




endmodule
    
