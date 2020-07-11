`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/23 16:47:49
// Design Name: 
// Module Name: MUX
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


//决定nextAddr，分别为pc+4,b,j,jr
module MUX4X32_addr (PCAdd4, B, J, Jr, PCSrc, nextAddr);
    input [31:0] PCAdd4, B, J, Jr;
    input [2:0] PCSrc;
    output [31:0] nextAddr;

    function [31:0] select;
        input [31:0] PCAdd4, B, J, Jr;
        input [2:0] PCSrc;
        case(PCSrc)
            3'b000: select = PCAdd4;
            3'b001: select = B;
            3'b010: select = J;
            3'b011: select = J;
            3'b100: select = Jr;
            3'b101: select = Jr;
        endcase
    endfunction

    assign nextAddr = select (PCAdd4, B, J, Jr, PCSrc);
endmodule

//选择写的地址，rd还是rt,1为rt
module MUX2X5(rd,rt,RegDst,Y);
    input [4:0] rd,rt;
    input RegDst;
    output [4:0] Y;

    function [4:0] select;
        input [4:0] rd,rt;
        input RegDst;
        case(RegDst)
            1:select=rt;
            0:select=rd;
        endcase
    endfunction
    assign Y=select(rd,rt,RegDst);
endmodule

//旁路选择器，从Q,EX/MEM,MEM/WB,0中选一个
module MUX3X32 (Q, EX_MEM, MEM_WB, S, Y);
    input [31:0] Q, EX_MEM, MEM_WB;
    input [1:0] S;
    output [31:0] Y;

    function [31:0] select;
        input [31:0] Q, EX_MEM, MEM_WB;
        input [1:0] S;
        case(S)
            2'b00: select = Q;
            2'b01: select = EX_MEM;
            2'b10: select = MEM_WB;
        endcase
    endfunction
    assign Y = select (Q, EX_MEM, MEM_WB, S);
endmodule

//选择ALU x端
//选择ALU y端的来源，是来自于扩展为32位的立即数，还是Qb，forward啥的，0的时候为扩展
//选择写回寄存器堆的数据来源，是从dm里面来还是从alu里面来     
module MUX2X32(EXT,Qb_FORWARD,S,Y);
    input [31:0] EXT,Qb_FORWARD;
    input S;
    output [31:0] Y;

    function [31:0] select;
        input [31:0] EXT,Qb_FORWARD;
        input S;
        case(S)
            0:select=EXT;
            1:select=Qb_FORWARD;
        endcase
    endfunction
    assign Y=select(EXT,Qb_FORWARD,S);
endmodule

//ID阶段的旁路选择器
module MUX2X32_forward(ID_Q,ALU_OUT,Fwd,Y);
    input [31:0] ID_Q,ALU_OUT;
    input [1:0] Fwd;
    output [31:0] Y;
    
    function [31:0] select;
    input [31:0] ID_Q,ALU_OUT;
    input [1:0] Fwd;
    case(Fwd)
        2'b00: select = ID_Q;
        2'b01: select = ALU_OUT;
    endcase
    endfunction

    assign Y = select (ID_Q,ALU_OUT,Fwd);
endmodule

//选择load的数据
module MUX5X32(lb,lbu,lh,lhu,lw,load_option,ext_Dout);
    input [31:0] lb,lbu,lh,lhu,lw;
    input [2:0]load_option;
    output [31:0] ext_Dout;

    function [31:0] select;
        input [31:0]lb,lbu,lh,lhu,lw;
        input [2:0]load_option;
        case(load_option)
            3'b000:select=lw;
            3'b101:select=lb;
            3'b001:select=lbu;
            3'b111:select=lh;
            3'b011:select=lhu;
        endcase
    endfunction
    assign ext_Dout=select(lb,lbu,lh,lhu,lw,load_option);
endmodule