.text
	.globl count
count:
	
        pushl %ebp
	movl %esp, %ebp
	movl 8(%ebp), %ecx
	movl $0, %eax
loop1:	
	movb (%ecx), %dl
	cmpb $0, %dl
	jz done
	cmpb 12(%ebp), %dl
	jnz loop2
incr:	addl $1, %eax
loop2:
	incl %ecx
	jmp loop1
done:	
	
        movl %ebp, %esp
	popl %ebp
	ret
	.end

