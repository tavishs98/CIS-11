; 6.11.2 Programming Exercises, Questions 5 & 6 (32 bit)
.386
.model flat,stdcall
.stack 4096
INCLUDE Irvine32.inc

.data
msgMenu BYTE "---- Boolean Calculator ----",0dh,0ah
	BYTE 0dh,0ah
	BYTE "1. x AND y"     ,0dh,0ah
	BYTE "2. x OR y"      ,0dh,0ah
	BYTE "3. NOT x"       ,0dh,0ah
	BYTE "4. x XOR y"     ,0dh,0ah
	BYTE "5. Exit program",0

msgAND BYTE "Boolean AND",0
msgOR  BYTE "Boolean OR",0
msgNOT BYTE "Boolean NOT",0
msgXOR BYTE "Boolean XOR",0

msgInteger1 BYTE "Enter the first 32-bit hexadecimal integer:  ",0
msgInteger2 BYTE "Enter the second 32-bit hexadecimal integer: ",0
msgResult   BYTE "The 32-bit hexadecimal result is:            ",0

caseTable BYTE '1'
	DWORD AND_op
EntrySize = ($ - caseTable )
	BYTE '2'
	DWORD OR_op
	BYTE '3'
	DWORD NOT_op
	BYTE '4'
	DWORD XOR_op
	BYTE '5'
	DWORD ExitProgram
NumberOfEntries = ($ - caseTable) / EntrySize

.code
main PROC
	call Clrscr

Menu:
	mov edx, OFFSET msgMenu
	call WriteString
	call Crlf

L1:	call ReadChar
	cmp al, '5'
	ja L1
	cmp al, '1'
	jb L1

	call Crlf
	call ChooseProcedure
	jc quit

	call Crlf
	jmp Menu

quit: exit
main ENDP

ChooseProcedure PROC

	push ebx
	push ecx

	mov ebx, OFFSET caseTable
	mov ecx, NumberOfEntries

L1:	cmp al, [ebx]
	jne L2
	call NEAR PTR [ebx + 1]
	jmp L3

L2:	add ebx, EntrySize
	loop L1

L3:	pop ecx
	pop ebx

	ret

ChooseProcedure ENDP

AND_op PROC

	pushad

	mov edx, OFFSET msgAND
	call WriteString
	call Crlf
	call Crlf

	mov edx, OFFSET msgInteger1
	call WriteString
	call ReadHex
	mov ebx, eax

	mov edx, OFFSET msgInteger2
	call WriteString
	call ReadHex

	and eax, ebx

	mov edx, OFFSET msgResult
	call WriteString
	call WriteHex
	call Crlf

	popad
	ret

AND_op ENDP

OR_op PROC

	pushad

	mov edx, OFFSET msgOR
	call WriteString
	call Crlf
	call Crlf

	mov edx, OFFSET msgInteger1
	call WriteString
	call ReadHex
	mov ebx, eax

	mov edx, OFFSET msgInteger2
	call WriteString
	call ReadHex

	or eax, ebx

	mov edx, OFFSET msgResult
	call WriteString
	call WriteHex
	call Crlf

	popad
	ret
OR_op ENDP

NOT_op PROC

	pushad

	mov edx, OFFSET msgNOT
	call WriteString
	call Crlf
	call Crlf

	mov edx, OFFSET msgInteger1
	call WriteString
	call ReadHex

	not eax

	mov edx, OFFSET msgResult
	call WriteString
	call WriteHex
	call Crlf

	popad
	ret

NOT_op ENDP

XOR_op PROC

	pushad

	mov edx, OFFSET msgXOR
	call WriteString
	call Crlf
	call Crlf

	mov edx, OFFSET msgInteger1
	call WriteString
	call ReadHex
	mov ebx, eax

	mov edx, OFFSET msgInteger2
	call WriteString
	call ReadHex

	xor eax, ebx

	mov edx, OFFSET msgResult
	call WriteString
	call WriteHex
	call Crlf

	popad
	ret

XOR_op ENDP

ExitProgram PROC

	stc
	ret

ExitProgram ENDP

END main