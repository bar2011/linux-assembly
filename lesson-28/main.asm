BITS 64

%include        'functions.asm'

SECTION .data
filename        db      'readme.txt', 0h

SECTION .text
global _start

_start:
        mov     rax, 87         ; sys_unlink
        mov     rdi, filename   ; file to delete
        call    syscall

        call    quit
