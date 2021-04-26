`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/08 19:29:42
// Design Name: 
// Module Name: dram
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


module dram(
    input [4:0] addr,
    output [31:0] readdata,
    input [31:0] writedata,
    input MemWR
    );
    reg [31:0] regs[31:0];
    assign readdata = regs[addr];
    always @(addr or writedata or MemWR)
    if(MemWR) 
    regs[addr] = writedata;
    integer i;
    initial
    for (i=0;i<32;i=i+1)
    regs[i] = 4 * i;
endmodule


