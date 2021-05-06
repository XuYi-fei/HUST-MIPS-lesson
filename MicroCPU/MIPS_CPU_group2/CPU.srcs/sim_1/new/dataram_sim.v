`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/29 08:16:03
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
    reg [4:0] Addr;
    wire [31:0] DataIn;
    reg [31:0] DataOut;
    reg Clk;
    reg MemWR;
    
    DataRAM #(5, 32) exm(Addr, DataIn, MemWR, Clk, DataOut);
    
    always begin
    #5 Clk <= ~Clk;
    end
    integer i;
    initial begin
    #0 Clk = 0;
    MemWR = 1;
    for(i=0;i<10;i=i+1) begin
    Addr = i;
    #10;
    end
    MemWR = 0;
    end
    endmodule
