	.file	"test_wrap.c"
	.text
	.type	SWIG_TypeNameComp, @function
SWIG_TypeNameComp:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	%rcx, -32(%rbp)
	jmp	.L2
.L5:
	addq	$1, -8(%rbp)
.L3:
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$32, %al
	jne	.L6
	movq	-8(%rbp), %rax
	cmpq	-16(%rbp), %rax
	jne	.L5
	jmp	.L6
.L8:
	addq	$1, -24(%rbp)
.L6:
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$32, %al
	jne	.L7
	movq	-24(%rbp), %rax
	cmpq	-32(%rbp), %rax
	jne	.L8
.L7:
	movq	-8(%rbp), %rax
	movzbl	(%rax), %edx
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	%al, %dl
	je	.L9
	movq	-8(%rbp), %rax
	movzbl	(%rax), %edx
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	%al, %dl
	jle	.L10
	movl	$1, %eax
	jmp	.L12
.L10:
	movl	$-1, %eax
	jmp	.L12
.L9:
	addq	$1, -8(%rbp)
	addq	$1, -24(%rbp)
.L2:
	movq	-8(%rbp), %rax
	cmpq	-16(%rbp), %rax
	je	.L13
	movq	-24(%rbp), %rax
	cmpq	-32(%rbp), %rax
	jne	.L3
.L13:
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	movl	%eax, %ecx
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	subl	%eax, %ecx
	movl	%ecx, %eax
.L12:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	SWIG_TypeNameComp, .-SWIG_TypeNameComp
	.type	SWIG_TypeCmp, @function
