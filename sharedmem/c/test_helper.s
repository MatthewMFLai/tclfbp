	.file	"test_helper.c"
	.data
	.align 16
	.type	setinel, @object
	.size	setinel, 21
setinel:
	.string	"sentinel_dont_delete"
	.local	m_p_head
	.comm	m_p_head,8,8
	.text
	.globl	port_mgr_init
	.type	port_mgr_init, @function
port_mgr_init:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$-1, %esi
	leaq	setinel(%rip), %rdi
	call	port_mgr_add@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	port_mgr_init, .-port_mgr_init
	.globl	port_mgr_reset
	.type	port_mgr_reset, @function
port_mgr_reset:
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
	movl	24(%rax), %eax
	testl	%eax, %eax
	jle	.L6
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
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
	.size	port_mgr_reset, .-port_mgr_reset
	.globl	port_mgr_add
	.type	port_mgr_add, @function
port_mgr_add:
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
	movl	$32, %edi
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
	movl	%edx, 24(%rax)
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
	.size	port_mgr_add, .-port_mgr_add
	.globl	port_mgr_delete
	.type	port_mgr_delete, @function
port_mgr_delete:
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
	movl	24(%rax), %eax
	testl	%eax, %eax
	jle	.L14
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
.L14:
	movq	-8(%rbp), %rcx
	movq	-16(%rbp), %rax
	movl	$32, %edx
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
	.size	port_mgr_delete, .-port_mgr_delete
	.type	port_mgr_get, @function
port_mgr_get:
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
	.size	port_mgr_get, .-port_mgr_get
	.type	port_mgr_get_buffer, @function
port_mgr_get_buffer:
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
	call	port_mgr_get
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
	.size	port_mgr_get_buffer, .-port_mgr_get_buffer
	.globl	port_mgr_get_msg
	.type	port_mgr_get_msg, @function
port_mgr_get_msg:
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
	call	port_mgr_get_buffer
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	port_mgr_get_msg, .-port_mgr_get_msg
	.globl	port_mgr_get_size
	.type	port_mgr_get_size, @function
port_mgr_get_size:
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
	call	port_mgr_get
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L28
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	movl	%eax, -12(%rbp)
.L28:
	movl	-12(%rbp), %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	port_mgr_get_size, .-port_mgr_get_size
	.globl	port_mgr_check
	.type	port_mgr_check, @function
port_mgr_check:
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
	.size	port_mgr_check, .-port_mgr_check
	.section	.rodata
.LC0:
	.string	"%s %p %d\n"
	.text
	.globl	port_mgr_dump
	.type	port_mgr_dump, @function
port_mgr_dump:
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
	movl	24(%rax), %ecx
	movq	-8(%rbp), %rax
	movq	16(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
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
	.size	port_mgr_dump, .-port_mgr_dump
	.globl	port_mgr_msg_set
	.type	port_mgr_msg_set, @function
port_mgr_msg_set:
.LFB12:
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
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	port_mgr_get_buffer
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L41
	movl	-36(%rbp), %eax
	movslq	%eax, %rdx
	movq	-8(%rbp), %rax
	addq	%rax, %rdx
	movq	-32(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	strcpy@PLT
	jmp	.L38
.L41:
	nop
.L38:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	port_mgr_msg_set, .-port_mgr_msg_set
	.globl	port_mgr_msg_get
	.type	port_mgr_msg_get, @function
port_mgr_msg_get:
.LFB13:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	port_mgr_get_buffer
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L43
	movl	$0, %eax
	jmp	.L44
.L43:
	movl	-28(%rbp), %eax
	movslq	%eax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
.L44:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	port_mgr_msg_get, .-port_mgr_msg_get
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
