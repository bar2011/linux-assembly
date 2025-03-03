BITS 64

%include        'functions.asm'

SECTION .data
parentmsg       db      'I am the parent!', 0h
childmsg        db      'I am the child!', 0h

SECTION .text
global _start

_start:
        mov     rax, 57         ; sys_fork
        syscall

        cmp     rax, 0          ; test syscall return value
        jz      child

parent:
        mov     rdi, parentmsg
        call    strprintLF

        call    quit

child:
        mov     rdi, childmsg
        call    strprintLF

        call    quit
