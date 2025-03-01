BITS 64

; function arg registers: 1 - rcx
; function out register:  rcx
%include	'functions.asm'

SECTION .data
msg1	db	'Please enter your name: ', 0h
msg2	db	'Hello, ', 0h

SECTION .bss
s_input	resb	255

SECTION .text
global _start

_start:
	mov	rcx, msg1
	call	strprint

	mov	rax, 0		; sys_read
	mov	rdi, 0		; STDIN
	mov	rsi, s_input	; address to input
	mov	rdx, 255	; max length
	syscall

	mov	rcx, msg2
	call	strprint

	mov	rcx, s_input
	call	strprint	; already contains line feed, so no need to call strprintLF

	call	quit
