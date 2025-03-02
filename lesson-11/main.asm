BITS 64

%include        'functions.asm'

SECTION .text
global _start

_start:
        mov     rbx, 0          ; init counter

nextNumber:
        inc     rbx
        
        mov     rdi, rbx
        call    intprintLF

        cmp     rbx, 10
        jne     nextNumber      ; repeat if not finished

        call    quit

