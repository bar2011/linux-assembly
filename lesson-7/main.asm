BITS 64

; function arg registers: 1 - rcx
; function out register:  rcx
%include	'functions.asm'

SECTION .data
msg1	db	'Hello, Current World!', 0h
msg2	db	'This is really cool!', 0h

SECTION .text
global _start

_start:
	mov	rcx, msg1
	call	strprintLF

	mov	rcx, msg2
	call	strprintLF

	call	quit
