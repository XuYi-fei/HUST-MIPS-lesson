`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/23 00:25:34
// Design Name: 
// Module Name: signextend_sim
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


module signextend_sim(

    );
    parameter PERIOD = 10;
    reg [15:0] In;
    wire [31:0] Out;
    SignedExtend signed_module(.In(In), .Out(Out));

   initial begin
       In = 16'h1234;
       # PERIOD;
       In = 16'h8234;
       # PERIOD;
       $stop;
   end

endmodule
