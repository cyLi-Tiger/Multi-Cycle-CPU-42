`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/23 16:47:49
// Design Name: 
// Module Name: extend
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


//16位扩展为32位，se为0时零扩展
module EXT16T32 (X, Se, Y);
    input [15:0] X;
    input Se;
    output [31:0] Y;

    wire [31:0] E0, E1;
    wire [15:0] e = {16{X[15]}};
    parameter z = 16'b0;
    assign E0 = {z, X};
    assign E1 = {e, X};
    MUX2X32 i(E0, E1, Se, Y);
endmodule   

//扩展sa
module EXT5T32 (sa, Y);
    input [4:0] sa;
    output [31:0] Y;

    wire [31:0] E;
    parameter z = 27'b0;
    assign Y = {z, sa};
endmodule   

//扩展load指令
module data_ext_load(Dout,Addr,load_option,ext_Dout);
    input [31:0] Dout;
    input [31:0] Addr;
    input [2:0] load_option;
    output [31:0] ext_Dout;
    
    wire [31:0] lb,lbu,lh,lhu,lw;
    wire [23:0] e1 = {24{Dout[7]}};
    wire [23:0] e2 = {24{Dout[15]}};
    wire [23:0] e3 = {24{Dout[23]}};
    wire [23:0] e4 = {24{Dout[31]}};
    wire [15:0] e5 = {16{Dout[15]}};
    wire [15:0] e6 = {16{Dout[31]}};
    parameter z1 = 24'b0;
    parameter z2 = 16'b0;
    assign lb = (Addr[1]==1)?(Addr[0]==1?{e4, Dout[31:24]}:{e3, Dout[23:16]}):(Addr[0]==1?{e2, Dout[15:8]}:{e1, Dout[7:0]});
    assign lh = (Addr[1]==1)?{e6, Dout[31:16]}:{e5, Dout[15:0]};
    assign lbu = (Addr[1]==1)?(Addr[0]==1?{z1, Dout[31:24]}:{z1, Dout[23:16]}):(Addr[0]==1?{z1, Dout[15:8]}:{z1, Dout[7:0]});
    assign lhu = (Addr[1]==1)?{z2, Dout[31:16]}:{z2, Dout[15:0]};
    assign lw = Dout;
    
    MUX5X32 i(lb,lbu,lh,lhu,lw,load_option,ext_Dout);

endmodule

