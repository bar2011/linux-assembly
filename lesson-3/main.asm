BITS 64

SECTION .data
msg	db	'Hello, Current World!', 0Ah

SECTION .text
global _start

_start:
	mov	rcx, msg	; put message into input of the function
	call	strlen

	mov	rax, 1		; sys_write
	mov	rdi, 1		; STDOUT
	mov	rdx, rcx
	mov	rsi, msg	; message
	syscall

	mov	rax, 60		; sys_exit
	mov	rdi, 0		; error_code
	syscall

; input:  rcx = &str[0]
; output: rcx = str.length
; strlen(char* str) -> int length
strlen:
	push	rbx		; save rbx in stack
	mov	rbx, rcx	; initialize rbx with str[0]

strlen_loop:
	; if at message end (null terminator), go to return
	cmp	byte [rcx], 0
	jz	strlen_done
	; otherwise increment and repeat
	inc	rcx
	jmp	strlen_loop

strlen_done:
	sub	rcx, rbx	; get message length by subtracting two pointers: at end and start
	pop	rbx		; retrieve value of rbx
	ret
