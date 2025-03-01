BITS 64

; function arg registers: 1 - rcx
; function out register:  rcx
%include	'functions.asm'

SECTION .text
global _start

_start:
	pop	rcx	; first value in stack is the argument number

nextArg:
	pop	rcx
	cmp	rcx, 0h
	jz	noMoreArgs
	call	strprintLF
	jmp	nextArg

noMoreArgs:
	call	quit
