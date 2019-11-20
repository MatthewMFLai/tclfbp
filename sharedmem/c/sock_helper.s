	.file	"sock_helper.c"
	.data
	.align 16
	.type	setinel, @object
	.size	setinel, 21
setinel:
	.string	"sentinel_dont_delete"
	.local	m_p_head
	.comm	m_p_head,8,8
	.text
	.globl	key_mgr_init
	.type	key_mgr_init, @function
key_mgr_init:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$-1, %esi
	leaq	setinel(%rip), %rdi
	call	key_mgr_add@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	key_mgr_init, .-key_mgr_init
	.globl	key_mgr_reset
	.type	key_mgr_reset, @function
key_mgr_reset:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	m_p_head(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L3
.L7:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	leaq	setinel(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L8
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, m_p_head(%rip)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-8(%rbp), %rax
	movl	32(%rax), %eax
	testl	%eax, %eax
	jle	.L6
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
.L6:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	m_p_head(%rip), %rax
	movq	%rax, -8(%rbp)
.L3:
	cmpq	$0, -8(%rbp)
	jne	.L7
	jmp	.L5
.L8:
	nop
.L5:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	key_mgr_reset, .-key_mgr_reset
	.globl	key_mgr_add
	.type	key_mgr_add, @function
key_mgr_add:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movq	m_p_head(%rip), %rax
	movq	%rax, -8(%rbp)
	movl	$40, %edi
	call	malloc@PLT
	movq	%rax, -8(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	addq	$1, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	movq	-8(%rbp), %rax
	movl	-28(%rbp), %edx
	movl	%edx, 32(%rax)
	cmpl	$0, -28(%rbp)
	jle	.L10
	movl	-28(%rbp), %eax
	cltq
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 16(%rax)
	movl	-28(%rbp), %eax
	movslq	%eax, %rdx
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movl	-28(%rbp), %eax
	addl	%eax, %eax
	addl	$1, %eax
	cltq
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 24(%rax)
	movl	-28(%rbp), %eax
	addl	%eax, %eax
	addl	$1, %eax
	movslq	%eax, %rdx
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
.L10:
	movq	m_p_head(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	movq	%rax, m_p_head(%rip)
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	key_mgr_add, .-key_mgr_add
	.globl	key_mgr_delete
	.type	key_mgr_delete, @function
key_mgr_delete:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	m_p_head(%rip), %rax
	movq	%rax, -16(%rbp)
	jmp	.L12
.L16:
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L13
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
	jmp	.L12
.L13:
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-16(%rbp), %rax
	movl	32(%rax), %eax
	testl	%eax, %eax
	jle	.L14
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-16(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
.L14:
	movq	-8(%rbp), %rcx
	movq	-16(%rbp), %rax
	movl	$40, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	memcpy@PLT
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movl	$1, %eax
	jmp	.L15
.L12:
	cmpq	$0, -16(%rbp)
	jne	.L16
	movl	$0, %eax
.L15:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	key_mgr_delete, .-key_mgr_delete
	.type	key_mgr_get, @function
key_mgr_get:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	m_p_head(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L18
.L21:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L19
	movq	-8(%rbp), %rax
	jmp	.L20
.L19:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
.L18:
	cmpq	$0, -8(%rbp)
	jne	.L21
	movl	$0, %eax
.L20:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	key_mgr_get, .-key_mgr_get
	.type	key_mgr_get_buffer, @function
key_mgr_get_buffer:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	$0, -16(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	key_mgr_get
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L23
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -16(%rbp)
.L23:
	movq	-16(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	key_mgr_get_buffer, .-key_mgr_get_buffer
	.globl	key_mgr_get_msg
	.type	key_mgr_get_msg, @function
key_mgr_get_msg:
.LFB8:
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
	call	key_mgr_get_buffer
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	key_mgr_get_msg, .-key_mgr_get_msg
	.globl	key_mgr_get_size
	.type	key_mgr_get_size, @function
key_mgr_get_size:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	$-1, -12(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	key_mgr_get
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L28
	movq	-8(%rbp), %rax
	movl	32(%rax), %eax
	movl	%eax, -12(%rbp)
.L28:
	movl	-12(%rbp), %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	key_mgr_get_size, .-key_mgr_get_size
	.globl	key_mgr_check
	.type	key_mgr_check, @function
key_mgr_check:
.LFB10:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	m_p_head(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L31
.L34:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L32
	movl	$1, %eax
	jmp	.L33
.L32:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
.L31:
	cmpq	$0, -8(%rbp)
	jne	.L34
	movl	$0, %eax
.L33:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	key_mgr_check, .-key_mgr_check
	.section	.rodata
.LC0:
	.string	"%s %p %p %d\n"
	.text
	.globl	key_mgr_dump
	.type	key_mgr_dump, @function
key_mgr_dump:
.LFB11:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	m_p_head(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L36
.L37:
	movq	-8(%rbp), %rax
	movl	32(%rax), %esi
	movq	-8(%rbp), %rax
	movq	24(%rax), %rcx
	movq	-8(%rbp), %rax
	movq	16(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movl	%esi, %r8d
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
.L36:
	cmpq	$0, -8(%rbp)
	jne	.L37
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	key_mgr_dump, .-key_mgr_dump
	.globl	key_mgr_bcd_get
	.type	key_mgr_bcd_get, @function
key_mgr_bcd_get:
.LFB12:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -56(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	key_mgr_get
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L39
	movl	$0, %eax
	jmp	.L40
.L39:
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	-24(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, -8(%rbp)
	movl	$0, -32(%rbp)
	movl	$0, -28(%rbp)
	jmp	.L41
.L46:
	movl	-32(%rbp), %eax
	movslq	%eax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	andl	$15, %eax
	movb	%al, -34(%rbp)
	movl	-32(%rbp), %eax
	movslq	%eax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	andl	$240, %eax
	sarl	$4, %eax
	movb	%al, -33(%rbp)
	cmpb	$0, -33(%rbp)
	js	.L42
	cmpb	$9, -33(%rbp)
	jg	.L42
	movl	-28(%rbp), %eax
	movslq	%eax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	-33(%rbp), %edx
	addl	$48, %edx
	movb	%dl, (%rax)
	jmp	.L43
.L42:
	movl	-28(%rbp), %eax
	movslq	%eax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	-33(%rbp), %edx
	addl	$55, %edx
	movb	%dl, (%rax)
.L43:
	addl	$1, -28(%rbp)
	cmpb	$0, -34(%rbp)
	js	.L44
	cmpb	$9, -34(%rbp)
	jg	.L44
	movl	-28(%rbp), %eax
	movslq	%eax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	-34(%rbp), %edx
	addl	$48, %edx
	movb	%dl, (%rax)
	jmp	.L45
.L44:
	movl	-28(%rbp), %eax
	movslq	%eax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	-34(%rbp), %edx
	addl	$55, %edx
	movb	%dl, (%rax)
.L45:
	addl	$1, -32(%rbp)
	addl	$1, -28(%rbp)
.L41:
	movq	-24(%rbp), %rax
	movl	32(%rax), %eax
	cmpl	-32(%rbp), %eax
	jg	.L46
	movq	-8(%rbp), %rax
.L40:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	key_mgr_bcd_get, .-key_mgr_bcd_get
	.globl	key_mgr_bcd_set
	.type	key_mgr_bcd_set, @function
key_mgr_bcd_set:
.LFB13:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	key_mgr_get
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L48
	movl	$-1, %eax
	jmp	.L49
.L48:
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	-24(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	-64(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	movl	$0, -32(%rbp)
	movl	$0, -28(%rbp)
	jmp	.L50
.L55:
	movl	-32(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -32(%rbp)
	movslq	%eax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -34(%rbp)
	movl	-32(%rbp), %eax
	movslq	%eax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -33(%rbp)
	cmpb	$47, -34(%rbp)
	jle	.L51
	cmpb	$57, -34(%rbp)
	jg	.L51
	movzbl	-34(%rbp), %eax
	subl	$48, %eax
	movb	%al, -36(%rbp)
	jmp	.L52
.L51:
	movzbl	-34(%rbp), %eax
	subl	$55, %eax
	movb	%al, -36(%rbp)
.L52:
	cmpb	$47, -33(%rbp)
	jle	.L53
	cmpb	$57, -33(%rbp)
	jg	.L53
	movzbl	-33(%rbp), %eax
	subl	$48, %eax
	movb	%al, -35(%rbp)
	jmp	.L54
.L53:
	movzbl	-33(%rbp), %eax
	subl	$55, %eax
	movb	%al, -35(%rbp)
.L54:
	movl	-28(%rbp), %eax
	movslq	%eax, %rdx
	movq	-16(%rbp), %rax
	addq	%rax, %rdx
	movsbl	-36(%rbp), %eax
	sall	$4, %eax
	orb	-35(%rbp), %al
	movb	%al, (%rdx)
	addl	$1, -32(%rbp)
	addl	$1, -28(%rbp)
.L50:
	movq	-24(%rbp), %rax
	movl	32(%rax), %eax
	addl	%eax, %eax
	cmpl	-32(%rbp), %eax
	jg	.L55
	movq	-24(%rbp), %rax
	movl	32(%rax), %eax
	addl	%eax, %eax
	addl	$1, %eax
	movslq	%eax, %rdx
	movq	-8(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movl	$0, %eax
.L49:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	key_mgr_bcd_set, .-key_mgr_bcd_set
	.globl	test_bcd
	.type	test_bcd, @function
test_bcd:
.LFB14:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -56(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$1819043176, -32(%rbp)
	movw	$111, -28(%rbp)
	movl	$1819438967, -16(%rbp)
	movw	$100, -12(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	key_mgr_get
	movq	%rax, -48(%rbp)
	cmpq	$0, -48(%rbp)
	je	.L61
	movq	-48(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -40(%rbp)
	leaq	-32(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	movq	-40(%rbp), %rax
	leaq	10(%rax), %rdx
	leaq	-16(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	strcpy@PLT
	nop
	jmp	.L56
.L61:
	nop
.L56:
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L60
	call	__stack_chk_fail@PLT
.L60:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	test_bcd, .-test_bcd
	.globl	key_mgr_set_buff
	.type	key_mgr_set_buff, @function
key_mgr_set_buff:
.LFB15:
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
	movq	%rax, %rdi
	call	key_mgr_get
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	je	.L65
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	-16(%rbp), %rax
	movl	32(%rax), %eax
	movslq	%eax, %rdx
	movq	-32(%rbp), %rcx
	movq	-8(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	memcpy@PLT
	nop
	jmp	.L62
.L65:
	nop
.L62:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	key_mgr_set_buff, .-key_mgr_set_buff
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
