; Lab 7e
.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
	Val1 SWORD 23
	Val2 SWORD -35
	Val3 SWORD 4

.code
main5 proc
	; calculating for EBX = (-Val1 + Val2) + (Val3 * 3)
	mov bx, Val3
	; since 4 * 3 = 12, i'm adding Val3 to bx two times
	add bx, Val3
	add bx, Val3
	add bx, Val2

	movsx ebx, bx
	sub bx, Val1
	; EBX = FFFFFFD2
	invoke ExitProcess, 0

main5 endp
end main5
