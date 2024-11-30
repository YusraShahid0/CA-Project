`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2024 08:12:21 PM
// Design Name: 
// Module Name: pipelined_processor_tb
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


module test_pipeline();

    reg clk;
    reg reset;
    wire [4:0] rd;
    wire [4:0] rs1;
    wire [4:0] rs2;
    wire [63:0] ReadData1;
    wire [63:0] ReadData2;
    wire [4:0] IDEX_rd;
    wire [63:0] IDEX_ReadData1;
    wire [63:0] IDEX_ReadData2;
    wire [4:0] EXMEM_rd;
    wire [63:0] EXMEM_ReadData2;
    wire [4:0] MEMWB_rd;
    wire [63:0] MEMWB_ReadData;
    
    RISC_V_Pipelined risc_v_pip (clk, reset, rd, rs1, rs2, ReadData1, ReadData2, IDEX_rd, IDEX_ReadData1, IDEX_ReadData2, 
                                 EXMEM_rd, EXMEM_ReadData2, MEMWB_rd, MEMWB_ReadData); 
    
                                 
initial begin 
clk= 0;
reset = 1;
#10
reset=0;
#10
reset = 0;
#10
reset = 0;
end 

always
#20 clk = ~clk;

endmodule
