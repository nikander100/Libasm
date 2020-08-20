segment .text
	global _ft_strdup
	extern _ft_strlen
	extern _ft_strcpy
	extern _malloc

_ft_strdup:
	call	_ft_strlen ; get len + 1 for malloc
	add		rax, 1
	push	rdi ; save value of arg0 on stack
	mov		rdi, rax ; save length for strcpy
	call	_malloc
	pop		r9 ; get arg0 (of ft_strdup) stocked on stack
	mov		rdi, rax ; set the string malloced in rax to arg0 for ft_strcpy
	mov		rsi, r9 ; get arg0 (of ft_strdup) stocked in r9 on rsi for ft_strcpy
	call	_ft_strcpy ; call ft_strcpy (rdi, rsi), ret is stored in rax
	ret