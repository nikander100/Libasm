section .text:
	global _ft_strlen

_ft_strlen:
		mov rax, 0x0 ; set return to 0
	jmp	_count

_count:
	cmp BYTE [rdi + rax], 0x0 ; if the byte at rdi start + rax are equal to 0
	je _exit ; exit and return rax
	inc rax ; inc rax
	jmp _count ; loop

_exit:
	ret