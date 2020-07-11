`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/01/13 17:40:15
// Design Name: 
// Module Name: if_c_adventure
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


module if_c_adventure(A,B,Op,usigned,c_adventure);
    input [31:0] A,B;
    input [3:0] Op;
    input usigned;
    output c_adventure;

    wire less_res,less_v_res;
    wire unsigned_less_res,unsigned_less_v_res;
    wire less_equal_res;
    wire greater_equal_res;
    wire greater_res;
    wire eq_res;
    
	assign less_v_res = ($signed(A)<$signed(B)) ? 1:0;
	assign unsigned_less_v_res = A<B ? 1:0;
    assign less_res = $signed(A)<0 ? 1:0;
	//assign unsigned_less_res = A<0 ? 1:0;    
	assign less_equal_res = $signed(A)<=0 ? 1:0;
	assign greater_equal_res = $signed(A)>=0 ? 1:0;
	assign greater_res = $signed(A)>0 ? 1:0;
	assign eq_res = A==B?1:0;
	
	assign c_adventure = (~Op[3]&&~Op[2]&&~Op[1])?eq_res:(Op[2]==0 && Op[1]==0 && Op[0]==1) ? (usigned==1 ? unsigned_less_v_res: less_v_res):(Op[2]==1 ? (Op[0]==1 ? greater_equal_res : less_res):(Op[0]==1 ? greater_res : less_equal_res)); 	

endmodule

