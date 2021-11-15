; Lab 8c
.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
	dVal DWORD ?

.code
main3 proc
	mov dVal, 12345678h
	mov ax, WORD PTR dVal + 2
	add ax, 3
	mov WORD PTR dVal, ax			; dVal = 12341237
	mov eax, dVal					; EAX = 12341237
	invoke ExitProcess, 0

main3 endp
end main3
