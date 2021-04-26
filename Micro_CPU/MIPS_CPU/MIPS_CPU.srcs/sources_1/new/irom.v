`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/08 19:08:57
// Design Name: 
// Module Name: irom
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


module irom(
    input [4:0] addr,
    output [31:0] instr
    );
    reg [31:0] regs [0:31];
    assign instr = regs[addr];
    initial
    $readmemh("D:/2020NB/Analog/Vivado/MIPS_CPU_S/machinecode.txt",regs,0,11);
endmodule
