; Setting bits

.386
.model flat,stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
	number dword 1

	result dword ?

.code
	main proc
	mov eax, number
	bts eax, 15
	bts eax, 7
	mov result, eax

	invoke ExitProcess,0
	main endp
	end main