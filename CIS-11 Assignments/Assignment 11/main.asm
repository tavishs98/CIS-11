; Section 4.10 Programming Exercises: Question 2 (32 bit)
.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword
.data
array dword 1,2,3,4,5,6,7,8
.code
main proc
  mov esi, OFFSET array
  mov ecx, LENGTHOF array -1
  
myLoop:

  MOV eax,[esi]
  XCHG eax,[esi+4]
  MOV [esi],eax

  add esi, TYPE array
  add esi, TYPE array

loop myLoop

  invoke ExitProcess,0
main endp
end main