`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/24 14:25:48
// Design Name: 
// Module Name: leftshift_sim
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


module leftshift_sim(

    );
    reg [31:0] In1 = 32'h22222222;
    wire [31:0] Out1;
    wire [27:0] Out2;
    wire [28:0] Out3;
    parameter PERIOD = 10;
    LeftShift #(32, 32, 2)leftshift_module1(.In(In1), .Out(Out1));
    LeftShift #(26, 28, 2)leftshift_module2(.In(In1[25:0]), .Out(Out2));
    LeftShift #(26, 29, 3)leftshift_module3(.In(In1[25:0]), .Out(Out3));

    initial begin
        # PERIOD;
        $stop;
        // In1 = 32'h22222222;
    end

endmodule
