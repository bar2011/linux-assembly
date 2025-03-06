BITS 64

%include        'functions.asm'

SECTION .data
filename        db      'readme.txt', 0h
contents        db      '-updated-', 0Ah, 0h

SECTION .text
global _start

_start:
        mov     rax, 2          ; sys_open
        mov     rdi, filename   ; path
        mov     rsi, 1          ; flag O_WRONLY
        call    syscall

        mov     rdi, rax        ; move file descripor into rdi
        mov     rax, 8          ; sys_lseek
        mov     rsi, 0          ; offset (from end, based on next line)
        mov     rdx, 2          ; SEEK_END
        call    syscall

        mov     rax, 1          ; sys_write
        mov     rsi, contents
        mov     rdx, 10         ; length
        call    syscall

        mov     rax, 3          ; sys_close
        call    syscall

        call    quit
