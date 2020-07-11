# Test asm for MIPS-LITE2
	.text
initial:
	beq $a0,$zero,main
	nop
	ori $s1,0xff
	ori $s2,0xff
	ori $s3,0xff
	lui $s2,0x17
	ori $s2,0x73
	lui $s3,0x62
	ori $s3,0x69
	lui $s1,0x56
	
	addu $t1,$s1,$s2
	addu $t2,$t1,$s3

	subu $t3,$s2,$s3
	addu $t4,$s1,$s3
	addu $t5,$t3,$t1
	
	addu $t6,$t1,$s1
	subu $t6,$t6,$t3
	addu $t7,$t6,$t2
	
	ori $s4,$t2,0xa4
	ori $s4,$s4,0x0f
	
	ori $s5,$t4,0xb9
	ori $s5,$s5,0xff
	ori $s5,$s5,0x01
	
	addu $s6,$s4,$s5
	ori $s7,$s6,0x9b
	
	ori $s0,$t6,0x36
	addu $s0,$s0,$s3
	subu $t8,$s0,$s5
	
	sw $s0,-12($a0)
	sw $s1,-8($a0)
	sw $s2,-4($a0)
	sw $s3,0($a0)
	sw $s4,4($a0)
	sw $s5,8($a0)
	sw $s6,12($a0)
	sw $s7,16($a0)
	sw $t1,20($a0)
	sw $t2,24($a0)
	sw $t3,28($a0)
	sw $t4,32($a0)
	sw $t5,36($a0)
	sw $t6,40($a0)
	sw $t7,44($a0)
	sw $t8,48($a0)
	jr $ra
	nop

main:
	ori $a0,$zero,12
	jal initial
	nop
	
	ori $t0,$zero,16
	ori $t9,$zero,40
	addu $a0,$zero,$t9
loop1:
	ori $t9,$zero,1
	subu $t0,$t0,$t9
	jal func1
	nop
	beq $t0,$zero,loop1end
	nop
	ori $t9,$zero,24
	addu $a0,$a0,$t9
	j loop1
	nop

loop1end:
	ori $t0,$zero,16
	addiu $a0,$zero,0x1a8
	ori $t9,$zero,24
	subu $a0,$a0,$t9
loop2:
	addiu $a0,$a0,24
	ori $t9,$zero,1
	subu $t0,$t0,$t9
	jal func2
	nop
	bne $t0,$zero,loop2
	nop





	addiu $a0,$zero,0x2D8
	addi $v1,$zero,0x32e0
	jalr $v0,$v1
	nop
	
	
	
	
	
	
	
	
	
	
	
	j end
	nop

func1:
	lw $s0,0($a0)
	addu $t1,$s0,$s0
	lw $s1,4($a0)
	lw $s2,8($a0)
	sub $t2,$t1,$s1
	ori $t3,$s2,0x8c
	lw $s3,12($a0)
	ori $t4,$s3,0x9d
	ori $t5,$s3,0xf
	ori $t6,$s3,0x3
	subu $t5,$t5,$t6
	lw $s4,0($t5)
	addu $s4,$t2,$s4
	ori $t5,$s4,0xf
	ori $t6,$s4,0x3
	subu $t5,$t5,$t6
	lw $s6,16($a0)
	lw $s5,0($t5)
	
	addu $t1,$t1,$s5
	sw $t1,24($a0)
	subu $t2,$t2,$t1
	ori $t3,0x25
	sw $t2,28($a0)
	sw $t3,32($a0)
	ori $t1,0x01
	sw $t1,36($a0)
	subu $t4,$s6,$t4
	sw $t4,40($a0)
	lw $t4,20($a0)
	sw $t4,44($a0)
	
	ori $t1,$zero,10
	ori $t2,$zero,10
	beq $t1,$t2,else11
	nop
	j end
	nop
else11:
	addu $t3,$t2,$t1
	subu $t2,$t3,$zero
	beq $t2,$t3,else12
	nop
	j end
	nop
else12:
	lw $t4,0($a0)
	lw $t5,0($a0)
	beq $t4,$t5,else13
	nop
	j end
	nop
else13:
	lui $t6,0x00
	beq $zero,$t6,else14
	nop
	j end
	nop
else14:
	jr $ra
	nop

func2:
	lb $s0,0($a0)
	addu $t1,$s0,$s0
	lbu $s1,4($a0)
	lhu $s2,8($a0)
	sub $t2,$t1,$s1
	ori $t3,$s2,0x8c
	lw $s3,12($a0)
	ori $t4,$s3,0x9d
	ori $t5,$s3,0xf
	ori $t6,$s3,0x3
	subu $t5,$t5,$t6
	lw $s4,0($t5)
	addu $s4,$t2,$s4
	ori $t5,$s4,0xf
	ori $t6,$s4,0x3
	subu $t5,$t5,$t6
	lw $s6,16($a0)
	lw $s5,0($t5)
	
	addu $t1,$t1,$s5
	sw $t1,24($a0)
	and $t2,$t2,$t1
	ori $t3,0x25
	sh $t2,28($a0)
	sb $t3,32($a0)
	ori $t1,0x01
	sw $t1,36($a0)
	subu $t4,$s6,$t4
	sw $t4,40($a0)
	lw $t4,20($a0)
	sw $t4,44($a0)
	
	addi $t1,$zero,5
	blez $t1,end
	nop
	bgtz $t1,else21
	nop
	j end
	nop
