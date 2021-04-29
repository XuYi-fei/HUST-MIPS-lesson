`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/24 22:03:13
// Design Name: 
// Module Name: mipscpusim
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


module mipscpusim(

    );
    reg Clk;
    reg Reset;
    mipscpu uut(Clk, Reset);
    parameter period = 10;
    always begin
        Clk = 1'b0;
        # (period/2) Clk = 1'b1;
        # (period/2);
    end

    integer i;
    initial begin
        # (period/2);
        $readmemh("D:/Learning/Analog/Vivado/MIPS_CPU/MIPS_CPU/machinecode2.txt", uut.ROM_U0.ROM, 0, 18);
        for (i = 0;i < 32; i = i + 1)
        begin
          uut.RegFile_U1.Reg[i] = i*4;
          uut.RAM_U3.RAM[i] = i*4;
        end
        Reset = 0;
        # 10;
        Reset = 1;
        # 15;
        Reset = 0;
        # 200;
        $stop;
    end
endmodule
