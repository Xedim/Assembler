; addition of n first numbers divisible by 9

.model flat, C
.data 
	nine = 9

	result dword ?
.code
sum_div9 proc
	mov ecx, eax
	mov eax, 0
	mov ebx, nine

Addition_Cycle:
	add eax, ebx
	add ebx, nine
	loop Addition_Cycle

	mov result, eax
	ret

sum_div9 endp
end 