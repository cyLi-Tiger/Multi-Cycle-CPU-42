`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/23 16:47:49
// Design Name: 
// Module Name: REG_IF_ID
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


module REG_IF_ID (IF_PCadd4,IF_Inst,Clk,Reset,ID_PCadd4,ID_Inst,stall,stallstall);
    input [31:0] IF_PCadd4,IF_Inst;
    input Clk,Reset,stall,stallstall;
    output reg[31:0] ID_PCadd4,ID_Inst;

    wire En,clr;
    assign En=(~stall)&(~stallstall);
    //assign clr=~condep;
    initial begin
        ID_Inst = 0;
        ID_PCadd4= 0 ;
    end
    
    always @(posedge Clk) begin 
        if(En==1)begin
            //$display("IF_Inst:",IF_Inst);
            ID_PCadd4 = IF_PCadd4;
            ID_Inst = IF_Inst;             
        end
    end  
endmodule
    