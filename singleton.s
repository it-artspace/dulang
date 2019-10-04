	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 14	sdk_version 10, 14
	.globl	_dump_method            ## -- Begin function dump_method
	.p2align	4, 0x90
_dump_method:                           ## @dump_method
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movl	$50, %eax
	movl	%eax, %ecx
	movq	%rdi, -8(%rbp)
	movq	%rcx, %rdi
	callq	_malloc
	xorl	%esi, %esi
	movq	$-1, %rdx
	movq	%rax, -16(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	-16(%rbp), %rdi
	movq	-24(%rbp), %rax
	movq	24(%rax), %r8
	movq	-24(%rbp), %rax
	movq	16(%rax), %r9
	leaq	L_.str(%rip), %rcx
	movb	$0, %al
	callq	___sprintf_chk
	movq	-16(%rbp), %rcx
	movl	%eax, -28(%rbp)         ## 4-byte Spill
	movq	%rcx, %rax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_destroy_method         ## -- Begin function destroy_method
	.p2align	4, 0x90
_destroy_method:                        ## @destroy_method
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
	movq	%rdi, -16(%rbp)
	movq	-16(%rbp), %rdi
	movq	24(%rdi), %rdi
	movl	8(%rdi), %eax
	addl	$-1, %eax
	movl	%eax, 8(%rdi)
	cmpl	$0, %eax
	jne	LBB1_2
## %bb.1:
	movq	-16(%rbp), %rax
	movq	24(%rax), %rdi
	callq	_ob_dealloc
LBB1_2:
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movl	8(%rax), %ecx
	addl	$-1, %ecx
	movl	%ecx, 8(%rax)
	cmpl	$0, %ecx
	jne	LBB1_4
## %bb.3:
	movq	-16(%rbp), %rax
	movq	16(%rax), %rdi
	callq	_ob_dealloc
LBB1_4:
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_fast_str_check         ## -- Begin function fast_str_check
	.p2align	4, 0x90
_fast_str_check:                        ## @fast_str_check
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -16(%rbp)
	movq	%rsi, -24(%rbp)
	cmpq	$0, -16(%rbp)
	je	LBB2_2
## %bb.1:
	cmpq	$0, -24(%rbp)
	jne	LBB2_3
LBB2_2:
	movb	$0, -1(%rbp)
	jmp	LBB2_12
LBB2_3:
	movq	-16(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -40(%rbp)
	movq	-32(%rbp), %rax
	movl	12(%rax), %ecx
	movq	-40(%rbp), %rax
	cmpl	12(%rax), %ecx
	je	LBB2_5
## %bb.4:
	movb	$0, -1(%rbp)
	jmp	LBB2_12
LBB2_5:
	movl	$0, -44(%rbp)
LBB2_6:                                 ## =>This Inner Loop Header: Depth=1
	movl	-44(%rbp), %eax
	movq	-32(%rbp), %rcx
	cmpl	12(%rcx), %eax
	jge	LBB2_11
## %bb.7:                               ##   in Loop: Header=BB2_6 Depth=1
	movq	-32(%rbp), %rax
	movq	24(%rax), %rax
	movslq	-44(%rbp), %rcx
	movsbl	(%rax,%rcx), %edx
	movq	-40(%rbp), %rax
	movq	24(%rax), %rax
	movslq	-44(%rbp), %rcx
	movsbl	(%rax,%rcx), %esi
	cmpl	%esi, %edx
	je	LBB2_9
## %bb.8:
	movb	$0, -1(%rbp)
	jmp	LBB2_12
LBB2_9:                                 ##   in Loop: Header=BB2_6 Depth=1
	jmp	LBB2_10
LBB2_10:                                ##   in Loop: Header=BB2_6 Depth=1
	movl	-44(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -44(%rbp)
	jmp	LBB2_6
LBB2_11:
	movb	$1, -1(%rbp)
LBB2_12:
	movsbl	-1(%rbp), %eax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_new_ob                 ## -- Begin function new_ob
	.p2align	4, 0x90
_new_ob:                                ## @new_ob
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	$32, %eax
	movl	%eax, %edi
	callq	_dulalloc
	movl	$512, %ecx              ## imm = 0x200
	movl	%ecx, %edi
	leaq	_SINOBTYPE(%rip), %rdx
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	$0, 8(%rax)
	movq	-8(%rbp), %rax
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	movl	$0, 12(%rax)
	movq	-8(%rbp), %rax
	movl	$32, 16(%rax)
	callq	_malloc
	movq	-8(%rbp), %rdx
	movq	%rax, 24(%rdx)
	movl	$0, -12(%rbp)
LBB3_1:                                 ## =>This Inner Loop Header: Depth=1
	cmpl	$32, -12(%rbp)
	jge	LBB3_4
## %bb.2:                               ##   in Loop: Header=BB3_1 Depth=1
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	movslq	-12(%rbp), %rcx
	shlq	$4, %rcx
	addq	%rcx, %rax
	movq	$0, (%rax)
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	movslq	-12(%rbp), %rcx
	shlq	$4, %rcx
	addq	%rcx, %rax
	movq	$0, 8(%rax)
## %bb.3:                               ##   in Loop: Header=BB3_1 Depth=1
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	jmp	LBB3_1
LBB3_4:
	movq	-8(%rbp), %rax
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_ob_subscr_get          ## -- Begin function ob_subscr_get
	.p2align	4, 0x90
_ob_subscr_get:                         ## @ob_subscr_get
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$64, %rsp
	movq	%rdi, -16(%rbp)
	movq	%rsi, -24(%rbp)
	movq	-24(%rbp), %rsi
	movq	24(%rsi), %rsi
	movq	%rsi, -32(%rbp)
	movq	-16(%rbp), %rsi
	movq	%rsi, -40(%rbp)
	movq	-32(%rbp), %rdi
	callq	_hashstr
	movq	-40(%rbp), %rsi
	xorl	%edx, %edx
	divl	16(%rsi)
	movl	%edx, -44(%rbp)
	movl	$0, -48(%rbp)
LBB4_1:                                 ## =>This Inner Loop Header: Depth=1
	xorl	%eax, %eax
	movb	%al, %cl
	movq	-40(%rbp), %rdx
	movq	24(%rdx), %rdx
	movl	-44(%rbp), %eax
	movl	%eax, %esi
	shlq	$4, %rsi
	addq	%rsi, %rdx
	cmpq	$0, (%rdx)
	movb	%cl, -49(%rbp)          ## 1-byte Spill
	je	LBB4_3
## %bb.2:                               ##   in Loop: Header=BB4_1 Depth=1
	movq	-40(%rbp), %rax
	movq	24(%rax), %rax
	movl	-44(%rbp), %ecx
	movl	%ecx, %edx
	shlq	$4, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rdi
	movq	-24(%rbp), %rsi
	callq	_fast_str_check
	cmpb	$0, %al
	setne	%al
	xorb	$-1, %al
	movb	%al, -49(%rbp)          ## 1-byte Spill
LBB4_3:                                 ##   in Loop: Header=BB4_1 Depth=1
	movb	-49(%rbp), %al          ## 1-byte Reload
	testb	$1, %al
	jne	LBB4_4
	jmp	LBB4_7
LBB4_4:                                 ##   in Loop: Header=BB4_1 Depth=1
	imull	$5, -44(%rbp), %eax
	addl	$1, %eax
	movq	-40(%rbp), %rcx
	xorl	%edx, %edx
	divl	16(%rcx)
	movl	%edx, -44(%rbp)
	movl	-48(%rbp), %edx
	movl	%edx, %esi
	addl	$1, %esi
	movl	%esi, -48(%rbp)
	movq	-40(%rbp), %rcx
	cmpl	16(%rcx), %edx
	jne	LBB4_6
## %bb.5:
	movq	$0, -8(%rbp)
	jmp	LBB4_8
LBB4_6:                                 ##   in Loop: Header=BB4_1 Depth=1
	jmp	LBB4_1
LBB4_7:
	movq	-40(%rbp), %rax
	movq	24(%rax), %rax
	movl	-44(%rbp), %ecx
	movl	%ecx, %edx
	shlq	$4, %rdx
	addq	%rdx, %rax
	movq	8(%rax), %rax
	movq	%rax, -8(%rbp)
LBB4_8:
	movq	-8(%rbp), %rax
	addq	$64, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_ob_subscr_set          ## -- Begin function ob_subscr_set
	.p2align	4, 0x90
_ob_subscr_set:                         ## @ob_subscr_set
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$96, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	cmpq	$0, -24(%rbp)
	je	LBB5_2
## %bb.1:
	movq	-24(%rbp), %rax
	movl	8(%rax), %ecx
	addl	$1, %ecx
	movl	%ecx, 8(%rax)
LBB5_2:
	cmpq	$0, -24(%rbp)
	je	LBB5_7
## %bb.3:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$5, 208(%rax)
	jne	LBB5_7
## %bb.4:
	movl	$32, %eax
	movl	%eax, %edi
	callq	_malloc
	leaq	_METHODTYPE(%rip), %rdi
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movl	$1, 8(%rax)
	movq	-8(%rbp), %rax
	movq	-32(%rbp), %rcx
	movq	%rax, 16(%rcx)
	movq	-24(%rbp), %rax
	movq	-32(%rbp), %rcx
	movq	%rax, 24(%rcx)
	movq	-32(%rbp), %rax
	movq	%rdi, (%rax)
	cmpq	$0, -8(%rbp)
	je	LBB5_6
## %bb.5:
	movq	-8(%rbp), %rax
	movl	8(%rax), %ecx
	addl	$1, %ecx
	movl	%ecx, 8(%rax)
LBB5_6:
	movq	-32(%rbp), %rax
	movq	%rax, -24(%rbp)
LBB5_7:
	cmpq	$0, -16(%rbp)
	je	LBB5_9
## %bb.8:
	movq	-16(%rbp), %rax
	movl	8(%rax), %ecx
	addl	$1, %ecx
	movl	%ecx, 8(%rax)
LBB5_9:
	movq	-8(%rbp), %rax
	movq	%rax, -40(%rbp)
	movq	-16(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, -48(%rbp)
	movq	-40(%rbp), %rax
	movl	12(%rax), %ecx
	shll	$1, %ecx
	movq	-40(%rbp), %rax
	cmpl	16(%rax), %ecx
	jl	LBB5_17
## %bb.10:
	movq	-40(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, -56(%rbp)
	movq	-40(%rbp), %rax
	movl	16(%rax), %ecx
	movl	%ecx, -60(%rbp)
	movq	-40(%rbp), %rax
	movl	16(%rax), %ecx
	shll	$1, %ecx
	movl	%ecx, 16(%rax)
	movslq	%ecx, %rax
	shlq	$4, %rax
	movq	%rax, %rdi
	callq	_malloc
	xorl	%esi, %esi
	movq	$-1, %rcx
	movq	-40(%rbp), %rdi
	movq	%rax, 24(%rdi)
	movq	-40(%rbp), %rax
	movq	24(%rax), %rax
	movl	-60(%rbp), %edx
	shll	$1, %edx
	movslq	%edx, %rdi
	shlq	$4, %rdi
	movq	%rdi, -88(%rbp)         ## 8-byte Spill
	movq	%rax, %rdi
	movq	-88(%rbp), %rdx         ## 8-byte Reload
	callq	___memset_chk
	movq	-40(%rbp), %rcx
	movl	$0, 12(%rcx)
	movl	$0, -64(%rbp)
	movq	%rax, -96(%rbp)         ## 8-byte Spill
LBB5_11:                                ## =>This Inner Loop Header: Depth=1
	movl	-64(%rbp), %eax
	cmpl	-60(%rbp), %eax
	jge	LBB5_16
## %bb.12:                              ##   in Loop: Header=BB5_11 Depth=1
	movq	-56(%rbp), %rax
	movslq	-64(%rbp), %rcx
	shlq	$4, %rcx
	addq	%rcx, %rax
	cmpq	$0, (%rax)
	je	LBB5_14
## %bb.13:                              ##   in Loop: Header=BB5_11 Depth=1
	movq	-8(%rbp), %rdi
	movq	-56(%rbp), %rax
	movslq	-64(%rbp), %rcx
	shlq	$4, %rcx
	addq	%rcx, %rax
	movq	(%rax), %rsi
	movq	-56(%rbp), %rax
	movslq	-64(%rbp), %rcx
	shlq	$4, %rcx
	addq	%rcx, %rax
	movq	8(%rax), %rdx
	callq	_ob_subscr_set
LBB5_14:                                ##   in Loop: Header=BB5_11 Depth=1
	jmp	LBB5_15
LBB5_15:                                ##   in Loop: Header=BB5_11 Depth=1
	movl	-64(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -64(%rbp)
	jmp	LBB5_11
LBB5_16:
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	callq	_free
LBB5_17:
	movq	-48(%rbp), %rdi
	callq	_hashstr
	movq	-40(%rbp), %rdi
	xorl	%edx, %edx
	divl	16(%rdi)
	movl	%edx, -68(%rbp)
	movq	-40(%rbp), %rdi
	movq	24(%rdi), %rdi
	movl	-68(%rbp), %edx
	movl	%edx, %ecx
	shlq	$4, %rcx
	addq	%rcx, %rdi
	movq	%rdi, -80(%rbp)
	movq	-80(%rbp), %rcx
	cmpq	$0, (%rcx)
	jne	LBB5_19
## %bb.18:
	movq	-16(%rbp), %rax
	movq	-80(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-40(%rbp), %rax
	movl	12(%rax), %edx
	addl	$1, %edx
	movl	%edx, 12(%rax)
	movq	-24(%rbp), %rax
	movq	-80(%rbp), %rcx
	movq	%rax, 8(%rcx)
	jmp	LBB5_29
LBB5_19:
	jmp	LBB5_20
LBB5_20:                                ## =>This Inner Loop Header: Depth=1
	movq	-40(%rbp), %rax
	movq	24(%rax), %rax
	movl	-68(%rbp), %ecx
	movl	%ecx, %edx
	shlq	$4, %rdx
	addq	%rdx, %rax
	cmpq	$0, (%rax)
	je	LBB5_28
## %bb.21:                              ##   in Loop: Header=BB5_20 Depth=1
	movq	-40(%rbp), %rax
	movq	24(%rax), %rax
	movl	-68(%rbp), %ecx
	movl	%ecx, %edx
	shlq	$4, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rdi
	movq	-16(%rbp), %rsi
	callq	_fast_str_check
	cmpb	$0, %al
	je	LBB5_27
## %bb.22:
	movq	-40(%rbp), %rax
	movq	24(%rax), %rax
	movl	-68(%rbp), %ecx
	movl	%ecx, %edx
	shlq	$4, %rdx
	addq	%rdx, %rax
	cmpq	$0, 8(%rax)
	je	LBB5_26
## %bb.23:
	movq	-40(%rbp), %rax
	movq	24(%rax), %rax
	movl	-68(%rbp), %ecx
	movl	%ecx, %edx
	shlq	$4, %rdx
	addq	%rdx, %rax
	movq	8(%rax), %rax
	movl	8(%rax), %ecx
	addl	$-1, %ecx
	movl	%ecx, 8(%rax)
	cmpl	$0, %ecx
	jne	LBB5_25
## %bb.24:
	movq	-40(%rbp), %rax
	movq	24(%rax), %rax
	movl	-68(%rbp), %ecx
	movl	%ecx, %edx
	shlq	$4, %rdx
	addq	%rdx, %rax
	movq	8(%rax), %rdi
	callq	_ob_dealloc
LBB5_25:
	jmp	LBB5_26
LBB5_26:
	movq	-24(%rbp), %rax
	movq	-40(%rbp), %rcx
	movq	24(%rcx), %rcx
	movl	-68(%rbp), %edx
	movl	%edx, %esi
	shlq	$4, %rsi
	addq	%rsi, %rcx
	movq	%rax, 8(%rcx)
	movq	-16(%rbp), %rax
	movq	-40(%rbp), %rcx
	movq	24(%rcx), %rcx
	movl	-68(%rbp), %edx
	movl	%edx, %esi
	shlq	$4, %rsi
	addq	%rsi, %rcx
	movq	%rax, (%rcx)
	jmp	LBB5_29
LBB5_27:                                ##   in Loop: Header=BB5_20 Depth=1
	imull	$5, -68(%rbp), %eax
	addl	$1, %eax
	movq	-40(%rbp), %rcx
	xorl	%edx, %edx
	divl	16(%rcx)
	movl	%edx, -68(%rbp)
	jmp	LBB5_20
LBB5_28:
	movq	-40(%rbp), %rax
	movl	12(%rax), %ecx
	addl	$1, %ecx
	movl	%ecx, 12(%rax)
	movq	-16(%rbp), %rax
	movq	-40(%rbp), %rdx
	movq	24(%rdx), %rdx
	movl	-68(%rbp), %ecx
	movl	%ecx, %esi
	shlq	$4, %rsi
	addq	%rsi, %rdx
	movq	%rax, (%rdx)
	movq	-24(%rbp), %rax
	movq	-40(%rbp), %rdx
	movq	24(%rdx), %rdx
	movl	-68(%rbp), %ecx
	movl	%ecx, %esi
	shlq	$4, %rsi
	addq	%rsi, %rdx
	movq	%rax, 8(%rdx)
LBB5_29:
	addq	$96, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_dump_object            ## -- Begin function dump_object
	.p2align	4, 0x90
_dump_object:                           ## @dump_object
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$64, %rsp
	movq	%rdi, -16(%rbp)
	movq	-16(%rbp), %rdi
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rdi
	cmpl	$0, 12(%rdi)
	jne	LBB6_2
## %bb.1:
	leaq	L_.str.4(%rip), %rdi
	callq	_strdup
	movq	%rax, -8(%rbp)
	jmp	LBB6_14
LBB6_2:
	movl	$10000, %eax            ## imm = 0x2710
	movl	%eax, %edi
	callq	_dulalloc
	xorl	%esi, %esi
	movq	$-1, %rdx
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rdi
	leaq	L_.str.5(%rip), %rcx
	movb	$0, %al
	callq	___sprintf_chk
	movq	-40(%rbp), %rcx
	movslq	%eax, %rdx
	addq	%rdx, %rcx
	movq	%rcx, -40(%rbp)
	movl	$0, -44(%rbp)
LBB6_3:                                 ## =>This Inner Loop Header: Depth=1
	movl	-44(%rbp), %eax
	movq	-24(%rbp), %rcx
	cmpl	16(%rcx), %eax
	jge	LBB6_11
## %bb.4:                               ##   in Loop: Header=BB6_3 Depth=1
	movq	-24(%rbp), %rax
	movq	24(%rax), %rax
	movslq	-44(%rbp), %rcx
	shlq	$4, %rcx
	addq	%rcx, %rax
	cmpq	$0, (%rax)
	je	LBB6_9
## %bb.5:                               ##   in Loop: Header=BB6_3 Depth=1
	xorl	%esi, %esi
	movq	$-1, %rdx
	movq	-40(%rbp), %rdi
	movq	-24(%rbp), %rax
	movq	24(%rax), %rax
	movslq	-44(%rbp), %rcx
	shlq	$4, %rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	movq	24(%rax), %r8
	leaq	L_.str.6(%rip), %rcx
	movb	$0, %al
	callq	___sprintf_chk
	movq	-40(%rbp), %rcx
	movslq	%eax, %rdx
	addq	%rdx, %rcx
	movq	%rcx, -40(%rbp)
	movq	-24(%rbp), %rcx
	movq	24(%rcx), %rcx
	movslq	-44(%rbp), %rdx
	shlq	$4, %rdx
	addq	%rdx, %rcx
	movq	8(%rcx), %rcx
	movq	%rcx, -56(%rbp)
	movq	-56(%rbp), %rcx
	movq	(%rcx), %rcx
	cmpq	$0, 8(%rcx)
	je	LBB6_7
## %bb.6:                               ##   in Loop: Header=BB6_3 Depth=1
	movq	-24(%rbp), %rax
	movq	24(%rax), %rax
	movslq	-44(%rbp), %rcx
	shlq	$4, %rcx
	addq	%rcx, %rax
	movq	8(%rax), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	movq	-24(%rbp), %rcx
	movq	24(%rcx), %rcx
	movslq	-44(%rbp), %rdx
	shlq	$4, %rdx
	addq	%rdx, %rcx
	movq	8(%rcx), %rdi
	callq	*%rax
	xorl	%esi, %esi
	movq	$-1, %rdx
	movq	%rax, -64(%rbp)
	movq	-40(%rbp), %rdi
	movq	-64(%rbp), %r8
	leaq	L_.str.7(%rip), %rcx
	movb	$0, %al
	callq	___sprintf_chk
	movq	-40(%rbp), %rcx
	movslq	%eax, %rdx
	addq	%rdx, %rcx
	movq	%rcx, -40(%rbp)
	movq	-64(%rbp), %rdi
	callq	_free
	jmp	LBB6_8
LBB6_7:                                 ##   in Loop: Header=BB6_3 Depth=1
	xorl	%esi, %esi
	movq	$-1, %rdx
	movq	-40(%rbp), %rdi
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %r8
	movq	-56(%rbp), %r9
	leaq	L_.str.8(%rip), %rcx
	movb	$0, %al
	callq	___sprintf_chk
	movq	-40(%rbp), %rcx
	movslq	%eax, %rdx
	addq	%rdx, %rcx
	movq	%rcx, -40(%rbp)
LBB6_8:                                 ##   in Loop: Header=BB6_3 Depth=1
	jmp	LBB6_9
LBB6_9:                                 ##   in Loop: Header=BB6_3 Depth=1
	jmp	LBB6_10
LBB6_10:                                ##   in Loop: Header=BB6_3 Depth=1
	movl	-44(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -44(%rbp)
	jmp	LBB6_3
LBB6_11:
	movq	-40(%rbp), %rax
	cmpq	-32(%rbp), %rax
	je	LBB6_13
## %bb.12:
	movq	-40(%rbp), %rax
	addq	$-2, %rax
	movq	%rax, -40(%rbp)
LBB6_13:
	movq	-40(%rbp), %rax
	movq	%rax, %rcx
	addq	$1, %rcx
	movq	%rcx, -40(%rbp)
	movb	$125, (%rax)
	movq	-40(%rbp), %rax
	movb	$0, (%rax)
	movq	-32(%rbp), %rax
	movq	%rax, -8(%rbp)
LBB6_14:
	movq	-8(%rbp), %rax
	addq	$64, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_obj_dealloc            ## -- Begin function obj_dealloc
	.p2align	4, 0x90
_obj_dealloc:                           ## @obj_dealloc
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	movq	%rdi, -16(%rbp)
	movl	$0, -20(%rbp)
LBB7_1:                                 ## =>This Inner Loop Header: Depth=1
	cmpl	$32, -20(%rbp)
	jge	LBB7_10
## %bb.2:                               ##   in Loop: Header=BB7_1 Depth=1
	movq	-16(%rbp), %rax
	movq	24(%rax), %rax
	movslq	-20(%rbp), %rcx
	shlq	$4, %rcx
	addq	%rcx, %rax
	cmpq	$0, 8(%rax)
	je	LBB7_8
## %bb.3:                               ##   in Loop: Header=BB7_1 Depth=1
	movq	-16(%rbp), %rax
	movq	24(%rax), %rax
	movslq	-20(%rbp), %rcx
	shlq	$4, %rcx
	addq	%rcx, %rax
	movq	8(%rax), %rax
	movl	8(%rax), %edx
	addl	$-1, %edx
	movl	%edx, 8(%rax)
	cmpl	$0, %edx
	jne	LBB7_5
## %bb.4:                               ##   in Loop: Header=BB7_1 Depth=1
	movq	-16(%rbp), %rax
	movq	24(%rax), %rax
	movslq	-20(%rbp), %rcx
	shlq	$4, %rcx
	addq	%rcx, %rax
	movq	8(%rax), %rdi
	callq	_ob_dealloc
LBB7_5:                                 ##   in Loop: Header=BB7_1 Depth=1
	movq	-16(%rbp), %rax
	movq	24(%rax), %rax
	movslq	-20(%rbp), %rcx
	shlq	$4, %rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	movl	8(%rax), %edx
	addl	$-1, %edx
	movl	%edx, 8(%rax)
	cmpl	$0, %edx
	jne	LBB7_7
## %bb.6:                               ##   in Loop: Header=BB7_1 Depth=1
	movq	-16(%rbp), %rax
	movq	24(%rax), %rax
	movslq	-20(%rbp), %rcx
	shlq	$4, %rcx
	addq	%rcx, %rax
	movq	(%rax), %rdi
	callq	_ob_dealloc
LBB7_7:                                 ##   in Loop: Header=BB7_1 Depth=1
	jmp	LBB7_8
LBB7_8:                                 ##   in Loop: Header=BB7_1 Depth=1
	jmp	LBB7_9
LBB7_9:                                 ##   in Loop: Header=BB7_1 Depth=1
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -20(%rbp)
	jmp	LBB7_1
LBB7_10:
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_ob_contains_field      ## -- Begin function ob_contains_field
	.p2align	4, 0x90
_ob_contains_field:                     ## @ob_contains_field
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -16(%rbp)
	movq	%rsi, -24(%rbp)
	movq	-24(%rbp), %rsi
	movq	(%rsi), %rsi
	movq	(%rsi), %rdi
	leaq	L_.str.10(%rip), %rsi
	callq	_strcmp
	cmpl	$0, %eax
	je	LBB8_2
## %bb.1:
	movb	$0, -1(%rbp)
	jmp	LBB8_3
LBB8_2:
	movq	-24(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	-16(%rbp), %rdi
	movq	-32(%rbp), %rax
	movq	%rax, %rsi
	callq	_ob_subscr_get
	cmpq	$0, %rax
	setne	%cl
	andb	$1, %cl
	movzbl	%cl, %edx
	movb	%dl, %cl
	movb	%cl, -1(%rbp)
LBB8_3:
	movsbl	-1(%rbp), %eax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_init_obj_iter          ## -- Begin function init_obj_iter
	.p2align	4, 0x90
_init_obj_iter:                         ## @init_obj_iter
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movl	$32, %eax
	movl	%eax, %ecx
	movq	%rdi, -16(%rbp)
	movq	%rcx, %rdi
	callq	_dulalloc
	leaq	_OBJITERTYPE(%rip), %rcx
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movl	$1, 8(%rax)
	movq	-24(%rbp), %rax
	movq	%rcx, (%rax)
	movq	-16(%rbp), %rax
	movq	-24(%rbp), %rcx
	movq	%rax, 16(%rcx)
	movl	$0, -28(%rbp)
LBB9_1:                                 ## =>This Inner Loop Header: Depth=1
	xorl	%eax, %eax
	movb	%al, %cl
	movl	-28(%rbp), %eax
	movq	-16(%rbp), %rdx
	cmpl	16(%rdx), %eax
	movb	%cl, -29(%rbp)          ## 1-byte Spill
	jge	LBB9_3
## %bb.2:                               ##   in Loop: Header=BB9_1 Depth=1
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	movq	24(%rax), %rax
	movslq	-28(%rbp), %rcx
	shlq	$4, %rcx
	addq	%rcx, %rax
	cmpq	$0, (%rax)
	setne	%dl
	xorb	$-1, %dl
	movb	%dl, -29(%rbp)          ## 1-byte Spill
LBB9_3:                                 ##   in Loop: Header=BB9_1 Depth=1
	movb	-29(%rbp), %al          ## 1-byte Reload
	testb	$1, %al
	jne	LBB9_4
	jmp	LBB9_6
LBB9_4:                                 ##   in Loop: Header=BB9_1 Depth=1
	jmp	LBB9_5
LBB9_5:                                 ##   in Loop: Header=BB9_1 Depth=1
	movl	-28(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -28(%rbp)
	jmp	LBB9_1
LBB9_6:
	movl	-28(%rbp), %eax
	movq	-16(%rbp), %rcx
	cmpl	16(%rcx), %eax
	jne	LBB9_8
## %bb.7:
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	callq	_free
	movq	$0, -8(%rbp)
	jmp	LBB9_9
LBB9_8:
	movl	-28(%rbp), %eax
	movq	-24(%rbp), %rcx
	movl	%eax, 24(%rcx)
	movq	-24(%rbp), %rcx
	movq	%rcx, -8(%rbp)
LBB9_9:
	movq	-8(%rbp), %rax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_obj_iter_next          ## -- Begin function obj_iter_next
	.p2align	4, 0x90
_obj_iter_next:                         ## @obj_iter_next
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -16(%rbp)
	movq	-16(%rbp), %rdi
	movq	%rdi, -24(%rbp)
LBB10_1:                                ## =>This Inner Loop Header: Depth=1
	movq	-24(%rbp), %rax
	movl	24(%rax), %ecx
	addl	$1, %ecx
	movl	%ecx, 24(%rax)
## %bb.2:                               ##   in Loop: Header=BB10_1 Depth=1
	xorl	%eax, %eax
	movb	%al, %cl
	movq	-24(%rbp), %rdx
	movl	24(%rdx), %eax
	movq	-24(%rbp), %rdx
	movq	16(%rdx), %rdx
	cmpl	16(%rdx), %eax
	movb	%cl, -25(%rbp)          ## 1-byte Spill
	jge	LBB10_4
## %bb.3:                               ##   in Loop: Header=BB10_1 Depth=1
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	movq	24(%rax), %rax
	movq	-24(%rbp), %rcx
	movslq	24(%rcx), %rcx
	shlq	$4, %rcx
	addq	%rcx, %rax
	cmpq	$0, (%rax)
	setne	%dl
	xorb	$-1, %dl
	movb	%dl, -25(%rbp)          ## 1-byte Spill
LBB10_4:                                ##   in Loop: Header=BB10_1 Depth=1
	movb	-25(%rbp), %al          ## 1-byte Reload
	testb	$1, %al
	jne	LBB10_1
## %bb.5:
	movq	-24(%rbp), %rax
	movl	24(%rax), %ecx
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	cmpl	16(%rax), %ecx
	jne	LBB10_7
## %bb.6:
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	callq	_free
	movq	$0, -8(%rbp)
	jmp	LBB10_8
LBB10_7:
	movq	-16(%rbp), %rax
	movq	%rax, -8(%rbp)
LBB10_8:
	movq	-8(%rbp), %rax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_unpack_obj_iter        ## -- Begin function unpack_obj_iter
	.p2align	4, 0x90
_unpack_obj_iter:                       ## @unpack_obj_iter
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	movq	%rdi, -16(%rbp)
	movq	-16(%rbp), %rdi
	movq	16(%rdi), %rdi
	movq	24(%rdi), %rdi
	movq	-16(%rbp), %rax
	movslq	24(%rax), %rax
	shlq	$4, %rax
	addq	%rax, %rdi
	movq	(%rdi), %rax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"method at %lX bound to %lX"

L_.str.1:                               ## @.str.1
	.asciz	"method"

	.section	__DATA,__const
	.globl	_METHODTYPE             ## @METHODTYPE
	.p2align	3
_METHODTYPE:
	.quad	L_.str.1
	.quad	_dump_method
	.quad	0
	.quad	_destroy_method
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.long	10                      ## 0xa
	.space	4
	.quad	0

	.section	__TEXT,__cstring,cstring_literals
L_.str.2:                               ## @.str.2
	.asciz	"object"

	.section	__DATA,__const
	.globl	_SINOBTYPE              ## @SINOBTYPE
	.p2align	3
_SINOBTYPE:
	.quad	L_.str.2
	.quad	_dump_object
	.quad	0
	.quad	_obj_dealloc
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	_ob_contains_field
	.quad	_init_obj_iter
	.quad	0
	.quad	_ob_subscr_get
	.quad	_ob_subscr_set
	.quad	0
	.quad	0
	.quad	0
	.long	4                       ## 0x4
	.space	4
	.quad	0

	.section	__TEXT,__cstring,cstring_literals
L_.str.4:                               ## @.str.4
	.asciz	"{}"

L_.str.5:                               ## @.str.5
	.asciz	"{"

L_.str.6:                               ## @.str.6
	.asciz	"%s: "

L_.str.7:                               ## @.str.7
	.asciz	"%s, "

L_.str.8:                               ## @.str.8
	.asciz	"%s at %p, "

L_.str.9:                               ## @.str.9
	.asciz	"object iterator"

	.section	__DATA,__const
	.globl	_OBJITERTYPE            ## @OBJITERTYPE
	.p2align	3
_OBJITERTYPE:
	.quad	L_.str.9
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	_obj_iter_next
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	_unpack_obj_iter
	.long	4294967295              ## 0xffffffff
	.space	4
	.quad	0

	.section	__TEXT,__cstring,cstring_literals
L_.str.10:                              ## @.str.10
	.asciz	"string"


.subsections_via_symbols
