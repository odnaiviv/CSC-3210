; Lab 7a
.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
	count BYTE 100
	wVal WORD 2
	wVal2 word 4

.code
main1 proc
	mov bl, count
	mov ax, wVal
	mov count, al

	mov ax, wVal			; changed al to ax							(originally was mov al, wVal)
	mov al, count			; changed ax to al							(originall was mov ax, count)
	mov al, count			; changed eax to al							(originall was mov eax, count)
	mov ax, wVal2			; changed switched wVal with wVal2 and then moved wVal2 to ax		(originally was mov wVal2, wVal)
	mov ax, wVal			; added another instruction to mov wVal to ax
	invoke ExitProcess, 0

main1 endp
end main1
