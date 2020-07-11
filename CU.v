`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/23 16:47:49
// Design Name: 
// Module Name: CU
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


 module CU(Inst,Func,ID_B_code,RegDst,Se,RegWrite,ALUXSrc,ALUYSrc,ALUControl,MemWrite,PCSrc,MemtoReg,load_option,save_option,usigned,c_adventure);
    input [5:0]Func;
    input [31:0]Inst;
    input c_adventure,ID_B_code;
    output RegDst,Se,RegWrite,ALUXSrc,ALUYSrc,MemWrite,MemtoReg,usigned;
    output [2:0]PCSrc,load_option;
    output [1:0]save_option;
    output [3:0]ALUControl;

    wire R_type=~Inst[31] & ~Inst[30] & ~Inst[29] & ~Inst[28] & ~Inst[27] & ~Inst[26];
    wire I_lb = Inst[31] & ~Inst[30] & ~Inst[29] & ~Inst[28] & ~Inst[27] & ~Inst[26];
    wire I_lbu = Inst[31] & ~Inst[30] & ~Inst[29] & Inst[28] & ~Inst[27] & ~Inst[26];
    wire I_lh = Inst[31] & ~Inst[30] & ~Inst[29] & ~Inst[28] & ~Inst[27] & Inst[26];
    wire I_lhu = Inst[31] & ~Inst[30] & ~Inst[29] & Inst[28] & ~Inst[27] & Inst[26];
    wire I_lw = Inst[31] & ~Inst[30] & ~Inst[29] & ~Inst[28] & Inst[27] & Inst[26];
    wire I_sb = Inst[31] & ~Inst[30] & Inst[29] & ~Inst[28] & ~Inst[27] & ~Inst[26];
    wire I_sh = Inst[31] & ~Inst[30] & Inst[29] & ~Inst[28] & ~Inst[27] & Inst[26];
    wire I_sw = Inst[31] & ~Inst[30] & Inst[29] & ~Inst[28] & Inst[27] & Inst[26];
    wire I_add = R_type & Func[5] & ~Func[4] & ~Func[3] & ~Func[2] & ~Func[1] & ~Func[0];
    wire I_addu = R_type & Func[5] & ~Func[4] & ~Func[3] & ~Func[2] & ~Func[1] & Func[0];
    wire I_sub = R_type & Func[5] & ~Func[4] & ~Func[3] & ~Func[2] & Func[1] & ~Func[0];
    wire I_subu = R_type & Func[5] & ~Func[4] & ~Func[3] & ~Func[2] & Func[1] & Func[0];
    wire I_sll = R_type & ~Func[5] & ~Func[4] & ~Func[3] & ~Func[2] & ~Func[1] & ~Func[0] & (Inst!=0);
    wire I_srl = R_type & ~Func[5] & ~Func[4] & ~Func[3] & ~Func[2] & Func[1] & ~Func[0];
    wire I_sra = R_type & ~Func[5] & ~Func[4] & ~Func[3] & ~Func[2] & Func[1] & Func[0];
    wire I_sllv = R_type & ~Func[5] & ~Func[4] & ~Func[3] & Func[2] & ~Func[1] & ~Func[0] & (Inst!=0);
    wire I_srlv = R_type & ~Func[5] & ~Func[4] & ~Func[3] & Func[2] & Func[1] & ~Func[0];
    wire I_srav = R_type & ~Func[5] & ~Func[4] & ~Func[3] & Func[2] & Func[1] & Func[0];
    wire I_and = R_type & Func[5] & ~Func[4] & ~Func[3] & Func[2] & ~Func[1] & ~Func[0];
    wire I_or = R_type & Func[5] & ~Func[4] & ~Func[3] & Func[2] & ~Func[1] & Func[0];
    wire I_xor = R_type & Func[5] & ~Func[4] & ~Func[3] & Func[2] & Func[1] & ~Func[0];
    wire I_nor = R_type & Func[5] & ~Func[4] & ~Func[3] & Func[2] & Func[1] & Func[0];
    wire I_addi = ~Inst[31] & ~Inst[30] & Inst[29] & ~Inst[28] & ~Inst[27] & ~Inst[26];
    wire I_addiu = ~Inst[31] & ~Inst[30] & Inst[29] & ~Inst[28] & ~Inst[27] & Inst[26];
    wire I_andi = ~Inst[31] & ~Inst[30] & Inst[29] & Inst[28] & ~Inst[27] & ~Inst[26];
    wire I_ori = ~Inst[31] & ~Inst[30] & Inst[29] & Inst[28] & ~Inst[27] & Inst[26];
    wire I_xori = ~Inst[31] & ~Inst[30] & Inst[29] & Inst[28] & Inst[27] & ~Inst[26];
    wire I_lui = ~Inst[31] & ~Inst[30] & Inst[29] & Inst[28] & Inst[27] & Inst[26];
    wire I_slt = R_type & Func[5] & ~Func[4] & Func[3] & ~Func[2] & Func[1] & ~Func[0];
    wire I_slti = ~Inst[31] & ~Inst[30] & Inst[29] & ~Inst[28] & Inst[27] & ~Inst[26];
    wire I_sltiu = ~Inst[31] & ~Inst[30] & Inst[29] & ~Inst[28] & Inst[27] & Inst[26];
    wire I_sltu = R_type & Func[5] & ~Func[4] & Func[3] & ~Func[2] & Func[1] & Func[0];
    wire I_beq = ~Inst[31] & ~Inst[30] & ~Inst[29] & Inst[28] & ~Inst[27] & ~Inst[26];
    wire I_bne = ~Inst[31] & ~Inst[30] & ~Inst[29] & Inst[28] & ~Inst[27] & Inst[26];
    wire I_blez = ~Inst[31] & ~Inst[30] & ~Inst[29] & Inst[28] & Inst[27] & ~Inst[26];
    wire I_bgtz = ~Inst[31] & ~Inst[30] & ~Inst[29] & Inst[28] & Inst[27] & Inst[26];
    wire I_bltz = ~Inst[31] & ~Inst[30] & ~Inst[29] & ~Inst[28] & ~Inst[27] & Inst[26] & ~ID_B_code;
    wire I_bgez = ~Inst[31] & ~Inst[30] & ~Inst[29] & ~Inst[28] & ~Inst[27] & Inst[26] & ID_B_code;
    wire I_j = ~Inst[31] & ~Inst[30] & ~Inst[29] & ~Inst[28] & Inst[27] & ~Inst[26];
    wire I_jal = ~Inst[31] & ~Inst[30] & ~Inst[29] & ~Inst[28] & Inst[27] & Inst[26];
    wire I_jalr = R_type & ~Func[5] & ~Func[4] & Func[3] & ~Func[2] & ~Func[1] & Func[0];
    wire I_jr = R_type & ~Func[5] & ~Func[4] & Func[3] & ~Func[2] & ~Func[1] & ~Func[0];
    
    assign RegDst = I_lb | I_lbu | I_lh | I_lhu | I_lw | I_addi | I_addiu | I_andi | I_ori | I_xori | I_lui | I_slti | I_sltiu;
    assign Se = I_lb | I_lbu | I_lh | I_lhu | I_lw | I_sb | I_sh | I_sw | I_addi | I_addiu | I_slti | I_sltiu | I_beq | I_bne | I_blez | I_bgtz | I_bltz | I_bgez;
    assign RegWrite = I_lb | I_lbu | I_lh | I_lhu | I_lw | I_add | I_addu | I_sub | I_subu | I_sll | I_srl | I_sra | I_sllv | I_srlv | I_srav | I_and | I_or | I_xor | I_nor | I_addi | I_addiu | I_andi | I_ori | I_xori | I_lui | I_slt | I_slti | I_sltiu | I_sltu;
    assign ALUXSrc = I_sll | I_srl | I_sra;
    assign ALUYSrc = I_add | I_addu | I_sub | I_subu | I_and | I_or | I_xor | I_nor | I_slt | I_sltu | I_beq | I_bne | I_j | I_jal | I_jalr | I_jr | I_sll | I_srl | I_sra | I_sllv | I_srlv | I_srav;
    assign ALUControl[0] =I_sub | I_subu | I_sll | I_sllv | I_or | I_nor | I_ori | I_slt | I_slti | I_sltiu | I_sltu | I_beq | I_bne | I_bgtz | I_bgez;
    assign ALUControl[1] =I_sll | I_sllv | I_and | I_or | I_andi | I_ori | I_lui | I_blez | I_bgtz | I_sra | I_srav;
    assign ALUControl[2] =I_sll | I_sllv | I_xor | I_nor | I_xori | I_lui | I_bltz | I_bgez | I_sra | I_srav;
    assign ALUControl[3] =I_srl | I_sra | I_srlv | I_srav | I_slt | I_slti | I_sltiu | I_sltu | I_blez | I_bgtz | I_bltz | I_bgez | I_sll | I_sllv;
    assign MemWrite = I_sb | I_sh | I_sw;
    assign PCSrc[0] = (I_blez & c_adventure) | (I_bgtz & c_adventure)| (I_bltz & c_adventure)| (I_bgez & c_adventure)| I_jal | I_jalr | (I_beq & c_adventure) | (I_bne & ~c_adventure);
    assign PCSrc[1] = I_j | I_jal;
    assign PCSrc[2] = I_jalr | I_jr;
    assign MemtoReg = I_lb | I_lbu | I_lh | I_lhu | I_lw;
    assign load_option[0] = I_lb | I_lbu | I_lh | I_lhu;
    assign load_option[1] = I_lh | I_lhu;
    assign load_option[2] = I_lh | I_lb;
    assign save_option[0] = I_sb;
    assign save_option[1] = I_sh;
    assign usigned = I_lbu | I_lhu | I_addu | I_subu | I_addiu | I_sltiu | I_sltu;
    

endmodule

