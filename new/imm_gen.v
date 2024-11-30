`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2024 02:53:16 PM
// Design Name: 
// Module Name: imm_gen
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


module imm_gen(
    input [31:0]ins,
    output reg [63:0]imm_data
    );
    always@(*)
    begin
        begin
        if (ins[6:5]==2'b00)
            imm_data[11:0] = ins[31:20];
        else if (ins[6:5]==2'b01)
            imm_data[11:0] = {ins[31:25],ins[11:7]};
        else if(ins[6:5]==2'b11)
            imm_data[11:0] = {ins[31],ins[7],ins[30:25],ins[11:8]};
        end
    
        begin
        if(imm_data[11]==1)
            imm_data[63:12] = 52'b1111111111111111111111111111111111111111111111111111;
        else if(imm_data[11]==0)
            imm_data[63:12] = 52'b0000000000000000000000000000000000000000000000000000;
        end
    end
endmodule
