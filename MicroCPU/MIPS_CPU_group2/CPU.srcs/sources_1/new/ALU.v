`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/24 20:15:03
// Design Name: 
// Module Name: ALU
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


module ALU(
    In1, In2, ALUCtr, Res, Zero
    );
    input signed [31:0] In1;
    input signed [31:0] In2;
    input [3:0] ALUCtr;
    output reg [31:0] Res;
    output reg  Zero;
    always @(In1 or In2 or ALUCtr)
        begin 
            case(ALUCtr)
                4'b0110:
                    begin
                    Res = In1 - In2;
                    Zero = (Res == 0)? 1:0;
                    end
                4'b0010:
                    begin
                    Res = In1 + In2;
                    Zero = 0;
                    end
                4'b0000:
                    begin
                    Res = In1 & In2;
                    Zero = 1;
                    end
                4'b0001:
                    begin
                    Res = In1 | In2;
                    Zero = 0;
                    end
                4'b0111:
                    begin
                    Res = (In1 < In2)? 1:0;
                    Zero = 1;
                    end
                default:
                    begin
                    Res = 0;
                    Zero = 0;
                    end
             endcase
         end  
endmodule

