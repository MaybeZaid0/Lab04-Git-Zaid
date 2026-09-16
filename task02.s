.text
.globl main

ntri:
    addi x2, x2, -16
    sw   x1, 12(x2)
    sw   x10, 8(x2)
    li   x5, 1
    ble  x10, x5, base_case
    addi x10, x10, -1
    jal  x1, ntri
    lw   x6, 8(x2)
    add  x10, x10, x6
    j    end
base_case:
    li   x10, 1
    lw   x1, 12(x2)
    addi x2, x2, 16
    jalr x0, 0(x1)