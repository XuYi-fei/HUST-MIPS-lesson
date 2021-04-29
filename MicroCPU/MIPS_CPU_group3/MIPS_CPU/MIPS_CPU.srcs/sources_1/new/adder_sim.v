`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/23 08:05:31
// Design Name: 
// Module Name: adder_sim
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


module adder_sim(
    );
    parameter PERIOD = 10;
    reg [31:0] In1;
    reg [31:0] In2;
    wire [31:0] Out;
    Adder adder_module(.In1(In1), .In2(In2), .Out(Out));
    initial begin
        In1 = 32'h00000004;
        In2 = 32'h00000008;
        # PERIOD;
        In1 = 32'h44444444;
        In2 = 32'h88888888;
        # PERIOD;
        $stop;
    end
endmodule
