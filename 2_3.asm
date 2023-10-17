; addition of n first numbers divisible by 9

.386
.model flat,stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
	n dword 4
	result dword ?
	nine = 9
.code
	main proc
	mov eax, 0
	mov ebx, nine

Addition_Cycle:
	dec n
	add eax, ebx
	add ebx, nine
	cmp n, 0
	jne Addition_Cycle

	mov result, eax

	invoke ExitProcess,0
	main endp
	end main