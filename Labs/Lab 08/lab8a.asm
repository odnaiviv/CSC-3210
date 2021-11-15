; Lab 8a
.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
	myBytes BYTE 10h, 20h, 30h, 40h
	myWords WORD 8Ah, 3Bh, 72h, 44h, 66h
	myDoubles DWORD 1, 2, 3, 4
	myPointer DWORD myDoubles

.code
main1 proc
	mov esi, OFFSET myBytes
	mov ax, [esi]					; a. AX = 2010
	mov eax, DWORD PTR myWords			; b. EAX = 003B008A
	mov esi, myPointer
	mov ax, [esi + 2]				; c. AX = 0000
	mov ax, [esi + 6]				; d. AX = 0000
	mov ax, [esi - 4]				; e. AX = 0044
	invoke ExitProcess, 0

main1 endp
end main1
