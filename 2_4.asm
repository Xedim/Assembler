; Is number have more than k same digits 

.386
.model flat,stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
	num dword 30303123
	k dword 2
	decimal dword 10

	match_quotient dword ?
	match_remainder dword ?
	check_quotient dword ?

	x0_counter dword 0
	x1_counter dword 0
	x2_counter dword 0
	x3_counter dword 0
	x4_counter dword 0
	x5_counter dword 0
	x6_counter dword 0
	x7_counter dword 0
	x8_counter dword 0
	x9_counter dword 0
	result dword ?
	same_digits_counter dword 0

	const_2 dword 2
	more_same_digits_than_k byte 0

.code
	main proc
	mov eax, num
	mov match_quotient, eax

Match_Cycle:
	mov eax, match_quotient
	mov edx, 0
	div decimal
	mov match_quotient, eax
	mov match_remainder, edx
	cmp eax, 0
	je If_zero
	jmp Not_zeros
	If_zero:
		cmp edx, 0
		jne Not_zeros
		jmp End_of_Matching
	Not_zeros:
	mov eax, num
	Check_Cycle:
		mov edx, 0
		div decimal
		mov check_quotient, eax
		cmp edx, match_remainder
		je Same_Digits
		Continue_Checking:
		mov eax, check_quotient
		cmp eax, 0
		jne Check_Cycle
		jmp Continue_Matching
	Continue_Matching:
	jmp Match_Cycle

	End_of_Matching:
	jmp Zero_counters_checking
	Same_digits_comp:
	mov eax, k
	cmp same_digits_counter, eax
	setg more_same_digits_than_k
	jmp End_of_code

Same_Digits:
	cmp edx, 0
	je x0_counting
	cmp edx, 1
	je x1_counting
	cmp edx, 2
	je x2_counting
	cmp edx, 3
	je x3_counting
	cmp edx, 4
	je x4_counting
	cmp edx, 5
	je x5_counting
	cmp edx, 6
	je x6_counting
	cmp edx, 7
	je x7_counting
	cmp edx, 8
	je x8_counting
	cmp edx, 9
	je x9_counting

x0_counting:
	inc x0_counter
	jmp Continue_Checking
x1_counting:
	inc x1_counter
	jmp Continue_Checking
x2_counting:
	inc x2_counter
	jmp Continue_Checking
x3_counting:
	inc x3_counter
	jmp Continue_Checking
x4_counting:
	inc x4_counter
	jmp Continue_Checking
x5_counting:
	inc x5_counter
	jmp Continue_Checking
x6_counting:
	inc x6_counter
	jmp Continue_Checking
x7_counting:
	inc x7_counter
	jmp Continue_Checking
x8_counting:
	inc x8_counter
	jmp Continue_Checking
x9_counting:
	inc x9_counter
	jmp Continue_Checking

Zero_counters_checking:	
	mov eax, x0_counter
	cmp eax, 0
	jne x0_same_digits
	Continue_zero_checking_0:
	mov eax, x1_counter
	cmp eax, 0
	jne x1_same_digits
	Continue_zero_checking_1:
	mov eax, x2_counter
	cmp eax, 0
	jne x2_same_digits
	Continue_zero_checking_2:
	mov eax, x3_counter
	cmp eax, 0
	jne x3_same_digits
	Continue_zero_checking_3:
	mov eax, x4_counter
	cmp eax, 0
	jne x4_same_digits
	Continue_zero_checking_4:
	mov eax, x5_counter
	cmp eax, 0
	jne x5_same_digits
	Continue_zero_checking_5:
	mov eax, x6_counter
	cmp eax, 0
	jne x6_same_digits
	Continue_zero_checking_6:
	mov eax, x7_counter
	cmp eax, 0
	jne x7_same_digits
	Continue_zero_checking_7:
	mov eax, x8_counter
	cmp eax, 0
	jne x8_same_digits
	Continue_zero_checking_8:
	mov eax, x9_counter
	cmp eax, 0
	jne x9_same_digits
	jmp Same_digits_comp

