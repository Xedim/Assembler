; Comparing 2 logical expressions

.386
.model flat,stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
	la dword 1
	lb dword 0
	lc dword 1
	ld dword 1

	temp sdword ?
	a_or_b sdword ?
	not_c sdword ?
	not_d sdword ?
	t sdword ?
	s sdword ?
	a_or_b_not sdword ?
	result byte ?

.code
	main proc
	mov eax, la
	or eax, lb
	mov a_or_b, eax

	mov eax, lc
	xor eax, 1
	mov not_c, eax
	mov eax, ld
	xor eax, 1
	mov not_d, eax
	or eax, not_c
	and eax, a_or_b
	xor eax, 1
	mov t, eax

	mov eax, a_or_b
	xor eax, 1
	mov a_or_b_not, eax
	mov eax, lc
	and eax, ld
	or eax, a_or_b_not
	mov s, eax

	cmp eax, t
	sete result

	invoke ExitProcess,0
	main endp
	end main
