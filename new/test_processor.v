`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2024 04:22:21 PM
// Design Name: 
// Module Name: test_processor
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


module test_processor();
    reg clk;
    reg reset;
    
//wire[63:0]PC_out;
//   wire[31:0]instruction;
//    wire [6:0]opcode;
//    wire[4:0]rd;
//    wire[4:0]rs1;
//    wire[4:0]rs2;
////    wire branch;
////    wire MemRead;
////    wire MemtoReg;
////    wire [1:0] ALUOp;
////    wire MemWrite;
////    wire ALUSrc;
////    wire RegWrite;
//    wire[63:0] WriteData;
//    wire [63:0]ReadData1;
//    wire [63:0]ReadData2;
//    wire[63:0] imm_data;
//    wire[63:0] alu_result;
//    wire [63:0] Read_Data;
////    //wire [63:0]branch_pc;
////    wire switch_branch;
//    wire [63:0]next_pc;
//    wire zero;
//    wire less_than;
//    wire [63:0] x11, x13;
    wire [63:0] element1, element2, element3;

RISC_V_Processor x1 (clk, reset,element1, element2, element3); // PC_out,instruction,opcode,rd,rs1,rs2,branch, MemRead, MemtoReg,ALUOp,MemWrite,ALUSrc,RegWrite, WriteData,ReadData1,ReadData2, imm_data,alu_result,Read_Data, switch_branch, next_pc, x11, x13, zero,less_than
//,PC_out,rd, rs1,rs2, WriteData,ReadData1,ReadData2, imm_data,alu_result,Read_Data, next_pc
initial begin 
clk= 0;
reset = 1;
#1
reset=0;
#1
reset = 0;
#1
reset = 0;
end 

always
#2 clk = ~clk;
endmodule

