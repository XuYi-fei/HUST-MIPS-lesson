`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/26 18:47:49
// Design Name: 
// Module Name: mipscpu_sim
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


module mipscpu_sim(

    );
    reg Clk;
    reg Reset;
    
    MIPSCPU example(Clk, Reset);
    
    always begin
    #5  Clk = ~Clk;
    end
    initial begin
    #0 Clk = 0;
    Reset = 0;
    #15 Reset = 1;
    #15 Reset = 0;
    #200 
    $stop;
    end
endmodule
