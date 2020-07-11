`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/23 16:47:49
// Design Name: 
// Module Name: REG_EX_MEM
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


module REG_EX_MEM(E_RegWrite,E_RegDst,E_MemWrite,E_MemtoReg,E_WriteReg,E_Qb,E_ALUanswer,E_load_option,E_save_option,Clk,Reset,
M_RegWrite,M_RegDst,M_MemWrite,M_MemtoReg,M_WriteReg,M_Qb,M_ALUanswer,M_load_option,M_save_option);

    input [31:0] E_ALUanswer,E_Qb;
    input [4:0] E_WriteReg;
    input [2:0] E_load_option;
    input [1:0] E_save_option;
    input Clk,Reset;
    input E_RegWrite,E_RegDst,E_MemWrite,E_MemtoReg;

    output reg[31:0] M_ALUanswer ,M_Qb;
    output reg[4:0] M_WriteReg;
    output reg[2:0] M_load_option;
    output reg[1:0] M_save_option;
    output reg M_RegWrite,M_RegDst,M_MemWrite,M_MemtoReg;

    initial begin
        M_ALUanswer = 0;
        M_MemtoReg = 0;
        M_MemWrite = 0;
        M_Qb = 0;
        M_RegDst = 0;
        M_RegWrite = 0;
        M_WriteReg = 0;
        M_load_option = 0;
        M_save_option = 0;
    end

    always @(posedge Clk or negedge Reset)  
    begin  
    if (!Reset) 
        begin  
            M_ALUanswer = 0;
            M_MemtoReg = 0;
            M_MemWrite = 0;
            M_Qb = 0;
            M_RegDst = 0;
            M_RegWrite = 0;
            M_WriteReg = 0;
            M_load_option = 0;
            M_save_option = 0;
        end  
    else   
        begin
            M_ALUanswer = E_ALUanswer;
            M_MemtoReg = E_MemtoReg;
            M_MemWrite = E_MemWrite;
            M_Qb = E_Qb;
            M_RegDst = E_RegDst;
            M_RegWrite = E_RegWrite;
            M_WriteReg = E_WriteReg;
            M_load_option = E_load_option;
            M_save_option = E_save_option;
        end  
    end

endmodule