.global printbin
.text
printbin: 
	pushl %ebp
	movl %esp, %ebp

	movb 8(%ebp), %al
	movl $string, %edx
	call donibble
	movb $' ', (%edx)
	incl %edx
	call donibble
	movl $string, %eax

	movl %ebp, %esp
	popl %ebp
	ret				


donibble:
	movl $4, %ecx
loop0:
	shlb $1, %al
	jc loop1
	movb $'0', (%edx)
	jmp loop2
loop1:
	movb $'1', (%edx)
loop2:
	incl %edx
	loop loop0
	ret

	.data
string:
	.asciz "xxxx xxxx\n"
