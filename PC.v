`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/23 16:47:49
// Design Name: 
// Module Name: PC
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


module PC(Result,Clk,Reset,Address,stall,stallstall);  //En=1����д��stall=0û�з���lw����ð��
    input Clk;//ʱ��
    input Reset;//�Ƿ����õ�ַ��0-��ʼ��PC����������µ�ַ       
    input[31:0] Result;
    input stall,stallstall;
    output reg[31:0] Address;
    wire En;

    assign En=(~stall)&(~stallstall);
    
    initial begin
        Address  <= 32'h00003000;
    end
    
    always @(posedge Clk or negedge Reset)  
    begin  
        if(En==1)
        begin
             if (!Reset) //���Ϊ0���ʼ��PC����������µ�ַ
                begin  
                    Address <= 32'h000003000;  
                end  
            else   
                begin
                    Address =  Result;  
                end  
        end
    end  
endmodule

