global _start

section .data
	msg db "Hello, world", 0x0a
	len equ $ - msg
	
section .text
_start:
	mov eax, 4		; sys_write
	mov ebx, 1		; stdout file descriptor - we gon use ebx
	mov ecx, msg		; bytes to write
	mov edx, len 		; num of bytes to write
	int 80h		; perform system call as per eax
	mov eax, 1		; sys_exit
	mov ebx, 0		; exit status 0
	int 80h		; interrupt: system call
