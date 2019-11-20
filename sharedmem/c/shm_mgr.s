	.file	"shm_mgr.c"
	.data
	.align 16
	.type	setinel, @object
	.size	setinel, 21
setinel:
	.string	"sentinel_dont_delete"
	.local	m_p_head
	.comm	m_p_head,8,8
	.text
	.globl	shm_mgr_init
	.type	shm_mgr_init, @function
shm_mgr_init:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$0, %edx
	movl	$-1, %esi
	leaq	setinel(%rip), %rdi
	call	shm_mgr_add@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	shm_mgr_init, .-shm_mgr_init
	.globl	shm_mgr_reset
	.type	shm_mgr_reset, @function
shm_mgr_reset:
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
.L6:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	leaq	setinel(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L7
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, m_p_head(%rip)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	m_p_head(%rip), %rax
	movq	%rax, -8(%rbp)
.L3:
	cmpq	$0, -8(%rbp)
	jne	.L6
	jmp	.L5
.L7:
	nop
.L5:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	shm_mgr_reset, .-shm_mgr_reset
	.globl	shm_mgr_add
	.type	shm_mgr_add, @function
shm_mgr_add:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movq	%rdx, -40(%rbp)
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
	movq	-8(%rbp), %rax
	movq	-40(%rbp), %rdx
	movq	%rdx, 16(%rax)
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
	.size	shm_mgr_add, .-shm_mgr_add
	.globl	shm_mgr_delete
	.type	shm_mgr_delete, @function
shm_mgr_delete:
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
	jmp	.L10
.L13:
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L11
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
	jmp	.L10
.L11:
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
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
	jmp	.L12
.L10:
	cmpq	$0, -16(%rbp)
	jne	.L13
	movl	$0, %eax
.L12:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	shm_mgr_delete, .-shm_mgr_delete
	.type	shm_mgr_get, @function
shm_mgr_get:
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
	jmp	.L15
.L18:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L16
	movq	-8(%rbp), %rax
	jmp	.L17
.L16:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
.L15:
	cmpq	$0, -8(%rbp)
	jne	.L18
	movl	$0, %eax
.L17:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	shm_mgr_get, .-shm_mgr_get
	.globl	shm_mgr_get_addr
	.type	shm_mgr_get_addr, @function
shm_mgr_get_addr:
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
	call	shm_mgr_get
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L20
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -16(%rbp)
.L20:
	movq	-16(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	shm_mgr_get_addr, .-shm_mgr_get_addr
	.globl	shm_mgr_get_shmid
	.type	shm_mgr_get_shmid, @function
shm_mgr_get_shmid:
.LFB8:
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
	call	shm_mgr_get
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L23
	movq	-8(%rbp), %rax
	movl	24(%rax), %eax
	movl	%eax, -12(%rbp)
.L23:
	movl	-12(%rbp), %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	shm_mgr_get_shmid, .-shm_mgr_get_shmid
	.globl	shm_mgr_check
	.type	shm_mgr_check, @function
shm_mgr_check:
.LFB9:
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
	jmp	.L26
.L29:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L27
	movl	$1, %eax
	jmp	.L28
.L27:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
.L26:
	cmpq	$0, -8(%rbp)
	jne	.L29
	movl	$0, %eax
.L28:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	shm_mgr_check, .-shm_mgr_check
	.section	.rodata
.LC0:
	.string	"%s %p %d\n"
	.text
	.globl	shm_mgr_dump
	.type	shm_mgr_dump, @function
shm_mgr_dump:
.LFB10:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	m_p_head(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L31
.L32:
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
.L31:
	cmpq	$0, -8(%rbp)
	jne	.L32
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	shm_mgr_dump, .-shm_mgr_dump
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
