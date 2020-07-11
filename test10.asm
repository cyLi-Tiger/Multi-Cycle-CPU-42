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
	
	ori $t0,$zero,256
	ori $t9,$zero,40
	addu $a0,$zero,$t9
loop:
	ori $t9,$zero,1
	subu $t0,$t0,$t9
	jal func
	nop
	beq $t0,$zero,loopend
	ori $t9,$zero,24
	addu $a0,$a0,$t9
	j loop
	nop
	
func:
	lw $s0,0($a0)
	addu $t1,$s0,$s0
	lw $s1,4($a0)
	lw $s2,8($a0)
	subu $t2,$t1,$s1
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
	beq $t1,$t2,else1
	nop
	j end
	nop
else1:
	addu $t3,$t2,$t1
	subu $t2,$t3,$zero
	beq $t2,$t3,else2
	nop
	j end
	nop
else2:
	lw $t4,0($a0)
	lw $t5,0($a0)
	beq $t4,$t5,else3
	nop
	j end
	nop
else3:
	lui $t6,0x00
	beq $zero,$t6,else4
	nop
	j end
	nop
else4:
	jr $ra
	nop

loopend:
	ori $a0,$zero,0x1840
	lui $t1,0x1234
	sw $t1,0($a0)
	lui $t1,0x4567
	ori $t1,0xabcd
	sw $t1,4($a0)
end: