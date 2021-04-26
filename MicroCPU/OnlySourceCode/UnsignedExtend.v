`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/23 00:35:16
// Design Name: 
// Module Name: SignedExtend
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


module SignedExtend(
    In,
    Out
    );
    parameter n = 16, m = 32;
    input [n-1:0] In;
    output reg [m-1:0] Out;
    integer i;
    always @(In) begin

        for(i = n; i < m; i = i+1)
            Out[i] = 1'b0;   
        // if(In[n-1])
        //     for(i = n; i < m; i = i+1)
        //         Out[i] = 1'b1;
        // else
        //     for(i = n; i < m; i = i+1)
        //         Out[i] = 1'b0;        
        Out[n-1:0] = In;
    end
    

endmodule
