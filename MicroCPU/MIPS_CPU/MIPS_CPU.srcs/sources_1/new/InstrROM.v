`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/22 10:27:17
// Design Name: 
// Module Name: InstrROM
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


module InstrROM(
    Addr,
    Clk,
    Instr
    );
    parameter n = 5;
    input [n-1:0] Addr;
    input Clk;
    output reg [31:0] Instr;

    reg [31:0] ROM[2**n-1:0];
    // reg [31:0] tmpReg;
    // assign Instr = tmpReg;
    integer i;
    always @(posedge Clk) begin
        Instr = ROM[Addr];
        
    end

    // initial begin
    //     for(i = 0; i < 32; i = i+1)
    //         regs[i] = i*4;
    // end
endmodule
