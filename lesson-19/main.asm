BITS 64

%include        'functions.asm'

SECTION .data
command         db      '/bin/echo', 0h         ; command file
arg1            db      'Hello World!', 0h
arguments       dq      command                 ; arguments to pass into command line
                dq      arg1
                dq      0h
environment     dq      0h                      ; arguments to pass as environment variables

SECTION .text
global _start

_start:
        mov     rax, 59         ; sys_execve
        mov     rdi, command    ; command file
        mov     rsi, arguments  ; arg list
        mov     rdx, environment; environment list
        syscall

        call    quit
