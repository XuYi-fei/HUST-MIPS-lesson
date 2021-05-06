`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/24 22:29:02
// Design Name: 
// Module Name: DataRAM
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


module DataRAM(
    Addr, DataIn, MemWR, Clk, DataOut
    );
    parameter n=5,m=32;
    input Clk;
    input [n-1:0] Addr;
    input [m-1:0] DataIn;
    input MemWR;
    output [m-1:0] DataOut;
    
    reg [2**n-1:0] regs[m-1:0];
    assign DataOut = regs[Addr];
    integer i;
    initial for(i=0;i<32;i=i+1) regs[i]=4*i;
    always @ (posedge Clk) begin
        if(MemWR) regs[Addr] <= DataIn;
    end
endmodule
