; Vivian Do
; Class: CSC 3210
; Assignment 4 Question 2
; This program will test if MSB in al register is set
; If set, al is divided by 8 using shift and exiting; if not set, al is multiplied by 4 using shift and exiting

.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.code
main2 proc
	mov eax, 0					; putting zeros in the register values
	mov al, 88h

	test al, 1000000b				; bit masking to check MSB
	jnz msb_set					; msb is set
	sal al, 2					; msb is not set

	msb_set: 
		sar al, 3

	invoke Exitprocess, 0				; End Results: AL = F1
main2 endp
end main2
