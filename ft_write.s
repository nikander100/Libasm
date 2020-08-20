segment .text
	global _ft_write

_ft_write:
	mov r8, rdx ; save rdx (len) in r8
	mov rax, 0x2000004 ; syscall 2 (write)
	syscall
		jc _error
	jml _exit

_error:
	mov rax, -1 ; return -1
	ret

_exit:
	mov rax, r8 ; move value from rdx previously saved in r8 to rax
	ret