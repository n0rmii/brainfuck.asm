		global _start
		section .text
_start:
		mov rax, 1
		mov rdi, rax
		mov rsi, meet
		mov rdx, meetLen
		syscall

		xor rax, rax	; 0 to rax
		xor rdi, rdi	; 0 to rdi
		mov rdx, 8
		mov rsi, [hold]
		add rsp, rdx	; make space for instruction (1 byte)
		mov rsi, rsp	; address for instruction
		syscall			; 1 byte read from stdin
		
		mov rax, 1
		mov rdi, rax
		syscall

		mov rax, 60
		syscall

		section .rodata
meet: db "Hello! your input:", 10, 0
meetLen: equ $-meet

		section .bss
hold: resb 8
