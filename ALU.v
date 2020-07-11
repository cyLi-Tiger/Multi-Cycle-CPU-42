`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/23 16:47:49
// Design Name: 
// Module Name: ALU
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
module ADDER(input [31:0] A, input [31:0]B, input cin, output [31:0] s, output [0:0]cout);

	wire[31:0] g;
	wire[31:0] p;
	wire[31:0] c;

	assign g = A & B;
	assign p = A ^ B;

	assign c[0] = g[0] | (p[0] & cin);
	assign c[1] = g[1] | (p[1] & (g[0] | (p[0] & cin)));
	assign c[2] = g[2] | (p[2] & (g[1] | (p[1] & (g[0] | (p[0] & cin)))));
	assign c[3] = g[3] | (p[3] & (g[2] | (p[2] & (g[1] | (p[1] & (g[0] | (p[0] & cin)))))));
	assign c[4] = g[4] | (p[4] & (g[3] | (p[3] & (g[2] | (p[2] & (g[1] | (p[1] & (g[0] | (p[0] & cin)))))))));
	assign c[5] = g[5] | (p[5] & (g[4] | (p[4] & (g[3] | (p[3] & (g[2] | (p[2] & (g[1] | (p[1] & (g[0] | (p[0] & cin)))))))))));
	assign c[6] = g[6] | (p[6] & (g[5] | (p[5] & (g[4] | (p[4] & (g[3] | (p[3] & (g[2] | (p[2] & (g[1] | (p[1] & (g[0] | (p[0] & cin)))))))))))));
	assign c[7] = g[7] | (p[7] & (g[6] | (p[6] & (g[5] | (p[5] & (g[4] | (p[4] & (g[3] | (p[3] & (g[2] | (p[2] & (g[1] | (p[1] & (g[0] | (p[0] & cin)))))))))))))));
	assign c[8] = g[8] | (p[8] & (g[7] | (p[7] & (g[6] | (p[6] & (g[5] | (p[5] & (g[4] | (p[4] & (g[3] | (p[3] & (g[2] | (p[2] & (g[1] | (p[1] & (g[0] | (p[0] & cin)))))))))))))))));
	assign c[9] = g[9] | (p[9] & (g[8] | (p[8] & (g[7] | (p[7] & (g[6] | (p[6] & (g[5] | (p[5] & (g[4] | (p[4] & (g[3] | (p[3] & (g[2] | (p[2] & (g[1] | (p[1] & (g[0] | (p[0] & cin)))))))))))))))))));
	assign c[10] = g[10] | (p[10] & (g[9] | (p[9] & (g[8] | (p[8] & (g[7] | (p[7] & (g[6] | (p[6] & (g[5] | (p[5] & (g[4] | (p[4] & (g[3] | (p[3] & (g[2] | (p[2] & (g[1] | (p[1] & (g[0] | (p[0] & cin)))))))))))))))))))));
	assign c[11] = g[11] | (p[11] & (g[10] | (p[10] & (g[9] | (p[9] & (g[8] | (p[8] & (g[7] | (p[7] & (g[6] | (p[6] & (g[5] | (p[5] & (g[4] | (p[4] & (g[3] | (p[3] & (g[2] | (p[2] & (g[1] | (p[1] & (g[0] | (p[0] & cin)))))))))))))))))))))));
	assign c[12] = g[12] | (p[12] & (g[11] | (p[11] & (g[10] | (p[10] & (g[9] | (p[9] & (g[8] | (p[8] & (g[7] | (p[7] & (g[6] | (p[6] & (g[5] | (p[5] & (g[4] | (p[4] & (g[3] | (p[3] & (g[2] | (p[2] & (g[1] | (p[1] & (g[0] | (p[0] & cin)))))))))))))))))))))))));
	assign c[13] = g[13] | (p[13] & (g[12] | (p[12] & (g[11] | (p[11] & (g[10] | (p[10] & (g[9] | (p[9] & (g[8] | (p[8] & (g[7] | (p[7] & (g[6] | (p[6] & (g[5] | (p[5] & (g[4] | (p[4] & (g[3] | (p[3] & (g[2] | (p[2] & (g[1] | (p[1] & (g[0] | (p[0] & cin)))))))))))))))))))))))))));
	assign c[14] = g[14] | (p[14] & (g[13] | (p[13] & (g[12] | (p[12] & (g[11] | (p[11] & (g[10] | (p[10] & (g[9] | (p[9] & (g[8] | (p[8] & (g[7] | (p[7] & (g[6] | (p[6] & (g[5] | (p[5] & (g[4] | (p[4] & (g[3] | (p[3] & (g[2] | (p[2] & (g[1] | (p[1] & (g[0] | (p[0] & cin)))))))))))))))))))))))))))));
	assign c[15] = g[15] | (p[15] & (g[14] | (p[14] & (g[13] | (p[13] & (g[12] | (p[12] & (g[11] | (p[11] & (g[10] | (p[10] & (g[9] | (p[9] & (g[8] | (p[8] & (g[7] | (p[7] & (g[6] | (p[6] & (g[5] | (p[5] & (g[4] | (p[4] & (g[3] | (p[3] & (g[2] | (p[2] & (g[1] | (p[1] & (g[0] | (p[0] & cin)))))))))))))))))))))))))))))));
	assign c[16] = g[16] | (p[16] & (g[15] | (p[15] & (g[14] | (p[14] & (g[13] | (p[13] & (g[12] | (p[12] & (g[11] | (p[11] & (g[10] | (p[10] & (g[9] | (p[9] & (g[8] | (p[8] & (g[7] | (p[7] & (g[6] | (p[6] & (g[5] | (p[5] & (g[4] | (p[4] & (g[3] | (p[3] & (g[2] | (p[2] & (g[1] | (p[1] & (g[0] | (p[0] & cin)))))))))))))))))))))))))))))))));
	assign c[17] = g[17] | (p[17] & (g[16] | (p[16] & (g[15] | (p[15] & (g[14] | (p[14] & (g[13] | (p[13] & (g[12] | (p[12] & (g[11] | (p[11] & (g[10] | (p[10] & (g[9] | (p[9] & (g[8] | (p[8] & (g[7] | (p[7] & (g[6] | (p[6] & (g[5] | (p[5] & (g[4] | (p[4] & (g[3] | (p[3] & (g[2] | (p[2] & (g[1] | (p[1] & (g[0] | (p[0] & cin)))))))))))))))))))))))))))))))))));
	assign c[18] = g[18] | (p[18] & (g[17] | (p[17] & (g[16] | (p[16] & (g[15] | (p[15] & (g[14] | (p[14] & (g[13] | (p[13] & (g[12] | (p[12] & (g[11] | (p[11] & (g[10] | (p[10] & (g[9] | (p[9] & (g[8] | (p[8] & (g[7] | (p[7] & (g[6] | (p[6] & (g[5] | (p[5] & (g[4] | (p[4] & (g[3] | (p[3] & (g[2] | (p[2] & (g[1] | (p[1] & (g[0] | (p[0] & cin)))))))))))))))))))))))))))))))))))));
	assign c[19] = g[19] | (p[19] & (g[18] | (p[18] & (g[17] | (p[17] & (g[16] | (p[16] & (g[15] | (p[15] & (g[14] | (p[14] & (g[13] | (p[13] & (g[12] | (p[12] & (g[11] | (p[11] & (g[10] | (p[10] & (g[9] | (p[9] & (g[8] | (p[8] & (g[7] | (p[7] & (g[6] | (p[6] & (g[5] | (p[5] & (g[4] | (p[4] & (g[3] | (p[3] & (g[2] | (p[2] & (g[1] | (p[1] & (g[0] | (p[0] & cin)))))))))))))))))))))))))))))))))))))));
	assign c[20] = g[20] | (p[20] & (g[19] | (p[19] & (g[18] | (p[18] & (g[17] | (p[17] & (g[16] | (p[16] & (g[15] | (p[15] & (g[14] | (p[14] & (g[13] | (p[13] & (g[12] | (p[12] & (g[11] | (p[11] & (g[10] | (p[10] & (g[9] | (p[9] & (g[8] | (p[8] & (g[7] | (p[7] & (g[6] | (p[6] & (g[5] | (p[5] & (g[4] | (p[4] & (g[3] | (p[3] & (g[2] | (p[2] & (g[1] | (p[1] & (g[0] | (p[0] & cin)))))))))))))))))))))))))))))))))))))))));
	assign c[21] = g[21] | (p[21] & (g[20] | (p[20] & (g[19] | (p[19] & (g[18] | (p[18] & (g[17] | (p[17] & (g[16] | (p[16] & (g[15] | (p[15] & (g[14] | (p[14] & (g[13] | (p[13] & (g[12] | (p[12] & (g[11] | (p[11] & (g[10] | (p[10] & (g[9] | (p[9] & (g[8] | (p[8] & (g[7] | (p[7] & (g[6] | (p[6] & (g[5] | (p[5] & (g[4] | (p[4] & (g[3] | (p[3] & (g[2] | (p[2] & (g[1] | (p[1] & (g[0] | (p[0] & cin)))))))))))))))))))))))))))))))))))))))))));
	assign c[22] = g[22] | (p[22] & (g[21] | (p[21] & (g[20] | (p[20] & (g[19] | (p[19] & (g[18] | (p[18] & (g[17] | (p[17] & (g[16] | (p[16] & (g[15] | (p[15] & (g[14] | (p[14] & (g[13] | (p[13] & (g[12] | (p[12] & (g[11] | (p[11] & (g[10] | (p[10] & (g[9] | (p[9] & (g[8] | (p[8] & (g[7] | (p[7] & (g[6] | (p[6] & (g[5] | (p[5] & (g[4] | (p[4] & (g[3] | (p[3] & (g[2] | (p[2] & (g[1] | (p[1] & (g[0] | (p[0] & cin)))))))))))))))))))))))))))))))))))))))))))));
	assign c[23] = g[23] | (p[23] & (g[22] | (p[22] & (g[21] | (p[21] & (g[20] | (p[20] & (g[19] | (p[19] & (g[18] | (p[18] & (g[17] | (p[17] & (g[16] | (p[16] & (g[15] | (p[15] & (g[14] | (p[14] & (g[13] | (p[13] & (g[12] | (p[12] & (g[11] | (p[11] & (g[10] | (p[10] & (g[9] | (p[9] & (g[8] | (p[8] & (g[7] | (p[7] & (g[6] | (p[6] & (g[5] | (p[5] & (g[4] | (p[4] & (g[3] | (p[3] & (g[2] | (p[2] & (g[1] | (p[1] & (g[0] | (p[0] & cin)))))))))))))))))))))))))))))))))))))))))))))));
	assign c[24] = g[24] | (p[24] & (g[23] | (p[23] & (g[22] | (p[22] & (g[21] | (p[21] & (g[20] | (p[20] & (g[19] | (p[19] & (g[18] | (p[18] & (g[17] | (p[17] & (g[16] | (p[16] & (g[15] | (p[15] & (g[14] | (p[14] & (g[13] | (p[13] & (g[12] | (p[12] & (g[11] | (p[11] & (g[10] | (p[10] & (g[9] | (p[9] & (g[8] | (p[8] & (g[7] | (p[7] & (g[6] | (p[6] & (g[5] | (p[5] & (g[4] | (p[4] & (g[3] | (p[3] & (g[2] | (p[2] & (g[1] | (p[1] & (g[0] | (p[0] & cin)))))))))))))))))))))))))))))))))))))))))))))))));
	assign c[25] = g[25] | (p[25] & (g[24] | (p[24] & (g[23] | (p[23] & (g[22] | (p[22] & (g[21] | (p[21] & (g[20] | (p[20] & (g[19] | (p[19] & (g[18] | (p[18] & (g[17] | (p[17] & (g[16] | (p[16] & (g[15] | (p[15] & (g[14] | (p[14] & (g[13] | (p[13] & (g[12] | (p[12] & (g[11] | (p[11] & (g[10] | (p[10] & (g[9] | (p[9] & (g[8] | (p[8] & (g[7] | (p[7] & (g[6] | (p[6] & (g[5] | (p[5] & (g[4] | (p[4] & (g[3] | (p[3] & (g[2] | (p[2] & (g[1] | (p[1] & (g[0] | (p[0] & cin)))))))))))))))))))))))))))))))))))))))))))))))))));
	assign c[26] = g[26] | (p[26] & (g[25] | (p[25] & (g[24] | (p[24] & (g[23] | (p[23] & (g[22] | (p[22] & (g[21] | (p[21] & (g[20] | (p[20] & (g[19] | (p[19] & (g[18] | (p[18] & (g[17] | (p[17] & (g[16] | (p[16] & (g[15] | (p[15] & (g[14] | (p[14] & (g[13] | (p[13] & (g[12] | (p[12] & (g[11] | (p[11] & (g[10] | (p[10] & (g[9] | (p[9] & (g[8] | (p[8] & (g[7] | (p[7] & (g[6] | (p[6] & (g[5] | (p[5] & (g[4] | (p[4] & (g[3] | (p[3] & (g[2] | (p[2] & (g[1] | (p[1] & (g[0] | (p[0] & cin)))))))))))))))))))))))))))))))))))))))))))))))))))));
	assign c[27] = g[27] | (p[27] & (g[26] | (p[26] & (g[25] | (p[25] & (g[24] | (p[24] & (g[23] | (p[23] & (g[22] | (p[22] & (g[21] | (p[21] & (g[20] | (p[20] & (g[19] | (p[19] & (g[18] | (p[18] & (g[17] | (p[17] & (g[16] | (p[16] & (g[15] | (p[15] & (g[14] | (p[14] & (g[13] | (p[13] & (g[12] | (p[12] & (g[11] | (p[11] & (g[10] | (p[10] & (g[9] | (p[9] & (g[8] | (p[8] & (g[7] | (p[7] & (g[6] | (p[6] & (g[5] | (p[5] & (g[4] | (p[4] & (g[3] | (p[3] & (g[2] | (p[2] & (g[1] | (p[1] & (g[0] | (p[0] & cin)))))))))))))))))))))))))))))))))))))))))))))))))))))));
	assign c[28] = g[28] | (p[28] & (g[27] | (p[27] & (g[26] | (p[26] & (g[25] | (p[25] & (g[24] | (p[24] & (g[23] | (p[23] & (g[22] | (p[22] & (g[21] | (p[21] & (g[20] | (p[20] & (g[19] | (p[19] & (g[18] | (p[18] & (g[17] | (p[17] & (g[16] | (p[16] & (g[15] | (p[15] & (g[14] | (p[14] & (g[13] | (p[13] & (g[12] | (p[12] & (g[11] | (p[11] & (g[10] | (p[10] & (g[9] | (p[9] & (g[8] | (p[8] & (g[7] | (p[7] & (g[6] | (p[6] & (g[5] | (p[5] & (g[4] | (p[4] & (g[3] | (p[3] & (g[2] | (p[2] & (g[1] | (p[1] & (g[0] | (p[0] & cin)))))))))))))))))))))))))))))))))))))))))))))))))))))))));
	assign c[29] = g[29] | (p[29] & (g[28] | (p[28] & (g[27] | (p[27] & (g[26] | (p[26] & (g[25] | (p[25] & (g[24] | (p[24] & (g[23] | (p[23] & (g[22] | (p[22] & (g[21] | (p[21] & (g[20] | (p[20] & (g[19] | (p[19] & (g[18] | (p[18] & (g[17] | (p[17] & (g[16] | (p[16] & (g[15] | (p[15] & (g[14] | (p[14] & (g[13] | (p[13] & (g[12] | (p[12] & (g[11] | (p[11] & (g[10] | (p[10] & (g[9] | (p[9] & (g[8] | (p[8] & (g[7] | (p[7] & (g[6] | (p[6] & (g[5] | (p[5] & (g[4] | (p[4] & (g[3] | (p[3] & (g[2] | (p[2] & (g[1] | (p[1] & (g[0] | (p[0] & cin)))))))))))))))))))))))))))))))))))))))))))))))))))))))))));
	assign c[30] = g[30] | (p[30] & (g[29] | (p[29] & (g[28] | (p[28] & (g[27] | (p[27] & (g[26] | (p[26] & (g[25] | (p[25] & (g[24] | (p[24] & (g[23] | (p[23] & (g[22] | (p[22] & (g[21] | (p[21] & (g[20] | (p[20] & (g[19] | (p[19] & (g[18] | (p[18] & (g[17] | (p[17] & (g[16] | (p[16] & (g[15] | (p[15] & (g[14] | (p[14] & (g[13] | (p[13] & (g[12] | (p[12] & (g[11] | (p[11] & (g[10] | (p[10] & (g[9] | (p[9] & (g[8] | (p[8] & (g[7] | (p[7] & (g[6] | (p[6] & (g[5] | (p[5] & (g[4] | (p[4] & (g[3] | (p[3] & (g[2] | (p[2] & (g[1] | (p[1] & (g[0] | (p[0] & cin)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))));
	assign c[31] = g[31] | (p[31] & (g[30] | (p[30] & (g[29] | (p[29] & (g[28] | (p[28] & (g[27] | (p[27] & (g[26] | (p[26] & (g[25] | (p[25] & (g[24] | (p[24] & (g[23] | (p[23] & (g[22] | (p[22] & (g[21] | (p[21] & (g[20] | (p[20] & (g[19] | (p[19] & (g[18] | (p[18] & (g[17] | (p[17] & (g[16] | (p[16] & (g[15] | (p[15] & (g[14] | (p[14] & (g[13] | (p[13] & (g[12] | (p[12] & (g[11] | (p[11] & (g[10] | (p[10] & (g[9] | (p[9] & (g[8] | (p[8] & (g[7] | (p[7] & (g[6] | (p[6] & (g[5] | (p[5] & (g[4] | (p[4] & (g[3] | (p[3] & (g[2] | (p[2] & (g[1] | (p[1] & (g[0] | (p[0] & cin)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))));

	assign s[0] = p[0] ^ cin;
	assign s[1] = p[1] ^ c[0];
	assign s[2] = p[2] ^ c[1];
	assign s[3] = p[3] ^ c[2];
	assign s[4] = p[4] ^ c[3];
	assign s[5] = p[5] ^ c[4];
	assign s[6] = p[6] ^ c[5];
	assign s[7] = p[7] ^ c[6];
	assign s[8] = p[8] ^ c[7];
	assign s[9] = p[9] ^ c[8];
	assign s[10] = p[10] ^ c[9];
	assign s[11] = p[11] ^ c[10];
	assign s[12] = p[12] ^ c[11];
	assign s[13] = p[13] ^ c[12];
	assign s[14] = p[14] ^ c[13];
	assign s[15] = p[15] ^ c[14];
	assign s[16] = p[16] ^ c[15];
	assign s[17] = p[17] ^ c[16];
	assign s[18] = p[18] ^ c[17];
	assign s[19] = p[19] ^ c[18];
	assign s[20] = p[20] ^ c[19];
	assign s[21] = p[21] ^ c[20];
	assign s[22] = p[22] ^ c[21];
	assign s[23] = p[23] ^ c[22];
	assign s[24] = p[24] ^ c[23];
	assign s[25] = p[25] ^ c[24];
	assign s[26] = p[26] ^ c[25];
	assign s[27] = p[27] ^ c[26];
	assign s[28] = p[28] ^ c[27];
	assign s[29] = p[29] ^ c[28];
	assign s[30] = p[30] ^ c[29];
	assign s[31] = p[31] ^ c[30];
	
	assign cout[0] = c[31];
endmodule

module SHIFT(input [31:0] B, input[3:0] Op, input [31:0] A, input usigned,output [31:0] res);
	wire [31:0] left_shift;
	wire [31:0] right_shift;
	wire [31:0] aright_shift;

	assign left_shift = B << A;
	assign right_shift = B >> A;
	assign aright_shift = $signed(B)>>> A;

	assign res = (Op[3] == 1) ? left_shift:(usigned == 1 ? aright_shift : right_shift);
endmodule

module AOXN(input[31:0] A, input[31:0] B, input[3:0] Op, output [31:0] res);
	wire [31:0] and_res;
	wire [31:0] or_res;
	wire [31:0] xor_res;
	wire [31:0] nor_res;
	
    
	assign and_res = A & B;
	assign or_res = A | B;
	assign xor_res = A ^ B;
	assign nor_res = ~or_res;

	assign res = Op[2] == 0 ? (Op[0]==0 ? and_res : or_res) : (Op[0] == 0 ? xor_res : nor_res);
endmodule

module LEG(input[31:0] A, input[31:0] B, input[3:0] Op ,input usigned,output [31:0] res);
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
	
	assign res = (~Op[3]&&~Op[2]&&~Op[1])?eq_res:(Op[2]==0 && Op[1]==0 && Op[0]==1) ? (usigned==1 ? unsigned_less_v_res: less_v_res):(Op[2]==1 ? (Op[0]==1 ? greater_equal_res : less_res):(Op[0]==1 ? greater_res : less_equal_res)); 	
endmodule

 module ALU(ReadData1, ReadData2,ALUOp,usigned,result,zero,over);
    input [31:0] ReadData1;
    input [31:0] ReadData2;
    input [3:0] ALUOp;
    input usigned;
    output [31:0] result;
    output zero;
    output over;
    
    wire [31:0] shift_res,aoxn_res,sum_res,leg_res;
    wire [31:0]b_input;
	wire cout;
	assign b_input = ALUOp[0] ? ~ReadData2 : ReadData2;
    
    SHIFT my_shift(ReadData2, ALUOp, ReadData1, usigned,shift_res);
	AOXN my_aoxn(ReadData1, ReadData2, ALUOp, aoxn_res);
	ADDER my_adder(ReadData1, b_input, ALUOp[0], sum_res, cout);
    LEG my_leg(ReadData1, ReadData2, ALUOp,usigned,leg_res);
    
	assign over = (~ALUOp[3] && ~ALUOp[2] && ~ALUOp[1]) ? ((usigned) & ((ReadData1[31] == b_input[31]) && (ReadData1[31] != sum_res[31]))) : 0;
    
    assign result = (ALUOp[3])?((~ALUOp[2]&&~ALUOp[1]&&ALUOp[0])?leg_res:shift_res):((~ALUOp[2]&&~ALUOp[1])? sum_res : (ALUOp[2]&&ALUOp[1])? (ReadData2<<16) :aoxn_res);
    
    assign zero = (result == 0) ? 1 : 0;
    /*
    always@(ReadData1 or ReadData2 or ALUOp) 
    begin
        case(ALUOp)
            //4'b0000: result = ReadData1 + ReadData2;//sum_res;
            //4'b0001: result = ReadData1 - ReadData2;//sum_res;
            //4'b0010: result = ReadData2 & ReadData1;//aoxn_res;
            //4'b0011: result = ReadData2 | ReadData1;//aoxn_res;
            4'b0000: result <= sum_res;
            4'b0001: result <= sum_res;
            4'b0010: result <= aoxn_res;
            4'b0011: result <= aoxn_res;
            4'b0100: result = aoxn_res;
            4'b0101: result = aoxn_res;
            4'b0110: result = ReadData2<<16;
            
            4'b1000: result = shift_res;
            4'b1110: result = shift_res;
            4'b1111: result = shift_res;
            4'b1001: result = leg_res;
            4'b1010: result = leg_res;
            4'b1011: result = leg_res;
            4'b1100: result = leg_res;
            4'b1101: result = leg_res;            
        endcase
        
        $display("result:%h",result);
        zero = (result == 0) ? 1 : 0;
    end 
    */
endmodule