x0_same_digits:
	mov eax, x0_counter
	mov ebx, 0
	jmp Root_search
	Root_x0_searched:
	jmp Continue_zero_checking_0
x1_same_digits:
	mov eax, x1_counter	
	mov ebx, 1				
    jmp Root_search      
	Root_x1_searched:
	jmp Continue_zero_checking_1
x2_same_digits:
	mov eax, x2_counter
	mov ebx, 2  				
    jmp Root_search
	Root_x2_searched:
	jmp Continue_zero_checking_2
x3_same_digits:
	mov eax, x3_counter	
	mov ebx, 3				
    jmp Root_search            
	Root_x3_searched:
	jmp Continue_zero_checking_3
x4_same_digits:
	mov eax, x4_counter		
	mov ebx, 4						
    jmp Root_search         
	Root_x4_searched:
	jmp Continue_zero_checking_4
x5_same_digits:
	mov eax, x5_counter		
	mov ebx, 5						
    jmp Root_search         
	Root_x5_searched:
	jmp Continue_zero_checking_5
x6_same_digits:
	mov eax, x6_counter		
	mov ebx, 6						
    jmp Root_search         
	Root_x6_searched:
	jmp Continue_zero_checking_6
x7_same_digits:
	mov eax, x7_counter		
	mov ebx, 7						
    jmp Root_search         
	Root_x7_searched:
	jmp Continue_zero_checking_7
x8_same_digits:
	mov eax, x8_counter		
	mov ebx, 8						
    jmp Root_search        
	Root_x8_searched:
	jmp Continue_zero_checking_8
x9_same_digits:
	mov eax, x9_counter		
	mov ebx, 9						
    jmp Root_search       
	Root_x9_searched:
	jmp Same_digits_comp

Root_search:
	cmp eax, 1
	je Do_nothing
	cmp eax, 4
	je Add_2
	cmp eax, 9
	je Add_3
	cmp eax, 16
	je Add_4
	cmp eax, 25
	je Add_5
	cmp eax, 36
	je Add_6
	cmp eax, 49
	je Add_7
	cmp eax, 64
	je Add_8
	cmp eax, 81
	je Add_9
	cmp eax, 100
	je Add_10

Do_nothing:
	cmp ebx, 0
	je Root_x0_searched
	cmp ebx, 1
	je Root_x1_searched
	cmp ebx, 2
	je Root_x2_searched
	cmp ebx, 3
	je Root_x3_searched
	cmp ebx, 4
	je Root_x4_searched
	cmp ebx, 5
	je Root_x5_searched
	cmp ebx, 6
	je Root_x6_searched
	cmp ebx, 7
	je Root_x7_searched
	cmp ebx, 8
	je Root_x8_searched
	cmp ebx, 9
	je Root_x9_searched

Add_2:
	add same_digits_counter, 2
	cmp ebx, 0
	je Root_x0_searched
	cmp ebx, 1
	je Root_x1_searched
	cmp ebx, 2
	je Root_x2_searched
	cmp ebx, 3
	je Root_x3_searched
	cmp ebx, 4
	je Root_x4_searched
	cmp ebx, 5
	je Root_x5_searched
	cmp ebx, 6
	je Root_x6_searched
	cmp ebx, 7
	je Root_x7_searched
	cmp ebx, 8
	je Root_x8_searched
	cmp ebx, 9
	je Root_x9_searched

Add_3:
	add same_digits_counter, 3
	cmp ebx, 0
	je Root_x0_searched
	cmp ebx, 1
	je Root_x1_searched
	cmp ebx, 2
	je Root_x2_searched
	cmp ebx, 3
	je Root_x3_searched
	cmp ebx, 4
	je Root_x4_searched
	cmp ebx, 5
	je Root_x5_searched
	cmp ebx, 6
	je Root_x6_searched
	cmp ebx, 7
	je Root_x7_searched
	cmp ebx, 8
	je Root_x8_searched
	cmp ebx, 9
	je Root_x9_searched

