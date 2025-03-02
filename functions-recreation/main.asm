BITS 64

%include        'functions.asm'

SECTION .text
global _start

_start:
        mov     rbx, 0          ; init counter

nextNumber:
        inc     rbx
        
        mov     rdi, rbx
        add     rdi, 48         ; move number to ASCII
        push    rdi
        mov     rdi, rsp        ; change rax to pointer to ASCII number
        call    strprintLF

        pop     rdi             ; clean stack

        cmp     rbx, 10
        jne     nextNumber      ; repeat if not finished

        call    quit

