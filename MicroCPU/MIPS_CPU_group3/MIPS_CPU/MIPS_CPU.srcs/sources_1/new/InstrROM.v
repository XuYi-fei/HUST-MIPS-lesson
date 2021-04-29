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
    output [31:0] Instr;

    reg [31:0] ROM[2**n-1:0];
    reg [31:0] tmpReg;
    assign Instr = tmpReg;
    always @(posedge Clk) begin
        tmpReg <= ROM[Addr];
    end
endmodule
