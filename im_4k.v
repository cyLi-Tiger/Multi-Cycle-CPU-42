`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/23 16:47:49
// Design Name: 
// Module Name: im_4k
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


module im_4k(Addr,Inst);//Ö¸Áî´æ´¢Æ÷
    input[31:0]Addr;
    reg [31:0]Rom[2047:0];

    output[31:0]Inst;

    initial 
    begin
        $readmemh("C:\\Users\\Y\\Desktop\\code42.txt", Rom);
    end
    
    integer i;
    initial begin
        $display("start simulation");
        for (i=0;i<20;i=i+1)
            $display("%d %h", i,Rom[i]);
    end
    
    //wire [12:0] tmp;
    //assign tmp=Addr[12:0];
    //assign tmp=tmp-13'h1000;
    //wire tmp;
    //assign tmp=0;
    //assign Addr[12]=tmp;

    assign Inst=Rom[Addr[12:2]-11'b10000000000];

endmodule

