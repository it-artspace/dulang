	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 14	sdk_version 10, 14
	.globl	_nametable_lookup       ## -- Begin function nametable_lookup
	.p2align	4, 0x90
_nametable_lookup:                      ## @nametable_lookup
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
	movl	$0, -28(%rbp)
LBB0_1:                                 ## =>This Inner Loop Header: Depth=1
	movl	-28(%rbp), %eax
	movq	-16(%rbp), %rcx
	cmpl	32(%rcx), %eax
	jge	LBB0_6
## %bb.2:                               ##   in Loop: Header=BB0_1 Depth=1
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movslq	-28(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdi
	movq	-24(%rbp), %rsi
	callq	_strcmp
	cmpl	$0, %eax
	jne	LBB0_4
## %bb.3:
	movl	-28(%rbp), %eax
	movl	%eax, -4(%rbp)
	jmp	LBB0_7
LBB0_4:                                 ##   in Loop: Header=BB0_1 Depth=1
	jmp	LBB0_5
LBB0_5:                                 ##   in Loop: Header=BB0_1 Depth=1
	movl	-28(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -28(%rbp)
	jmp	LBB0_1
LBB0_6:
	movl	$-1, -4(%rbp)
LBB0_7:
	movl	-4(%rbp), %eax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_add_literal            ## -- Begin function add_literal
	.p2align	4, 0x90
_add_literal:                           ## @add_literal
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rsi
	movl	40(%rsi), %eax
	movl	%eax, %ecx
	addl	$1, %ecx
	movl	%ecx, 40(%rsi)
	movq	-8(%rbp), %rsi
	cmpl	44(%rsi), %eax
	jne	LBB1_2
## %bb.1:
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	movq	-8(%rbp), %rcx
	movl	44(%rcx), %edx
	shll	$1, %edx
	movl	%edx, 44(%rcx)
	movslq	%edx, %rcx
	shlq	$3, %rcx
	movq	%rax, %rdi
	movq	%rcx, %rsi
	callq	_realloc
	movq	-8(%rbp), %rcx
	movq	%rax, 24(%rcx)
LBB1_2:
	movq	-16(%rbp), %rax
	movl	$1, 8(%rax)
	movq	-16(%rbp), %rax
	movq	-8(%rbp), %rcx
	movq	24(%rcx), %rcx
	movq	-8(%rbp), %rdx
	movl	40(%rdx), %esi
	subl	$1, %esi
	movslq	%esi, %rdx
	movq	%rax, (%rcx,%rdx,8)
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_write_op               ## -- Begin function write_op
	.p2align	4, 0x90
_write_op:                              ## @write_op
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	%edx, -16(%rbp)
	movq	-8(%rbp), %rdi
	movl	52(%rdi), %edx
	movl	%edx, %esi
	addl	$1, %esi
	movl	%esi, 52(%rdi)
	movq	-8(%rbp), %rdi
	cmpl	60(%rdi), %edx
	jne	LBB2_2
## %bb.1:
	movq	-8(%rbp), %rax
	movq	80(%rax), %rax
	movq	-8(%rbp), %rcx
	movl	60(%rcx), %edx
	shll	$1, %edx
	movl	%edx, 60(%rcx)
	movslq	%edx, %rcx
	imulq	$24, %rcx, %rsi
	movq	%rax, %rdi
	callq	_realloc
	movq	-8(%rbp), %rcx
	movq	%rax, 80(%rcx)
LBB2_2:
	movl	-12(%rbp), %eax
	movq	-8(%rbp), %rcx
	movq	80(%rcx), %rcx
	movq	-8(%rbp), %rdx
	movl	52(%rdx), %esi
	subl	$1, %esi
	movslq	%esi, %rdx
	imulq	$24, %rdx, %rdx
	addq	%rdx, %rcx
	movl	%eax, (%rcx)
	movl	-16(%rbp), %eax
	movq	-8(%rbp), %rcx
	movq	80(%rcx), %rcx
	movq	-8(%rbp), %rdx
	movl	52(%rdx), %esi
	subl	$1, %esi
	movslq	%esi, %rdx
	imulq	$24, %rdx, %rdx
	addq	%rdx, %rcx
	movl	%eax, 4(%rcx)
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_add_name               ## -- Begin function add_name
	.p2align	4, 0x90
_add_name:                              ## @add_name
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	$0, -20(%rbp)
	movl	$0, -24(%rbp)
LBB3_1:                                 ## =>This Inner Loop Header: Depth=1
	movl	-24(%rbp), %eax
	movq	-8(%rbp), %rcx
	cmpl	32(%rcx), %eax
	jge	LBB3_6
## %bb.2:                               ##   in Loop: Header=BB3_1 Depth=1
	movq	-16(%rbp), %rdi
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movslq	-24(%rbp), %rcx
	movq	(%rax,%rcx,8), %rsi
	callq	_strcmp
	cmpl	$0, %eax
	jne	LBB3_4
## %bb.3:                               ##   in Loop: Header=BB3_1 Depth=1
	movl	$1, -20(%rbp)
LBB3_4:                                 ##   in Loop: Header=BB3_1 Depth=1
	jmp	LBB3_5
LBB3_5:                                 ##   in Loop: Header=BB3_1 Depth=1
	movl	-24(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -24(%rbp)
	jmp	LBB3_1
LBB3_6:
	cmpl	$0, -20(%rbp)
	jne	LBB3_10
## %bb.7:
	movq	-8(%rbp), %rax
	movl	56(%rax), %ecx
	movq	-8(%rbp), %rax
	movl	32(%rax), %edx
	movl	%edx, %esi
	addl	$1, %esi
	movl	%esi, 32(%rax)
	cmpl	%edx, %ecx
	jne	LBB3_9
## %bb.8:
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	-8(%rbp), %rcx
	movl	56(%rcx), %edx
	shll	$1, %edx
	movl	%edx, 56(%rcx)
	movslq	%edx, %rcx
	shlq	$3, %rcx
	movq	%rax, %rdi
	movq	%rcx, %rsi
	callq	_realloc
	movq	-8(%rbp), %rcx
	movq	%rax, 16(%rcx)
LBB3_9:
	movq	-16(%rbp), %rdi
	callq	_strdup
	movq	-8(%rbp), %rdi
	movq	16(%rdi), %rdi
	movq	-8(%rbp), %rcx
	movl	32(%rcx), %edx
	subl	$1, %edx
	movslq	%edx, %rcx
	movq	%rax, (%rdi,%rcx,8)
LBB3_10:
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_init_func              ## -- Begin function init_func
	.p2align	4, 0x90
_init_func:                             ## @init_func
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	$88, %eax
	movl	%eax, %ecx
	movq	%rdi, -8(%rbp)
	movq	%rcx, %rdi
	callq	_malloc
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rdi
	callq	_fsetup
	movl	$80, %edx
	movl	%edx, %edi
	movq	-16(%rbp), %rax
	movl	$0, 36(%rax)
	movq	-16(%rbp), %rax
	movq	$0, 64(%rax)
	movq	-16(%rbp), %rax
	movl	$10, 56(%rax)
	callq	_malloc
	movl	$360, %edx              ## imm = 0x168
	movl	%edx, %edi
	movq	-16(%rbp), %rcx
	movq	%rax, 16(%rcx)
	movq	-16(%rbp), %rax
	movl	$15, 60(%rax)
	callq	_malloc
	movl	$80, %edx
	movl	%edx, %edi
	movq	-16(%rbp), %rcx
	movq	%rax, 80(%rcx)
	movq	-16(%rbp), %rax
	movl	$10, 44(%rax)
	movq	-16(%rbp), %rax
	movl	$0, 40(%rax)
	callq	_malloc
	movq	-16(%rbp), %rcx
	movq	%rax, 24(%rcx)
	movq	-16(%rbp), %rax
	movl	$0, 52(%rax)
	movq	-8(%rbp), %rax
	movq	-16(%rbp), %rcx
	movq	%rax, 64(%rcx)
	movq	-16(%rbp), %rax
	movq	$0, 72(%rax)
	movq	-16(%rbp), %rax
	movl	$1, 8(%rax)
	movq	-16(%rbp), %rax
	movl	$0, 32(%rax)
	movq	-16(%rbp), %rax
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_load_file              ## -- Begin function load_file
	.p2align	4, 0x90
_load_file:                             ## @load_file
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movq	%rdi, -16(%rbp)
	movq	-16(%rbp), %rdi
	callq	_parse_file
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	LBB5_2
## %bb.1:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	leaq	L_.str(%rip), %rsi
	movb	$0, %al
	callq	_fprintf
	movq	$0, -8(%rbp)
	movl	%eax, -40(%rbp)         ## 4-byte Spill
	jmp	LBB5_9
LBB5_2:
	xorl	%eax, %eax
	movl	%eax, %edi
	callq	_init_func
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rdi
	movq	-24(%rbp), %rsi
	callq	_extract_names
	cmpq	$0, -24(%rbp)
	je	LBB5_8
## %bb.3:
	movl	$0, -36(%rbp)
LBB5_4:                                 ## =>This Inner Loop Header: Depth=1
	movl	-36(%rbp), %eax
	movq	-24(%rbp), %rcx
	cmpl	(%rcx), %eax
	jge	LBB5_7
## %bb.5:                               ##   in Loop: Header=BB5_4 Depth=1
	movq	-32(%rbp), %rdi
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	movslq	-36(%rbp), %rcx
	movq	(%rax,%rcx,8), %rsi
	callq	_write_node
## %bb.6:                               ##   in Loop: Header=BB5_4 Depth=1
	movl	-36(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -36(%rbp)
	jmp	LBB5_4
LBB5_7:
	jmp	LBB5_8
LBB5_8:
	xorl	%edx, %edx
	movq	-32(%rbp), %rdi
	movl	$39, %esi
	callq	_write_op
	movq	-24(%rbp), %rdi
	callq	_astnode_delete
	movq	-32(%rbp), %rdi
	movq	%rdi, -8(%rbp)
LBB5_9:
	movq	-8(%rbp), %rax
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_extract_names          ## -- Begin function extract_names
	.p2align	4, 0x90
_extract_names:                         ## @extract_names
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
	movq	-16(%rbp), %rsi
	cmpl	$29, 8(%rsi)
	jne	LBB6_2
## %bb.1:
	movq	-16(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -24(%rbp)
	movq	-8(%rbp), %rdi
	movq	-24(%rbp), %rsi
	callq	_add_name
LBB6_2:
	movq	-16(%rbp), %rax
	cmpl	$19, 8(%rax)
	jne	LBB6_6
## %bb.3:
	movq	-16(%rbp), %rax
	movq	32(%rax), %rdi
	leaq	L_.str.4(%rip), %rsi
	callq	_strcmp
	cmpl	$0, %eax
	je	LBB6_5
## %bb.4:
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rax
	movq	32(%rax), %rsi
	callq	_add_name
LBB6_5:
	jmp	LBB6_23
LBB6_6:
	movq	-16(%rbp), %rax
	cmpl	$31, 8(%rax)
	jne	LBB6_11
## %bb.7:
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rax
	cmpl	$29, 8(%rax)
	jne	LBB6_9
## %bb.8:
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rax
	movq	32(%rax), %rdi
	callq	_strlen
	addq	$7, %rax
	movq	%rax, %rdi
	callq	_malloc
	movq	$-1, %rdx
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rdi
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rax
	movq	32(%rax), %rsi
	callq	___strcpy_chk
	movq	$-1, %rdx
	movq	-32(%rbp), %rdi
	leaq	L_.str.5(%rip), %rsi
	movq	%rax, -56(%rbp)         ## 8-byte Spill
	callq	___strcat_chk
	movq	%rax, -64(%rbp)         ## 8-byte Spill
	jmp	LBB6_10
LBB6_9:
	leaq	L_.str.5(%rip), %rdi
	callq	_strdup
	movq	%rax, -32(%rbp)
LBB6_10:
	movq	-8(%rbp), %rdi
	movq	-32(%rbp), %rsi
	callq	_add_name
LBB6_11:
	movl	$0, -36(%rbp)
LBB6_12:                                ## =>This Inner Loop Header: Depth=1
	movl	-36(%rbp), %eax
	movq	-16(%rbp), %rcx
	cmpl	(%rcx), %eax
	jge	LBB6_22
## %bb.13:                              ##   in Loop: Header=BB6_12 Depth=1
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movslq	-36(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	movq	%rax, -48(%rbp)
	cmpq	$0, -48(%rbp)
	jne	LBB6_15
## %bb.14:                              ##   in Loop: Header=BB6_12 Depth=1
	jmp	LBB6_21
LBB6_15:                                ##   in Loop: Header=BB6_12 Depth=1
	movq	-48(%rbp), %rax
	cmpl	$19, 8(%rax)
	je	LBB6_17
## %bb.16:                              ##   in Loop: Header=BB6_12 Depth=1
	movq	-8(%rbp), %rdi
	movq	-48(%rbp), %rsi
	callq	_extract_names
	jmp	LBB6_20
LBB6_17:                                ##   in Loop: Header=BB6_12 Depth=1
	movq	-48(%rbp), %rax
	movq	32(%rax), %rdi
	leaq	L_.str.4(%rip), %rsi
	callq	_strcmp
	cmpl	$0, %eax
	je	LBB6_19
## %bb.18:                              ##   in Loop: Header=BB6_12 Depth=1
	movq	-8(%rbp), %rdi
	movq	-48(%rbp), %rax
	movq	32(%rax), %rsi
	callq	_add_name
LBB6_19:                                ##   in Loop: Header=BB6_12 Depth=1
	jmp	LBB6_20
LBB6_20:                                ##   in Loop: Header=BB6_12 Depth=1
	jmp	LBB6_21
LBB6_21:                                ##   in Loop: Header=BB6_12 Depth=1
	movl	-36(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -36(%rbp)
	jmp	LBB6_12
LBB6_22:
	jmp	LBB6_23
LBB6_23:
	addq	$64, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_write_node             ## -- Begin function write_node
	.p2align	4, 0x90
_write_node:                            ## @write_node
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$176, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rsi
	movl	8(%rsi), %eax
	movl	%eax, %esi
	movq	%rsi, %rdi
	subq	$41, %rdi
	movq	%rsi, -136(%rbp)        ## 8-byte Spill
	movq	%rdi, -144(%rbp)        ## 8-byte Spill
	ja	LBB7_90
## %bb.92:
	leaq	LJTI7_0(%rip), %rax
	movq	-136(%rbp), %rcx        ## 8-byte Reload
	movslq	(%rax,%rcx,4), %rdx
	addq	%rax, %rdx
	jmpq	*%rdx
LBB7_1:
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rsi
	callq	_write_if
	jmp	LBB7_91
LBB7_2:
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rsi
	callq	_write_for
	jmp	LBB7_91
LBB7_3:
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rsi
	callq	_write_node
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rsi
	callq	_write_assign
	jmp	LBB7_91
LBB7_4:
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rsi
	callq	_load_func
	jmp	LBB7_91
LBB7_5:
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rax
	movq	32(%rax), %rsi
	callq	_nametable_lookup
	movl	%eax, -20(%rbp)
	movq	-8(%rbp), %rdi
	movl	-20(%rbp), %edx
	movl	$2, %esi
	callq	_write_op
	jmp	LBB7_91
LBB7_6:
	jmp	LBB7_7
LBB7_7:
	movl	$0, -24(%rbp)
LBB7_8:                                 ## =>This Inner Loop Header: Depth=1
	movl	-24(%rbp), %eax
	movq	-16(%rbp), %rcx
	cmpl	(%rcx), %eax
	jge	LBB7_11
## %bb.9:                               ##   in Loop: Header=BB7_8 Depth=1
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movslq	-24(%rbp), %rcx
	movq	(%rax,%rcx,8), %rsi
	callq	_write_node
## %bb.10:                              ##   in Loop: Header=BB7_8 Depth=1
	movl	-24(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -24(%rbp)
	jmp	LBB7_8
LBB7_11:
	jmp	LBB7_12
LBB7_12:
	jmp	LBB7_91
LBB7_13:
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	cmpl	$7, 8(%rax)
	jne	LBB7_19
## %bb.14:
	movl	$0, -28(%rbp)
LBB7_15:                                ## =>This Inner Loop Header: Depth=1
	movl	-28(%rbp), %eax
	movq	-16(%rbp), %rcx
	movq	16(%rcx), %rcx
	movq	8(%rcx), %rcx
	cmpl	(%rcx), %eax
	jge	LBB7_18
## %bb.16:                              ##   in Loop: Header=BB7_15 Depth=1
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	16(%rax), %rax
	movslq	-28(%rbp), %rcx
	movq	(%rax,%rcx,8), %rsi
	callq	_write_node
## %bb.17:                              ##   in Loop: Header=BB7_15 Depth=1
	movl	-28(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -28(%rbp)
	jmp	LBB7_15
LBB7_18:
	jmp	LBB7_20
LBB7_19:
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rsi
	callq	_write_node
LBB7_20:
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rax
	cmpl	$0, 8(%rax)
	jne	LBB7_26
## %bb.21:
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rsi
	callq	_write_node
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rsi
	callq	_write_node
	movl	$1, -32(%rbp)
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	cmpl	$33, 8(%rax)
	jne	LBB7_23
## %bb.22:
	movl	$0, -32(%rbp)
LBB7_23:
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	cmpl	$7, 8(%rax)
	jne	LBB7_25
## %bb.24:
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movl	(%rax), %ecx
	movl	%ecx, -32(%rbp)
LBB7_25:
	movq	-8(%rbp), %rdi
	movl	-32(%rbp), %edx
	movl	$17, %esi
	callq	_write_op
	jmp	LBB7_31
LBB7_26:
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rsi
	callq	_write_node
	movl	$1, -36(%rbp)
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	cmpl	$7, 8(%rax)
	jne	LBB7_28
## %bb.27:
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movl	(%rax), %ecx
	movl	%ecx, -36(%rbp)
LBB7_28:
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	cmpl	$33, 8(%rax)
	jne	LBB7_30
## %bb.29:
	movl	$0, -36(%rbp)
LBB7_30:
	movq	-8(%rbp), %rdi
	movl	-36(%rbp), %edx
	movl	$13, %esi
	callq	_write_op
LBB7_31:
	jmp	LBB7_91
LBB7_32:
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rsi
	callq	_write_node
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rsi
	callq	_write_node
	xorl	%edx, %edx
	movq	-8(%rbp), %rdi
	movl	$4, %esi
	callq	_write_op
	jmp	LBB7_91
LBB7_33:
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rsi
	callq	_write_node
	xorl	%edx, %edx
	movq	-8(%rbp), %rdi
	movl	$11, %esi
	callq	_write_op
	jmp	LBB7_91
LBB7_34:
	jmp	LBB7_35
LBB7_35:
	movq	-16(%rbp), %rax
	movq	32(%rax), %rax
	movsd	(%rax), %xmm0           ## xmm0 = mem[0],zero
	callq	_numfromdouble
	movq	%rax, -48(%rbp)
	movq	-8(%rbp), %rdi
	movq	-48(%rbp), %rsi
	callq	_add_literal
	movq	-8(%rbp), %rdi
	movq	-8(%rbp), %rax
	movl	40(%rax), %ecx
	subl	$1, %ecx
	movl	$1, %esi
	movl	%ecx, %edx
	callq	_write_op
## %bb.36:
	jmp	LBB7_91
LBB7_37:
	jmp	LBB7_38
LBB7_38:
	movq	-16(%rbp), %rax
	movq	32(%rax), %rax
	movq	(%rax), %rdi
	callq	_boolfromlexem
	movq	%rax, -56(%rbp)
	movq	-8(%rbp), %rdi
	movq	-56(%rbp), %rsi
	callq	_add_literal
	movq	-8(%rbp), %rdi
	movq	-8(%rbp), %rax
	movl	40(%rax), %ecx
	subl	$1, %ecx
	movl	$1, %esi
	movl	%ecx, %edx
	callq	_write_op
## %bb.39:
	jmp	LBB7_91
LBB7_40:
	jmp	LBB7_41
LBB7_41:
	movq	-16(%rbp), %rax
	movq	32(%rax), %rdi
	callq	_strfromchar
	movq	%rax, -64(%rbp)
	movq	-8(%rbp), %rdi
	movq	-64(%rbp), %rsi
	callq	_add_literal
	movq	-8(%rbp), %rdi
	movq	-8(%rbp), %rax
	movl	40(%rax), %ecx
	subl	$1, %ecx
	movl	$1, %esi
	movl	%ecx, %edx
	callq	_write_op
## %bb.42:
	jmp	LBB7_91
LBB7_43:
	jmp	LBB7_44
LBB7_44:
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rax
	movq	32(%rax), %rax
	movl	(%rax), %edx
	movl	$14, %esi
	callq	_write_op
## %bb.45:
	jmp	LBB7_91
LBB7_46:
	jmp	LBB7_47
LBB7_47:
	xorl	%edx, %edx
	movq	-8(%rbp), %rdi
	movl	$15, %esi
	callq	_write_op
	movq	-8(%rbp), %rdi
	movl	52(%rdi), %edx
	subl	$1, %edx
	movl	%edx, -68(%rbp)
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rsi
	callq	_write_node
	movq	-8(%rbp), %rax
	movl	52(%rax), %edx
	subl	-68(%rbp), %edx
	subl	$1, %edx
	movq	-8(%rbp), %rax
	movq	80(%rax), %rax
	movslq	-68(%rbp), %rsi
	imulq	$24, %rsi, %rsi
	addq	%rsi, %rax
	movl	%edx, 4(%rax)
## %bb.48:
	jmp	LBB7_91
LBB7_49:
	movl	$0, -72(%rbp)
LBB7_50:                                ## =>This Inner Loop Header: Depth=1
	movl	-72(%rbp), %eax
	movq	-16(%rbp), %rcx
	cmpl	(%rcx), %eax
	jge	LBB7_53
## %bb.51:                              ##   in Loop: Header=BB7_50 Depth=1
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movslq	-72(%rbp), %rcx
	movq	(%rax,%rcx,8), %rsi
	callq	_write_node
## %bb.52:                              ##   in Loop: Header=BB7_50 Depth=1
	movl	-72(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -72(%rbp)
	jmp	LBB7_50
LBB7_53:
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rax
	movl	(%rax), %edx
	movl	$10, %esi
	callq	_write_op
	jmp	LBB7_91
LBB7_54:
	movl	$1, -76(%rbp)
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rax
	cmpl	$7, 8(%rax)
	jne	LBB7_60
## %bb.55:
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rax
	movl	(%rax), %ecx
	movl	%ecx, -76(%rbp)
	movl	$0, -80(%rbp)
LBB7_56:                                ## =>This Inner Loop Header: Depth=1
	movl	-80(%rbp), %eax
	cmpl	-76(%rbp), %eax
	jge	LBB7_59
## %bb.57:                              ##   in Loop: Header=BB7_56 Depth=1
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rax
	movq	16(%rax), %rax
	movslq	-80(%rbp), %rcx
	movq	(%rax,%rcx,8), %rsi
	callq	_write_node
## %bb.58:                              ##   in Loop: Header=BB7_56 Depth=1
	movl	-80(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -80(%rbp)
	jmp	LBB7_56
LBB7_59:
	jmp	LBB7_61
LBB7_60:
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rsi
	callq	_write_node
LBB7_61:
	movq	-8(%rbp), %rdi
	movl	-76(%rbp), %edx
	movl	$16, %esi
	callq	_write_op
	jmp	LBB7_91
LBB7_62:
	movq	-8(%rbp), %rdi
	movl	$18, %esi
	movl	$1, %edx
	callq	_write_op
	jmp	LBB7_91
LBB7_63:
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rsi
	callq	_write_node
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rsi
	callq	_write_node
	xorl	%edx, %edx
	movq	-8(%rbp), %rdi
	movl	$20, %esi
	callq	_write_op
	jmp	LBB7_91
LBB7_64:
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rsi
	callq	_write_node
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rsi
	callq	_write_node
	xorl	%edx, %edx
	movq	-8(%rbp), %rdi
	movl	$21, %esi
	callq	_write_op
	jmp	LBB7_91
LBB7_65:
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rsi
	callq	_write_node
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rsi
	callq	_write_node
	xorl	%edx, %edx
	movq	-8(%rbp), %rdi
	movl	$22, %esi
	callq	_write_op
	jmp	LBB7_91
LBB7_66:
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rsi
	callq	_write_node
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rsi
	callq	_write_node
	xorl	%edx, %edx
	movq	-8(%rbp), %rdi
	movl	$23, %esi
	callq	_write_op
	jmp	LBB7_91
LBB7_67:
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rax
	cmpl	$27, 8(%rax)
	jne	LBB7_69
## %bb.68:
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rsi
	callq	_write_node
	jmp	LBB7_70
LBB7_69:
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rax
	movq	32(%rax), %rdi
	callq	_strfromchar
	movq	%rax, -88(%rbp)
	movq	-8(%rbp), %rdi
	movq	-88(%rbp), %rsi
	callq	_add_literal
	movq	-8(%rbp), %rdi
	movq	-8(%rbp), %rax
	movl	40(%rax), %ecx
	subl	$1, %ecx
	movl	$1, %esi
	movl	%ecx, %edx
	callq	_write_op
LBB7_70:
	xorl	%edx, %edx
	movq	-8(%rbp), %rdi
	movl	$35, %esi
	callq	_write_op
	movq	-16(%rbp), %rdi
	movq	16(%rdi), %rdi
	movq	(%rdi), %rdi
	movq	32(%rdi), %rdi
	callq	_strdup
	movq	%rax, -96(%rbp)
	movq	-96(%rbp), %rdi
	callq	_basename
	movq	%rax, -96(%rbp)
	movq	-96(%rbp), %rdi
	leaq	L_.str.8(%rip), %rsi
	callq	_strtok
	movq	%rax, -96(%rbp)
	movq	-8(%rbp), %rdi
	movq	-96(%rbp), %rsi
	callq	_add_name
	movq	-8(%rbp), %rdi
	movq	-8(%rbp), %rax
	movq	-96(%rbp), %rsi
	movq	%rdi, -152(%rbp)        ## 8-byte Spill
	movq	%rax, %rdi
	callq	_nametable_lookup
	movq	-152(%rbp), %rdi        ## 8-byte Reload
	movl	$3, %esi
	movl	%eax, %edx
	callq	_write_op
	jmp	LBB7_91
LBB7_71:
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rsi
	callq	_write_node
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rsi
	callq	_write_node
	xorl	%edx, %edx
	movq	-8(%rbp), %rdi
	movl	$28, %esi
	callq	_write_op
	jmp	LBB7_91
LBB7_72:
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rsi
	callq	_write_node
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rsi
	callq	_write_node
	xorl	%edx, %edx
	movq	-8(%rbp), %rdi
	movl	$29, %esi
	callq	_write_op
	jmp	LBB7_91
LBB7_73:
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rsi
	callq	_write_node
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rsi
	callq	_write_node
	xorl	%edx, %edx
	movq	-8(%rbp), %rdi
	movl	$31, %esi
	callq	_write_op
	jmp	LBB7_91
LBB7_74:
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rsi
	callq	_write_node
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rsi
	callq	_write_node
	xorl	%edx, %edx
	movq	-8(%rbp), %rdi
	movl	$32, %esi
	callq	_write_op
	jmp	LBB7_91
LBB7_75:
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rsi
	callq	_write_node
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rsi
	callq	_write_node
	xorl	%edx, %edx
	movq	-8(%rbp), %rdi
	movl	$30, %esi
	callq	_write_op
	jmp	LBB7_91
LBB7_76:
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rsi
	callq	_write_node
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rsi
	callq	_write_node
	xorl	%edx, %edx
	movq	-8(%rbp), %rdi
	movl	$36, %esi
	callq	_write_op
	jmp	LBB7_91
LBB7_77:
	callq	_new_exprobject
	movq	%rax, -104(%rbp)
	movq	-104(%rbp), %rdi
	movq	-8(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rdx
	callq	_write_expression
	movq	-8(%rbp), %rdi
	movq	-104(%rbp), %rax
	movq	%rax, %rsi
	callq	_add_literal
	movq	-8(%rbp), %rdi
	movq	-8(%rbp), %rax
	movl	40(%rax), %ecx
	subl	$1, %ecx
	movl	$1, %esi
	movl	%ecx, %edx
	callq	_write_op
	movq	-8(%rbp), %rax
	movq	-104(%rbp), %rdi
	movq	%rax, 40(%rdi)
	jmp	LBB7_91
LBB7_78:
	movq	-8(%rbp), %rax
	movl	52(%rax), %ecx
	subl	$1, %ecx
	movl	%ecx, -108(%rbp)
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rsi
	callq	_write_node
	xorl	%edx, %edx
	movq	-8(%rbp), %rdi
	movl	$7, %esi
	callq	_write_op
	movq	-8(%rbp), %rax
	movl	52(%rax), %ecx
	subl	$1, %ecx
	movl	%ecx, -112(%rbp)
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rsi
	callq	_write_node
	movq	-8(%rbp), %rdi
	movl	-108(%rbp), %ecx
	movq	-8(%rbp), %rax
	subl	52(%rax), %ecx
	movl	$6, %esi
	movl	%ecx, %edx
	callq	_write_op
	movq	-8(%rbp), %rax
	movl	52(%rax), %ecx
	subl	-112(%rbp), %ecx
	movq	-8(%rbp), %rax
	movq	80(%rax), %rax
	movslq	-112(%rbp), %rdi
	imulq	$24, %rdi, %rdi
	addq	%rdi, %rax
	movl	%ecx, 4(%rax)
	jmp	LBB7_91
LBB7_79:
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rsi
	callq	_write_node
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rsi
	callq	_write_node
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rax
	movq	32(%rax), %rsi
	callq	_nametable_lookup
	movl	%eax, -116(%rbp)
	movq	-8(%rbp), %rdi
	movl	-116(%rbp), %edx
	movl	$24, %esi
	callq	_write_op
	jmp	LBB7_91
LBB7_80:
	xorl	%edx, %edx
	movq	-8(%rbp), %rdi
	movl	$40, %esi
	callq	_write_op
	movq	-16(%rbp), %rdi
	movq	16(%rdi), %rdi
	movq	8(%rdi), %rdi
	movq	16(%rdi), %rdi
	movq	%rdi, -128(%rbp)
LBB7_81:                                ## =>This Inner Loop Header: Depth=1
	movq	-128(%rbp), %rax
	movq	-16(%rbp), %rcx
	movq	16(%rcx), %rcx
	movq	8(%rcx), %rcx
	movq	16(%rcx), %rcx
	movq	-16(%rbp), %rdx
	movq	16(%rdx), %rdx
	movq	8(%rdx), %rdx
	movslq	(%rdx), %rdx
	shlq	$3, %rdx
	addq	%rdx, %rcx
	cmpq	%rcx, %rax
	je	LBB7_87
## %bb.82:                              ##   in Loop: Header=BB7_81 Depth=1
	movq	-128(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$2, 8(%rax)
	jne	LBB7_84
## %bb.83:                              ##   in Loop: Header=BB7_81 Depth=1
	movq	-128(%rbp), %rax
	movq	(%rax), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rax
	cmpl	$29, 8(%rax)
	je	LBB7_85
LBB7_84:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	leaq	L_.str.9(%rip), %rsi
	xorl	%ecx, %ecx
	movb	%cl, %dl
	movb	%dl, %al
	movl	%ecx, -156(%rbp)        ## 4-byte Spill
	callq	_fprintf
	movl	-156(%rbp), %edi        ## 4-byte Reload
	movl	%eax, -160(%rbp)        ## 4-byte Spill
	callq	_exit
LBB7_85:                                ##   in Loop: Header=BB7_81 Depth=1
	movq	-8(%rbp), %rdi
	movq	-128(%rbp), %rax
	movq	(%rax), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rsi
	callq	_write_node
	movq	-8(%rbp), %rdi
	movq	-128(%rbp), %rax
	movq	(%rax), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rsi
	callq	_write_node
	movq	-8(%rbp), %rdi
	movl	$5, %esi
	movl	$4294967295, %edx       ## imm = 0xFFFFFFFF
	callq	_write_op
## %bb.86:                              ##   in Loop: Header=BB7_81 Depth=1
	movq	-128(%rbp), %rax
	addq	$8, %rax
	movq	%rax, -128(%rbp)
	jmp	LBB7_81
LBB7_87:
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rax
	cmpq	$0, 32(%rax)
	je	LBB7_89
## %bb.88:
	movq	-8(%rbp), %rdi
	movq	-8(%rbp), %rax
	movq	-16(%rbp), %rcx
	movq	16(%rcx), %rcx
	movq	(%rcx), %rcx
	movq	32(%rcx), %rsi
	movq	%rdi, -168(%rbp)        ## 8-byte Spill
	movq	%rax, %rdi
	callq	_nametable_lookup
	movq	-168(%rbp), %rdi        ## 8-byte Reload
	movl	$3, %esi
	movl	%eax, %edx
	callq	_write_op
LBB7_89:
	jmp	LBB7_91
LBB7_90:
	jmp	LBB7_91
LBB7_91:
	addq	$176, %rsp
	popq	%rbp
	retq
	.cfi_endproc
	.p2align	2, 0x90
	.data_region jt32
.set L7_0_set_32, LBB7_32-LJTI7_0
.set L7_0_set_6, LBB7_6-LJTI7_0
.set L7_0_set_3, LBB7_3-LJTI7_0
.set L7_0_set_79, LBB7_79-LJTI7_0
.set L7_0_set_90, LBB7_90-LJTI7_0
.set L7_0_set_49, LBB7_49-LJTI7_0
.set L7_0_set_71, LBB7_71-LJTI7_0
.set L7_0_set_73, LBB7_73-LJTI7_0
.set L7_0_set_72, LBB7_72-LJTI7_0
.set L7_0_set_74, LBB7_74-LJTI7_0
.set L7_0_set_75, LBB7_75-LJTI7_0
.set L7_0_set_13, LBB7_13-LJTI7_0
.set L7_0_set_4, LBB7_4-LJTI7_0
.set L7_0_set_54, LBB7_54-LJTI7_0
.set L7_0_set_1, LBB7_1-LJTI7_0
.set L7_0_set_63, LBB7_63-LJTI7_0
.set L7_0_set_64, LBB7_64-LJTI7_0
.set L7_0_set_65, LBB7_65-LJTI7_0
.set L7_0_set_66, LBB7_66-LJTI7_0
.set L7_0_set_34, LBB7_34-LJTI7_0
.set L7_0_set_40, LBB7_40-LJTI7_0
.set L7_0_set_37, LBB7_37-LJTI7_0
.set L7_0_set_5, LBB7_5-LJTI7_0
.set L7_0_set_76, LBB7_76-LJTI7_0
.set L7_0_set_2, LBB7_2-LJTI7_0
.set L7_0_set_46, LBB7_46-LJTI7_0
.set L7_0_set_62, LBB7_62-LJTI7_0
.set L7_0_set_33, LBB7_33-LJTI7_0
.set L7_0_set_43, LBB7_43-LJTI7_0
.set L7_0_set_67, LBB7_67-LJTI7_0
.set L7_0_set_77, LBB7_77-LJTI7_0
.set L7_0_set_78, LBB7_78-LJTI7_0
.set L7_0_set_80, LBB7_80-LJTI7_0
LJTI7_0:
	.long	L7_0_set_32
	.long	L7_0_set_6
	.long	L7_0_set_3
	.long	L7_0_set_79
	.long	L7_0_set_90
	.long	L7_0_set_90
	.long	L7_0_set_90
	.long	L7_0_set_49
	.long	L7_0_set_71
	.long	L7_0_set_73
	.long	L7_0_set_72
	.long	L7_0_set_74
	.long	L7_0_set_75
	.long	L7_0_set_90
	.long	L7_0_set_90
	.long	L7_0_set_90
	.long	L7_0_set_90
	.long	L7_0_set_13
	.long	L7_0_set_90
	.long	L7_0_set_4
	.long	L7_0_set_54
	.long	L7_0_set_1
	.long	L7_0_set_63
	.long	L7_0_set_64
	.long	L7_0_set_65
	.long	L7_0_set_66
	.long	L7_0_set_34
	.long	L7_0_set_40
	.long	L7_0_set_37
	.long	L7_0_set_5
	.long	L7_0_set_76
	.long	L7_0_set_2
	.long	L7_0_set_46
	.long	L7_0_set_62
	.long	L7_0_set_33
	.long	L7_0_set_90
	.long	L7_0_set_43
	.long	L7_0_set_67
	.long	L7_0_set_77
	.long	L7_0_set_78
	.long	L7_0_set_90
	.long	L7_0_set_80
	.end_data_region
                                        ## -- End function
	.globl	_load_func_process_storenames ## -- Begin function load_func_process_storenames
	.p2align	4, 0x90
_load_func_process_storenames:          ## @load_func_process_storenames
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$80, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-8(%rbp), %rdx
	cmpl	$29, 8(%rdx)
	jne	LBB8_15
## %bb.1:
	movq	-8(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -32(%rbp)
	movq	-24(%rbp), %rdi
	movq	-32(%rbp), %rsi
	callq	_find_name_recursively
	movl	%eax, -36(%rbp)
	movl	$0, -40(%rbp)
	movl	$0, -44(%rbp)
LBB8_2:                                 ## =>This Inner Loop Header: Depth=1
	movq	_bin_count@GOTPCREL(%rip), %rax
	movl	-44(%rbp), %ecx
	cmpl	(%rax), %ecx
	jge	LBB8_7
## %bb.3:                               ##   in Loop: Header=BB8_2 Depth=1
	movq	_bins@GOTPCREL(%rip), %rax
	movslq	-44(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	movq	16(%rax), %rdi
	movq	-32(%rbp), %rsi
	callq	_strcmp
	cmpl	$0, %eax
	jne	LBB8_5
## %bb.4:
	movl	$1, -40(%rbp)
	jmp	LBB8_7
LBB8_5:                                 ##   in Loop: Header=BB8_2 Depth=1
	jmp	LBB8_6
LBB8_6:                                 ##   in Loop: Header=BB8_2 Depth=1
	movl	-44(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -44(%rbp)
	jmp	LBB8_2
LBB8_7:
	movq	-32(%rbp), %rdi
	leaq	L_.str.1(%rip), %rsi
	callq	_strcmp
	cmpl	$0, %eax
	sete	%cl
	andb	$1, %cl
	movzbl	%cl, %eax
	movl	%eax, -48(%rbp)
	cmpl	$0, -36(%rbp)
	je	LBB8_14
## %bb.8:
	cmpl	$0, -40(%rbp)
	jne	LBB8_14
## %bb.9:
	cmpl	$0, -48(%rbp)
	jne	LBB8_14
## %bb.10:
	movq	-16(%rbp), %rdi
	movq	-32(%rbp), %rsi
	callq	_nametable_lookup
	movl	%eax, -52(%rbp)
	cmpl	$0, -52(%rbp)
	jge	LBB8_12
## %bb.11:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	movq	-32(%rbp), %rdx
	leaq	L_.str.2(%rip), %rsi
	movb	$0, %al
	callq	_fprintf
	leaq	L_.str.3(%rip), %rdi
	movl	%eax, -68(%rbp)         ## 4-byte Spill
	movb	$0, %al
	callq	_printf
	movl	%eax, -72(%rbp)         ## 4-byte Spill
	jmp	LBB8_13
LBB8_12:
	xorl	%esi, %esi
	movq	-16(%rbp), %rdi
	movl	-36(%rbp), %edx
	callq	_write_op
	movq	-16(%rbp), %rdi
	movl	-52(%rbp), %edx
	movl	$3, %esi
	callq	_write_op
LBB8_13:
	jmp	LBB8_14
LBB8_14:
	jmp	LBB8_15
LBB8_15:
	movl	$0, -56(%rbp)
LBB8_16:                                ## =>This Inner Loop Header: Depth=1
	movl	-56(%rbp), %eax
	movq	-8(%rbp), %rcx
	cmpl	(%rcx), %eax
	jge	LBB8_22
## %bb.17:                              ##   in Loop: Header=BB8_16 Depth=1
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movslq	-56(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	movq	%rax, -64(%rbp)
	cmpq	$0, -64(%rbp)
	je	LBB8_20
## %bb.18:                              ##   in Loop: Header=BB8_16 Depth=1
	movq	-64(%rbp), %rax
	cmpl	$19, 8(%rax)
	je	LBB8_20
## %bb.19:                              ##   in Loop: Header=BB8_16 Depth=1
	movq	-64(%rbp), %rdi
	movq	-16(%rbp), %rsi
	movq	-24(%rbp), %rdx
	callq	_load_func_process_storenames
LBB8_20:                                ##   in Loop: Header=BB8_16 Depth=1
	jmp	LBB8_21
LBB8_21:                                ##   in Loop: Header=BB8_16 Depth=1
	movl	-56(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -56(%rbp)
	jmp	LBB8_16
LBB8_22:
	addq	$80, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_find_name_recursively  ## -- Begin function find_name_recursively
	.p2align	4, 0x90
_find_name_recursively:                 ## @find_name_recursively
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
	cmpq	$0, -16(%rbp)
	jne	LBB9_2
## %bb.1:
	movl	$0, -4(%rbp)
	jmp	LBB9_11
LBB9_2:
	movl	$0, -28(%rbp)
LBB9_3:                                 ## =>This Inner Loop Header: Depth=1
	movl	-28(%rbp), %eax
	movq	-16(%rbp), %rcx
	cmpl	32(%rcx), %eax
	jge	LBB9_8
## %bb.4:                               ##   in Loop: Header=BB9_3 Depth=1
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movslq	-28(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdi
	movq	-24(%rbp), %rsi
	callq	_strcmp
	cmpl	$0, %eax
	jne	LBB9_6
## %bb.5:
	movl	-28(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4(%rbp)
	jmp	LBB9_11
LBB9_6:                                 ##   in Loop: Header=BB9_3 Depth=1
	jmp	LBB9_7
LBB9_7:                                 ##   in Loop: Header=BB9_3 Depth=1
	movl	-28(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -28(%rbp)
	jmp	LBB9_3
LBB9_8:
	movq	-16(%rbp), %rax
	movq	64(%rax), %rdi
	movq	-24(%rbp), %rsi
	callq	_find_name_recursively
	movl	%eax, -32(%rbp)
	cmpl	$0, -32(%rbp)
	jne	LBB9_10
## %bb.9:
	movl	$0, -4(%rbp)
	jmp	LBB9_11
LBB9_10:
	movl	-32(%rbp), %eax
	addl	$65536, %eax            ## imm = 0x10000
	movl	%eax, -4(%rbp)
LBB9_11:
	movl	-4(%rbp), %eax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_load_func              ## -- Begin function load_func
	.p2align	4, 0x90
_load_func:                             ## @load_func
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rdi
	callq	_init_func
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rdi
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rsi
	callq	_extract_names
	movq	-24(%rbp), %rax
	movl	32(%rax), %ecx
	movq	-24(%rbp), %rax
	movl	%ecx, 36(%rax)
	movq	-16(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -32(%rbp)
	movq	-24(%rbp), %rdi
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rsi
	callq	_extract_names
	movq	-16(%rbp), %rax
	cmpl	$1, (%rax)
	jle	LBB10_5
## %bb.1:
	movq	-16(%rbp), %rax
	cmpl	$19, 8(%rax)
	jne	LBB10_3
## %bb.2:
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	movq	%rax, -40(%rbp)
	jmp	LBB10_4
LBB10_3:
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rax
	movq	%rax, -40(%rbp)
LBB10_4:
	movq	-40(%rbp), %rdi
	movq	-24(%rbp), %rsi
	movq	-8(%rbp), %rdx
	callq	_load_func_process_storenames
LBB10_5:
	movq	-8(%rbp), %rdi
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	callq	_add_literal
	movq	-8(%rbp), %rdi
	movq	-8(%rbp), %rax
	movl	40(%rax), %ecx
	subl	$1, %ecx
	movl	$19, %esi
	movl	%ecx, %edx
	callq	_write_op
	movq	-24(%rbp), %rdi
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rsi
	callq	_write_node
	xorl	%edx, %edx
	movq	-24(%rbp), %rdi
	movl	$18, %esi
	callq	_write_op
	movq	-16(%rbp), %rax
	cmpq	$0, 32(%rax)
	je	LBB10_8
## %bb.6:
	movq	-16(%rbp), %rax
	movq	32(%rax), %rdi
	leaq	L_.str.4(%rip), %rsi
	callq	_strcmp
	cmpl	$0, %eax
	je	LBB10_8
## %bb.7:
	movq	-8(%rbp), %rdi
	movq	-8(%rbp), %rax
	movq	-16(%rbp), %rcx
	movq	32(%rcx), %rsi
	movq	%rdi, -48(%rbp)         ## 8-byte Spill
	movq	%rax, %rdi
	callq	_nametable_lookup
	movq	-48(%rbp), %rdi         ## 8-byte Reload
	movl	$3, %esi
	movl	%eax, %edx
	callq	_write_op
LBB10_8:
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_write_if               ## -- Begin function write_if
	.p2align	4, 0x90
_write_if:                              ## @write_if
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rsi
	movq	16(%rsi), %rsi
	movq	(%rsi), %rsi
	callq	_write_node
	xorl	%edx, %edx
	movq	-8(%rbp), %rdi
	movl	$7, %esi
	callq	_write_op
	movq	-8(%rbp), %rdi
	movl	52(%rdi), %edx
	subl	$1, %edx
	movl	%edx, -20(%rbp)
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rsi
	callq	_write_node
	movq	-8(%rbp), %rax
	movl	52(%rax), %edx
	subl	-20(%rbp), %edx
	subl	$1, %edx
	movq	-8(%rbp), %rax
	movq	80(%rax), %rax
	movslq	-20(%rbp), %rsi
	imulq	$24, %rsi, %rsi
	addq	%rsi, %rax
	movl	%edx, 4(%rax)
	movq	-16(%rbp), %rax
	cmpl	$3, (%rax)
	jne	LBB11_2
## %bb.1:
	xorl	%edx, %edx
	movq	-8(%rbp), %rdi
	movl	$6, %esi
	callq	_write_op
	movq	-8(%rbp), %rdi
	movq	80(%rdi), %rdi
	movslq	-20(%rbp), %rax
	imulq	$24, %rax, %rax
	addq	%rax, %rdi
	movl	4(%rdi), %edx
	addl	$1, %edx
	movl	%edx, 4(%rdi)
	movq	-8(%rbp), %rax
	movl	52(%rax), %edx
	subl	$1, %edx
	movl	%edx, -24(%rbp)
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	16(%rax), %rsi
	callq	_write_node
	movq	-8(%rbp), %rax
	movl	52(%rax), %edx
	subl	-24(%rbp), %edx
	subl	$1, %edx
	movl	%edx, -28(%rbp)
	movl	-28(%rbp), %edx
	movq	-8(%rbp), %rax
	movq	80(%rax), %rax
	movslq	-24(%rbp), %rsi
	imulq	$24, %rsi, %rsi
	addq	%rsi, %rax
	movl	%edx, 4(%rax)
LBB11_2:
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_write_for              ## -- Begin function write_for
	.p2align	4, 0x90
_write_for:                             ## @write_for
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
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rsi
	movq	16(%rsi), %rsi
	movq	(%rsi), %rsi
	movq	16(%rsi), %rsi
	movq	8(%rsi), %rsi
	callq	_write_node
	movq	-16(%rbp), %rsi
	movq	16(%rsi), %rsi
	movq	(%rsi), %rsi
	movq	16(%rsi), %rsi
	movq	(%rsi), %rsi
	cmpl	$29, 8(%rsi)
	jne	LBB12_2
## %bb.1:
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rax
	movq	32(%rax), %rax
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rdi
	callq	_strlen
	addq	$7, %rax
	movq	%rax, %rdi
	callq	_malloc
	movq	$-1, %rdx
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rdi
	movq	-32(%rbp), %rsi
	callq	___strcpy_chk
	movq	$-1, %rdx
	movq	-24(%rbp), %rdi
	leaq	L_.str.5(%rip), %rsi
	movq	%rax, -56(%rbp)         ## 8-byte Spill
	callq	___strcat_chk
	movq	%rax, -64(%rbp)         ## 8-byte Spill
	jmp	LBB12_3
LBB12_2:
	leaq	L_.str.5(%rip), %rdi
	callq	_strdup
	movq	%rax, -24(%rbp)
LBB12_3:
	movq	-8(%rbp), %rdi
	movq	-24(%rbp), %rsi
	callq	_nametable_lookup
	movl	%eax, -36(%rbp)
	movq	-8(%rbp), %rdi
	movl	-36(%rbp), %edx
	movl	$8, %esi
	callq	_write_op
	xorl	%edx, %edx
	movq	-8(%rbp), %rdi
	movl	52(%rdi), %eax
	movl	%eax, -40(%rbp)
	movq	-8(%rbp), %rdi
	movl	$12, %esi
	callq	_write_op
	xorl	%eax, %eax
	movl	$36, %edi
	movl	%eax, %esi
	movl	%eax, %edx
	movb	$0, %al
	callq	_astnode_new
	movl	$4, %edx
	movl	%edx, %edi
	movq	%rax, -48(%rbp)
	callq	_malloc
	movq	-48(%rbp), %rdi
	movq	%rax, 32(%rdi)
	movl	-36(%rbp), %edx
	movq	-48(%rbp), %rax
	movq	32(%rax), %rax
	movl	%edx, (%rax)
	movq	-8(%rbp), %rdi
	movl	-36(%rbp), %edx
	movl	$14, %esi
	callq	_write_op
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rsi
	callq	_write_assign
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rsi
	callq	_write_node
	movq	-8(%rbp), %rdi
	movl	-36(%rbp), %edx
	movl	$9, %esi
	callq	_write_op
	movq	-8(%rbp), %rdi
	movl	-40(%rbp), %edx
	movq	-8(%rbp), %rax
	subl	52(%rax), %edx
	subl	$1, %edx
	movl	$6, %esi
	callq	_write_op
	movq	-8(%rbp), %rax
	movl	52(%rax), %edx
	subl	-40(%rbp), %edx
	subl	$1, %edx
	movq	-8(%rbp), %rax
	movq	80(%rax), %rax
	movslq	-40(%rbp), %rdi
	imulq	$24, %rdi, %rdi
	addq	%rdi, %rax
	movl	%edx, 4(%rax)
	addq	$64, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_write_assign           ## -- Begin function write_assign
	.p2align	4, 0x90
_write_assign:                          ## @write_assign
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rsi
	movl	8(%rsi), %eax
	testl	%eax, %eax
	movl	%eax, -24(%rbp)         ## 4-byte Spill
	je	LBB13_2
	jmp	LBB13_12
LBB13_12:
	movl	-24(%rbp), %eax         ## 4-byte Reload
	subl	$7, %eax
	movl	%eax, -28(%rbp)         ## 4-byte Spill
	je	LBB13_3
	jmp	LBB13_13
LBB13_13:
	movl	-24(%rbp), %eax         ## 4-byte Reload
	subl	$29, %eax
	movl	%eax, -32(%rbp)         ## 4-byte Spill
	jne	LBB13_10
	jmp	LBB13_1
LBB13_1:
	movq	-8(%rbp), %rdi
	movq	-8(%rbp), %rax
	movq	-16(%rbp), %rcx
	movq	32(%rcx), %rsi
	movq	%rdi, -40(%rbp)         ## 8-byte Spill
	movq	%rax, %rdi
	callq	_nametable_lookup
	movq	-40(%rbp), %rdi         ## 8-byte Reload
	movl	$3, %esi
	movl	%eax, %edx
	callq	_write_op
	jmp	LBB13_11
LBB13_2:
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rsi
	callq	_write_node
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rsi
	callq	_write_node
	xorl	%edx, %edx
	movq	-8(%rbp), %rdi
	movl	$5, %esi
	callq	_write_op
	jmp	LBB13_11
LBB13_3:
	jmp	LBB13_4
LBB13_4:
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rax
	movl	(%rax), %edx
	movl	$37, %esi
	callq	_write_op
	movl	$0, -20(%rbp)
LBB13_5:                                ## =>This Inner Loop Header: Depth=1
	movl	-20(%rbp), %eax
	movq	-16(%rbp), %rcx
	cmpl	(%rcx), %eax
	jge	LBB13_8
## %bb.6:                               ##   in Loop: Header=BB13_5 Depth=1
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movslq	-20(%rbp), %rcx
	movq	(%rax,%rcx,8), %rsi
	callq	_write_assign
## %bb.7:                               ##   in Loop: Header=BB13_5 Depth=1
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -20(%rbp)
	jmp	LBB13_5
LBB13_8:
	jmp	LBB13_9
LBB13_9:
	jmp	LBB13_11
LBB13_10:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	leaq	L_.str.6(%rip), %rsi
	leaq	L_.str.7(%rip), %rdx
	movb	$0, %al
	callq	_fprintf
	movl	%eax, -44(%rbp)         ## 4-byte Spill
LBB13_11:
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_write_inplace          ## -- Begin function write_inplace
	.p2align	4, 0x90
_write_inplace:                         ## @write_inplace
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	%edx, -20(%rbp)
	movq	-16(%rbp), %rsi
	movq	16(%rsi), %rsi
	movq	(%rsi), %rsi
	movl	8(%rsi), %edx
	testl	%edx, %edx
	jne	LBB14_2
	jmp	LBB14_1
LBB14_1:
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rsi
	callq	_write_node
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rsi
	callq	_write_node
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rsi
	callq	_write_node
	movq	-8(%rbp), %rdi
	movl	-20(%rbp), %ecx
	subl	$24, %ecx
	movl	$34, %esi
	movl	%ecx, %edx
	callq	_write_op
	jmp	LBB14_3
LBB14_2:
	jmp	LBB14_3
LBB14_3:
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_new_exprobject         ## -- Begin function new_exprobject
	.p2align	4, 0x90
_new_exprobject:                        ## @new_exprobject
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	$48, %eax
	movl	%eax, %edi
	callq	_malloc
	movq	_EXPRTYPE@GOTPCREL(%rip), %rdi
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rdi, (%rax)
	movq	-8(%rbp), %rax
	movl	$1, 8(%rax)
	movq	-8(%rbp), %rax
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_write_expression       ## -- Begin function write_expression
	.p2align	4, 0x90
_write_expression:                      ## @write_expression
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-16(%rbp), %rdx
	movl	52(%rdx), %eax
	movl	%eax, -28(%rbp)
	movq	-16(%rbp), %rdi
	movq	-24(%rbp), %rsi
	callq	_write_node
	movq	-16(%rbp), %rdx
	movl	52(%rdx), %eax
	subl	-28(%rbp), %eax
	movslq	%eax, %rdx
	imulq	$24, %rdx, %rdi
	callq	_malloc
	movq	$-1, %rcx
	movq	-8(%rbp), %rdx
	movq	%rax, 32(%rdx)
	movq	-16(%rbp), %rax
	movl	52(%rax), %r8d
	subl	-28(%rbp), %r8d
	movq	-8(%rbp), %rax
	movl	%r8d, 12(%rax)
	movq	-8(%rbp), %rax
	movq	32(%rax), %rax
	movq	-16(%rbp), %rdx
	movq	80(%rdx), %rdx
	movslq	-28(%rbp), %rsi
	imulq	$24, %rsi, %rsi
	addq	%rsi, %rdx
	movq	-16(%rbp), %rsi
	movl	52(%rsi), %r8d
	subl	-28(%rbp), %r8d
	movslq	%r8d, %rsi
	imulq	$24, %rsi, %rsi
	movq	%rax, %rdi
	movq	%rsi, -40(%rbp)         ## 8-byte Spill
	movq	%rdx, %rsi
	movq	-40(%rbp), %rdx         ## 8-byte Reload
	callq	___memcpy_chk
	movl	-28(%rbp), %r8d
	movq	-16(%rbp), %rcx
	movl	%r8d, 52(%rcx)
	movq	-16(%rbp), %rcx
	movq	80(%rcx), %rcx
	movq	-16(%rbp), %rdx
	movslq	52(%rdx), %rdx
	imulq	$24, %rdx, %rdx
	addq	%rdx, %rcx
	movq	-8(%rbp), %rdx
	movq	%rcx, 24(%rdx)
	movq	%rax, -48(%rbp)         ## 8-byte Spill
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"Error while parsing file"

L_.str.1:                               ## @.str.1
	.asciz	"this"

L_.str.2:                               ## @.str.2
	.asciz	"Error - name %s not found in function\n"

L_.str.3:                               ## @.str.3
	.asciz	"\007"

L_.str.4:                               ## @.str.4
	.asciz	"lambda"

L_.str.5:                               ## @.str.5
	.asciz	"_iter$"

L_.str.6:                               ## @.str.6
	.asciz	"expression %s cannot be on the left part of assign\n"

L_.str.7:                               ## @.str.7
	.asciz	"<>"

L_.str.8:                               ## @.str.8
	.asciz	"."

L_.str.9:                               ## @.str.9
	.asciz	"incorrect member declaration"

	.comm	_EXPRTYPE,224,3         ## @EXPRTYPE

.subsections_via_symbols
