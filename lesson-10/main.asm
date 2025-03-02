BITS 64

; function arg registers: 1 - rcx, 2 - rbx
; function out register:  rcx
%include	'functions.asm'

SECTION .text
global _start

_start:
	mov	rdx, 0		; initialize counter

printNumber:
	inc	rdx		; move to next number

	mov	rcx, rdx
	add	rcx, 48		; add 48 to convert number to ASCII
	push	rcx
	mov	rcx, rsp	; move pointer to ASCII number (at stack) to print function input
	call	strprintLF

	pop	rcx
	cmp	rdx, 10
	jne	printNumber

	call	quit
