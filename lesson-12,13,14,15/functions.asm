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
        push    rdx
        push    rax
        push    rsi             ; save used registers to later be restored

        call    strlen
        mov     rdx, rax        ; put message length for sys_write

        mov     rax, 1          ; sys_write
        mov     rsi, rdi        ; put str for sys_write
        mov     rdi, 1          ; STDOUT
        syscall

        pop     rsi
        pop     rax
        pop     rdx             ; restore used registers

        ret

; void strprintLF(char* str)
; Print null terminated string to standard output with line feed function
strprintLF:
        push    rdi             ; save used registers to later be restored

        call    strprint

        ; put line feed in the stack
        mov     rdi, 0Ah
        push    rdi

        mov     rdi, rsp        ; put pointer to line feed as function input
        call    strprint
        pop     rdi             ; remove line feed from stack

        pop     rdi             ; restore used registers

        ret

; void intprint(int num)
; Print integer to standard output function
intprint:
        push    rax
        push    rbx
        push    rsi
        push    rdx             ; save used registers to later be restored

        mov     rax, rdi        ; move number to rax to match IDIV
        mov     rbx, 0          ; initialize digit counter
.intprint_digit_loop:
        inc     rbx             ; increment digit counter

        mov     rdx, 0          ; reset remainder register
        mov     rsi, 10         ; set divsor (for division by 10)
        idiv    rsi             ; perform the division

        add     rdx, 48         ; add 48 to the remainder to move it to ASCII format
        push    rdx

        ; if no more digits, jump to print loop
        cmp     rax, 0h
        jnz      .intprint_digit_loop
.intprint_print_loop:
        dec     rbx

        mov     rdi, rsp        ; move stack pointer to print function input
        call    strprint

        pop     rdi

        cmp     rbx, 0h
        jnz     .intprint_print_loop

        pop     rdx
        pop     rsi
        pop     rbx
        pop     rax             ; restore used registers

        ret

; void intprintLF(int num)
; Print integer to standard output with line feed function
intprintLF:
        push    rdi             ; save used registers to later be restored

        call    intprint

        ; put line feed in the stack
        mov     rdi, 0Ah
        push    rdi

        mov     rdi, rsp        ; put pointer to line feed as function input
        call    strprint
        pop     rdi             ; remove line feed from stack
 
        pop     rdi             ; restore used registers

        ret

; void strinput(char* strBuffer, int length)
; Input characters and put then in strBuffer function
; Note: strBuffer will have a line feed after executing
strinput:
        push    rax
        push    rdx
        push    rsi
        push    rdi             ; save used registers to later be restored

        mov     rax, 0          ; sys_read
        mov     rdx, rsi        ; length
        mov     rsi, rdi        ; strBuffer
        mov     rdi, 0          ; STDIN
        syscall

        pop     rdi
        pop     rsi
        pop     rdx
        pop     rax             ; restore used registers

        ret

; void quit()
; Quit program with exit code 0 and release memory
quit:
        mov     rax, 60         ; sys_exit
        mov     rdi, 0          ; successful exit code (0)
        syscall

        ret
