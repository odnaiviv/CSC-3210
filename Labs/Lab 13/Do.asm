; Lab 13
.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
	array DWORD 10h, 20h, 30h, 40h, 50h			; given values
	sample DWORD 50h

.code
main proc
	mov ebx, sample								; EBX = item being searched in array
	mov esi, OFFSET array						; ESI = address of first item in array
	mov ecx, LENGTHOF array						; ECX = number of items in array
	mov edx, TYPE array							; size of each item in array

	call Search

	invoke ExitProcess, 0

main endp

Search proc
	push esi									; pushing register values into stack
	push ecx
	push edx
	mov eax, 0

	search_loop:
		cmp [esi], ebx							; comparing array values with sample value
		je search_found
		add esi, edx							; getting next value of array
		loop search_loop						; looping until ECX reaches 0 (end of array)

	not_found:
		mov eax, -1								; storing -1 in EAX register when item is not found
		jmp end_search

	search_found:
		mov eax, [esi]							; storing the value being searched in EAX register

	end_search:
		pop esi									; popping stack values back into register
		pop ecx
		pop edx

	ret
Search endp
end main
