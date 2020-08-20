segment .text
	global _ft_strcmp

_ft_strcmp:
	mov		rax, 0x0
	jmp		_compare

_compare:
	mov		al, BYTE [rdi] ; get the least significant byte in rdi
	mov		bl, BYTE [rsi] ; get the least significant byte in rsi
	cmp		al, 0 ; check if we are not at the end of rdi, arg 0
	je		_exit
	cmp		bl, 0 ; check if we are not at the end of rdi, arg 1
	je		_exit
	cmp		al, bl
	jne		_exit ; if the result of cmp is diferrent than 0 then the strings are a different size
	inc		rdi
	inc		rsi
	jmp		_compare ; loop

_exit:
	movzx	rax, al ; movzx = copy a register of inferior size in a bigger and fill the other bits with 0
	movzx	rbx, bl ; same as previous but it uses rbx
	sub		rax, rbx ; save the difference of rax and rbx in rax.
	ret