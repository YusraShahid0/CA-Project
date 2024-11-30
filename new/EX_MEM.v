`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2024 01:50:45 PM
// Design Name: 
// Module Name: EX_MEM
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

module EX_MEM(
    input clk,
    input reset,
    input RegWrite,
    input MemtoReg,
    input Branch,
    input MemRead,
    input MemWrite,
    input switch_branch,
    input [4:0] rd,
    input [63:0] imm_data,
    input [63:0] ALU_Result,
    input [63:0] read_data2,
    output reg RegWrite_stored,
    output reg MemtoReg_stored,
    output reg Branch_stored,
    output reg MemRead_stored,
    output reg MemWrite_stored,
    output reg [63:0] switch_branch_stored,
    output reg [4:0] rd_stored,
    output reg [63:0] imm_data_stored,
    output reg [63:0] ALU_result_stored,
    output reg [63:0] read_data2_stored
    );
    
    always@(posedge clk)
    begin
    switch_branch_stored <= switch_branch;
    ALU_result_stored <= ALU_Result;
    read_data2_stored <= read_data2;
    rd_stored <= rd;
    RegWrite_stored <= RegWrite;
    MemtoReg_stored <= MemtoReg;
    Branch_stored <= Branch;
    MemRead_stored <= MemRead;
    MemWrite_stored <= MemWrite;
    imm_data_stored <= imm_data;
    end
endmodule

