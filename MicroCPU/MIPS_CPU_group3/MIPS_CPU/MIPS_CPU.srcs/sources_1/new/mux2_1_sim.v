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
    reg [31:0] In1 = 32'h12345678;
    reg [31:0] In2 = 32'h87654321;
    reg sel =0;
    wire [31:0] Out;
    Mux2_1 mux_module(.In1(In1), .In2(In2), .sel(sel), .Out(Out));
    initial begin
        # PERIOD;
        sel = 1;
        # PERIOD;
        $stop;
    end
endmodule
