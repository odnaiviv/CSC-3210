; Vivian Do
; Class: CSC 3210
; Assignment 2 Question 1
; This program will compute (val3 + 7) - (val2 + val1) + (5 / 3) * 7 for the AX register

.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
	val1 SWORD 12d				; initializing varialbes as signed 16-bit integers
	val2 SWORD 9d
	val3 SWORD 2d

.code
main1 proc
	mov eax, 0h					; putting zeros in the register value
	mov ebx, 0h

	mov ax, val3				; computing val3 + 7 in ax register
	add ax, 7d

	mov bx, val2				; computing val2 + val1 in bx register and then subtracting it to ax register
	add bx, val1
	sub ax, bx

	add ax, ((5d / 3d) * 7d)	; computing (5 / 3) * 7 and then adding it to ax register

	invoke ExitProcess, 0

main1 endp
end main1
