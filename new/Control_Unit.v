`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2024 03:09:35 PM
// Design Name: 
// Module Name: Control_Unit
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


module Control_Unit(
    input [6:0]opcode,
    input stall,
    output reg branch,
    output reg MemRead,
    output reg MemtoReg,
    output reg [1:0] ALUOp,
    output reg MemWrite,
    output reg ALUSrc,
    output reg RegWrite
    );
    
    always@(*)
    begin
        if(opcode == 7'b0110011) //add  
            begin
                branch = 0;
                MemRead = 0;
                MemtoReg = 0;
                ALUOp = 2'b10;
                MemWrite = 0;
                ALUSrc = 0;
                RegWrite = 1;
            end
        else if(opcode == 7'b0010011) //addi and slli
            begin
                branch = 0;
                MemRead = 0;
                MemtoReg = 0;
                ALUOp = 2'b00;
                MemWrite = 0;
                ALUSrc = 1;
                RegWrite = 1;
            end        
        else if(opcode == 7'b0000011) //load
            begin
                branch = 0;
                MemRead = 1;
                MemtoReg = 1;
                ALUOp = 2'b00;
                MemWrite = 0;
                ALUSrc = 1;
                RegWrite = 1;
            end
        else if(opcode == 7'b0100011) //store
            begin
                branch = 0;
                MemRead = 0;
                MemtoReg = 0;
                ALUOp = 2'b00;
                MemWrite = 1;
                ALUSrc = 1;
                RegWrite = 0;
            end        
        else if(opcode == 7'b1100011) //branch
            begin
                branch = 1;
                MemRead = 0;
                MemtoReg = 0;
                ALUOp = 2'b01;
                MemWrite = 0;
                ALUSrc = 0;
                RegWrite = 0;
            end
        else
            begin
                branch = 0;
                MemRead = 0;
                MemtoReg = 0;
                ALUOp = 2'b00;
                MemWrite = 0;
                ALUSrc = 0;
                RegWrite = 0;
            end         
            
        if (stall == 1) begin
        branch = 1'b0; MemRead = 1'b0; MemtoReg = 1'b0; ALUOp = 2'b00;
        MemWrite = 1'b0; ALUSrc = 1'b0; RegWrite = 1'b0;
        end        
                     
      end
endmodule
