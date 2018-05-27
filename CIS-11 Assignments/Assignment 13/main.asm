; Assignment 13 (64 bit)
ExitProcess proto
WriteInt64 proto
Crlf proto

.data
myArray QWORD 10,3,3,9,5,4,2,8,1

.code
main proc
	
	;print the array
	mov rcx, LENGTHOF myArray
	mov rsi, 0
	LOOP1:
		mov rax, myArray[rsi * 8]
		call WriteInt64
		inc rsi
	LOOP LOOP1
	call Crlf

	;bubble sort array
	mov rcx, LENGTHOF myArray

	OUTERLOOP:
		push rcx
		mov r15, rcx   ;save outer loop counter
		mov rcx, LENGTHOF myArray
		dec rcx
		mov rsi, 0
		INNERLOOP:
			mov r9, myArray[rsi * 8]
			mov r11, rsi
			inc r11
			mov r10, myArray[r11 * 8]
			cmp r9,r10
			jle ENDLOOP
			SWAP:
				mov r13,r9
				mov myArray[rsi * 8],r10
				mov myArray[r11 * 8],r13
		
			ENDLOOP:
			inc rsi
		LOOP INNERLOOP
		mov rcx, r15
	LOOP OUTERLOOP



	
	;print the array
	mov rcx, LENGTHOF myArray
	mov rsi, 0
	LOOP2:
		mov rax, myArray[rsi * 8]
		call WriteInt64
		inc rsi

	LOOP LOOP2

	call ExitProcess
main endp
end