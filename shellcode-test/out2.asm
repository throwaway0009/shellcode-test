; Listing generated by Microsoft (R) Optimizing Compiler Version 19.29.30133.0 

PUBLIC	?find_module@native@@YAPEAXI@Z			; native::find_module
PUBLIC	??$r_hash@_W@@YAIPEA_W@Z				; r_hash<wchar_t>
PUBLIC	?find_function@native@@YAPEAXPEAXI@Z	; native::find_function
PUBLIC	??$r_hash@D@@YAIPEAD@Z					; r_hash<char>
PUBLIC	main

PUBLIC  AlignRSP
_TEXT SEGMENT
	AlignRSP PROC
	push rsi									; Preserve RSI since we're stomping on it
	mov  rsi, rsp								; Save the value of RSP so it can be restored
	and  rsp, 0FFFFFFFFFFFFFFF0h				; Align RSP to 16 bytes
	sub  rsp, 020h								; Allocate homing space for ExecutePayload
	call main									; Call the entry point of the payload
	mov  rsp, rsi								; Restore the original value of RSP
	pop  rsi									; Restore RSI
	ret											; Return to caller
	AlignRSP ENDP
_TEXT ENDS

_TEXT	SEGMENT
main	PROC
; File E:\projects\_playground_\shellcode-test\shellcode-test\main.cpp
; Line 10
$LN15:
	mov	QWORD PTR [rsp+8], rbx
	mov	QWORD PTR [rsp+16], rsi
	push	rdi
	sub	rsp, 32					; 00000020H
; File E:\projects\_playground_\shellcode-test\shellcode-test\native.h
; Line 14
	mov	rax, QWORD PTR gs:[96]
; Line 23
	xor	edi, edi
	mov	rcx, QWORD PTR [rax+24]
	mov	rbx, QWORD PTR [rcx+16]
	mov	rsi, rbx
$LL6@main:
; Line 29
	mov	rcx, QWORD PTR [rbx+96]
	call	??$r_hash@_W@@YAIPEA_W@Z		; r_hash<wchar_t>
	cmp	eax, -1432507371			; aa9dac15H
	je	SHORT $LN11@main
; Line 33
	mov	rbx, QWORD PTR [rbx]
; Line 35
	test	rbx, rbx
	je	SHORT $LN3@main
	cmp	rbx, rsi
	jne	SHORT $LL6@main
; Line 37
	jmp	SHORT $LN3@main
$LN11@main:
; Line 30
	mov	rdi, QWORD PTR [rbx+48]
$LN3@main:
; File E:\projects\_playground_\shellcode-test\shellcode-test\main.cpp
; Line 17
	mov	edx, 1723602811				; 66bc177bH
	mov	rcx, rdi
	call	?find_function@native@@YAPEAXPEAXI@Z	; native::find_function
; Line 20
	CALL after_$SG92197
$SG92197 DB	'user32.dll', 00H
	ORG $+1
after_$SG92197:
	POP  rcx

; 	lea	rcx, OFFSET FLAT:$SG92197
	call	rax
	mov	rcx, rax
	mov	edx, 1844401716				; 6def5634H
	call	?find_function@native@@YAPEAXPEAXI@Z	; native::find_function
; Line 23
	xor	r9d, r9d
	CALL after_$SG92198
$SG92198 DB	'bar', 00H
after_$SG92198:
	POP  r8

; 	lea	r8, OFFSET FLAT:$SG92198
	CALL after_$SG92199
$SG92199 DB	'foo', 00H
after_$SG92199:
	POP  rdx

; 	lea	rdx, OFFSET FLAT:$SG92199
	xor	ecx, ecx
	call	rax
; Line 24
	mov	rbx, QWORD PTR [rsp+48]
	xor	eax, eax
	mov	rsi, QWORD PTR [rsp+56]
	add	rsp, 32					; 00000020H
	pop	rdi
	ret	0
main	ENDP
_TEXT	ENDS
; Function compile flags: /Ogspy
;	COMDAT ??$r_hash@D@@YAIPEAD@Z
_TEXT	SEGMENT
str$ = 48
??$r_hash@D@@YAIPEAD@Z PROC				; r_hash<char>, COMDAT
; File E:\projects\_playground_\shellcode-test\shellcode-test\hash.h
; Line 17
$LN6:
	push	rbx
	sub	rsp, 32					; 00000020H
