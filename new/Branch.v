`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2024 12:18:26 PM
// Design Name: 
// Module Name: Branch
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


module Branch(
    input branch,
    input [63:0] ReadData1,
    input [63:0] ReadData2,
    input [3:0] funct,
    output reg switch_branch
    );
    
    always@(*)
        begin
        if (branch)
            case({funct[2:0]})
                3'b000: begin 
                    if (ReadData1 == ReadData2) switch_branch = 1;
                    else switch_branch = 0;
                    end
                3'b001: begin
                    if (ReadData1 == ReadData2) switch_branch = 0;
                    else  switch_branch = 1;
                    end
                3'b100:  begin
                    if (ReadData1 < ReadData2) switch_branch = 1;
                    else  switch_branch = 0;
                    end
            endcase
         else 
            switch_branch = 0;
            
        end
endmodule
