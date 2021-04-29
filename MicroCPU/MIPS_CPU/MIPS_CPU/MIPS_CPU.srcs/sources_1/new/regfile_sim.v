`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/22 10:52:57
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
    reg Clk;
    parameter PERIOD = 10;
    reg [4:0] RsAddr = 0;
    reg [4:0] RtAddr = 0;
    reg [4:0] WrAddr;
    reg RegWr;
    reg [31:0] DataIn;
    wire [31:0] RsData;
    wire [31:0] RtData;
    integer i;

    RegFile Reg(.RsAddr(RsAddr), .RtAddr(RtAddr), .WrAddr(WrAddr), .RegWr(RegWr), .Clk(Clk), .RsData(RsData), .RtData(RtData), .DataIn(DataIn));
    // 初始化时钟
    initial begin
      Clk = 1'b0;
      RegWr = 1;
      forever
         #(PERIOD/2) Clk = ~Clk;
   end
    // 对寄存器进行相关操作
   initial begin
       // 写操作
       for(i = 0; i < 10; i = i + 1)
       begin
           # PERIOD;
           WrAddr = i;
           DataIn = i * 4;
       end
       # PERIOD;
       RtAddr <= 9;
       RegWr <= 0;
       // 读操作
       for(i = 0;i < 9; i = i + 1)
       begin
           # PERIOD;
           RtAddr = RtAddr - 1;
           RsAddr = RsAddr + 1;
             
       end
       # PERIOD;
       $stop;
   end
endmodule
