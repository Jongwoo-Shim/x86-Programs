# PURPOSE: Perform a factorial

.section .data
.section .text
.globl _start
.globl _factorial # Do this to allow sharing

_start:
    pushl $4
    call factorial
    addl $4, %esp
    movl %eax, %ebx
    movl $1 , %eax
    int $0x80

# Only needed if used in other programs
.type factorial, @function
factorial:
    pushl %ebp
    movl %esp, %ebp
    # 4(%ebp) holds the just pushed return addres, while 8(%ebp) holds the value 
    movl 8(%ebp), %eax
    cmpl $1, %eax
    je end_factorial
    decl %eax
    pushl %eax
    call factorial
    movl 8(%ebp), %ebx
    imul %ebx, %eax

end_factorial:
    movl %ebp, %esp
    popl %ebp
    ret
