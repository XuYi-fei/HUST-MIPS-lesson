`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/07 20:19:07
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
    RsAddr,
    RtAddr,
    WrAddr,
    DataIn,
    RegWr,
    Clk,
    RsData,
    RtData
    
    );

    input [4:0] RsAddr;
    input [4:0] RtAddr;
    input [4:0] WrAddr;
    // 写信号
    input RegWr;
    input [31:0] DataIn;
    input Clk;
    // Rs和Rt的数据
    output [31:0] RsData;
    output [31:0] RtData;
    // Reg做寄存器，一直有效，在程序运行时一直有值，即$0~$31
    reg [31:0]  Reg [31:0];
    assign RsData = (RsAddr == 5'b0)? 32'b0: Reg[RsAddr];
    assign RtData = (RtAddr == 5'b0)? 32'b0: Reg[RtAddr];
    always @ ( posedge Clk)
        if (RegWr)
            Reg [WrAddr]=DataIn;
endmodule

