BITS 64

SECTION .data
msg	db	'Hello World!', 0Ah

SECTION .text
global _start

_start:
	mov rax, 1      ; sys_write
	mov rdi, 1	; STD_OUT
	mov rsi, msg	; message
	mov rdx, 13	; length
	syscall
	
	mov rax, 60	; sys_exit
	mov rdi, 0	; error_code
	syscall
