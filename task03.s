.text
.globl main

main:

while:
    addi x11, x0, 0 # swap = false
    addi x12, 0, 1 # i = 1

for:
    bge x12, x3, endwhile
    slli x5, x12, 2
    add x5, x5, x25
    addi x6, x5, -4
    lw x20, 0(x5)
    lw x21, 0(x6)
    bge x20, x21, endfor
    sw x20, 0(x6)
    sw x21, 0(x5)
    addi x11, x0, 1 # swap = true

endfor:
    addi x12, x12,1
    beq x0, x0, for

endwhile:
    bne x11, x0, while