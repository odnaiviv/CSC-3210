; Vivian Do
; Class: CSC 3210
; Assignment 2 Question 2
; This program will compute -val2 - val1 + (-val1 + val3) + 3 for the CX register

.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
	val1 SBYTE 12d				; initializing varialbes as signed 16-bit integers
	val2 SBYTE 9d
	val3 SBYTE 2d

.code
main2 proc
	mov ecx, 0h					; putting zeros in the register values

	mov cl, val1				; computing (-val1 + val3)
	neg cx
	add cl, val3

	sub cl, val2				; computing -val2 - val2 and adding it to cl register
	sub cl, val1

	add cl, 3					; adding 3 to cl register

	invoke ExitProcess, 0

main2 endp
end main2
