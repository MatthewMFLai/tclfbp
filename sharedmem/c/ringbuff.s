	.file	"ringbuff.c"
	.text
	.globl	rbuff_init
	.type	rbuff_init, @function
rbuff_init:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	$32, -4(%rbp)
	nop
.L2:
	movq	-24(%rbp), %rax
	movl	12(%rax), %edx
	subl	$1, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, %ecx
	shrl	%cl, %edx
	movl	%edx, %eax
	andl	$1, %eax
	testl	%eax, %eax
	je	.L2
	movl	-4(%rbp), %eax
	movl	$1, %edx
	movl	%eax, %ecx
	sall	%cl, %edx
	movl	%edx, %eax
	movl	%eax, %edx
	movq	-24(%rbp), %rax
	movl	%edx, 12(%rax)
	movq	-24(%rbp), %rax
	movl	$0, 16(%rax)
	movq	-24(%rbp), %rax
	movl	$0, 20(%rax)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	rbuff_init, .-rbuff_init
	.globl	rbuff_push
	.type	rbuff_push, @function
rbuff_push:
.LFB1:
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
	jne	.L4
	movl	$1, %eax
	jmp	.L5
.L4:
	movq	-24(%rbp), %rax
	movl	20(%rax), %edx
	movq	-24(%rbp), %rax
	movl	12(%rax), %eax
	addl	%eax, %edx
	movq	-24(%rbp), %rax
	movl	16(%rax), %eax
	cmpl	%eax, %edx
	jne	.L6
	movl	$2, %eax
	jmp	.L5
.L6:
	movq	-24(%rbp), %rax
	movl	8(%rax), %edx
	movq	-24(%rbp), %rax
	movl	16(%rax), %ecx
	movq	-24(%rbp), %rax
	movl	12(%rax), %eax
	subl	$1, %eax
	andl	%ecx, %eax
	imull	%edx, %eax
	movl	%eax, %eax
	leaq	24(%rax), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -8(%rbp)
	movq	-24(%rbp), %rax
	movl	8(%rax), %eax
	movl	%eax, %edx
	movq	-32(%rbp), %rcx
	movq	-8(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	memcpy@PLT
	movq	-24(%rbp), %rax
	movl	16(%rax), %eax
	leal	1(%rax), %edx
	movq	-24(%rbp), %rax
	movl	%edx, 16(%rax)
	movl	$0, %eax
.L5:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	rbuff_push, .-rbuff_push
	.globl	rbuff_pop
	.type	rbuff_pop, @function
rbuff_pop:
.LFB2:
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
	movl	20(%rax), %edx
	movq	-24(%rbp), %rax
	movl	16(%rax), %eax
	cmpl	%eax, %edx
	jne	.L8
	movl	$1, %eax
	jmp	.L9
.L8:
	cmpq	$0, -32(%rbp)
	je	.L10
	movq	-24(%rbp), %rax
	movl	8(%rax), %edx
	movq	-24(%rbp), %rax
	movl	20(%rax), %ecx
	movq	-24(%rbp), %rax
	movl	12(%rax), %eax
	subl	$1, %eax
	andl	%ecx, %eax
	imull	%edx, %eax
	movl	%eax, %eax
	leaq	24(%rax), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -8(%rbp)
	movq	-24(%rbp), %rax
	movl	8(%rax), %eax
	movl	%eax, %edx
	movq	-8(%rbp), %rcx
	movq	-32(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	memcpy@PLT
.L10:
	movq	-24(%rbp), %rax
	movl	20(%rax), %eax
	leal	1(%rax), %edx
	movq	-24(%rbp), %rax
	movl	%edx, 20(%rax)
	movl	$0, %eax
.L9:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	rbuff_pop, .-rbuff_pop
	.globl	rbuff_peek_at
	.type	rbuff_peek_at, @function
rbuff_peek_at:
.LFB3:
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
	cmpq	$0, -32(%rbp)
	jne	.L12
	movl	$1, %eax
	jmp	.L13
.L12:
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	rbuff_get_len@PLT
	cmpl	-36(%rbp), %eax
	ja	.L14
	movl	$1, %eax
	jmp	.L13
.L14:
	movq	-24(%rbp), %rax
	movl	8(%rax), %edx
	movq	-24(%rbp), %rax
	movl	20(%rax), %ecx
	movl	-36(%rbp), %eax
	addl	%eax, %ecx
	movq	-24(%rbp), %rax
	movl	12(%rax), %eax
	subl	$1, %eax
	andl	%ecx, %eax
	imull	%edx, %eax
	movl	%eax, %eax
	leaq	24(%rax), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -8(%rbp)
	movq	-24(%rbp), %rax
	movl	8(%rax), %eax
	movl	%eax, %edx
	movq	-8(%rbp), %rcx
	movq	-32(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	memcpy@PLT
	movl	$0, %eax
.L13:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	rbuff_peek_at, .-rbuff_peek_at
	.globl	rbuff_peek
	.type	rbuff_peek, @function
rbuff_peek:
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
	movq	-16(%rbp), %rcx
	movq	-8(%rbp), %rax
	movl	$0, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	rbuff_peek_at@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	rbuff_peek, .-rbuff_peek
	.globl	rbuff_peek_all
	.type	rbuff_peek_all, @function
rbuff_peek_all:
.LFB5:
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
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	rbuff_get_len@PLT
	movl	%eax, -8(%rbp)
	movl	$0, -12(%rbp)
	jmp	.L18
.L21:
	movq	-24(%rbp), %rax
	movl	8(%rax), %eax
	imull	-12(%rbp), %eax
	movl	%eax, %edx
	movq	-32(%rbp), %rax
	leaq	(%rdx,%rax), %rcx
	movl	-12(%rbp), %edx
	movq	-24(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	rbuff_peek_at@PLT
	movl	%eax, -4(%rbp)
	cmpl	$0, -4(%rbp)
	je	.L19
	movl	-4(%rbp), %eax
	jmp	.L20
.L19:
	addl	$1, -12(%rbp)
.L18:
	movl	-12(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jb	.L21
	movq	-40(%rbp), %rax
	movl	-8(%rbp), %edx
	movl	%edx, (%rax)
	movl	$0, %eax
.L20:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	rbuff_peek_all, .-rbuff_peek_all
	.globl	rbuff_flush
	.type	rbuff_flush, @function
rbuff_flush:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	16(%rax), %edx
	movq	-8(%rbp), %rax
	movl	%edx, 20(%rax)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	rbuff_flush, .-rbuff_flush
	.globl	rbuff_get_len
	.type	rbuff_get_len, @function
rbuff_get_len:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	16(%rax), %edx
	movq	-8(%rbp), %rax
	movl	20(%rax), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	rbuff_get_len, .-rbuff_get_len
	.globl	rbuff_is_full
	.type	rbuff_is_full, @function
rbuff_is_full:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	20(%rax), %edx
	movq	-8(%rbp), %rax
	movl	12(%rax), %eax
	addl	%eax, %edx
	movq	-8(%rbp), %rax
	movl	16(%rax), %eax
	cmpl	%eax, %edx
	sete	%al
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	rbuff_is_full, .-rbuff_is_full
	.globl	rbuff_is_empty
	.type	rbuff_is_empty, @function
rbuff_is_empty:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	20(%rax), %edx
	movq	-8(%rbp), %rax
	movl	16(%rax), %eax
	cmpl	%eax, %edx
	sete	%al
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	rbuff_is_empty, .-rbuff_is_empty
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
