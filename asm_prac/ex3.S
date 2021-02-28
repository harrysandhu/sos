global _start

section .text
_start:
	mov eax, 1
	mov ebx, 42
	mov ecx, 101	; set ecx to 99
	cmp ecx, 100	; compare ecx to 100
	jl skip	; jump if less than
	mov ebx, 13
	

skip:
	int 80h
