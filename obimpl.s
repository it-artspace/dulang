	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 14	sdk_version 10, 14
	.globl	_ob_alloc               ## -- Begin function ob_alloc
	.weak_definition	_ob_alloc
	.p2align	4, 0x90
_ob_alloc:                              ## @ob_alloc
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	callq	_malloc
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_ob_dealloc             ## -- Begin function ob_dealloc
	.p2align	4, 0x90
_ob_dealloc:                            ## @ob_dealloc
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	movq	(%rdi), %rdi
	cmpq	$0, 24(%rdi)
	je	LBB1_2
## %bb.1:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	24(%rax), %rax
	movq	-8(%rbp), %rdi
	callq	*%rax
LBB1_2:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 208(%rax)
	je	LBB1_4
## %bb.3:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$1, 208(%rax)
	jne	LBB1_5
LBB1_4:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	callq	_free
	jmp	LBB1_6
LBB1_5:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	callq	_free
LBB1_6:
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_dulalloc               ## -- Begin function dulalloc
	.p2align	4, 0x90
_dulalloc:                              ## @dulalloc
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	callq	_malloc
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_dulfree                ## -- Begin function dulfree
	.p2align	4, 0x90
_dulfree:                               ## @dulfree
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	callq	_free
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function

.subsections_via_symbols
