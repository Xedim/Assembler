; Make array of min sums of matrix columns

.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
	matrix  dword 33, 65, 75, 42, 25
			dword 29, 85, 16, 90, 34
			dword 34, 66, 74, 41, 14
			dword 60, 45, 43, 17, 19

	Row_size dword ($ - matrix) / (4 * TYPE dword)
	Column_size dword ($ - matrix) / (5 * TYPE dword)

	first_min_index dword 0
	row_index dword 0
	Min_Sums dword ?, ?, ?, ?


.code
	main proc
	mov edi, OFFSET matrix
	mov eax, [edi]
	mov ecx, Row_size
	mov esi, 0

First_Min:  mov edx, ecx
			dec edx
			mov ebx, [edi + edx * TYPE dword]
			cmp ebx, eax
			jg Min_Stay_1
			mov eax, ebx
			mov first_min_index, ecx
			Min_Stay_1:
			loop First_Min

			mov ebx, OFFSET Min_Sums
			mov [ebx + esi * TYPE dword], eax
			mov ecx, Row_size
			mov eax, [edi]

Second_Min:	mov edx, ecx
			dec edx
			mov ebx, [edi + edx * TYPE dword]
			cmp ebx, eax
			jg Min_Stay_2
			cmp first_min_index, ecx
			je Min_Stay_2
			mov eax, ebx
			Min_Stay_2:
			loop Second_Min

			mov ebx, OFFSET Min_Sums
			add [ebx + esi * TYPE dword], eax
			inc esi
			mov row_index, esi
			cmp esi, Column_size
			je Min_Sums_formed
			mov ecx, Row_size
			mov eax, TYPE dword
			mul ecx
			add edi, eax
			mov eax, [edi]
			jmp First_Min
			Min_Sums_formed:

	mov ecx, Column_size
	mov ebx, OFFSET Min_Sums
	mov esi, 0

Print_Min_Sums:	mov eax, [ebx + esi * TYPE dword]
				inc esi
				loop Print_Min_Sums

invoke ExitProcess, 0
main endp 
end main