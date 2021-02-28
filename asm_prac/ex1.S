global _start
_start:
	mov eax, 1	;  1 into the eax
	mov ebx, 11	; 11 into the ebx
	sub ebx, 5	; 
	int 80h
