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
    reg reset = 0;
    wire [31:0] RsData;
    wire [31:0] RtData;
    integer i;

    

    RegFile Reg(.RsAddr(RsAddr), .RtAddr(RtAddr), .WrAddr(WrAddr), .RegWr(RegWr), .Clk(Clk), .reset(reset), .RsData(RsData), .RtData(RtData), .DataIn(DataIn));

    initial begin
      Clk = 1'b0;
      RegWr = 1;
    //   #(PERIOD/2);
      forever
         #(PERIOD/2) Clk = ~Clk;
   end

   initial begin
       for(i = 0; i < 10; i = i + 1)
       begin
           # PERIOD;
           WrAddr = i;
           DataIn = i * 4;
       end
       # PERIOD;
       RtAddr <= 9;
       RegWr <= 0;
       for(i = 0;i < 9; i = i + 1)
       begin
           # PERIOD;
           RtAddr = RtAddr - 1;
           RsAddr = RsAddr + 1;
             
       end
   end
endmodule
