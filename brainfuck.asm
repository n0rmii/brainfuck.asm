		global _start
		section .text
_start:
		mov rax, 1
		mov rdi, rax
		mov rsi, meet
		mov rdx, meetLen
		syscall			;greetings

		xor rax, rax
		xor rdi, rdi
		mov rsi, instr
		mov rdx, 128
		syscall			;load instruction to buffer (max 128 bytes)

		mov r8, instr	;r8 is now iptr
		mov r9, array	;r9 is now dptr
loop:
		
		cmp r8, 0
		jne loop		;if instruction not 0, loop back
		
		mov rax, 60		;sys_exit
		syscall

		section .rodata
meet: db "Hello! your input:", 10, 0
meetLen: equ $-meet

		section .bss
instr: resb 128
array: resb 256
