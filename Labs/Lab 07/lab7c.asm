; Lab 7c
.386
.model flat, stdcall
.stack 4096
ExitProcess proto dwExitCode:dword

.data
	arrayD DWORD 10000h, 20000h, 30000h

.code
main3 proc
	; direct-offset addressing (doubleword array)
	mov eax, arrayD			; EAX = 00010000
	mov ebx, [arrayD + 4]		; EBX = 00020000
	mov edx, [arrayD + 8]		; EDX = 00030000
	invoke ExitProcess, 0

main3 endp
end main3
