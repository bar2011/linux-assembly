BITS 64

%include        'functions.asm'

SECTION .data
remainder       db      ' remainder ', 0h

SECTION .text
global _start

_start:
        ; ADDITION
        mov     rax, 90
        mov     rbx, 9
        add     rax, rbx        ; add rbx to rax
        mov     rdi, rax
        call    intprintLF

        ; SUBTRACTION
        mov     rax, 90
        mov     rbx, 9
        sub     rax, rbx        ; subtract rbx from rax
        mov     rdi, rax
        call    intprintLF

        ; MULTIPLICATION
        mov     rax, 90
        mov     rbx, 9
        mul     rbx             ; multiply rax by rbx
        mov     rdi, rax
        call    intprintLF

        ; DIVISION
        mov     rax, 90
        mov     rbx, 9
        div     rbx             ; divide rax by rdi
        mov     rdi, rax        ; move result to rdi
        call    intprint

        ; print remainder message
        mov     rdi, remainder
        call    strprint

        mov     rdi, rdx        ; move remainder to rdi
        call    intprintLF

        call    quit

