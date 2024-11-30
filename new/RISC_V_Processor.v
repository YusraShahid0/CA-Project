`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2024 03:12:05 PM
// Design Name: 
// Module Name: RISC_V_Processor
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


module RISC_V_Processor(
    input clk,
    input reset,
//    output [63:0]isntr_addr,
////    output [31:0]instruction,
////    output [6:0]opcode,
//    output [4:0]rd,
//    output [4:0]rs1,
//    output [4:0]rs2,
////    output branch, MemRead, MemtoReg,
////    output [1:0] ALUOp,
////    output MemWrite,
////    output ALUSrc,
////    output RegWrite,
//    output [63:0] WriteData,
//    output [63:0]ReadData1,
//    output [63:0]ReadData2,
//    output [63:0] imm_data,
//    output [63:0] alu_result,
//    output [63:0] Read_Data,
//    //output switch_branch,
//    //output [63:0] branch_pc,
//    output [63:0] next_pc,
//    output zero,
//    output less_than
    output [63:0] element1,
    output [63:0] element2,
    output [63:0] element3
    );
    wire[63:0]PC_out;
    wire[31:0]instruction;
    wire [6:0]opcode;
    wire branch;
    wire MemRead;
    wire MemtoReg;
    wire [1:0] ALUOp;
    wire MemWrite;
    wire ALUSrc;
    wire RegWrite;
    wire [63:0]PC_in;
    wire [2:0]funct3;
    wire [6:0]funct7;
    wire [3:0] operation;
    wire zero;
    wire switch_branch;
    wire less_than;
    wire [3:0] funct;
    assign funct[3] = instruction[30]; assign funct[2:0] = instruction [14:12];
    wire [63:0] b;
    wire[4:0]rd;
    wire[4:0]rs1;
    wire[4:0]rs2;
    wire[63:0] WriteData;
    wire [63:0]ReadData1;
    wire [63:0]ReadData2;
    wire[63:0] imm_data;
    wire[63:0] alu_result;
    wire [63:0] Read_Data;
    wire [63:0]next_pc;
wire [63:0] instr_addr;
    
    program_counter pc (clk, reset, PC_in, instr_addr);
    Adder add1 (instr_addr, 64'd4, next_pc);
    instruction_memory im (instr_addr,instruction);
    InsParser ip (instruction, opcode, rd, funct3, rs1, rs2, funct7);
    Control_Unit cu (opcode, branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite);
    regfile rf (WriteData, rs1, rs2, rd, RegWrite, clk, reset, ReadData1,ReadData2);
    imm_gen ig (instruction, imm_data);
    ALU_Control ac (ALUOp, funct, operation);
    mux m1(ReadData2, imm_data, ALUSrc, b);
    ALU_64_bit alu64 (ReadData1, b, operation , alu_result, zero, less_than);
    //Adder add2 (next_pc, imm_data+64'd4,branch_pc);
    Branch b1(branch, zero,less_than, funct, switch_branch);
    mux m2 (next_pc, imm_data, switch_branch, PC_in);
    Data_Memory dm (alu_result,ReadData2,clk,MemWrite,MemRead,Read_Data, element1, element2, element3);
    mux m3 (alu_result, Read_Data, MemtoReg, WriteData);
    
endmodule

//output [63:0]PC_in,

//    wire [63:0]PC_out;
//    wire [31:0] instruction;
//    wire  [6:0]opcode;
//    wire [4:0]rd;
//    output [2:0]funct3,
//wire [4:0]rs1;
//    wire [4:0]rs2;
//output [3:0] operation
//    output [6:0]funct7,
//output [3:0] funct,
//output [63:0] b,
//output zero,