SWIG_TypeCmp:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movl	$1, -20(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -8(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, -16(%rbp)
	jmp	.L16
.L22:
	movq	-16(%rbp), %rax
	movq	%rax, -40(%rbp)
	jmp	.L17
.L20:
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$124, %al
	je	.L24
	addq	$1, -16(%rbp)
.L17:
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L20
	jmp	.L19
.L24:
	nop
.L19:
	movq	-8(%rbp), %rcx
	movq	-48(%rbp), %rdx
	movq	-16(%rbp), %rsi
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	SWIG_TypeNameComp
	movl	%eax, -20(%rbp)
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L16
	addq	$1, -16(%rbp)
.L16:
	cmpl	$0, -20(%rbp)
	je	.L21
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L22
.L21:
	movl	-20(%rbp), %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	SWIG_TypeCmp, .-SWIG_TypeCmp
	.type	SWIG_TypeEquiv, @function
SWIG_TypeEquiv:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	SWIG_TypeCmp
	testl	%eax, %eax
	sete	%al
	movzbl	%al, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	SWIG_TypeEquiv, .-SWIG_TypeEquiv
	.type	SWIG_TypeCheck, @function
SWIG_TypeCheck:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	cmpq	$0, -32(%rbp)
	je	.L28
	movq	-32(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, -8(%rbp)
	jmp	.L29
.L35:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L30
	movq	-32(%rbp), %rax
	movq	24(%rax), %rax
	cmpq	-8(%rbp), %rax
	jne	.L31
	movq	-8(%rbp), %rax
	jmp	.L32
.L31:
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	movq	-8(%rbp), %rdx
	movq	16(%rdx), %rdx
	movq	%rdx, 16(%rax)
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L33
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	-8(%rbp), %rdx
	movq	24(%rdx), %rdx
	movq	%rdx, 24(%rax)
.L33:
	movq	-32(%rbp), %rax
	movq	24(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 16(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 24(%rax)
	movq	-32(%rbp), %rax
	movq	24(%rax), %rax
	testq	%rax, %rax
	je	.L34
	movq	-32(%rbp), %rax
	movq	24(%rax), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 24(%rax)
.L34:
	movq	-32(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 24(%rax)
	movq	-8(%rbp), %rax
	jmp	.L32
.L30:
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -8(%rbp)
.L29:
	cmpq	$0, -8(%rbp)
	jne	.L35
.L28:
	movl	$0, %eax
.L32:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	SWIG_TypeCheck, .-SWIG_TypeCheck
	.type	SWIG_TypeCheckStruct, @function
SWIG_TypeCheckStruct:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	cmpq	$0, -32(%rbp)
	je	.L37
	movq	-32(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, -8(%rbp)
	jmp	.L38
.L44:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpq	-24(%rbp), %rax
	jne	.L39
	movq	-32(%rbp), %rax
	movq	24(%rax), %rax
	cmpq	-8(%rbp), %rax
	jne	.L40
	movq	-8(%rbp), %rax
	jmp	.L41
.L40:
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	movq	-8(%rbp), %rdx
	movq	16(%rdx), %rdx
	movq	%rdx, 16(%rax)
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L42
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	-8(%rbp), %rdx
	movq	24(%rdx), %rdx
	movq	%rdx, 24(%rax)
.L42:
	movq	-32(%rbp), %rax
	movq	24(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 16(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 24(%rax)
	movq	-32(%rbp), %rax
	movq	24(%rax), %rax
	testq	%rax, %rax
	je	.L43
	movq	-32(%rbp), %rax
	movq	24(%rax), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 24(%rax)
.L43:
	movq	-32(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 24(%rax)
	movq	-8(%rbp), %rax
	jmp	.L41
.L39:
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -8(%rbp)
.L38:
	cmpq	$0, -8(%rbp)
	jne	.L44
.L37:
	movl	$0, %eax
.L41:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	SWIG_TypeCheckStruct, .-SWIG_TypeCheckStruct
	.type	SWIG_TypeCast, @function
SWIG_TypeCast:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L46
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L46
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	-24(%rbp), %rcx
	movq	-16(%rbp), %rdx
	movq	%rcx, %rsi
	movq	%rdx, %rdi
	call	*%rax
	jmp	.L47
.L46:
	movq	-16(%rbp), %rax
.L47:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	SWIG_TypeCast, .-SWIG_TypeCast
	.type	SWIG_TypeDynamicCast, @function
SWIG_TypeDynamicCast:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
	cmpq	$0, -24(%rbp)
	je	.L50
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	jne	.L53
.L50:
	movq	-24(%rbp), %rax
	jmp	.L52
.L55:
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, %rdi
	call	*%rax
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	je	.L53
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
.L53:
	cmpq	$0, -24(%rbp)
	je	.L54
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	jne	.L55
.L54:
	movq	-8(%rbp), %rax
.L52:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	SWIG_TypeDynamicCast, .-SWIG_TypeDynamicCast
	.type	SWIG_TypePrettyName, @function
SWIG_TypePrettyName:
.LFB10:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L57
	movl	$0, %eax
	jmp	.L58
.L57:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L59
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -8(%rbp)
	jmp	.L60
.L62:
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$124, %al
	jne	.L61
	movq	-8(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -16(%rbp)
.L61:
	addq	$1, -8(%rbp)
.L60:
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L62
	movq	-16(%rbp), %rax
	jmp	.L58
.L59:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
.L58:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	SWIG_TypePrettyName, .-SWIG_TypePrettyName
	.type	SWIG_TypeClientData, @function
SWIG_TypeClientData:
.LFB11:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	-24(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, 32(%rax)
	jmp	.L64
.L66:
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L65
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	32(%rax), %rax
	testq	%rax, %rax
	jne	.L65
	movq	-32(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	SWIG_TypeClientData
.L65:
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -16(%rbp)
.L64:
	cmpq	$0, -16(%rbp)
	jne	.L66
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	SWIG_TypeClientData, .-SWIG_TypeClientData
	.type	SWIG_TypeNewClientData, @function
SWIG_TypeNewClientData:
.LFB12:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	SWIG_TypeClientData
	movq	-8(%rbp), %rax
	movl	$1, 40(%rax)
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	SWIG_TypeNewClientData, .-SWIG_TypeNewClientData
	.type	SWIG_MangledTypeQueryModule, @function
SWIG_MangledTypeQueryModule:
.LFB13:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movq	%rdx, -72(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, -40(%rbp)
.L78:
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L69
	movq	$0, -32(%rbp)
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	subq	$1, %rax
	movq	%rax, -24(%rbp)
.L77:
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	shrq	%rax
	movq	%rax, -16(%rbp)
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	-16(%rbp), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L79
	movq	-8(%rbp), %rdx
	movq	-72(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	movl	%eax, -44(%rbp)
	cmpl	$0, -44(%rbp)
	jne	.L71
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	-16(%rbp), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	jmp	.L72
.L71:
	cmpl	$0, -44(%rbp)
	jns	.L73
	cmpq	$0, -16(%rbp)
	je	.L80
	movq	-16(%rbp), %rax
	subq	$1, %rax
	movq	%rax, -24(%rbp)
	jmp	.L76
.L73:
	cmpl	$0, -44(%rbp)
	jle	.L76
	movq	-16(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -32(%rbp)
.L76:
	movq	-32(%rbp), %rax
	cmpq	-24(%rbp), %rax
	jbe	.L77
	jmp	.L69
.L79:
	nop
	jmp	.L69
.L80:
	nop
.L69:
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	cmpq	-64(%rbp), %rax
	jne	.L78
	movl	$0, %eax
.L72:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	SWIG_MangledTypeQueryModule, .-SWIG_MangledTypeQueryModule
	.type	SWIG_TypeQueryModule, @function
SWIG_TypeQueryModule:
.LFB14:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%rdx, -56(%rbp)
	movq	-56(%rbp), %rdx
	movq	-48(%rbp), %rcx
	movq	-40(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_MangledTypeQueryModule
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L82
	movq	-8(%rbp), %rax
	jmp	.L83
.L82:
	movq	-40(%rbp), %rax
	movq	%rax, -24(%rbp)
.L87:
	movq	$0, -16(%rbp)
	jmp	.L84
.L86:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	-16(%rbp), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L85
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	-16(%rbp), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	movq	-56(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	SWIG_TypeEquiv
	testl	%eax, %eax
	je	.L85
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	-16(%rbp), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	jmp	.L83
.L85:
	addq	$1, -16(%rbp)
.L84:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	cmpq	-16(%rbp), %rax
	ja	.L86
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	cmpq	-48(%rbp), %rax
	jne	.L87
	movl	$0, %eax
.L83:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	SWIG_TypeQueryModule, .-SWIG_TypeQueryModule
	.type	SWIG_PackData, @function
SWIG_PackData:
.LFB15:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%rdx, -56(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -8(%rbp)
	jmp	.L89
.L90:
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	movb	%al, -17(%rbp)
	movq	-40(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -40(%rbp)
	movzbl	-17(%rbp), %edx
	shrb	$4, %dl
	movzbl	%dl, %edx
	movslq	%edx, %rcx
	leaq	hex.8200(%rip), %rdx
	movzbl	(%rcx,%rdx), %edx
	movb	%dl, (%rax)
	movq	-40(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -40(%rbp)
	movzbl	-17(%rbp), %edx
	andl	$15, %edx
	movslq	%edx, %rcx
	leaq	hex.8200(%rip), %rdx
	movzbl	(%rcx,%rdx), %edx
	movb	%dl, (%rax)
	addq	$1, -16(%rbp)
.L89:
	movq	-16(%rbp), %rax
	cmpq	-8(%rbp), %rax
	jne	.L90
	movq	-40(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	SWIG_PackData, .-SWIG_PackData
	.type	SWIG_UnpackData, @function
SWIG_UnpackData:
.LFB16:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%rdx, -56(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -8(%rbp)
	jmp	.L93
.L101:
	movq	-40(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -40(%rbp)
	movzbl	(%rax), %eax
	movb	%al, -17(%rbp)
	cmpb	$47, -17(%rbp)
	jle	.L94
	cmpb	$57, -17(%rbp)
	jg	.L94
	movzbl	-17(%rbp), %eax
	subl	$48, %eax
	sall	$4, %eax
	movb	%al, -18(%rbp)
	jmp	.L95
.L94:
	cmpb	$96, -17(%rbp)
	jle	.L96
	cmpb	$102, -17(%rbp)
	jg	.L96
	movzbl	-17(%rbp), %eax
	subl	$87, %eax
	sall	$4, %eax
	movb	%al, -18(%rbp)
	jmp	.L95
.L96:
	movl	$0, %eax
	jmp	.L97
.L95:
	movq	-40(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -40(%rbp)
	movzbl	(%rax), %eax
	movb	%al, -17(%rbp)
	cmpb	$47, -17(%rbp)
	jle	.L98
	cmpb	$57, -17(%rbp)
	jg	.L98
	movzbl	-17(%rbp), %eax
	subl	$48, %eax
	orb	%al, -18(%rbp)
	jmp	.L99
.L98:
	cmpb	$96, -17(%rbp)
	jle	.L100
	cmpb	$102, -17(%rbp)
	jg	.L100
	movzbl	-17(%rbp), %eax
	subl	$87, %eax
	orb	%al, -18(%rbp)
	jmp	.L99
.L100:
	movl	$0, %eax
	jmp	.L97
.L99:
	movq	-16(%rbp), %rax
	movzbl	-18(%rbp), %edx
	movb	%dl, (%rax)
	addq	$1, -16(%rbp)
.L93:
	movq	-16(%rbp), %rax
	cmpq	-8(%rbp), %rax
	jne	.L101
	movq	-40(%rbp), %rax
.L97:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	SWIG_UnpackData, .-SWIG_UnpackData
	.type	SWIG_PackVoidPtr, @function
SWIG_PackVoidPtr:
.LFB17:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%rcx, -48(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
	cmpq	$17, -48(%rbp)
	ja	.L103
	movl	$0, %eax
	jmp	.L104
.L103:
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movb	$95, (%rax)
	leaq	-32(%rbp), %rcx
	movq	-8(%rbp), %rax
	movl	$8, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_PackData
	movq	%rax, -8(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	leaq	1(%rax), %rcx
	movq	-8(%rbp), %rdx
	movq	-24(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
	subq	%rdx, %rax
	cmpq	%rax, %rcx
	jbe	.L105
	movl	$0, %eax
	jmp	.L104
.L105:
	movq	-40(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	movq	-24(%rbp), %rax
.L104:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	SWIG_PackVoidPtr, .-SWIG_PackVoidPtr
	.section	.rodata
.LC0:
	.string	"NULL"
	.text
	.type	SWIG_UnpackVoidPtr, @function
SWIG_UnpackVoidPtr:
.LFB18:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$95, %al
	je	.L107
	movq	-8(%rbp), %rax
	leaq	.LC0(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L108
	movq	-16(%rbp), %rax
	movq	$0, (%rax)
	movq	-24(%rbp), %rax
	jmp	.L109
.L108:
	movl	$0, %eax
	jmp	.L109
.L107:
	addq	$1, -8(%rbp)
	movq	-16(%rbp), %rcx
	movq	-8(%rbp), %rax
	movl	$8, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_UnpackData
.L109:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE18:
	.size	SWIG_UnpackVoidPtr, .-SWIG_UnpackVoidPtr
	.type	SWIG_PackDataName, @function
SWIG_PackDataName:
.LFB19:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%rcx, -48(%rbp)
	movq	%r8, -56(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -16(%rbp)
	cmpq	$0, -48(%rbp)
	je	.L111
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	jmp	.L112
.L111:
	movl	$0, %eax
.L112:
	movq	%rax, -8(%rbp)
	movq	-40(%rbp), %rax
	addq	$1, %rax
	leaq	(%rax,%rax), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	cmpq	-56(%rbp), %rax
	jbe	.L113
	movl	$0, %eax
	jmp	.L114
.L113:
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -16(%rbp)
	movb	$95, (%rax)
	movq	-40(%rbp), %rdx
	movq	-32(%rbp), %rcx
	movq	-16(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_PackData
	movq	%rax, -16(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L115
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	-48(%rbp), %rcx
	movq	-16(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncpy@PLT
	jmp	.L116
.L115:
	movq	-16(%rbp), %rax
	movb	$0, (%rax)
.L116:
	movq	-24(%rbp), %rax
.L114:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE19:
	.size	SWIG_PackDataName, .-SWIG_PackDataName
	.type	SWIG_UnpackDataName, @function
SWIG_UnpackDataName:
.LFB20:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	%rcx, -32(%rbp)
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$95, %al
	je	.L118
	movq	-8(%rbp), %rax
	leaq	.LC0(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L119
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movq	-32(%rbp), %rax
	jmp	.L120
.L119:
	movl	$0, %eax
	jmp	.L120
.L118:
	addq	$1, -8(%rbp)
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rcx
	movq	-8(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_UnpackData
.L120:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE20:
	.size	SWIG_UnpackDataName, .-SWIG_UnpackDataName
	.section	.rodata
.LC1:
	.string	"MemoryError"
.LC2:
	.string	"IOError"
.LC3:
	.string	"RuntimeError"
.LC4:
	.string	"IndexError"
.LC5:
	.string	"TypeError"
.LC6:
	.string	"ZeroDivisionError"
.LC7:
	.string	"OverflowError"
.LC8:
	.string	"SyntaxError"
.LC9:
	.string	"ValueError"
.LC10:
	.string	"SystemError"
.LC11:
	.string	"AttributeError"
	.text
	.type	SWIG_Tcl_ErrorType, @function
SWIG_Tcl_ErrorType:
.LFB21:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	movq	$0, -8(%rbp)
	movl	-20(%rbp), %eax
	addl	$12, %eax
	cmpl	$10, %eax
	ja	.L122
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L124(%rip), %rax
	movl	(%rdx,%rax), %eax
	movslq	%eax, %rdx
	leaq	.L124(%rip), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L124:
	.long	.L123-.L124
	.long	.L125-.L124
	.long	.L126-.L124
	.long	.L127-.L124
	.long	.L128-.L124
	.long	.L129-.L124
	.long	.L130-.L124
	.long	.L131-.L124
	.long	.L132-.L124
	.long	.L133-.L124
	.long	.L134-.L124
	.text
.L123:
	leaq	.LC1(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L135
.L134:
	leaq	.LC2(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L135
.L133:
	leaq	.LC3(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L135
.L132:
	leaq	.LC4(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L135
.L131:
	leaq	.LC5(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L135
.L130:
	leaq	.LC6(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L135
.L129:
	leaq	.LC7(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L135
.L128:
	leaq	.LC8(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L135
.L127:
	leaq	.LC9(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L135
.L126:
	leaq	.LC10(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L135
.L125:
	leaq	.LC11(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L135
.L122:
	leaq	.LC3(%rip), %rax
	movq	%rax, -8(%rbp)
.L135:
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE21:
	.size	SWIG_Tcl_ErrorType, .-SWIG_Tcl_ErrorType
	.section	.rodata
.LC12:
	.string	"SWIG"
	.text
	.type	SWIG_Tcl_SetErrorObj, @function
SWIG_Tcl_SetErrorObj:
.LFB22:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	Tcl_ResetResult@PLT
	movq	-24(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	Tcl_SetObjResult@PLT
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movl	$0, %ecx
	leaq	.LC12(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	Tcl_SetErrorCode@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE22:
	.size	SWIG_Tcl_SetErrorObj, .-SWIG_Tcl_SetErrorObj
	.section	.rodata
.LC13:
	.string	" "
	.text
	.type	SWIG_Tcl_SetErrorMsg, @function
SWIG_Tcl_SetErrorMsg:
.LFB23:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	Tcl_ResetResult@PLT
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movl	$0, %ecx
	leaq	.LC12(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	Tcl_SetErrorCode@PLT
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rsi
	movq	-8(%rbp), %rax
	movl	$0, %r8d
	movq	%rdx, %rcx
	leaq	.LC13(%rip), %rdx
	movq	%rax, %rdi
	movl	$0, %eax
	call	Tcl_AppendResult@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE23:
	.size	SWIG_Tcl_SetErrorMsg, .-SWIG_Tcl_SetErrorMsg
	.local	swigconstTable
	.comm	swigconstTable,88,32
	.local	swigconstTableinit
	.comm	swigconstTableinit,4,4
	.type	SWIG_Tcl_SetConstantObj, @function
SWIG_Tcl_SetConstantObj:
.LFB25:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	-32(%rbp), %rax
	movl	$-1, %esi
	movq	%rax, %rdi
	call	Tcl_NewStringObj@PLT
	movq	%rax, %rsi
	movq	-40(%rbp), %rdx
	movq	-24(%rbp), %rax
	movl	$1, %r8d
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	Tcl_ObjSetVar2@PLT
	movq	72+swigconstTable(%rip), %rax
	leaq	-12(%rbp), %rdx
	movq	-32(%rbp), %rcx
	movq	%rcx, %rsi
	leaq	swigconstTable(%rip), %rdi
	call	*%rax
	movq	%rax, %rdx
	movq	-40(%rbp), %rax
	movq	%rax, 24(%rdx)
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L140
	call	__stack_chk_fail@PLT
.L140:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE25:
	.size	SWIG_Tcl_SetConstantObj, .-SWIG_Tcl_SetConstantObj
	.type	SWIG_Tcl_GetConstantObj, @function
SWIG_Tcl_GetConstantObj:
.LFB26:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	swigconstTableinit(%rip), %eax
	testl	%eax, %eax
	jne	.L142
	movl	$0, %eax
	jmp	.L143
.L142:
	movq	64+swigconstTable(%rip), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, %rsi
	leaq	swigconstTable(%rip), %rdi
	call	*%rax
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L144
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	jmp	.L143
.L144:
	movl	$0, %eax
.L143:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE26:
	.size	SWIG_Tcl_GetConstantObj, .-SWIG_Tcl_GetConstantObj
	.type	SWIG_Tcl_ObjectTable, @function
SWIG_Tcl_ObjectTable:
.LFB27:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	swigobjectTableinit.8387(%rip), %eax
	testl	%eax, %eax
	jne	.L146
	movl	$1, %esi
	leaq	swigobjectTable.8386(%rip), %rdi
	call	Tcl_InitHashTable@PLT
	movl	$1, swigobjectTableinit.8387(%rip)
.L146:
	leaq	swigobjectTable.8386(%rip), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE27:
	.size	SWIG_Tcl_ObjectTable, .-SWIG_Tcl_ObjectTable
	.type	SWIG_Tcl_Acquire, @function
SWIG_Tcl_Acquire:
.LFB28:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -40(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	call	SWIG_Tcl_ObjectTable
	movq	72(%rax), %rbx
	call	SWIG_Tcl_ObjectTable
	movq	%rax, %rcx
	leaq	-28(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rax, %rsi
	movq	%rcx, %rdi
	call	*%rbx
	nop
	movq	-24(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L149
	call	__stack_chk_fail@PLT
.L149:
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE28:
	.size	SWIG_Tcl_Acquire, .-SWIG_Tcl_Acquire
	.type	SWIG_Tcl_Thisown, @function
SWIG_Tcl_Thisown:
.LFB29:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -24(%rbp)
	call	SWIG_Tcl_ObjectTable
	movq	64(%rax), %rbx
	call	SWIG_Tcl_ObjectTable
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	*%rbx
	testq	%rax, %rax
	je	.L151
	movl	$1, %eax
	jmp	.L152
.L151:
	movl	$0, %eax
.L152:
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE29:
	.size	SWIG_Tcl_Thisown, .-SWIG_Tcl_Thisown
	.type	SWIG_Tcl_Disown, @function
SWIG_Tcl_Disown:
.LFB30:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -40(%rbp)
	call	SWIG_Tcl_ObjectTable
	movq	64(%rax), %rbx
	call	SWIG_Tcl_ObjectTable
	movq	%rax, %rdx
	movq	-40(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	*%rbx
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	je	.L154
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	Tcl_DeleteHashEntry@PLT
	movl	$1, %eax
	jmp	.L155
.L154:
	movl	$0, %eax
.L155:
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE30:
	.size	SWIG_Tcl_Disown, .-SWIG_Tcl_Disown
	.section	.rodata
.LC14:
	.string	"info commands "
.LC15:
	.string	" cget -this"
.LC16:
	.string	"test_wrap.c"
.LC17:
	.string	"!newmemory"
	.text
	.type	SWIG_Tcl_ConvertPtrFromString, @function
SWIG_Tcl_ConvertPtrFromString:
.LFB31:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%rdx, -56(%rbp)
	movq	%rcx, -64(%rbp)
	movl	%r8d, -68(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	jmp	.L157
.L167:
	movq	-56(%rbp), %rax
	movq	$0, (%rax)
	movq	-48(%rbp), %rax
	leaq	.LC0(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L158
	movl	-68(%rbp), %eax
	andl	$4, %eax
	testl	%eax, %eax
	je	.L159
	movl	$-13, %eax
	jmp	.L161
.L159:
	movl	$0, %eax
	jmp	.L161
.L158:
	movq	-48(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L162
	movl	$-1, %eax
	jmp	.L161
.L162:
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rax
	movl	$0, %ecx
	leaq	.LC14(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	Tcl_VarEval@PLT
	testl	%eax, %eax
	jne	.L163
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	Tcl_GetObjResult@PLT
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	Tcl_GetStringFromObj@PLT
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L165
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	Tcl_ResetResult@PLT
	movl	$-1, %eax
	jmp	.L161
.L163:
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	Tcl_ResetResult@PLT
	movl	$-1, %eax
	jmp	.L161
.L165:
	movq	-48(%rbp), %rsi
	movq	-40(%rbp), %rax
	movl	$0, %ecx
	leaq	.LC15(%rip), %rdx
	movq	%rax, %rdi
	movl	$0, %eax
	call	Tcl_VarEval@PLT
	testl	%eax, %eax
	je	.L166
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	Tcl_ResetResult@PLT
	movl	$-1, %eax
	jmp	.L161
.L166:
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	Tcl_GetObjResult@PLT
	movl	$0, %esi
	movq	%rax, %rdi
	call	Tcl_GetStringFromObj@PLT
	movq	%rax, -48(%rbp)
.L157:
	movq	-48(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$95, %al
	jne	.L167
	addq	$1, -48(%rbp)
	movq	-56(%rbp), %rcx
	movq	-48(%rbp), %rax
	movl	$8, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_UnpackData
	movq	%rax, -48(%rbp)
	cmpq	$0, -64(%rbp)
	je	.L168
	cmpq	$0, -48(%rbp)
	je	.L169
	movq	-64(%rbp), %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	SWIG_TypeCheck
	jmp	.L170
.L169:
	movl	$0, %eax
.L170:
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L171
	movl	$-1, %eax
	jmp	.L161
.L171:
	movl	-68(%rbp), %eax
	andl	$1, %eax
	testl	%eax, %eax
	je	.L172
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	SWIG_Tcl_Disown
.L172:
	movl	$0, -28(%rbp)
	movq	-56(%rbp), %rax
	movq	(%rax), %rcx
	leaq	-28(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_TypeCast
	movq	%rax, %rdx
	movq	-56(%rbp), %rax
	movq	%rdx, (%rax)
	movl	-28(%rbp), %eax
	testl	%eax, %eax
	je	.L168
	leaq	__PRETTY_FUNCTION__.8412(%rip), %rcx
	movl	$1098, %edx
	leaq	.LC16(%rip), %rsi
	leaq	.LC17(%rip), %rdi
	call	__assert_fail@PLT
.L168:
	movl	$0, %eax
.L161:
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L174
	call	__stack_chk_fail@PLT
.L174:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE31:
	.size	SWIG_Tcl_ConvertPtrFromString, .-SWIG_Tcl_ConvertPtrFromString
	.type	SWIG_Tcl_ConvertPtr, @function
SWIG_Tcl_ConvertPtr:
.LFB32:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	%rcx, -32(%rbp)
	movl	%r8d, -36(%rbp)
	movq	-16(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	Tcl_GetStringFromObj@PLT
	movq	%rax, %rdi
	movl	-36(%rbp), %esi
	movq	-32(%rbp), %rcx
	movq	-24(%rbp), %rdx
	movq	-8(%rbp), %rax
	movl	%esi, %r8d
	movq	%rdi, %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_ConvertPtrFromString
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE32:
	.size	SWIG_Tcl_ConvertPtr, .-SWIG_Tcl_ConvertPtr
	.type	SWIG_Tcl_PointerTypeFromString, @function
SWIG_Tcl_PointerTypeFromString:
.LFB33:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$95, %al
	je	.L178
	movl	$0, %eax
	jmp	.L179
.L178:
	addq	$1, -24(%rbp)
	jmp	.L180
.L184:
	cmpb	$47, -1(%rbp)
	jle	.L181
	cmpb	$57, -1(%rbp)
	jle	.L182
.L181:
	cmpb	$96, -1(%rbp)
	jle	.L183
	cmpb	$102, -1(%rbp)
	jg	.L183
.L182:
	addq	$1, -24(%rbp)
.L180:
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	movb	%al, -1(%rbp)
	cmpb	$0, -1(%rbp)
	jne	.L184
.L183:
	movq	-24(%rbp), %rax
.L179:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE33:
	.size	SWIG_Tcl_PointerTypeFromString, .-SWIG_Tcl_PointerTypeFromString
	.type	SWIG_Tcl_ConvertPacked, @function
SWIG_Tcl_ConvertPacked:
.LFB34:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movl	%ecx, -44(%rbp)
	movq	%r8, -56(%rbp)
	cmpq	$0, -32(%rbp)
	je	.L191
	movq	-32(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	Tcl_GetStringFromObj@PLT
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$95, %al
	jne	.L192
	addq	$1, -16(%rbp)
	movl	-44(%rbp), %eax
	movslq	%eax, %rdx
	movq	-40(%rbp), %rcx
	movq	-16(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_UnpackData
	movq	%rax, -16(%rbp)
	cmpq	$0, -56(%rbp)
	je	.L189
	movq	-56(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	SWIG_TypeCheck
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L193
.L189:
	movl	$0, %eax
	jmp	.L190
.L191:
	nop
	jmp	.L187
.L192:
	nop
	jmp	.L187
.L193:
	nop
.L187:
	movl	$-1, %eax
.L190:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE34:
	.size	SWIG_Tcl_ConvertPacked, .-SWIG_Tcl_ConvertPacked
	.type	SWIG_Tcl_MakePtr, @function
SWIG_Tcl_MakePtr:
.LFB35:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movl	%ecx, -28(%rbp)
	movq	-16(%rbp), %rax
	testq	%rax, %rax
	je	.L195
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movb	$95, (%rax)
	leaq	-16(%rbp), %rcx
	movq	-8(%rbp), %rax
	movl	$8, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_PackData
	movq	%rax, -8(%rbp)
	movq	-24(%rbp), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	jmp	.L197
.L195:
	movq	-8(%rbp), %rax
	movl	$1280070990, (%rax)
	movb	$0, 4(%rax)
.L197:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE35:
	.size	SWIG_Tcl_MakePtr, .-SWIG_Tcl_MakePtr
	.type	SWIG_Tcl_NewPointerObj, @function
SWIG_Tcl_NewPointerObj:
.LFB36:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$1088, %rsp
	movq	%rdi, -1064(%rbp)
	movq	%rsi, -1072(%rbp)
	movl	%edx, -1076(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	-1076(%rbp), %ecx
	movq	-1072(%rbp), %rdx
	movq	-1064(%rbp), %rsi
	leaq	-1040(%rbp), %rax
	movq	%rax, %rdi
	call	SWIG_Tcl_MakePtr
	leaq	-1040(%rbp), %rax
	movl	$-1, %esi
	movq	%rax, %rdi
	call	Tcl_NewStringObj@PLT
	movq	%rax, -1048(%rbp)
	movq	-1048(%rbp), %rax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L200
	call	__stack_chk_fail@PLT
.L200:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE36:
	.size	SWIG_Tcl_NewPointerObj, .-SWIG_Tcl_NewPointerObj
	.type	SWIG_Tcl_NewPackedObj, @function
SWIG_Tcl_NewPackedObj:
.LFB37:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$1096, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -1080(%rbp)
	movl	%esi, -1084(%rbp)
	movq	%rdx, -1096(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	leaq	-1056(%rbp), %rax
	movq	%rax, -1064(%rbp)
	movl	-1084(%rbp), %eax
	addl	%eax, %eax
	addl	$1, %eax
	movslq	%eax, %rbx
	movq	-1096(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	addq	%rbx, %rax
	cmpq	$1000, %rax
	jbe	.L202
	movl	$0, %eax
	jmp	.L204
.L202:
	movq	-1064(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -1064(%rbp)
	movb	$95, (%rax)
	movl	-1084(%rbp), %eax
	movslq	%eax, %rdx
	movq	-1080(%rbp), %rcx
	movq	-1064(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_PackData
	movq	%rax, -1064(%rbp)
	movq	-1096(%rbp), %rax
	movq	(%rax), %rdx
	movq	-1064(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	leaq	-1056(%rbp), %rax
	movl	$-1, %esi
	movq	%rax, %rdi
	call	Tcl_NewStringObj@PLT
.L204:
	movq	-24(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L205
	call	__stack_chk_fail@PLT
.L205:
	addq	$1096, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE37:
	.size	SWIG_Tcl_NewPackedObj, .-SWIG_Tcl_NewPackedObj
	.section	.rodata
	.align 8
.LC18:
	.string	"swig_runtime_data_type_pointer4"
	.text
	.type	SWIG_Tcl_GetModule, @function
SWIG_Tcl_GetModule:
.LFB38:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -24(%rbp)
	movq	-40(%rbp), %rax
	movl	$1, %ecx
	movl	$0, %edx
	leaq	.LC18(%rip), %rsi
	movq	%rax, %rdi
	call	Tcl_GetVar2@PLT
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	je	.L207
	leaq	-24(%rbp), %rcx
	movq	-16(%rbp), %rax
	movl	$8, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_UnpackData
.L207:
	movq	-24(%rbp), %rax
	movq	-8(%rbp), %rdx
	xorq	%fs:40, %rdx
	je	.L209
	call	__stack_chk_fail@PLT
.L209:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE38:
	.size	SWIG_Tcl_GetModule, .-SWIG_Tcl_GetModule
	.type	SWIG_Tcl_SetModule, @function
SWIG_Tcl_SetModule:
.LFB39:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$1072, %rsp
	movq	%rdi, -1064(%rbp)
	movq	%rsi, -1072(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-1072(%rbp), %rcx
	leaq	-1040(%rbp), %rax
	movl	$8, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_PackData
	movq	%rax, -1048(%rbp)
	movq	-1048(%rbp), %rax
	movb	$0, (%rax)
	leaq	-1040(%rbp), %rdx
	movq	-1064(%rbp), %rax
	movl	$1, %r8d
	movq	%rdx, %rcx
	movl	$0, %edx
	leaq	.LC18(%rip), %rsi
	movq	%rax, %rdi
	call	Tcl_SetVar2@PLT
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L211
	call	__stack_chk_fail@PLT
.L211:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE39:
	.size	SWIG_Tcl_SetModule, .-SWIG_Tcl_SetModule
	.type	SWIG_Tcl_ObjectDelete, @function
SWIG_Tcl_ObjectDelete:
.LFB40:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	je	.L217
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	testl	%eax, %eax
	je	.L215
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rdi
	call	SWIG_Tcl_Disown
	testl	%eax, %eax
	je	.L215
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	24(%rax), %rax
	testq	%rax, %rax
	je	.L215
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	24(%rax), %rax
	movq	-16(%rbp), %rdx
	movq	8(%rdx), %rdx
	movq	%rdx, %rdi
	call	*%rax
.L215:
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	leal	-1(%rax), %ecx
	movq	-8(%rbp), %rdx
	movl	%ecx, (%rdx)
	cmpl	$1, %eax
	jg	.L216
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	TclFreeObj@PLT
.L216:
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	jmp	.L212
.L217:
	nop
.L212:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE40:
	.size	SWIG_Tcl_ObjectDelete, .-SWIG_Tcl_ObjectDelete
	.section	.rodata
.LC19:
	.string	"wrong # args."
.LC20:
	.string	"-acquire"
.LC21:
	.string	"-disown"
.LC22:
	.string	"-delete"
.LC23:
	.string	"cget"
.LC24:
	.string	"-this"
.LC25:
	.string	"-thisown"
.LC26:
	.string	"1"
.LC27:
	.string	"0"
.LC28:
	.string	"configure"
.LC29:
	.string	"Invalid attribute name."
	.align 8
.LC30:
	.string	"Invalid method. Must be one of: configure cget -acquire -disown -delete"
	.text
	.type	SWIG_Tcl_MethodCommand, @function
SWIG_Tcl_MethodCommand:
.LFB41:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$992, %rsp
	movq	%rdi, -968(%rbp)
	movq	%rsi, -976(%rbp)
	movl	%edx, -980(%rbp)
	movq	%rcx, -992(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	-968(%rbp), %rax
	movq	%rax, -896(%rbp)
	movl	$0, -948(%rbp)
	movl	$2, -944(%rbp)
	movq	-992(%rbp), %rax
	movq	%rax, -888(%rbp)
	cmpl	$1, -980(%rbp)
	jg	.L219
	movq	-976(%rbp), %rax
	movl	$0, %edx
	leaq	.LC19(%rip), %rsi
	movq	%rax, %rdi
	call	Tcl_SetResult@PLT
	movl	$1, %eax
	jmp	.L266
.L219:
	movq	-888(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	Tcl_GetStringFromObj@PLT
	movq	%rax, -880(%rbp)
	movq	-880(%rbp), %rax
	leaq	.LC20(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L221
	movq	-896(%rbp), %rax
	movl	$1, 24(%rax)
	movq	-896(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rdi
	call	SWIG_Tcl_Acquire
	movl	$0, %eax
	jmp	.L266
.L221:
	movq	-880(%rbp), %rax
	leaq	.LC21(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L222
	movq	-896(%rbp), %rax
	movl	24(%rax), %eax
	testl	%eax, %eax
	je	.L223
	movq	-896(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rdi
	call	SWIG_Tcl_Disown
.L223:
	movq	-896(%rbp), %rax
	movl	$0, 24(%rax)
	movl	$0, %eax
	jmp	.L266
.L222:
	movq	-880(%rbp), %rax
	leaq	.LC22(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L224
	movq	-896(%rbp), %rax
	movq	32(%rax), %rdx
	movq	-976(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	Tcl_DeleteCommandFromToken@PLT
	movl	$0, %eax
	jmp	.L266
.L224:
	movq	-896(%rbp), %rax
	movq	16(%rax), %rdx
	movl	-948(%rbp), %eax
	cltq
	movq	%rdx, -528(%rbp,%rax,8)
	movl	-948(%rbp), %eax
	cltq
	movl	$-1, -784(%rbp,%rax,4)
.L252:
	movl	-948(%rbp), %eax
	cltq
	movl	-784(%rbp,%rax,4), %eax
	movl	%eax, -940(%rbp)
	movl	-948(%rbp), %eax
	cltq
	movq	-528(%rbp,%rax,8), %rax
	movq	%rax, -912(%rbp)
	cmpl	$-1, -940(%rbp)
	je	.L225
	movq	-912(%rbp), %rax
	movq	48(%rax), %rax
	movl	-940(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L226
	movq	-912(%rbp), %rax
	movq	56(%rax), %rax
	movl	-940(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L226
	movq	-912(%rbp), %rax
	movq	56(%rax), %rax
	movl	-940(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movq	-912(%rbp), %rax
	movq	64(%rax), %rcx
	movq	-912(%rbp), %rax
	movq	64(%rax), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_TypeQueryModule
	movq	%rax, -872(%rbp)
	cmpq	$0, -872(%rbp)
	je	.L226
	movq	-912(%rbp), %rax
	movq	48(%rax), %rax
	movl	-940(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rax, %rdx
	movq	-872(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, (%rdx)
.L226:
	movq	-912(%rbp), %rax
	movq	48(%rax), %rax
	movl	-940(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, -912(%rbp)
	cmpq	$0, -912(%rbp)
	je	.L225
	movl	-948(%rbp), %eax
	cltq
	movl	-784(%rbp,%rax,4), %eax
	leal	1(%rax), %edx
	movl	-948(%rbp), %eax
	cltq
	movl	%edx, -784(%rbp,%rax,4)
	addl	$1, -948(%rbp)
	movl	-948(%rbp), %eax
	cltq
	movq	-912(%rbp), %rdx
	movq	%rdx, -528(%rbp,%rax,8)
	movl	-948(%rbp), %eax
	cltq
	movl	$-1, -784(%rbp,%rax,4)
	jmp	.L227
.L225:
	cmpq	$0, -912(%rbp)
	jne	.L228
	subl	$1, -948(%rbp)
	cmpl	$0, -948(%rbp)
	jns	.L269
	jmp	.L268
.L228:
	movl	-948(%rbp), %eax
	cltq
	movl	-784(%rbp,%rax,4), %eax
	leal	1(%rax), %edx
	movl	-948(%rbp), %eax
	cltq
	movl	%edx, -784(%rbp,%rax,4)
	movq	-912(%rbp), %rax
	movq	136(%rax), %rax
	movq	-912(%rbp), %rdx
	leaq	72(%rdx), %rcx
	movq	-880(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rcx, %rdi
	call	*%rax
	movq	%rax, -848(%rbp)
	cmpq	$0, -848(%rbp)
	je	.L231
	movq	-848(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, -808(%rbp)
	movq	-808(%rbp), %rax
	movq	%rax, -800(%rbp)
	movq	-888(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -832(%rbp)
	movq	-888(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	-896(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, (%rdx)
	movq	-896(%rbp), %rax
	movq	(%rax), %rax
	movl	(%rax), %edx
	addl	$1, %edx
	movl	%edx, (%rax)
	movq	-888(%rbp), %rcx
	movl	-980(%rbp), %edx
	movq	-976(%rbp), %rsi
	movq	-968(%rbp), %rdi
	movq	-800(%rbp), %rax
	call	*%rax
	movl	%eax, -932(%rbp)
	movq	-888(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	-832(%rbp), %rax
	movq	%rax, (%rdx)
	movq	-896(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -792(%rbp)
	movq	-792(%rbp), %rax
	movl	(%rax), %eax
	leal	-1(%rax), %ecx
	movq	-792(%rbp), %rdx
	movl	%ecx, (%rdx)
	cmpl	$1, %eax
	jg	.L232
	movq	-792(%rbp), %rax
	movq	%rax, %rdi
	call	TclFreeObj@PLT
.L232:
	movl	-932(%rbp), %eax
	jmp	.L266
.L231:
	movq	-880(%rbp), %rax
	leaq	.LC23(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L233
	cmpl	$2, -980(%rbp)
	jg	.L234
	movq	-976(%rbp), %rax
	movl	$0, %edx
	leaq	.LC19(%rip), %rsi
	movq	%rax, %rdi
	call	Tcl_SetResult@PLT
	movl	$1, %eax
	jmp	.L266
.L234:
	movq	-888(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	Tcl_GetStringFromObj@PLT
	movq	%rax, -840(%rbp)
	movq	-912(%rbp), %rax
	movq	40(%rax), %rax
	movq	%rax, -920(%rbp)
	jmp	.L235
.L239:
	movq	-920(%rbp), %rax
	movq	(%rax), %rax
	movq	-840(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L236
	movq	-920(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L236
	movq	-888(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -832(%rbp)
	movq	-888(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	-896(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, (%rdx)
	movq	-896(%rbp), %rax
	movq	(%rax), %rax
	movl	(%rax), %edx
	addl	$1, %edx
	movl	%edx, (%rax)
	movq	-920(%rbp), %rax
	movq	8(%rax), %rax
	movq	-888(%rbp), %rdx
	movq	-976(%rbp), %rsi
	movq	-968(%rbp), %rdi
	movq	%rdx, %rcx
	movl	$2, %edx
	call	*%rax
	movl	%eax, -932(%rbp)
	movq	-888(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	-832(%rbp), %rax
	movq	%rax, (%rdx)
	movq	-896(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -824(%rbp)
	movq	-824(%rbp), %rax
	movl	(%rax), %eax
	leal	-1(%rax), %ecx
	movq	-824(%rbp), %rdx
	movl	%ecx, (%rdx)
	cmpl	$1, %eax
	jg	.L237
	movq	-824(%rbp), %rax
	movq	%rax, %rdi
	call	TclFreeObj@PLT
.L237:
	movl	-932(%rbp), %eax
	jmp	.L266
.L236:
	addq	$24, -920(%rbp)
.L235:
	cmpq	$0, -920(%rbp)
	je	.L238
	movq	-920(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L239
.L238:
	movq	-840(%rbp), %rax
	leaq	.LC24(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L240
	movq	-896(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	Tcl_DuplicateObj@PLT
	movq	%rax, %rdx
	movq	-976(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	Tcl_SetObjResult@PLT
	movl	$0, %eax
	jmp	.L266
.L240:
	movq	-840(%rbp), %rax
	leaq	.LC25(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L252
	movq	-896(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rdi
	call	SWIG_Tcl_Thisown
	testl	%eax, %eax
	je	.L241
	movq	-976(%rbp), %rax
	movl	$0, %edx
	leaq	.LC26(%rip), %rsi
	movq	%rax, %rdi
	call	Tcl_SetResult@PLT
	jmp	.L242
.L241:
	movq	-976(%rbp), %rax
	movl	$0, %edx
	leaq	.LC27(%rip), %rsi
	movq	%rax, %rdi
	call	Tcl_SetResult@PLT
.L242:
	movl	$0, %eax
	jmp	.L266
.L233:
	movq	-880(%rbp), %rax
	leaq	.LC28(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L252
	cmpl	$3, -980(%rbp)
	jg	.L243
	movq	-976(%rbp), %rax
	movl	$0, %edx
	leaq	.LC19(%rip), %rsi
	movq	%rax, %rdi
	call	Tcl_SetResult@PLT
	movl	$1, %eax
	jmp	.L266
.L243:
	movl	$2, -936(%rbp)
	jmp	.L244
.L251:
	movl	-936(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-888(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	Tcl_GetStringFromObj@PLT
	movq	%rax, -840(%rbp)
	movq	-912(%rbp), %rax
	movq	40(%rax), %rax
	movq	%rax, -920(%rbp)
	jmp	.L245
.L250:
	movq	-920(%rbp), %rax
	movq	(%rax), %rax
	movq	-840(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L246
	movq	-920(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L246
	movl	-936(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-888(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, -832(%rbp)
	movl	-936(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-888(%rbp), %rax
	addq	%rax, %rdx
	movq	-896(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, (%rdx)
	movq	-896(%rbp), %rax
	movq	(%rax), %rax
	movl	(%rax), %edx
	addl	$1, %edx
	movl	%edx, (%rax)
	movq	-920(%rbp), %rax
	movq	16(%rax), %rax
	movl	-936(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	leaq	-8(%rdx), %rcx
	movq	-888(%rbp), %rdx
	addq	%rcx, %rdx
	movq	-976(%rbp), %rsi
	movq	-968(%rbp), %rdi
	movq	%rdx, %rcx
	movl	$3, %edx
	call	*%rax
	movl	%eax, -932(%rbp)
	movl	-936(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-888(%rbp), %rax
	addq	%rax, %rdx
	movq	-832(%rbp), %rax
	movq	%rax, (%rdx)
	movq	-896(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -816(%rbp)
	movq	-816(%rbp), %rax
	movl	(%rax), %eax
	leal	-1(%rax), %ecx
	movq	-816(%rbp), %rdx
	movl	%ecx, (%rdx)
	cmpl	$1, %eax
	jg	.L247
	movq	-816(%rbp), %rax
	movq	%rax, %rdi
	call	TclFreeObj@PLT
.L247:
	cmpl	$0, -932(%rbp)
	je	.L248
	movl	-932(%rbp), %eax
	jmp	.L266
.L248:
	addl	$2, -944(%rbp)
.L246:
	addq	$24, -920(%rbp)
.L245:
	cmpq	$0, -920(%rbp)
	je	.L249
	movq	-920(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L250
.L249:
	addl	$2, -936(%rbp)
.L244:
	movl	-936(%rbp), %eax
	cmpl	-980(%rbp), %eax
	jl	.L251
	jmp	.L252
.L269:
	nop
.L227:
	jmp	.L252
.L268:
	movq	-880(%rbp), %rax
	leaq	.LC28(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L253
	movl	-944(%rbp), %eax
	cmpl	-980(%rbp), %eax
	jl	.L254
	movl	$0, %eax
	jmp	.L266
.L254:
	movq	-976(%rbp), %rax
	movl	$0, %edx
	leaq	.LC29(%rip), %rsi
	movq	%rax, %rdi
	call	Tcl_SetResult@PLT
	movl	$1, %eax
	jmp	.L266
.L253:
	movq	-880(%rbp), %rax
	leaq	.LC23(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L255
	movq	-976(%rbp), %rax
	movl	$0, %edx
	leaq	.LC29(%rip), %rsi
	movq	%rax, %rdi
	call	Tcl_SetResult@PLT
	movl	$1, %eax
	jmp	.L266
.L255:
	movq	-976(%rbp), %rax
	movl	$0, %edx
	leaq	.LC30(%rip), %rsi
	movq	%rax, %rdi
	call	Tcl_SetResult@PLT
	movq	-896(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -912(%rbp)
	movl	$0, -940(%rbp)
	jmp	.L256
.L265:
	movq	-912(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -928(%rbp)
	jmp	.L257
.L264:
	movq	-976(%rbp), %rax
	movq	%rax, %rdi
	call	Tcl_GetStringResult@PLT
	movq	%rax, -864(%rbp)
	movq	-928(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, -856(%rbp)
	movq	-864(%rbp), %rax
	movl	$58, %esi
	movq	%rax, %rdi
	call	strchr@PLT
	movq	%rax, -904(%rbp)
	jmp	.L258
.L261:
	movq	-928(%rbp), %rax
	movq	(%rax), %rdx
	movq	-904(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strstr@PLT
	movq	%rax, -904(%rbp)
	cmpq	$0, -904(%rbp)
	je	.L258
	movq	-904(%rbp), %rax
	subq	$1, %rax
	movzbl	(%rax), %eax
	cmpb	$32, %al
	jne	.L259
	movq	-904(%rbp), %rdx
	movq	-856(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$32, %al
	je	.L260
	movq	-904(%rbp), %rdx
	movq	-856(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L260
.L259:
	addq	$1, -904(%rbp)
.L258:
	cmpq	$0, -904(%rbp)
	jne	.L261
.L260:
	cmpq	$0, -904(%rbp)
	jne	.L262
	movq	-928(%rbp), %rax
	movq	(%rax), %rdx
	movq	-976(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	Tcl_AppendElement@PLT
.L262:
	addq	$16, -928(%rbp)
.L257:
	cmpq	$0, -928(%rbp)
	je	.L263
	movq	-928(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L264
.L263:
	movq	-896(%rbp), %rax
	movq	16(%rax), %rax
	movq	48(%rax), %rcx
	movl	-940(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -940(%rbp)
	cltq
	salq	$3, %rax
	addq	%rcx, %rax
	movq	(%rax), %rax
	movq	%rax, -912(%rbp)
.L256:
	cmpq	$0, -912(%rbp)
	jne	.L265
	movl	$1, %eax
.L266:
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L267
	call	__stack_chk_fail@PLT
.L267:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE41:
	.size	SWIG_Tcl_MethodCommand, .-SWIG_Tcl_MethodCommand
	.type	SWIG_Tcl_NewInstanceObj, @function
SWIG_Tcl_NewInstanceObj:
.LFB42:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$144, %rsp
	movq	%rdi, -120(%rbp)
	movq	%rsi, -128(%rbp)
	movq	%rdx, -136(%rbp)
	movl	%ecx, -140(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	-136(%rbp), %rcx
	movq	-128(%rbp), %rax
	movl	$0, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_NewPointerObj
	movq	%rax, -104(%rbp)
	cmpq	$0, -128(%rbp)
	je	.L271
	movq	-136(%rbp), %rax
	movq	32(%rax), %rax
	testq	%rax, %rax
	je	.L271
	cmpq	$0, -120(%rbp)
	je	.L271
	movq	-104(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	Tcl_GetStringFromObj@PLT
	movq	%rax, -96(%rbp)
	leaq	-80(%rbp), %rdx
	movq	-96(%rbp), %rcx
	movq	-120(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	Tcl_GetCommandInfo@PLT
	testl	%eax, %eax
	je	.L272
	cmpl	$0, -140(%rbp)
	je	.L271
.L272:
	movl	$40, %edi
	call	malloc@PLT
	movq	%rax, -88(%rbp)
	movq	-104(%rbp), %rax
	movq	%rax, %rdi
	call	Tcl_DuplicateObj@PLT
	movq	%rax, %rdx
	movq	-88(%rbp), %rax
	movq	%rdx, (%rax)
	movq	-88(%rbp), %rax
	movq	(%rax), %rax
	movl	(%rax), %edx
	addl	$1, %edx
	movl	%edx, (%rax)
	movq	-88(%rbp), %rax
	movq	-128(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-136(%rbp), %rax
	movq	32(%rax), %rdx
	movq	-88(%rbp), %rax
	movq	%rdx, 16(%rax)
	movq	-88(%rbp), %rax
	movl	-140(%rbp), %edx
	movl	%edx, 24(%rax)
	movq	-104(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	Tcl_GetStringFromObj@PLT
	movq	%rax, %rsi
	movq	-88(%rbp), %rdx
	movq	-120(%rbp), %rax
	leaq	SWIG_Tcl_ObjectDelete(%rip), %r8
	movq	%rdx, %rcx
	leaq	SWIG_Tcl_MethodCommand(%rip), %rdx
	movq	%rax, %rdi
	call	Tcl_CreateObjCommand@PLT
	movq	%rax, %rdx
	movq	-88(%rbp), %rax
	movq	%rdx, 32(%rax)
	cmpl	$0, -140(%rbp)
	je	.L271
	movq	-128(%rbp), %rax
	movq	%rax, %rdi
	call	SWIG_Tcl_Acquire
.L271:
	movq	-104(%rbp), %rax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L275
	call	__stack_chk_fail@PLT
.L275:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE42:
	.size	SWIG_Tcl_NewInstanceObj, .-SWIG_Tcl_NewInstanceObj
	.section	.rodata
	.align 8
.LC31:
	.string	"swig: internal runtime error. No class object defined."
.LC32:
	.string	"-args"
.LC33:
	.string	"No constructor available."
	.text
	.type	SWIG_Tcl_ObjectConstructor, @function
SWIG_Tcl_ObjectConstructor:
.LFB43:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	addq	$-128, %rsp
	movq	%rdi, -104(%rbp)
	movq	%rsi, -112(%rbp)
	movl	%edx, -116(%rbp)
	movq	%rcx, -128(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -72(%rbp)
	movq	$0, -80(%rbp)
	movq	$0, -48(%rbp)
	movq	-104(%rbp), %rax
	movq	%rax, -40(%rbp)
	movq	$0, -64(%rbp)
	movq	$0, -56(%rbp)
	movl	$0, -96(%rbp)
	movl	$0, -92(%rbp)
	movl	$1, -88(%rbp)
	cmpq	$0, -40(%rbp)
	jne	.L277
	movq	-112(%rbp), %rax
	movl	$0, %edx
	leaq	.LC31(%rip), %rsi
	movq	%rax, %rdi
	call	Tcl_SetResult@PLT
	movl	$1, %eax
	jmp	.L294
.L277:
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -64(%rbp)
	cmpl	$1, -116(%rbp)
	jle	.L279
	movq	-128(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	Tcl_GetStringFromObj@PLT
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	leaq	.LC24(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L280
	movl	$2, -92(%rbp)
	movq	$0, -64(%rbp)
	jmp	.L279
.L280:
	movq	-32(%rbp), %rax
	leaq	.LC32(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L281
	movl	$1, -96(%rbp)
	jmp	.L279
.L281:
	cmpl	$2, -116(%rbp)
	jne	.L282
	movl	$1, -96(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, -56(%rbp)
	jmp	.L279
.L282:
	cmpl	$2, -116(%rbp)
	jle	.L279
	movq	-32(%rbp), %rax
	movq	%rax, -56(%rbp)
	movq	-128(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	Tcl_GetStringFromObj@PLT
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	leaq	.LC24(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L283
	movl	$3, -92(%rbp)
	movq	$0, -64(%rbp)
	jmp	.L279
.L283:
	movl	$1, -96(%rbp)
.L279:
	cmpq	$0, -64(%rbp)
	je	.L284
	movl	-96(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-128(%rbp), %rax
	leaq	(%rdx,%rax), %rcx
	movl	-116(%rbp), %eax
	subl	-96(%rbp), %eax
	movl	%eax, %edx
	movq	-112(%rbp), %rsi
	movq	-64(%rbp), %rax
	movl	$0, %edi
	call	*%rax
	movl	%eax, -84(%rbp)
	cmpl	$0, -84(%rbp)
	je	.L285
	movl	-84(%rbp), %eax
	jmp	.L294
.L285:
	movq	-112(%rbp), %rax
	movq	%rax, %rdi
	call	Tcl_GetObjResult@PLT
	movq	%rax, %rdi
	call	Tcl_DuplicateObj@PLT
	movq	%rax, -72(%rbp)
	cmpq	$0, -56(%rbp)
	jne	.L287
	movq	-72(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	Tcl_GetStringFromObj@PLT
	movq	%rax, -56(%rbp)
	jmp	.L287
.L284:
	cmpl	$0, -92(%rbp)
	jle	.L288
	movl	-92(%rbp), %eax
	cmpl	-116(%rbp), %eax
	jge	.L289
	movl	$0, -88(%rbp)
	movl	-92(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-128(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	Tcl_DuplicateObj@PLT
	movq	%rax, -72(%rbp)
	cmpq	$0, -56(%rbp)
	jne	.L287
	movq	-72(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	Tcl_GetStringFromObj@PLT
	movq	%rax, -56(%rbp)
	jmp	.L287
.L289:
	movq	-112(%rbp), %rax
	movl	$0, %edx
	leaq	.LC19(%rip), %rsi
	movq	%rax, %rdi
	call	Tcl_SetResult@PLT
	movl	$1, %eax
	jmp	.L294
.L288:
	movq	-112(%rbp), %rax
	movl	$0, %edx
	leaq	.LC33(%rip), %rsi
	movq	%rax, %rdi
	call	Tcl_SetResult@PLT
	movl	$1, %eax
	jmp	.L294
.L287:
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	movq	(%rax), %rcx
	leaq	-80(%rbp), %rdx
	movq	-72(%rbp), %rsi
	movq	-112(%rbp), %rax
	movl	$0, %r8d
	movq	%rax, %rdi
	call	SWIG_Tcl_ConvertPtr
	testl	%eax, %eax
	je	.L291
	movq	-72(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	leal	-1(%rax), %ecx
	movq	-16(%rbp), %rdx
	movl	%ecx, (%rdx)
	cmpl	$1, %eax
	jg	.L292
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	TclFreeObj@PLT
.L292:
	movl	$1, %eax
	jmp	.L294
.L291:
	movl	$40, %edi
	call	malloc@PLT
	movq	%rax, -48(%rbp)
	movq	-48(%rbp), %rax
	movq	-72(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-72(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-72(%rbp), %rax
	movl	%edx, (%rax)
	movq	-80(%rbp), %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, 8(%rax)
	movq	-48(%rbp), %rax
	movq	-40(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-48(%rbp), %rax
	movl	-88(%rbp), %edx
	movl	%edx, 24(%rax)
	cmpl	$0, -88(%rbp)
	je	.L293
	movq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	SWIG_Tcl_Acquire
.L293:
	movq	-48(%rbp), %rdx
	movq	-56(%rbp), %rsi
	movq	-112(%rbp), %rax
	leaq	SWIG_Tcl_ObjectDelete(%rip), %r8
	movq	%rdx, %rcx
	leaq	SWIG_Tcl_MethodCommand(%rip), %rdx
	movq	%rax, %rdi
	call	Tcl_CreateObjCommand@PLT
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, 32(%rax)
	movl	$0, %eax
.L294:
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L295
	call	__stack_chk_fail@PLT
.L295:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE43:
	.size	SWIG_Tcl_ObjectConstructor, .-SWIG_Tcl_ObjectConstructor
	.section	.rodata
.LC34:
	.string	"Wrong number of arguments "
.LC35:
	.string	"Wrong # args."
.LC36:
	.string	"%d"
.LC37:
	.string	""
.LC38:
	.string	" argument "
	.text
	.type	SWIG_Tcl_GetArgs, @function
SWIG_Tcl_GetArgs:
.LFB44:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$352, %rsp
	movq	%rdi, -328(%rbp)
	movl	%esi, -332(%rbp)
	movq	%rdx, -344(%rbp)
	movq	%rcx, -352(%rbp)
	movq	%r8, -144(%rbp)
	movq	%r9, -136(%rbp)
	testb	%al, %al
	je	.L297
	movaps	%xmm0, -128(%rbp)
	movaps	%xmm1, -112(%rbp)
	movaps	%xmm2, -96(%rbp)
	movaps	%xmm3, -80(%rbp)
	movaps	%xmm4, -64(%rbp)
	movaps	%xmm5, -48(%rbp)
	movaps	%xmm6, -32(%rbp)
	movaps	%xmm7, -16(%rbp)
.L297:
	movq	%fs:40, %rax
	movq	%rax, -184(%rbp)
	xorl	%eax, %eax
	movl	$0, -312(%rbp)
	movl	$0, -308(%rbp)
	movq	$0, -280(%rbp)
	movl	$32, -248(%rbp)
	movl	$48, -244(%rbp)
	leaq	16(%rbp), %rax
	movq	%rax, -240(%rbp)
	leaq	-176(%rbp), %rax
	movq	%rax, -232(%rbp)
	movq	-352(%rbp), %rax
	movq	%rax, -288(%rbp)
	jmp	.L298
.L340:
	movq	-288(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$124, %al
	jne	.L299
	movl	$1, -308(%rbp)
	addq	$1, -288(%rbp)
.L299:
	movl	-332(%rbp), %eax
	subl	$1, %eax
	cmpl	-312(%rbp), %eax
	jg	.L300
	cmpl	$0, -308(%rbp)
	jne	.L301
	movq	-328(%rbp), %rax
	movl	$0, %edx
	leaq	.LC34(%rip), %rsi
	movq	%rax, %rdi
	call	Tcl_SetResult@PLT
	jmp	.L302
.L301:
	movl	$0, %eax
	jmp	.L344
.L300:
	movl	-248(%rbp), %eax
	cmpl	$48, %eax
	jnb	.L304
	movq	-232(%rbp), %rax
	movl	-248(%rbp), %edx
	movl	%edx, %edx
	addq	%rdx, %rax
	movl	-248(%rbp), %edx
	addl	$8, %edx
	movl	%edx, -248(%rbp)
	jmp	.L305
.L304:
	movq	-240(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	%rdx, -240(%rbp)
.L305:
	movq	(%rax), %rax
	movq	%rax, -272(%rbp)
	cmpq	$0, -272(%rbp)
	je	.L306
	call	__ctype_b_loc@PLT
	movq	(%rax), %rdx
	movq	-288(%rbp), %rax
	movzbl	(%rax), %eax
	movsbq	%al, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	movzwl	(%rax), %eax
	movzwl	%ax, %eax
	andl	$256, %eax
	testl	%eax, %eax
	je	.L307
	movl	-312(%rbp), %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,8), %rdx
	movq	-344(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	Tcl_GetStringFromObj@PLT
	movq	%rax, %rdi
	call	SWIG_Tcl_GetConstantObj
	movq	%rax, -280(%rbp)
	cmpq	$0, -280(%rbp)
	jne	.L309
	movl	-312(%rbp), %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,8), %rdx
	movq	-344(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, -280(%rbp)
	jmp	.L309
.L307:
	movl	-312(%rbp), %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,8), %rdx
	movq	-344(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, -280(%rbp)
.L309:
	movq	-288(%rbp), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	subl	$66, %eax
	cmpl	$49, %eax
	ja	.L346
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L312(%rip), %rax
	movl	(%rdx,%rax), %eax
	movslq	%eax, %rdx
	leaq	.L312(%rip), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L312:
	.long	.L311-.L312
	.long	.L313-.L312
	.long	.L314-.L312
	.long	.L346-.L312
	.long	.L314-.L312
	.long	.L346-.L312
	.long	.L311-.L312
	.long	.L311-.L312
	.long	.L346-.L312
	.long	.L346-.L312
	.long	.L311-.L312
	.long	.L346-.L312
	.long	.L346-.L312
	.long	.L315-.L312
	.long	.L316-.L312
	.long	.L346-.L312
	.long	.L346-.L312
	.long	.L317-.L312
	.long	.L346-.L312
	.long	.L346-.L312
	.long	.L346-.L312
	.long	.L346-.L312
	.long	.L346-.L312
	.long	.L346-.L312
	.long	.L346-.L312
	.long	.L346-.L312
	.long	.L346-.L312
	.long	.L346-.L312
	.long	.L346-.L312
	.long	.L346-.L312
	.long	.L346-.L312
	.long	.L346-.L312
	.long	.L311-.L312
	.long	.L313-.L312
	.long	.L314-.L312
	.long	.L346-.L312
	.long	.L314-.L312
	.long	.L346-.L312
	.long	.L311-.L312
	.long	.L311-.L312
	.long	.L346-.L312
	.long	.L346-.L312
	.long	.L311-.L312
	.long	.L346-.L312
	.long	.L346-.L312
	.long	.L315-.L312
	.long	.L316-.L312
	.long	.L346-.L312
	.long	.L346-.L312
	.long	.L317-.L312
	.text
.L311:
	leaq	-304(%rbp), %rdx
	movq	-280(%rbp), %rcx
	movq	-328(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	Tcl_GetLongFromObj@PLT
	testl	%eax, %eax
	jne	.L347
	movq	-288(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$105, %al
	je	.L319
	movq	-288(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$73, %al
	jne	.L320
.L319:
	movq	-304(%rbp), %rax
	movl	%eax, %edx
	movq	-272(%rbp), %rax
	movl	%edx, (%rax)
	jmp	.L321
.L320:
	movq	-288(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$108, %al
	je	.L322
	movq	-288(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$76, %al
	jne	.L323
.L322:
	movq	-304(%rbp), %rdx
	movq	-272(%rbp), %rax
	movq	%rdx, (%rax)
	jmp	.L321
.L323:
	movq	-288(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$104, %al
	je	.L324
	movq	-288(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$72, %al
	jne	.L325
.L324:
	movq	-304(%rbp), %rax
	movl	%eax, %edx
	movq	-272(%rbp), %rax
	movw	%dx, (%rax)
	jmp	.L321
.L325:
	movq	-288(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$98, %al
	je	.L326
	movq	-288(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$66, %al
	jne	.L348
.L326:
	movq	-304(%rbp), %rax
	movl	%eax, %edx
	movq	-272(%rbp), %rax
	movb	%dl, (%rax)
	jmp	.L348
.L321:
	jmp	.L348
.L314:
	leaq	-296(%rbp), %rdx
	movq	-280(%rbp), %rcx
	movq	-328(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	Tcl_GetDoubleFromObj@PLT
	testl	%eax, %eax
	jne	.L349
	movq	-288(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$102, %al
	je	.L328
	movq	-288(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$70, %al
	jne	.L329
.L328:
	movsd	-296(%rbp), %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movq	-272(%rbp), %rax
	movss	%xmm0, (%rax)
	jmp	.L350
.L329:
	movq	-288(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$100, %al
	je	.L331
	movq	-288(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$68, %al
	jne	.L350
.L331:
	movsd	-296(%rbp), %xmm0
	movq	-272(%rbp), %rax
	movsd	%xmm0, (%rax)
	jmp	.L350
.L317:
	movq	-288(%rbp), %rax
	addq	$1, %rax
	movzbl	(%rax), %eax
	cmpb	$35, %al
	jne	.L332
	movl	-248(%rbp), %eax
	cmpl	$48, %eax
	jnb	.L333
	movq	-232(%rbp), %rax
	movl	-248(%rbp), %edx
	movl	%edx, %edx
	addq	%rdx, %rax
	movl	-248(%rbp), %edx
	addl	$8, %edx
	movl	%edx, -248(%rbp)
	jmp	.L334
.L333:
	movq	-240(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	%rdx, -240(%rbp)
.L334:
	movq	(%rax), %rax
	movq	%rax, -264(%rbp)
	movq	-264(%rbp), %rdx
	movq	-280(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	Tcl_GetStringFromObj@PLT
	movq	%rax, %rdx
	movq	-272(%rbp), %rax
	movq	%rdx, (%rax)
	addq	$1, -288(%rbp)
	jmp	.L306
.L332:
	movq	-280(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	Tcl_GetStringFromObj@PLT
	movq	%rax, %rdx
	movq	-272(%rbp), %rax
	movq	%rdx, (%rax)
	jmp	.L306
.L313:
	movq	-280(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	Tcl_GetStringFromObj@PLT
	movzbl	(%rax), %edx
	movq	-272(%rbp), %rax
	movb	%dl, (%rax)
	jmp	.L306
.L316:
	movl	-248(%rbp), %eax
	cmpl	$48, %eax
	jnb	.L336
	movq	-232(%rbp), %rax
	movl	-248(%rbp), %edx
	movl	%edx, %edx
	addq	%rdx, %rax
	movl	-248(%rbp), %edx
	addl	$8, %edx
	movl	%edx, -248(%rbp)
	jmp	.L337
.L336:
	movq	-240(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	%rdx, -240(%rbp)
.L337:
	movq	(%rax), %rax
	movq	%rax, -256(%rbp)
	movq	-256(%rbp), %rcx
	movq	-272(%rbp), %rdx
	movq	-280(%rbp), %rsi
	movq	-328(%rbp), %rax
	movl	$0, %r8d
	movq	%rax, %rdi
	call	SWIG_Tcl_ConvertPtr
	testl	%eax, %eax
	je	.L351
	jmp	.L302
.L315:
	movl	-312(%rbp), %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,8), %rdx
	movq	-344(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movq	-272(%rbp), %rax
	movq	%rdx, (%rax)
	jmp	.L306
.L346:
	nop
	jmp	.L306
.L348:
	nop
	jmp	.L306
.L350:
	nop
	jmp	.L306
.L351:
	nop
.L306:
	addq	$1, -288(%rbp)
	addl	$1, -312(%rbp)
.L298:
	movq	-288(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L339
	movq	-288(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$58, %al
	je	.L339
	movq	-288(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$59, %al
	jne	.L340
.L339:
	movq	-288(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$59, %al
	je	.L341
	movl	-332(%rbp), %eax
	subl	$1, %eax
	cmpl	-312(%rbp), %eax
	jle	.L341
	movq	-328(%rbp), %rax
	movl	$0, %edx
	leaq	.LC35(%rip), %rsi
	movq	%rax, %rdi
	call	Tcl_SetResult@PLT
	jmp	.L302
.L341:
	movl	$0, %eax
	jmp	.L344
.L347:
	nop
	jmp	.L302
.L349:
	nop
.L302:
	movl	-312(%rbp), %eax
	leal	1(%rax), %edx
	leaq	-224(%rbp), %rax
	leaq	.LC36(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	movq	-352(%rbp), %rax
	movl	$58, %esi
	movq	%rax, %rdi
	call	strchr@PLT
	movq	%rax, -288(%rbp)
	cmpq	$0, -288(%rbp)
	jne	.L342
	movq	-352(%rbp), %rax
	movl	$59, %esi
	movq	%rax, %rdi
	call	strchr@PLT
	movq	%rax, -288(%rbp)
.L342:
	cmpq	$0, -288(%rbp)
	jne	.L343
	leaq	.LC37(%rip), %rax
	movq	%rax, -288(%rbp)
.L343:
	leaq	-224(%rbp), %rdx
	movq	-288(%rbp), %rsi
	movq	-328(%rbp), %rax
	movl	$0, %r8d
	movq	%rdx, %rcx
	leaq	.LC38(%rip), %rdx
	movq	%rax, %rdi
	movl	$0, %eax
	call	Tcl_AppendResult@PLT
	movl	$1, %eax
.L344:
	movq	-184(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L345
	call	__stack_chk_fail@PLT
.L345:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE44:
	.size	SWIG_Tcl_GetArgs, .-SWIG_Tcl_GetArgs
	.local	swig_types
	.comm	swig_types,64,32
	.section	.data.rel.local,"aw",@progbits
	.align 32
	.type	swig_module, @object
	.size	swig_module, 48
swig_module:
	.quad	swig_types
	.quad	7
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.text
	.type	SWIG_AsCharPtrAndSize, @function
SWIG_AsCharPtrAndSize:
.LFB45:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%rdx, -56(%rbp)
	movq	%rcx, -64(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -20(%rbp)
	leaq	-20(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	Tcl_GetStringFromObj@PLT
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	je	.L353
	cmpq	$0, -48(%rbp)
	je	.L354
	movq	-48(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, (%rax)
.L354:
	cmpq	$0, -56(%rbp)
	je	.L355
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movslq	%eax, %rdx
	movq	-56(%rbp), %rax
	movq	%rdx, (%rax)
.L355:
	cmpq	$0, -64(%rbp)
	je	.L356
	movq	-64(%rbp), %rax
	movl	$0, (%rax)
.L356:
	movl	$0, %eax
	jmp	.L358
.L353:
	movl	$-5, %eax
.L358:
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L359
	call	__stack_chk_fail@PLT
.L359:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE45:
	.size	SWIG_AsCharPtrAndSize, .-SWIG_AsCharPtrAndSize
	.type	SWIG_AsVal_unsigned_SS_long, @function
SWIG_AsVal_unsigned_SS_long:
.LFB46:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movq	%rdx, -72(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-40(%rbp), %rdx
	movq	-64(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	Tcl_GetLongFromObj@PLT
	testl	%eax, %eax
	jne	.L361
	movq	-40(%rbp), %rax
	testq	%rax, %rax
	js	.L361
	cmpq	$0, -72(%rbp)
	je	.L362
	movq	-40(%rbp), %rax
	movq	%rax, %rdx
	movq	-72(%rbp), %rax
	movq	%rdx, (%rax)
.L362:
	movl	$0, %eax
	jmp	.L372
.L361:
	movl	$0, -44(%rbp)
	leaq	-44(%rbp), %rdx
	movq	-64(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	Tcl_GetStringFromObj@PLT
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	je	.L364
	movl	-44(%rbp), %eax
	testl	%eax, %eax
	jle	.L364
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$45, %al
	jne	.L365
	movl	$-7, %eax
	jmp	.L372
.L365:
	call	__errno_location@PLT
	movl	$0, (%rax)
	leaq	-32(%rbp), %rcx
	movq	-24(%rbp), %rax
	movl	$0, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strtoul@PLT
	movq	%rax, -16(%rbp)
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L367
	movq	-32(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L368
.L367:
	movl	$-5, %eax
	jmp	.L372
.L368:
	cmpq	$-1, -16(%rbp)
	jne	.L369
	call	__errno_location@PLT
	movl	(%rax), %eax
	cmpl	$34, %eax
	jne	.L369
	call	__errno_location@PLT
	movl	$0, (%rax)
	movl	$-7, %eax
	jmp	.L372
.L369:
	movq	-32(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L364
	cmpq	$0, -72(%rbp)
	je	.L371
	movq	-72(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, (%rax)
.L371:
	movl	$0, %eax
	jmp	.L372
.L364:
	movl	$-5, %eax
.L372:
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L373
	call	__stack_chk_fail@PLT
.L373:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE46:
	.size	SWIG_AsVal_unsigned_SS_long, .-SWIG_AsVal_unsigned_SS_long
	.type	SWIG_AsVal_unsigned_SS_int, @function
SWIG_AsVal_unsigned_SS_int:
.LFB47:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%rdx, -56(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-16(%rbp), %rdx
	movq	-48(%rbp), %rcx
	movq	-40(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_AsVal_unsigned_SS_long
	movl	%eax, -20(%rbp)
	cmpl	$0, -20(%rbp)
	js	.L375
	movq	-16(%rbp), %rdx
	movl	$4294967295, %eax
	cmpq	%rax, %rdx
	jbe	.L376
	movl	$-7, %eax
	jmp	.L378
.L376:
	cmpq	$0, -56(%rbp)
	je	.L375
	movq	-16(%rbp), %rax
	movl	%eax, %edx
	movq	-56(%rbp), %rax
	movl	%edx, (%rax)
.L375:
	movl	-20(%rbp), %eax
.L378:
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L379
	call	__stack_chk_fail@PLT
.L379:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE47:
	.size	SWIG_AsVal_unsigned_SS_int, .-SWIG_AsVal_unsigned_SS_int
	.type	SWIG_From_long, @function
SWIG_From_long:
.LFB48:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	cmpq	$-2147483648, -8(%rbp)
	jl	.L381
	cmpq	$2147483647, -8(%rbp)
	jg	.L381
	movq	-8(%rbp), %rax
	movl	%eax, %edi
	call	Tcl_NewIntObj@PLT
	jmp	.L382
.L381:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	Tcl_NewLongObj@PLT
.L382:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE48:
	.size	SWIG_From_long, .-SWIG_From_long
	.section	.rodata
.LC39:
	.string	"%lu"
	.text
	.type	SWIG_From_unsigned_SS_long, @function
SWIG_From_unsigned_SS_long:
.LFB49:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$288, %rsp
	movq	%rdi, -280(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movabsq	$9223372036854775806, %rax
	cmpq	%rax, -280(%rbp)
	ja	.L384
	movq	-280(%rbp), %rax
	movq	%rax, %rdi
	call	SWIG_From_long
	jmp	.L385
.L384:
	movq	-280(%rbp), %rdx
	leaq	-272(%rbp), %rax
	leaq	.LC39(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	leaq	-272(%rbp), %rax
	movl	$-1, %esi
	movq	%rax, %rdi
	call	Tcl_NewStringObj@PLT
.L385:
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L386
	call	__stack_chk_fail@PLT
.L386:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE49:
	.size	SWIG_From_unsigned_SS_long, .-SWIG_From_unsigned_SS_long
	.type	SWIG_From_unsigned_SS_int, @function
SWIG_From_unsigned_SS_int:
.LFB50:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %eax
	movq	%rax, %rdi
	call	SWIG_From_unsigned_SS_long
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE50:
	.size	SWIG_From_unsigned_SS_int, .-SWIG_From_unsigned_SS_int
	.type	SWIG_FromCharPtrAndSize, @function
SWIG_FromCharPtrAndSize:
.LFB51:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	cmpq	$2147483646, -16(%rbp)
	ja	.L390
	movq	-16(%rbp), %rax
	movl	%eax, %edx
	movq	-8(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	Tcl_NewStringObj@PLT
	jmp	.L392
.L390:
	movl	$0, %eax
.L392:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE51:
	.size	SWIG_FromCharPtrAndSize, .-SWIG_FromCharPtrAndSize
	.type	SWIG_FromCharPtr, @function
SWIG_FromCharPtr:
.LFB52:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L394
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	jmp	.L395
.L394:
	movl	$0, %edx
.L395:
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	SWIG_FromCharPtrAndSize
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE52:
	.size	SWIG_FromCharPtr, .-SWIG_FromCharPtr
	.type	SWIG_AsVal_long, @function
SWIG_AsVal_long:
.LFB53:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-16(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	Tcl_GetLongFromObj@PLT
	testl	%eax, %eax
	jne	.L398
	cmpq	$0, -40(%rbp)
	je	.L399
	movq	-16(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, (%rax)
.L399:
	movl	$0, %eax
	jmp	.L401
.L398:
	movl	$-5, %eax
.L401:
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L402
	call	__stack_chk_fail@PLT
.L402:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE53:
	.size	SWIG_AsVal_long, .-SWIG_AsVal_long
	.type	SWIG_AsVal_int, @function
SWIG_AsVal_int:
.LFB54:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%rdx, -56(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-16(%rbp), %rdx
	movq	-48(%rbp), %rcx
	movq	-40(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_AsVal_long
	movl	%eax, -20(%rbp)
	cmpl	$0, -20(%rbp)
	js	.L404
	movq	-16(%rbp), %rax
	cmpq	$-2147483648, %rax
	jl	.L405
	movq	-16(%rbp), %rax
	cmpq	$2147483647, %rax
	jle	.L406
.L405:
	movl	$-7, %eax
	jmp	.L408
.L406:
	cmpq	$0, -56(%rbp)
	je	.L404
	movq	-16(%rbp), %rax
	movl	%eax, %edx
	movq	-56(%rbp), %rax
	movl	%edx, (%rax)
.L404:
	movl	-20(%rbp), %eax
.L408:
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L409
	call	__stack_chk_fail@PLT
.L409:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE54:
	.size	SWIG_AsVal_int, .-SWIG_AsVal_int
	.type	SWIG_From_int, @function
SWIG_From_int:
.LFB55:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %eax
	cltq
	movq	%rax, %rdi
	call	SWIG_From_long
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE55:
	.size	SWIG_From_int, .-SWIG_From_int
	.section	.rodata
.LC40:
	.string	":queue_init "
	.text
	.type	_wrap_queue_init, @function
_wrap_queue_init:
.LFB56:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	%edx, -20(%rbp)
	movq	%rcx, -32(%rbp)
	movq	-32(%rbp), %rdx
	movl	-20(%rbp), %esi
	movq	-16(%rbp), %rax
	leaq	.LC40(%rip), %rcx
	movq	%rax, %rdi
	movl	$0, %eax
	call	SWIG_Tcl_GetArgs
	cmpl	$1, %eax
	je	.L417
	call	queue_init@PLT
	movl	$0, %eax
	jmp	.L415
.L417:
	nop
.L414:
	movl	$1, %eax
.L415:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE56:
	.size	_wrap_queue_init, .-_wrap_queue_init
	.section	.rodata
.LC41:
	.string	"ooo:stub_init p_key len size "
	.align 8
.LC42:
	.string	"in method 'stub_init', argument 1 of type 'char *'"
	.align 8
.LC43:
	.string	"in method 'stub_init', argument 2 of type 'uint32_t'"
	.align 8
.LC44:
	.string	"in method 'stub_init', argument 3 of type 'uint32_t'"
	.text
	.type	_wrap_stub_init, @function
_wrap_stub_init:
.LFB57:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movq	%rdi, -72(%rbp)
	movq	%rsi, -80(%rbp)
	movl	%edx, -84(%rbp)
	movq	%rcx, -96(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -16(%rbp)
	movq	$0, -24(%rbp)
	movl	$0, -56(%rbp)
	movl	$0, -44(%rbp)
	movl	$0, -40(%rbp)
	movq	-96(%rbp), %rdx
	movl	-84(%rbp), %esi
	movq	-80(%rbp), %rax
	subq	$8, %rsp
	pushq	$0
	movl	$0, %r9d
	movl	$0, %r8d
	leaq	.LC41(%rip), %rcx
	movq	%rax, %rdi
	movl	$0, %eax
	call	SWIG_Tcl_GetArgs
	addq	$16, %rsp
	cmpl	$1, %eax
	je	.L435
	movq	-96(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	-56(%rbp), %rdx
	leaq	-24(%rbp), %rsi
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	SWIG_AsCharPtrAndSize
	movl	%eax, -36(%rbp)
	cmpl	$0, -36(%rbp)
	jns	.L421
	cmpl	$-1, -36(%rbp)
	je	.L422
	movl	-36(%rbp), %eax
	jmp	.L423
.L422:
	movl	$-5, %eax
.L423:
	movl	%eax, %edi
	call	SWIG_Tcl_ErrorType
	movq	%rax, %rcx
	movq	-80(%rbp), %rax
	leaq	.LC42(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_SetErrorMsg
	jmp	.L420
.L421:
	movq	-24(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-96(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rcx
	leaq	-52(%rbp), %rdx
	movq	-80(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_AsVal_unsigned_SS_int
	movl	%eax, -44(%rbp)
	cmpl	$0, -44(%rbp)
	jns	.L424
	cmpl	$-1, -44(%rbp)
	je	.L425
	movl	-44(%rbp), %eax
	jmp	.L426
.L425:
	movl	$-5, %eax
.L426:
	movl	%eax, %edi
	call	SWIG_Tcl_ErrorType
	movq	%rax, %rcx
	movq	-80(%rbp), %rax
	leaq	.LC43(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_SetErrorMsg
	jmp	.L420
.L424:
	movl	-52(%rbp), %eax
	movl	%eax, -32(%rbp)
	movq	-96(%rbp), %rax
	addq	$24, %rax
	movq	(%rax), %rcx
	leaq	-48(%rbp), %rdx
	movq	-80(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_AsVal_unsigned_SS_int
	movl	%eax, -40(%rbp)
	cmpl	$0, -40(%rbp)
	jns	.L427
	cmpl	$-1, -40(%rbp)
	je	.L428
	movl	-40(%rbp), %eax
	jmp	.L429
.L428:
	movl	$-5, %eax
.L429:
	movl	%eax, %edi
	call	SWIG_Tcl_ErrorType
	movq	%rax, %rcx
	movq	-80(%rbp), %rax
	leaq	.LC44(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_SetErrorMsg
	jmp	.L420
.L427:
	movl	-48(%rbp), %eax
	movl	%eax, -28(%rbp)
	movl	-28(%rbp), %edx
	movl	-32(%rbp), %ecx
	movq	-16(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	stub_init@PLT
	movl	-56(%rbp), %eax
	cmpl	$512, %eax
	jne	.L430
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L430:
	movl	$0, %eax
	jmp	.L433
.L435:
	nop
.L420:
	movl	-56(%rbp), %eax
	cmpl	$512, %eax
	jne	.L432
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L432:
	movl	$1, %eax
.L433:
	movq	-8(%rbp), %rsi
	xorq	%fs:40, %rsi
	je	.L434
	call	__stack_chk_fail@PLT
.L434:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE57:
	.size	_wrap_stub_init, .-_wrap_stub_init
	.section	.rodata
	.align 8
.LC45:
	.string	"ooo:stub_clear p_key len size "
	.align 8
.LC46:
	.string	"in method 'stub_clear', argument 1 of type 'char *'"
	.align 8
.LC47:
	.string	"in method 'stub_clear', argument 2 of type 'uint32_t'"
	.align 8
.LC48:
	.string	"in method 'stub_clear', argument 3 of type 'uint32_t'"
	.text
	.type	_wrap_stub_clear, @function
_wrap_stub_clear:
.LFB58:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movq	%rdi, -72(%rbp)
	movq	%rsi, -80(%rbp)
	movl	%edx, -84(%rbp)
	movq	%rcx, -96(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -16(%rbp)
	movq	$0, -24(%rbp)
	movl	$0, -56(%rbp)
	movl	$0, -44(%rbp)
	movl	$0, -40(%rbp)
	movq	-96(%rbp), %rdx
	movl	-84(%rbp), %esi
	movq	-80(%rbp), %rax
	subq	$8, %rsp
	pushq	$0
	movl	$0, %r9d
	movl	$0, %r8d
	leaq	.LC45(%rip), %rcx
	movq	%rax, %rdi
	movl	$0, %eax
	call	SWIG_Tcl_GetArgs
	addq	$16, %rsp
	cmpl	$1, %eax
	je	.L453
	movq	-96(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	-56(%rbp), %rdx
	leaq	-24(%rbp), %rsi
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	SWIG_AsCharPtrAndSize
	movl	%eax, -36(%rbp)
	cmpl	$0, -36(%rbp)
	jns	.L439
	cmpl	$-1, -36(%rbp)
	je	.L440
	movl	-36(%rbp), %eax
	jmp	.L441
.L440:
	movl	$-5, %eax
.L441:
	movl	%eax, %edi
	call	SWIG_Tcl_ErrorType
	movq	%rax, %rcx
	movq	-80(%rbp), %rax
	leaq	.LC46(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_SetErrorMsg
	jmp	.L438
.L439:
	movq	-24(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-96(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rcx
	leaq	-52(%rbp), %rdx
	movq	-80(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_AsVal_unsigned_SS_int
	movl	%eax, -44(%rbp)
	cmpl	$0, -44(%rbp)
	jns	.L442
	cmpl	$-1, -44(%rbp)
	je	.L443
	movl	-44(%rbp), %eax
	jmp	.L444
.L443:
	movl	$-5, %eax
.L444:
	movl	%eax, %edi
	call	SWIG_Tcl_ErrorType
	movq	%rax, %rcx
	movq	-80(%rbp), %rax
	leaq	.LC47(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_SetErrorMsg
	jmp	.L438
.L442:
	movl	-52(%rbp), %eax
	movl	%eax, -32(%rbp)
	movq	-96(%rbp), %rax
	addq	$24, %rax
	movq	(%rax), %rcx
	leaq	-48(%rbp), %rdx
	movq	-80(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_AsVal_unsigned_SS_int
	movl	%eax, -40(%rbp)
	cmpl	$0, -40(%rbp)
	jns	.L445
	cmpl	$-1, -40(%rbp)
	je	.L446
	movl	-40(%rbp), %eax
	jmp	.L447
.L446:
	movl	$-5, %eax
.L447:
	movl	%eax, %edi
	call	SWIG_Tcl_ErrorType
	movq	%rax, %rcx
	movq	-80(%rbp), %rax
	leaq	.LC48(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_SetErrorMsg
	jmp	.L438
.L445:
	movl	-48(%rbp), %eax
	movl	%eax, -28(%rbp)
	movl	-28(%rbp), %edx
	movl	-32(%rbp), %ecx
	movq	-16(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	stub_clear@PLT
	movl	-56(%rbp), %eax
	cmpl	$512, %eax
	jne	.L448
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L448:
	movl	$0, %eax
	jmp	.L451
.L453:
	nop
.L438:
	movl	-56(%rbp), %eax
	cmpl	$512, %eax
	jne	.L450
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L450:
	movl	$1, %eax
.L451:
	movq	-8(%rbp), %rsi
	xorq	%fs:40, %rsi
	je	.L452
	call	__stack_chk_fail@PLT
.L452:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE58:
	.size	_wrap_stub_clear, .-_wrap_stub_clear
	.section	.rodata
.LC49:
	.string	"o:stub_cleanup p_key "
	.align 8
.LC50:
	.string	"in method 'stub_cleanup', argument 1 of type 'char *'"
	.text
	.type	_wrap_stub_cleanup, @function
_wrap_stub_cleanup:
.LFB59:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movl	%edx, -52(%rbp)
	movq	%rcx, -64(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -16(%rbp)
	movq	$0, -24(%rbp)
	movl	$0, -32(%rbp)
	movq	-64(%rbp), %rdx
	movl	-52(%rbp), %esi
	movq	-48(%rbp), %rax
	movl	$0, %r8d
	leaq	.LC49(%rip), %rcx
	movq	%rax, %rdi
	movl	$0, %eax
	call	SWIG_Tcl_GetArgs
	cmpl	$1, %eax
	je	.L465
	movq	-64(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	-32(%rbp), %rdx
	leaq	-24(%rbp), %rsi
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	SWIG_AsCharPtrAndSize
	movl	%eax, -28(%rbp)
	cmpl	$0, -28(%rbp)
	jns	.L457
	cmpl	$-1, -28(%rbp)
	je	.L458
	movl	-28(%rbp), %eax
	jmp	.L459
.L458:
	movl	$-5, %eax
.L459:
	movl	%eax, %edi
	call	SWIG_Tcl_ErrorType
	movq	%rax, %rcx
	movq	-48(%rbp), %rax
	leaq	.LC50(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_SetErrorMsg
	jmp	.L456
.L457:
	movq	-24(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	stub_cleanup@PLT
	movl	-32(%rbp), %eax
	cmpl	$512, %eax
	jne	.L460
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L460:
	movl	$0, %eax
	jmp	.L463
.L465:
	nop
.L456:
	movl	-32(%rbp), %eax
	cmpl	$512, %eax
	jne	.L462
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L462:
	movl	$1, %eax
.L463:
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L464
	call	__stack_chk_fail@PLT
.L464:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE59:
	.size	_wrap_stub_cleanup, .-_wrap_stub_cleanup
	.section	.rodata
	.align 8
.LC51:
	.string	"oo:sv_csr_write_wrapper p_key p_data "
	.align 8
.LC52:
	.string	"in method 'sv_csr_write_wrapper', argument 1 of type 'char *'"
	.align 8
.LC53:
	.string	"in method 'sv_csr_write_wrapper', argument 2 of type 'void *'"
	.text
	.type	_wrap_sv_csr_write_wrapper, @function
_wrap_sv_csr_write_wrapper:
.LFB60:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movl	%edx, -68(%rbp)
	movq	%rcx, -80(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -16(%rbp)
	movq	$0, -32(%rbp)
	movq	$0, -24(%rbp)
	movl	$0, -48(%rbp)
	movq	-80(%rbp), %rdx
	movl	-68(%rbp), %esi
	movq	-64(%rbp), %rax
	movl	$0, %r9d
	movl	$0, %r8d
	leaq	.LC51(%rip), %rcx
	movq	%rax, %rdi
	movl	$0, %eax
	call	SWIG_Tcl_GetArgs
	cmpl	$1, %eax
	je	.L480
	movq	-80(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	-48(%rbp), %rdx
	leaq	-24(%rbp), %rsi
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	SWIG_AsCharPtrAndSize
	movl	%eax, -44(%rbp)
	cmpl	$0, -44(%rbp)
	jns	.L469
	cmpl	$-1, -44(%rbp)
	je	.L470
	movl	-44(%rbp), %eax
	jmp	.L471
.L470:
	movl	$-5, %eax
.L471:
	movl	%eax, %edi
	call	SWIG_Tcl_ErrorType
	movq	%rax, %rcx
	movq	-64(%rbp), %rax
	leaq	.LC52(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_SetErrorMsg
	jmp	.L468
.L469:
	movq	-24(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-80(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rsi
	leaq	-32(%rbp), %rdx
	movq	-64(%rbp), %rax
	movl	$0, %r8d
	movl	$0, %ecx
	movq	%rax, %rdi
	call	SWIG_Tcl_ConvertPtr
	movl	%eax, -40(%rbp)
	cmpl	$0, -40(%rbp)
	jns	.L472
	cmpl	$-1, -40(%rbp)
	je	.L473
	movl	-40(%rbp), %eax
	jmp	.L474
.L473:
	movl	$-5, %eax
.L474:
	movl	%eax, %edi
	call	SWIG_Tcl_ErrorType
	movq	%rax, %rcx
	movq	-64(%rbp), %rax
	leaq	.LC53(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_SetErrorMsg
	jmp	.L468
.L472:
	movq	-32(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	sv_csr_write_wrapper@PLT
	movl	%eax, -36(%rbp)
	movl	-36(%rbp), %eax
	movl	%eax, %edi
	call	SWIG_From_unsigned_SS_int
	movq	%rax, %rdx
	movq	-64(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	Tcl_SetObjResult@PLT
	movl	-48(%rbp), %eax
	cmpl	$512, %eax
	jne	.L475
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L475:
	movl	$0, %eax
	jmp	.L478
.L480:
	nop
.L468:
	movl	-48(%rbp), %eax
	cmpl	$512, %eax
	jne	.L477
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L477:
	movl	$1, %eax
.L478:
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L479
	call	__stack_chk_fail@PLT
.L479:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE60:
	.size	_wrap_sv_csr_write_wrapper, .-_wrap_sv_csr_write_wrapper
	.section	.rodata
	.align 8
.LC54:
	.string	"oo:sv_csr_read_wrapper p_key p_data "
	.align 8
.LC55:
	.string	"in method 'sv_csr_read_wrapper', argument 1 of type 'char *'"
	.align 8
.LC56:
	.string	"in method 'sv_csr_read_wrapper', argument 2 of type 'void *'"
	.text
	.type	_wrap_sv_csr_read_wrapper, @function
_wrap_sv_csr_read_wrapper:
.LFB61:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movl	%edx, -68(%rbp)
	movq	%rcx, -80(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -16(%rbp)
	movq	$0, -32(%rbp)
	movq	$0, -24(%rbp)
	movl	$0, -48(%rbp)
	movq	-80(%rbp), %rdx
	movl	-68(%rbp), %esi
	movq	-64(%rbp), %rax
	movl	$0, %r9d
	movl	$0, %r8d
	leaq	.LC54(%rip), %rcx
	movq	%rax, %rdi
	movl	$0, %eax
	call	SWIG_Tcl_GetArgs
	cmpl	$1, %eax
	je	.L495
	movq	-80(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	-48(%rbp), %rdx
	leaq	-24(%rbp), %rsi
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	SWIG_AsCharPtrAndSize
	movl	%eax, -44(%rbp)
	cmpl	$0, -44(%rbp)
	jns	.L484
	cmpl	$-1, -44(%rbp)
	je	.L485
	movl	-44(%rbp), %eax
	jmp	.L486
.L485:
	movl	$-5, %eax
.L486:
	movl	%eax, %edi
	call	SWIG_Tcl_ErrorType
	movq	%rax, %rcx
	movq	-64(%rbp), %rax
	leaq	.LC55(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_SetErrorMsg
	jmp	.L483
.L484:
	movq	-24(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-80(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rsi
	leaq	-32(%rbp), %rdx
	movq	-64(%rbp), %rax
	movl	$0, %r8d
	movl	$0, %ecx
	movq	%rax, %rdi
	call	SWIG_Tcl_ConvertPtr
	movl	%eax, -40(%rbp)
	cmpl	$0, -40(%rbp)
	jns	.L487
	cmpl	$-1, -40(%rbp)
	je	.L488
	movl	-40(%rbp), %eax
	jmp	.L489
.L488:
	movl	$-5, %eax
.L489:
	movl	%eax, %edi
	call	SWIG_Tcl_ErrorType
	movq	%rax, %rcx
	movq	-64(%rbp), %rax
	leaq	.LC56(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_SetErrorMsg
	jmp	.L483
.L487:
	movq	-32(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	sv_csr_read_wrapper@PLT
	movl	%eax, -36(%rbp)
	movl	-36(%rbp), %eax
	movl	%eax, %edi
	call	SWIG_From_unsigned_SS_int
	movq	%rax, %rdx
	movq	-64(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	Tcl_SetObjResult@PLT
	movl	-48(%rbp), %eax
	cmpl	$512, %eax
	jne	.L490
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L490:
	movl	$0, %eax
	jmp	.L493
.L495:
	nop
.L483:
	movl	-48(%rbp), %eax
	cmpl	$512, %eax
	jne	.L492
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L492:
	movl	$1, %eax
.L493:
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L494
	call	__stack_chk_fail@PLT
.L494:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE61:
	.size	_wrap_sv_csr_read_wrapper, .-_wrap_sv_csr_read_wrapper
	.section	.rodata
	.align 8
.LC57:
	.string	"oo:sv_csr_peek_wrapper p_key p_data "
	.align 8
.LC58:
	.string	"in method 'sv_csr_peek_wrapper', argument 1 of type 'char *'"
	.align 8
.LC59:
	.string	"in method 'sv_csr_peek_wrapper', argument 2 of type 'void *'"
	.text
	.type	_wrap_sv_csr_peek_wrapper, @function
_wrap_sv_csr_peek_wrapper:
.LFB62:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movl	%edx, -68(%rbp)
	movq	%rcx, -80(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -16(%rbp)
	movq	$0, -32(%rbp)
	movq	$0, -24(%rbp)
	movl	$0, -48(%rbp)
	movq	-80(%rbp), %rdx
	movl	-68(%rbp), %esi
	movq	-64(%rbp), %rax
	movl	$0, %r9d
	movl	$0, %r8d
	leaq	.LC57(%rip), %rcx
	movq	%rax, %rdi
	movl	$0, %eax
	call	SWIG_Tcl_GetArgs
	cmpl	$1, %eax
	je	.L510
	movq	-80(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	-48(%rbp), %rdx
	leaq	-24(%rbp), %rsi
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	SWIG_AsCharPtrAndSize
	movl	%eax, -44(%rbp)
	cmpl	$0, -44(%rbp)
	jns	.L499
	cmpl	$-1, -44(%rbp)
	je	.L500
	movl	-44(%rbp), %eax
	jmp	.L501
.L500:
	movl	$-5, %eax
.L501:
	movl	%eax, %edi
	call	SWIG_Tcl_ErrorType
	movq	%rax, %rcx
	movq	-64(%rbp), %rax
	leaq	.LC58(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_SetErrorMsg
	jmp	.L498
.L499:
	movq	-24(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-80(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rsi
	leaq	-32(%rbp), %rdx
	movq	-64(%rbp), %rax
	movl	$0, %r8d
	movl	$0, %ecx
	movq	%rax, %rdi
	call	SWIG_Tcl_ConvertPtr
	movl	%eax, -40(%rbp)
	cmpl	$0, -40(%rbp)
	jns	.L502
	cmpl	$-1, -40(%rbp)
	je	.L503
	movl	-40(%rbp), %eax
	jmp	.L504
.L503:
	movl	$-5, %eax
.L504:
	movl	%eax, %edi
	call	SWIG_Tcl_ErrorType
	movq	%rax, %rcx
	movq	-64(%rbp), %rax
	leaq	.LC59(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_SetErrorMsg
	jmp	.L498
.L502:
	movq	-32(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	sv_csr_peek_wrapper@PLT
	movl	%eax, -36(%rbp)
	movl	-36(%rbp), %eax
	movl	%eax, %edi
	call	SWIG_From_unsigned_SS_int
	movq	%rax, %rdx
	movq	-64(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	Tcl_SetObjResult@PLT
	movl	-48(%rbp), %eax
	cmpl	$512, %eax
	jne	.L505
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L505:
	movl	$0, %eax
	jmp	.L508
.L510:
	nop
.L498:
	movl	-48(%rbp), %eax
	cmpl	$512, %eax
	jne	.L507
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L507:
	movl	$1, %eax
.L508:
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L509
	call	__stack_chk_fail@PLT
.L509:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE62:
	.size	_wrap_sv_csr_peek_wrapper, .-_wrap_sv_csr_peek_wrapper
	.section	.rodata
.LC60:
	.string	"o:sv_csr_qlen_wrapper p_key "
	.align 8
.LC61:
	.string	"in method 'sv_csr_qlen_wrapper', argument 1 of type 'char *'"
	.text
	.type	_wrap_sv_csr_qlen_wrapper, @function
_wrap_sv_csr_qlen_wrapper:
.LFB63:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movl	%edx, -68(%rbp)
	movq	%rcx, -80(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -16(%rbp)
	movq	$0, -24(%rbp)
	movl	$0, -36(%rbp)
	movq	-80(%rbp), %rdx
	movl	-68(%rbp), %esi
	movq	-64(%rbp), %rax
	movl	$0, %r8d
	leaq	.LC60(%rip), %rcx
	movq	%rax, %rdi
	movl	$0, %eax
	call	SWIG_Tcl_GetArgs
	cmpl	$1, %eax
	je	.L522
	movq	-80(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	-36(%rbp), %rdx
	leaq	-24(%rbp), %rsi
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	SWIG_AsCharPtrAndSize
	movl	%eax, -32(%rbp)
	cmpl	$0, -32(%rbp)
	jns	.L514
	cmpl	$-1, -32(%rbp)
	je	.L515
	movl	-32(%rbp), %eax
	jmp	.L516
.L515:
	movl	$-5, %eax
.L516:
	movl	%eax, %edi
	call	SWIG_Tcl_ErrorType
	movq	%rax, %rcx
	movq	-64(%rbp), %rax
	leaq	.LC61(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_SetErrorMsg
	jmp	.L513
.L514:
	movq	-24(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	sv_csr_qlen_wrapper@PLT
	movl	%eax, -28(%rbp)
	movl	-28(%rbp), %eax
	movl	%eax, %edi
	call	SWIG_From_unsigned_SS_int
	movq	%rax, %rdx
	movq	-64(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	Tcl_SetObjResult@PLT
	movl	-36(%rbp), %eax
	cmpl	$512, %eax
	jne	.L517
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L517:
	movl	$0, %eax
	jmp	.L520
.L522:
	nop
.L513:
	movl	-36(%rbp), %eax
	cmpl	$512, %eax
	jne	.L519
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L519:
	movl	$1, %eax
.L520:
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L521
	call	__stack_chk_fail@PLT
.L521:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE63:
	.size	_wrap_sv_csr_qlen_wrapper, .-_wrap_sv_csr_qlen_wrapper
	.section	.rodata
	.align 8
.LC62:
	.string	"oo:node_t_p_next_set self p_next "
	.align 8
.LC63:
	.string	"in method 'node_t_p_next_set', argument 1 of type 'struct node *'"
	.align 8
.LC64:
	.string	"in method 'node_t_p_next_set', argument 2 of type 'struct node *'"
	.text
	.type	_wrap_node_t_p_next_set, @function
_wrap_node_t_p_next_set:
.LFB64:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movl	%edx, -68(%rbp)
	movq	%rcx, -80(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -24(%rbp)
	movq	$0, -16(%rbp)
	movq	$0, -40(%rbp)
	movl	$0, -48(%rbp)
	movq	$0, -32(%rbp)
	movl	$0, -44(%rbp)
	movq	-80(%rbp), %rdx
	movl	-68(%rbp), %esi
	movq	-64(%rbp), %rax
	movl	$0, %r9d
	movl	$0, %r8d
	leaq	.LC62(%rip), %rcx
	movq	%rax, %rdi
	movl	$0, %eax
	call	SWIG_Tcl_GetArgs
	cmpl	$1, %eax
	je	.L536
	movq	16+swig_types(%rip), %rcx
	movq	-80(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rsi
	leaq	-40(%rbp), %rdx
	movq	-64(%rbp), %rax
	movl	$0, %r8d
	movq	%rax, %rdi
	call	SWIG_Tcl_ConvertPtr
	movl	%eax, -48(%rbp)
	cmpl	$0, -48(%rbp)
	jns	.L526
	cmpl	$-1, -48(%rbp)
	je	.L527
	movl	-48(%rbp), %eax
	jmp	.L528
.L527:
	movl	$-5, %eax
.L528:
	movl	%eax, %edi
	call	SWIG_Tcl_ErrorType
	movq	%rax, %rcx
	movq	-64(%rbp), %rax
	leaq	.LC63(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_SetErrorMsg
	jmp	.L525
.L526:
	movq	-40(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	16+swig_types(%rip), %rcx
	movq	-80(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rsi
	leaq	-32(%rbp), %rdx
	movq	-64(%rbp), %rax
	movl	$1, %r8d
	movq	%rax, %rdi
	call	SWIG_Tcl_ConvertPtr
	movl	%eax, -44(%rbp)
	cmpl	$0, -44(%rbp)
	jns	.L529
	cmpl	$-1, -44(%rbp)
	je	.L530
	movl	-44(%rbp), %eax
	jmp	.L531
.L530:
	movl	$-5, %eax
.L531:
	movl	%eax, %edi
	call	SWIG_Tcl_ErrorType
	movq	%rax, %rcx
	movq	-64(%rbp), %rax
	leaq	.LC64(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_SetErrorMsg
	jmp	.L525
.L529:
	movq	-32(%rbp), %rax
	movq	%rax, -16(%rbp)
	cmpq	$0, -24(%rbp)
	je	.L532
	movq	-24(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, (%rax)
.L532:
	movl	$0, %eax
	jmp	.L534
.L536:
	nop
.L525:
	movl	$1, %eax
.L534:
	movq	-8(%rbp), %rdi
	xorq	%fs:40, %rdi
	je	.L535
	call	__stack_chk_fail@PLT
.L535:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE64:
	.size	_wrap_node_t_p_next_set, .-_wrap_node_t_p_next_set
	.section	.rodata
.LC65:
	.string	"o:node_t_p_next_get self "
	.align 8
.LC66:
	.string	"in method 'node_t_p_next_get', argument 1 of type 'struct node *'"
	.text
	.type	_wrap_node_t_p_next_get, @function
_wrap_node_t_p_next_get:
.LFB65:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movl	%edx, -68(%rbp)
	movq	%rcx, -80(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -24(%rbp)
	movq	$0, -32(%rbp)
	movl	$0, -36(%rbp)
	movq	$0, -16(%rbp)
	movq	-80(%rbp), %rdx
	movl	-68(%rbp), %esi
	movq	-64(%rbp), %rax
	movl	$0, %r8d
	leaq	.LC65(%rip), %rcx
	movq	%rax, %rdi
	movl	$0, %eax
	call	SWIG_Tcl_GetArgs
	cmpl	$1, %eax
	je	.L546
	movq	16+swig_types(%rip), %rcx
	movq	-80(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rsi
	leaq	-32(%rbp), %rdx
	movq	-64(%rbp), %rax
	movl	$0, %r8d
	movq	%rax, %rdi
	call	SWIG_Tcl_ConvertPtr
	movl	%eax, -36(%rbp)
	cmpl	$0, -36(%rbp)
	jns	.L540
	cmpl	$-1, -36(%rbp)
	je	.L541
	movl	-36(%rbp), %eax
	jmp	.L542
.L541:
	movl	$-5, %eax
.L542:
	movl	%eax, %edi
	call	SWIG_Tcl_ErrorType
	movq	%rax, %rcx
	movq	-64(%rbp), %rax
	leaq	.LC66(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_SetErrorMsg
	jmp	.L539
.L540:
	movq	-32(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	16+swig_types(%rip), %rdx
	movq	-16(%rbp), %rsi
	movq	-64(%rbp), %rax
	movl	$0, %ecx
	movq	%rax, %rdi
	call	SWIG_Tcl_NewInstanceObj
	movq	%rax, %rdx
	movq	-64(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	Tcl_SetObjResult@PLT
	movl	$0, %eax
	jmp	.L544
.L546:
	nop
.L539:
	movl	$1, %eax
.L544:
	movq	-8(%rbp), %rdi
	xorq	%fs:40, %rdi
	je	.L545
	call	__stack_chk_fail@PLT
.L545:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE65:
	.size	_wrap_node_t_p_next_get, .-_wrap_node_t_p_next_get
	.section	.rodata
	.align 8
.LC67:
	.string	"oo:node_t_p_port_set self p_port "
	.align 8
.LC68:
	.string	"in method 'node_t_p_port_set', argument 1 of type 'struct node *'"
	.align 8
.LC69:
	.string	"in method 'node_t_p_port_set', argument 2 of type 'char *'"
	.text
	.type	_wrap_node_t_p_port_set, @function
_wrap_node_t_p_port_set:
.LFB66:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movq	%rdi, -72(%rbp)
	movq	%rsi, -80(%rbp)
	movl	%edx, -84(%rbp)
	movq	%rcx, -96(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -32(%rbp)
	movq	$0, -24(%rbp)
	movq	$0, -48(%rbp)
	movl	$0, -56(%rbp)
	movq	$0, -40(%rbp)
	movl	$0, -60(%rbp)
	movq	-96(%rbp), %rdx
	movl	-84(%rbp), %esi
	movq	-80(%rbp), %rax
	movl	$0, %r9d
	movl	$0, %r8d
	leaq	.LC67(%rip), %rcx
	movq	%rax, %rdi
	movl	$0, %eax
	call	SWIG_Tcl_GetArgs
	cmpl	$1, %eax
	je	.L564
	movq	16+swig_types(%rip), %rcx
	movq	-96(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rsi
	leaq	-48(%rbp), %rdx
	movq	-80(%rbp), %rax
	movl	$0, %r8d
	movq	%rax, %rdi
	call	SWIG_Tcl_ConvertPtr
	movl	%eax, -56(%rbp)
	cmpl	$0, -56(%rbp)
	jns	.L550
	cmpl	$-1, -56(%rbp)
	je	.L551
	movl	-56(%rbp), %eax
	jmp	.L552
.L551:
	movl	$-5, %eax
.L552:
	movl	%eax, %edi
	call	SWIG_Tcl_ErrorType
	movq	%rax, %rcx
	movq	-80(%rbp), %rax
	leaq	.LC68(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_SetErrorMsg
	jmp	.L549
.L550:
	movq	-48(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	-96(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	leaq	-60(%rbp), %rdx
	leaq	-40(%rbp), %rsi
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	SWIG_AsCharPtrAndSize
	movl	%eax, -52(%rbp)
	cmpl	$0, -52(%rbp)
	jns	.L553
	cmpl	$-1, -52(%rbp)
	je	.L554
	movl	-52(%rbp), %eax
	jmp	.L555
.L554:
	movl	$-5, %eax
.L555:
	movl	%eax, %edi
	call	SWIG_Tcl_ErrorType
	movq	%rax, %rcx
	movq	-80(%rbp), %rax
	leaq	.LC69(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_SetErrorMsg
	jmp	.L549
.L553:
	movq	-40(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L556
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
.L556:
	cmpq	$0, -24(%rbp)
	je	.L557
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	addq	$1, %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, %rcx
	movq	-16(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	movq	%rcx, %rdi
	call	memcpy@PLT
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, 8(%rax)
	jmp	.L558
.L557:
	movq	-32(%rbp), %rax
	movq	$0, 8(%rax)
.L558:
	movl	-60(%rbp), %eax
	cmpl	$512, %eax
	jne	.L559
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L559:
	movl	$0, %eax
	jmp	.L562
.L564:
	nop
.L549:
	movl	-60(%rbp), %eax
	cmpl	$512, %eax
	jne	.L561
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L561:
	movl	$1, %eax
.L562:
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L563
	call	__stack_chk_fail@PLT
.L563:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE66:
	.size	_wrap_node_t_p_port_set, .-_wrap_node_t_p_port_set
	.section	.rodata
.LC70:
	.string	"o:node_t_p_port_get self "
	.align 8
.LC71:
	.string	"in method 'node_t_p_port_get', argument 1 of type 'struct node *'"
	.text
	.type	_wrap_node_t_p_port_get, @function
_wrap_node_t_p_port_get:
.LFB67:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movl	%edx, -68(%rbp)
	movq	%rcx, -80(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -24(%rbp)
	movq	$0, -32(%rbp)
	movl	$0, -36(%rbp)
	movq	$0, -16(%rbp)
	movq	-80(%rbp), %rdx
	movl	-68(%rbp), %esi
	movq	-64(%rbp), %rax
	movl	$0, %r8d
	leaq	.LC70(%rip), %rcx
	movq	%rax, %rdi
	movl	$0, %eax
	call	SWIG_Tcl_GetArgs
	cmpl	$1, %eax
	je	.L574
	movq	16+swig_types(%rip), %rcx
	movq	-80(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rsi
	leaq	-32(%rbp), %rdx
	movq	-64(%rbp), %rax
	movl	$0, %r8d
	movq	%rax, %rdi
	call	SWIG_Tcl_ConvertPtr
	movl	%eax, -36(%rbp)
	cmpl	$0, -36(%rbp)
	jns	.L568
	cmpl	$-1, -36(%rbp)
	je	.L569
	movl	-36(%rbp), %eax
	jmp	.L570
.L569:
	movl	$-5, %eax
.L570:
	movl	%eax, %edi
	call	SWIG_Tcl_ErrorType
	movq	%rax, %rcx
	movq	-64(%rbp), %rax
	leaq	.LC71(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_SetErrorMsg
	jmp	.L567
.L568:
	movq	-32(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	SWIG_FromCharPtr
	movq	%rax, %rdx
	movq	-64(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	Tcl_SetObjResult@PLT
	movl	$0, %eax
	jmp	.L572
.L574:
	nop
.L567:
	movl	$1, %eax
.L572:
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L573
	call	__stack_chk_fail@PLT
.L573:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE67:
	.size	_wrap_node_t_p_port_get, .-_wrap_node_t_p_port_get
	.section	.rodata
	.align 8
.LC72:
	.string	"oo:node_t_p_buffer_set self p_buffer "
	.align 8
.LC73:
	.string	"in method 'node_t_p_buffer_set', argument 1 of type 'struct node *'"
	.align 8
.LC74:
	.string	"in method 'node_t_p_buffer_set', argument 2 of type 'char *'"
	.text
	.type	_wrap_node_t_p_buffer_set, @function
_wrap_node_t_p_buffer_set:
.LFB68:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movq	%rdi, -72(%rbp)
	movq	%rsi, -80(%rbp)
	movl	%edx, -84(%rbp)
	movq	%rcx, -96(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -32(%rbp)
	movq	$0, -24(%rbp)
	movq	$0, -48(%rbp)
	movl	$0, -56(%rbp)
	movq	$0, -40(%rbp)
	movl	$0, -60(%rbp)
	movq	-96(%rbp), %rdx
	movl	-84(%rbp), %esi
	movq	-80(%rbp), %rax
	movl	$0, %r9d
	movl	$0, %r8d
	leaq	.LC72(%rip), %rcx
	movq	%rax, %rdi
	movl	$0, %eax
	call	SWIG_Tcl_GetArgs
	cmpl	$1, %eax
	je	.L592
	movq	16+swig_types(%rip), %rcx
	movq	-96(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rsi
	leaq	-48(%rbp), %rdx
	movq	-80(%rbp), %rax
	movl	$0, %r8d
	movq	%rax, %rdi
	call	SWIG_Tcl_ConvertPtr
	movl	%eax, -56(%rbp)
	cmpl	$0, -56(%rbp)
	jns	.L578
	cmpl	$-1, -56(%rbp)
	je	.L579
	movl	-56(%rbp), %eax
	jmp	.L580
.L579:
	movl	$-5, %eax
.L580:
	movl	%eax, %edi
	call	SWIG_Tcl_ErrorType
	movq	%rax, %rcx
	movq	-80(%rbp), %rax
	leaq	.LC73(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_SetErrorMsg
	jmp	.L577
.L578:
	movq	-48(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	-96(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	leaq	-60(%rbp), %rdx
	leaq	-40(%rbp), %rsi
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	SWIG_AsCharPtrAndSize
	movl	%eax, -52(%rbp)
	cmpl	$0, -52(%rbp)
	jns	.L581
	cmpl	$-1, -52(%rbp)
	je	.L582
	movl	-52(%rbp), %eax
	jmp	.L583
.L582:
	movl	$-5, %eax
.L583:
	movl	%eax, %edi
	call	SWIG_Tcl_ErrorType
	movq	%rax, %rcx
	movq	-80(%rbp), %rax
	leaq	.LC74(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_SetErrorMsg
	jmp	.L577
.L581:
	movq	-40(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	-32(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L584
	movq	-32(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
.L584:
	cmpq	$0, -24(%rbp)
	je	.L585
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	addq	$1, %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, %rcx
	movq	-16(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	movq	%rcx, %rdi
	call	memcpy@PLT
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, 16(%rax)
	jmp	.L586
.L585:
	movq	-32(%rbp), %rax
	movq	$0, 16(%rax)
.L586:
	movl	-60(%rbp), %eax
	cmpl	$512, %eax
	jne	.L587
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L587:
	movl	$0, %eax
	jmp	.L590
.L592:
	nop
.L577:
	movl	-60(%rbp), %eax
	cmpl	$512, %eax
	jne	.L589
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L589:
	movl	$1, %eax
.L590:
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L591
	call	__stack_chk_fail@PLT
.L591:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE68:
	.size	_wrap_node_t_p_buffer_set, .-_wrap_node_t_p_buffer_set
	.section	.rodata
.LC75:
	.string	"o:node_t_p_buffer_get self "
	.align 8
.LC76:
	.string	"in method 'node_t_p_buffer_get', argument 1 of type 'struct node *'"
	.text
	.type	_wrap_node_t_p_buffer_get, @function
_wrap_node_t_p_buffer_get:
.LFB69:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movl	%edx, -68(%rbp)
	movq	%rcx, -80(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -24(%rbp)
	movq	$0, -32(%rbp)
	movl	$0, -36(%rbp)
	movq	$0, -16(%rbp)
	movq	-80(%rbp), %rdx
	movl	-68(%rbp), %esi
	movq	-64(%rbp), %rax
	movl	$0, %r8d
	leaq	.LC75(%rip), %rcx
	movq	%rax, %rdi
	movl	$0, %eax
	call	SWIG_Tcl_GetArgs
	cmpl	$1, %eax
	je	.L602
	movq	16+swig_types(%rip), %rcx
	movq	-80(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rsi
	leaq	-32(%rbp), %rdx
	movq	-64(%rbp), %rax
	movl	$0, %r8d
	movq	%rax, %rdi
	call	SWIG_Tcl_ConvertPtr
	movl	%eax, -36(%rbp)
	cmpl	$0, -36(%rbp)
	jns	.L596
	cmpl	$-1, -36(%rbp)
	je	.L597
	movl	-36(%rbp), %eax
	jmp	.L598
.L597:
	movl	$-5, %eax
.L598:
	movl	%eax, %edi
	call	SWIG_Tcl_ErrorType
	movq	%rax, %rcx
	movq	-64(%rbp), %rax
	leaq	.LC76(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_SetErrorMsg
	jmp	.L595
.L596:
	movq	-32(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	SWIG_FromCharPtr
	movq	%rax, %rdx
	movq	-64(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	Tcl_SetObjResult@PLT
	movl	$0, %eax
	jmp	.L600
.L602:
	nop
.L595:
	movl	$1, %eax
.L600:
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L601
	call	__stack_chk_fail@PLT
.L601:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE69:
	.size	_wrap_node_t_p_buffer_get, .-_wrap_node_t_p_buffer_get
	.section	.rodata
.LC77:
	.string	"oo:node_t_size_set self size "
	.align 8
.LC78:
	.string	"in method 'node_t_size_set', argument 1 of type 'struct node *'"
	.align 8
.LC79:
	.string	"in method 'node_t_size_set', argument 2 of type 'int'"
	.text
	.type	_wrap_node_t_size_set, @function
_wrap_node_t_size_set:
.LFB70:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movl	%edx, -68(%rbp)
	movq	%rcx, -80(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -16(%rbp)
	movq	$0, -24(%rbp)
	movl	$0, -36(%rbp)
	movl	$0, -32(%rbp)
	movq	-80(%rbp), %rdx
	movl	-68(%rbp), %esi
	movq	-64(%rbp), %rax
	movl	$0, %r9d
	movl	$0, %r8d
	leaq	.LC77(%rip), %rcx
	movq	%rax, %rdi
	movl	$0, %eax
	call	SWIG_Tcl_GetArgs
	cmpl	$1, %eax
	je	.L616
	movq	16+swig_types(%rip), %rcx
	movq	-80(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rsi
	leaq	-24(%rbp), %rdx
	movq	-64(%rbp), %rax
	movl	$0, %r8d
	movq	%rax, %rdi
	call	SWIG_Tcl_ConvertPtr
	movl	%eax, -36(%rbp)
	cmpl	$0, -36(%rbp)
	jns	.L606
	cmpl	$-1, -36(%rbp)
	je	.L607
	movl	-36(%rbp), %eax
	jmp	.L608
.L607:
	movl	$-5, %eax
.L608:
	movl	%eax, %edi
	call	SWIG_Tcl_ErrorType
	movq	%rax, %rcx
	movq	-64(%rbp), %rax
	leaq	.LC78(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_SetErrorMsg
	jmp	.L605
.L606:
	movq	-24(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-80(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rcx
	leaq	-40(%rbp), %rdx
	movq	-64(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_AsVal_int
	movl	%eax, -32(%rbp)
	cmpl	$0, -32(%rbp)
	jns	.L609
	cmpl	$-1, -32(%rbp)
	je	.L610
	movl	-32(%rbp), %eax
	jmp	.L611
.L610:
	movl	$-5, %eax
.L611:
	movl	%eax, %edi
	call	SWIG_Tcl_ErrorType
	movq	%rax, %rcx
	movq	-64(%rbp), %rax
	leaq	.LC79(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_SetErrorMsg
	jmp	.L605
.L609:
	movl	-40(%rbp), %eax
	movl	%eax, -28(%rbp)
	cmpq	$0, -16(%rbp)
	je	.L612
	movq	-16(%rbp), %rax
	movl	-28(%rbp), %edx
	movl	%edx, 24(%rax)
.L612:
	movl	$0, %eax
	jmp	.L614
.L616:
	nop
.L605:
	movl	$1, %eax
.L614:
	movq	-8(%rbp), %rdi
	xorq	%fs:40, %rdi
	je	.L615
	call	__stack_chk_fail@PLT
.L615:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE70:
	.size	_wrap_node_t_size_set, .-_wrap_node_t_size_set
	.section	.rodata
.LC80:
	.string	"o:node_t_size_get self "
	.align 8
.LC81:
	.string	"in method 'node_t_size_get', argument 1 of type 'struct node *'"
	.text
	.type	_wrap_node_t_size_get, @function
_wrap_node_t_size_get:
.LFB71:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movl	%edx, -52(%rbp)
	movq	%rcx, -64(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -16(%rbp)
	movq	$0, -24(%rbp)
	movl	$0, -32(%rbp)
	movq	-64(%rbp), %rdx
	movl	-52(%rbp), %esi
	movq	-48(%rbp), %rax
	movl	$0, %r8d
	leaq	.LC80(%rip), %rcx
	movq	%rax, %rdi
	movl	$0, %eax
	call	SWIG_Tcl_GetArgs
	cmpl	$1, %eax
	je	.L626
	movq	16+swig_types(%rip), %rcx
	movq	-64(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rsi
	leaq	-24(%rbp), %rdx
	movq	-48(%rbp), %rax
	movl	$0, %r8d
	movq	%rax, %rdi
	call	SWIG_Tcl_ConvertPtr
	movl	%eax, -32(%rbp)
	cmpl	$0, -32(%rbp)
	jns	.L620
	cmpl	$-1, -32(%rbp)
	je	.L621
	movl	-32(%rbp), %eax
	jmp	.L622
.L621:
	movl	$-5, %eax
.L622:
	movl	%eax, %edi
	call	SWIG_Tcl_ErrorType
	movq	%rax, %rcx
	movq	-48(%rbp), %rax
	leaq	.LC81(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_SetErrorMsg
	jmp	.L619
.L620:
	movq	-24(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	24(%rax), %eax
	movl	%eax, -28(%rbp)
	movl	-28(%rbp), %eax
	movl	%eax, %edi
	call	SWIG_From_int
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	Tcl_SetObjResult@PLT
	movl	$0, %eax
	jmp	.L624
.L626:
	nop
.L619:
	movl	$1, %eax
.L624:
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L625
	call	__stack_chk_fail@PLT
.L625:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE71:
	.size	_wrap_node_t_size_get, .-_wrap_node_t_size_get
	.section	.rodata
.LC82:
	.string	":new_node_t "
	.text
	.type	_wrap_new_node_t, @function
_wrap_new_node_t:
.LFB72:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	%edx, -36(%rbp)
	movq	%rcx, -48(%rbp)
	movq	$0, -8(%rbp)
	movq	-48(%rbp), %rdx
	movl	-36(%rbp), %esi
	movq	-32(%rbp), %rax
	leaq	.LC82(%rip), %rcx
	movq	%rax, %rdi
	movl	$0, %eax
	call	SWIG_Tcl_GetArgs
	cmpl	$1, %eax
	je	.L632
	movl	$32, %esi
	movl	$1, %edi
	call	calloc@PLT
	movq	%rax, -8(%rbp)
	movq	16+swig_types(%rip), %rdx
	movq	-8(%rbp), %rsi
	movq	-32(%rbp), %rax
	movl	$0, %ecx
	movq	%rax, %rdi
	call	SWIG_Tcl_NewInstanceObj
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	Tcl_SetObjResult@PLT
	movl	$0, %eax
	jmp	.L630
.L632:
	nop
.L629:
	movl	$1, %eax
.L630:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE72:
	.size	_wrap_new_node_t, .-_wrap_new_node_t
	.section	.rodata
.LC83:
	.string	"o:delete_node_t self "
	.align 8
.LC84:
	.string	"in method 'delete_node_t', argument 1 of type 'struct node *'"
	.text
	.type	_wrap_delete_node_t, @function
_wrap_delete_node_t:
.LFB73:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movl	%edx, -52(%rbp)
	movq	%rcx, -64(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -16(%rbp)
	movq	$0, -24(%rbp)
	movl	$0, -28(%rbp)
	movq	-64(%rbp), %rdx
	movl	-52(%rbp), %esi
	movq	-48(%rbp), %rax
	movl	$0, %r8d
	leaq	.LC83(%rip), %rcx
	movq	%rax, %rdi
	movl	$0, %eax
	call	SWIG_Tcl_GetArgs
	cmpl	$1, %eax
	je	.L642
	movq	16+swig_types(%rip), %rcx
	movq	-64(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rsi
	leaq	-24(%rbp), %rdx
	movq	-48(%rbp), %rax
	movl	$1, %r8d
	movq	%rax, %rdi
	call	SWIG_Tcl_ConvertPtr
	movl	%eax, -28(%rbp)
	cmpl	$0, -28(%rbp)
	jns	.L636
	cmpl	$-1, -28(%rbp)
	je	.L637
	movl	-28(%rbp), %eax
	jmp	.L638
.L637:
	movl	$-5, %eax
.L638:
	movl	%eax, %edi
	call	SWIG_Tcl_ErrorType
	movq	%rax, %rcx
	movq	-48(%rbp), %rax
	leaq	.LC84(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_SetErrorMsg
	jmp	.L635
.L636:
	movq	-24(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movl	$0, %eax
	jmp	.L640
.L642:
	nop
.L635:
	movl	$1, %eax
.L640:
	movq	-8(%rbp), %rdi
	xorq	%fs:40, %rdi
	je	.L641
	call	__stack_chk_fail@PLT
.L641:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE73:
	.size	_wrap_delete_node_t, .-_wrap_delete_node_t
	.type	swig_delete_node_t, @function
swig_delete_node_t:
.LFB74:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE74:
	.size	swig_delete_node_t, .-swig_delete_node_t
	.local	swig_node_methods
	.comm	swig_node_methods,16,16
	.section	.rodata
.LC85:
	.string	"-p_next"
.LC86:
	.string	"-p_port"
.LC87:
	.string	"-p_buffer"
.LC88:
	.string	"-size"
	.section	.data.rel.local
	.align 32
	.type	swig_node_attributes, @object
	.size	swig_node_attributes, 120
swig_node_attributes:
	.quad	.LC85
	.quad	_wrap_node_t_p_next_get
	.quad	_wrap_node_t_p_next_set
	.quad	.LC86
	.quad	_wrap_node_t_p_port_get
	.quad	_wrap_node_t_p_port_set
	.quad	.LC87
	.quad	_wrap_node_t_p_buffer_get
	.quad	_wrap_node_t_p_buffer_set
	.quad	.LC88
	.quad	_wrap_node_t_size_get
	.quad	_wrap_node_t_size_set
	.quad	0
	.quad	0
	.quad	0
	.local	swig_node_bases
	.comm	swig_node_bases,8,8
	.local	swig_node_base_names
	.comm	swig_node_base_names,8,8
	.section	.rodata
.LC89:
	.string	"node_t"
	.section	.data.rel.local
	.align 32
	.type	_wrap_class_node, @object
	.size	_wrap_class_node, 160
_wrap_class_node:
	.quad	.LC89
	.quad	swig_types+16
	.quad	_wrap_new_node_t
	.quad	swig_delete_node_t
	.quad	swig_node_methods
	.quad	swig_node_attributes
	.quad	swig_node_bases
	.quad	swig_node_base_names
	.quad	swig_module
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.quad	0
	.quad	0
	.quad	0
	.section	.rodata
.LC90:
	.string	":port_mgr_init "
	.text
	.type	_wrap_port_mgr_init, @function
_wrap_port_mgr_init:
.LFB75:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	%edx, -20(%rbp)
	movq	%rcx, -32(%rbp)
	movq	-32(%rbp), %rdx
	movl	-20(%rbp), %esi
	movq	-16(%rbp), %rax
	leaq	.LC90(%rip), %rcx
	movq	%rax, %rdi
	movl	$0, %eax
	call	SWIG_Tcl_GetArgs
	cmpl	$1, %eax
	je	.L649
	call	port_mgr_init@PLT
	movl	$0, %eax
	jmp	.L647
.L649:
	nop
.L646:
	movl	$1, %eax
.L647:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE75:
	.size	_wrap_port_mgr_init, .-_wrap_port_mgr_init
	.section	.rodata
.LC91:
	.string	":port_mgr_reset "
	.text
	.type	_wrap_port_mgr_reset, @function
_wrap_port_mgr_reset:
.LFB76:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	%edx, -20(%rbp)
	movq	%rcx, -32(%rbp)
	movq	-32(%rbp), %rdx
	movl	-20(%rbp), %esi
	movq	-16(%rbp), %rax
	leaq	.LC91(%rip), %rcx
	movq	%rax, %rdi
	movl	$0, %eax
	call	SWIG_Tcl_GetArgs
	cmpl	$1, %eax
	je	.L655
	call	port_mgr_reset@PLT
	movl	$0, %eax
	jmp	.L653
.L655:
	nop
.L652:
	movl	$1, %eax
.L653:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE76:
	.size	_wrap_port_mgr_reset, .-_wrap_port_mgr_reset
	.section	.rodata
.LC92:
	.string	"oo:port_mgr_add p_port size "
	.align 8
.LC93:
	.string	"in method 'port_mgr_add', argument 1 of type 'char *'"
	.align 8
.LC94:
	.string	"in method 'port_mgr_add', argument 2 of type 'int'"
	.text
	.type	_wrap_port_mgr_add, @function
_wrap_port_mgr_add:
.LFB77:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movl	%edx, -68(%rbp)
	movq	%rcx, -80(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -16(%rbp)
	movq	$0, -24(%rbp)
	movl	$0, -44(%rbp)
	movl	$0, -36(%rbp)
	movq	-80(%rbp), %rdx
	movl	-68(%rbp), %esi
	movq	-64(%rbp), %rax
	movl	$0, %r9d
	movl	$0, %r8d
	leaq	.LC92(%rip), %rcx
	movq	%rax, %rdi
	movl	$0, %eax
	call	SWIG_Tcl_GetArgs
	cmpl	$1, %eax
	je	.L670
	movq	-80(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	-44(%rbp), %rdx
	leaq	-24(%rbp), %rsi
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	SWIG_AsCharPtrAndSize
	movl	%eax, -32(%rbp)
	cmpl	$0, -32(%rbp)
	jns	.L659
	cmpl	$-1, -32(%rbp)
	je	.L660
	movl	-32(%rbp), %eax
	jmp	.L661
.L660:
	movl	$-5, %eax
.L661:
	movl	%eax, %edi
	call	SWIG_Tcl_ErrorType
	movq	%rax, %rcx
	movq	-64(%rbp), %rax
	leaq	.LC93(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_SetErrorMsg
	jmp	.L658
.L659:
	movq	-24(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-80(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rcx
	leaq	-40(%rbp), %rdx
	movq	-64(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_AsVal_int
	movl	%eax, -36(%rbp)
	cmpl	$0, -36(%rbp)
	jns	.L662
	cmpl	$-1, -36(%rbp)
	je	.L663
	movl	-36(%rbp), %eax
	jmp	.L664
.L663:
	movl	$-5, %eax
.L664:
	movl	%eax, %edi
	call	SWIG_Tcl_ErrorType
	movq	%rax, %rcx
	movq	-64(%rbp), %rax
	leaq	.LC94(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_SetErrorMsg
	jmp	.L658
.L662:
	movl	-40(%rbp), %eax
	movl	%eax, -28(%rbp)
	movl	-28(%rbp), %edx
	movq	-16(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	port_mgr_add@PLT
	movl	-44(%rbp), %eax
	cmpl	$512, %eax
	jne	.L665
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L665:
	movl	$0, %eax
	jmp	.L668
.L670:
	nop
.L658:
	movl	-44(%rbp), %eax
	cmpl	$512, %eax
	jne	.L667
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L667:
	movl	$1, %eax
.L668:
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L669
	call	__stack_chk_fail@PLT
.L669:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE77:
	.size	_wrap_port_mgr_add, .-_wrap_port_mgr_add
	.section	.rodata
.LC95:
	.string	"o:port_mgr_delete p_port "
	.align 8
.LC96:
	.string	"in method 'port_mgr_delete', argument 1 of type 'char *'"
	.text
	.type	_wrap_port_mgr_delete, @function
_wrap_port_mgr_delete:
.LFB78:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movl	%edx, -68(%rbp)
	movq	%rcx, -80(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -16(%rbp)
	movq	$0, -24(%rbp)
	movl	$0, -32(%rbp)
	movq	-80(%rbp), %rdx
	movl	-68(%rbp), %esi
	movq	-64(%rbp), %rax
	movl	$0, %r8d
	leaq	.LC95(%rip), %rcx
	movq	%rax, %rdi
	movl	$0, %eax
	call	SWIG_Tcl_GetArgs
	cmpl	$1, %eax
	je	.L682
	movq	-80(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	-32(%rbp), %rdx
	leaq	-24(%rbp), %rsi
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	SWIG_AsCharPtrAndSize
	movl	%eax, -28(%rbp)
	cmpl	$0, -28(%rbp)
	jns	.L674
	cmpl	$-1, -28(%rbp)
	je	.L675
	movl	-28(%rbp), %eax
	jmp	.L676
.L675:
	movl	$-5, %eax
.L676:
	movl	%eax, %edi
	call	SWIG_Tcl_ErrorType
	movq	%rax, %rcx
	movq	-64(%rbp), %rax
	leaq	.LC96(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_SetErrorMsg
	jmp	.L673
.L674:
	movq	-24(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	port_mgr_delete@PLT
	movb	%al, -33(%rbp)
	movzbl	-33(%rbp), %eax
	movl	%eax, %edi
	call	Tcl_NewIntObj@PLT
	movq	%rax, %rdx
	movq	-64(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	Tcl_SetObjResult@PLT
	movl	-32(%rbp), %eax
	cmpl	$512, %eax
	jne	.L677
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L677:
	movl	$0, %eax
	jmp	.L680
.L682:
	nop
.L673:
	movl	-32(%rbp), %eax
	cmpl	$512, %eax
	jne	.L679
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L679:
	movl	$1, %eax
.L680:
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L681
	call	__stack_chk_fail@PLT
.L681:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE78:
	.size	_wrap_port_mgr_delete, .-_wrap_port_mgr_delete
	.section	.rodata
.LC97:
	.string	"o:port_mgr_get_msg p_port "
	.align 8
.LC98:
	.string	"in method 'port_mgr_get_msg', argument 1 of type 'char *'"
	.text
	.type	_wrap_port_mgr_get_msg, @function
_wrap_port_mgr_get_msg:
.LFB79:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movl	%edx, -68(%rbp)
	movq	%rcx, -80(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -24(%rbp)
	movq	$0, -32(%rbp)
	movl	$0, -40(%rbp)
	movq	$0, -16(%rbp)
	movq	-80(%rbp), %rdx
	movl	-68(%rbp), %esi
	movq	-64(%rbp), %rax
	movl	$0, %r8d
	leaq	.LC97(%rip), %rcx
	movq	%rax, %rdi
	movl	$0, %eax
	call	SWIG_Tcl_GetArgs
	cmpl	$1, %eax
	je	.L694
	movq	-80(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	-40(%rbp), %rdx
	leaq	-32(%rbp), %rsi
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	SWIG_AsCharPtrAndSize
	movl	%eax, -36(%rbp)
	cmpl	$0, -36(%rbp)
	jns	.L686
	cmpl	$-1, -36(%rbp)
	je	.L687
	movl	-36(%rbp), %eax
	jmp	.L688
.L687:
	movl	$-5, %eax
.L688:
	movl	%eax, %edi
	call	SWIG_Tcl_ErrorType
	movq	%rax, %rcx
	movq	-64(%rbp), %rax
	leaq	.LC98(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_SetErrorMsg
	jmp	.L685
.L686:
	movq	-32(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	port_mgr_get_msg@PLT
	movq	%rax, -16(%rbp)
	movq	48+swig_types(%rip), %rdx
	movq	-16(%rbp), %rsi
	movq	-64(%rbp), %rax
	movl	$0, %ecx
	movq	%rax, %rdi
	call	SWIG_Tcl_NewInstanceObj
	movq	%rax, %rdx
	movq	-64(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	Tcl_SetObjResult@PLT
	movl	-40(%rbp), %eax
	cmpl	$512, %eax
	jne	.L689
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L689:
	movl	$0, %eax
	jmp	.L692
.L694:
	nop
.L685:
	movl	-40(%rbp), %eax
	cmpl	$512, %eax
	jne	.L691
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L691:
	movl	$1, %eax
.L692:
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L693
	call	__stack_chk_fail@PLT
.L693:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE79:
	.size	_wrap_port_mgr_get_msg, .-_wrap_port_mgr_get_msg
	.section	.rodata
.LC99:
	.string	"o:port_mgr_get_size p_port "
	.align 8
.LC100:
	.string	"in method 'port_mgr_get_size', argument 1 of type 'char *'"
	.text
	.type	_wrap_port_mgr_get_size, @function
_wrap_port_mgr_get_size:
.LFB80:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movl	%edx, -68(%rbp)
	movq	%rcx, -80(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -16(%rbp)
	movq	$0, -24(%rbp)
	movl	$0, -36(%rbp)
	movq	-80(%rbp), %rdx
	movl	-68(%rbp), %esi
	movq	-64(%rbp), %rax
	movl	$0, %r8d
	leaq	.LC99(%rip), %rcx
	movq	%rax, %rdi
	movl	$0, %eax
	call	SWIG_Tcl_GetArgs
	cmpl	$1, %eax
	je	.L706
	movq	-80(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	-36(%rbp), %rdx
	leaq	-24(%rbp), %rsi
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	SWIG_AsCharPtrAndSize
	movl	%eax, -32(%rbp)
	cmpl	$0, -32(%rbp)
	jns	.L698
	cmpl	$-1, -32(%rbp)
	je	.L699
	movl	-32(%rbp), %eax
	jmp	.L700
.L699:
	movl	$-5, %eax
.L700:
	movl	%eax, %edi
	call	SWIG_Tcl_ErrorType
	movq	%rax, %rcx
	movq	-64(%rbp), %rax
	leaq	.LC100(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_SetErrorMsg
	jmp	.L697
.L698:
	movq	-24(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	port_mgr_get_size@PLT
	movl	%eax, -28(%rbp)
	movl	-28(%rbp), %eax
	movl	%eax, %edi
	call	SWIG_From_int
	movq	%rax, %rdx
	movq	-64(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	Tcl_SetObjResult@PLT
	movl	-36(%rbp), %eax
	cmpl	$512, %eax
	jne	.L701
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L701:
	movl	$0, %eax
	jmp	.L704
.L706:
	nop
.L697:
	movl	-36(%rbp), %eax
	cmpl	$512, %eax
	jne	.L703
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L703:
	movl	$1, %eax
.L704:
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L705
	call	__stack_chk_fail@PLT
.L705:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE80:
	.size	_wrap_port_mgr_get_size, .-_wrap_port_mgr_get_size
	.section	.rodata
.LC101:
	.string	"o:port_mgr_check p_port "
	.align 8
.LC102:
	.string	"in method 'port_mgr_check', argument 1 of type 'char *'"
	.text
	.type	_wrap_port_mgr_check, @function
_wrap_port_mgr_check:
.LFB81:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movl	%edx, -68(%rbp)
	movq	%rcx, -80(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -16(%rbp)
	movq	$0, -24(%rbp)
	movl	$0, -32(%rbp)
	movq	-80(%rbp), %rdx
	movl	-68(%rbp), %esi
	movq	-64(%rbp), %rax
	movl	$0, %r8d
	leaq	.LC101(%rip), %rcx
	movq	%rax, %rdi
	movl	$0, %eax
	call	SWIG_Tcl_GetArgs
	cmpl	$1, %eax
	je	.L718
	movq	-80(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	-32(%rbp), %rdx
	leaq	-24(%rbp), %rsi
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	SWIG_AsCharPtrAndSize
	movl	%eax, -28(%rbp)
	cmpl	$0, -28(%rbp)
	jns	.L710
	cmpl	$-1, -28(%rbp)
	je	.L711
	movl	-28(%rbp), %eax
	jmp	.L712
.L711:
	movl	$-5, %eax
.L712:
	movl	%eax, %edi
	call	SWIG_Tcl_ErrorType
	movq	%rax, %rcx
	movq	-64(%rbp), %rax
	leaq	.LC102(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_SetErrorMsg
	jmp	.L709
.L710:
	movq	-24(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	port_mgr_check@PLT
	movb	%al, -33(%rbp)
	movzbl	-33(%rbp), %eax
	movl	%eax, %edi
	call	Tcl_NewIntObj@PLT
	movq	%rax, %rdx
	movq	-64(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	Tcl_SetObjResult@PLT
	movl	-32(%rbp), %eax
	cmpl	$512, %eax
	jne	.L713
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L713:
	movl	$0, %eax
	jmp	.L716
.L718:
	nop
.L709:
	movl	-32(%rbp), %eax
	cmpl	$512, %eax
	jne	.L715
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L715:
	movl	$1, %eax
.L716:
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L717
	call	__stack_chk_fail@PLT
.L717:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE81:
	.size	_wrap_port_mgr_check, .-_wrap_port_mgr_check
	.section	.rodata
.LC103:
	.string	":port_mgr_dump "
	.text
	.type	_wrap_port_mgr_dump, @function
_wrap_port_mgr_dump:
.LFB82:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	%edx, -20(%rbp)
	movq	%rcx, -32(%rbp)
	movq	-32(%rbp), %rdx
	movl	-20(%rbp), %esi
	movq	-16(%rbp), %rax
	leaq	.LC103(%rip), %rcx
	movq	%rax, %rdi
	movl	$0, %eax
	call	SWIG_Tcl_GetArgs
	cmpl	$1, %eax
	je	.L724
	call	port_mgr_dump@PLT
	movl	$0, %eax
	jmp	.L722
.L724:
	nop
.L721:
	movl	$1, %eax
.L722:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE82:
	.size	_wrap_port_mgr_dump, .-_wrap_port_mgr_dump
	.section	.rodata
	.align 8
.LC104:
	.string	"ooo:port_mgr_msg_set p_port p_data offset "
	.align 8
.LC105:
	.string	"in method 'port_mgr_msg_set', argument 1 of type 'char *'"
	.align 8
.LC106:
	.string	"in method 'port_mgr_msg_set', argument 2 of type 'char *'"
	.align 8
.LC107:
	.string	"in method 'port_mgr_msg_set', argument 3 of type 'int'"
	.text
	.type	_wrap_port_mgr_msg_set, @function
_wrap_port_mgr_msg_set:
.LFB83:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$112, %rsp
	movq	%rdi, -88(%rbp)
	movq	%rsi, -96(%rbp)
	movl	%edx, -100(%rbp)
	movq	%rcx, -112(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -24(%rbp)
	movq	$0, -16(%rbp)
	movq	$0, -40(%rbp)
	movl	$0, -68(%rbp)
	movq	$0, -32(%rbp)
	movl	$0, -64(%rbp)
	movl	$0, -56(%rbp)
	movq	-112(%rbp), %rdx
	movl	-100(%rbp), %esi
	movq	-96(%rbp), %rax
	subq	$8, %rsp
	pushq	$0
	movl	$0, %r9d
	movl	$0, %r8d
	leaq	.LC104(%rip), %rcx
	movq	%rax, %rdi
	movl	$0, %eax
	call	SWIG_Tcl_GetArgs
	addq	$16, %rsp
	cmpl	$1, %eax
	je	.L744
	movq	-112(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	-68(%rbp), %rdx
	leaq	-40(%rbp), %rsi
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	SWIG_AsCharPtrAndSize
	movl	%eax, -52(%rbp)
	cmpl	$0, -52(%rbp)
	jns	.L728
	cmpl	$-1, -52(%rbp)
	je	.L729
	movl	-52(%rbp), %eax
	jmp	.L730
.L729:
	movl	$-5, %eax
.L730:
	movl	%eax, %edi
	call	SWIG_Tcl_ErrorType
	movq	%rax, %rcx
	movq	-96(%rbp), %rax
	leaq	.LC105(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_SetErrorMsg
	jmp	.L727
.L728:
	movq	-40(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	-112(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	leaq	-64(%rbp), %rdx
	leaq	-32(%rbp), %rsi
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	SWIG_AsCharPtrAndSize
	movl	%eax, -48(%rbp)
	cmpl	$0, -48(%rbp)
	jns	.L731
	cmpl	$-1, -48(%rbp)
	je	.L732
	movl	-48(%rbp), %eax
	jmp	.L733
.L732:
	movl	$-5, %eax
.L733:
	movl	%eax, %edi
	call	SWIG_Tcl_ErrorType
	movq	%rax, %rcx
	movq	-96(%rbp), %rax
	leaq	.LC106(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_SetErrorMsg
	jmp	.L727
.L731:
	movq	-32(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-112(%rbp), %rax
	addq	$24, %rax
	movq	(%rax), %rcx
	leaq	-60(%rbp), %rdx
	movq	-96(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_AsVal_int
	movl	%eax, -56(%rbp)
	cmpl	$0, -56(%rbp)
	jns	.L734
	cmpl	$-1, -56(%rbp)
	je	.L735
	movl	-56(%rbp), %eax
	jmp	.L736
.L735:
	movl	$-5, %eax
.L736:
	movl	%eax, %edi
	call	SWIG_Tcl_ErrorType
	movq	%rax, %rcx
	movq	-96(%rbp), %rax
	leaq	.LC107(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_SetErrorMsg
	jmp	.L727
.L734:
	movl	-60(%rbp), %eax
	movl	%eax, -44(%rbp)
	movl	-44(%rbp), %edx
	movq	-16(%rbp), %rcx
	movq	-24(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	port_mgr_msg_set@PLT
	movl	-68(%rbp), %eax
	cmpl	$512, %eax
	jne	.L737
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L737:
	movl	-64(%rbp), %eax
	cmpl	$512, %eax
	jne	.L738
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L738:
	movl	$0, %eax
	jmp	.L742
.L744:
	nop
.L727:
	movl	-68(%rbp), %eax
	cmpl	$512, %eax
	jne	.L740
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L740:
	movl	-64(%rbp), %eax
	cmpl	$512, %eax
	jne	.L741
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L741:
	movl	$1, %eax
.L742:
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L743
	call	__stack_chk_fail@PLT
.L743:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE83:
	.size	_wrap_port_mgr_msg_set, .-_wrap_port_mgr_msg_set
	.section	.rodata
	.align 8
.LC108:
	.string	"oo:port_mgr_msg_get p_port offset "
	.align 8
.LC109:
	.string	"in method 'port_mgr_msg_get', argument 1 of type 'char *'"
	.align 8
.LC110:
	.string	"in method 'port_mgr_msg_get', argument 2 of type 'int'"
	.text
	.type	_wrap_port_mgr_msg_get, @function
_wrap_port_mgr_msg_get:
.LFB84:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movq	%rdi, -72(%rbp)
	movq	%rsi, -80(%rbp)
	movl	%edx, -84(%rbp)
	movq	%rcx, -96(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -24(%rbp)
	movq	$0, -32(%rbp)
	movl	$0, -52(%rbp)
	movl	$0, -44(%rbp)
	movq	$0, -16(%rbp)
	movq	-96(%rbp), %rdx
	movl	-84(%rbp), %esi
	movq	-80(%rbp), %rax
	movl	$0, %r9d
	movl	$0, %r8d
	leaq	.LC108(%rip), %rcx
	movq	%rax, %rdi
	movl	$0, %eax
	call	SWIG_Tcl_GetArgs
	cmpl	$1, %eax
	je	.L759
	movq	-96(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	-52(%rbp), %rdx
	leaq	-32(%rbp), %rsi
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	SWIG_AsCharPtrAndSize
	movl	%eax, -40(%rbp)
	cmpl	$0, -40(%rbp)
	jns	.L748
	cmpl	$-1, -40(%rbp)
	je	.L749
	movl	-40(%rbp), %eax
	jmp	.L750
.L749:
	movl	$-5, %eax
.L750:
	movl	%eax, %edi
	call	SWIG_Tcl_ErrorType
	movq	%rax, %rcx
	movq	-80(%rbp), %rax
	leaq	.LC109(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_SetErrorMsg
	jmp	.L747
.L748:
	movq	-32(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	-96(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rcx
	leaq	-48(%rbp), %rdx
	movq	-80(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_AsVal_int
	movl	%eax, -44(%rbp)
	cmpl	$0, -44(%rbp)
	jns	.L751
	cmpl	$-1, -44(%rbp)
	je	.L752
	movl	-44(%rbp), %eax
	jmp	.L753
.L752:
	movl	$-5, %eax
.L753:
	movl	%eax, %edi
	call	SWIG_Tcl_ErrorType
	movq	%rax, %rcx
	movq	-80(%rbp), %rax
	leaq	.LC110(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_SetErrorMsg
	jmp	.L747
.L751:
	movl	-48(%rbp), %eax
	movl	%eax, -36(%rbp)
	movl	-36(%rbp), %edx
	movq	-24(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	port_mgr_msg_get@PLT
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	SWIG_FromCharPtr
	movq	%rax, %rdx
	movq	-80(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	Tcl_SetObjResult@PLT
	movl	-52(%rbp), %eax
	cmpl	$512, %eax
	jne	.L754
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L754:
	movl	$0, %eax
	jmp	.L757
.L759:
	nop
.L747:
	movl	-52(%rbp), %eax
	cmpl	$512, %eax
	jne	.L756
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L756:
	movl	$1, %eax
.L757:
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L758
	call	__stack_chk_fail@PLT
.L758:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE84:
	.size	_wrap_port_mgr_msg_get, .-_wrap_port_mgr_msg_get
	.section	.rodata
	.align 8
.LC111:
	.string	"oo:keynode_t_p_next_set self p_next "
	.align 8
.LC112:
	.string	"in method 'keynode_t_p_next_set', argument 1 of type 'struct keynode *'"
	.align 8
.LC113:
	.string	"in method 'keynode_t_p_next_set', argument 2 of type 'struct keynode *'"
	.text
	.type	_wrap_keynode_t_p_next_set, @function
_wrap_keynode_t_p_next_set:
.LFB85:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movl	%edx, -68(%rbp)
	movq	%rcx, -80(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -24(%rbp)
	movq	$0, -16(%rbp)
	movq	$0, -40(%rbp)
	movl	$0, -48(%rbp)
	movq	$0, -32(%rbp)
	movl	$0, -44(%rbp)
	movq	-80(%rbp), %rdx
	movl	-68(%rbp), %esi
	movq	-64(%rbp), %rax
	movl	$0, %r9d
	movl	$0, %r8d
	leaq	.LC111(%rip), %rcx
	movq	%rax, %rdi
	movl	$0, %eax
	call	SWIG_Tcl_GetArgs
	cmpl	$1, %eax
	je	.L773
	movq	8+swig_types(%rip), %rcx
	movq	-80(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rsi
	leaq	-40(%rbp), %rdx
	movq	-64(%rbp), %rax
	movl	$0, %r8d
	movq	%rax, %rdi
	call	SWIG_Tcl_ConvertPtr
	movl	%eax, -48(%rbp)
	cmpl	$0, -48(%rbp)
	jns	.L763
	cmpl	$-1, -48(%rbp)
	je	.L764
	movl	-48(%rbp), %eax
	jmp	.L765
.L764:
	movl	$-5, %eax
.L765:
	movl	%eax, %edi
	call	SWIG_Tcl_ErrorType
	movq	%rax, %rcx
	movq	-64(%rbp), %rax
	leaq	.LC112(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_SetErrorMsg
	jmp	.L762
.L763:
	movq	-40(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	8+swig_types(%rip), %rcx
	movq	-80(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rsi
	leaq	-32(%rbp), %rdx
	movq	-64(%rbp), %rax
	movl	$1, %r8d
	movq	%rax, %rdi
	call	SWIG_Tcl_ConvertPtr
	movl	%eax, -44(%rbp)
	cmpl	$0, -44(%rbp)
	jns	.L766
	cmpl	$-1, -44(%rbp)
	je	.L767
	movl	-44(%rbp), %eax
	jmp	.L768
.L767:
	movl	$-5, %eax
.L768:
	movl	%eax, %edi
	call	SWIG_Tcl_ErrorType
	movq	%rax, %rcx
	movq	-64(%rbp), %rax
	leaq	.LC113(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_SetErrorMsg
	jmp	.L762
.L766:
	movq	-32(%rbp), %rax
	movq	%rax, -16(%rbp)
	cmpq	$0, -24(%rbp)
	je	.L769
	movq	-24(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, (%rax)
.L769:
	movl	$0, %eax
	jmp	.L771
.L773:
	nop
.L762:
	movl	$1, %eax
.L771:
	movq	-8(%rbp), %rdi
	xorq	%fs:40, %rdi
	je	.L772
	call	__stack_chk_fail@PLT
.L772:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE85:
	.size	_wrap_keynode_t_p_next_set, .-_wrap_keynode_t_p_next_set
	.section	.rodata
.LC114:
	.string	"o:keynode_t_p_next_get self "
	.align 8
.LC115:
	.string	"in method 'keynode_t_p_next_get', argument 1 of type 'struct keynode *'"
	.text
	.type	_wrap_keynode_t_p_next_get, @function
_wrap_keynode_t_p_next_get:
.LFB86:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movl	%edx, -68(%rbp)
	movq	%rcx, -80(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -24(%rbp)
	movq	$0, -32(%rbp)
	movl	$0, -36(%rbp)
	movq	$0, -16(%rbp)
	movq	-80(%rbp), %rdx
	movl	-68(%rbp), %esi
	movq	-64(%rbp), %rax
	movl	$0, %r8d
	leaq	.LC114(%rip), %rcx
	movq	%rax, %rdi
	movl	$0, %eax
	call	SWIG_Tcl_GetArgs
	cmpl	$1, %eax
	je	.L783
	movq	8+swig_types(%rip), %rcx
	movq	-80(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rsi
	leaq	-32(%rbp), %rdx
	movq	-64(%rbp), %rax
	movl	$0, %r8d
	movq	%rax, %rdi
	call	SWIG_Tcl_ConvertPtr
	movl	%eax, -36(%rbp)
	cmpl	$0, -36(%rbp)
	jns	.L777
	cmpl	$-1, -36(%rbp)
	je	.L778
	movl	-36(%rbp), %eax
	jmp	.L779
.L778:
	movl	$-5, %eax
.L779:
	movl	%eax, %edi
	call	SWIG_Tcl_ErrorType
	movq	%rax, %rcx
	movq	-64(%rbp), %rax
	leaq	.LC115(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_SetErrorMsg
	jmp	.L776
.L777:
	movq	-32(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	8+swig_types(%rip), %rdx
	movq	-16(%rbp), %rsi
	movq	-64(%rbp), %rax
	movl	$0, %ecx
	movq	%rax, %rdi
	call	SWIG_Tcl_NewInstanceObj
	movq	%rax, %rdx
	movq	-64(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	Tcl_SetObjResult@PLT
	movl	$0, %eax
	jmp	.L781
.L783:
	nop
.L776:
	movl	$1, %eax
.L781:
	movq	-8(%rbp), %rdi
	xorq	%fs:40, %rdi
	je	.L782
	call	__stack_chk_fail@PLT
.L782:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE86:
	.size	_wrap_keynode_t_p_next_get, .-_wrap_keynode_t_p_next_get
	.section	.rodata
	.align 8
.LC116:
	.string	"oo:keynode_t_p_key_set self p_key "
	.align 8
.LC117:
	.string	"in method 'keynode_t_p_key_set', argument 1 of type 'struct keynode *'"
	.align 8
.LC118:
	.string	"in method 'keynode_t_p_key_set', argument 2 of type 'char *'"
	.text
	.type	_wrap_keynode_t_p_key_set, @function
_wrap_keynode_t_p_key_set:
.LFB87:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movq	%rdi, -72(%rbp)
	movq	%rsi, -80(%rbp)
	movl	%edx, -84(%rbp)
	movq	%rcx, -96(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -32(%rbp)
	movq	$0, -24(%rbp)
	movq	$0, -48(%rbp)
	movl	$0, -56(%rbp)
	movq	$0, -40(%rbp)
	movl	$0, -60(%rbp)
	movq	-96(%rbp), %rdx
	movl	-84(%rbp), %esi
	movq	-80(%rbp), %rax
	movl	$0, %r9d
	movl	$0, %r8d
	leaq	.LC116(%rip), %rcx
	movq	%rax, %rdi
	movl	$0, %eax
	call	SWIG_Tcl_GetArgs
	cmpl	$1, %eax
	je	.L801
	movq	8+swig_types(%rip), %rcx
	movq	-96(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rsi
	leaq	-48(%rbp), %rdx
	movq	-80(%rbp), %rax
	movl	$0, %r8d
	movq	%rax, %rdi
	call	SWIG_Tcl_ConvertPtr
	movl	%eax, -56(%rbp)
	cmpl	$0, -56(%rbp)
	jns	.L787
	cmpl	$-1, -56(%rbp)
	je	.L788
	movl	-56(%rbp), %eax
	jmp	.L789
.L788:
	movl	$-5, %eax
.L789:
	movl	%eax, %edi
	call	SWIG_Tcl_ErrorType
	movq	%rax, %rcx
	movq	-80(%rbp), %rax
	leaq	.LC117(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_SetErrorMsg
	jmp	.L786
.L787:
	movq	-48(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	-96(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	leaq	-60(%rbp), %rdx
	leaq	-40(%rbp), %rsi
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	SWIG_AsCharPtrAndSize
	movl	%eax, -52(%rbp)
	cmpl	$0, -52(%rbp)
	jns	.L790
	cmpl	$-1, -52(%rbp)
	je	.L791
	movl	-52(%rbp), %eax
	jmp	.L792
.L791:
	movl	$-5, %eax
.L792:
	movl	%eax, %edi
	call	SWIG_Tcl_ErrorType
	movq	%rax, %rcx
	movq	-80(%rbp), %rax
	leaq	.LC118(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_SetErrorMsg
	jmp	.L786
.L790:
	movq	-40(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L793
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
.L793:
	cmpq	$0, -24(%rbp)
	je	.L794
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	addq	$1, %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, %rcx
	movq	-16(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	movq	%rcx, %rdi
	call	memcpy@PLT
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, 8(%rax)
	jmp	.L795
.L794:
	movq	-32(%rbp), %rax
	movq	$0, 8(%rax)
.L795:
	movl	-60(%rbp), %eax
	cmpl	$512, %eax
	jne	.L796
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L796:
	movl	$0, %eax
	jmp	.L799
.L801:
	nop
.L786:
	movl	-60(%rbp), %eax
	cmpl	$512, %eax
	jne	.L798
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L798:
	movl	$1, %eax
.L799:
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L800
	call	__stack_chk_fail@PLT
.L800:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE87:
	.size	_wrap_keynode_t_p_key_set, .-_wrap_keynode_t_p_key_set
	.section	.rodata
.LC119:
	.string	"o:keynode_t_p_key_get self "
	.align 8
.LC120:
	.string	"in method 'keynode_t_p_key_get', argument 1 of type 'struct keynode *'"
	.text
	.type	_wrap_keynode_t_p_key_get, @function
_wrap_keynode_t_p_key_get:
.LFB88:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movl	%edx, -68(%rbp)
	movq	%rcx, -80(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -24(%rbp)
	movq	$0, -32(%rbp)
	movl	$0, -36(%rbp)
	movq	$0, -16(%rbp)
	movq	-80(%rbp), %rdx
	movl	-68(%rbp), %esi
	movq	-64(%rbp), %rax
	movl	$0, %r8d
	leaq	.LC119(%rip), %rcx
	movq	%rax, %rdi
	movl	$0, %eax
	call	SWIG_Tcl_GetArgs
	cmpl	$1, %eax
	je	.L811
	movq	8+swig_types(%rip), %rcx
	movq	-80(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rsi
	leaq	-32(%rbp), %rdx
	movq	-64(%rbp), %rax
	movl	$0, %r8d
	movq	%rax, %rdi
	call	SWIG_Tcl_ConvertPtr
	movl	%eax, -36(%rbp)
	cmpl	$0, -36(%rbp)
	jns	.L805
	cmpl	$-1, -36(%rbp)
	je	.L806
	movl	-36(%rbp), %eax
	jmp	.L807
.L806:
	movl	$-5, %eax
.L807:
	movl	%eax, %edi
	call	SWIG_Tcl_ErrorType
	movq	%rax, %rcx
	movq	-64(%rbp), %rax
	leaq	.LC120(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_SetErrorMsg
	jmp	.L804
.L805:
	movq	-32(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	SWIG_FromCharPtr
	movq	%rax, %rdx
	movq	-64(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	Tcl_SetObjResult@PLT
	movl	$0, %eax
	jmp	.L809
.L811:
	nop
.L804:
	movl	$1, %eax
.L809:
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L810
	call	__stack_chk_fail@PLT
.L810:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE88:
	.size	_wrap_keynode_t_p_key_get, .-_wrap_keynode_t_p_key_get
	.section	.rodata
	.align 8
.LC121:
	.string	"oo:keynode_t_p_buffer_set self p_buffer "
	.align 8
.LC122:
	.string	"in method 'keynode_t_p_buffer_set', argument 1 of type 'struct keynode *'"
	.align 8
.LC123:
	.string	"in method 'keynode_t_p_buffer_set', argument 2 of type 'char *'"
	.text
	.type	_wrap_keynode_t_p_buffer_set, @function
_wrap_keynode_t_p_buffer_set:
.LFB89:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movq	%rdi, -72(%rbp)
	movq	%rsi, -80(%rbp)
	movl	%edx, -84(%rbp)
	movq	%rcx, -96(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -32(%rbp)
	movq	$0, -24(%rbp)
	movq	$0, -48(%rbp)
	movl	$0, -56(%rbp)
	movq	$0, -40(%rbp)
	movl	$0, -60(%rbp)
	movq	-96(%rbp), %rdx
	movl	-84(%rbp), %esi
	movq	-80(%rbp), %rax
	movl	$0, %r9d
	movl	$0, %r8d
	leaq	.LC121(%rip), %rcx
	movq	%rax, %rdi
	movl	$0, %eax
	call	SWIG_Tcl_GetArgs
	cmpl	$1, %eax
	je	.L829
	movq	8+swig_types(%rip), %rcx
	movq	-96(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rsi
	leaq	-48(%rbp), %rdx
	movq	-80(%rbp), %rax
	movl	$0, %r8d
	movq	%rax, %rdi
	call	SWIG_Tcl_ConvertPtr
	movl	%eax, -56(%rbp)
	cmpl	$0, -56(%rbp)
	jns	.L815
	cmpl	$-1, -56(%rbp)
	je	.L816
	movl	-56(%rbp), %eax
	jmp	.L817
.L816:
	movl	$-5, %eax
.L817:
	movl	%eax, %edi
	call	SWIG_Tcl_ErrorType
	movq	%rax, %rcx
	movq	-80(%rbp), %rax
	leaq	.LC122(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_SetErrorMsg
	jmp	.L814
.L815:
	movq	-48(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	-96(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	leaq	-60(%rbp), %rdx
	leaq	-40(%rbp), %rsi
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	SWIG_AsCharPtrAndSize
	movl	%eax, -52(%rbp)
	cmpl	$0, -52(%rbp)
	jns	.L818
	cmpl	$-1, -52(%rbp)
	je	.L819
	movl	-52(%rbp), %eax
	jmp	.L820
.L819:
	movl	$-5, %eax
.L820:
	movl	%eax, %edi
	call	SWIG_Tcl_ErrorType
	movq	%rax, %rcx
	movq	-80(%rbp), %rax
	leaq	.LC123(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_SetErrorMsg
	jmp	.L814
.L818:
	movq	-40(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	-32(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	je	.L821
	movq	-32(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
.L821:
	cmpq	$0, -24(%rbp)
	je	.L822
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	addq	$1, %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, %rcx
	movq	-16(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	movq	%rcx, %rdi
	call	memcpy@PLT
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, 16(%rax)
	jmp	.L823
.L822:
	movq	-32(%rbp), %rax
	movq	$0, 16(%rax)
.L823:
	movl	-60(%rbp), %eax
	cmpl	$512, %eax
	jne	.L824
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L824:
	movl	$0, %eax
	jmp	.L827
.L829:
	nop
.L814:
	movl	-60(%rbp), %eax
	cmpl	$512, %eax
	jne	.L826
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L826:
	movl	$1, %eax
.L827:
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L828
	call	__stack_chk_fail@PLT
.L828:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE89:
	.size	_wrap_keynode_t_p_buffer_set, .-_wrap_keynode_t_p_buffer_set
	.section	.rodata
	.align 8
.LC124:
	.string	"o:keynode_t_p_buffer_get self "
	.align 8
.LC125:
	.string	"in method 'keynode_t_p_buffer_get', argument 1 of type 'struct keynode *'"
	.text
	.type	_wrap_keynode_t_p_buffer_get, @function
_wrap_keynode_t_p_buffer_get:
.LFB90:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movl	%edx, -68(%rbp)
	movq	%rcx, -80(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -24(%rbp)
	movq	$0, -32(%rbp)
	movl	$0, -36(%rbp)
	movq	$0, -16(%rbp)
	movq	-80(%rbp), %rdx
	movl	-68(%rbp), %esi
	movq	-64(%rbp), %rax
	movl	$0, %r8d
	leaq	.LC124(%rip), %rcx
	movq	%rax, %rdi
	movl	$0, %eax
	call	SWIG_Tcl_GetArgs
	cmpl	$1, %eax
	je	.L839
	movq	8+swig_types(%rip), %rcx
	movq	-80(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rsi
	leaq	-32(%rbp), %rdx
	movq	-64(%rbp), %rax
	movl	$0, %r8d
	movq	%rax, %rdi
	call	SWIG_Tcl_ConvertPtr
	movl	%eax, -36(%rbp)
	cmpl	$0, -36(%rbp)
	jns	.L833
	cmpl	$-1, -36(%rbp)
	je	.L834
	movl	-36(%rbp), %eax
	jmp	.L835
.L834:
	movl	$-5, %eax
.L835:
	movl	%eax, %edi
	call	SWIG_Tcl_ErrorType
	movq	%rax, %rcx
	movq	-64(%rbp), %rax
	leaq	.LC125(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_SetErrorMsg
	jmp	.L832
.L833:
	movq	-32(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	SWIG_FromCharPtr
	movq	%rax, %rdx
	movq	-64(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	Tcl_SetObjResult@PLT
	movl	$0, %eax
	jmp	.L837
.L839:
	nop
.L832:
	movl	$1, %eax
.L837:
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L838
	call	__stack_chk_fail@PLT
.L838:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE90:
	.size	_wrap_keynode_t_p_buffer_get, .-_wrap_keynode_t_p_buffer_get
	.section	.rodata
	.align 8
.LC126:
	.string	"oo:keynode_t_p_bcd_buffer_set self p_bcd_buffer "
	.align 8
.LC127:
	.string	"in method 'keynode_t_p_bcd_buffer_set', argument 1 of type 'struct keynode *'"
	.align 8
.LC128:
	.string	"in method 'keynode_t_p_bcd_buffer_set', argument 2 of type 'char *'"
	.text
	.type	_wrap_keynode_t_p_bcd_buffer_set, @function
_wrap_keynode_t_p_bcd_buffer_set:
.LFB91:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movq	%rdi, -72(%rbp)
	movq	%rsi, -80(%rbp)
	movl	%edx, -84(%rbp)
	movq	%rcx, -96(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -32(%rbp)
	movq	$0, -24(%rbp)
	movq	$0, -48(%rbp)
	movl	$0, -56(%rbp)
	movq	$0, -40(%rbp)
	movl	$0, -60(%rbp)
	movq	-96(%rbp), %rdx
	movl	-84(%rbp), %esi
	movq	-80(%rbp), %rax
	movl	$0, %r9d
	movl	$0, %r8d
	leaq	.LC126(%rip), %rcx
	movq	%rax, %rdi
	movl	$0, %eax
	call	SWIG_Tcl_GetArgs
	cmpl	$1, %eax
	je	.L857
	movq	8+swig_types(%rip), %rcx
	movq	-96(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rsi
	leaq	-48(%rbp), %rdx
	movq	-80(%rbp), %rax
	movl	$0, %r8d
	movq	%rax, %rdi
	call	SWIG_Tcl_ConvertPtr
	movl	%eax, -56(%rbp)
	cmpl	$0, -56(%rbp)
	jns	.L843
	cmpl	$-1, -56(%rbp)
	je	.L844
	movl	-56(%rbp), %eax
	jmp	.L845
.L844:
	movl	$-5, %eax
.L845:
	movl	%eax, %edi
	call	SWIG_Tcl_ErrorType
	movq	%rax, %rcx
	movq	-80(%rbp), %rax
	leaq	.LC127(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_SetErrorMsg
	jmp	.L842
.L843:
	movq	-48(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	-96(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	leaq	-60(%rbp), %rdx
	leaq	-40(%rbp), %rsi
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	SWIG_AsCharPtrAndSize
	movl	%eax, -52(%rbp)
	cmpl	$0, -52(%rbp)
	jns	.L846
	cmpl	$-1, -52(%rbp)
	je	.L847
	movl	-52(%rbp), %eax
	jmp	.L848
.L847:
	movl	$-5, %eax
.L848:
	movl	%eax, %edi
	call	SWIG_Tcl_ErrorType
	movq	%rax, %rcx
	movq	-80(%rbp), %rax
	leaq	.LC128(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_SetErrorMsg
	jmp	.L842
.L846:
	movq	-40(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	-32(%rbp), %rax
	movq	24(%rax), %rax
	testq	%rax, %rax
	je	.L849
	movq	-32(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
.L849:
	cmpq	$0, -24(%rbp)
	je	.L850
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	addq	$1, %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, %rcx
	movq	-16(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	movq	%rcx, %rdi
	call	memcpy@PLT
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, 24(%rax)
	jmp	.L851
.L850:
	movq	-32(%rbp), %rax
	movq	$0, 24(%rax)
.L851:
	movl	-60(%rbp), %eax
	cmpl	$512, %eax
	jne	.L852
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L852:
	movl	$0, %eax
	jmp	.L855
.L857:
	nop
.L842:
	movl	-60(%rbp), %eax
	cmpl	$512, %eax
	jne	.L854
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L854:
	movl	$1, %eax
.L855:
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L856
	call	__stack_chk_fail@PLT
.L856:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE91:
	.size	_wrap_keynode_t_p_bcd_buffer_set, .-_wrap_keynode_t_p_bcd_buffer_set
	.section	.rodata
	.align 8
.LC129:
	.string	"o:keynode_t_p_bcd_buffer_get self "
	.align 8
.LC130:
	.string	"in method 'keynode_t_p_bcd_buffer_get', argument 1 of type 'struct keynode *'"
	.text
	.type	_wrap_keynode_t_p_bcd_buffer_get, @function
_wrap_keynode_t_p_bcd_buffer_get:
.LFB92:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movl	%edx, -68(%rbp)
	movq	%rcx, -80(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -24(%rbp)
	movq	$0, -32(%rbp)
	movl	$0, -36(%rbp)
	movq	$0, -16(%rbp)
	movq	-80(%rbp), %rdx
	movl	-68(%rbp), %esi
	movq	-64(%rbp), %rax
	movl	$0, %r8d
	leaq	.LC129(%rip), %rcx
	movq	%rax, %rdi
	movl	$0, %eax
	call	SWIG_Tcl_GetArgs
	cmpl	$1, %eax
	je	.L867
	movq	8+swig_types(%rip), %rcx
	movq	-80(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rsi
	leaq	-32(%rbp), %rdx
	movq	-64(%rbp), %rax
	movl	$0, %r8d
	movq	%rax, %rdi
	call	SWIG_Tcl_ConvertPtr
	movl	%eax, -36(%rbp)
	cmpl	$0, -36(%rbp)
	jns	.L861
	cmpl	$-1, -36(%rbp)
	je	.L862
	movl	-36(%rbp), %eax
	jmp	.L863
.L862:
	movl	$-5, %eax
.L863:
	movl	%eax, %edi
	call	SWIG_Tcl_ErrorType
	movq	%rax, %rcx
	movq	-64(%rbp), %rax
	leaq	.LC130(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_SetErrorMsg
	jmp	.L860
.L861:
	movq	-32(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	SWIG_FromCharPtr
	movq	%rax, %rdx
	movq	-64(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	Tcl_SetObjResult@PLT
	movl	$0, %eax
	jmp	.L865
.L867:
	nop
.L860:
	movl	$1, %eax
.L865:
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L866
	call	__stack_chk_fail@PLT
.L866:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE92:
	.size	_wrap_keynode_t_p_bcd_buffer_get, .-_wrap_keynode_t_p_bcd_buffer_get
	.section	.rodata
	.align 8
.LC131:
	.string	"oo:keynode_t_size_set self size "
	.align 8
.LC132:
	.string	"in method 'keynode_t_size_set', argument 1 of type 'struct keynode *'"
	.align 8
.LC133:
	.string	"in method 'keynode_t_size_set', argument 2 of type 'int'"
	.text
	.type	_wrap_keynode_t_size_set, @function
_wrap_keynode_t_size_set:
.LFB93:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movl	%edx, -68(%rbp)
	movq	%rcx, -80(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -16(%rbp)
	movq	$0, -24(%rbp)
	movl	$0, -36(%rbp)
	movl	$0, -32(%rbp)
	movq	-80(%rbp), %rdx
	movl	-68(%rbp), %esi
	movq	-64(%rbp), %rax
	movl	$0, %r9d
	movl	$0, %r8d
	leaq	.LC131(%rip), %rcx
	movq	%rax, %rdi
	movl	$0, %eax
	call	SWIG_Tcl_GetArgs
	cmpl	$1, %eax
	je	.L881
	movq	8+swig_types(%rip), %rcx
	movq	-80(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rsi
	leaq	-24(%rbp), %rdx
	movq	-64(%rbp), %rax
	movl	$0, %r8d
	movq	%rax, %rdi
	call	SWIG_Tcl_ConvertPtr
	movl	%eax, -36(%rbp)
	cmpl	$0, -36(%rbp)
	jns	.L871
	cmpl	$-1, -36(%rbp)
	je	.L872
	movl	-36(%rbp), %eax
	jmp	.L873
.L872:
	movl	$-5, %eax
.L873:
	movl	%eax, %edi
	call	SWIG_Tcl_ErrorType
	movq	%rax, %rcx
	movq	-64(%rbp), %rax
	leaq	.LC132(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_SetErrorMsg
	jmp	.L870
.L871:
	movq	-24(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-80(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rcx
	leaq	-40(%rbp), %rdx
	movq	-64(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_AsVal_int
	movl	%eax, -32(%rbp)
	cmpl	$0, -32(%rbp)
	jns	.L874
	cmpl	$-1, -32(%rbp)
	je	.L875
	movl	-32(%rbp), %eax
	jmp	.L876
.L875:
	movl	$-5, %eax
.L876:
	movl	%eax, %edi
	call	SWIG_Tcl_ErrorType
	movq	%rax, %rcx
	movq	-64(%rbp), %rax
	leaq	.LC133(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_SetErrorMsg
	jmp	.L870
.L874:
	movl	-40(%rbp), %eax
	movl	%eax, -28(%rbp)
	cmpq	$0, -16(%rbp)
	je	.L877
	movq	-16(%rbp), %rax
	movl	-28(%rbp), %edx
	movl	%edx, 32(%rax)
.L877:
	movl	$0, %eax
	jmp	.L879
.L881:
	nop
.L870:
	movl	$1, %eax
.L879:
	movq	-8(%rbp), %rdi
	xorq	%fs:40, %rdi
	je	.L880
	call	__stack_chk_fail@PLT
.L880:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE93:
	.size	_wrap_keynode_t_size_set, .-_wrap_keynode_t_size_set
	.section	.rodata
.LC134:
	.string	"o:keynode_t_size_get self "
	.align 8
.LC135:
	.string	"in method 'keynode_t_size_get', argument 1 of type 'struct keynode *'"
	.text
	.type	_wrap_keynode_t_size_get, @function
_wrap_keynode_t_size_get:
.LFB94:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movl	%edx, -52(%rbp)
	movq	%rcx, -64(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -16(%rbp)
	movq	$0, -24(%rbp)
	movl	$0, -32(%rbp)
	movq	-64(%rbp), %rdx
	movl	-52(%rbp), %esi
	movq	-48(%rbp), %rax
	movl	$0, %r8d
	leaq	.LC134(%rip), %rcx
	movq	%rax, %rdi
	movl	$0, %eax
	call	SWIG_Tcl_GetArgs
	cmpl	$1, %eax
	je	.L891
	movq	8+swig_types(%rip), %rcx
	movq	-64(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rsi
	leaq	-24(%rbp), %rdx
	movq	-48(%rbp), %rax
	movl	$0, %r8d
	movq	%rax, %rdi
	call	SWIG_Tcl_ConvertPtr
	movl	%eax, -32(%rbp)
	cmpl	$0, -32(%rbp)
	jns	.L885
	cmpl	$-1, -32(%rbp)
	je	.L886
	movl	-32(%rbp), %eax
	jmp	.L887
.L886:
	movl	$-5, %eax
.L887:
	movl	%eax, %edi
	call	SWIG_Tcl_ErrorType
	movq	%rax, %rcx
	movq	-48(%rbp), %rax
	leaq	.LC135(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_SetErrorMsg
	jmp	.L884
.L885:
	movq	-24(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	32(%rax), %eax
	movl	%eax, -28(%rbp)
	movl	-28(%rbp), %eax
	movl	%eax, %edi
	call	SWIG_From_int
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	Tcl_SetObjResult@PLT
	movl	$0, %eax
	jmp	.L889
.L891:
	nop
.L884:
	movl	$1, %eax
.L889:
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L890
	call	__stack_chk_fail@PLT
.L890:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE94:
	.size	_wrap_keynode_t_size_get, .-_wrap_keynode_t_size_get
	.section	.rodata
.LC136:
	.string	":new_keynode_t "
	.text
	.type	_wrap_new_keynode_t, @function
_wrap_new_keynode_t:
.LFB95:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	%edx, -36(%rbp)
	movq	%rcx, -48(%rbp)
	movq	$0, -8(%rbp)
	movq	-48(%rbp), %rdx
	movl	-36(%rbp), %esi
	movq	-32(%rbp), %rax
	leaq	.LC136(%rip), %rcx
	movq	%rax, %rdi
	movl	$0, %eax
	call	SWIG_Tcl_GetArgs
	cmpl	$1, %eax
	je	.L897
	movl	$40, %esi
	movl	$1, %edi
	call	calloc@PLT
	movq	%rax, -8(%rbp)
	movq	8+swig_types(%rip), %rdx
	movq	-8(%rbp), %rsi
	movq	-32(%rbp), %rax
	movl	$0, %ecx
	movq	%rax, %rdi
	call	SWIG_Tcl_NewInstanceObj
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	Tcl_SetObjResult@PLT
	movl	$0, %eax
	jmp	.L895
.L897:
	nop
.L894:
	movl	$1, %eax
.L895:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE95:
	.size	_wrap_new_keynode_t, .-_wrap_new_keynode_t
	.section	.rodata
.LC137:
	.string	"o:delete_keynode_t self "
	.align 8
.LC138:
	.string	"in method 'delete_keynode_t', argument 1 of type 'struct keynode *'"
	.text
	.type	_wrap_delete_keynode_t, @function
_wrap_delete_keynode_t:
.LFB96:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movl	%edx, -52(%rbp)
	movq	%rcx, -64(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -16(%rbp)
	movq	$0, -24(%rbp)
	movl	$0, -28(%rbp)
	movq	-64(%rbp), %rdx
	movl	-52(%rbp), %esi
	movq	-48(%rbp), %rax
	movl	$0, %r8d
	leaq	.LC137(%rip), %rcx
	movq	%rax, %rdi
	movl	$0, %eax
	call	SWIG_Tcl_GetArgs
	cmpl	$1, %eax
	je	.L907
	movq	8+swig_types(%rip), %rcx
	movq	-64(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rsi
	leaq	-24(%rbp), %rdx
	movq	-48(%rbp), %rax
	movl	$1, %r8d
	movq	%rax, %rdi
	call	SWIG_Tcl_ConvertPtr
	movl	%eax, -28(%rbp)
	cmpl	$0, -28(%rbp)
	jns	.L901
	cmpl	$-1, -28(%rbp)
	je	.L902
	movl	-28(%rbp), %eax
	jmp	.L903
.L902:
	movl	$-5, %eax
.L903:
	movl	%eax, %edi
	call	SWIG_Tcl_ErrorType
	movq	%rax, %rcx
	movq	-48(%rbp), %rax
	leaq	.LC138(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_SetErrorMsg
	jmp	.L900
.L901:
	movq	-24(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movl	$0, %eax
	jmp	.L905
.L907:
	nop
.L900:
	movl	$1, %eax
.L905:
	movq	-8(%rbp), %rdi
	xorq	%fs:40, %rdi
	je	.L906
	call	__stack_chk_fail@PLT
.L906:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE96:
	.size	_wrap_delete_keynode_t, .-_wrap_delete_keynode_t
	.type	swig_delete_keynode_t, @function
swig_delete_keynode_t:
.LFB97:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE97:
	.size	swig_delete_keynode_t, .-swig_delete_keynode_t
	.local	swig_keynode_methods
	.comm	swig_keynode_methods,16,16
	.section	.rodata
.LC139:
	.string	"-p_key"
.LC140:
	.string	"-p_bcd_buffer"
	.section	.data.rel.local
	.align 32
	.type	swig_keynode_attributes, @object
	.size	swig_keynode_attributes, 144
swig_keynode_attributes:
	.quad	.LC85
	.quad	_wrap_keynode_t_p_next_get
	.quad	_wrap_keynode_t_p_next_set
	.quad	.LC139
	.quad	_wrap_keynode_t_p_key_get
	.quad	_wrap_keynode_t_p_key_set
	.quad	.LC87
	.quad	_wrap_keynode_t_p_buffer_get
	.quad	_wrap_keynode_t_p_buffer_set
	.quad	.LC140
	.quad	_wrap_keynode_t_p_bcd_buffer_get
	.quad	_wrap_keynode_t_p_bcd_buffer_set
	.quad	.LC88
	.quad	_wrap_keynode_t_size_get
	.quad	_wrap_keynode_t_size_set
	.quad	0
	.quad	0
	.quad	0
	.local	swig_keynode_bases
	.comm	swig_keynode_bases,8,8
	.local	swig_keynode_base_names
	.comm	swig_keynode_base_names,8,8
	.section	.rodata
.LC141:
	.string	"keynode_t"
	.section	.data.rel.local
	.align 32
	.type	_wrap_class_keynode, @object
	.size	_wrap_class_keynode, 160
_wrap_class_keynode:
	.quad	.LC141
	.quad	swig_types+8
	.quad	_wrap_new_keynode_t
	.quad	swig_delete_keynode_t
	.quad	swig_keynode_methods
	.quad	swig_keynode_attributes
	.quad	swig_keynode_bases
	.quad	swig_keynode_base_names
	.quad	swig_module
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.quad	0
	.quad	0
	.quad	0
	.section	.rodata
.LC142:
	.string	":key_mgr_init "
	.text
	.type	_wrap_key_mgr_init, @function
_wrap_key_mgr_init:
.LFB98:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	%edx, -20(%rbp)
	movq	%rcx, -32(%rbp)
	movq	-32(%rbp), %rdx
	movl	-20(%rbp), %esi
	movq	-16(%rbp), %rax
	leaq	.LC142(%rip), %rcx
	movq	%rax, %rdi
	movl	$0, %eax
	call	SWIG_Tcl_GetArgs
	cmpl	$1, %eax
	je	.L914
	call	key_mgr_init@PLT
	movl	$0, %eax
	jmp	.L912
.L914:
	nop
.L911:
	movl	$1, %eax
.L912:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE98:
	.size	_wrap_key_mgr_init, .-_wrap_key_mgr_init
	.section	.rodata
.LC143:
	.string	":key_mgr_reset "
	.text
	.type	_wrap_key_mgr_reset, @function
_wrap_key_mgr_reset:
.LFB99:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	%edx, -20(%rbp)
	movq	%rcx, -32(%rbp)
	movq	-32(%rbp), %rdx
	movl	-20(%rbp), %esi
	movq	-16(%rbp), %rax
	leaq	.LC143(%rip), %rcx
	movq	%rax, %rdi
	movl	$0, %eax
	call	SWIG_Tcl_GetArgs
	cmpl	$1, %eax
	je	.L920
	call	key_mgr_reset@PLT
	movl	$0, %eax
	jmp	.L918
.L920:
	nop
.L917:
	movl	$1, %eax
.L918:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE99:
	.size	_wrap_key_mgr_reset, .-_wrap_key_mgr_reset
	.section	.rodata
.LC144:
	.string	"oo:key_mgr_add p_key size "
	.align 8
.LC145:
	.string	"in method 'key_mgr_add', argument 1 of type 'char *'"
	.align 8
.LC146:
	.string	"in method 'key_mgr_add', argument 2 of type 'int'"
	.text
	.type	_wrap_key_mgr_add, @function
_wrap_key_mgr_add:
.LFB100:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movl	%edx, -68(%rbp)
	movq	%rcx, -80(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -16(%rbp)
	movq	$0, -24(%rbp)
	movl	$0, -44(%rbp)
	movl	$0, -36(%rbp)
	movq	-80(%rbp), %rdx
	movl	-68(%rbp), %esi
	movq	-64(%rbp), %rax
	movl	$0, %r9d
	movl	$0, %r8d
	leaq	.LC144(%rip), %rcx
	movq	%rax, %rdi
	movl	$0, %eax
	call	SWIG_Tcl_GetArgs
	cmpl	$1, %eax
	je	.L935
	movq	-80(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	-44(%rbp), %rdx
	leaq	-24(%rbp), %rsi
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	SWIG_AsCharPtrAndSize
	movl	%eax, -32(%rbp)
	cmpl	$0, -32(%rbp)
	jns	.L924
	cmpl	$-1, -32(%rbp)
	je	.L925
	movl	-32(%rbp), %eax
	jmp	.L926
.L925:
	movl	$-5, %eax
.L926:
	movl	%eax, %edi
	call	SWIG_Tcl_ErrorType
	movq	%rax, %rcx
	movq	-64(%rbp), %rax
	leaq	.LC145(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_SetErrorMsg
	jmp	.L923
.L924:
	movq	-24(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-80(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rcx
	leaq	-40(%rbp), %rdx
	movq	-64(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_AsVal_int
	movl	%eax, -36(%rbp)
	cmpl	$0, -36(%rbp)
	jns	.L927
	cmpl	$-1, -36(%rbp)
	je	.L928
	movl	-36(%rbp), %eax
	jmp	.L929
.L928:
	movl	$-5, %eax
.L929:
	movl	%eax, %edi
	call	SWIG_Tcl_ErrorType
	movq	%rax, %rcx
	movq	-64(%rbp), %rax
	leaq	.LC146(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_SetErrorMsg
	jmp	.L923
.L927:
	movl	-40(%rbp), %eax
	movl	%eax, -28(%rbp)
	movl	-28(%rbp), %edx
	movq	-16(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	key_mgr_add@PLT
	movl	-44(%rbp), %eax
	cmpl	$512, %eax
	jne	.L930
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L930:
	movl	$0, %eax
	jmp	.L933
.L935:
	nop
.L923:
	movl	-44(%rbp), %eax
	cmpl	$512, %eax
	jne	.L932
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L932:
	movl	$1, %eax
.L933:
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L934
	call	__stack_chk_fail@PLT
.L934:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE100:
	.size	_wrap_key_mgr_add, .-_wrap_key_mgr_add
	.section	.rodata
.LC147:
	.string	"o:key_mgr_delete p_key "
	.align 8
.LC148:
	.string	"in method 'key_mgr_delete', argument 1 of type 'char *'"
	.text
	.type	_wrap_key_mgr_delete, @function
_wrap_key_mgr_delete:
.LFB101:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movl	%edx, -68(%rbp)
	movq	%rcx, -80(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -16(%rbp)
	movq	$0, -24(%rbp)
	movl	$0, -32(%rbp)
	movq	-80(%rbp), %rdx
	movl	-68(%rbp), %esi
	movq	-64(%rbp), %rax
	movl	$0, %r8d
	leaq	.LC147(%rip), %rcx
	movq	%rax, %rdi
	movl	$0, %eax
	call	SWIG_Tcl_GetArgs
	cmpl	$1, %eax
	je	.L947
	movq	-80(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	-32(%rbp), %rdx
	leaq	-24(%rbp), %rsi
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	SWIG_AsCharPtrAndSize
	movl	%eax, -28(%rbp)
	cmpl	$0, -28(%rbp)
	jns	.L939
	cmpl	$-1, -28(%rbp)
	je	.L940
	movl	-28(%rbp), %eax
	jmp	.L941
.L940:
	movl	$-5, %eax
.L941:
	movl	%eax, %edi
	call	SWIG_Tcl_ErrorType
	movq	%rax, %rcx
	movq	-64(%rbp), %rax
	leaq	.LC148(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_SetErrorMsg
	jmp	.L938
.L939:
	movq	-24(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	key_mgr_delete@PLT
	movb	%al, -33(%rbp)
	movzbl	-33(%rbp), %eax
	movl	%eax, %edi
	call	Tcl_NewIntObj@PLT
	movq	%rax, %rdx
	movq	-64(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	Tcl_SetObjResult@PLT
	movl	-32(%rbp), %eax
	cmpl	$512, %eax
	jne	.L942
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L942:
	movl	$0, %eax
	jmp	.L945
.L947:
	nop
.L938:
	movl	-32(%rbp), %eax
	cmpl	$512, %eax
	jne	.L944
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L944:
	movl	$1, %eax
.L945:
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L946
	call	__stack_chk_fail@PLT
.L946:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE101:
	.size	_wrap_key_mgr_delete, .-_wrap_key_mgr_delete
	.section	.rodata
.LC149:
	.string	"o:key_mgr_get_msg p_key "
	.align 8
.LC150:
	.string	"in method 'key_mgr_get_msg', argument 1 of type 'char *'"
	.text
	.type	_wrap_key_mgr_get_msg, @function
_wrap_key_mgr_get_msg:
.LFB102:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movl	%edx, -68(%rbp)
	movq	%rcx, -80(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -24(%rbp)
	movq	$0, -32(%rbp)
	movl	$0, -40(%rbp)
	movq	$0, -16(%rbp)
	movq	-80(%rbp), %rdx
	movl	-68(%rbp), %esi
	movq	-64(%rbp), %rax
	movl	$0, %r8d
	leaq	.LC149(%rip), %rcx
	movq	%rax, %rdi
	movl	$0, %eax
	call	SWIG_Tcl_GetArgs
	cmpl	$1, %eax
	je	.L959
	movq	-80(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	-40(%rbp), %rdx
	leaq	-32(%rbp), %rsi
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	SWIG_AsCharPtrAndSize
	movl	%eax, -36(%rbp)
	cmpl	$0, -36(%rbp)
	jns	.L951
	cmpl	$-1, -36(%rbp)
	je	.L952
	movl	-36(%rbp), %eax
	jmp	.L953
.L952:
	movl	$-5, %eax
.L953:
	movl	%eax, %edi
	call	SWIG_Tcl_ErrorType
	movq	%rax, %rcx
	movq	-64(%rbp), %rax
	leaq	.LC150(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_SetErrorMsg
	jmp	.L950
.L951:
	movq	-32(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	key_mgr_get_msg@PLT
	movq	%rax, -16(%rbp)
	movq	48+swig_types(%rip), %rdx
	movq	-16(%rbp), %rsi
	movq	-64(%rbp), %rax
	movl	$0, %ecx
	movq	%rax, %rdi
	call	SWIG_Tcl_NewInstanceObj
	movq	%rax, %rdx
	movq	-64(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	Tcl_SetObjResult@PLT
	movl	-40(%rbp), %eax
	cmpl	$512, %eax
	jne	.L954
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L954:
	movl	$0, %eax
	jmp	.L957
.L959:
	nop
.L950:
	movl	-40(%rbp), %eax
	cmpl	$512, %eax
	jne	.L956
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L956:
	movl	$1, %eax
.L957:
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L958
	call	__stack_chk_fail@PLT
.L958:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE102:
	.size	_wrap_key_mgr_get_msg, .-_wrap_key_mgr_get_msg
	.section	.rodata
.LC151:
	.string	"o:key_mgr_get_size p_key "
	.align 8
.LC152:
	.string	"in method 'key_mgr_get_size', argument 1 of type 'char *'"
	.text
	.type	_wrap_key_mgr_get_size, @function
_wrap_key_mgr_get_size:
.LFB103:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movl	%edx, -68(%rbp)
	movq	%rcx, -80(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -16(%rbp)
	movq	$0, -24(%rbp)
	movl	$0, -36(%rbp)
	movq	-80(%rbp), %rdx
	movl	-68(%rbp), %esi
	movq	-64(%rbp), %rax
	movl	$0, %r8d
	leaq	.LC151(%rip), %rcx
	movq	%rax, %rdi
	movl	$0, %eax
	call	SWIG_Tcl_GetArgs
	cmpl	$1, %eax
	je	.L971
	movq	-80(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	-36(%rbp), %rdx
	leaq	-24(%rbp), %rsi
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	SWIG_AsCharPtrAndSize
	movl	%eax, -32(%rbp)
	cmpl	$0, -32(%rbp)
	jns	.L963
	cmpl	$-1, -32(%rbp)
	je	.L964
	movl	-32(%rbp), %eax
	jmp	.L965
.L964:
	movl	$-5, %eax
.L965:
	movl	%eax, %edi
	call	SWIG_Tcl_ErrorType
	movq	%rax, %rcx
	movq	-64(%rbp), %rax
	leaq	.LC152(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_SetErrorMsg
	jmp	.L962
.L963:
	movq	-24(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	key_mgr_get_size@PLT
	movl	%eax, -28(%rbp)
	movl	-28(%rbp), %eax
	movl	%eax, %edi
	call	SWIG_From_int
	movq	%rax, %rdx
	movq	-64(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	Tcl_SetObjResult@PLT
	movl	-36(%rbp), %eax
	cmpl	$512, %eax
	jne	.L966
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L966:
	movl	$0, %eax
	jmp	.L969
.L971:
	nop
.L962:
	movl	-36(%rbp), %eax
	cmpl	$512, %eax
	jne	.L968
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L968:
	movl	$1, %eax
.L969:
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L970
	call	__stack_chk_fail@PLT
.L970:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE103:
	.size	_wrap_key_mgr_get_size, .-_wrap_key_mgr_get_size
	.section	.rodata
.LC153:
	.string	"o:key_mgr_check p_key "
	.align 8
.LC154:
	.string	"in method 'key_mgr_check', argument 1 of type 'char *'"
	.text
	.type	_wrap_key_mgr_check, @function
_wrap_key_mgr_check:
.LFB104:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movl	%edx, -68(%rbp)
	movq	%rcx, -80(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -16(%rbp)
	movq	$0, -24(%rbp)
	movl	$0, -32(%rbp)
	movq	-80(%rbp), %rdx
	movl	-68(%rbp), %esi
	movq	-64(%rbp), %rax
	movl	$0, %r8d
	leaq	.LC153(%rip), %rcx
	movq	%rax, %rdi
	movl	$0, %eax
	call	SWIG_Tcl_GetArgs
	cmpl	$1, %eax
	je	.L983
	movq	-80(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	-32(%rbp), %rdx
	leaq	-24(%rbp), %rsi
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	SWIG_AsCharPtrAndSize
	movl	%eax, -28(%rbp)
	cmpl	$0, -28(%rbp)
	jns	.L975
	cmpl	$-1, -28(%rbp)
	je	.L976
	movl	-28(%rbp), %eax
	jmp	.L977
.L976:
	movl	$-5, %eax
.L977:
	movl	%eax, %edi
	call	SWIG_Tcl_ErrorType
	movq	%rax, %rcx
	movq	-64(%rbp), %rax
	leaq	.LC154(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_SetErrorMsg
	jmp	.L974
.L975:
	movq	-24(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	key_mgr_check@PLT
	movb	%al, -33(%rbp)
	movzbl	-33(%rbp), %eax
	movl	%eax, %edi
	call	Tcl_NewIntObj@PLT
	movq	%rax, %rdx
	movq	-64(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	Tcl_SetObjResult@PLT
	movl	-32(%rbp), %eax
	cmpl	$512, %eax
	jne	.L978
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L978:
	movl	$0, %eax
	jmp	.L981
.L983:
	nop
.L974:
	movl	-32(%rbp), %eax
	cmpl	$512, %eax
	jne	.L980
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L980:
	movl	$1, %eax
.L981:
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L982
	call	__stack_chk_fail@PLT
.L982:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE104:
	.size	_wrap_key_mgr_check, .-_wrap_key_mgr_check
	.section	.rodata
.LC155:
	.string	":key_mgr_dump "
	.text
	.type	_wrap_key_mgr_dump, @function
_wrap_key_mgr_dump:
.LFB105:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	%edx, -20(%rbp)
	movq	%rcx, -32(%rbp)
	movq	-32(%rbp), %rdx
	movl	-20(%rbp), %esi
	movq	-16(%rbp), %rax
	leaq	.LC155(%rip), %rcx
	movq	%rax, %rdi
	movl	$0, %eax
	call	SWIG_Tcl_GetArgs
	cmpl	$1, %eax
	je	.L989
	call	key_mgr_dump@PLT
	movl	$0, %eax
	jmp	.L987
.L989:
	nop
.L986:
	movl	$1, %eax
.L987:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE105:
	.size	_wrap_key_mgr_dump, .-_wrap_key_mgr_dump
	.section	.rodata
.LC156:
	.string	"o:key_mgr_bcd_get p_key "
	.align 8
.LC157:
	.string	"in method 'key_mgr_bcd_get', argument 1 of type 'char *'"
	.text
	.type	_wrap_key_mgr_bcd_get, @function
_wrap_key_mgr_bcd_get:
.LFB106:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movl	%edx, -68(%rbp)
	movq	%rcx, -80(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -24(%rbp)
	movq	$0, -32(%rbp)
	movl	$0, -40(%rbp)
	movq	$0, -16(%rbp)
	movq	-80(%rbp), %rdx
	movl	-68(%rbp), %esi
	movq	-64(%rbp), %rax
	movl	$0, %r8d
	leaq	.LC156(%rip), %rcx
	movq	%rax, %rdi
	movl	$0, %eax
	call	SWIG_Tcl_GetArgs
	cmpl	$1, %eax
	je	.L1001
	movq	-80(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	-40(%rbp), %rdx
	leaq	-32(%rbp), %rsi
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	SWIG_AsCharPtrAndSize
	movl	%eax, -36(%rbp)
	cmpl	$0, -36(%rbp)
	jns	.L993
	cmpl	$-1, -36(%rbp)
	je	.L994
	movl	-36(%rbp), %eax
	jmp	.L995
.L994:
	movl	$-5, %eax
.L995:
	movl	%eax, %edi
	call	SWIG_Tcl_ErrorType
	movq	%rax, %rcx
	movq	-64(%rbp), %rax
	leaq	.LC157(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_SetErrorMsg
	jmp	.L992
.L993:
	movq	-32(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	key_mgr_bcd_get@PLT
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	SWIG_FromCharPtr
	movq	%rax, %rdx
	movq	-64(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	Tcl_SetObjResult@PLT
	movl	-40(%rbp), %eax
	cmpl	$512, %eax
	jne	.L996
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L996:
	movl	$0, %eax
	jmp	.L999
.L1001:
	nop
.L992:
	movl	-40(%rbp), %eax
	cmpl	$512, %eax
	jne	.L998
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L998:
	movl	$1, %eax
.L999:
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L1000
	call	__stack_chk_fail@PLT
.L1000:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE106:
	.size	_wrap_key_mgr_bcd_get, .-_wrap_key_mgr_bcd_get
	.section	.rodata
	.align 8
.LC158:
	.string	"oo:key_mgr_bcd_set p_key p_bcd "
	.align 8
.LC159:
	.string	"in method 'key_mgr_bcd_set', argument 1 of type 'char *'"
	.align 8
.LC160:
	.string	"in method 'key_mgr_bcd_set', argument 2 of type 'char *'"
	.text
	.type	_wrap_key_mgr_bcd_set, @function
_wrap_key_mgr_bcd_set:
.LFB107:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movq	%rdi, -72(%rbp)
	movq	%rsi, -80(%rbp)
	movl	%edx, -84(%rbp)
	movq	%rcx, -96(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -24(%rbp)
	movq	$0, -16(%rbp)
	movq	$0, -40(%rbp)
	movl	$0, -60(%rbp)
	movq	$0, -32(%rbp)
	movl	$0, -56(%rbp)
	movq	-96(%rbp), %rdx
	movl	-84(%rbp), %esi
	movq	-80(%rbp), %rax
	movl	$0, %r9d
	movl	$0, %r8d
	leaq	.LC158(%rip), %rcx
	movq	%rax, %rdi
	movl	$0, %eax
	call	SWIG_Tcl_GetArgs
	cmpl	$1, %eax
	je	.L1018
	movq	-96(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	-60(%rbp), %rdx
	leaq	-40(%rbp), %rsi
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	SWIG_AsCharPtrAndSize
	movl	%eax, -52(%rbp)
	cmpl	$0, -52(%rbp)
	jns	.L1005
	cmpl	$-1, -52(%rbp)
	je	.L1006
	movl	-52(%rbp), %eax
	jmp	.L1007
.L1006:
	movl	$-5, %eax
.L1007:
	movl	%eax, %edi
	call	SWIG_Tcl_ErrorType
	movq	%rax, %rcx
	movq	-80(%rbp), %rax
	leaq	.LC159(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_SetErrorMsg
	jmp	.L1004
.L1005:
	movq	-40(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	-96(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	leaq	-56(%rbp), %rdx
	leaq	-32(%rbp), %rsi
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	SWIG_AsCharPtrAndSize
	movl	%eax, -48(%rbp)
	cmpl	$0, -48(%rbp)
	jns	.L1008
	cmpl	$-1, -48(%rbp)
	je	.L1009
	movl	-48(%rbp), %eax
	jmp	.L1010
.L1009:
	movl	$-5, %eax
.L1010:
	movl	%eax, %edi
	call	SWIG_Tcl_ErrorType
	movq	%rax, %rcx
	movq	-80(%rbp), %rax
	leaq	.LC160(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_SetErrorMsg
	jmp	.L1004
.L1008:
	movq	-32(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	key_mgr_bcd_set@PLT
	movl	%eax, -44(%rbp)
	movl	-44(%rbp), %eax
	movl	%eax, %edi
	call	SWIG_From_int
	movq	%rax, %rdx
	movq	-80(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	Tcl_SetObjResult@PLT
	movl	-60(%rbp), %eax
	cmpl	$512, %eax
	jne	.L1011
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L1011:
	movl	-56(%rbp), %eax
	cmpl	$512, %eax
	jne	.L1012
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L1012:
	movl	$0, %eax
	jmp	.L1016
.L1018:
	nop
.L1004:
	movl	-60(%rbp), %eax
	cmpl	$512, %eax
	jne	.L1014
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L1014:
	movl	-56(%rbp), %eax
	cmpl	$512, %eax
	jne	.L1015
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L1015:
	movl	$1, %eax
.L1016:
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L1017
	call	__stack_chk_fail@PLT
.L1017:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE107:
	.size	_wrap_key_mgr_bcd_set, .-_wrap_key_mgr_bcd_set
	.section	.rodata
.LC161:
	.string	"o:test_bcd p_key "
	.align 8
.LC162:
	.string	"in method 'test_bcd', argument 1 of type 'char *'"
	.text
	.type	_wrap_test_bcd, @function
_wrap_test_bcd:
.LFB108:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movl	%edx, -52(%rbp)
	movq	%rcx, -64(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -16(%rbp)
	movq	$0, -24(%rbp)
	movl	$0, -32(%rbp)
	movq	-64(%rbp), %rdx
	movl	-52(%rbp), %esi
	movq	-48(%rbp), %rax
	movl	$0, %r8d
	leaq	.LC161(%rip), %rcx
	movq	%rax, %rdi
	movl	$0, %eax
	call	SWIG_Tcl_GetArgs
	cmpl	$1, %eax
	je	.L1030
	movq	-64(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	-32(%rbp), %rdx
	leaq	-24(%rbp), %rsi
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	SWIG_AsCharPtrAndSize
	movl	%eax, -28(%rbp)
	cmpl	$0, -28(%rbp)
	jns	.L1022
	cmpl	$-1, -28(%rbp)
	je	.L1023
	movl	-28(%rbp), %eax
	jmp	.L1024
.L1023:
	movl	$-5, %eax
.L1024:
	movl	%eax, %edi
	call	SWIG_Tcl_ErrorType
	movq	%rax, %rcx
	movq	-48(%rbp), %rax
	leaq	.LC162(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_SetErrorMsg
	jmp	.L1021
.L1022:
	movq	-24(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	test_bcd@PLT
	movl	-32(%rbp), %eax
	cmpl	$512, %eax
	jne	.L1025
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L1025:
	movl	$0, %eax
	jmp	.L1028
.L1030:
	nop
.L1021:
	movl	-32(%rbp), %eax
	cmpl	$512, %eax
	jne	.L1027
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L1027:
	movl	$1, %eax
.L1028:
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L1029
	call	__stack_chk_fail@PLT
.L1029:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE108:
	.size	_wrap_test_bcd, .-_wrap_test_bcd
	.section	.rodata
	.align 8
.LC163:
	.string	"oo:key_mgr_set_buff p_key p_src "
	.align 8
.LC164:
	.string	"in method 'key_mgr_set_buff', argument 1 of type 'char *'"
	.align 8
.LC165:
	.string	"in method 'key_mgr_set_buff', argument 2 of type 'void *'"
	.text
	.type	_wrap_key_mgr_set_buff, @function
_wrap_key_mgr_set_buff:
.LFB109:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movl	%edx, -68(%rbp)
	movq	%rcx, -80(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -16(%rbp)
	movq	$0, -32(%rbp)
	movq	$0, -24(%rbp)
	movl	$0, -44(%rbp)
	movq	-80(%rbp), %rdx
	movl	-68(%rbp), %esi
	movq	-64(%rbp), %rax
	movl	$0, %r9d
	movl	$0, %r8d
	leaq	.LC163(%rip), %rcx
	movq	%rax, %rdi
	movl	$0, %eax
	call	SWIG_Tcl_GetArgs
	cmpl	$1, %eax
	je	.L1045
	movq	-80(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	-44(%rbp), %rdx
	leaq	-24(%rbp), %rsi
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	SWIG_AsCharPtrAndSize
	movl	%eax, -40(%rbp)
	cmpl	$0, -40(%rbp)
	jns	.L1034
	cmpl	$-1, -40(%rbp)
	je	.L1035
	movl	-40(%rbp), %eax
	jmp	.L1036
.L1035:
	movl	$-5, %eax
.L1036:
	movl	%eax, %edi
	call	SWIG_Tcl_ErrorType
	movq	%rax, %rcx
	movq	-64(%rbp), %rax
	leaq	.LC164(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_SetErrorMsg
	jmp	.L1033
.L1034:
	movq	-24(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-80(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rsi
	leaq	-32(%rbp), %rdx
	movq	-64(%rbp), %rax
	movl	$0, %r8d
	movl	$0, %ecx
	movq	%rax, %rdi
	call	SWIG_Tcl_ConvertPtr
	movl	%eax, -36(%rbp)
	cmpl	$0, -36(%rbp)
	jns	.L1037
	cmpl	$-1, -36(%rbp)
	je	.L1038
	movl	-36(%rbp), %eax
	jmp	.L1039
.L1038:
	movl	$-5, %eax
.L1039:
	movl	%eax, %edi
	call	SWIG_Tcl_ErrorType
	movq	%rax, %rcx
	movq	-64(%rbp), %rax
	leaq	.LC165(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_SetErrorMsg
	jmp	.L1033
.L1037:
	movq	-32(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	key_mgr_set_buff@PLT
	movl	-44(%rbp), %eax
	cmpl	$512, %eax
	jne	.L1040
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L1040:
	movl	$0, %eax
	jmp	.L1043
.L1045:
	nop
.L1033:
	movl	-44(%rbp), %eax
	cmpl	$512, %eax
	jne	.L1042
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L1042:
	movl	$1, %eax
.L1043:
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L1044
	call	__stack_chk_fail@PLT
.L1044:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE109:
	.size	_wrap_key_mgr_set_buff, .-_wrap_key_mgr_set_buff
	.section	.rodata
.LC166:
	.string	"queue_init"
.LC167:
	.string	"stub_init"
.LC168:
	.string	"stub_clear"
.LC169:
	.string	"stub_cleanup"
.LC170:
	.string	"sv_csr_write_wrapper"
.LC171:
	.string	"sv_csr_read_wrapper"
.LC172:
	.string	"sv_csr_peek_wrapper"
.LC173:
	.string	"sv_csr_qlen_wrapper"
.LC174:
	.string	"node_t_p_next_set"
.LC175:
	.string	"node_t_p_next_get"
.LC176:
	.string	"node_t_p_port_set"
.LC177:
	.string	"node_t_p_port_get"
.LC178:
	.string	"node_t_p_buffer_set"
.LC179:
	.string	"node_t_p_buffer_get"
.LC180:
	.string	"node_t_size_set"
.LC181:
	.string	"node_t_size_get"
.LC182:
	.string	"new_node_t"
.LC183:
	.string	"delete_node_t"
.LC184:
	.string	"port_mgr_init"
.LC185:
	.string	"port_mgr_reset"
.LC186:
	.string	"port_mgr_add"
.LC187:
	.string	"port_mgr_delete"
.LC188:
	.string	"port_mgr_get_msg"
.LC189:
	.string	"port_mgr_get_size"
.LC190:
	.string	"port_mgr_check"
.LC191:
	.string	"port_mgr_dump"
.LC192:
	.string	"port_mgr_msg_set"
.LC193:
	.string	"port_mgr_msg_get"
.LC194:
	.string	"keynode_t_p_next_set"
.LC195:
	.string	"keynode_t_p_next_get"
.LC196:
	.string	"keynode_t_p_key_set"
.LC197:
	.string	"keynode_t_p_key_get"
.LC198:
	.string	"keynode_t_p_buffer_set"
.LC199:
	.string	"keynode_t_p_buffer_get"
.LC200:
	.string	"keynode_t_p_bcd_buffer_set"
.LC201:
	.string	"keynode_t_p_bcd_buffer_get"
.LC202:
	.string	"keynode_t_size_set"
.LC203:
	.string	"keynode_t_size_get"
.LC204:
	.string	"new_keynode_t"
.LC205:
	.string	"delete_keynode_t"
.LC206:
	.string	"key_mgr_init"
.LC207:
	.string	"key_mgr_reset"
.LC208:
	.string	"key_mgr_add"
.LC209:
	.string	"key_mgr_delete"
.LC210:
	.string	"key_mgr_get_msg"
.LC211:
	.string	"key_mgr_get_size"
.LC212:
	.string	"key_mgr_check"
.LC213:
	.string	"key_mgr_dump"
.LC214:
	.string	"key_mgr_bcd_get"
.LC215:
	.string	"key_mgr_bcd_set"
.LC216:
	.string	"test_bcd"
.LC217:
	.string	"key_mgr_set_buff"
	.section	.data.rel.local
	.align 32
	.type	swig_commands, @object
	.size	swig_commands, 1320
swig_commands:
	.quad	.LC166
	.quad	_wrap_queue_init
	.quad	0
	.quad	.LC167
	.quad	_wrap_stub_init
	.quad	0
	.quad	.LC168
	.quad	_wrap_stub_clear
	.quad	0
	.quad	.LC169
	.quad	_wrap_stub_cleanup
	.quad	0
	.quad	.LC170
	.quad	_wrap_sv_csr_write_wrapper
	.quad	0
	.quad	.LC171
	.quad	_wrap_sv_csr_read_wrapper
	.quad	0
	.quad	.LC172
	.quad	_wrap_sv_csr_peek_wrapper
	.quad	0
	.quad	.LC173
	.quad	_wrap_sv_csr_qlen_wrapper
	.quad	0
	.quad	.LC174
	.quad	_wrap_node_t_p_next_set
	.quad	0
	.quad	.LC175
	.quad	_wrap_node_t_p_next_get
	.quad	0
	.quad	.LC176
	.quad	_wrap_node_t_p_port_set
	.quad	0
	.quad	.LC177
	.quad	_wrap_node_t_p_port_get
	.quad	0
	.quad	.LC178
	.quad	_wrap_node_t_p_buffer_set
	.quad	0
	.quad	.LC179
	.quad	_wrap_node_t_p_buffer_get
	.quad	0
	.quad	.LC180
	.quad	_wrap_node_t_size_set
	.quad	0
	.quad	.LC181
	.quad	_wrap_node_t_size_get
	.quad	0
	.quad	.LC182
	.quad	_wrap_new_node_t
	.quad	0
	.quad	.LC183
	.quad	_wrap_delete_node_t
	.quad	0
	.quad	.LC89
	.quad	SWIG_Tcl_ObjectConstructor
	.quad	_wrap_class_node
	.quad	.LC184
	.quad	_wrap_port_mgr_init
	.quad	0
	.quad	.LC185
	.quad	_wrap_port_mgr_reset
	.quad	0
	.quad	.LC186
	.quad	_wrap_port_mgr_add
	.quad	0
	.quad	.LC187
	.quad	_wrap_port_mgr_delete
	.quad	0
	.quad	.LC188
	.quad	_wrap_port_mgr_get_msg
	.quad	0
	.quad	.LC189
	.quad	_wrap_port_mgr_get_size
	.quad	0
	.quad	.LC190
	.quad	_wrap_port_mgr_check
	.quad	0
	.quad	.LC191
	.quad	_wrap_port_mgr_dump
	.quad	0
	.quad	.LC192
	.quad	_wrap_port_mgr_msg_set
	.quad	0
	.quad	.LC193
	.quad	_wrap_port_mgr_msg_get
	.quad	0
	.quad	.LC194
	.quad	_wrap_keynode_t_p_next_set
	.quad	0
	.quad	.LC195
	.quad	_wrap_keynode_t_p_next_get
	.quad	0
	.quad	.LC196
	.quad	_wrap_keynode_t_p_key_set
	.quad	0
	.quad	.LC197
	.quad	_wrap_keynode_t_p_key_get
	.quad	0
	.quad	.LC198
	.quad	_wrap_keynode_t_p_buffer_set
	.quad	0
	.quad	.LC199
	.quad	_wrap_keynode_t_p_buffer_get
	.quad	0
	.quad	.LC200
	.quad	_wrap_keynode_t_p_bcd_buffer_set
	.quad	0
	.quad	.LC201
	.quad	_wrap_keynode_t_p_bcd_buffer_get
	.quad	0
	.quad	.LC202
	.quad	_wrap_keynode_t_size_set
	.quad	0
	.quad	.LC203
	.quad	_wrap_keynode_t_size_get
	.quad	0
	.quad	.LC204
	.quad	_wrap_new_keynode_t
	.quad	0
	.quad	.LC205
	.quad	_wrap_delete_keynode_t
	.quad	0
	.quad	.LC141
	.quad	SWIG_Tcl_ObjectConstructor
	.quad	_wrap_class_keynode
	.quad	.LC206
	.quad	_wrap_key_mgr_init
	.quad	0
	.quad	.LC207
	.quad	_wrap_key_mgr_reset
	.quad	0
	.quad	.LC208
	.quad	_wrap_key_mgr_add
	.quad	0
	.quad	.LC209
	.quad	_wrap_key_mgr_delete
	.quad	0
	.quad	.LC210
	.quad	_wrap_key_mgr_get_msg
	.quad	0
	.quad	.LC211
	.quad	_wrap_key_mgr_get_size
	.quad	0
	.quad	.LC212
	.quad	_wrap_key_mgr_check
	.quad	0
	.quad	.LC213
	.quad	_wrap_key_mgr_dump
	.quad	0
	.quad	.LC214
	.quad	_wrap_key_mgr_bcd_get
	.quad	0
	.quad	.LC215
	.quad	_wrap_key_mgr_bcd_set
	.quad	0
	.quad	.LC216
	.quad	_wrap_test_bcd
	.quad	0
	.quad	.LC217
	.quad	_wrap_key_mgr_set_buff
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.local	swig_variables
	.comm	swig_variables,32,32
	.local	swig_constants
	.comm	swig_constants,48,32
	.section	.rodata
.LC218:
	.string	"_p_char"
.LC219:
	.string	"char *"
	.section	.data.rel.local
	.align 32
	.type	_swigt__p_char, @object
	.size	_swigt__p_char, 48
_swigt__p_char:
	.quad	.LC218
	.quad	.LC219
	.quad	0
	.quad	0
	.quad	0
	.long	0
	.zero	4
	.section	.rodata
.LC220:
	.string	"_p_keynode"
	.align 8
.LC221:
	.string	"struct keynode *|keynode_t *|keynode *"
	.section	.data.rel.local
	.align 32
	.type	_swigt__p_keynode, @object
	.size	_swigt__p_keynode, 48
_swigt__p_keynode:
	.quad	.LC220
	.quad	.LC221
	.quad	0
	.quad	0
	.quad	_wrap_class_keynode
	.long	0
	.zero	4
	.section	.rodata
.LC222:
	.string	"_p_node"
.LC223:
	.string	"struct node *|node *|node_t *"
	.section	.data.rel.local
	.align 32
	.type	_swigt__p_node, @object
	.size	_swigt__p_node, 48
_swigt__p_node:
	.quad	.LC222
	.quad	.LC223
	.quad	0
	.quad	0
	.quad	_wrap_class_node
	.long	0
	.zero	4
	.section	.rodata
.LC224:
	.string	"_p_unsigned_char"
.LC225:
	.string	"unsigned char *|uint8_t *"
	.section	.data.rel.local
	.align 32
	.type	_swigt__p_unsigned_char, @object
	.size	_swigt__p_unsigned_char, 48
_swigt__p_unsigned_char:
	.quad	.LC224
	.quad	.LC225
	.quad	0
	.quad	0
	.quad	0
	.long	0
	.zero	4
	.section	.rodata
.LC226:
	.string	"_p_unsigned_int"
.LC227:
	.string	"uint32_t *|unsigned int *"
	.section	.data.rel.local
	.align 32
	.type	_swigt__p_unsigned_int, @object
	.size	_swigt__p_unsigned_int, 48
_swigt__p_unsigned_int:
	.quad	.LC226
	.quad	.LC227
	.quad	0
	.quad	0
	.quad	0
	.long	0
	.zero	4
	.section	.rodata
.LC228:
	.string	"_p_unsigned_short"
.LC229:
	.string	"unsigned short *|uint16_t *"
	.section	.data.rel.local
	.align 32
	.type	_swigt__p_unsigned_short, @object
	.size	_swigt__p_unsigned_short, 48
_swigt__p_unsigned_short:
	.quad	.LC228
	.quad	.LC229
	.quad	0
	.quad	0
	.quad	0
	.long	0
	.zero	4
	.section	.rodata
.LC230:
	.string	"_p_void"
.LC231:
	.string	"void *"
	.section	.data.rel.local
	.align 32
	.type	_swigt__p_void, @object
	.size	_swigt__p_void, 48
_swigt__p_void:
	.quad	.LC230
	.quad	.LC231
	.quad	0
	.quad	0
	.quad	0
	.long	0
	.zero	4
	.align 32
	.type	swig_type_initial, @object
	.size	swig_type_initial, 56
swig_type_initial:
	.quad	_swigt__p_char
	.quad	_swigt__p_keynode
	.quad	_swigt__p_node
	.quad	_swigt__p_unsigned_char
	.quad	_swigt__p_unsigned_int
	.quad	_swigt__p_unsigned_short
	.quad	_swigt__p_void
	.align 32
	.type	_swigc__p_char, @object
	.size	_swigc__p_char, 64
_swigc__p_char:
	.quad	_swigt__p_char
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.align 32
	.type	_swigc__p_keynode, @object
	.size	_swigc__p_keynode, 64
_swigc__p_keynode:
	.quad	_swigt__p_keynode
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.align 32
	.type	_swigc__p_node, @object
	.size	_swigc__p_node, 64
_swigc__p_node:
	.quad	_swigt__p_node
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.align 32
	.type	_swigc__p_unsigned_char, @object
	.size	_swigc__p_unsigned_char, 64
_swigc__p_unsigned_char:
	.quad	_swigt__p_unsigned_char
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.align 32
	.type	_swigc__p_unsigned_int, @object
	.size	_swigc__p_unsigned_int, 64
_swigc__p_unsigned_int:
	.quad	_swigt__p_unsigned_int
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.align 32
	.type	_swigc__p_unsigned_short, @object
	.size	_swigc__p_unsigned_short, 64
_swigc__p_unsigned_short:
	.quad	_swigt__p_unsigned_short
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.align 32
	.type	_swigc__p_void, @object
	.size	_swigc__p_void, 64
_swigc__p_void:
	.quad	_swigt__p_void
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.align 32
	.type	swig_cast_initial, @object
	.size	swig_cast_initial, 56
swig_cast_initial:
	.quad	_swigc__p_char
	.quad	_swigc__p_keynode
	.quad	_swigc__p_node
	.quad	_swigc__p_unsigned_char
	.quad	_swigc__p_unsigned_int
	.quad	_swigc__p_unsigned_short
	.quad	_swigc__p_void
	.text
	.type	SWIG_InitializeModule, @function
SWIG_InitializeModule:
.LFB110:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -72(%rbp)
	movq	16+swig_module(%rip), %rax
	testq	%rax, %rax
	jne	.L1047
	leaq	swig_type_initial(%rip), %rax
	movq	%rax, 24+swig_module(%rip)
	leaq	swig_cast_initial(%rip), %rax
	movq	%rax, 32+swig_module(%rip)
	leaq	swig_module(%rip), %rax
	movq	%rax, 16+swig_module(%rip)
	movl	$1, -60(%rbp)
	jmp	.L1048
.L1047:
	movl	$0, -60(%rbp)
.L1048:
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	SWIG_Tcl_GetModule
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L1049
	movq	-72(%rbp), %rax
	leaq	swig_module(%rip), %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_SetModule
	jmp	.L1050
.L1049:
	movq	-16(%rbp), %rax
	movq	%rax, -48(%rbp)
.L1053:
	leaq	swig_module(%rip), %rax
	cmpq	%rax, -48(%rbp)
	je	.L1068
	movq	-48(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -48(%rbp)
	movq	-48(%rbp), %rax
	cmpq	-16(%rbp), %rax
	jne	.L1053
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, 16+swig_module(%rip)
	movq	-16(%rbp), %rax
	leaq	swig_module(%rip), %rdx
	movq	%rdx, 16(%rax)
.L1050:
	cmpl	$0, -60(%rbp)
	je	.L1069
	movq	$0, -56(%rbp)
	jmp	.L1055
.L1067:
	movq	$0, -40(%rbp)
	movq	16+swig_module(%rip), %rdx
	leaq	swig_module(%rip), %rax
	cmpq	%rax, %rdx
	je	.L1056
	movq	24+swig_module(%rip), %rax
	movq	-56(%rbp), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	(%rax), %rdx
	movq	16+swig_module(%rip), %rax
	leaq	swig_module(%rip), %rsi
	movq	%rax, %rdi
	call	SWIG_MangledTypeQueryModule
	movq	%rax, -40(%rbp)
.L1056:
	cmpq	$0, -40(%rbp)
	je	.L1057
	movq	24+swig_module(%rip), %rax
	movq	-56(%rbp), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	32(%rax), %rax
	testq	%rax, %rax
	je	.L1059
	movq	24+swig_module(%rip), %rax
	movq	-56(%rbp), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	32(%rax), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, 32(%rax)
	jmp	.L1059
.L1057:
	movq	24+swig_module(%rip), %rax
	movq	-56(%rbp), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, -40(%rbp)
.L1059:
	movq	32+swig_module(%rip), %rax
	movq	-56(%rbp), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, -24(%rbp)
	jmp	.L1060
.L1066:
	movq	$0, -32(%rbp)
	movq	16+swig_module(%rip), %rdx
	leaq	swig_module(%rip), %rax
	cmpq	%rax, %rdx
	je	.L1061
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rdx
	movq	16+swig_module(%rip), %rax
	leaq	swig_module(%rip), %rsi
	movq	%rax, %rdi
	call	SWIG_MangledTypeQueryModule
	movq	%rax, -32(%rbp)
.L1061:
	cmpq	$0, -32(%rbp)
	je	.L1062
	movq	24+swig_module(%rip), %rax
	movq	-56(%rbp), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	cmpq	-40(%rbp), %rax
	jne	.L1063
	movq	-24(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	$0, -32(%rbp)
	jmp	.L1062
.L1063:
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	-40(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	SWIG_TypeCheck
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L1062
	movq	$0, -32(%rbp)
.L1062:
	cmpq	$0, -32(%rbp)
	jne	.L1064
	movq	-40(%rbp), %rax
	movq	24(%rax), %rax
	testq	%rax, %rax
	je	.L1065
	movq	-40(%rbp), %rax
	movq	24(%rax), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, 24(%rax)
	movq	-40(%rbp), %rax
	movq	24(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, 16(%rax)
.L1065:
	movq	-40(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, 24(%rax)
.L1064:
	addq	$32, -24(%rbp)
.L1060:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L1066
	movq	swig_module(%rip), %rax
	movq	-56(%rbp), %rdx
	salq	$3, %rdx
	addq	%rax, %rdx
	movq	-40(%rbp), %rax
	movq	%rax, (%rdx)
	addq	$1, -56(%rbp)
.L1055:
	movq	8+swig_module(%rip), %rax
	cmpq	-56(%rbp), %rax
	ja	.L1067
	movq	swig_module(%rip), %rax
	movq	-56(%rbp), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	$0, (%rax)
	jmp	.L1046
.L1068:
	nop
	jmp	.L1046
.L1069:
	nop
.L1046:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE110:
	.size	SWIG_InitializeModule, .-SWIG_InitializeModule
	.type	SWIG_PropagateClientData, @function
SWIG_PropagateClientData:
.LFB111:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	init_run.10029(%rip), %eax
	testl	%eax, %eax
	jne	.L1079
	movl	$1, init_run.10029(%rip)
	movq	$0, -16(%rbp)
	jmp	.L1073
.L1078:
	movq	swig_module(%rip), %rax
	movq	-16(%rbp), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	32(%rax), %rax
	testq	%rax, %rax
	je	.L1074
	movq	swig_module(%rip), %rax
	movq	-16(%rbp), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	24(%rax), %rax
	movq	%rax, -8(%rbp)
	jmp	.L1075
.L1077:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L1076
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L1076
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	32(%rax), %rax
	testq	%rax, %rax
	jne	.L1076
	movq	swig_module(%rip), %rax
	movq	-16(%rbp), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	32(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	SWIG_TypeClientData
.L1076:
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -8(%rbp)
.L1075:
	cmpq	$0, -8(%rbp)
	jne	.L1077
.L1074:
	addq	$1, -16(%rbp)
.L1073:
	movq	8+swig_module(%rip), %rax
	cmpq	-16(%rbp), %rax
	ja	.L1078
	jmp	.L1070
.L1079:
	nop
.L1070:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE111:
	.size	SWIG_PropagateClientData, .-SWIG_PropagateClientData
	.type	SWIG_Tcl_InstallConstants, @function
SWIG_Tcl_InstallConstants:
.LFB112:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	swigconstTableinit(%rip), %eax
	testl	%eax, %eax
	jne	.L1081
	movl	$0, %esi
	leaq	swigconstTable(%rip), %rdi
	call	Tcl_InitHashTable@PLT
	movl	$1, swigconstTableinit(%rip)
.L1081:
	movq	$0, -16(%rbp)
	jmp	.L1082
.L1088:
	movq	-16(%rbp), %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	$4, %eax
	je	.L1084
	cmpl	$5, %eax
	je	.L1085
	jmp	.L1089
.L1084:
	movq	-16(%rbp), %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	40(%rax), %rax
	movq	(%rax), %rcx
	movq	-16(%rbp), %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	32(%rax), %rax
	movl	$0, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_NewPointerObj
	movq	%rax, -8(%rbp)
	jmp	.L1086
.L1085:
	movq	-16(%rbp), %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	40(%rax), %rax
	movq	(%rax), %rcx
	movq	-16(%rbp), %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	16(%rax), %rax
	movl	%eax, %esi
	movq	-16(%rbp), %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	32(%rax), %rax
	movq	%rcx, %rdx
	movq	%rax, %rdi
	call	SWIG_Tcl_NewPackedObj
	movq	%rax, -8(%rbp)
	jmp	.L1086
.L1089:
	movq	$0, -8(%rbp)
	nop
.L1086:
	cmpq	$0, -8(%rbp)
	je	.L1087
	movq	-16(%rbp), %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	8(%rax), %rcx
	movq	-8(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_SetConstantObj
.L1087:
	addq	$1, -16(%rbp)
.L1082:
	movq	-16(%rbp), %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	jne	.L1088
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE112:
	.size	SWIG_Tcl_InstallConstants, .-SWIG_Tcl_InstallConstants
	.type	SWIG_Tcl_InstallMethodLookupTables, @function
SWIG_Tcl_InstallMethodLookupTables:
.LFB113:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -48(%rbp)
	jmp	.L1091
.L1095:
	movq	24+swig_module(%rip), %rax
	movq	-48(%rbp), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	32(%rax), %rax
	testq	%rax, %rax
	je	.L1092
	movq	-32(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	addq	$72, %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	Tcl_InitHashTable@PLT
	movq	-24(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -40(%rbp)
	jmp	.L1093
.L1094:
	movq	-24(%rbp), %rax
	movq	144(%rax), %rax
	movq	-40(%rbp), %rdx
	movq	(%rdx), %rcx
	movq	-24(%rbp), %rdx
	leaq	72(%rdx), %rdi
	leaq	-52(%rbp), %rdx
	movq	%rcx, %rsi
	call	*%rax
	movq	%rax, -16(%rbp)
	movq	-40(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, 24(%rax)
	addq	$16, -40(%rbp)
.L1093:
	cmpq	$0, -40(%rbp)
	je	.L1092
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L1094
.L1092:
	addq	$1, -48(%rbp)
.L1091:
	movq	8+swig_module(%rip), %rax
	cmpq	-48(%rbp), %rax
	ja	.L1095
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L1096
	call	__stack_chk_fail@PLT
.L1096:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE113:
	.size	SWIG_Tcl_InstallMethodLookupTables, .-SWIG_Tcl_InstallMethodLookupTables
	.section	.rodata
.LC232:
	.string	"0.0"
.LC233:
	.string	"tclsharedmem"
	.text
	.globl	Tclsharedmem_Init
	.type	Tclsharedmem_Init, @function
Tclsharedmem_Init:
.LFB114:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L1098
	movl	$1, %eax
	jmp	.L1099
.L1098:
	movq	-24(%rbp), %rax
	movl	$0, %ecx
	leaq	.LC232(%rip), %rdx
	leaq	.LC233(%rip), %rsi
	movq	%rax, %rdi
	call	Tcl_PkgProvideEx@PLT
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	SWIG_InitializeModule
	call	SWIG_PropagateClientData
	movq	$0, -8(%rbp)
	jmp	.L1100
.L1101:
	movq	-8(%rbp), %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	16+swig_commands(%rip), %rax
	movq	(%rdx,%rax), %rcx
	movq	-8(%rbp), %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	8+swig_commands(%rip), %rax
	movq	(%rdx,%rax), %rdi
	movq	-8(%rbp), %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	swig_commands(%rip), %rax
	movq	(%rdx,%rax), %rsi
	movq	-24(%rbp), %rax
	movl	$0, %r8d
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	Tcl_CreateObjCommand@PLT
	addq	$1, -8(%rbp)
.L1100:
	movq	-8(%rbp), %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	swig_commands(%rip), %rax
	movq	(%rdx,%rax), %rax
	testq	%rax, %rax
	jne	.L1101
	movq	$0, -8(%rbp)
	jmp	.L1102
.L1103:
	movq	-8(%rbp), %rax
	salq	$5, %rax
	movq	%rax, %rdx
	leaq	swig_variables(%rip), %rax
	movq	(%rdx,%rax), %rsi
	movq	-24(%rbp), %rax
	movl	$1, %r8d
	leaq	.LC37(%rip), %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	Tcl_SetVar2@PLT
	movq	-8(%rbp), %rax
	salq	$5, %rax
	movq	%rax, %rdx
	leaq	8+swig_variables(%rip), %rax
	movq	(%rdx,%rax), %rcx
	movq	-8(%rbp), %rax
	salq	$5, %rax
	movq	%rax, %rdx
	leaq	16+swig_variables(%rip), %rax
	movq	(%rdx,%rax), %rdx
	movq	-8(%rbp), %rax
	salq	$5, %rax
	movq	%rax, %rsi
	leaq	swig_variables(%rip), %rax
	movq	(%rsi,%rax), %rsi
	movq	-24(%rbp), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movl	$17, %ecx
	movl	$0, %edx
	movq	%rax, %rdi
	call	Tcl_TraceVar2@PLT
	movq	-8(%rbp), %rax
	salq	$5, %rax
	movq	%rax, %rdx
	leaq	8+swig_variables(%rip), %rax
	movq	(%rdx,%rax), %rcx
	movq	-8(%rbp), %rax
	salq	$5, %rax
	movq	%rax, %rdx
	leaq	24+swig_variables(%rip), %rax
	movq	(%rdx,%rax), %rdx
	movq	-8(%rbp), %rax
	salq	$5, %rax
	movq	%rax, %rsi
	leaq	swig_variables(%rip), %rax
	movq	(%rsi,%rax), %rsi
	movq	-24(%rbp), %rax
	movq	%rcx, %r9
	movq	%rdx, %r8
	movl	$33, %ecx
	movl	$0, %edx
	movq	%rax, %rdi
	call	Tcl_TraceVar2@PLT
	addq	$1, -8(%rbp)
.L1102:
	movq	-8(%rbp), %rax
	salq	$5, %rax
	movq	%rax, %rdx
	leaq	swig_variables(%rip), %rax
	movq	(%rdx,%rax), %rax
	testq	%rax, %rax
	jne	.L1103
	movq	-24(%rbp), %rax
	leaq	swig_constants(%rip), %rsi
	movq	%rax, %rdi
	call	SWIG_Tcl_InstallConstants
	call	SWIG_Tcl_InstallMethodLookupTables
	movl	$0, %eax
.L1099:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE114:
	.size	Tclsharedmem_Init, .-Tclsharedmem_Init
	.globl	Tclsharedmem_SafeInit
	.type	Tclsharedmem_SafeInit, @function
Tclsharedmem_SafeInit:
.LFB115:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	Tclsharedmem_Init@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE115:
	.size	Tclsharedmem_SafeInit, .-Tclsharedmem_SafeInit
	.section	.rodata
	.align 16
	.type	hex.8200, @object
	.size	hex.8200, 17
hex.8200:
	.string	"0123456789abcdef"
	.local	swigobjectTableinit.8387
	.comm	swigobjectTableinit.8387,4,4
	.local	swigobjectTable.8386
	.comm	swigobjectTable.8386,88,32
	.align 16
	.type	__PRETTY_FUNCTION__.8412, @object
	.size	__PRETTY_FUNCTION__.8412, 30
__PRETTY_FUNCTION__.8412:
	.string	"SWIG_Tcl_ConvertPtrFromString"
	.local	init_run.10029
	.comm	init_run.10029,4,4
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
