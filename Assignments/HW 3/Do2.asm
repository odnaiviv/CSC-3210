; Vivian Do
; Class: CSC 3210
; Assignment 3 Question 2
; This program will use a loop to reverse the elements of the array

.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
	inputStr BYTE "ABCDEFGH"				; creating given array as BYTE, but all in one string

.code
main2 proc
	mov esi, 0						; putting zeros in the register value
	mov edi, 0

	mov esi, OFFSET inputStr				; moving beginning of array to esi
	mov edi, esi						; moving end of array to edi
	add edi, SIZEOF inputStr

	mov ecx, LENGTHOF inputStr / 2				; setting counter for loop

	L1:							; loop
		mov al, [esi]					; putting first and last element in eax and ebx register respectively
		mov bl, [edi]

		xchg bl, al					; swapping elements and putting elements back into array
		mov [edi], bl
		mov [esi], al

		add esi, TYPE inputStr				; switching target element
		sub edi, TYPE inputStr

		loop L1

	invoke Exitprocess, 0
main2 endp
end main2
