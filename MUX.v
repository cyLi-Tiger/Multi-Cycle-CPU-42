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


//����nextAddr���ֱ�Ϊpc+4,b,j,jr
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

//ѡ��д�ĵ�ַ��rd����rt,1Ϊrt
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

//��·ѡ��������Q,EX/MEM,MEM/WB,0��ѡһ��
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

//ѡ��ALU x��
//ѡ��ALU y�˵���Դ������������չΪ32λ��������������Qb��forwardɶ�ģ�0��ʱ��Ϊ��չ
//ѡ��д�ؼĴ����ѵ�������Դ���Ǵ�dm���������Ǵ�alu������     
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

//ID�׶ε���·ѡ����
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

//ѡ��load������
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