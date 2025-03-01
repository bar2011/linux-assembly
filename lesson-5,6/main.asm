BITS 64

; function arg registers: 1 - rcx
; function out register:  rcx
%include	'functions.asm'

SECTION .data
msg1	db	'Hello, Current World!', 0Ah, 0h
msg2	db	'This is really cool!', 0Ah, 0h

SECTION .text
global _start

_start:
	mov	rcx, msg1
	call	strprint

	mov	rcx, msg2
	call	strprint

	call	quit
