.data
    Prompt: .asciiz "Choose icecream flavour: 1-Chocolate (the best), 2-Vanilla, 3-Mango \n"
    newLine: .asciiz "$\n"


.text
main:
    li $v0, 4
    la $a0, Prompt
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    li $v0, 1

switch:
                # Cases Values
    li $t1, 1   # Chocolate       
    li $t2, 2   # Vanilla
    li $t3, 3   # Mango

    beq $t0, $t1, caseChocolate
    beq $t0, $t2, caseVanilla
    beq $t0, $t3, caseMango

caseChocolate:
    li $a0, 14
    j endSwitch

    
caseVanilla:
    li $a0, 9
    j endSwitch

    
caseMango:
    li $a0, 11
    j endSwitch


endSwitch:
    syscall


    li $v0, 4
    la $a0, newLine
    syscall

    li $v0, 10
    syscall