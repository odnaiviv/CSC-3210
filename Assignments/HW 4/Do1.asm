; Vivian Do
; Class: CSC 3210
; Assignment 4 Question 1
; This program will convert the given pseudocode into x86 assembly
; The given pseudocode will be written at the bottom of my code

.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
	sum WORD 0
	i WORD 0
	j WORD 12
	var1 WORD 3
	var2 WORD 3
	var3 WORD 0

.code
main1 proc
	mov eax, 0					; putting zeros in the register values
	mov ebx, 0
	mov ecx, 0
	mov edx, 0

	mov ax, i					; putting i into eax register
	mov bx, j					; putting j into ebx register
	mov cx, var1					; putting var1 into ecx register
	mov dx, var2					; putting var2 into edx register

	while_block:					; start of while loop
		cmp ax, 20
		jge endwhile_block			; jumping to end if i >= 20
		cmp bx, -2
		jle endwhile_block			; jumping to end if j <= -2
		jmp if_block

	if_block:					; if statement
		cmp cx, var3				; comparing var1 with var3
		jle elseif_block
		sub cx, ax				; var1 - i
		jmp continue

	elseif_block:					; else if statement
		cmp dx, var3				; comparing var2 with var3
		jge else_block
		add dx, bx				; var2 + j
		jmp continue

	else_block:					; else statement
		add var3, ax				; var3 + i
		jmp continue
		
	continue: 
		mov di, cx				; adding up the vars in edi register
		add di, dx
		add di, var3
		add ax, 1				; i + 1 or incrementing i
		sub bx, 1				; j - 1 or decrementing j
		jmp while_block				; looping back to beginning of while loop
		
	endwhile_block:					; putting edi register into sum
		mov sum, di
	
	invoke Exitprocess, 0
main1 endp
end main1

; given pseudocode from question 1
;
; sum = 0
; i = 0
; j = 12
; var1 = 3
; var2 = 3
; var3 = 0
; while ((i < 20) and (j > -2)) {
;	if (var1 > var3): 
;		var1 = var1 - i
;	else if (var2 < var3): 
;		var2 = var2 + j
;	else: 
;	var3 = var3 + i
; sum = var1 + var2 + var3
; i = i + 1
; j = j - 1
; }
