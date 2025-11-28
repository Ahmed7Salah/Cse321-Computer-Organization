.data
    numberPrompt: .asciiz "How many numbers: "
    inputPrompt: .asciiz "Enter number: "
    averageMsg: .asciiz "Average: "
    newLine: .asciiz "\n"


.text
main:
    li $v0, 4
    la $a0, numberPrompt
    syscall

    li $v0, 5
    syscall
    move $t0, $v0    # number of inputs

    li $v0, 4
    la $a0, newLine
    syscall

    li $t1, 0       # loop variable
    li $t2, 0       # sum varaible

while:
    beq $t1, $t0, endWhile


    li $v0, 4
    la $a0, inputPrompt
    syscall

    li $v0, 5
    syscall

    add $t2, $t2, $v0
    
    li $v0, 4
    la $a0, newLine
    syscall

    addi $t1, $t1, 1
    j while

endWhile:

    div $t2, $t0

    mflo $t3    # average result

    li $v0, 4
    la $a0, averageMsg
    syscall

    li $v0, 1
    move $a0, $t3
    syscall

    li $v0, 4
    la $a0, newLine
    syscall

    li $v0, 10
    syscall