; Line 18
	cmp	BYTE PTR [rcx], 0
	mov	rbx, rcx
	je	SHORT $LN3@r_hash
	inc	rcx
	call	??$r_hash@D@@YAIPEAD@Z			; r_hash<char>
	imul	edx, eax, 33				; 00000021H
	movsx	eax, BYTE PTR [rbx]
	add	eax, edx
	jmp	SHORT $LN4@r_hash
$LN3@r_hash:
	mov	eax, 5381				; 00001505H
$LN4@r_hash:
; Line 19
	add	rsp, 32					; 00000020H
	pop	rbx
	ret	0
??$r_hash@D@@YAIPEAD@Z ENDP				; r_hash<char>
_TEXT	ENDS
; Function compile flags: /Ogspy
;	COMDAT ?find_function@native@@YAPEAXPEAXI@Z
_TEXT	SEGMENT
mod$ = 64
hash$ = 72
?find_function@native@@YAPEAXPEAXI@Z PROC		; native::find_function, COMDAT
; File E:\projects\_playground_\shellcode-test\shellcode-test\native.h
; Line 41
$LN13:
	mov	QWORD PTR [rsp+8], rbx
	mov	QWORD PTR [rsp+16], rbp
	mov	QWORD PTR [rsp+24], rsi
	push	rdi
	push	r14
	push	r15
	sub	rsp, 32					; 00000020H
; Line 44
	movsxd	rax, DWORD PTR [rcx+60]
; Line 51
	xor	esi, esi
	mov	r15d, edx
	mov	rbx, rcx
	mov	edi, DWORD PTR [rax+rcx+136]
	add	rdi, rcx
	cmp	DWORD PTR [rdi+24], esi
	jbe	SHORT $LN3@find_funct
	mov	r14d, DWORD PTR [rdi+32]
$LL4@find_funct:
; Line 54
	lea	rax, QWORD PTR [r14+rsi*4]
; Line 57
	mov	ecx, DWORD PTR [rax+rbx]
	add	rcx, rbx
	call	??$r_hash@D@@YAIPEAD@Z			; r_hash<char>
	cmp	eax, r15d
	je	SHORT $LN8@find_funct
; Line 51
	inc	esi
	cmp	esi, DWORD PTR [rdi+24]
	jb	SHORT $LL4@find_funct
$LN3@find_funct:
; Line 68
	xor	eax, eax
$LN1@find_funct:
; Line 69
	mov	rbx, QWORD PTR [rsp+64]
	mov	rbp, QWORD PTR [rsp+72]
	mov	rsi, QWORD PTR [rsp+80]
	add	rsp, 32					; 00000020H
	pop	r15
	pop	r14
	pop	rdi
	ret	0
$LN8@find_funct:
; Line 60
	mov	ecx, DWORD PTR [rdi+36]
	add	rcx, rbx
; Line 61
	movzx	edx, WORD PTR [rcx+rsi*2]
	mov	ecx, DWORD PTR [rdi+28]
	add	rcx, rbx
; Line 64
	mov	eax, DWORD PTR [rcx+rdx*4]
	add	rax, rbx
	jmp	SHORT $LN1@find_funct
?find_function@native@@YAPEAXPEAXI@Z ENDP		; native::find_function
_TEXT	ENDS
; Function compile flags: /Ogspy
;	COMDAT ??$r_hash@_W@@YAIPEA_W@Z
_TEXT	SEGMENT
str$ = 48
??$r_hash@_W@@YAIPEA_W@Z PROC				; r_hash<wchar_t>, COMDAT
; File E:\projects\_playground_\shellcode-test\shellcode-test\hash.h
; Line 17
$LN6:
	push	rbx
	sub	rsp, 32					; 00000020H
; Line 18
	cmp	WORD PTR [rcx], 0
	mov	rbx, rcx
	je	SHORT $LN3@r_hash
	add	rcx, 2
	call	??$r_hash@_W@@YAIPEA_W@Z		; r_hash<wchar_t>
	imul	edx, eax, 33				; 00000021H
	movzx	eax, WORD PTR [rbx]
	add	eax, edx
	jmp	SHORT $LN4@r_hash
$LN3@r_hash:
	mov	eax, 5381				; 00001505H
$LN4@r_hash:
; Line 19
	add	rsp, 32					; 00000020H
	pop	rbx
	ret	0
??$r_hash@_W@@YAIPEA_W@Z ENDP				; r_hash<wchar_t>
_TEXT	ENDS
END
