; Chess. Knight x Rook

.386
.model flat,stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
	rank_length dword 8
	file_length dword 8

	rook_x dword 5
	rook_y dword 6
	knight_x dword 6
	knight_y dword 6

	err_miss_board dword 0
	err_same_position dword 0



	distance_x sdword ?
	quad_distance_x dword ?
	distance_y sdword ?
	quad_distance_y dword ?
	knight_quad_beat_distance dword 5

	knight_beats_rook dword 0
	rook_beats_knight dword 0
	nobody_beat dword 0

.code
	main proc

	mov eax, rook_x
	cmp eax, rank_length
	jge If_Err_Miss
	mov eax, rook_y
	cmp eax, file_length
	jge If_Err_Miss
	mov eax, knight_x
	cmp eax, rank_length
	jge If_Err_Miss
	mov eax, knight_y
	cmp eax, file_length
	jge If_Err_Miss

	mov eax, rook_x
	cmp eax, knight_x
	je If_same_x

	Continue0:
	mov eax, rook_x
	cmp knight_x, eax
	je If_rook_rank_beat
	Continue1:
	mov eax, rook_y
	cmp knight_y, eax
	je If_rook_file_beat
	Continue2:
	mov eax, rook_x
	sub eax, knight_x
	mov distance_x, eax
	mul eax
	mov quad_distance_x, eax

	mov eax, rook_y
	sub eax, knight_y
	mov distance_y, eax
	mul eax
	mov quad_distance_y, eax

	add eax, quad_distance_x
	cmp eax, knight_quad_beat_distance
	je If_knight_beats

	Continue3:
	mov eax, rook_beats_knight
	cmp eax, knight_beats_rook
	je If_nobody_beat
	jmp End_of_code


If_Err_Miss:
	mov eax, 1
	mov err_miss_board, eax
	jmp End_of_code

If_same_x:
	mov eax, rook_y
	cmp eax, knight_y
	je If_same_y
	jmp Continue0
	If_same_y:
		mov eax, 1
		mov err_same_position, eax
		jmp End_of_code

If_rook_rank_beat:
	mov eax, 1
	mov rook_beats_knight, eax
	jmp Continue1

If_rook_file_beat:
	mov eax, 1
	mov rook_beats_knight, eax
	jmp Continue2

If_knight_beats:
	mov eax, 1
	mov knight_beats_rook, eax
	jmp Continue3

If_nobody_beat:
	mov eax, 1
	mov nobody_beat, eax
	jmp End_of_code

End_of_code:
	invoke ExitProcess,0
	main endp
	end main