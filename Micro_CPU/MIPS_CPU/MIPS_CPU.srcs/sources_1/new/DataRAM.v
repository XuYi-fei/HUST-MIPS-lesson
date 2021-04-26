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
    // reset
    );
    parameter n = 5, m = 32;
    input [m-1:0] DataIn;
    input [n-1:0] Addr;
    input MemWR;
    input Clk;
    output [m-1:0] DataOut;
    // input reset

    reg [m-1:0] RAM[2**n-1:0];
    // integer i;

    assign DataOut = RAM[Addr];
    // assign reset = 0;
    always @(posedge Clk) begin
        if(MemWR)
            RAM[Addr] <= DataIn;
        // if(!reset & MemWR)
        // begin
        //     regs[Addr] = DataIn;
        // end
        // else if(reset)
        // begin
        //     for(i = 0; i < 32; i = i+1)
        //         regs[i] = 0;
        // end
        // DataOut = regs[Addr];
        
    end
    // 初始化寄存器值
    // initial begin
    //     for(i = 0; i < 32; i = i+1)
    //         RAM[i] = 0;
    // end
endmodule
