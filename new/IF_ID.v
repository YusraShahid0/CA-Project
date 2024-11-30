`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2024 01:47:55 PM
// Design Name: 
// Module Name: IF_ID
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


module IF_ID(
    input clk,
    input reset,
    input stall,
    input [31:0] ins_in,
    input [63:0] pc_in,
    output reg [31:0] ins_stored,
    output reg [63:0] pc_stored
    );
    
    always @(posedge clk or posedge reset) begin  //or posedge reset
    if (reset == 1'b1) begin
        ins_stored = 0; pc_stored = 0;
    end
    else if (stall == 1'b1) begin
        pc_stored = pc_stored; ins_stored = ins_stored;
    end
       else begin 
        ins_stored <= ins_in;
        pc_stored <= pc_in;
        end
    end
    
endmodule

    
    