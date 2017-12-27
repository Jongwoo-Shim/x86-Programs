#Purpose: Simply exits and returns status code
#INPUT: none
#OUTPUT: Returns status code use: echo $?
#VARIABLES: %eax holds system call number
#%ebx holds return status

.section .data
.section .text
.globl _start
_start:
    movl $1, %eax
    movl $0, %ebx 
    int $0x80
