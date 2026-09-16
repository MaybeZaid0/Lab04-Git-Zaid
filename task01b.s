.text
.globl main

main:
    li x10, 5 # n = 5

fact:
    li x18, 1 # acc = 1
loop:
    mul x18, x18, x10
    addi x10, x10, -1
    bne x10, x0, loop

endloop:
    add x10, x0, x18
    jalr x0, 0(x1)
    ret

end:
    j end