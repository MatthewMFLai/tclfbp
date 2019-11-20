	.file	"shm.c"
	.section	.rodata
.LC0:
	.string	"ftok failure"
.LC1:
	.string	"shmget failure"
.LC2:
	.string	"shmat failure"
	.text
	.globl	shm_init
	.type	shm_init, @function
shm_init:
.LFB2:
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
	movl	$4294967295, %eax
	movq	%rax, -8(%rbp)
	movq	-32(%rbp), %rax
	movl	$82, %esi
	movq	%rax, %rdi
	call	ftok@PLT
	movl	%eax, -12(%rbp)
	cmpl	$-1, -12(%rbp)
	jne	.L2
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	movq	-8(%rbp), %rax
	jmp	.L3
.L2:
	movq	-24(%rbp), %rcx
	movl	-12(%rbp), %eax
	movl	$932, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	shmget@PLT
	movl	%eax, %edx
	movq	-40(%rbp), %rax
	movl	%edx, (%rax)
	movq	-40(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$-1, %eax
	jne	.L4
	leaq	.LC1(%rip), %rdi
	call	puts@PLT
	movq	-8(%rbp), %rax
	jmp	.L3
.L4:
	movq	-40(%rbp), %rax
	movl	(%rax), %eax
	movl	$0, %edx
	movl	$0, %esi
	movl	%eax, %edi
	call	shmat@PLT
	movq	%rax, -8(%rbp)
	cmpq	$-1, -8(%rbp)
	jne	.L5
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
	movq	-8(%rbp), %rax
	jmp	.L3
.L5:
	movq	-8(%rbp), %rax
.L3:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	shm_init, .-shm_init
	.globl	shm_remove
	.type	shm_remove, @function
shm_remove:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$0, %edx
	movl	$0, %esi
	movl	%eax, %edi
	call	shmctl@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	shm_remove, .-shm_remove
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
