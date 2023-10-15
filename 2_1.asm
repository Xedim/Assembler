; Branching. x1 < x2 > x3 > x4

.386
.model flat,stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
	x1 dword 22
	x2 dword 11
	x3 dword 5
	x4 dword 64

	temp dword ?

	result dword ?

.code
	main proc
	mov eax, x1
	cmp eax, x2
	jg DoIf_1
	continue_1:
	mov eax, x2
	cmp eax, x3
	jl DoIf_2
	continue_2:
	mov eax, x3
	cmp eax, x4
	jl DoIf_3
	continue_3:
	mov eax, x2
	cmp eax, x3
	jl DoIf_4
	continue_4:	
	jmp EndOfIf

DoIf_1:
	mov eax, x1
	mov temp, eax
	mov eax, x2
	mov x1, eax
	mov eax, temp
	mov x2, eax
	jmp continue_1

DoIf_2:
	mov eax, x2
	mov temp, eax
	mov eax, x3
	mov x2, eax
	mov eax, temp
	mov x3, eax	
	jmp continue_2

DoIf_3:
	mov eax, x3
	mov temp, eax
	mov eax, x4
	mov x3, eax
	mov eax, temp
	mov x4, eax
	jmp continue_3

DoIf_4:
	mov eax, x2
	mov temp, eax
	mov eax, x3
	mov x2, eax
	mov eax, temp
	mov x3, eax
	jmp continue_4

EndOfIf:
	invoke ExitProcess,0
	main endp
	end main