`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/23 16:47:49
// Design Name: 
// Module Name: RegisterFile
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


module RegisterFile(ReadReg1,ReadReg2,rd,WriteData,WriteReg,RegWrite,CLK,Reset,ReadData1,ReadData2,PCSrc,PcAdd4);
    input [4:0] ReadReg1,rd;//rs
    input [4:0] ReadReg2;//rt或者立即数
    input [31:0] WriteData;//写入的数据
    input [4:0] WriteReg;//写入地址
    input RegWrite; //写信号
    input CLK;
    input Reset;
    input [2:0] PCSrc;
    input [31:0] PcAdd4;
    output [31:0] ReadData1;
    output [31:0] ReadData2;


    reg [31:0] regFile[0:31];
    integer i;
    initial begin
        for (i=0;i<32;i=i+1)
            regFile[i]<=0;
    end
      
    assign    ReadData1 = regFile[ReadReg1];
    assign    ReadData2 = regFile[ReadReg2];
        //$display("regfile %d %d\n", ReadReg1, ReadReg2);
    
    
    always@(negedge CLK )
    begin
     //$display("lala");
        if(RegWrite && WriteReg)
        begin
            regFile[WriteReg] = WriteData;
            //$display("%d %d",WriteReg, WriteData);
        end
    end

    always@(negedge CLK)
    begin
        if(PCSrc == 3'b011)
        begin
        //$display("%h",PcAdd4);
            //$display("lala");
            regFile[31] = PcAdd4+4;
            //$display("%h",regFile[31]);
        end
    end
    always@(negedge CLK)
    begin
        if(PCSrc == 3'b101)
        begin
        //$display("%h",PcAdd4);
            //$display("lala");
            regFile[rd] = PcAdd4+4;
            //$display("%h",regFile[31]);
        end
    end
endmodule

