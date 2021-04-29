`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/22 10:00:23
// Design Name: 
// Module Name: dataram_sim
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


module dataram_sim(
    );
    reg Clk;
    reg MemWR;
    reg [31:0] DataIn;
    wire [31:0] DataOut;
    reg [31:0] Addr;
    parameter PERIOD = 10;
    integer i;
    // 实例化模块
    DataRAM dram(.DataIn(DataIn), .Addr(Addr), .MemWR(MemWR), .Clk(Clk), .DataOut(DataOut));
    // 指定n和m的值
    defparam dram.n = 5, dram.m = 32;
    initial begin
      Clk = 1'b0;
      // 先全部清零，防止出现x
      for(i = 0; i < 2**5-1; i = i + 1)
      begin
        dram.RAM[i] = 0;
      end

      forever
         #(PERIOD/2) Clk = ~Clk;
   end

   initial begin
        MemWR = 1;
        Addr = 0;
        DataIn = 0;
        # PERIOD;
        Addr = 1;
        DataIn = 4;
        # PERIOD;
        Addr = 2;
        DataIn = 8;
        # PERIOD;
        Addr = 3;
        DataIn = 12;
        # PERIOD;
        Addr = 4;
        DataIn = 16;
        # PERIOD;
        Addr = 5;
        DataIn = 20;
        # PERIOD;
        Addr = 6;
        DataIn = 24;
        # PERIOD;
        Addr = 7;
        DataIn = 28;
        # PERIOD;
        Addr = 8;
        DataIn = 32;
        # PERIOD;
        Addr = 9;
        DataIn = 36;
        # PERIOD;
        Addr = 0;
        MemWR = 0;
        # PERIOD;
        Addr = 1;
        # PERIOD;
        Addr = 2;
        # PERIOD;
        Addr = 3;
        # PERIOD;
        Addr = 4;
        # PERIOD;
        Addr = 5;
        # PERIOD;
        Addr = 6;
        # PERIOD;
        Addr = 7;
        # PERIOD;
        Addr = 8;
        # PERIOD;
        Addr = 9;

   end
    
endmodule
