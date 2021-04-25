`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/22 21:21:00
// Design Name: 
// Module Name: alu_sim
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


module alu_sim(

    );
    reg Clk;
    parameter PERIOD = 10;
    reg [3:0] ALUCtr;
    reg [31:0] In1;
    reg [31:0] In2;
    wire zero;
    wire [31:0] Res;

    ALU alu_module(.In1(In1), .In2(In2), .ALUCtr(ALUCtr), .Res(Res), .Zero(zero));
    initial begin
      Clk = 1'b0;
      ALUCtr = 0;
      In1 = 32'h10010104;
      In2 = 32'h10010108;
    //   #(PERIOD/2);
      forever
         #(PERIOD/2) Clk = ~Clk;
   end

   initial begin
       # PERIOD;
       ALUCtr = 1;
       # PERIOD;
       ALUCtr = 2;
       # PERIOD;
       ALUCtr = 6;
       # PERIOD;
       ALUCtr = 7;
       
       # PERIOD;
       ALUCtr <= 0;
       In1 <= 32'h44444444;
       In2 <= 32'h88888888;
       # PERIOD;
       ALUCtr = 1;
       # PERIOD;
       ALUCtr = 2;
       # PERIOD;
       ALUCtr = 6;
       # PERIOD;
       ALUCtr = 7;       
       
       # PERIOD;
       ALUCtr <= 0;
       In1 <= 32'h99999999;

       # PERIOD;
       ALUCtr = 1;              
       # PERIOD;
       ALUCtr = 6;
       # PERIOD;
       ALUCtr = 7;    
   end
endmodule
