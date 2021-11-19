; Lab 9a
.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
	intarray DWORD 10000h, 20000h, 30000h, 40000h

.code
main1 proc
	mov edi, OFFSET intarray			; EDI = address of intarray
	mov ecx, LENGTHOF intarray			; initialize loop counter
	mov eax, 0							; sum = 0
	L1:									; mark beginning of loop
	add eax, [edi]						; add an integer
	add edi, TYPE intarray				; point to next element
	loop L1								; repeat until EXC = 0
	invoke ExitProcess, 0

main1 endp
end main1
