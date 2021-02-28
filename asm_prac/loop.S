global _start

section .data
	msg db "we about to loooooop", 0x0a
	msg_len equ $ - msg
	pt db "ok", 0x0a
	pt_len equ $ - pt
	iter equ 5
	
section .text
_start:
	mov eax, 4		; sys_write
	mov ebx, 1		; stdout
	mov ecx, msg		; bytes to write
	mov edx, msg_len	; num of bytes to write
	int 80h
	mov ecx, iter
	jmp loop
	mov eax, 1
	mov ebx, -1
	int 80h	
		
loop:
	add ebx, ebx
	dec ecx
	cmp ecx, 0
	jg loop
	mov eax, 1
	int 80h	; we should get exit code 32
