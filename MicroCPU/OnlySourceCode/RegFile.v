`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/07 20:19:07
// Design Name: 
// Module Name: RegFile
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


module RegFile(
    RsAddr,
    RtAddr,
    WrAddr,
    DataIn,
    RegWr,
    Clk,
    RsData,
    RtData
    
    );

    input [4:0] RsAddr;
    input [4:0] RtAddr;
    input [4:0] WrAddr;
    input RegWr;
    input [31:0] DataIn;
    input Clk;
    // input reset;
    output [31:0] RsData;
    output [31:0] RtData;



    reg [31:0]  Reg [31:0];
    assign RsData = (RsAddr == 5'b0)? 32'b0: Reg[RsAddr];
    assign RtData = (RtAddr == 5'b0)? 32'b0: Reg[RtAddr];
    integer i;
    // always @ ( negedge clk)
    always @ ( posedge Clk)
        if (RegWr)
            Reg [WrAddr]=DataIn;
        // if (!reset & RegWr)
        //         regs [WrAddr]=DataIn;
        // else if (reset)
        //     for(i=0;i<32;i=i+1)
        //         regs [i]=0;
    // initial begin
    //     for(i=0;i<32;i=i+1)
    //         Reg [i]=0;
    // end
endmodule

