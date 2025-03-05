BITS 64

%include        'functions.asm'

SECTION .data
filename        db      'readme.txt', 0h
contents        db      'Hello World', 0h

SECTION .bss
fileContents    resb    255

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
        mov     rsi, 0          ; flag O_RDONLY
        call    syscall

        mov     rdi, rax        ; move file descripor into rdi
        mov     rax, 0          ; sys_read
        mov     rsi, fileContents
        mov     rdx, 255        ; length
        call    syscall

        mov     rdi, fileContents
        call    strprintLF

        call    quit
