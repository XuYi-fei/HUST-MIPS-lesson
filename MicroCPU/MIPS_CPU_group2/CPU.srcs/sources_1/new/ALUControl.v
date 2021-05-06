`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/24 22:18:40
// Design Name: 
// Module Name: ALUControl
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


module ALUControl(
    ALUOp, Funct, ALUCtr, JrCtr
    );
    input [1:0] ALUOp;
    input [5:0] Funct;
    output reg JrCtr;
    output reg [3:0] ALUCtr;
    always @(ALUOp or Funct)
    casex ({ALUOp,Funct})
        8'b00xxxxxx: begin 
        ALUCtr = 4'b0010; //lw,sw
        JrCtr = 0;
        end
        8'b01xxxxxx: begin
        ALUCtr = 4'b0110;//beq
        JrCtr = 0;
        end
        8'b10xx0000: begin
        ALUCtr = 4'b0010;//add
        JrCtr = 0;
        end
        8'b10xx0010: begin
        ALUCtr = 4'b0110;//sub
        JrCtr = 0;
        end
        8'b10xx0100: begin
        ALUCtr = 4'b0000;//and
        JrCtr = 0;
        end
        8'b10xx0101: begin
        ALUCtr = 4'b0001;//or
        JrCtr = 0;
        end
        8'b10xx1010: begin
        ALUCtr = 4'b0111;//slt
        JrCtr = 0;
        end
        8'bxx001000: begin
        ALUCtr = 4'b0000;
        JrCtr = 1;
        end
        default : begin
        ALUCtr = 4'b0000;
        JrCtr = 0;
        end
        endcase
endmodule
