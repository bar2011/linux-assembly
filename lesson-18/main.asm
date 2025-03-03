BITS 64

%include        'functions.asm'

SECTION .data
fizz    db      'fizz', 0h
buzz    db      'buzz', 0h

SECTION .text
global _start

_start:
        mov     rcx, 0          ; initialize counter register

nextNumber:
        inc     rcx

checkFizz:
        mov     rax, rcx        ; move current iteration to div result register
        xor     rdx, rdx        ; clear rdx register - div remainder register
        mov     rbx, 3
        div     rbx

        mov     r12, rdx        ; save remainder to be used afterwards

        ; if not divisible, move on to next check
        cmp     rdx, 0
        jne     checkBuzz

        ; otherwise print
        mov     rdi, fizz
        call    strprint

checkBuzz:
        mov     rax, rcx        ; move current iteration to div result register
        xor     rdx, rdx        ; clear rdx register - div remainder register
        mov     rbx, 5
        div     rbx

        mov     r13, rdx        ; save remainder to be used afterwards

        ; if not divisible, move on to next check
        cmp     rdx, 0
        jne     checkInt

        ; otherwise print
        mov     rdi, buzz
        call    strprint

checkInt:
        ; check if at least one of the remainders is 0. If so, don't print number
        cmp     r12, 0
        je      continue
        cmp     r13, 0
        je      continue

        mov     rdi, rcx
        call    intprint

continue:
        ; print new line
        mov     rdi, 0Ah
        push    rdi
        mov     rdi, rsp
        call    strprint

        cmp     rcx, 100
        jl      nextNumber

        call    quit
