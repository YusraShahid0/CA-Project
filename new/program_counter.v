`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2024 10:00:43 PM
// Design Name: 
// Module Name: program_counter
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


module program_counter(
    input clk,
    input reset,
    input stall,
    input [63:0]PC_in,
    output reg [63:0]PC_out
    );
 initial begin
 PC_out =0;
 end
    always@(posedge clk)
    begin
        if (reset == 1)
            begin
                PC_out = 64'd0;
            end
        else if (stall == 1'b1) begin PC_out = PC_out; end
        else 
            begin
                PC_out = PC_in;
            end
    end
endmodule