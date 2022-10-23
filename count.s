.text
    .globl count

count:
    push %ebp
    mov %esp, %ebp
    sub $8, %esp
    movl 8(%ebp), %ebx
    movl %eax, -4(%ebp)
    movzbl 12(%ebp), %edx
    movl %edx, -8(%ebp)
    xorl %ecx, %ecx
    movl -4(%ebp), %eax
    movzbl (%eax), %eax
    cmpb -8(%ebp),%al
        jne .increment
        je .equal

.increment:
    movl -4(%ebp), %eax
    addl $1, -4(%ebp);
    addl $1, %eax
    movzbl (%eax), %eax
    testb %al,%al
    je .return
    cmpb -8(%ebp), %al
        jne .increment
        je .equal

.equal:
    addl $1, %ecx
    jmp .increment

.return:
    movl %ecx, %eax
    mov %ebp, %esp
    popl %ebp
    ret
    .end
