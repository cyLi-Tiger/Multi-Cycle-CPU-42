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


module PC(Result,Clk,Reset,Address,stall,stallstall);  //En=1可以写，stall=0没有发生lw数据冒险
    input Clk;//时钟
    input Reset;//是否重置地址。0-初始化PC，否则接受新地址       
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
             if (!Reset) //如果为0则初始化PC，否则接受新地址
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

