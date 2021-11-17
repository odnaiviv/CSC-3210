; Vivian Do
; Class: CSC 3210
; Assignment 3 Question 3
; This program will find the sum of the words in the data segment

.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
	; creating given value as QWORD (64-bit integer)
	qVal QWORD 0506030704080102h

.code
main3 proc
	mov eax, 0							; putting zeros in the register values
	mov ebx, 0
	mov ecx, 0
	mov edx, 0

	mov ax, WORD PTR [qVal + 6]			; loading 0506h in ax
	mov bx, WORD PTR [qVal + 4]			; loading 0307h in bx
	mov cx, WORD PTR [qVal + 2]			; loading 4080h in cx
	mov dx, WORD PTR [qVal]				; loading 0102h in dx

	add ax, bx							; adding up the values of each register into ax
	add ax, cx
	add ax, dx							; EAX = 00000D17h

	invoke ExitProcess, 0

main3 endp
end main3
