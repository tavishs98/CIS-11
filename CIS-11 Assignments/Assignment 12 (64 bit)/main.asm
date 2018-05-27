; Chapter 4, Section 4.10 Programming Exercises: Question 8 (64 bit)
ExitProcess PROTO

.data
myArray	   QWORD 10d,20d,30d,40d
finalArray QWORD 4 DUP(0)

.code
main proc

	mov rcx, LENGTHOF myArray
	mov rsi, 0
	mov r15, TYPE myArray

	LOOP1:
		
		mov rax, rsi
		mul r15
		mov rdx, QWORD PTR myArray[rax]	

		cmp rsi, 3
		je HandleLast

		mov QWORD PTR finalArray[rax + r15], rdx
		jmp EndLoop

		HandleLast:
		mov QWORD PTR finalArray[0], rdx

		EndLoop:
		inc rsi
	LOOP LOOP1

	call ExitProcess
main endp
end