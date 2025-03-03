BITS 64

%include        'functions.asm'

SECTION .bss
time    resq    2       ; reserve memory for time struct return by sys_clock_gettime

SECTION .data
msg     db      'Time since Jan 01 1970:', 0h
sec     db      'Seconds - ', 0h
nano    db      'Nanoseconds - ', 0h

SECTION .text
global _start

_start:
        mov     rax, 228        ; sys_clock_gettime
        mov     rdi, 0          ; CLOCK_REALTIME
        lea     rsi, [time]     ; time struct pointer
        syscall

        mov     rdi, msg
        call    strprintLF

        mov     rdi, sec
        call    strprint

        mov     rdi, [time]
        call    intprintLF

        mov     rdi, nano
        call    strprint

        mov     rdi, [time+8]
        call    intprintLF

        call    quit
