`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/23 16:47:49
// Design Name: 
// Module Name: shift
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


//左移两位
//左移两位
module SHIFTER32_L2(X,Sh);
    input [31:0] X;
    output [31:0] Sh;
    parameter z=2'b00;
    assign Sh={X[29:0],z};
endmodule

//J指令的地址
module SHIFTER_COMBINATION(X,PCADD4,Sh);
    input [25:0] X;
    input [31:0] PCADD4;
    output [31:0] Sh;
    parameter z=2'b00;
    assign Sh={PCADD4[31:28],X[25:0],z};
endmodule
