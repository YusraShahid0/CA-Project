`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2024 01:51:23 PM
// Design Name: 
// Module Name: MEM_WB
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

module MEM_WB(
    input clk,
    input reset,
    input [63:0]read_data,
    input [63:0]ALU_Result,
    input [4:0]rd,
    
    //WB Control Signals
    input RegWrite,
    input MemtoReg,
    input MemRead,
    
    output reg [63:0]read_data_stored,
    output reg [63:0]ALU_Result_stored,
    output reg [4:0]rd_stored,
    output reg RegWrite_stored,
    output reg MemtoReg_stored,
    output reg MemRead_stored
    );
    
    always @(posedge clk or posedge reset) begin  //
    if (reset == 1'b1) begin
       MemtoReg_stored = 0; RegWrite_stored = 0; rd_stored = 0;
        ALU_Result_stored = 0; read_data_stored = 0;
    end
    
    else begin
        read_data_stored <= read_data;
        ALU_Result_stored <= ALU_Result;
        rd_stored <= rd;
        RegWrite_stored <= RegWrite;
        MemtoReg_stored <= MemtoReg;
        MemRead_stored <= MemRead;
        end
    end
endmodule

