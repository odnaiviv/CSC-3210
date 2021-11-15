; Lab 8b
.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
	varB BYTE 65h, 31h, 02h, 05h
	varW WORD 6543h, 1202h
	varD DWORD 12345678h

.code
main2 proc
	mov ax, WORD PTR [varB + 2]			; a. AX = 0502
	mov bl, BYTE PTR varD				; b. BL = 78
	mov bl, BYTE PTR [varW + 2]			; c. BL = 02
	mov ax, WORD PTR [varD + 2]			; d. AX = 1234
	mov eax, DWORD PTR varW				; e. EAX = 12026543
	invoke ExitProcess, 0

main2 endp
end main2
