`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2024 02:59:57 PM
// Design Name: 
// Module Name: Data_Memory
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


module Data_Memory(
input [63:0] Mem_Addr,
input[63:0] Write_Data,
input clk,
input MemWrite,
input MemRead,
output reg [63:0] Read_Data,
output  [63:0] element1,
output  [63:0] element2,
output  [63:0] element3
);

reg [7:0]dm[63:0];
integer i;
initial
begin

for(i=0; i<64 ;i = i+1)
begin
dm[i] = 0;
end
//dm[0] = 8'd4;
//dm[8] = 8'd6;
//dm[16] = 8'd2;

end

assign element1 = {dm[7], dm[6], dm[5],dm[4], dm[3], dm[2], dm[1],dm[0]};
assign element2 = {dm[15],dm[14], dm[13], dm[12], dm[11], dm[10], dm[9],dm[8]};
assign element3 = {dm[23],dm[22], dm[21], dm[20], dm[19], dm[18], dm[17],dm[16]};

always @(posedge clk)
begin
    if(MemWrite) begin
            dm[Mem_Addr] = Write_Data[7:0];
            dm[Mem_Addr+1] = Write_Data[15:8];
            dm[Mem_Addr+2] = Write_Data[23:16];
            dm[Mem_Addr+3] = Write_Data[31:24];
            dm[Mem_Addr+4] = Write_Data[39:32];
            dm[Mem_Addr+5] = Write_Data[47:40];
            dm[Mem_Addr+6] = Write_Data[55:48];
            dm[Mem_Addr+7] = Write_Data[63:56];
        end 
             // element1 = {dm[7], dm[6], dm[5],dm[4], dm[3], dm[2], dm[1],dm[0]};
            end

always@(*)
begin
    if(MemRead) begin
            Read_Data[7:0] = dm[Mem_Addr];
            Read_Data[15:8] = dm[Mem_Addr+1];
            Read_Data[23:16] = dm[Mem_Addr+2];
            Read_Data[31:24] = dm[Mem_Addr+3];
            Read_Data[39:32] = dm[Mem_Addr+4];
            Read_Data[47:40] = dm[Mem_Addr+5];
            Read_Data[55:48] = dm[Mem_Addr+6];
            Read_Data[63:56] = dm[Mem_Addr+7];
        end
 
     end
endmodule
