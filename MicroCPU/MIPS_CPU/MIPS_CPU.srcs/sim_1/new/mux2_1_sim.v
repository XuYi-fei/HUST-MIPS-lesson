`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/23 07:54:43
// Design Name: 
// Module Name: mux2_1_sim
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


module mux2_1_sim(

    );
    // reg Clk;
    parameter PERIOD = 10;
    reg [31:0] In1;
    reg [31:0] In2;
    reg sel;

//    initial begin
//       Clk = 1'b0;
      
//     //   #(PERIOD/2);
//       forever
//          #(PERIOD/2) Clk = ~Clk;
//     end

    initial begin
        sel = 0;
        In1 = 32'h12345678;
        In2 = 32'h87654321;
        # PERIOD;
        sel = 1;
    end

endmodule
