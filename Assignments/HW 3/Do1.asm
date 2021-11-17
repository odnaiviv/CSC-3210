; Vivian Do
; Class: CSC 3210
; Assignment 3 Question 1
; This program will create an uninitialized array of DWORD elements being updated with various values

.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
	z DWORD 3 DUP (?)		; creating given DWORD array
	x WORD 10				; initializing x, y, and r with their given values
	y WORD 15				; as 16-bit integers
	r WORD 4

.code
main1 proc
	movzx eax, x			; moving these integers in different registers
	movzx ebx, y
	movzx ecx, r

	mov [z + 0], eax		; calculating z_0 = x + 130
	add [z + 0], 130		; z_0 = 8Ch (140d)

	mov [z + 4], ebx		; calculating z_1 = y + x - z_0
	add [z + 4], eax
	mov edx, [z + 0]
	sub [z + 4], edx		; z_1 = FF8Dh (-115d)

	mov [z + 8], ecx		; calculating z_2 = r + x - 13
	add [z + 8], eax
	sub [z + 8], 13			; z_2 = 1h (1d)

	invoke ExitProcess, 0

main1 endp
end main1
