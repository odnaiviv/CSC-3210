; Lab 6c
.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
	myString byte "This is a very long string made by your instructor to test how $ works in this lab hope you will like it"
	myString_length = ($ - myString)

.code
main3 proc
	mov eax, 0
	mov al, myString_length
	invoke ExitProcess, 0

main3 endp
end main3
