		global _start
		section .text

bf_read: ; ,
		xor rax, rax
		mov rdi, rax
		mov rsi, r9
		mov rdx, 1
		syscall
		ret

bf_write: ; .
		mov rax, 1
		mov rdi, rax
		mov rsi, r9
		mov rdx, 1
		syscall
		ret

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
		mov r10b, byte [r8]

loop:
		cmp r10b, 10
		je exit		;if instruction 10 (newline), exit program

		cmp r10b, "+"		;Im using an if-else ladder cuz asm switch-case is black magic
		jne $+2
		inc byte [r9]

		cmp r10b, "-"
		jne $+2
		dec byte [r9]

		cmp r10b, "<"
		jne $+2
		dec r9
		
		cmp r10b, ">"
		jne $+2
		inc r9

		cmp r10b, ","
		jne $+2
		call bf_read

		cmp r10b, "."
		jne $+2
		call bf_write

		inc r8
		mov r10b, byte [r8]
		jmp loop		;if instruction not 0, loop back

exit:
		mov rax, 60		;sys_exit
		syscall

		section .rodata
meet: db "Hello! your input:", 10, 0
meetLen: equ $-meet

		section .bss
instr: resb 128
array: resb 256
