#PURPOSE: Power function x^a + y^b

.section .data

.section .text

.global _start
_start:
    # 3^2
    pushl $3
    pushl $2
    call power
    #Resets stack pointer and saves return value
    addl $8, %esp
    pushl %eax
    # 2^5
    pushl $2
    pushl $5
    call power
    # Reset Stack
    addl $8, %esp
    popl %ebx
    #Add together values and return
    addl %eax, %ebx
    movl $1, %eax
    int $0x80

.type power, @function
power:
    # Saves base pointer and moves in the base pointer
    pushl %ebp
    movl %esp, %ebp
    #Make room for local variables
    subl $4, %esp
    
    movl 8(%ebp), %ebx # Base
    movl 12(%ebp), %ecx # Power
    # Stores current result as local variable
    movl %ebx, -4(%ebp)

power_loop_start:
    cmpl $1, %ecx
    je end_power
    movl -4(%ebp), %eax 
    imull %ebx, %eax
    movl %eax, -4(%ebp)
    decl %ecx
    jmp power_loop_start

end_power:
    # Resets the stack
    movl -4(%ebp), %eax
    movl %ebp, %esp
    popl %ebp
    ret
