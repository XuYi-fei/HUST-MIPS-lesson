`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/23 00:09:29
// Design Name: 
// Module Name: aluctr_sim
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


module aluctr_sim(

    );
    reg Clk;
    parameter PERIOD = 10;

    reg [1:0] ALUOp;
    reg [5:0] Funct;
    wire [3:0] ALUCtr;

    ALUControl aluctr_module(.ALUOp(ALUOp), .Funct(Funct), .ALUCtr(ALUCtr));

    

    initial begin
      Clk = 1'b0;
    //   #(PERIOD/2);
      forever
         #(PERIOD/2) Clk = ~Clk;
   end

   initial begin
       Funct = 6'h20;
       ALUOp = 0;
       # PERIOD;
       Funct = 6'h22;
       # PERIOD;
       Funct = 6'h24;
       # PERIOD;
       Funct = 6'h25;
       # PERIOD;
       Funct = 6'h2a;
       # PERIOD;
       Funct = 6'h20;
       ALUOp = 1;
       # PERIOD;
       Funct = 6'h22;
       # PERIOD;
       Funct = 6'h24;
       # PERIOD;
       Funct = 6'h25;
       # PERIOD;
       Funct = 6'h2a;
       # PERIOD;
       Funct = 6'h20;
       ALUOp = 2;
       # PERIOD;
       Funct = 6'h22;
       # PERIOD;
       Funct = 6'h24;
       # PERIOD;
       Funct = 6'h25;
       # PERIOD;
       Funct = 6'h2a;

   end
endmodule
