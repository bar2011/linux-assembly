; For information about sys_socket, visit the following files/sites:
; Domain (family) types: /usr/include/x86_64-linux-gnu/bits/socket.h
; Socket types: /usr/include/x86_64-linux-gnu/bits/socket_type.h
; Protocols: /etc/protocols
; General info: https://www.gnu.org/software/libc/manual/html_node/Sockets.html
; sys_socket manual page: https://linux.die.net/man/3/socket

BITS 64

%include        'functions.asm'

SECTION .data
filename        db      'readme.txt', 0h

SECTION .text
global _start

_start:
        mov     rax, 41         ; sys_socket (socket creation)
        mov     rdi, 2          ; PF_INET
        mov     rsi, 1          ; SOCK_STREAM
        mov     rdx, 6          ; TCP
        call    syscall

        mov     rdi, rax        ; move file descriptor to first argument for functions
        call    intprintLF

        call    quit
