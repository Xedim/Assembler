; Sum of array elements divisible by 3 and 5

.model flat, C

.data
	five dword 5
	three dword 3
	result dword ?

.code
divisible_5x3 proc
	mov edi, ecx
	mov ecx, eax
	mov ebx, 0

Sum_of_divisible:
	mov edx, 0
	mov eax, [edi]
	div three
	cmp edx, 0
	jne Not_divisisble
	mov edx, 0
	mov eax, [edi]
	div five
	cmp edx, 0
	jne Not_divisisble
	add ebx, [edi]	
	Not_divisisble:
	add edi, 4
	loop Sum_of_divisible

	mov eax, ebx
	mov result, eax
	ret
divisible_5x3 endp 
end