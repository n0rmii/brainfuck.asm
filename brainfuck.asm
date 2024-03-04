		global _start
		section .text
_start:
		mov rax, 1
		mov rdi, rax
		mov rdx, meetLen
		mov rsi, meet
		syscall

		xor rax, rax	; 0 to rax
		xor rdi, rdi	; 0 to rdi
		mov rdx, 1
		add rsp, rdx	; make space for instruction (1 byte)
		mov rsi, rsp	; address for instruction
		syscall			; 1 byte read from stdin
		
		mov rax, rdx
		mov rdi, rax
		syscall

		mov rax, 60
		syscall

		section .data
meet: db "Hello! your input:", 10, 0
meetLen: equ $-meet
