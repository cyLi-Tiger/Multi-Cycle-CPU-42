`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/23 16:47:49
// Design Name: 
// Module Name: REG_MEM_WB
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


module REG_MEM_WB(M_RegWrite,M_MemtoReg,M_ALUanswer,M_Dout,M_WriteReg,M_load_option,Clk,Reset,
W_RegWrite,W_MemtoReg,W_ALUanswer,W_Dout,W_WriteReg,W_load_option);

    input [31:0] M_ALUanswer,M_Dout;
    input [4:0] M_WriteReg;
    input [2:0] M_load_option;
    input Clk,Reset,M_RegWrite,M_MemtoReg;

    output reg[31:0] W_ALUanswer,W_Dout;
    output reg[4:0] W_WriteReg;
    output reg[2:0] W_load_option;
    output reg W_RegWrite,W_MemtoReg;

    initial begin
        W_RegWrite = 0;
        W_MemtoReg = 0;
        W_ALUanswer = 0;
        W_Dout = 0;
        W_WriteReg = 0;
        W_load_option = 0;
    end

    always @(posedge Clk or negedge Reset)  
    begin  
    if (!Reset) 
        begin  
            W_RegWrite = 0;
            W_MemtoReg = 0;
            W_ALUanswer = 0;
            W_Dout = 0;
            W_WriteReg = 0;
            W_load_option = 0;
        end  
    else   
        begin
            W_RegWrite = M_RegWrite;
            W_MemtoReg = M_MemtoReg;
            W_ALUanswer = M_ALUanswer;
            W_Dout = M_Dout;
            W_WriteReg = M_WriteReg;
            W_load_option = M_load_option;
        end  
    end
endmodule