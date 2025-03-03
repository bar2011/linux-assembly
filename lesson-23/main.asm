BITS 64

%include        'functions.asm'

SECTION .data
filename        db      'readme.txt', 0h
text            db      'Hello World', 0h

SECTION .text
global _start

_start:
        mov     rax, 85         ; sys_creat
        mov     rdi, filename   ; path
        mov     rsi, 0777o      ; rwx permission (in octal)
        call    syscall

        mov     rdi, rax        ; move file descriptor into rdi
        mov     rax, 1          ; sys_write
        mov     rsi, text       ; message
        mov     rdx, 11         ; length
        call    syscall

        call    quit
