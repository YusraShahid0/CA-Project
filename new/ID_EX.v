`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2024 01:49:56 PM
// Design Name: 
// Module Name: ID_EX
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


module ID_EX(
    input clk, 
    input reset,
    input RegWrite,
    input MemtoReg,
    input Branch,
    input MemRead,
    input MemWrite,
    input ALUSrc,
    input [1:0]ALUOp,
    input [3:0]funct, 
    input [4:0]rd,
    input [4:0]rs1,
    input [4:0]rs2,
    input [63:0]imm_value,
    input [63:0]pc_in,
    input [63:0]read_data1,
    input [63:0]read_data2,
    output reg RegWrite_stored,
    output reg MemtoReg_stored,
    output reg Branch_stored,
    output reg MemRead_stored,
    output reg MemWrite_stored,
    output reg ALUSrc_stored,
    output reg [1:0]ALUOp_stored,
    output reg[3:0]funct_stored,
    output reg[4:0]rd_stored,
    output reg[4:0]rs1_stored,
    output reg[4:0]rs2_stored,
    output reg[63:0]imm_stored,
    output reg[63:0]pc_stored,
    output reg[63:0]read_data1_stored,
    output reg[63:0]read_data2_stored
    );
    
    always @(posedge clk or posedge reset) begin //or posedge reset
    if (reset == 1'b1) begin
        Branch_stored = 0; 
        MemRead_stored = 0; 
        MemWrite_stored = 0;
        MemtoReg_stored = 0; 
        RegWrite_stored = 0; 
        ALUSrc_stored = 0;
        ALUOp_stored = 0; 
        funct_stored = 0;
        pc_stored = 0; 
        read_data1_stored = 0; 
        read_data2_stored = 0; 
        rd_stored = 0;
        rs1_stored = 0;
        rs2_stored = 0;
        imm_stored = 0;
    end
    
    else begin
        pc_stored <= pc_in;
        read_data1_stored <= read_data1;
        read_data2_stored <= read_data2;
        imm_stored <= imm_value;
        funct_stored <= funct;
        rd_stored <= rd;
        rs1_stored <= rs1;
        rs2_stored <= rs2;
        RegWrite_stored <= RegWrite;
        MemtoReg_stored <= MemtoReg;
        Branch_stored <= Branch;
        MemRead_stored <= MemRead;
        MemWrite_stored <= MemWrite;
        ALUOp_stored <= ALUOp;
        ALUSrc_stored <= ALUSrc;
        end
    end
endmodule

