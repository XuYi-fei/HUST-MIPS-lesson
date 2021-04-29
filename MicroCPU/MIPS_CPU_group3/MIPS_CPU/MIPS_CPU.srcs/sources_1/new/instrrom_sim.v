`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/22 10:27:59
// Design Name: 
// Module Name: instrrom_sim
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


module instrrom_sim(

    );
    reg Clk;
    reg [4:0] Addr;
    wire [31:0] Instr;
    parameter PERIOD = 10;    
    integer i;
    // 实例化模块
    InstrROM instr(.Addr(Addr), .Clk(Clk), .Instr(Instr));
    defparam instr.n = 5;
    initial begin
      Addr = 0;
      Clk = 1'b0;
      // 根据要求，每个指令寄存器的值存对应编号乘4的值
      for(i = 0; i < 32; i = i + 1)
      begin
            instr.ROM[i] = i*4;
      end
      // 设置时钟
      forever
         #(PERIOD/2) Clk = ~Clk;   
   end
   
   initial 
   begin
      for(i = 0; i < 32; i = i + 1)
      begin
        # PERIOD;
        Addr = Addr + 1;
      end
      $stop;
   end
endmodule
