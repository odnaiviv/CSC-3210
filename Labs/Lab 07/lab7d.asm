; Lab 7d
.386
.model flat, stdcall
.stack 4096
ExitProcess proto dwExitCode:dword

.data
	arrayB WORD 1,2,3,4

.code
main4 proc
	mov ax, arrayB

	xchg ax, [arrayB + 6]		; swapping element in arrayB (1) with element in arrayB + 6 (4)
	mov arrayB, ax
	mov cx, [arrayB + 6]

	mov ax, [arrayB + 2]		; swapping element in arrayB + 2 (2) with element in arrayB + 4 (3)
	xchg ax, [arrayB + 4]
	mov [arrayB + 2], ax

	mov ax, arrayB			; checking to see if the elements are swapped by putting them back in register
	mov bx, [arrayB + 2]
	mov cx, [arrayB + 4]
	mov dx, [arrayB + 6]

	invoke ExitProcess, 0

main4 endp
end main4
