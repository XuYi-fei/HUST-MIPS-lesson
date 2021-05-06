`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/24 17:34:51
// Design Name: 
// Module Name: InstrROM
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


module InstrROM(
    Addr, Clk, Instr
    );
    parameter n = 5;
    input [n-1:0] Addr;
    input Clk;
    output reg [31:0] Instr;
    
    reg [2**n-1:0] regs[31:0];
    integer i;
    initial
    $readmemh("D:/mips/jalcode.txt",regs,0,5);
//    for(i=0; i<2**n; i=i+1)
//    regs[i] = 4*i;
    
    always @ (posedge Clk) begin
        Instr <= regs[Addr];
    end
endmodule
