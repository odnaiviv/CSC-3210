; Lab 12
.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
	array1 BYTE 13h, 14h, 15h, 16h						; array elements as 1 byte long
	array2 BYTE 12h, 13h, 14h, 15h
	length1 = LENGTHOF array1							; length 1 & 2 as symbolic constants
	length2 = LENGTHOF array2
	sample1 BYTE 30h									; sample 1 & 2 as 1 byte long, initialized with 30h and 5h respectively
	sample2 BYTE 5h
	maxlength BYTE ?									; maxlength as 1 byte long, uninitialized
	index BYTE 0										; index as 1 byte long, initialized with 0
	expl WORD ?											; expl as 2 bytes long

.code
main proc
	mov eax, 0											; putting zeros in the register values
	mov ebx, 0

	mov al, length1
	mov bl, length2

	cmp al, bl											; finding the max length of arrays, storing the largest in maxlength
	jge next
	mov maxlength, bl
	jmp continue

	next: 
		mov maxlength, al

	continue: 
		mov esi, DWORD PTR index						; storing index in esi register
		mov ecx, DWORD PTR maxlength					; storing maxlength in ecx register

	while_loop:											; start of while loop
		cmp esi, ecx									; comparing index and maxlength
		jge end_while
		jmp if_block

		if_block:
			mov al, array1[esi * (TYPE array1)]	
			cmp al, array2[esi * (TYPE array2)]			; comparing array1[index] and array2[index]
			jle else_block

			mov edx, 0									; calculating for expl
			mov al, array2[esi * (TYPE array2)]			; multiplying array2 index with sample2
			mul sample2
			mov bx, ax
			mov al, array1[esi * (TYPE array1)]			; multiplying array1 index with sample1
			mul sample1
			cmp bx, 0									; checking if divisor is 0, then it will jump to else_block
			je else_block
			div bx										; dividing bx to ax
			mov expl, ax								; storing quotient in expl
			jmp end_if

	else_block:
		mov expl, 0

	end_if:
		inc esi											; incrementing index by 1
		jmp while_loop

	end_while:

	invoke ExitProcess, 0

main endp
end main


; pseudo code for lab 12
; 
; array1 13h, 14h, 15h, 16h
; array2 12h, 13h, 14h, 15h
; length1 = number of items in array1
; length2 = number of items in array2
; sample1 = 30h
; sample2 = 5h
; maxlength = max of length1 and length2
; index = 0;
; while (index < maxlength) {
;	if (array1[index] > array2[index])
;		expl = (array1[index] * sample1) / (array2[index] * sample2)
;		//only store the quotient of the divions in expl
;	else
;	expl = 0
;	index = index + 1
; }