else21:
	bne $t1,$t1,end
	nop
	addi $t1,$t1,-10
	blez $zero,else22
	nop
	j end
	nop
else22:
	bgez $t1,end
	nop
	bgtz $zero,end
	nop
	jr $ra
	nop

func3:
	LHU $16,10($a0)
	LBU $7,39($a0)
	LHU $14,70($a0)
	LB $12,63($a0)
	LBU $11,33($a0)
	LH $12,8($a0)
	LB $22,49($a0)
	LBU $12,32($a0)
	LB $19,27($a0)
	LHU $6,8($a0)
	LB $12,76($a0)
	LBU $17,29($a0)
	LH $19,50($a0)
	LBU $25,43($a0)
	LBU $13,61($a0)
	LH $15,60($a0)
	LB $23,2($a0)
	LBU $5,41($a0)
	LB $15,29($a0)
	LBU $20,56($a0)
	LHU $16,32($a0)
	LH $16,76($a0)
	LBU $10,30($a0)
	LH $19,78($a0)
	LH $10,12($a0)
	LBU $14,19($a0)
	LHU $15,8($a0)
	LB $14,35($a0)
	LB $8,48($a0)
	LBU $18,76($a0)
	LH $22,60($a0)
	LBU $16,57($a0)
	LB $19,16($a0)
	LHU $12,38($a0)
	LH $23,18($a0)
	LH $16,34($a0)
	LBU $10,65($a0)
	LB $5,25($a0)
	LH $10,20($a0)
	LH $11,20($a0)
	LH $17,64($a0)
	LBU $14,54($a0)
	LBU $9,50($a0)
	LBU $24,62($a0)
	LH $21,66($a0)
	LH $17,12($a0)
	LB $9,59($a0)
	LHU $14,8($a0)
	LB $18,25($a0)
	LH $21,58($a0)
	LBU $9,2($a0)
	LBU $23,67($a0)
	LHU $23,38($a0)
	LH $22,60($a0)
	LHU $11,2($a0)
	LBU $23,9($a0)
	LBU $6,71($a0)
	LBU $14,18($a0)
	LH $7,66($a0)
	LBU $23,67($a0)
	LB $8,73($a0)
	LHU $14,74($a0)
	LB $7,38($a0)
	LH $5,36($a0)
	LB $9,14($a0)
	LBU $25,9($a0)
	LB $19,69($a0)
	LH $8,66($a0)
	LH $13,20($a0)
	LB $19,71($a0)
	LH $23,32($a0)
	LBU $25,4($a0)
	LB $24,21($a0)
	LBU $8,21($a0)
	LHU $16,18($a0)
	LHU $6,26($a0)
	LHU $7,42($a0)
	LB $17,39($a0)
	LHU $16,70($a0)
	LH $13,2($a0)
	LH $18,52($a0)
	LB $11,62($a0)
	LBU $11,23($a0)
	LH $21,72($a0)
	LB $5,62($a0)
	LBU $23,69($a0)
	LH $9,42($a0)
	LBU $8,29($a0)
	LB $6,28($a0)
	LHU $23,14($a0)
	LBU $10,33($a0)
	LB $9,27($a0)
	LHU $7,24($a0)
	LHU $13,14($a0)
	LBU $19,73($a0)
	LBU $7,71($a0)
	LH $8,46($a0)
	LB $18,9($a0)
	LB $16,20($a0)
	LB $15,41($a0)
	LH $23,70($a0)
	AND $14,$24,$10
	LBU $10,0($a0)
	SRA $24,$12,6
	LH $10,62($a0)
	LH $24,6($a0)
	SRLV $20,$16,$10
	SLLV $23,$12,$6
	SLTI $21,$12,29664
	ADDI $23,$24,21444
	AND $5,$15,$14
	SRA $10,$14,15
	LBU $8,62($a0)
	LH $5,28($a0)
	SUB $5,$6,$19
	AND $5,$5,$9
	LH $21,24($a0)
	LH $16,24($a0)
	XOR $6,$13,$21
	LBU $24,6($a0)
	SH $12,114($a0)
	XORI $21,$17,57312
	SRA $20,$16,30
	SLT $10,$17,$24
	SH $22,96($a0)
	SLTU $9,$14,$17
	SRAV $13,$24,$17
	LHU $17,34($a0)
	SLL $20,$9,20
	SLLV $23,$19,$24
	LH $23,48($a0)
	OR $21,$5,$10
	AND $16,$5,$5
	SLLV $17,$7,$22
	SLTI $8,$10,-3180
	SLTU $25,$18,$14
	SLTU $11,$17,$6
	SH $15,88($a0)
	SLTI $18,$15,21116
	SLT $10,$15,$19
	SH $19,110($a0)
	LH $17,2($a0)
	SLLV $7,$23,$20
	LHU $23,34($a0)
	OR $13,$11,$16
	SLL $17,$14,14
	ADD $6,$25,$14
	LH $21,20($a0)
	ADD $20,$23,$18
	XORI $8,$17,1689
	ADD $16,$14,$24
	LH $16,48($a0)
	LHU $17,16($a0)
	SRAV $11,$8,$16
	XORI $19,$9,57741
	SRL $6,$7,24
	SRL $19,$9,7
	SRA $12,$10,7
	LB $15,5($a0)
	SRL $14,$14,30
	ANDI $5,$10,61894
	LB $7,54($a0)
	ADDI $22,$23,-16660
	SRAV $16,$5,$12
	SLTU $25,$15,$11
	ADD $11,$10,$16
	SH $18,128($a0)
	SLT $10,$21,$13
	OR $23,$9,$9
	SRLV $10,$11,$12
	SLL $20,$9,7
	SH $23,98($a0)
	NOR $12,$14,$20
	LB $7,73($a0)
	LHU $21,0($a0)
	SLTI $23,$10,20920
	SB $19,118($a0)
	ADDIU $10,$20,-7347
	LB $14,18($a0)
	SUB $5,$23,$5
	AND $22,$15,$21
	SRLV $8,$7,$17
	XORI $11,$24,16952
	LB $18,12($a0)
	SLL $25,$18,16
	SLT $23,$20,$18
	LH $17,66($a0)
	SRL $15,$14,20
	NOR $15,$23,$15
	LBU $9,54($a0)
	SLTI $14,$20,18878
	SLTI $17,$17,20251
	ADDIU $17,$8,23624
	ADD $16,$6,$10
	SLTI $12,$11,-24530
	SLTU $16,$11,$7
	SB $23,145($a0)
	LB $12,51($a0)
	SLTI $12,$19,20416
	LH $14,2($a0)
	SB $19,157($a0)
	SH $9,128($a0)
	SH $5,152($a0)
	SH $19,86($a0)
	SB $9,111($a0)
	SH $6,116($a0)
	SH $11,84($a0)
	SH $9,94($a0)
	SB $8,106($a0)
	SH $14,134($a0)
	SH $9,106($a0)
	SB $19,83($a0)
	SB $12,127($a0)
	SB $16,114($a0)
	SH $24,130($a0)
	SB $11,95($a0)
	SB $14,83($a0)
	SB $22,112($a0)
	SH $7,116($a0)
	SH $13,144($a0)
	SB $25,85($a0)
	SB $14,158($a0)
	SB $12,94($a0)
	SH $9,100($a0)
	SB $7,130($a0)
	SH $8,112($a0)
	SB $21,114($a0)
	SH $9,110($a0)
	SB $16,139($a0)
	SH $25,86($a0)
	SH $8,152($a0)
	SH $16,104($a0)
	SB $9,85($a0)
	SH $24,98($a0)
	SB $17,119($a0)
	SH $5,94($a0)
	SB $18,81($a0)
	SB $15,146($a0)
	SH $9,134($a0)
	SH $17,102($a0)
	SB $21,142($a0)
	SH $16,144($a0)
	SH $21,108($a0)
	SB $15,102($a0)
	SH $8,108($a0)
	SH $13,100($a0)
	SB $13,127($a0)
	SH $5,128($a0)
	SB $25,82($a0)
	SH $15,144($a0)
	SB $13,122($a0)
	SB $16,129($a0)
	SB $13,99($a0)
	SH $13,154($a0)
	SH $5,112($a0)
	SH $9,90($a0)
	SH $20,124($a0)
	SB $18,116($a0)
	SB $7,97($a0)
	SH $5,108($a0)
	SH $21,130($a0)
	SB $11,100($a0)
	SB $24,124($a0)
	SB $5,157($a0)
	SB $14,90($a0)
	SH $20,150($a0)
	SH $11,148($a0)
	SB $17,94($a0)
	SH $19,120($a0)
	SH $23,116($a0)
	SH $7,116($a0)
	SH $6,114($a0)
	SB $16,125($a0)
	SB $11,100($a0)
	SH $22,120($a0)
	SH $25,88($a0)
	SH $20,138($a0)
	SH $12,130($a0)
	SH $20,102($a0)
	SB $25,142($a0)
	SB $18,155($a0)
	SH $25,158($a0)
	SH $22,140($a0)
	SH $12,118($a0)
	SH $25,114($a0)
	SB $17,153($a0)
	SB $20,108($a0)
	SH $19,98($a0)
	SB $19,127($a0)
	SH $13,138($a0)
	SH $8,90($a0)
	SH $9,104($a0)
	SB $20,152($a0)
	SB $9,88($a0)
	SH $25,118($a0)
	SB $15,152($a0)
	SH $8,116($a0)
	SB $23,132($a0)
	SH $11,104($a0)
	SH $16,94($a0)
		
	
	jr $v0
	nop
end:
