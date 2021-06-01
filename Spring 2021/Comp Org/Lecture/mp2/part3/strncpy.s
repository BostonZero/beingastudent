.text
.global mystrncpy

mystrncpy:

    pushl    %ebp
    movl    %esp, %ebp
    movl    8(%ebp), %edi
                            
    movl    12(%ebp), %esi
    movl    16(%ebp), %ecx

   
loop:
    cmpl $0, %ecx
        jz .done

    movb    (%esi), %al
    movb    %al, (%edi)
    incl    %esi
    incl    %edi
    decl    %ecx
    jnz        loop


.done:
    movl    8(%ebp), %eax
    movl    %ebp, %esp
    popl    %ebp
    ret
    .end
