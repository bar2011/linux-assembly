BITS 64

%include        'functions.asm'

SECTION .text
global _start

_start:
        pop     rcx     ; move number of arguments to rcx register
        mov     rbx, 0  ; initialize sum register

        ; discard first argument (program name) by moving it to arbitary register and decrementing counter
        pop     rax
        dec     rcx

addArg:
        ; check if no more arguments to parse
        cmp     rcx, 0
        jle     finish

        ; add current variable to sum (from the stack)
        pop     rdi
        call    asciiToInt
        add     rbx, rax

        dec     rcx
        jmp     addArg

finish:
        mov     rdi, rbx
        call    intprintLF

        call    quit

