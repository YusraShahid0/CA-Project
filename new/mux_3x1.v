`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2024 08:13:33 PM
// Design Name: 
// Module Name: mux_3x1
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


module mux_3x1(
    input [63:0] a,
    input [63:0] b, 
    input [63:0] c, 
    input [1:0] sel,
    output reg [63:0] out
    );
    
    always@(*)
    begin
    
    if (sel == 2'b00) out <= a;
    else if (sel == 2'b10) out <= b;
    else if (sel == 2'b01) out <= c;
    
    end
endmodule
