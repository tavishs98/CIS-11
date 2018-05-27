; 5.9 Programming Exercises, Question 7 (32 bit)

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword
GetMaxXY	proto
RandomRange proto
Gotoxy		proto
WriteChar	proto
Delay		proto


.data
xVal BYTE ?
yVal BYTE ?
numberRows BYTE ?
numberCols BYTE ?

.code
main proc

	mov ecx, 100

	LOOP1:
			call GetMaxXY
			mov numberCols, dl							
			mov numberRows, al							
			
			mov al, numberCols
			inc al
			call RandomRange
			mov xVal, al

			mov al, numberRows
			inc al
			call RandomRange
			mov yVal, al

			mov dh, yVal
			mov dl, xVal
			call Gotoxy

			mov al,'A'
			call WriteChar

			mov eax,100
			call Delay
	LOOP LOOP1

	invoke ExitProcess,0
main endp
end main