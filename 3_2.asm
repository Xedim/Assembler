; Find min element of first array that second doesnt contain

.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
	array_1 dword 15, 33, 29, 3, 66
	Count_1 = ($ - array_1) / TYPE array_1
	array_2 dword 19, 22, 3, 15, 99, 22, 66
	Count_2 = ($ - array_2) / TYPE array_2

	result dword ?
.code
main proc
	mov ecx, Count_1
	dec ecx

BS1_array1: push ecx 
			mov esi, OFFSET array_1 

BS2_array1: mov eax, [esi] 
			cmp [esi+4], eax 
			jg BS3_array1
			xchg eax,[esi+4] 
			mov [esi], eax

BS3_array1: add esi,4
			loop BS2_array1
			pop ecx
			loop BS1_array1


	mov ecx, Count_2
	dec ecx

BS1_array2: push ecx 
			mov esi, OFFSET array_2 

BS2_array2: mov eax, [esi] 
			cmp [esi+4], eax 
			jg BS3_array2
			xchg eax,[esi+4] 
			mov [esi], eax

BS3_array2: add esi,4
			loop BS2_array2
			pop ecx
			loop BS1_array2

	mov eax, LENGTHOF array_1
	mov ebx, LENGTHOF array_2
	cmp eax, ebx
	jg Arr_1_greater
	mov ecx, LENGTHOF array_2
	jmp Ecx_Ready
	Arr_1_greater:
	mov ecx, LENGTHOF array_1
	Ecx_Ready:
	mov edi, OFFSET array_1
	mov eax, [edi]
	mov esi, OFFSET array_2
	mov ebx, [esi] 

Comparing_elements: cmp eax, ebx
					jl End_of_comparing
					jne If_Greater
					dec ecx
					add edi, TYPE array_1
					add esi, TYPE array_2
					mov eax, [edi]
					mov ebx, [esi]
					loop Comparing_elements
					If_Greater:
					add esi, TYPE array_2
					mov ebx, [esi]
					loop Comparing_elements

End_of_comparing:	mov result, eax 

invoke ExitProcess, 0
main endp 
end main