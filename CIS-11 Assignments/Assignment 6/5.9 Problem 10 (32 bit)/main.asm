; 5.9 Programming Exercises, Questions 10 (32 bit)
.386
.model flat,stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
array DWORD 1,1
lastVal DWORD 2971215073
counter DWORD 47-2
.code
main PROC

  mov esi, OFFSET array
  add esi, TYPE array
  add esi, TYPE array
  mov ecx, counter

  LOOP1:
    call genFibonacci
    add esi, TYPE array
  Loop LOOP1

INVOKE ExitProcess,0
main ENDP

genFibonacci PROC
    mov eax,[esi-4]
    mov ebx,[esi-8]
    mov eax,ebx
    mov [esi],eax
    ret
genFibonacci ENDP

END main