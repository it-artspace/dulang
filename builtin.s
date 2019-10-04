	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 14	sdk_version 10, 14
	.globl	___bin_obdump           ## -- Begin function __bin_obdump
	.p2align	4, 0x90
___bin_obdump:                          ## @__bin_obdump
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$64, %rsp
	movq	%rdi, -16(%rbp)
	movl	%esi, -8(%rbp)
	movl	$0, -20(%rbp)
LBB0_1:                                 ## =>This Inner Loop Header: Depth=1
	movl	-20(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jge	LBB0_9
## %bb.2:                               ##   in Loop: Header=BB0_1 Depth=1
	movq	-16(%rbp), %rax
	movslq	-20(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	je	LBB0_6
## %bb.3:                               ##   in Loop: Header=BB0_1 Depth=1
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rsi
	movq	-32(%rbp), %rdx
	movq	-32(%rbp), %rax
	movl	8(%rax), %ecx
	leaq	L_.str.1(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movq	-32(%rbp), %rdx
	movq	(%rdx), %rdx
	cmpq	$0, 8(%rdx)
	movl	%eax, -44(%rbp)         ## 4-byte Spill
	je	LBB0_5
## %bb.4:                               ##   in Loop: Header=BB0_1 Depth=1
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	movq	-32(%rbp), %rdi
	callq	*%rax
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rsi
	leaq	L_.str.2(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movq	-40(%rbp), %rdi
	movl	%eax, -48(%rbp)         ## 4-byte Spill
	callq	_dulfree
LBB0_5:                                 ##   in Loop: Header=BB0_1 Depth=1
	jmp	LBB0_7
LBB0_6:                                 ##   in Loop: Header=BB0_1 Depth=1
	leaq	L_.str.3(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	%eax, -52(%rbp)         ## 4-byte Spill
LBB0_7:                                 ##   in Loop: Header=BB0_1 Depth=1
	jmp	LBB0_8
LBB0_8:                                 ##   in Loop: Header=BB0_1 Depth=1
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -20(%rbp)
	jmp	LBB0_1
LBB0_9:
	xorl	%eax, %eax
                                        ## kill: def $rax killed $eax
	addq	$64, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	___bin_typeof           ## -- Begin function __bin_typeof
	.p2align	4, 0x90
___bin_typeof:                          ## @__bin_typeof
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$80, %rsp
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	%rdi, -32(%rbp)
	movl	%esi, -24(%rbp)
	cmpl	$1, -24(%rbp)
	jle	LBB1_9
## %bb.1:
	movl	-24(%rbp), %eax
	movl	%eax, %ecx
	movq	%rsp, %rdx
	movq	%rdx, -40(%rbp)
	leaq	15(,%rcx,8), %rdx
	andq	$-16, %rdx
	movq	%rsp, %rsi
	subq	%rdx, %rsi
	movq	%rsi, %rsp
	movq	%rcx, -48(%rbp)
	movl	-24(%rbp), %eax
	movl	%eax, -52(%rbp)
	movq	%rsi, -72(%rbp)         ## 8-byte Spill
LBB1_2:                                 ## =>This Inner Loop Header: Depth=1
	cmpl	$0, -52(%rbp)
	jle	LBB1_8
## %bb.3:                               ##   in Loop: Header=BB1_2 Depth=1
	movq	-32(%rbp), %rax
	movl	-52(%rbp), %ecx
	subl	$1, %ecx
	movslq	%ecx, %rdx
	movq	(%rax,%rdx,8), %rax
	movq	%rax, -64(%rbp)
	cmpq	$0, -64(%rbp)
	je	LBB1_5
## %bb.4:                               ##   in Loop: Header=BB1_2 Depth=1
	movq	-64(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rdi
	callq	_strfromchar
	movl	-52(%rbp), %ecx
	subl	$1, %ecx
	movslq	%ecx, %rdi
	movq	-72(%rbp), %rdx         ## 8-byte Reload
	movq	%rax, (%rdx,%rdi,8)
	jmp	LBB1_6
LBB1_5:                                 ##   in Loop: Header=BB1_2 Depth=1
	leaq	L_.str.4(%rip), %rdi
	callq	_strfromchar
	movl	-52(%rbp), %ecx
	subl	$1, %ecx
	movslq	%ecx, %rdi
	movq	-72(%rbp), %rdx         ## 8-byte Reload
	movq	%rax, (%rdx,%rdi,8)
LBB1_6:                                 ##   in Loop: Header=BB1_2 Depth=1
	jmp	LBB1_7
LBB1_7:                                 ##   in Loop: Header=BB1_2 Depth=1
	movl	-52(%rbp), %eax
	addl	$-1, %eax
	movl	%eax, -52(%rbp)
	jmp	LBB1_2
LBB1_8:
	movslq	-24(%rbp), %rax
	shlq	$3, %rax
	movq	-72(%rbp), %rcx         ## 8-byte Reload
	addq	%rax, %rcx
	movl	-24(%rbp), %esi
	movq	%rcx, %rdi
	callq	__mktuple
	movq	%rax, -16(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, %rsp
	jmp	LBB1_12
LBB1_9:
	movq	-32(%rbp), %rax
	cmpq	$0, (%rax)
	je	LBB1_11
## %bb.10:
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	(%rax), %rdi
	callq	_strfromchar
	movq	%rax, -16(%rbp)
	jmp	LBB1_12
LBB1_11:
	leaq	L_.str.4(%rip), %rdi
	callq	_strfromchar
	movq	%rax, -16(%rbp)
LBB1_12:
	movq	-16(%rbp), %rax
	movq	___stack_chk_guard@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rcx
	movq	-8(%rbp), %rdx
	cmpq	%rdx, %rcx
	movq	%rax, -80(%rbp)         ## 8-byte Spill
	jne	LBB1_14
## %bb.13:
	movq	-80(%rbp), %rax         ## 8-byte Reload
	movq	%rbp, %rsp
	popq	%rbp
	retq
LBB1_14:
	callq	___stack_chk_fail
	ud2
	.cfi_endproc
                                        ## -- End function
	.globl	___bin_range            ## -- Begin function __bin_range
	.p2align	4, 0x90
___bin_range:                           ## @__bin_range
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$96, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -16(%rbp)
	movl	-16(%rbp), %esi
	movl	%esi, %eax
	subl	$1, %eax
	movl	%esi, -68(%rbp)         ## 4-byte Spill
	movl	%eax, -72(%rbp)         ## 4-byte Spill
	je	LBB2_1
	jmp	LBB2_11
LBB2_11:
	movl	-68(%rbp), %eax         ## 4-byte Reload
	subl	$2, %eax
	movl	%eax, -76(%rbp)         ## 4-byte Spill
	je	LBB2_4
	jmp	LBB2_9
LBB2_1:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rdi
	leaq	L_.str.5(%rip), %rsi
	callq	_strcmp
	cmpl	$0, %eax
	je	LBB2_3
## %bb.2:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rdx
	leaq	L_.str.6(%rip), %rsi
	movb	$0, %al
	callq	_fprintf
	movq	$0, -8(%rbp)
	movl	%eax, -80(%rbp)         ## 4-byte Spill
	jmp	LBB2_10
LBB2_3:
	movl	$24, %eax
	movl	%eax, %edi
	callq	_dulalloc
	movq	_RANGEOBJECTTYPE@GOTPCREL(%rip), %rdi
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movq	%rdi, (%rax)
	movq	-40(%rbp), %rax
	movl	$1, 8(%rax)
	movq	-40(%rbp), %rax
	movl	$0, 12(%rax)
	movq	-40(%rbp), %rax
	movl	$1, 20(%rax)
	movq	-32(%rbp), %rax
	cvttsd2si	16(%rax), %ecx
	movq	-40(%rbp), %rax
	movl	%ecx, 16(%rax)
	movq	-40(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB2_10
LBB2_4:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -48(%rbp)
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -56(%rbp)
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rdi
	leaq	L_.str.5(%rip), %rsi
	callq	_strcmp
	cmpl	$0, %eax
	je	LBB2_6
## %bb.5:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rdx
	leaq	L_.str.6(%rip), %rsi
	movb	$0, %al
	callq	_fprintf
	movq	$0, -8(%rbp)
	movl	%eax, -84(%rbp)         ## 4-byte Spill
	jmp	LBB2_10
LBB2_6:
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rdi
	leaq	L_.str.5(%rip), %rsi
	callq	_strcmp
	cmpl	$0, %eax
	je	LBB2_8
## %bb.7:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rdx
	leaq	L_.str.6(%rip), %rsi
	movb	$0, %al
	callq	_fprintf
	movq	$0, -8(%rbp)
	movl	%eax, -88(%rbp)         ## 4-byte Spill
	jmp	LBB2_10
LBB2_8:
	movl	$24, %eax
	movl	%eax, %edi
	callq	_dulalloc
	movq	_RANGEOBJECTTYPE@GOTPCREL(%rip), %rdi
	movq	%rax, -64(%rbp)
	movq	-64(%rbp), %rax
	movq	%rdi, (%rax)
	movq	-64(%rbp), %rax
	movl	$1, 8(%rax)
	movq	-48(%rbp), %rax
	cvttsd2si	16(%rax), %ecx
	movq	-64(%rbp), %rax
	movl	%ecx, 12(%rax)
	movq	-64(%rbp), %rax
	movl	$1, 20(%rax)
	movq	-56(%rbp), %rax
	cvttsd2si	16(%rax), %ecx
	movq	-64(%rbp), %rax
	movl	%ecx, 16(%rax)
	movq	-64(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB2_10
LBB2_9:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	movl	-16(%rbp), %edx
	leaq	L_.str.7(%rip), %rsi
	movb	$0, %al
	callq	_fprintf
	movq	$0, -8(%rbp)
	movl	%eax, -92(%rbp)         ## 4-byte Spill
LBB2_10:
	movq	-8(%rbp), %rax
	addq	$96, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	___bin_range_           ## -- Begin function __bin_range_
	.p2align	4, 0x90
___bin_range_:                          ## @__bin_range_
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
	cmpq	$0, -16(%rbp)
	jne	LBB3_2
## %bb.1:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	leaq	L_.str.8(%rip), %rsi
	movb	$0, %al
	callq	_fprintf
	movq	$0, -8(%rbp)
	movl	%eax, -44(%rbp)         ## 4-byte Spill
	jmp	LBB3_18
LBB3_2:
	movl	$24, %eax
	movl	%eax, %edi
	callq	_dulalloc
	movq	_RANGEOBJECTTYPE@GOTPCREL(%rip), %rdi
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	%rdi, (%rax)
	movq	-32(%rbp), %rax
	movl	$1, 8(%rax)
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rdi
	leaq	L_.str.9(%rip), %rsi
	callq	_strcmp
	cmpl	$0, %eax
	jne	LBB3_15
## %bb.3:
	movq	-16(%rbp), %rax
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	cmpl	$3, 12(%rax)
	jle	LBB3_5
## %bb.4:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	leaq	L_.str.10(%rip), %rsi
	movb	$0, %al
	callq	_fprintf
	movq	$0, -8(%rbp)
	movl	%eax, -48(%rbp)         ## 4-byte Spill
	jmp	LBB3_18
LBB3_5:
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rax
	movq	(%rax), %rdi
	leaq	L_.str.5(%rip), %rsi
	callq	_strcmp
	cmpl	$0, %eax
	je	LBB3_7
## %bb.6:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rax
	movq	(%rax), %rdx
	leaq	L_.str.11(%rip), %rsi
	movb	$0, %al
	callq	_fprintf
	movq	-32(%rbp), %rdx
	movq	%rdx, %rdi
	movl	%eax, -52(%rbp)         ## 4-byte Spill
	callq	_dulfree
	movq	$0, -8(%rbp)
	jmp	LBB3_18
LBB3_7:
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	cvttsd2si	16(%rax), %ecx
	movq	-32(%rbp), %rax
	movl	%ecx, 12(%rax)
	movq	-40(%rbp), %rax
	movq	24(%rax), %rax
	movq	(%rax), %rax
	movq	(%rax), %rdi
	leaq	L_.str.5(%rip), %rsi
	callq	_strcmp
	cmpl	$0, %eax
	je	LBB3_9
## %bb.8:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	movq	-40(%rbp), %rax
	movq	24(%rax), %rax
	movq	(%rax), %rax
	movq	(%rax), %rdx
	leaq	L_.str.11(%rip), %rsi
	movb	$0, %al
	callq	_fprintf
	movq	-32(%rbp), %rdx
	movq	%rdx, %rdi
	movl	%eax, -56(%rbp)         ## 4-byte Spill
	callq	_dulfree
	movq	$0, -8(%rbp)
	jmp	LBB3_18
LBB3_9:
	movq	-40(%rbp), %rax
	movq	24(%rax), %rax
	cvttsd2si	16(%rax), %ecx
	movq	-32(%rbp), %rax
	movl	%ecx, 16(%rax)
	movq	-40(%rbp), %rax
	cmpl	$3, 12(%rax)
	jne	LBB3_13
## %bb.10:
	movq	-40(%rbp), %rax
	movq	32(%rax), %rax
	movq	(%rax), %rax
	movq	(%rax), %rdi
	leaq	L_.str.5(%rip), %rsi
	callq	_strcmp
	cmpl	$0, %eax
	je	LBB3_12
## %bb.11:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	movq	-40(%rbp), %rax
	movq	32(%rax), %rax
	movq	(%rax), %rax
	movq	(%rax), %rdx
	leaq	L_.str.11(%rip), %rsi
	movb	$0, %al
	callq	_fprintf
	movq	-32(%rbp), %rdx
	movq	%rdx, %rdi
	movl	%eax, -60(%rbp)         ## 4-byte Spill
	callq	_dulfree
	movq	$0, -8(%rbp)
	jmp	LBB3_18
LBB3_12:
	movq	-40(%rbp), %rax
	movq	32(%rax), %rax
	cvttsd2si	16(%rax), %ecx
	movq	-32(%rbp), %rax
	movl	%ecx, 20(%rax)
	jmp	LBB3_14
LBB3_13:
	movq	-32(%rbp), %rax
	movl	$1, 20(%rax)
LBB3_14:
	jmp	LBB3_15
LBB3_15:
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rdi
	leaq	L_.str.5(%rip), %rsi
	callq	_strcmp
	cmpl	$0, %eax
	jne	LBB3_17
## %bb.16:
	movq	-32(%rbp), %rax
	movl	$1, 20(%rax)
	movq	-32(%rbp), %rax
	movl	$0, 12(%rax)
	movq	-16(%rbp), %rax
	cvttsd2si	16(%rax), %ecx
	movq	-32(%rbp), %rax
	movl	%ecx, 16(%rax)
LBB3_17:
	movq	-32(%rbp), %rax
	movq	%rax, -8(%rbp)
LBB3_18:
	movq	-8(%rbp), %rax
	addq	$64, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	___bin_str              ## -- Begin function __bin_str
	.p2align	4, 0x90
___bin_str:                             ## @__bin_str
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$64, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -16(%rbp)
	cmpl	$1, -16(%rbp)
	je	LBB4_2
## %bb.1:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	movl	-16(%rbp), %edx
	leaq	L_.str.12(%rip), %rsi
	movb	$0, %al
	callq	_fprintf
	movq	$0, -8(%rbp)
	movl	%eax, -52(%rbp)         ## 4-byte Spill
	jmp	LBB4_5
LBB4_2:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	LBB4_4
## %bb.3:
	leaq	L_.str.13(%rip), %rdi
	callq	_strfromchar
	movq	%rax, -8(%rbp)
	jmp	LBB4_5
LBB4_4:
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	movq	-32(%rbp), %rdi
	callq	*%rax
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rdi
	callq	_strfromchar
	movq	%rax, -48(%rbp)
	movq	-40(%rbp), %rdi
	callq	_free
	movq	-48(%rbp), %rax
	movq	%rax, -8(%rbp)
LBB4_5:
	movq	-8(%rbp), %rax
	addq	$64, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3               ## -- Begin function __bin_time
LCPI5_0:
	.quad	4696837146684686336     ## double 1.0E+6
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4
LCPI5_1:
	.long	1127219200              ## 0x43300000
	.long	1160773632              ## 0x45300000
	.long	0                       ## 0x0
	.long	0                       ## 0x0
LCPI5_2:
	.quad	4841369599423283200     ## double 4503599627370496
	.quad	4985484787499139072     ## double 1.9342813113834067E+25
	.section	__TEXT,__text,regular,pure_instructions
	.globl	___bin_time
	.p2align	4, 0x90
___bin_time:                            ## @__bin_time
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movsd	LCPI5_0(%rip), %xmm0    ## xmm0 = mem[0],zero
	movq	%rdi, -16(%rbp)
	movl	%esi, -8(%rbp)
	movsd	%xmm0, -24(%rbp)        ## 8-byte Spill
	callq	_clock
	movq	%rax, %xmm0
	movaps	LCPI5_1(%rip), %xmm1    ## xmm1 = [1127219200,1160773632,0,0]
	punpckldq	%xmm1, %xmm0    ## xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
	movapd	LCPI5_2(%rip), %xmm1    ## xmm1 = [4.503600e+15,1.934281e+25]
	subpd	%xmm1, %xmm0
	haddpd	%xmm0, %xmm0
	movsd	-24(%rbp), %xmm1        ## 8-byte Reload
                                        ## xmm1 = mem[0],zero
	divsd	%xmm1, %xmm0
	callq	_numfromdouble
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	___bin_array            ## -- Begin function __bin_array
	.p2align	4, 0x90
___bin_array:                           ## @__bin_array
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$80, %rsp
	movl	$32, %eax
	movl	%eax, %ecx
	movq	%rdi, -16(%rbp)
	movl	%esi, -8(%rbp)
	movq	%rcx, %rdi
	callq	_ob_alloc
	movl	$120, %esi
	movl	%esi, %edi
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movl	$0, 8(%rax)
	movq	-24(%rbp), %rax
	movl	$0, 12(%rax)
	movq	-24(%rbp), %rax
	movl	$15, 16(%rax)
	callq	_malloc
	movq	_ARRTYPE@GOTPCREL(%rip), %rcx
	movq	-24(%rbp), %rdi
	movq	%rax, 24(%rdi)
	movq	-24(%rbp), %rax
	movq	%rcx, (%rax)
	cmpl	$1, -8(%rbp)
	jne	LBB6_6
## %bb.1:
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	cmpq	$0, 152(%rax)
	je	LBB6_6
## %bb.2:
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	152(%rax), %rax
	movq	-16(%rbp), %rcx
	movq	(%rcx), %rdi
	callq	*%rax
	movq	%rax, -32(%rbp)
LBB6_3:                                 ## =>This Inner Loop Header: Depth=1
	cmpq	$0, -32(%rbp)
	je	LBB6_5
## %bb.4:                               ##   in Loop: Header=BB6_3 Depth=1
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	200(%rax), %rax
	movq	-32(%rbp), %rdi
	callq	*%rax
	movq	%rax, -56(%rbp)
	movl	$1, -40(%rbp)
	leaq	-56(%rbp), %rax
	movq	%rax, -48(%rbp)
	movq	-24(%rbp), %rax
	movq	-48(%rbp), %rsi
	movl	-40(%rbp), %edx
	movq	%rax, %rdi
	callq	_append
	movq	-32(%rbp), %rsi
	movq	(%rsi), %rsi
	movq	160(%rsi), %rsi
	movq	-32(%rbp), %rdi
	movq	%rax, -64(%rbp)         ## 8-byte Spill
	callq	*%rsi
	movq	%rax, -32(%rbp)
	jmp	LBB6_3
LBB6_5:
	jmp	LBB6_7
LBB6_6:
	movq	-24(%rbp), %rax
	movq	-16(%rbp), %rsi
	movl	-8(%rbp), %edx
	movq	%rax, %rdi
	callq	_append
	movq	%rax, -72(%rbp)         ## 8-byte Spill
LBB6_7:
	movq	-24(%rbp), %rax
	addq	$80, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"builtin"

	.section	__DATA,__const
	.globl	_BINTYPE                ## @BINTYPE
	.p2align	3
_BINTYPE:
	.quad	L_.str
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
	.quad	0
	.quad	0
	.quad	0
	.long	8                       ## 0x8
	.space	4
	.quad	0

	.section	__TEXT,__cstring,cstring_literals
L_.str.1:                               ## @.str.1
	.asciz	"object of type: %s at %lX, handles %d pointers\n"

L_.str.2:                               ## @.str.2
	.asciz	"repr: %s\n"

L_.str.3:                               ## @.str.3
	.asciz	"nullptr"

L_.str.4:                               ## @.str.4
	.asciz	"null"

L_.str.5:                               ## @.str.5
	.asciz	"number"

L_.str.6:                               ## @.str.6
	.asciz	"cannot make a range out of object of type %s"

L_.str.7:                               ## @.str.7
	.asciz	"range func takes 1-2 args but %d were given"

L_.str.8:                               ## @.str.8
	.asciz	"cannot initialize range with no parameters. At least one needed\n"

L_.str.9:                               ## @.str.9
	.asciz	"bundle"

L_.str.10:                              ## @.str.10
	.asciz	"Too much parameters to initialize rangeobject. 1 - 3 needed\n"

L_.str.11:                              ## @.str.11
	.asciz	"Parameters of numeric type are expected but %s given\n"

L_.str.12:                              ## @.str.12
	.asciz	"in function str 1 argument expected but %d passed"

L_.str.13:                              ## @.str.13
	.space	1

	.weak_reference _ob_alloc

.subsections_via_symbols
