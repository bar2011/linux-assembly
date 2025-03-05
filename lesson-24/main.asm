BITS 64

%include        'functions.asm'

SECTION .data
filename        db      '../lesson-23/readme.txt', 0h
contents        db      'Hello World', 0h

SECTION .text
global _start

_start:
        mov     rax, 85         ; sys_creat
        mov     rdi, filename   ; path
        mov     rsi, 0777o      ; rwx permission (in octal)
        call    syscall

        mov     rdi, rax        ; move file descriptor into rdi
        mov     rax, 1          ; sys_write
        mov     rsi, contents   ; message
        mov     rdx, 11         ; length
        call    syscall

        mov     rax, 2          ; sys_open
        mov     rdi, filename   ; path
        mov     rsi, 1          ; flag O_WRONLY
        call    syscall

        mov     rdi, rax        ; move file descriptor into rdi
        call    intprintLF

        call    quit
