`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2024 01:33:56 AM
// Design Name: 
// Module Name: tb_RISC_V_complete
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


module test_complete_processor();

reg clk, reset;
wire[63:0]PC_out;
wire[31:0]instruction;
wire[63:0] WriteData;
wire [63:0]ReadData1;
wire [63:0]ReadData2;
wire [63:0] mux3_1_out, mux3_2_out;
wire [63:0] element1, element2, element3;

RISC_V_Pipelined_complete rspc(clk, reset, PC_out, instruction, Write_Data, ReadData1, ReadData2,mux3_1_out, mux3_2_out,element1, element2, element3);

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
