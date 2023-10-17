; Sum of array elements divisible by 3 or 5

.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
	array dword 15, 29, 67, 5, 33
	five dword 5
	three dword 3
	
	result dword ?

.code
main proc
	mov edi, OFFSET array
	mov ecx, LENGTHOF array
	mov ebx, 0

Sum_of_divisible:
	mov edx, 0
	mov eax, [edi]
	div three
	cmp edx, 0
	jne Not_divisisble_by_3
	add ebx, [edi]
	jmp Not_divisisble_by_5
	Not_divisisble_by_3:
	mov edx, 0
	mov eax, [edi]
	div five
	cmp edx, 0
	jne Not_divisisble_by_5
	add ebx, [edi]	
	Not_divisisble_by_5:
	add edi, TYPE array
	loop Sum_of_divisible

	mov result, ebx

invoke ExitProcess, 0
main endp 
end main