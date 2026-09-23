.text
.globl main

main:
    li x10, 5
    jal x1, fact 
    j end  

fact:     
    addi x2, x2, -8 # space space   
    sw x1, 4(sp) # save ra     
    sw x10, 0(sp) # save n      
    addi x5, x10, -1  #x5 = n-1     
    bge x5, x0, L1            
    addi x10, x0, 1    
    addi sp, sp, 8 # pop stack     
    jalr x0, 0(x1) 

L1:     
    addi, x10, x10, -1  # arg = n-1     
    jal x1, fact      
    addi x6, x10, 0 # save result of fact(n-1)     
    lw x10, 0(sp)   # restore n     
    lw x1, 4(sp)  # restore ra     
    addi sp, sp, 8 # pop stack      
    mul x10, x10, x6 # n * fact(n-1)     
    jalr x0, 0(x1)     
end: 