`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2024 12:16:06 AM
// Design Name: 
// Module Name: RISC_V_Pipelined_complete
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


module RISC_V_Pipelined_complete(
    input clk,
    input reset,
    output [63:0] instr_addr,
    output [31:0] instruction,
//    output [63:0] WriteData,
    output [63:0] ReadData1,
    output [63:0] ReadData2,
    output [63:0] mux3_1_out, mux3_2_out,
    output [63:0] element1, element2, element3
    );
    
    // DECLARATIONS OF ALL THE NEEDED WIRES //
    wire RegWrite, branch, MemRead, MemtoReg, MemWrite, ALUSrc, zero, switch_branch, less_than,
         IDEX_RegWrite, IDEX_Branch, IDEX_MemRead, IDEX_MemtoReg, IDEX_MemWrite, IDEX_ALUSrc, 
         EXMEM_zero, EXMEM_less_than, EXMEM_RegWrite, EXMEM_Branch, EXMEM_MemRead, EXMEM_MemtoReg, EXMEM_MemWrite,
         MEMWB_RegWrite, MEMWB_MemRead, MEMWB_MemtoReg;
    wire [1:0] ALUOp, IDEX_ALUOp, forwardA, forwardB;
    wire [2:0]funct3;
    wire [3:0] operation, funct, IDEX_funct, EXMEM_funct;
    wire [4:0] rd, rs1, rs2, IDEX_rd, IDEX_rs1, IDEX_rs2, EXMEM_rd, MEMWB_rd; //IFID_rs1, IFID_rs2
    wire [6:0]opcode, funct7;
    wire [31:0] IFID_Instr;
    wire [63:0] imm_data, result, Read_Data, PC_in, b, branch_pc, next_pc, 
                IFID_PC, IDEX_PC, 
                IDEX_imm_data, IDEX_ReadData1, IDEX_ReadData2,
                EXMEM_pc_next, EXMEM_result, EXMEM_imm_data, EXMEM_ReadData2, //mux3_1_out, mux3_2_out,
                MEMWB_result, MEMWB_ReadData;
                wire  [63:0] WriteData;
    
    //--------------------START OF THE PROCESSOR-------------------------//
    
    
    //------------INSTRUCTION FETCH------------//
    
    mux a1(next_pc, EXMEM_imm_data, switch_branch, PC_in);
    program_counter a (clk, reset, stall, PC_in, instr_addr);
    Adder xyz (instr_addr, 64'd4, next_pc);
    instruction_memory c (instr_addr, instruction);
   
    IF_ID if_id(clk, reset, stall, instruction, instr_addr, IFID_Instr, IFID_PC);
    Hazard_Detection_Unit hdu(IDEX_rd, rs1, rs2, IDEX_MemRead, stall);
    
    //------------DECODE STAGE------------//
    
    InsParser d (IFID_Instr, opcode, rd, funct3, rs1, rs2, funct7);
    Control_Unit e (opcode, stall, branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite);
    regfile f (WriteData, rs1, rs2, MEMWB_rd, MEMWB_RegWrite, clk, reset, ReadData1,ReadData2);
    imm_gen g (IFID_Instr, imm_data);
    assign funct[3] = IFID_Instr[30]; assign funct[2:0] = IFID_Instr [14:12];
    
    ID_EX id_ex(clk, reset, RegWrite, MemtoReg, Branch, MemRead, MemWrite, ALUSrc, ALUOp, funct,
                 rd, rs1, rs2, imm_data, IFID_PC, ReadData1, ReadData2, 
                 IDEX_RegWrite, IDEX_MemtoReg, IDEX_Branch, IDEX_MemRead, IDEX_MemWrite, IDEX_ALUSrc, 
                 IDEX_ALUOp, IDEX_funct, IDEX_rd, IDEX_rs1, IDEX_rs2, IDEX_imm_data, IDEX_PC, 
                 IDEX_ReadData1, IDEX_ReadData2);
        
        
   //------------EXECUTION STAGE------------//
    forwarding_unit fu (IDEX_rs1, IDEX_rs2, EXMEM_rd, MEMWB_rd, EXMEM_RegWrite, MEMWB_RegWrite, forwardA, forwardB);
    mux_3x1 m3_1(IDEX_ReadData1, EXMEM_result, WriteData, forwardA, mux3_1_out);
    mux_3x1 m3_2(IDEX_ReadData2, EXMEM_result, WriteData, forwardB, mux3_2_out);
    
    ALU_Control h (IDEX_ALUOp, IDEX_funct, operation);
    mux i(mux3_2_out, IDEX_imm_data, IDEX_ALUSrc, b);
    ALU_64_bit j (mux3_1_out, b, operation, result);
    Branch k(EXMEM_Branch, ReadData1, ReadData2, EXMEM_funct, switch_branch);
   
    EX_MEM ex_mem(clk, reset, IDEX_RegWrite, IDEX_MemtoReg, IDEX_Branch, IDEX_MemRead, IDEX_MemWrite,   
                  switch_branch, IDEX_rd, IDEX_imm_data, result, IDEX_ReadData2,
                  EXMEM_RegWrite, EXMEM_MemtoReg, EXMEM_Branch, EXMEM_MemRead, EXMEM_MemWrite,
                  EXMEM_switch_branch, EXMEM_rd, EXMEM_imm_data, EXMEM_result, EXMEM_ReadData2);
    
    //------------MEMORY ACCESS STAGE------------//
    
   
    Data_Memory m (EXMEM_result, EXMEM_ReadData2, clk, EXMEM_MemWrite, EXMEM_MemRead, Read_Data, element1, element2, element3);
   
    MEM_WB mem_wb(clk, reset, Read_Data, EXMEM_result, EXMEM_rd, EXMEM_RegWrite, EXMEM_MemtoReg, EXMEM_MemRead, 
                  MEMWB_ReadData, MEMWB_result, MEMWB_rd, MEMWB_RegWrite, MEMWB_MemtoReg,MEMWB_MemRead);
    
    
    //------------WRITE BACK STAGE------------//
    mux n (MEMWB_result, MEMWB_ReadData, MEMWB_MemtoReg, WriteData);
    
endmodule
