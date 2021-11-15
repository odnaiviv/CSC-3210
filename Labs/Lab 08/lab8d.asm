; Lab 8d
.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
	myBytes BYTE 10h, 20h, 30h, 40h
	myWords WORD 3 DUP (?), 2000h
	myString BYTE "ABCDE"

.code
main4 proc
	mov eax, TYPE myBytes			; a. EAX = 00000001
	mov eax, LENGTHOF myBytes		; b. EAX = 00000004
	mov eax, SIZEOF myBytes			; c. EAX = 00000004
	mov eax, TYPE myWords			; d. EAX = 00000002
	mov eax, LENGTHOF myWords		; e. EAX = 00000004
	mov eax, SIZEOF myWords			; f. EAX = 00000008
	mov eax, SIZEOF myString		; g. EAX = 00000005
	invoke ExitProcess, 0

main4 endp
end main4
