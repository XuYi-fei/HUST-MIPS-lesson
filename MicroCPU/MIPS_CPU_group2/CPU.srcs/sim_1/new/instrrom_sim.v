`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/24 17:35:11
// Design Name: 
// Module Name: instrrom_sim
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


module instrrom_sim(

    );
    reg [4:0] Addr;
    reg Clk;
    wire [31:0] Instr;
    InstrROM #(5) example(Addr, Clk, Instr);
    always begin
    #5 Clk = ~Clk;
    end
    integer i;
    initial begin
    #0
    Clk = 0;
    Addr = 0;
    for(i=1; i<32; i=i+1) begin
    #10 Addr = i;
    end
    end
endmodule
