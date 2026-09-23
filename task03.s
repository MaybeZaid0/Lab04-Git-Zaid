.text
.globl main

main:
    li x10, 0x100        # x10 = base address of array A
    li x11, 2             # x11 = length of array A (n = 2)
    li x30, 4
    li x31, 5
    sw x30, 0(x10)        # A[0] = 4
    sw x31, 4(x10)        # A[1] = 5

while:
    addi x7, x0, 0        # swap = false
    addi x12, x0, 1       # i = 1

for:
    bge  x12, x11, endwhile
    slli x5, x12, 2
    add  x5, x5, x10
    addi x6, x5, -4
    lw   x20, 0(x5)
    lw   x21, 0(x6)
    bge  x20, x21, endfor
    sw   x20, 0(x6)
    sw   x21, 0(x5)
    addi x7, x0, 1        # swap = true

endfor:
    addi x12, x12, 1
    beq  x0, x0, for

endwhile:
    bne  x7, x0, while  