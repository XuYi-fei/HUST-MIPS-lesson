`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/24 17:58:59
// Design Name: 
// Module Name: regfile_sim
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


module regfile_sim(

    );
    reg [31:0] DataIn;
    reg [4:0] RsAddr;
    reg [4:0] RtAddr;
    reg [4:0] WrAddr;
    reg RegWR;
    reg Clk;
    wire [31:0] RsData;
    wire [31:0] RtData;
    RegFile example(DataIn, RsAddr, RtAddr, WrAddr, RegWR, Clk, RsData, RtData);
    always begin
    #5 Clk = ~Clk;
    end
    integer i;
    initial begin
    #0 Clk = 0;
    RegWR = 1;
    RsAddr = 0;
    RtAddr = 0;
    WrAddr = 0;
    DataIn = 0;
    for(i=1; i<10; i=i+1) begin
    #10 WrAddr = i;
    DataIn = 4*i;
    end
    #10
    RegWR = 0;
    RtAddr = 9;
    for(i=1; i<10; i=i+1) begin
    #10 RsAddr = i;
    RtAddr = 9-i;
    end
    end
endmodule
