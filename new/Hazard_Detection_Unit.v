`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2024 12:09:30 AM
// Design Name: 
// Module Name: Hazard_Detection_Unit
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


module Hazard_Detection_Unit(
 input [4:0] rd_stored, rs1, rs2,
    input MemRead_stored,
    output reg stall // IFID_Write, PC_Write, IDEX_MuxOut,
    );

always @(*) begin
    if (MemRead_stored && (rd_stored == rs1 || rd_stored == rs2)) begin
        stall = 1; // IDEX_MuxOut = 1; IFID_Write = 0; PC_Write = 0; 
    end
    else begin
        stall = 0; // IDEX_MuxOut = 0; IFID_Write = 1; PC_Write = 1; 
    end
end
endmodule