`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/24 15:09:59
// Design Name: 
// Module Name: mux3_1_sim
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


module mux3_1_sim(

    );
    reg[31:0] In1 = 32'h12345678;
    reg[31:0] In2 = 32'h87654321;
    reg[31:0] In3 = 32'h33333333;
    reg [1:0] sel;
    wire [31:0] Out;
    parameter PERIOD = 10;
    Mux3_1 #(32) mux3_1_module(.In1(In1), .In2(In2), .In3(In3), .sel(sel), .Out(Out));
    initial begin
        sel = 2'b00;
        # PERIOD;
        sel = 2'b01;
        # PERIOD;
        sel = 2'b10;
        # PERIOD;
        sel = 2'b11;
        # PERIOD;
        # PERIOD;
        $stop;
    end

endmodule
