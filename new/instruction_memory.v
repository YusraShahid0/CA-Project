`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2024 03:04:38 PM
// Design Name: 
// Module Name: instruction_memory
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


module instruction_memory(
    input [63:0]Inst_Address,
    output [31:0]Instruction
    );
    
    reg [7:0]inst_memory[115:0];
    
    initial 
    begin
     
      // addi x11 x0 3  
     inst_memory[0] = 8'b10010011;
     inst_memory[1] = 8'b00000101;
     inst_memory[2] = 8'b00110000;
     inst_memory[3] = 8'b00000000;
     
    // addi x11, x11, 1  
     inst_memory[4] = 8'b10010011;
     inst_memory[5] = 8'b10000101;
     inst_memory[6] = 8'b00010101;
     inst_memory[7] = 8'b00000000;
    
    // addi x10 x0 0x00 #base address of array a  
     inst_memory[8] = 8'b00010011;
     inst_memory[9] = 8'b00000101;
     inst_memory[10] = 8'b00000000;
     inst_memory[11] = 8'b00000000;
     
    // addi x13, x0, 0 #i  
     inst_memory[12] = 8'b10010011;
     inst_memory[13] = 8'b00000110;
     inst_memory[14] = 8'b00000000;
     inst_memory[15] = 8'b00000000;
     
    // addi x20 x0 4 
     inst_memory[16] = 8'b00010011;
     inst_memory[17] = 8'b00001010;
     inst_memory[18] = 8'b01000000;
     inst_memory[19] = 8'b00000000;
     
    // sd x20, 0x0(x0)   
     inst_memory[20] = 8'b00100011;
     inst_memory[21] = 8'b00110000;
     inst_memory[22] = 8'b01000101 ;
     inst_memory[23] = 8'b00000001;
     
    // addi x21 x0 6  
     inst_memory[24] = 8'b10010011;
     inst_memory[25] = 8'b00001010;
     inst_memory[26] = 8'b01100000;
     inst_memory[27] = 8'b00000000;
     
    // sd x21, 0x08(x0)  
     inst_memory[28] = 8'b00100011;
     inst_memory[29] = 8'b00110100;
     inst_memory[30] = 8'b01010101;
     inst_memory[31] = 8'b00000001;
     
    // addi x22 x0 2 
     inst_memory[32] = 8'b00010011;
     inst_memory[33] = 8'b00001011;
     inst_memory[34] = 8'b00100000;
     inst_memory[35] = 8'b00000000;
     
    // sd x22, 0x0c(x10)   10000
     inst_memory[36] = 8'b00100011;
     inst_memory[37] = 8'b00111000;
     inst_memory[38] = 8'b01100101;
     inst_memory[39] = 8'b00000001;
     
    // beq x25, x0, outer 
     inst_memory[40] = 8'b01100011;
     inst_memory[41] = 8'b10001100;
     inst_memory[42] = 8'b00001100;
     inst_memory[43] = 8'b00000100;
     
    // outer: beq x11, x13, exit 
     inst_memory[44] = 8'b01100011;
     inst_memory[45] = 8'b10000000;
     inst_memory[46] = 8'b11010101;
     inst_memory[47] = 8'b00001110;
     
    // add x14, x0, x13 #j 
     inst_memory[48] = 8'b00110011;
     inst_memory[49] = 8'b00000111;
     inst_memory[50] = 8'b11010000;
     inst_memory[51] = 8'b00000000;
     
    // slli x15, x13, 3 # address of the i index  
     inst_memory[52] = 8'b10010011;
     inst_memory[53] = 8'b10010111;
     inst_memory[54] = 8'b00110110;
     inst_memory[55] = 8'b00000000;
     
    // add x15, x15, x10 
     inst_memory[56] = 8'b10110011;
     inst_memory[57] = 8'b10000111;
     inst_memory[58] = 8'b10100111;
     inst_memory[59] = 8'b00000000;
     
    // addi x13, x13, 1 #i  
     inst_memory[60] = 8'b10010011;
     inst_memory[61] = 8'b10000110;
     inst_memory[62] = 8'b00010110;
     inst_memory[63] = 8'b00000000;
     
    // bne x11, x13, inner   
     inst_memory[64] = 8'b01100011;
     inst_memory[65] = 8'b10010100;
     inst_memory[66] = 8'b11010101;
     inst_memory[67] = 8'b00001000;
     
    // inner: slli x16, x14, 4 # address of the j index 
     inst_memory[68] = 8'b00010011;
     inst_memory[69] = 8'b00011000;
     inst_memory[70] = 8'b00110111;
     inst_memory[71] = 8'b00000000;
     
    // add x16, x16, x10 
     inst_memory[72] = 8'b00110011;
     inst_memory[73] = 8'b00001000;
     inst_memory[74] = 8'b10101000;
     inst_memory[75] = 8'b00000000;
     
    // ld x8 0(x15) #array value at the i index   
     inst_memory[76] = 8'b00000011;
     inst_memory[77] = 8'b10110100;
     inst_memory[78] = 8'b00000111;
     inst_memory[79] = 8'b00000000;
     
    // ld x9 0(x16) #array value at the j index  
     inst_memory[80] = 8'b10000011;
     inst_memory[81] = 8'b00110100;
     inst_memory[82] = 8'b00001000;
     inst_memory[83] = 8'b00000000;
     
    // addi x14, x14, 1 
     inst_memory[84] = 8'b00010011;
     inst_memory[85] = 8'b00000111;
     inst_memory[86] = 8'b00010111;
     inst_memory[87] = 8'b00000000;
     
    // beq x14, x11, outer 
     inst_memory[88] = 8'b01100011;
     inst_memory[89] = 8'b00001100;
     inst_memory[90] = 8'b10110111;
     inst_memory[91] = 8'b00000100;
     
    // blt x9, x8, swap 
     inst_memory[92] = 8'b01100011 ;
     inst_memory[93] = 8'b11000100;
     inst_memory[94] = 8'b10000100;
     inst_memory[95] = 8'b00001100;
     
    // bne x14, x11,inner 
     inst_memory[96] = 8'b01100011 ;
     inst_memory[97] = 8'b00010100;
     inst_memory[98] = 8'b10110111;
     inst_memory[99] = 8'b00001000;
     
    // swap: sd x8 0(x16) 
     inst_memory[100] = 8'b00100011;
     inst_memory[101] = 8'b00110000;
     inst_memory[102] = 8'b10001000;
     inst_memory[103] = 8'b00000000;
     
    // sd x9 0(x15) 
     inst_memory[104] = 8'b00100011;
     inst_memory[105] = 8'b10110000;
     inst_memory[106] = 8'b10010111;
     inst_memory[107] = 8'b00000000;
     
    // blt x9, x8,inner 
     inst_memory[108] = 8'b01100011;
     inst_memory[109] = 8'b11000100;
     inst_memory[110] = 8'b10000100;
     inst_memory[111] = 8'b00001000;
     
    // exit: 
     inst_memory[112] = 8'b00000000;
     inst_memory[113] = 8'b00000000;
     inst_memory[114] = 8'b00000000;
     inst_memory[115] = 8'b00000000;
     
    end
    
    begin
    assign Instruction[7:0] = inst_memory[Inst_Address];
    assign Instruction[15:8] = inst_memory[Inst_Address+1];
    assign Instruction[23:16] = inst_memory[Inst_Address+2];
    assign Instruction[31:24] = inst_memory[Inst_Address+3];
    end
    
    endmodule
    
    /*
    inst_memory[0] = 8'b10000011;
     inst_memory[1] = 8'b00110100;
     inst_memory[2] = 8'b00000101;
     inst_memory[3] = 8'b00000010;
     inst_memory[4] = 8'b10110011;
     inst_memory[5] = 8'b10000100;
     inst_memory[6] = 8'b10011010;
     inst_memory[7] = 8'b00000000;
     inst_memory[8] = 8'b10010011;
     inst_memory[9] = 8'b10000100;
     inst_memory[10] = 8'b00010100;
     inst_memory[11] = 8'b00000000;
     inst_memory[12] = 8'b00100011;
     inst_memory[13] = 8'b00110100;
     inst_memory[14] = 8'b10010101;
     inst_memory[15] = 8'b00000010;
*/