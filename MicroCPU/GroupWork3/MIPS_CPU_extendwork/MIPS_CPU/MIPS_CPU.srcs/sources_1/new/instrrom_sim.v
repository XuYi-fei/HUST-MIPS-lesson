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
    reg unsigned [4:0] Addr;
    wire [31:0] Instr;
    integer i;

    parameter PERIOD = 10;    
    InstrROM instr(.Addr(Addr), .Clk(Clk), .Instr(Instr));
    initial begin
      Addr = 0;
      Clk = 1'b0;
    //   #(PERIOD/2);
      forever
         #(PERIOD/2) Clk = ~Clk;
   end

   initial begin
    //    # (PERIOD/4);
       for (i = 0; i < 32; i = i + 1)
       begin
           # PERIOD;
           Addr = Addr + 1;
       end
       # PERIOD;
       $stop;
   end
endmodule
