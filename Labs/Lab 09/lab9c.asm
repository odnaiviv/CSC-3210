; Lab 9c
.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.code
main proc
	mov al, 01101111b
	and al, 00101101b			; a. AL = 
	mov al, 6Dh
	and al, 4Ah					; b. AL = 
	mov al, 00001111b
	or al, 61h					; c. AL = 
	mov al, 94h
	xor al, 37h					; d. AL = 
	invoke ExitProcess, 0

main endp
end main
