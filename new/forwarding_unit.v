`timescale 1ns / 1ps
module forwarding_unit(

    input [4:0] IDEX_rs1,
    input [4:0] IDEX_rs2,
    input [4:0] EXMEM_rd,
    input [4:0] MEMWB_rd,
    input EXMEM_reg_write,
    input MEMWB_reg_write,
    output reg [1:0] fd_A, output reg [1:0] fd_B);
    
    always @(*) begin
    
    assign fd_A = 2'b00;
    assign fd_B = 2'b00;
        
    // EX Hazard
   if ((EXMEM_reg_write) && (EXMEM_rd != 0) && (EXMEM_rd==IDEX_rs1)) begin
        assign fd_A=2'b10; end
   else if ((EXMEM_reg_write) && (EXMEM_rd != 0) && (EXMEM_rd==IDEX_rs2)) begin
        assign fd_B=2'b10; end
    
    // MEM Hazard
    if ((MEMWB_reg_write) && (MEMWB_rd != 0) && (MEMWB_rd==IDEX_rs1)) begin
        assign fd_A=2'b01; end
        
     else if ((MEMWB_reg_write) && (MEMWB_rd != 0) && (MEMWB_rd==IDEX_rs2)) begin
        assign fd_B=2'b01; end
    
    if (EXMEM_reg_write == 0 & MEMWB_reg_write == 0)
        begin 
            assign fd_A = 2'b00;
            assign fd_B = 2'b00;
        end   
    
    
    end
endmodule