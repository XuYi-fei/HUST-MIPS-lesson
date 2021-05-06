`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/24 17:48:58
// Design Name: 
// Module Name: RegFile
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


module RegFile(
    RsAddr, RtAddr, WrAddr, DataIn, RegWr,Clk, RsData, RtData
    );
    input [31:0] DataIn;
    input [4:0] RsAddr;
    input [4:0] RtAddr;
    input [4:0] WrAddr;
    input RegWr;
    input Clk;
    output [31:0] RsData;
    output [31:0] RtData;
    
    reg [31:0] regs [31:0];
    assign RsData = (RsAddr == 5'b0)? 32'b0: regs[RsAddr];
    assign RtData = (RtAddr == 5'b0)? 32'b0: regs[RtAddr];
    integer i;
    initial 
//        for(i=0;i<32;i=i+1) regs[i]=0;
        for(i=0;i<32;i=i+1) regs[i]=4*i;
    always @ (posedge Clk) begin
        if(RegWr) regs[WrAddr] = DataIn;
    end
endmodule
