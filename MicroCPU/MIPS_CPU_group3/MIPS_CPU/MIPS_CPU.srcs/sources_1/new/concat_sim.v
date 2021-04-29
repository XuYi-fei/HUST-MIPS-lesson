`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/23 08:21:41
// Design Name: 
// Module Name: concat_sim
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


module concat_sim(
    );
    parameter PERIOD = 10;
    reg [31:0] In1 = 32'h12345678;;
    reg [31:0] In2 = 32'h87654321;;
    wire [31:0] Out0;
    wire [1:0] Out1;
    // 分别执行4与28、1与1的位拼接操作
    Concat #(4, 28)concat_module1(.In1(In1[31:28]), .In2(In2[27:0]), .Out(Out0));
    Concat #(1, 1)concat_module2(.In1(In1[31]), .In2(In2[0]), .Out(Out1));
    initial begin
        # PERIOD;
        $stop;
    end
endmodule
