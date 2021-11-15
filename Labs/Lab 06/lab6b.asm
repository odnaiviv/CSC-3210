; Lab 6b
.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
	myWord word 4 dup(1,2,3,4,5)

.code
main2 proc
	mov eax, 0				; zeroing eax register
	mov ax, myWord + 0		; sum up the list values
	add ax, myWord + 2
	add ax, myword + 4
	add ax, myWord + 6
	add ax, myWord + 8
	invoke ExitProcess, 0
main2 endp
end main2
