	.file	"queue.c"
	.text
	.globl	sv_csr_write_wrapper
	.type	sv_csr_write_wrapper, @function
sv_csr_write_wrapper:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	shm_mgr_get_addr@PLT
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L2
	movl	$3, %eax
	jmp	.L3
.L2:
	movq	-16(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-48(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	rbuff_push@PLT
	movl	%eax, -20(%rbp)
	movl	-20(%rbp), %eax
.L3:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	sv_csr_write_wrapper, .-sv_csr_write_wrapper
	.globl	sv_csr_read_wrapper
	.type	sv_csr_read_wrapper, @function
sv_csr_read_wrapper:
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
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	shm_mgr_get_addr@PLT
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L5
	movl	$3, %eax
	jmp	.L6
.L5:
	movq	-16(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-48(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	rbuff_pop@PLT
	movl	%eax, -20(%rbp)
	movl	-20(%rbp), %eax
.L6:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	sv_csr_read_wrapper, .-sv_csr_read_wrapper
	.globl	sv_csr_peek_wrapper
	.type	sv_csr_peek_wrapper, @function
sv_csr_peek_wrapper:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	shm_mgr_get_addr@PLT
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L8
	movl	$3, %eax
	jmp	.L9
.L8:
	movq	-16(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-48(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	rbuff_peek@PLT
	movl	%eax, -20(%rbp)
	movl	-20(%rbp), %eax
.L9:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	sv_csr_peek_wrapper, .-sv_csr_peek_wrapper
	.globl	sv_csr_qlen_wrapper
	.type	sv_csr_qlen_wrapper, @function
sv_csr_qlen_wrapper:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	shm_mgr_get_addr@PLT
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L11
	movl	$3, %eax
	jmp	.L12
.L11:
	movq	-16(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	rbuff_get_len@PLT
	movl	%eax, -20(%rbp)
	movl	-20(%rbp), %eax
.L12:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	sv_csr_qlen_wrapper, .-sv_csr_qlen_wrapper
	.globl	queue_init
	.type	queue_init, @function
queue_init:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	call	shm_mgr_init@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	queue_init, .-queue_init
	.globl	stub_init
	.type	stub_init, @function
stub_init:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movl	%esi, -44(%rbp)
	movl	%edx, -48(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	shm_mgr_check@PLT
	xorl	$1, %eax
	testb	%al, %al
	je	.L17
	movl	-44(%rbp), %eax
	imull	-48(%rbp), %eax
	movl	%eax, %eax
	leaq	24(%rax), %rcx
	leaq	-20(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rax, %rsi
	movq	%rcx, %rdi
	call	shm_init@PLT
	movq	%rax, -16(%rbp)
	movl	-20(%rbp), %ecx
	movq	-16(%rbp), %rdx
	movq	-40(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	shm_mgr_add@PLT
.L17:
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L16
	call	__stack_chk_fail@PLT
.L16:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	stub_init, .-stub_init
	.globl	stub_clear
	.type	stub_clear, @function
stub_clear:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	%edx, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	shm_mgr_get_addr@PLT
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	je	.L21
	movl	-28(%rbp), %eax
	imull	-32(%rbp), %eax
	movl	%eax, %eax
	leaq	24(%rax), %rdx
	movq	-16(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movq	-16(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	-28(%rbp), %edx
	movl	%edx, 12(%rax)
	movq	-8(%rbp), %rax
	movl	-32(%rbp), %edx
	movl	%edx, 8(%rax)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	rbuff_init@PLT
	jmp	.L18
.L21:
	nop
.L18:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	stub_clear, .-stub_clear
	.globl	stub_cleanup
	.type	stub_cleanup, @function
stub_cleanup:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	shm_mgr_get_shmid@PLT
	movl	%eax, -4(%rbp)
	cmpl	$-1, -4(%rbp)
	je	.L24
	movl	-4(%rbp), %eax
	movl	%eax, %edi
	call	shm_remove@PLT
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	shm_mgr_delete@PLT
.L24:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	stub_cleanup, .-stub_cleanup
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
