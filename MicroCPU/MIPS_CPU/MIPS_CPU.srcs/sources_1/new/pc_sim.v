`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/23 08:10:18
// Design Name: 
// Module Name: pc_sim
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


module pc_sim(

    );
    reg Clk;
    parameter PERIOD = 10;
    reg Reset;
    reg [31:0] D;
    wire [31:0] Q;

    PC pn_module(.Clk(Clk), .Reset(Reset), .D(D), .Q(Q));

    initial begin
      Clk = 1'b0;
      Reset = 1'b0;
      D = 32'd0;
    //   #(PERIOD/2);
      forever
         #(PERIOD/2) Clk = ~Clk;
   end

   initial begin
       # PERIOD;
       D = 1;
       # PERIOD;
       D = 2;
       # PERIOD;
       D = 3;
       # PERIOD;
       D = 4;
       # PERIOD;
       # PERIOD;
       Reset = 1;
       # PERIOD;
       $stop;

   end

endmodule
