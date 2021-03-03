; calling c functions

global _start
_start:
	call func	; push next instruction onto the stack, jmp to func
	mov ebx, 22
	mov eax, 1	; change eax to sys_exit
	int 80h
	
func:
	push ebp	; push old-ebp value 
	mov ebp, esp	; point ebp to top of stack=esp
	sub esp, 2
	mov [esp], byte 'b'
	mov [esp+1], byte 'i'
	mov eax, 4
	mov ebx, 1
	mov ecx, esp
	mov edx, 2
	int 80h	
	call draw
	mov esp, ebp	; clear current function's stack
	pop ebp		; go back to old base
	ret		; pop return address to eax and jump there

	
draw:
	push ebp
	mov ebp, esp
	sub esp, 3
	mov [esp], byte 0x0a
	mov [esp+1], byte 'h'
	mov [esp+2], byte 'i'
	mov eax, 4
	mov ebx, 1
	mov ecx, esp
	mov edx, 3
	int 80h
	mov esp, ebp
	pop ebp
	ret
