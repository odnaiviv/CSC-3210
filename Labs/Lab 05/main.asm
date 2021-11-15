; lab 5
.386
.model flat, stdcall
.stack

ExitProcess proto, dwExitCode:dword

.code
main proc
	mov al, 20
	mov ax, 100
	mov eax, 1000
	add eax, 2
	sub al, 20

	invoke ExitProcess, 0
main endp
end main
