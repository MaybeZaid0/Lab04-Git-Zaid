.text
.globl main

main:
    li x10, 5 # trying triangle number for 5
    jal x1, ntri
    j end

ntri:
    addi x2, x2, -8 # save space on stack
    sw x1, 4(x2) # store the vals
    sw x10, 0(x2)
    addi x5, x10, -1
    bge x5, x0, base_case # if x5 is greater than 0, reach base case
    addi x10, x0, 0
    addi x2, x2, 8 # restore space on stack
    jalr x0, 0(x1)

base_case:
    addi x10, x10, -1 # n = n - 1
    jal x1, ntri 
    addi x6, x10, 0 # save result
    lw x10, 0(x2)
    lw x1, 4(x2)
    addi x2, x2, 8 # pop stack
    add x10, x10, x6 # n + ntri(n-1)
    jalr x0, 0(x1)

end: