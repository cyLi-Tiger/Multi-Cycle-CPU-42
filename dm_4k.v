`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/23 16:47:49
// Design Name: 
// Module Name: dm_4k
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
module save_to_BE(save_option,BE);
    input [1:0]save_option;
    output [3:0]BE;
    
    wire sb = ~save_option[1]&save_option[0];
    wire sh = save_option[1]&~save_option[0];
    wire sw = ~save_option[1] & ~save_option[0];
    assign BE[0] = sb | sh | sw;
    assign BE[1] = sh | sw;
    assign BE[2] = sw;
    assign BE[3] = sw;    
endmodule 

module dm_4k(Addr,BE,Din,Dout,MemWrite,Clk);
    input[31:0]Din;
    input[31:0]Addr;
    input [3:0]BE;
    input Clk,MemWrite;
    output[31:0]Dout;
    reg[31:0]Ram[2047:0];
    
    assign Dout=Ram[Addr[12:2]];
    wire [7:0] Din_b;
    wire [15:0] Din_h;
    assign Din_b = Din[7:0];
    assign Din_h = Din[15:0];
    
    always@(Clk)begin
        if(MemWrite && BE[3]==1)begin
            Ram[Addr[12:2]]<=Din;
        end
        else if(MemWrite && BE[1]==1) begin
            if(Addr[1]==1)begin
                Ram[Addr[12:2]][31:16]<=Din_h;
            end
            else if (Addr[1]==0)begin
                Ram[Addr[12:2]][15:0]<=Din_h;            
            end
        end
        else if(MemWrite && BE[0]==1) begin
            if(Addr[1]==1)begin
                if(Addr[0]==1)begin
                    Ram[Addr[12:2]][31:24]<=Din_b;
                end
                else if (Addr[0]==0)begin
                    Ram[Addr[12:2]][23:16]<=Din_b;            
                end
            end
            else if (Addr[1]==0)begin
                if(Addr[0]==1)begin
                    Ram[Addr[12:2]][15:8]<=Din_b;
                end
                else if (Addr[0]==0)begin
                    Ram[Addr[12:2]][7:0]<=Din_b;            
                end   
            end
        end
    end

    integer i;
    initial begin
        for(i=0;i<2048;i=i+1)
            Ram[i]=0;
    end
endmodule
