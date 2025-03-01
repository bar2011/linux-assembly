BITS 64

; function arg registers: 1 - rcx, 2 - rbx
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

	mov	rcx, s_input
	mov	rbx, 255
	call	strinput

	mov	rcx, msg2
	call	strprint

	mov	rcx, s_input
	call	strprint	; already contains line feed, so no need to call strprintLF

	call	quit
