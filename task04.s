.text
.globl main

main:
    li x10, 6 # trying fibonacci for 6
    jal x1, fib
    
end:
    j end

fib:
    addi x2, x2, -16 # save space on stack
    sw x1, 12(x2) # save ra
    sw x10, 8(x2) # save n

    li x5, 0
    beq x10, x5, case_0 # if n is 0, reach base case
    li x5, 1
    beq x10, x5, case_1 # if n is 1, reach base case

    addi x10, x10, -1 # n = n - 1
    jal x1, fib
    
    sw x10, 4(x2) # save result of fib(n-1)

    lw x10, 8(x2) # restore n
    addi x10, x10, -2 # n = n - 2
    jal x1, fib

    lw x6, 4(x2) # restore result of fib(n-1)
    add x10, x10, x6 # fib(n-1) + fib(n-2)

    lw x1, 12(x2) # restore ra
    addi x2, x2, 16 # pop stack
    jalr x0, 0(x1)

case_0:
    li x10, 0 # save result
    lw x1, 12(x2) # restore ra
    addi x2, x2, 16 # pop stack
    jalr x0, 0(x1)

case_1:
    li x10, 1 # save result
    lw x1, 12(x2) # restore ra
    addi x2, x2, 16 # pop stack
    jalr x0, 0(x1)