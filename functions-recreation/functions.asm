; uses System V ABI x86_64 function specification

; int strlen(char* str)
; Null terminated string length function
strlen:
        mov     rax, rdi        ; put &str[0] in rax
.strlen_loop:
        cmp     byte [rax], 0h
        je      .strlen_exit

        inc     rax
        jmp     .strlen_loop
.strlen_exit:
        sub     rax, rdi

        ret

; void strprint(char* str)
; Print null termianted string to standard output function
strprint:
        call    strlen
        mov     rdx, rax        ; put message length for sys_write

        mov     rax, 1          ; sys_write
        mov     rsi, rdi        ; put str for sys_write
        mov     rdi, 1          ; STDOUT
        syscall

        ret

; void strprintLF(char* str)
; Print null terminated string to standard output with line feed function
strprintLF:
        call    strprint

        ; put line feed in the stack
        mov     rdi, 0Ah
        push    rdi

        mov     rdi, rsp        ; put pointer to line feed as function input
        call    strprint
        pop     rdi             ; remove line feed from stack

        ret

; void strinput(char* strBuffer, int length)
; Input characters and put then in strBuffer function
; Note: strBuffer will have a line feed after executing
strinput:
        mov     rax, 0          ; sys_read
        mov     rdx, rsi        ; length
        mov     rsi, rdi        ; strBuffer
        mov     rdi, 0          ; STDIN
        syscall

        ret

; void quit()
; Quit program with exit code 0 and release memory
quit:
        mov     rax, 60         ; sys_exit
        mov     rdi, 0          ; successful exit code (0)
        syscall

        ret
