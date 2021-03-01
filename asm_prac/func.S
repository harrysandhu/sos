; calling c functions

global _start
_start:
	call func	; push line 5 onto the stack, jmp to func
	mov ebx, 22
	mov eax, 1	; change eax to sys_exit
	int 80h
	
	
func:
	mov ebp, esp
	sub esp, 2
	mov [esp], byte 'H'
	mov [esp+1], byte 'i'
	mov eax, 4
	mov ecx, esp
	mov edx, 2
	int 80h
	mov esp, ebp
	ret
