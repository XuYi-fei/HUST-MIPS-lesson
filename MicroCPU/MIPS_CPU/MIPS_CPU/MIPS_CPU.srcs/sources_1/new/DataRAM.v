`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/22 09:51:16
// Design Name: 
// Module Name: DataRAM
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


module DataRAM(
    Addr,
    DataIn,
    MemWR,
    Clk,
    DataOut
    );
    parameter n = 5, m = 32;
    input [m-1:0] DataIn;   // 输入数据
    input [n-1:0] Addr;     // 输入地址
    input MemWR;
    input Clk;
    output [m-1:0] DataOut;
    // RAM用来保存数据，一直到程序运行结束
    reg [m-1:0] RAM[2**n-1:0];

    assign DataOut = RAM[Addr];
    always @(posedge Clk) begin
        if(MemWR)
            RAM[Addr] <= DataIn;
    end
endmodule
