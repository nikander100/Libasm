segment .text
	global _ft_strcpy
	extern _ft_strlen

_ft_strcpy:
	push	rdi ; push/save rdi to top of stack
	mov		rdi, rsi ; move rsi to rdi
	call	_ft_strlen ; call ft_strlen, result is stored in rax
	mov		rcx, rax ; move rax to rcx, rcx is used by rep later
	pop		rdi ; restore stack/ get rdi from the top.
	cld ; clear DF flag (security) DF == 0 = increment for rep, DF == 1 = decrement for rep
	mov		rax, rdi ; move rdi to rax
	rep		movsb ; movsb get the string from rsi and set it to rdi at rep, rep increments automaticaly until rsi or movsb isn't 0
	mov		BYTE [rdi], 0x0 ;rdi was increased by movsb, so we are at end of the copied string
	jmp		_exit

	_exit
		ret