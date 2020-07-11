`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/01/13 17:40:15
// Design Name: 
// Module Name: FU
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


module FU(E_RegWrite,E_WriteReg,E_MemtoReg,M_RegWrite,M_WriteReg,M_MemtoReg,ID_rs,ID_rt,ID_FwdA,ID_FwdB,ID_Op,ID_func,c_adventure,stall,stallstall);
    input [4:0] E_WriteReg,M_WriteReg,ID_rs,ID_rt;
    input  E_RegWrite,M_RegWrite,E_MemtoReg,M_MemtoReg,c_adventure;
    input [5:0] ID_Op,ID_func;
    output reg [1:0] ID_FwdA,ID_FwdB;
    output stall,stallstall;

    always@(E_WriteReg,M_WriteReg,E_RegWrite,M_RegWrite,ID_rs,ID_rt)begin
        ID_FwdA=2'b00;
        if((ID_rs==E_WriteReg)&(E_WriteReg!=0)&(E_RegWrite==1))begin
            ID_FwdA=2'b01;
        end 
        else begin
            if((ID_rs==M_WriteReg)&(M_WriteReg!=0)&(M_RegWrite==1))begin
                ID_FwdA=2'b10;
            end
        end
    end

    always@(E_WriteReg,M_WriteReg,E_RegWrite,M_RegWrite,ID_rs,ID_rt)begin
        ID_FwdB=2'b00;
        if((ID_rt==E_WriteReg)&(E_WriteReg!=0)&(E_RegWrite==1))begin
            ID_FwdB=2'b01;
        end 
        else begin
            if((ID_rt==M_WriteReg)&(M_WriteReg!=0)&(M_RegWrite==1))begin
                ID_FwdB=2'b10;
            end
        end
    end

    wire ID_beq=~ID_Op[5]&~ID_Op[4]&~ID_Op[3]&ID_Op[2]&~ID_Op[1]&~ID_Op[0];
    wire ID_bne=~ID_Op[5]&~ID_Op[4]&~ID_Op[3]&ID_Op[2]&~ID_Op[1]&ID_Op[0];
    wire ID_jalr=~ID_Op[5]&~ID_Op[4]&~ID_Op[3]&~ID_Op[2]&~ID_Op[1]&~ID_Op[0]&~ID_func[5]&~ID_func[4]&ID_func[3]&~ID_func[2]&~ID_func[1]&ID_func[0];
    
    //lw+add  add+beq(jalr) lw+x+beq
    assign stall=(((ID_rs==E_WriteReg)|(ID_rt==E_WriteReg))&(E_MemtoReg==1)&(E_WriteReg!=0)&(E_RegWrite==1))|((ID_beq | ID_bne | ID_jalr)&((ID_rs==E_WriteReg)|(ID_rt==E_WriteReg))&(E_WriteReg!=0)&(E_RegWrite==1))|(((ID_rs==M_WriteReg)|(ID_rt==M_WriteReg))&(M_MemtoReg==1)&(M_WriteReg!=0)&(M_RegWrite==1)&ID_beq);
    //lw+beq
    assign stallstall=((ID_rs==E_WriteReg)|(ID_rt==E_WriteReg))&(E_MemtoReg==1)&(E_WriteReg!=0)&(E_RegWrite==1)&ID_beq;

endmodule
