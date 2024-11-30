`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2024 03:07:38 PM
// Design Name: 
// Module Name: ALU_Control
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


module ALU_Control(
    input [1:0] ALUOp,
    input [3:0] funct,
    output reg [3:0] operation
    );
    
    always @ (ALUOp or funct)
	begin
		case(ALUOp)
			2'b00: // I Type
			begin
			case(funct[2:0])
				4'b001: operation = 4'b1000; // SLLI
				default: operation = 4'b0010; // I - Type (ld, sd)
			endcase
			end
			2'b01: operation = 4'b0110; // SB Type (Beq)
			2'b10: // R Type 
			begin 
			case(funct)
				4'b0000: operation = 4'b0010;
				4'b1000: operation = 4'b0110;
				4'b0111: operation = 4'b0000;
				4'b0110: operation = 4'b0001;
			endcase
			end
		endcase
	end
//    always@(*)
//    begin
    
//        if (ALUOp == 2'b00)
//            begin
//                case ({funct[2:0]})
//                3'b001: begin operation = 4'b0111; end  //slli
//                default: begin operation = 4'b0010; end  //addi
//                endcase
//            end
            
//        else if (ALUOp == 2'b01) //branch cases (operation is the same for every branch)
//            begin
//                operation = 4'b0110;
//            end 
            
//        else if (ALUOp == 2'b10 && funct == 4'b0000) //add
//            begin
//                operation = 4'b0010;
//            end 
            
//        else if (ALUOp == 2'b10 && funct == 4'b1000) //sub
//            begin
//                operation = 4'b0110;
//            end  
            
//        else if (ALUOp == 2'b10 && funct == 4'b0111) //and
//            begin
//                operation = 4'b0000;
//            end 
            
//        else if (ALUOp == 2'b10 && funct == 4'b0110) //or
//            begin
//                operation = 4'b0001;
//            end    
//    end
endmodule
