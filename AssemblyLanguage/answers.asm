# No.1
lw $t0 0($s0)

# No.2
lb $t1 1($s0)

# No.3
lbu $t0 2($s0)

# No.4
lh $t0 0($s0)

# No.5
lhu $t0 2($s0)

# No.6
sw $t1 8($s0)

# No.7
sh $t1 12($s0)

# No.8
sb $t1 12($s0)

# No.9
add $t0 $a0 $a1
add $t1 $a3 $a2
add $v0 $t1 $t0

# No.10
addi $t0 $a1 5
add $v0 $t0 $a0

# No.11
subi $t1 $a1 5
add $v0 $a0 $t1

# No.12
mult $a0 $a1
mfhi $v0
mflo $v1

# No.13
multu $a0 $a1
mfhi $v0
mflo $v1

# No.14
div $a0 $a1
mflo $v0
mfhi $v1

# No.15
add $t0 $s7 16
lw $t1 0($t0)
add $t2 $t1 $s1
add $s0 $t2 $s2

# No.16
addi $t0 $s6 8 
lw $t1 0($t0)
addi $t2 $s7 4
lw $t3 0($t2)
add $t2 $t1 $t3
add $s0 $t2 $s1

# No.17
sll $t0 $s1 2
add $t1 $t0 $s7
lw $t0 0($t1)
add $t0 $s3 $t0
sll $t0 $t0 2
add $t0 $t0 $s6
lw $s0 0($t0)

# No.18
sll $t0 $s4 2
add $t0 $s7 $t0
lw $t0 0($t0)
sll $t0 $t0 2
add $t0 $s6 $t0
lw $t0 0($t0)
sub $s0 $s1 $t0

# No.19
addi $t2 $t0 0
srl $t2 $t2 3
sll $t2 $t2 27
srl $t1 $t2 12

# No.20
addi $t2 $t0 0
srl $t2 $t2 3
sll $t2 $t2 27
srl $t1 $t2 27

# No.21
addi $t2 $t0 0
srl $t2 $t2 6
sll $t2 $t2 17
srl $t1 $t2 17

# No.22
# 题目错了
addi $t2 $t0 0
sll $t2 $t2 11
srl $t2 $t2 17
sll $t1 $t2 15

# No.23
addi $t0 $0 0
loop:
bge $t0 10 exit
add $s0 $s0 $s1
addi $t0 $t0 1
j loop
exit:

# No.24
addi $s3 $0 10
loop:
bge $s0 $s3 exit
sll $t1 $s0 2
add $t2 $t1 $s2
add $t3 $s0 $s1
sw $t3 0($t2)
addi $s0 $s0 1
j loop
exit:

# No.25
addi $a0 $0 0
loop:
bge $a0 $a1 exit
sll $t0 $a0 2
add $t1 $t0 $s0
add $t2 $t0 $s1
lw $t3 0($t2)
sw $t3 0($t1)
addi $a0 $a0 1
j loop
exit:

# No.26
# 把j的初值设为5就行了，奇怪
addi $a0 $0 0
addi $a1 $0 5
loop:
bge $a0 $a1 exit
sll $t0 $a0 2
add $t1 $t0 $s0
add $t2 $t0 $s1
lw $t3 0($t1)
lw $t4 0($t2)
beq $t3 $t4 branch
addi $a0 $a0 1
j loop
branch:
sw $0 0($t1)
addi $a0 $a0 1
j loop
exit:


# No.27
.data
p: .space 32
.text
main: la $a0,p
add $a1,$0,$0
ag: slti $s0,$a1,8
beq $s0,$0,exit
jal sub_proc
addi $a1,$a1,1
j ag
exit: addi $v0,$0,10
syscall
sub_proc:
sll $t0 $a1 2
add $t0 $a0 $t0
lw $t1 0($t0)
addi $t2 $0 1
sllv $t2 $t2 $a1
sw $t2 0($t0)
jr $ra

# No.28
.data
a:.word 8,7,6,5,4,3,2,1
.space 0x20
b:.word 1,2,3,4,5,6,7,8
.text
la $s0,a
la $s1,b
li $a0,0
loop:
sll $t0 $a0 2
add $t1 $t0 $s0
lw $t2 0($t1)
beqz $t2 exit
add $t3 $t0 $s1
lw $t4 0($t3)
bge $t2 $t4 branch
addi $t5 $0 2
sw $t5 0($t1)
addi $a0 $a0 1
j loop
branch:
addi $t5 $0 1
sw $t5 0($t1)
addi $a0 $a0 1
j loop
exit:

# No.29
addi $t0 $0 0
addi $t1 $0 10
addi $t6 $0 0
loop:
bge $t0 $t1 exit
sll $t2 $t0 2
add $t4 $s0 $t2
lw $t3 0($t4)
add $t6 $t3 $t6
addi $t0 $t0 1
j loop
exit:
sll $t2 $t0 2
add $t4 $s0 $t2
sw $t6 0($t4)

# No.30
addi $t0 $0 0
addi $t1 $0 10
loop:
bge $t0 $t1 exit
sll $t2 $t0 2
add $t4 $s0 $t2
add $t5 $s1 $t2
lw $t3 0($t4)
sw $t3 0($t5)
addi $t0 $t0 1
j loop
exit:

# No.31
.text
lui $a0,0xffff
ori $a0,$a0,0x8000
jal ABS
add $s0,$v0,$0
add $a0,$0,$0
ori $a0,$a0,0x8000
jal ABS
add $s1,$v0,$0
add $v0,$0,10
syscall
ABS:
bgez $a0 branch1
sub $v0 $0 $a0
jr $ra
branch1:
add $v0 $a0 $0
jr $ra