; Lab 6a
.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitcode:dword

.data
	; assigning Xval as 26, Yval as 30, and Zval as 40
	Xval sdword 26
	Yval dword 30
	Zval dword 40

.code
; EAX = Xval - (Yval + Zval)
main1 proc
	; calculating Yval - Zval (40 - 30)
	mov ebx, Yval
	add ebx, Zval
	; subbing in terms and storing them in eax
	sub Xval, ebx
	mov eax, Xval
	invoke ExitProcess, 0

main1 endp
end main1
