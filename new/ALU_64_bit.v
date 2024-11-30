`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2024 02:59:08 PM
// Design Name: 
// Module Name: ALU_64_bit
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


module ALU_64_bit(
    input [63:0] a,
    input [63:0] b,
    input [3:0] ALUOp,
    output reg [64:0] result
    );
    always @(*) begin
    
    case (ALUOp)
            4'b0000: begin assign result = a & b; end
            4'b0001: begin assign result = a | b; end
            4'b0010: begin assign result = a + b; end
            4'b0110: begin assign result = a - b; end
            4'b1100: begin assign result = ~(a | b); end
            4'b1000: begin assign result = a*(2**b) ; end
    endcase
    end

endmodule