Add_4:
	add same_digits_counter, 4
	cmp ebx, 0
	je Root_x0_searched
	cmp ebx, 1
	je Root_x1_searched
	cmp ebx, 2
	je Root_x2_searched
	cmp ebx, 3
	je Root_x3_searched
	cmp ebx, 4
	je Root_x4_searched
	cmp ebx, 5
	je Root_x5_searched
	cmp ebx, 6
	je Root_x6_searched
	cmp ebx, 7
	je Root_x7_searched
	cmp ebx, 8
	je Root_x8_searched
	cmp ebx, 9
	je Root_x9_searched

Add_5:
	add same_digits_counter, 5
	cmp ebx, 0
	je Root_x0_searched
	cmp ebx, 1
	je Root_x1_searched
	cmp ebx, 2
	je Root_x2_searched
	cmp ebx, 3
	je Root_x3_searched
	cmp ebx, 4
	je Root_x4_searched
	cmp ebx, 5
	je Root_x5_searched
	cmp ebx, 6
	je Root_x6_searched
	cmp ebx, 7
	je Root_x7_searched
	cmp ebx, 8
	je Root_x8_searched
	cmp ebx, 9
	je Root_x9_searched

Add_6:
	add same_digits_counter, 6
	cmp ebx, 0
	je Root_x0_searched
	cmp ebx, 1
	je Root_x1_searched
	cmp ebx, 2
	je Root_x2_searched
	cmp ebx, 3
	je Root_x3_searched
	cmp ebx, 4
	je Root_x4_searched
	cmp ebx, 5
	je Root_x5_searched
	cmp ebx, 6
	je Root_x6_searched
	cmp ebx, 7
	je Root_x7_searched
	cmp ebx, 8
	je Root_x8_searched
	cmp ebx, 9
	je Root_x9_searched

Add_7:
	add same_digits_counter, 7
	cmp ebx, 0
	je Root_x0_searched
	cmp ebx, 1
	je Root_x1_searched
	cmp ebx, 2
	je Root_x2_searched
	cmp ebx, 3
	je Root_x3_searched
	cmp ebx, 4
	je Root_x4_searched
	cmp ebx, 5
	je Root_x5_searched
	cmp ebx, 6
	je Root_x6_searched
	cmp ebx, 7
	je Root_x7_searched
	cmp ebx, 8
	je Root_x8_searched
	cmp ebx, 9
	je Root_x9_searched

Add_8:
	add same_digits_counter, 8
	cmp ebx, 0
	je Root_x0_searched
	cmp ebx, 1
	je Root_x1_searched
	cmp ebx, 2
	je Root_x2_searched
	cmp ebx, 3
	je Root_x3_searched
	cmp ebx, 4
	je Root_x4_searched
	cmp ebx, 5
	je Root_x5_searched
	cmp ebx, 6
	je Root_x6_searched
	cmp ebx, 7
	je Root_x7_searched
	cmp ebx, 8
	je Root_x8_searched
	cmp ebx, 9
	je Root_x9_searched

Add_9:
	add same_digits_counter, 9
	cmp ebx, 0
	je Root_x0_searched
	cmp ebx, 1
	je Root_x1_searched
	cmp ebx, 2
	je Root_x2_searched
	cmp ebx, 3
	je Root_x3_searched
	cmp ebx, 4
	je Root_x4_searched
	cmp ebx, 5
	je Root_x5_searched
	cmp ebx, 6
	je Root_x6_searched
	cmp ebx, 7
	je Root_x7_searched
	cmp ebx, 8
	je Root_x8_searched
	cmp ebx, 9
	je Root_x9_searched

Add_10:
	add same_digits_counter, 10
	cmp ebx, 0
	je Root_x0_searched
	cmp ebx, 1
	je Root_x1_searched
	cmp ebx, 2
	je Root_x2_searched
	cmp ebx, 3
	je Root_x3_searched
	cmp ebx, 4
	je Root_x4_searched
	cmp ebx, 5
	je Root_x5_searched
	cmp ebx, 6
	je Root_x6_searched
	cmp ebx, 7
	je Root_x7_searched
	cmp ebx, 8
	je Root_x8_searched
	cmp ebx, 9
	je Root_x9_searched
End_of_code:
	invoke ExitProcess,0
	main endp
	end main