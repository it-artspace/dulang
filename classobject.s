	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 14	sdk_version 10, 14
	.globl	_get_attr               ## -- Begin function get_attr
	.p2align	4, 0x90
_get_attr:                              ## @get_attr
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movq	%rdi, -16(%rbp)
	movq	%rsi, -24(%rbp)
	movq	-16(%rbp), %rsi
	movq	%rsi, -32(%rbp)
	movq	-24(%rbp), %rdi
	callq	_hashstr
	movq	-32(%rbp), %rsi
	xorl	%edx, %edx
	divl	16(%rsi)
	movl	%edx, -36(%rbp)
LBB0_1:                                 ## =>This Inner Loop Header: Depth=1
	movq	-24(%rbp), %rdi
	movq	-32(%rbp), %rax
	addq	$24, %rax
	movl	-36(%rbp), %ecx
	movl	%ecx, %edx
	shlq	$5, %rdx
	addq	%rdx, %rax
	addq	$1, %rax
	movq	%rax, %rsi
	callq	_strcmp
	cmpl	$0, %eax
	je	LBB0_5
## %bb.2:                               ##   in Loop: Header=BB0_1 Depth=1
	movq	-32(%rbp), %rax
	addq	$24, %rax
	movl	-36(%rbp), %ecx
	movl	%ecx, %edx
	shlq	$5, %rdx
	addq	%rdx, %rax
	movsbl	(%rax), %ecx
	cmpl	$0, %ecx
	jne	LBB0_4
## %bb.3:
	movq	$0, -8(%rbp)
	jmp	LBB0_6
LBB0_4:                                 ##   in Loop: Header=BB0_1 Depth=1
	imull	$5, -36(%rbp), %eax
	addl	$1, %eax
	movq	-32(%rbp), %rcx
	xorl	%edx, %edx
	divl	16(%rcx)
	movl	%edx, -36(%rbp)
	jmp	LBB0_1
LBB0_5:
	movq	-32(%rbp), %rax
	addq	$24, %rax
	movl	-36(%rbp), %ecx
	movl	%ecx, %edx
	shlq	$5, %rdx
	addq	%rdx, %rax
	movq	24(%rax), %rax
	movq	%rax, -8(%rbp)
LBB0_6:
	movq	-8(%rbp), %rax
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_set_attr               ## -- Begin function set_attr
	.p2align	4, 0x90
_set_attr:                              ## @set_attr
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$64, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-8(%rbp), %rdx
	movq	%rdx, -32(%rbp)
	movq	-16(%rbp), %rdi
	callq	_hashstr
	movq	-32(%rbp), %rdx
	xorl	%ecx, %ecx
	movq	%rdx, -48(%rbp)         ## 8-byte Spill
	movl	%ecx, %edx
	movq	-48(%rbp), %rsi         ## 8-byte Reload
	divl	16(%rsi)
	movl	%edx, -36(%rbp)
LBB1_1:                                 ## =>This Inner Loop Header: Depth=1
	movq	-32(%rbp), %rax
	addq	$24, %rax
	movl	-36(%rbp), %ecx
	movl	%ecx, %edx
	shlq	$5, %rdx
	addq	%rdx, %rax
	movsbl	(%rax), %ecx
	cmpl	$0, %ecx
	jne	LBB1_3
## %bb.2:
	jmp	LBB1_5
LBB1_3:                                 ##   in Loop: Header=BB1_1 Depth=1
	imull	$5, -36(%rbp), %eax
	addl	$1, %eax
	movq	-32(%rbp), %rcx
	xorl	%edx, %edx
	divl	16(%rcx)
	movl	%edx, -36(%rbp)
## %bb.4:                               ##   in Loop: Header=BB1_1 Depth=1
	movq	-16(%rbp), %rdi
	movq	-32(%rbp), %rax
	addq	$24, %rax
	movl	-36(%rbp), %ecx
	movl	%ecx, %edx
	shlq	$5, %rdx
	addq	%rdx, %rax
	addq	$1, %rax
	movq	%rax, %rsi
	callq	_strcmp
	cmpl	$0, %eax
	jne	LBB1_1
LBB1_5:
	movl	$22, %eax
	movl	%eax, %edx
	movq	-24(%rbp), %rcx
	movq	-32(%rbp), %rsi
	addq	$24, %rsi
	movl	-36(%rbp), %eax
	movl	%eax, %edi
	shlq	$5, %rdi
	addq	%rdi, %rsi
	movq	%rcx, 24(%rsi)
	movq	-32(%rbp), %rcx
	addq	$24, %rcx
	movl	-36(%rbp), %eax
	movl	%eax, %esi
	shlq	$5, %rsi
	addq	%rsi, %rcx
	movb	$1, (%rcx)
	movq	-32(%rbp), %rcx
	addq	$24, %rcx
	movl	-36(%rbp), %eax
	movl	%eax, %esi
	shlq	$5, %rsi
	addq	%rsi, %rcx
	addq	$1, %rcx
	movq	-16(%rbp), %rsi
	movq	%rcx, %rdi
	callq	___strcpy_chk
	movq	%rax, -56(%rbp)         ## 8-byte Spill
	addq	$64, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_new_classob            ## -- Begin function new_classob
	.p2align	4, 0x90
_new_classob:                           ## @new_classob
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	$8216, %eax             ## imm = 0x2018
	movl	%eax, %edi
	callq	_dulalloc
	movq	%rax, -8(%rbp)
	movl	$0, -12(%rbp)
LBB2_1:                                 ## =>This Inner Loop Header: Depth=1
	cmpl	$256, -12(%rbp)         ## imm = 0x100
	jge	LBB2_4
## %bb.2:                               ##   in Loop: Header=BB2_1 Depth=1
	movq	-8(%rbp), %rax
	addq	$24, %rax
	movslq	-12(%rbp), %rcx
	shlq	$5, %rcx
	addq	%rcx, %rax
	movb	$0, (%rax)
## %bb.3:                               ##   in Loop: Header=BB2_1 Depth=1
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	jmp	LBB2_1
LBB2_4:
	movq	-8(%rbp), %rax
	movl	$256, 16(%rax)          ## imm = 0x100
	movq	-8(%rbp), %rax
	movl	$0, 12(%rax)
	movq	-8(%rbp), %rax
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function

.subsections_via_symbols
