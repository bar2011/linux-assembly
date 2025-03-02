; strlen(char* str) -> int length
; String length calculation function
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

; strprint(char* str) -> void
; String printing function
; Note: str must be null (0h) terminated
strprint:
	push	rax
	push	rdi
	push	rsi
	push	rdx		; save used registers

	push	rcx		; save str[0]

	call	strlen
	mov	rdx, rcx	; get message length from strlen output

	pop	rcx		; pop str[0] from stack
	mov	rsi, rcx	; and put it in the correct address

	mov	rax, 1		; sys_write
	mov	rdi, 1		; STDOUT
	syscall

	pop	rdx
	pop	rsi
	pop	rdi
	pop	rax

	ret

; strprintLF(char* str) -> void
; String printing with line feed function
; Note: str must be null (0h) terminated
strprintLF:
	call	strprint	; actually print the string

	push	rcx		; save initial value of rcx

	mov	rcx, 0Ah	; move line feed to rcx
	push	rcx		; and then to stack

	mov	rcx, rsp	; mov line feed pointer (stack poitner) to rcx
	call strprint

	pop	rcx		; pop line feed from stack
	pop	rcx		; restore value of rcx

	ret

; strinput(char* strBuffer, int length) -> void
; String input to strBuffer
; Note: after function strBuffer will have a Line Feed
strinput:
	push	rax
	push	rdi
	push	rsi
	push	rdx

	mov	rax, 0		; sys_read
	mov	rdi, 0		; STDIN
	mov	rsi, rcx	; address to input
	mov	rdx, rbx	; max length
	syscall

	pop	rdx
	pop	rsi
	pop	rdi
	pop	rax

	ret

; quit() -> void
; Quit program (successfully) and restore resources to OS
quit:
	mov	rax, 60
	mov	rdi, 0
	syscall

	ret
