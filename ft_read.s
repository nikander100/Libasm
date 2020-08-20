segment .text
	global _ft_read


_ft_read:
	mov rax, 0x000003 ; syscall 3 (read)
	syscall
		jc _error
	jmp _exit

_error:
	mov rax, -1 ; return -1
	ret

_exit
	ret