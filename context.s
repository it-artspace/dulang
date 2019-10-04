	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 14	sdk_version 10, 14
	.globl	_exec_context           ## -- Begin function exec_context
	.p2align	4, 0x90
_exec_context:                          ## @exec_context
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$992, %rsp              ## imm = 0x3E0
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	%rdi, -128(%rbp)
	movq	-128(%rbp), %rax
	movq	16(%rax), %rdi
	movq	%rdi, %rcx
	addq	$24, %rcx
	movq	%rcx, 16(%rax)
	movq	%rdi, -136(%rbp)
	movq	-128(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -144(%rbp)
	movq	-128(%rbp), %rax
	cmpq	$0, 64(%rax)
	je	LBB0_2
## %bb.1:
	movq	-128(%rbp), %rax
	movq	64(%rax), %rax
	movq	40(%rax), %rax
	movq	%rax, -144(%rbp)
LBB0_2:
	movq	-136(%rbp), %rax
	movl	(%rax), %ecx
	movl	%ecx, %eax
	movq	%rax, %rdx
	subq	$39, %rdx
	movq	%rax, -880(%rbp)        ## 8-byte Spill
	movq	%rdx, -888(%rbp)        ## 8-byte Spill
	ja	LBB0_230
## %bb.241:
	leaq	LJTI0_0(%rip), %rax
	movq	-880(%rbp), %rcx        ## 8-byte Reload
	movslq	(%rax,%rcx,4), %rdx
	addq	%rax, %rdx
	jmpq	*%rdx
LBB0_3:
	movq	-128(%rbp), %rax
	movq	(%rax), %rax
	movq	-136(%rbp), %rcx
	movslq	4(%rcx), %rcx
	cmpq	$0, (%rax,%rcx,8)
	je	LBB0_7
## %bb.4:
	movq	-128(%rbp), %rax
	movq	(%rax), %rax
	movq	-136(%rbp), %rcx
	movslq	4(%rcx), %rcx
	movq	(%rax,%rcx,8), %rax
	movl	8(%rax), %edx
	addl	$-1, %edx
	movl	%edx, 8(%rax)
	cmpl	$0, %edx
	jne	LBB0_6
## %bb.5:
	movq	-128(%rbp), %rax
	movq	(%rax), %rax
	movq	-136(%rbp), %rcx
	movslq	4(%rcx), %rcx
	movq	(%rax,%rcx,8), %rdi
	callq	_ob_dealloc
LBB0_6:
	jmp	LBB0_7
LBB0_7:
	movq	-128(%rbp), %rax
	movq	32(%rax), %rcx
	movq	%rcx, %rdx
	addq	$-8, %rdx
	movq	%rdx, 32(%rax)
	movq	-8(%rcx), %rax
	movq	-128(%rbp), %rcx
	movq	(%rcx), %rcx
	movq	-136(%rbp), %rdx
	movslq	4(%rdx), %rdx
	movq	%rax, (%rcx,%rdx,8)
	movq	-128(%rbp), %rax
	movq	(%rax), %rax
	movq	-136(%rbp), %rcx
	movslq	4(%rcx), %rcx
	cmpq	$0, (%rax,%rcx,8)
	je	LBB0_9
## %bb.8:
	movq	-128(%rbp), %rax
	movq	(%rax), %rax
	movq	-136(%rbp), %rcx
	movslq	4(%rcx), %rcx
	movq	(%rax,%rcx,8), %rax
	movl	8(%rax), %edx
	addl	$1, %edx
	movl	%edx, 8(%rax)
LBB0_9:
	jmp	LBB0_231
LBB0_10:
	movq	-128(%rbp), %rax
	movq	(%rax), %rax
	movq	-136(%rbp), %rcx
	movslq	4(%rcx), %rcx
	movq	(%rax,%rcx,8), %rax
	movq	-128(%rbp), %rcx
	movq	32(%rcx), %rdx
	movq	%rdx, %rsi
	addq	$8, %rsi
	movq	%rsi, 32(%rcx)
	movq	%rax, (%rdx)
	jmp	LBB0_231
LBB0_11:
	movq	-128(%rbp), %rax
	cmpq	$0, 64(%rax)
	jne	LBB0_13
## %bb.12:
	movq	-128(%rbp), %rax
	movq	8(%rax), %rax
	movq	24(%rax), %rax
	movq	-136(%rbp), %rcx
	movslq	4(%rcx), %rcx
	movq	(%rax,%rcx,8), %rax
	movq	-128(%rbp), %rcx
	movq	32(%rcx), %rdx
	movq	%rdx, %rsi
	addq	$8, %rsi
	movq	%rsi, 32(%rcx)
	movq	%rax, (%rdx)
	jmp	LBB0_14
LBB0_13:
	movq	-128(%rbp), %rax
	movq	64(%rax), %rax
	movq	40(%rax), %rax
	movq	24(%rax), %rax
	movq	-136(%rbp), %rcx
	movslq	4(%rcx), %rcx
	movq	(%rax,%rcx,8), %rax
	movq	-128(%rbp), %rcx
	movq	32(%rcx), %rdx
	movq	%rdx, %rsi
	addq	$8, %rsi
	movq	%rsi, 32(%rcx)
	movq	%rax, (%rdx)
LBB0_14:
	jmp	LBB0_231
LBB0_15:
	jmp	LBB0_16
LBB0_16:
	movq	-128(%rbp), %rax
	movq	32(%rax), %rcx
	movq	%rcx, %rdx
	addq	$-8, %rdx
	movq	%rdx, 32(%rax)
	movq	-8(%rcx), %rax
	movq	%rax, -152(%rbp)
	cmpq	$0, -152(%rbp)
	jne	LBB0_18
## %bb.17:
	leaq	L_.str(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	%eax, -892(%rbp)        ## 4-byte Spill
	jmp	LBB0_19
LBB0_18:
	xorl	%eax, %eax
	movl	%eax, %ecx
	movq	-136(%rbp), %rdx
	movl	4(%rdx), %eax
	subl	$1, %eax
	movq	-128(%rbp), %rdx
	movq	32(%rdx), %rsi
	movslq	%eax, %rdi
	subq	%rdi, %rcx
	shlq	$3, %rcx
	addq	%rcx, %rsi
	movq	%rsi, 32(%rdx)
	movq	%rsi, -168(%rbp)
	movq	-136(%rbp), %rcx
	movl	4(%rcx), %eax
	movl	%eax, -160(%rbp)
	movq	-128(%rbp), %rcx
	movq	80(%rcx), %rcx
	movq	-168(%rbp), %rsi
	movl	-160(%rbp), %edx
	movq	%rcx, %rdi
	callq	_push
	movq	%rax, -904(%rbp)        ## 8-byte Spill
LBB0_19:
	jmp	LBB0_20
LBB0_20:
	jmp	LBB0_231
LBB0_21:
	movq	-128(%rbp), %rax
	movq	32(%rax), %rcx
	movq	%rcx, %rdx
	addq	$-8, %rdx
	movq	%rdx, 32(%rax)
	movq	-8(%rcx), %rax
	movq	%rax, -176(%rbp)
	cmpq	$0, -176(%rbp)
	jne	LBB0_23
## %bb.22:
	movq	-136(%rbp), %rax
	movl	4(%rax), %ecx
	movq	-128(%rbp), %rax
	movq	16(%rax), %rdx
	movslq	%ecx, %rsi
	imulq	$24, %rsi, %rsi
	addq	%rsi, %rdx
	movq	%rdx, 16(%rax)
	jmp	LBB0_231
LBB0_23:
	movq	_BOOLTYPE@GOTPCREL(%rip), %rax
	movq	-176(%rbp), %rcx
	cmpq	%rax, (%rcx)
	jne	LBB0_27
## %bb.24:
	movq	-176(%rbp), %rax
	movb	12(%rax), %cl
	shlb	$7, %cl
	sarb	$7, %cl
	cmpb	$0, %cl
	jne	LBB0_26
## %bb.25:
	movq	-136(%rbp), %rax
	movl	4(%rax), %ecx
	movq	-128(%rbp), %rax
	movq	16(%rax), %rdx
	movslq	%ecx, %rsi
	imulq	$24, %rsi, %rsi
	addq	%rsi, %rdx
	movq	%rdx, 16(%rax)
LBB0_26:
	jmp	LBB0_27
LBB0_27:
	jmp	LBB0_231
LBB0_28:
	movq	-136(%rbp), %rax
	movl	4(%rax), %ecx
	movq	-128(%rbp), %rax
	movq	16(%rax), %rdx
	movslq	%ecx, %rsi
	imulq	$24, %rsi, %rsi
	addq	%rsi, %rdx
	movq	%rdx, 16(%rax)
	jmp	LBB0_231
LBB0_29:
	jmp	LBB0_30
LBB0_30:
	movl	$88, %eax
	movl	%eax, %edi
	movq	-128(%rbp), %rcx
	movq	8(%rcx), %rcx
	movq	24(%rcx), %rcx
	movq	-136(%rbp), %rdx
	movslq	4(%rdx), %rdx
	movq	(%rcx,%rdx,8), %rcx
	movq	%rcx, -184(%rbp)
	callq	_dulalloc
	movl	$88, %esi
	movl	%esi, %edx
	movq	$-1, %rcx
	movq	%rax, -192(%rbp)
	movq	-192(%rbp), %rax
	movq	-184(%rbp), %rdi
	movq	%rdi, -912(%rbp)        ## 8-byte Spill
	movq	%rax, %rdi
	movq	-912(%rbp), %rsi        ## 8-byte Reload
	callq	___memcpy_chk
	movq	-128(%rbp), %rcx
	movq	-192(%rbp), %rdx
	movq	%rcx, 72(%rdx)
	movq	-192(%rbp), %rcx
	movq	-128(%rbp), %rdx
	movq	32(%rdx), %rsi
	movq	%rsi, %rdi
	addq	$8, %rdi
	movq	%rdi, 32(%rdx)
	movq	%rcx, (%rsi)
	movq	%rax, -920(%rbp)        ## 8-byte Spill
## %bb.31:
	jmp	LBB0_231
LBB0_32:
	movq	-136(%rbp), %rax
	movl	4(%rax), %ecx
	movl	%ecx, -196(%rbp)
	movl	-196(%rbp), %ecx
	sarl	$16, %ecx
	movl	%ecx, -200(%rbp)
	movl	$65535, -204(%rbp)      ## imm = 0xFFFF
	movl	-196(%rbp), %ecx
	andl	-204(%rbp), %ecx
	subl	$1, %ecx
	movl	%ecx, -208(%rbp)
	movq	-128(%rbp), %rax
	movq	8(%rax), %rax
	movq	72(%rax), %rax
	movq	%rax, -216(%rbp)
LBB0_33:                                ## =>This Inner Loop Header: Depth=1
	xorl	%eax, %eax
	movb	%al, %cl
	cmpl	$0, -200(%rbp)
	movb	%cl, -921(%rbp)         ## 1-byte Spill
	jle	LBB0_35
## %bb.34:                              ##   in Loop: Header=BB0_33 Depth=1
	cmpq	$0, -216(%rbp)
	setne	%al
	movb	%al, -921(%rbp)         ## 1-byte Spill
LBB0_35:                                ##   in Loop: Header=BB0_33 Depth=1
	movb	-921(%rbp), %al         ## 1-byte Reload
	testb	$1, %al
	jne	LBB0_36
	jmp	LBB0_37
LBB0_36:                                ##   in Loop: Header=BB0_33 Depth=1
	movq	-216(%rbp), %rax
	movq	72(%rax), %rax
	movq	%rax, -216(%rbp)
	movl	-200(%rbp), %ecx
	addl	$-1, %ecx
	movl	%ecx, -200(%rbp)
	jmp	LBB0_33
LBB0_37:
	cmpq	$0, -216(%rbp)
	je	LBB0_39
## %bb.38:
	movq	-216(%rbp), %rax
	movq	(%rax), %rax
	movslq	-208(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	movq	-128(%rbp), %rcx
	movq	32(%rcx), %rdx
	movq	%rdx, %rsi
	addq	$8, %rsi
	movq	%rsi, 32(%rcx)
	movq	%rax, (%rdx)
LBB0_39:
	jmp	LBB0_231
LBB0_40:
	movq	-128(%rbp), %rax
	movq	32(%rax), %rcx
	movq	%rcx, %rdx
	addq	$-8, %rdx
	movq	%rdx, 32(%rax)
	movq	-8(%rcx), %rax
	movq	%rax, -224(%rbp)
	cmpq	$0, -224(%rbp)
	jne	LBB0_42
## %bb.41:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	leaq	L_.str.1(%rip), %rsi
	movb	$0, %al
	callq	_fprintf
	movl	%eax, -928(%rbp)        ## 4-byte Spill
	jmp	LBB0_231
LBB0_42:
	movq	-224(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$10, 208(%rax)
	jne	LBB0_60
## %bb.43:
	movq	-224(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, -232(%rbp)
	movq	-224(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -240(%rbp)
	movq	-232(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$5, 208(%rax)
	jne	LBB0_59
## %bb.44:
	movq	-232(%rbp), %rax
	movq	-128(%rbp), %rcx
	movq	88(%rcx), %rsi
	movq	%rax, %rdi
	callq	_init_context
	movq	%rax, -248(%rbp)
	movq	-232(%rbp), %rax
	movl	36(%rax), %edx
	movq	-136(%rbp), %rax
	cmpl	4(%rax), %edx
	je	LBB0_46
## %bb.45:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	movq	-136(%rbp), %rax
	movl	4(%rax), %edx
	movq	-232(%rbp), %rax
	movl	36(%rax), %ecx
	leaq	L_.str.2(%rip), %rsi
	movb	$0, %al
	callq	_fprintf
	movl	%eax, -932(%rbp)        ## 4-byte Spill
LBB0_46:
	movq	-232(%rbp), %rax
	movl	36(%rax), %ecx
	subl	$1, %ecx
	movl	%ecx, -252(%rbp)
LBB0_47:                                ## =>This Inner Loop Header: Depth=1
	cmpl	$0, -252(%rbp)
	jl	LBB0_50
## %bb.48:                              ##   in Loop: Header=BB0_47 Depth=1
	movq	-128(%rbp), %rax
	movq	32(%rax), %rcx
	movq	%rcx, %rdx
	addq	$-8, %rdx
	movq	%rdx, 32(%rax)
	movq	-8(%rcx), %rax
	movq	-248(%rbp), %rcx
	movq	(%rcx), %rcx
	movslq	-252(%rbp), %rdx
	movq	%rax, (%rcx,%rdx,8)
## %bb.49:                              ##   in Loop: Header=BB0_47 Depth=1
	movl	-252(%rbp), %eax
	addl	$-1, %eax
	movl	%eax, -252(%rbp)
	jmp	LBB0_47
LBB0_50:
	movl	$0, -256(%rbp)
LBB0_51:                                ## =>This Inner Loop Header: Depth=1
	movl	-256(%rbp), %eax
	movq	-232(%rbp), %rcx
	cmpl	32(%rcx), %eax
	jge	LBB0_58
## %bb.52:                              ##   in Loop: Header=BB0_51 Depth=1
	movq	-232(%rbp), %rax
	movq	16(%rax), %rax
	movslq	-256(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdi
	leaq	L_.str.3(%rip), %rsi
	callq	_strcmp
	cmpl	$0, %eax
	jne	LBB0_56
## %bb.53:                              ##   in Loop: Header=BB0_51 Depth=1
	cmpq	$0, -240(%rbp)
	je	LBB0_55
## %bb.54:                              ##   in Loop: Header=BB0_51 Depth=1
	movq	-240(%rbp), %rax
	movl	8(%rax), %ecx
	addl	$1, %ecx
	movl	%ecx, 8(%rax)
LBB0_55:                                ##   in Loop: Header=BB0_51 Depth=1
	movq	-240(%rbp), %rax
	movq	-248(%rbp), %rcx
	movq	(%rcx), %rcx
	movslq	-256(%rbp), %rdx
	movq	%rax, (%rcx,%rdx,8)
	movq	-240(%rbp), %rax
	movq	-248(%rbp), %rcx
	movq	%rax, 56(%rcx)
LBB0_56:                                ##   in Loop: Header=BB0_51 Depth=1
	jmp	LBB0_57
LBB0_57:                                ##   in Loop: Header=BB0_51 Depth=1
	movl	-256(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -256(%rbp)
	jmp	LBB0_51
LBB0_58:
	jmp	LBB0_59
LBB0_59:
	jmp	LBB0_60
LBB0_60:
	movq	_EXPRTYPE@GOTPCREL(%rip), %rax
	movq	-224(%rbp), %rcx
	cmpq	%rax, (%rcx)
	jne	LBB0_62
## %bb.61:
	movq	-224(%rbp), %rax
	movq	%rax, -264(%rbp)
	movq	-128(%rbp), %rax
	movq	16(%rax), %rax
	movq	-264(%rbp), %rcx
	movq	%rax, 24(%rcx)
	movq	-264(%rbp), %rax
	movq	-128(%rbp), %rcx
	movq	%rax, 64(%rcx)
	movq	-264(%rbp), %rax
	movq	32(%rax), %rax
	movq	-128(%rbp), %rcx
	movq	%rax, 16(%rcx)
	movq	-264(%rbp), %rax
	movq	32(%rax), %rax
	movq	-264(%rbp), %rcx
	movslq	12(%rcx), %rcx
	imulq	$24, %rcx, %rcx
	addq	%rcx, %rax
	movq	-128(%rbp), %rcx
	movq	%rax, 24(%rcx)
	jmp	LBB0_231
LBB0_62:
	movq	-224(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$5, 208(%rax)
	jne	LBB0_70
## %bb.63:
	movq	-224(%rbp), %rax
	movq	-128(%rbp), %rcx
	movq	88(%rcx), %rsi
	movq	%rax, %rdi
	callq	_init_context
	movq	%rax, -272(%rbp)
	movq	-224(%rbp), %rax
	movl	36(%rax), %edx
	movq	-136(%rbp), %rax
	cmpl	4(%rax), %edx
	je	LBB0_65
## %bb.64:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	movq	-136(%rbp), %rax
	movl	4(%rax), %edx
	movq	-224(%rbp), %rax
	movl	36(%rax), %ecx
	leaq	L_.str.2(%rip), %rsi
	movb	$0, %al
	callq	_fprintf
	movl	%eax, -936(%rbp)        ## 4-byte Spill
LBB0_65:
	movq	-224(%rbp), %rax
	movl	36(%rax), %ecx
	subl	$1, %ecx
	movl	%ecx, -276(%rbp)
LBB0_66:                                ## =>This Inner Loop Header: Depth=1
	cmpl	$0, -276(%rbp)
	jl	LBB0_69
## %bb.67:                              ##   in Loop: Header=BB0_66 Depth=1
	movq	-128(%rbp), %rax
	movq	32(%rax), %rcx
	movq	%rcx, %rdx
	addq	$-8, %rdx
	movq	%rdx, 32(%rax)
	movq	-8(%rcx), %rax
	movq	-272(%rbp), %rcx
	movq	(%rcx), %rcx
	movslq	-276(%rbp), %rdx
	movq	%rax, (%rcx,%rdx,8)
## %bb.68:                              ##   in Loop: Header=BB0_66 Depth=1
	movl	-276(%rbp), %eax
	addl	$-1, %eax
	movl	%eax, -276(%rbp)
	jmp	LBB0_66
LBB0_69:
	jmp	LBB0_70
LBB0_70:
	movq	-224(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$8, 208(%rax)
	jne	LBB0_72
## %bb.71:
	xorl	%eax, %eax
	movl	%eax, %ecx
	movq	-224(%rbp), %rdx
	movq	%rdx, -288(%rbp)
	movq	-136(%rbp), %rdx
	movl	4(%rdx), %eax
	movq	-128(%rbp), %rdx
	movq	32(%rdx), %rsi
	movslq	%eax, %rdi
	subq	%rdi, %rcx
	shlq	$3, %rcx
	addq	%rcx, %rsi
	movq	%rsi, 32(%rdx)
	movq	%rsi, -304(%rbp)
	movq	-136(%rbp), %rcx
	movl	4(%rcx), %eax
	movl	%eax, -296(%rbp)
	movq	-288(%rbp), %rcx
	movq	24(%rcx), %rcx
	movq	-304(%rbp), %rdi
	movl	-296(%rbp), %esi
	callq	*%rcx
	movq	-128(%rbp), %rcx
	movq	32(%rcx), %rdx
	movq	%rdx, %rdi
	addq	$8, %rdi
	movq	%rdi, 32(%rcx)
	movq	%rax, (%rdx)
LBB0_72:
	movq	-224(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rdi
	leaq	L_.str.4(%rip), %rsi
	callq	_strcmp
	cmpl	$0, %eax
	jne	LBB0_90
## %bb.73:
	movq	-136(%rbp), %rax
	cmpl	$0, 4(%rax)
	jne	LBB0_81
## %bb.74:
	callq	_new_ob
	movq	%rax, -312(%rbp)
	movq	-224(%rbp), %rax
	movq	%rax, -320(%rbp)
	movl	$0, -324(%rbp)
LBB0_75:                                ## =>This Inner Loop Header: Depth=1
	movl	-324(%rbp), %eax
	movq	-320(%rbp), %rcx
	cmpl	16(%rcx), %eax
	jge	LBB0_80
## %bb.76:                              ##   in Loop: Header=BB0_75 Depth=1
	movq	-320(%rbp), %rax
	movq	24(%rax), %rax
	movslq	-324(%rbp), %rcx
	shlq	$4, %rcx
	addq	%rcx, %rax
	cmpq	$0, (%rax)
	je	LBB0_78
## %bb.77:                              ##   in Loop: Header=BB0_75 Depth=1
	movq	-312(%rbp), %rdi
	movq	-320(%rbp), %rax
	movq	24(%rax), %rax
	movslq	-324(%rbp), %rcx
	shlq	$4, %rcx
	addq	%rcx, %rax
	movq	(%rax), %rsi
	movq	-320(%rbp), %rax
	movq	24(%rax), %rax
	movslq	-324(%rbp), %rcx
	shlq	$4, %rcx
	addq	%rcx, %rax
	movq	8(%rax), %rdx
	callq	_ob_subscr_set
LBB0_78:                                ##   in Loop: Header=BB0_75 Depth=1
	jmp	LBB0_79
LBB0_79:                                ##   in Loop: Header=BB0_75 Depth=1
	movl	-324(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -324(%rbp)
	jmp	LBB0_75
LBB0_80:
	movq	-312(%rbp), %rax
	movq	-128(%rbp), %rcx
	movq	32(%rcx), %rdx
	movq	%rdx, %rsi
	addq	$8, %rsi
	movq	%rsi, 32(%rcx)
	movq	%rax, (%rdx)
	jmp	LBB0_231
LBB0_81:
	movq	-128(%rbp), %rax
	movq	32(%rax), %rcx
	movq	%rcx, %rdx
	addq	$-8, %rdx
	movq	%rdx, 32(%rax)
	movq	-8(%rcx), %rax
	movq	%rax, -336(%rbp)
	movq	-336(%rbp), %rax
	movq	%rax, -344(%rbp)
	movq	-344(%rbp), %rdi
	movq	-128(%rbp), %rax
	movq	88(%rax), %rsi
	callq	_init_context
	movq	%rax, -352(%rbp)
	movl	$-1, -356(%rbp)
	movl	$0, -360(%rbp)
LBB0_82:                                ## =>This Inner Loop Header: Depth=1
	movl	-360(%rbp), %eax
	movq	-344(%rbp), %rcx
	cmpl	32(%rcx), %eax
	jge	LBB0_87
## %bb.83:                              ##   in Loop: Header=BB0_82 Depth=1
	movq	-344(%rbp), %rax
	movq	16(%rax), %rax
	movslq	-360(%rbp), %rcx
	movq	(%rax,%rcx,8), %rsi
	leaq	L_.str.3(%rip), %rdi
	callq	_strcmp
	cmpl	$0, %eax
	jne	LBB0_85
## %bb.84:
	movl	-360(%rbp), %eax
	movl	%eax, -356(%rbp)
	jmp	LBB0_87
LBB0_85:                                ##   in Loop: Header=BB0_82 Depth=1
	jmp	LBB0_86
LBB0_86:                                ##   in Loop: Header=BB0_82 Depth=1
	movl	-360(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -360(%rbp)
	jmp	LBB0_82
LBB0_87:
	cmpl	$-1, -356(%rbp)
	je	LBB0_89
## %bb.88:
	movq	-224(%rbp), %rax
	movq	-352(%rbp), %rcx
	movq	(%rcx), %rcx
	movslq	-356(%rbp), %rdx
	movq	%rax, (%rcx,%rdx,8)
	movq	-224(%rbp), %rax
	movq	-352(%rbp), %rcx
	movq	%rax, 56(%rcx)
LBB0_89:
	jmp	LBB0_90
LBB0_90:
	jmp	LBB0_231
LBB0_91:
	movq	-128(%rbp), %rax
	cmpq	$0, 72(%rax)
	je	LBB0_95
## %bb.92:
	movq	-128(%rbp), %rax
	movq	32(%rax), %rcx
	movq	%rcx, %rdx
	addq	$-8, %rdx
	movq	%rdx, 32(%rax)
	movq	-8(%rcx), %rax
	movq	%rax, -368(%rbp)
	cmpq	$0, -368(%rbp)
	je	LBB0_94
## %bb.93:
	movq	-368(%rbp), %rax
	movl	8(%rax), %ecx
	addl	$1, %ecx
	movl	%ecx, 8(%rax)
LBB0_94:
	movq	-368(%rbp), %rax
	movq	-128(%rbp), %rcx
	movq	72(%rcx), %rcx
	movq	32(%rcx), %rdx
	movq	%rdx, %rsi
	addq	$8, %rsi
	movq	%rsi, 32(%rcx)
	movq	%rax, (%rdx)
LBB0_95:
	movl	$1, -116(%rbp)
	jmp	LBB0_238
LBB0_96:
	movq	-128(%rbp), %rax
	movq	32(%rax), %rdi
	movq	-136(%rbp), %rax
	movl	4(%rax), %esi
	callq	__mktuple
	xorl	%esi, %esi
	movl	%esi, %edi
	movq	%rax, -376(%rbp)
	movq	-136(%rbp), %rax
	movl	4(%rax), %esi
	movq	-128(%rbp), %rax
	movq	32(%rax), %rcx
	movslq	%esi, %rdx
	subq	%rdx, %rdi
	shlq	$3, %rdi
	addq	%rdi, %rcx
	movq	%rcx, 32(%rax)
	movq	-376(%rbp), %rax
	movq	-128(%rbp), %rcx
	movq	32(%rcx), %rdx
	movq	%rdx, %rdi
	addq	$8, %rdi
	movq	%rdi, 32(%rcx)
	movq	%rax, (%rdx)
	jmp	LBB0_231
LBB0_97:
	movq	-128(%rbp), %rax
	movq	32(%rax), %rax
	cmpq	$0, -8(%rax)
	jne	LBB0_99
## %bb.98:
	movq	-136(%rbp), %rax
	movl	4(%rax), %ecx
	movq	-128(%rbp), %rax
	movq	16(%rax), %rdx
	movslq	%ecx, %rsi
	imulq	$24, %rsi, %rsi
	addq	%rsi, %rdx
	movq	%rdx, 16(%rax)
LBB0_99:
	jmp	LBB0_231
LBB0_100:
	movq	-128(%rbp), %rax
	movq	(%rax), %rax
	movq	-136(%rbp), %rcx
	movslq	4(%rcx), %rcx
	movq	(%rax,%rcx,8), %rax
	movq	%rax, -384(%rbp)
	movq	-384(%rbp), %rax
	movq	(%rax), %rax
	movq	200(%rax), %rax
	movq	-384(%rbp), %rdi
	callq	*%rax
	movq	-128(%rbp), %rcx
	movq	32(%rcx), %rdi
	movq	%rdi, %rdx
	addq	$8, %rdx
	movq	%rdx, 32(%rcx)
	movq	%rax, (%rdi)
	jmp	LBB0_231
LBB0_101:
	movq	-128(%rbp), %rax
	movq	(%rax), %rax
	movq	-136(%rbp), %rcx
	movslq	4(%rcx), %rcx
	movq	(%rax,%rcx,8), %rax
	movq	%rax, -392(%rbp)
	movq	-128(%rbp), %rax
	movq	48(%rax), %rax
	movq	-128(%rbp), %rcx
	movq	%rax, 32(%rcx)
	movq	-392(%rbp), %rax
	movq	(%rax), %rax
	movq	160(%rax), %rax
	movq	-392(%rbp), %rdi
	callq	*%rax
	movq	-128(%rbp), %rcx
	movq	32(%rcx), %rdi
	movq	%rdi, %rdx
	addq	$8, %rdx
	movq	%rdx, 32(%rcx)
	movq	%rax, (%rdi)
	movq	-128(%rbp), %rax
	movq	32(%rax), %rax
	movq	-8(%rax), %rax
	movq	-128(%rbp), %rcx
	movq	(%rcx), %rcx
	movq	-136(%rbp), %rdx
	movslq	4(%rdx), %rdx
	movq	%rax, (%rcx,%rdx,8)
	jmp	LBB0_231
LBB0_102:
	movq	-128(%rbp), %rax
	movq	32(%rax), %rcx
	movq	%rcx, %rdx
	addq	$-8, %rdx
	movq	%rdx, 32(%rax)
	movq	-8(%rcx), %rax
	movq	%rax, -400(%rbp)
	movq	-128(%rbp), %rax
	movq	32(%rax), %rax
	movq	-128(%rbp), %rcx
	movq	%rax, 48(%rcx)
	movq	-400(%rbp), %rax
	movq	(%rax), %rax
	movq	152(%rax), %rax
	movq	-400(%rbp), %rdi
	callq	*%rax
	movq	-128(%rbp), %rcx
	movq	32(%rcx), %rdx
	movq	%rdx, %rdi
	addq	$8, %rdi
	movq	%rdi, 32(%rcx)
	movq	%rax, (%rdx)
	movq	-128(%rbp), %rax
	movq	32(%rax), %rax
	movq	-8(%rax), %rax
	movq	-128(%rbp), %rcx
	movq	(%rcx), %rcx
	movq	-136(%rbp), %rdx
	movslq	4(%rdx), %rdx
	movq	%rax, (%rcx,%rdx,8)
	jmp	LBB0_231
LBB0_103:
	movq	-128(%rbp), %rax
	movq	32(%rax), %rcx
	movq	%rcx, %rdx
	addq	$-8, %rdx
	movq	%rdx, 32(%rax)
	movq	-8(%rcx), %rax
	movq	%rax, -408(%rbp)
	movq	-128(%rbp), %rax
	movq	32(%rax), %rcx
	movq	%rcx, %rdx
	addq	$-8, %rdx
	movq	%rdx, 32(%rax)
	movq	-8(%rcx), %rax
	movq	%rax, -416(%rbp)
	movq	-416(%rbp), %rax
	movq	(%rax), %rax
	movq	32(%rax), %rax
	movq	%rax, -424(%rbp)
	cmpq	$0, -424(%rbp)
	je	LBB0_105
## %bb.104:
	movq	-416(%rbp), %rax
	movq	(%rax), %rax
	movq	32(%rax), %rax
	movq	-416(%rbp), %rdi
	movq	-408(%rbp), %rsi
	callq	*%rax
	movq	-128(%rbp), %rsi
	movq	32(%rsi), %rdi
	movq	%rdi, %rcx
	addq	$8, %rcx
	movq	%rcx, 32(%rsi)
	movq	%rax, (%rdi)
	jmp	LBB0_106
LBB0_105:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	movq	-416(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rdx
	leaq	L_.str.5(%rip), %rsi
	movb	$0, %al
	callq	_fprintf
	movl	%eax, -940(%rbp)        ## 4-byte Spill
LBB0_106:
	jmp	LBB0_231
LBB0_107:
	movq	-128(%rbp), %rax
	movq	32(%rax), %rcx
	movq	%rcx, %rdx
	addq	$-8, %rdx
	movq	%rdx, 32(%rax)
	movq	-8(%rcx), %rax
	movq	%rax, -432(%rbp)
	movq	-128(%rbp), %rax
	movq	32(%rax), %rcx
	movq	%rcx, %rdx
	addq	$-8, %rdx
	movq	%rdx, 32(%rax)
	movq	-8(%rcx), %rax
	movq	%rax, -440(%rbp)
	movq	-440(%rbp), %rax
	movq	(%rax), %rax
	movq	40(%rax), %rax
	movq	%rax, -448(%rbp)
	cmpq	$0, -448(%rbp)
	je	LBB0_109
## %bb.108:
	movq	-440(%rbp), %rax
	movq	(%rax), %rax
	movq	40(%rax), %rax
	movq	-440(%rbp), %rdi
	movq	-432(%rbp), %rsi
	callq	*%rax
	movq	-128(%rbp), %rsi
	movq	32(%rsi), %rdi
	movq	%rdi, %rcx
	addq	$8, %rcx
	movq	%rcx, 32(%rsi)
	movq	%rax, (%rdi)
	jmp	LBB0_110
LBB0_109:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	movq	-440(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rdx
	leaq	L_.str.6(%rip), %rsi
	movb	$0, %al
	callq	_fprintf
	movl	%eax, -944(%rbp)        ## 4-byte Spill
LBB0_110:
	jmp	LBB0_231
LBB0_111:
	movq	-128(%rbp), %rax
	movq	32(%rax), %rcx
	movq	%rcx, %rdx
	addq	$-8, %rdx
	movq	%rdx, 32(%rax)
	movq	-8(%rcx), %rax
	movq	%rax, -456(%rbp)
	movq	-128(%rbp), %rax
	movq	32(%rax), %rcx
	movq	%rcx, %rdx
	addq	$-8, %rdx
	movq	%rdx, 32(%rax)
	movq	-8(%rcx), %rax
	movq	%rax, -464(%rbp)
	movq	-464(%rbp), %rax
	movq	(%rax), %rax
	movq	48(%rax), %rax
	movq	%rax, -472(%rbp)
	cmpq	$0, -472(%rbp)
	je	LBB0_113
## %bb.112:
	movq	-464(%rbp), %rax
	movq	(%rax), %rax
	movq	48(%rax), %rax
	movq	-464(%rbp), %rdi
	movq	-456(%rbp), %rsi
	callq	*%rax
	movq	-128(%rbp), %rsi
	movq	32(%rsi), %rdi
	movq	%rdi, %rcx
	addq	$8, %rcx
	movq	%rcx, 32(%rsi)
	movq	%rax, (%rdi)
	jmp	LBB0_114
LBB0_113:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	movq	-464(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rdx
	leaq	L_.str.7(%rip), %rsi
	movb	$0, %al
	callq	_fprintf
	movl	%eax, -948(%rbp)        ## 4-byte Spill
LBB0_114:
	jmp	LBB0_231
LBB0_115:
	movq	-128(%rbp), %rax
	movq	32(%rax), %rcx
	movq	%rcx, %rdx
	addq	$-8, %rdx
	movq	%rdx, 32(%rax)
	movq	-8(%rcx), %rax
	movq	%rax, -480(%rbp)
	movq	-128(%rbp), %rax
	movq	32(%rax), %rcx
	movq	%rcx, %rdx
	addq	$-8, %rdx
	movq	%rdx, 32(%rax)
	movq	-8(%rcx), %rax
	movq	%rax, -488(%rbp)
	movq	-488(%rbp), %rax
	movq	(%rax), %rax
	movq	56(%rax), %rax
	movq	%rax, -496(%rbp)
	cmpq	$0, -496(%rbp)
	je	LBB0_117
## %bb.116:
	movq	-488(%rbp), %rax
	movq	(%rax), %rax
	movq	56(%rax), %rax
	movq	-488(%rbp), %rdi
	movq	-480(%rbp), %rsi
	callq	*%rax
	movq	-128(%rbp), %rsi
	movq	32(%rsi), %rdi
	movq	%rdi, %rcx
	addq	$8, %rcx
	movq	%rcx, 32(%rsi)
	movq	%rax, (%rdi)
	jmp	LBB0_118
LBB0_117:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	movq	-488(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rdx
	leaq	L_.str.8(%rip), %rsi
	movb	$0, %al
	callq	_fprintf
	movl	%eax, -952(%rbp)        ## 4-byte Spill
LBB0_118:
	jmp	LBB0_231
LBB0_119:
	movq	-128(%rbp), %rax
	movq	32(%rax), %rcx
	movq	%rcx, %rdx
	addq	$-8, %rdx
	movq	%rdx, 32(%rax)
	movq	-8(%rcx), %rax
	movq	%rax, -504(%rbp)
	movq	-128(%rbp), %rax
	movq	32(%rax), %rcx
	movq	%rcx, %rdx
	addq	$-8, %rdx
	movq	%rdx, 32(%rax)
	movq	-8(%rcx), %rax
	movq	%rax, -512(%rbp)
	movq	-504(%rbp), %rax
	movq	(%rax), %rax
	cmpq	$0, 216(%rax)
	jne	LBB0_144
## %bb.120:
	movq	-512(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rdi
	leaq	L_.str.9(%rip), %rsi
	callq	_strcmp
	cmpl	$0, %eax
	jne	LBB0_142
## %bb.121:
	movq	-512(%rbp), %rax
	movq	%rax, -520(%rbp)
	movq	-504(%rbp), %rax
	movq	(%rax), %rax
	movq	168(%rax), %rax
	movq	-504(%rbp), %rdi
	movq	-520(%rbp), %rcx
	movq	%rcx, %rsi
	callq	*%rax
	movq	%rax, -528(%rbp)
	cmpq	$0, -528(%rbp)
	jne	LBB0_123
## %bb.122:
	jmp	LBB0_231
LBB0_123:
	movq	-528(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rdi
	leaq	L_.str.10(%rip), %rsi
	callq	_strcmp
	cmpl	$0, %eax
	jne	LBB0_125
## %bb.124:
	xorl	%eax, %eax
	movl	%eax, %ecx
	movq	-136(%rbp), %rdx
	movl	4(%rdx), %eax
	movl	%eax, -536(%rbp)
	movl	-536(%rbp), %eax
	movq	-128(%rbp), %rdx
	movq	32(%rdx), %rsi
	movslq	%eax, %rdi
	subq	%rdi, %rcx
	shlq	$3, %rcx
	addq	%rcx, %rsi
	movq	%rsi, 32(%rdx)
	movq	%rsi, -544(%rbp)
	movq	-528(%rbp), %rcx
	movq	24(%rcx), %rcx
	movq	-544(%rbp), %rdi
	movl	-536(%rbp), %esi
	callq	*%rcx
	movq	-128(%rbp), %rcx
	movq	32(%rcx), %rdx
	movq	%rdx, %rdi
	addq	$8, %rdi
	movq	%rdi, 32(%rcx)
	movq	%rax, (%rdx)
	jmp	LBB0_231
LBB0_125:
	movq	-528(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$10, 208(%rax)
	jne	LBB0_127
## %bb.126:
	movq	-528(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, -528(%rbp)
LBB0_127:
	movq	-528(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rdi
	leaq	L_.str.11(%rip), %rsi
	callq	_strcmp
	cmpl	$0, %eax
	jne	LBB0_141
## %bb.128:
	movq	-528(%rbp), %rax
	movq	-128(%rbp), %rcx
	movq	88(%rcx), %rsi
	movq	%rax, %rdi
	callq	_init_context
	movq	%rax, -552(%rbp)
	movq	-136(%rbp), %rax
	movl	4(%rax), %edx
	movq	-528(%rbp), %rax
	cmpl	36(%rax), %edx
	je	LBB0_130
## %bb.129:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	movq	-512(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rdx
	leaq	L_.str.12(%rip), %rsi
	movb	$0, %al
	callq	_fprintf
	movl	%eax, -956(%rbp)        ## 4-byte Spill
	jmp	LBB0_231
LBB0_130:
	movl	$0, -556(%rbp)
LBB0_131:                               ## =>This Inner Loop Header: Depth=1
	movl	-556(%rbp), %eax
	movq	-528(%rbp), %rcx
	cmpl	36(%rcx), %eax
	jge	LBB0_134
## %bb.132:                             ##   in Loop: Header=BB0_131 Depth=1
	movq	-128(%rbp), %rax
	movq	32(%rax), %rcx
	movq	%rcx, %rdx
	addq	$-8, %rdx
	movq	%rdx, 32(%rax)
	movq	-8(%rcx), %rax
	movq	-552(%rbp), %rcx
	movq	(%rcx), %rcx
	movslq	-556(%rbp), %rdx
	movq	%rax, (%rcx,%rdx,8)
## %bb.133:                             ##   in Loop: Header=BB0_131 Depth=1
	movl	-556(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -556(%rbp)
	jmp	LBB0_131
LBB0_134:
	movl	$0, -560(%rbp)
LBB0_135:                               ## =>This Inner Loop Header: Depth=1
	movl	-560(%rbp), %eax
	movq	-528(%rbp), %rcx
	cmpl	32(%rcx), %eax
	jge	LBB0_140
## %bb.136:                             ##   in Loop: Header=BB0_135 Depth=1
	movq	-528(%rbp), %rax
	movq	16(%rax), %rax
	movslq	-560(%rbp), %rcx
	movq	(%rax,%rcx,8), %rsi
	leaq	L_.str.3(%rip), %rdi
	callq	_strcmp
	cmpl	$0, %eax
	jne	LBB0_138
## %bb.137:
	movq	-504(%rbp), %rax
	movq	-552(%rbp), %rcx
	movq	(%rcx), %rcx
	movslq	-560(%rbp), %rdx
	movq	%rax, (%rcx,%rdx,8)
	movq	-504(%rbp), %rax
	movq	-552(%rbp), %rcx
	movq	%rax, 56(%rcx)
	jmp	LBB0_140
LBB0_138:                               ##   in Loop: Header=BB0_135 Depth=1
	jmp	LBB0_139
LBB0_139:                               ##   in Loop: Header=BB0_135 Depth=1
	movl	-560(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -560(%rbp)
	jmp	LBB0_135
LBB0_140:
	jmp	LBB0_141
LBB0_141:
	jmp	LBB0_143
LBB0_142:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	movq	-512(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rdx
	leaq	L_.str.12(%rip), %rsi
	movb	$0, %al
	callq	_fprintf
	movl	%eax, -960(%rbp)        ## 4-byte Spill
LBB0_143:
	jmp	LBB0_162
LBB0_144:
	movq	-512(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$1, 208(%rax)
	je	LBB0_146
## %bb.145:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	movq	-512(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rdx
	leaq	L_.str.13(%rip), %rsi
	movb	$0, %al
	callq	_fprintf
	movl	%eax, -964(%rbp)        ## 4-byte Spill
	jmp	LBB0_231
LBB0_146:
	xorl	%eax, %eax
	movl	%eax, %ecx
	movq	-136(%rbp), %rdx
	movl	4(%rdx), %eax
	movl	%eax, -568(%rbp)
	movl	-568(%rbp), %eax
	movq	-128(%rbp), %rdx
	movq	32(%rdx), %rsi
	movslq	%eax, %rdi
	subq	%rdi, %rcx
	shlq	$3, %rcx
	addq	%rcx, %rsi
	movq	%rsi, 32(%rdx)
	movq	%rsi, -576(%rbp)
	movq	-512(%rbp), %rcx
	movq	%rcx, -584(%rbp)
	movq	-504(%rbp), %rcx
	movq	(%rcx), %rcx
	callq	*216(%rcx)
	movq	-584(%rbp), %rcx
	movq	%rax, %rdi
	movq	%rcx, %rsi
	callq	_ob_subscr_get
	movq	%rax, -592(%rbp)
	movq	-592(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$8, 208(%rax)
	jne	LBB0_148
## %bb.147:
	movq	-592(%rbp), %rax
	movq	16(%rax), %rax
	movq	-504(%rbp), %rdi
	movq	-576(%rbp), %rsi
	movl	-568(%rbp), %edx
	callq	*%rax
	movq	-128(%rbp), %rsi
	movq	32(%rsi), %rdi
	movq	%rdi, %rcx
	addq	$8, %rcx
	movq	%rcx, 32(%rsi)
	movq	%rax, (%rdi)
	jmp	LBB0_161
LBB0_148:
	movq	-592(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$10, 208(%rax)
	jne	LBB0_150
## %bb.149:
	movq	-592(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, -592(%rbp)
LBB0_150:
	movq	-592(%rbp), %rax
	movq	-128(%rbp), %rcx
	movq	88(%rcx), %rsi
	movq	%rax, %rdi
	callq	_init_context
	movq	%rax, -600(%rbp)
	movl	$0, -604(%rbp)
LBB0_151:                               ## =>This Inner Loop Header: Depth=1
	movl	-604(%rbp), %eax
	movq	-592(%rbp), %rcx
	cmpl	36(%rcx), %eax
	jge	LBB0_154
## %bb.152:                             ##   in Loop: Header=BB0_151 Depth=1
	movq	-576(%rbp), %rax
	movslq	-604(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	movq	-600(%rbp), %rcx
	movq	(%rcx), %rcx
	movslq	-604(%rbp), %rdx
	movq	%rax, (%rcx,%rdx,8)
## %bb.153:                             ##   in Loop: Header=BB0_151 Depth=1
	movl	-604(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -604(%rbp)
	jmp	LBB0_151
LBB0_154:
	movl	$0, -608(%rbp)
LBB0_155:                               ## =>This Inner Loop Header: Depth=1
	movl	-608(%rbp), %eax
	movq	-592(%rbp), %rcx
	cmpl	32(%rcx), %eax
	jge	LBB0_160
## %bb.156:                             ##   in Loop: Header=BB0_155 Depth=1
	movq	-592(%rbp), %rax
	movq	16(%rax), %rax
	movslq	-608(%rbp), %rcx
	movq	(%rax,%rcx,8), %rsi
	leaq	L_.str.3(%rip), %rdi
	callq	_strcmp
	cmpl	$0, %eax
	jne	LBB0_158
## %bb.157:
	movq	-504(%rbp), %rax
	movq	-600(%rbp), %rcx
	movq	(%rcx), %rcx
	movslq	-608(%rbp), %rdx
	movq	%rax, (%rcx,%rdx,8)
	movq	-504(%rbp), %rax
	movq	-600(%rbp), %rcx
	movq	%rax, 56(%rcx)
	jmp	LBB0_160
LBB0_158:                               ##   in Loop: Header=BB0_155 Depth=1
	jmp	LBB0_159
LBB0_159:                               ##   in Loop: Header=BB0_155 Depth=1
	movl	-608(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -608(%rbp)
	jmp	LBB0_155
LBB0_160:
	jmp	LBB0_161
LBB0_161:
	jmp	LBB0_162
LBB0_162:
	jmp	LBB0_231
LBB0_163:
	movq	-128(%rbp), %rax
	movq	32(%rax), %rcx
	movq	%rcx, %rdx
	addq	$-8, %rdx
	movq	%rdx, 32(%rax)
	movq	-8(%rcx), %rax
	movq	%rax, -616(%rbp)
	movq	-128(%rbp), %rax
	movq	32(%rax), %rcx
	movq	%rcx, %rdx
	addq	$-8, %rdx
	movq	%rdx, 32(%rax)
	movq	-8(%rcx), %rax
	movq	%rax, -624(%rbp)
	movq	-616(%rbp), %rax
	movq	(%rax), %rax
	movq	168(%rax), %rax
	movq	-616(%rbp), %rdi
	movq	-624(%rbp), %rsi
	callq	*%rax
	movq	-128(%rbp), %rcx
	movq	32(%rcx), %rdx
	movq	%rdx, %rsi
	addq	$8, %rsi
	movq	%rsi, 32(%rcx)
	movq	%rax, (%rdx)
	jmp	LBB0_231
LBB0_164:
	movq	-128(%rbp), %rax
	movq	32(%rax), %rcx
	movq	%rcx, %rdx
	addq	$-8, %rdx
	movq	%rdx, 32(%rax)
	movq	-8(%rcx), %rax
	movq	%rax, -632(%rbp)
	movq	-128(%rbp), %rax
	movq	32(%rax), %rcx
	movq	%rcx, %rdx
	addq	$-8, %rdx
	movq	%rdx, 32(%rax)
	movq	-8(%rcx), %rax
	movq	%rax, -640(%rbp)
	movq	-128(%rbp), %rax
	movq	32(%rax), %rcx
	movq	%rcx, %rdx
	addq	$-8, %rdx
	movq	%rdx, 32(%rax)
	movq	-8(%rcx), %rax
	movq	%rax, -648(%rbp)
	cmpq	$0, -632(%rbp)
	je	LBB0_166
## %bb.165:
	movq	-632(%rbp), %rax
	movq	(%rax), %rax
	movq	176(%rax), %rax
	movq	-632(%rbp), %rdi
	movq	-640(%rbp), %rsi
	movq	-648(%rbp), %rdx
	callq	*%rax
LBB0_166:
	movq	-136(%rbp), %rax
	cmpl	$-1, 4(%rax)
	jne	LBB0_168
## %bb.167:
	movq	-632(%rbp), %rax
	movq	-128(%rbp), %rcx
	movq	32(%rcx), %rdx
	movq	%rdx, %rsi
	addq	$8, %rsi
	movq	%rsi, 32(%rcx)
	movq	%rax, (%rdx)
LBB0_168:
	jmp	LBB0_231
LBB0_169:
	jmp	LBB0_231
LBB0_170:
	jmp	LBB0_231
LBB0_171:
	movq	-128(%rbp), %rax
	movq	32(%rax), %rcx
	movq	%rcx, %rdx
	addq	$-8, %rdx
	movq	%rdx, 32(%rax)
	movq	-8(%rcx), %rax
	movq	%rax, -656(%rbp)
	movq	-128(%rbp), %rax
	movq	32(%rax), %rcx
	movq	%rcx, %rdx
	addq	$-8, %rdx
	movq	%rdx, 32(%rax)
	movq	-8(%rcx), %rax
	movq	%rax, -664(%rbp)
	movq	-664(%rbp), %rax
	movq	(%rax), %rax
	movq	96(%rax), %rax
	movq	-664(%rbp), %rdi
	movq	-656(%rbp), %rsi
	callq	*%rax
	movb	%al, -665(%rbp)
	movsbq	-665(%rbp), %rdi
	callq	_boolfromlexem
	movq	-128(%rbp), %rcx
	movq	32(%rcx), %rdx
	movq	%rdx, %rsi
	addq	$8, %rsi
	movq	%rsi, 32(%rcx)
	movq	%rax, (%rdx)
	jmp	LBB0_231
LBB0_172:
	movq	-128(%rbp), %rax
	movq	32(%rax), %rcx
	movq	%rcx, %rdx
	addq	$-8, %rdx
	movq	%rdx, 32(%rax)
	movq	-8(%rcx), %rax
	movq	%rax, -680(%rbp)
	movq	-128(%rbp), %rax
	movq	32(%rax), %rcx
	movq	%rcx, %rdx
	addq	$-8, %rdx
	movq	%rdx, 32(%rax)
	movq	-8(%rcx), %rax
	movq	%rax, -688(%rbp)
	cmpq	$0, -688(%rbp)
	je	LBB0_174
## %bb.173:
	movq	-688(%rbp), %rax
	movq	(%rax), %rax
	cmpq	$0, 112(%rax)
	jne	LBB0_175
LBB0_174:
	movq	-128(%rbp), %rax
	movq	32(%rax), %rcx
	movq	%rcx, %rdx
	addq	$8, %rdx
	movq	%rdx, 32(%rax)
	movq	$0, (%rcx)
	jmp	LBB0_231
LBB0_175:
	movq	-688(%rbp), %rax
	movq	(%rax), %rax
	movq	112(%rax), %rax
	movq	-688(%rbp), %rdi
	movq	-680(%rbp), %rsi
	callq	*%rax
	movb	%al, -689(%rbp)
	movsbq	-689(%rbp), %rdi
	callq	_boolfromlexem
	movq	-128(%rbp), %rsi
	movq	32(%rsi), %rdi
	movq	%rdi, %rcx
	addq	$8, %rcx
	movq	%rcx, 32(%rsi)
	movq	%rax, (%rdi)
	jmp	LBB0_231
LBB0_176:
	movq	-128(%rbp), %rax
	movq	32(%rax), %rcx
	movq	%rcx, %rdx
	addq	$-8, %rdx
	movq	%rdx, 32(%rax)
	movq	-8(%rcx), %rax
	movq	%rax, -704(%rbp)
	movq	-128(%rbp), %rax
	movq	32(%rax), %rcx
	movq	%rcx, %rdx
	addq	$-8, %rdx
	movq	%rdx, 32(%rax)
	movq	-8(%rcx), %rax
	movq	%rax, -712(%rbp)
	movq	-704(%rbp), %rax
	movq	(%rax), %rax
	movq	144(%rax), %rax
	movq	-704(%rbp), %rdi
	movq	-712(%rbp), %rsi
	callq	*%rax
	movb	%al, -713(%rbp)
	movsbq	-713(%rbp), %rdi
	callq	_boolfromlexem
	movq	-128(%rbp), %rcx
	movq	32(%rcx), %rdx
	movq	%rdx, %rsi
	addq	$8, %rsi
	movq	%rsi, 32(%rcx)
	movq	%rax, (%rdx)
	jmp	LBB0_231
LBB0_177:
	movq	_current_thread@TLVP(%rip), %rdi
	callq	*(%rdi)
	movq	(%rax), %rdi
	movq	-128(%rbp), %rax
	movq	8(%rax), %rsi
	callq	_start_coro
	movq	%rax, -728(%rbp)
	movq	-728(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -736(%rbp)
	movl	$0, -740(%rbp)
LBB0_178:                               ## =>This Inner Loop Header: Depth=1
	movl	-740(%rbp), %eax
	movq	-128(%rbp), %rcx
	movq	8(%rcx), %rcx
	cmpl	32(%rcx), %eax
	jge	LBB0_183
## %bb.179:                             ##   in Loop: Header=BB0_178 Depth=1
	movq	-128(%rbp), %rax
	movq	(%rax), %rax
	movslq	-740(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	movq	-736(%rbp), %rcx
	movq	(%rcx), %rcx
	movslq	-740(%rbp), %rdx
	movq	%rax, (%rcx,%rdx,8)
	movq	-736(%rbp), %rax
	movq	(%rax), %rax
	movslq	-740(%rbp), %rcx
	cmpq	$0, (%rax,%rcx,8)
	je	LBB0_181
## %bb.180:                             ##   in Loop: Header=BB0_178 Depth=1
	movq	-736(%rbp), %rax
	movq	(%rax), %rax
	movslq	-740(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	movl	8(%rax), %edx
	addl	$1, %edx
	movl	%edx, 8(%rax)
LBB0_181:                               ##   in Loop: Header=BB0_178 Depth=1
	jmp	LBB0_182
LBB0_182:                               ##   in Loop: Header=BB0_178 Depth=1
	movl	-740(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -740(%rbp)
	jmp	LBB0_178
LBB0_183:
	movq	-128(%rbp), %rax
	movq	16(%rax), %rax
	movq	-736(%rbp), %rcx
	movq	%rax, 16(%rcx)
	movq	-128(%rbp), %rax
	movq	16(%rax), %rax
	movq	-136(%rbp), %rcx
	movslq	4(%rcx), %rcx
	imulq	$24, %rcx, %rcx
	addq	%rcx, %rax
	movq	-736(%rbp), %rcx
	movq	%rax, 24(%rcx)
	movq	-136(%rbp), %rax
	movl	4(%rax), %edx
	movq	-128(%rbp), %rax
	movq	16(%rax), %rcx
	movslq	%edx, %rsi
	imulq	$24, %rsi, %rsi
	addq	%rsi, %rcx
	movq	%rcx, 16(%rax)
	jmp	LBB0_231
LBB0_184:
	movq	-128(%rbp), %rax
	movq	32(%rax), %rcx
	movq	%rcx, %rdx
	addq	$-8, %rdx
	movq	%rdx, 32(%rax)
	movq	-8(%rcx), %rax
	movq	%rax, -752(%rbp)
	movq	-752(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rdi
	leaq	L_.str.14(%rip), %rsi
	callq	_strcmp
	cmpl	$0, %eax
	je	LBB0_186
## %bb.185:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	movq	-752(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rdx
	leaq	L_.str.15(%rip), %rsi
	movb	$0, %al
	callq	_fprintf
	movl	%eax, -968(%rbp)        ## 4-byte Spill
	jmp	LBB0_231
LBB0_186:
	movq	-752(%rbp), %rax
	movq	%rax, -760(%rbp)
	movq	-760(%rbp), %rax
	movl	12(%rax), %ecx
	movq	-136(%rbp), %rax
	cmpl	4(%rax), %ecx
	jge	LBB0_188
## %bb.187:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	leaq	L_.str.16(%rip), %rsi
	movb	$0, %al
	callq	_fprintf
	movl	%eax, -972(%rbp)        ## 4-byte Spill
LBB0_188:
	movq	-136(%rbp), %rax
	movl	4(%rax), %ecx
	movl	%ecx, -764(%rbp)
LBB0_189:                               ## =>This Inner Loop Header: Depth=1
	cmpl	$0, -764(%rbp)
	jle	LBB0_192
## %bb.190:                             ##   in Loop: Header=BB0_189 Depth=1
	movq	-760(%rbp), %rax
	movl	-764(%rbp), %ecx
	subl	$1, %ecx
	movslq	%ecx, %rdx
	movq	16(%rax,%rdx,8), %rax
	movq	-128(%rbp), %rdx
	movq	32(%rdx), %rsi
	movq	%rsi, %rdi
	addq	$8, %rdi
	movq	%rdi, 32(%rdx)
	movq	%rax, (%rsi)
## %bb.191:                             ##   in Loop: Header=BB0_189 Depth=1
	movl	-764(%rbp), %eax
	addl	$-1, %eax
	movl	%eax, -764(%rbp)
	jmp	LBB0_189
LBB0_192:
	jmp	LBB0_231
LBB0_193:
	xorl	%esi, %esi
	movq	-128(%rbp), %rax
	movq	32(%rax), %rcx
	movq	%rcx, %rdx
	addq	$-8, %rdx
	movq	%rdx, 32(%rax)
	movq	-8(%rcx), %rax
	movq	24(%rax), %rax
	movq	%rax, -776(%rbp)
	movq	-776(%rbp), %rdi
	callq	_access
	cmpl	$-1, %eax
	jne	LBB0_195
## %bb.194:
	xorl	%esi, %esi
	movl	$100, %eax
	movl	%eax, %edx
	leaq	-112(%rbp), %rdi
	movq	-776(%rbp), %r8
	leaq	L_.str.17(%rip), %rcx
	movb	$0, %al
	callq	___sprintf_chk
	leaq	-112(%rbp), %rcx
	movq	%rcx, -776(%rbp)
	movl	%eax, -976(%rbp)        ## 4-byte Spill
LBB0_195:
	movq	-776(%rbp), %rdi
	leaq	L_.str.18(%rip), %rsi
	callq	_strstr
	cmpq	$0, %rax
	je	LBB0_197
## %bb.196:
	movq	-776(%rbp), %rdi
	callq	_file_to_fo
	movq	%rax, -784(%rbp)
	movq	-784(%rbp), %rdi
	movq	-128(%rbp), %rax
	movq	88(%rax), %rsi
	callq	_init_context
	movq	%rax, -792(%rbp)
	movq	-792(%rbp), %rax
	movl	$1, 96(%rax)
	jmp	LBB0_198
LBB0_197:
	movq	-776(%rbp), %rdi
	callq	_import_module
	movq	-128(%rbp), %rdi
	movq	32(%rdi), %rcx
	movq	%rcx, %rdx
	addq	$8, %rdx
	movq	%rdx, 32(%rdi)
	movq	%rax, (%rcx)
LBB0_198:
	jmp	LBB0_231
LBB0_199:
	movq	-128(%rbp), %rax
	movq	32(%rax), %rcx
	movq	%rcx, %rdx
	addq	$-8, %rdx
	movq	%rdx, 32(%rax)
	movq	-8(%rcx), %rax
	movq	%rax, -800(%rbp)
	movq	-128(%rbp), %rax
	movq	32(%rax), %rcx
	movq	%rcx, %rdx
	addq	$-8, %rdx
	movq	%rdx, 32(%rax)
	movq	-8(%rcx), %rax
	movq	%rax, -808(%rbp)
	cmpq	$0, -808(%rbp)
	je	LBB0_208
## %bb.200:
	movq	-808(%rbp), %rax
	movq	(%rax), %rax
	cmpq	$0, 64(%rax)
	je	LBB0_208
## %bb.201:
	movq	-808(%rbp), %rax
	movq	(%rax), %rax
	movq	64(%rax), %rax
	movq	-808(%rbp), %rdi
	movq	-800(%rbp), %rsi
	callq	*%rax
	movq	%rax, -816(%rbp)
	movq	-816(%rbp), %rax
	cmpq	-808(%rbp), %rax
	je	LBB0_207
## %bb.202:
	cmpq	$0, -816(%rbp)
	je	LBB0_204
## %bb.203:
	movq	-816(%rbp), %rax
	movl	8(%rax), %ecx
	addl	$1, %ecx
	movl	%ecx, 8(%rax)
LBB0_204:
	movq	-128(%rbp), %rax
	movq	(%rax), %rax
	movq	-136(%rbp), %rcx
	movslq	4(%rcx), %rcx
	movq	(%rax,%rcx,8), %rax
	movl	8(%rax), %edx
	addl	$-1, %edx
	movl	%edx, 8(%rax)
	cmpl	$0, %edx
	jne	LBB0_206
## %bb.205:
	movq	-128(%rbp), %rax
	movq	(%rax), %rax
	movq	-136(%rbp), %rcx
	movslq	4(%rcx), %rcx
	movq	(%rax,%rcx,8), %rdi
	callq	_ob_dealloc
LBB0_206:
	movq	-816(%rbp), %rax
	movq	-128(%rbp), %rcx
	movq	(%rcx), %rcx
	movq	-136(%rbp), %rdx
	movslq	4(%rdx), %rdx
	movq	%rax, (%rcx,%rdx,8)
LBB0_207:
	jmp	LBB0_209
LBB0_208:
	jmp	LBB0_209
LBB0_209:
	jmp	LBB0_231
LBB0_210:
	callq	_new_ob
	movq	-128(%rbp), %rcx
	movq	%rax, 56(%rcx)
	movl	$0, -820(%rbp)
LBB0_211:                               ## =>This Inner Loop Header: Depth=1
	movl	-820(%rbp), %eax
	movq	-128(%rbp), %rcx
	movq	8(%rcx), %rcx
	cmpl	32(%rcx), %eax
	jge	LBB0_214
## %bb.212:                             ##   in Loop: Header=BB0_211 Depth=1
	movq	-128(%rbp), %rax
	movq	56(%rax), %rdi
	movq	-128(%rbp), %rax
	movq	8(%rax), %rax
	movq	16(%rax), %rax
	movslq	-820(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	movq	%rdi, -984(%rbp)        ## 8-byte Spill
	movq	%rax, %rdi
	callq	_strfromchar
	movq	-128(%rbp), %rcx
	movq	(%rcx), %rcx
	movslq	-820(%rbp), %rdi
	movq	(%rcx,%rdi,8), %rdx
	movq	-984(%rbp), %rdi        ## 8-byte Reload
	movq	%rax, %rsi
	callq	_ob_subscr_set
## %bb.213:                             ##   in Loop: Header=BB0_211 Depth=1
	movl	-820(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -820(%rbp)
	jmp	LBB0_211
LBB0_214:
	jmp	LBB0_231
LBB0_215:
	movq	-128(%rbp), %rax
	movq	32(%rax), %rcx
	movq	%rcx, %rdx
	addq	$-8, %rdx
	movq	%rdx, 32(%rax)
	movq	-8(%rcx), %rax
	movq	%rax, -832(%rbp)
	movq	-128(%rbp), %rax
	movq	32(%rax), %rax
	movq	(%rax), %rax
	movq	%rax, -840(%rbp)
	cmpq	$0, -840(%rbp)
	je	LBB0_218
## %bb.216:
	movq	-840(%rbp), %rax
	movq	(%rax), %rax
	cmpq	$0, 128(%rax)
	je	LBB0_218
## %bb.217:
	movq	-840(%rbp), %rax
	movq	(%rax), %rax
	movq	128(%rax), %rax
	movq	-840(%rbp), %rdi
	movq	-832(%rbp), %rsi
	callq	*%rax
	movsbq	%al, %rdi
	callq	_boolfromlexem
	movq	-128(%rbp), %rsi
	movq	32(%rsi), %rsi
	movq	%rax, (%rsi)
	jmp	LBB0_219
LBB0_218:
	movq	-128(%rbp), %rax
	movq	32(%rax), %rax
	movq	$0, (%rax)
LBB0_219:
	jmp	LBB0_231
LBB0_220:
	movq	-128(%rbp), %rax
	movq	32(%rax), %rcx
	movq	%rcx, %rdx
	addq	$-8, %rdx
	movq	%rdx, 32(%rax)
	movq	-8(%rcx), %rax
	movq	%rax, -848(%rbp)
	movq	-128(%rbp), %rax
	movq	32(%rax), %rax
	movq	(%rax), %rax
	movq	%rax, -856(%rbp)
	cmpq	$0, -856(%rbp)
	je	LBB0_223
## %bb.221:
	movq	-856(%rbp), %rax
	movq	(%rax), %rax
	cmpq	$0, 120(%rax)
	je	LBB0_223
## %bb.222:
	movq	-856(%rbp), %rax
	movq	(%rax), %rax
	movq	120(%rax), %rax
	movq	-856(%rbp), %rdi
	movq	-848(%rbp), %rsi
	callq	*%rax
	movsbq	%al, %rdi
	callq	_boolfromlexem
	movq	-128(%rbp), %rsi
	movq	32(%rsi), %rsi
	movq	%rax, (%rsi)
	jmp	LBB0_224
LBB0_223:
	movq	-128(%rbp), %rax
	movq	32(%rax), %rax
	movq	$0, (%rax)
LBB0_224:
	jmp	LBB0_231
LBB0_225:
	movq	-128(%rbp), %rax
	movq	32(%rax), %rcx
	movq	%rcx, %rdx
	addq	$-8, %rdx
	movq	%rdx, 32(%rax)
	movq	-8(%rcx), %rax
	movq	%rax, -864(%rbp)
	movq	-128(%rbp), %rax
	movq	32(%rax), %rax
	movq	(%rax), %rax
	movq	%rax, -872(%rbp)
	cmpq	$0, -872(%rbp)
	je	LBB0_228
## %bb.226:
	movq	-872(%rbp), %rax
	movq	(%rax), %rax
	cmpq	$0, 104(%rax)
	je	LBB0_228
## %bb.227:
	movq	-872(%rbp), %rax
	movq	(%rax), %rax
	movq	104(%rax), %rax
	movq	-872(%rbp), %rdi
	movq	-864(%rbp), %rsi
	callq	*%rax
	movsbq	%al, %rdi
	callq	_boolfromlexem
	movq	-128(%rbp), %rsi
	movq	32(%rsi), %rsi
	movq	%rax, (%rsi)
	jmp	LBB0_229
LBB0_228:
	movq	-128(%rbp), %rax
	movq	32(%rax), %rax
	movq	$0, (%rax)
LBB0_229:
	jmp	LBB0_231
LBB0_230:
	jmp	LBB0_231
LBB0_231:
	movq	-128(%rbp), %rax
	movq	16(%rax), %rax
	movq	-128(%rbp), %rcx
	cmpq	24(%rcx), %rax
	jb	LBB0_237
## %bb.232:
	movq	-128(%rbp), %rax
	cmpq	$0, 64(%rax)
	je	LBB0_234
## %bb.233:
	movq	-128(%rbp), %rax
	movq	64(%rax), %rax
	movq	24(%rax), %rax
	movq	-128(%rbp), %rcx
	movq	%rax, 16(%rcx)
	movq	-128(%rbp), %rax
	movq	8(%rax), %rax
	movq	80(%rax), %rax
	movq	-128(%rbp), %rcx
	movq	8(%rcx), %rcx
	movslq	52(%rcx), %rcx
	imulq	$24, %rcx, %rcx
	addq	%rcx, %rax
	movq	-128(%rbp), %rcx
	movq	%rax, 24(%rcx)
	movq	-128(%rbp), %rax
	movq	$0, 64(%rax)
	movl	$0, -116(%rbp)
	jmp	LBB0_238
LBB0_234:
	movq	-128(%rbp), %rax
	cmpq	$0, 72(%rax)
	je	LBB0_236
## %bb.235:
	movq	-128(%rbp), %rax
	movq	56(%rax), %rax
	movq	-128(%rbp), %rcx
	movq	72(%rcx), %rcx
	movq	32(%rcx), %rdx
	movq	%rdx, %rsi
	addq	$8, %rsi
	movq	%rsi, 32(%rcx)
	movq	%rax, (%rdx)
LBB0_236:
	movl	$1, -116(%rbp)
	jmp	LBB0_238
LBB0_237:
	movl	$0, -116(%rbp)
LBB0_238:
	movl	-116(%rbp), %eax
	movq	___stack_chk_guard@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rcx
	movq	-8(%rbp), %rdx
	cmpq	%rdx, %rcx
	movl	%eax, -988(%rbp)        ## 4-byte Spill
	jne	LBB0_240
## %bb.239:
	movl	-988(%rbp), %eax        ## 4-byte Reload
	addq	$992, %rsp              ## imm = 0x3E0
	popq	%rbp
	retq
LBB0_240:
	callq	___stack_chk_fail
	ud2
	.cfi_endproc
	.p2align	2, 0x90
	.data_region jt32
.set L0_0_set_32, LBB0_32-LJTI0_0
.set L0_0_set_11, LBB0_11-LJTI0_0
.set L0_0_set_10, LBB0_10-LJTI0_0
.set L0_0_set_3, LBB0_3-LJTI0_0
.set L0_0_set_163, LBB0_163-LJTI0_0
.set L0_0_set_164, LBB0_164-LJTI0_0
.set L0_0_set_28, LBB0_28-LJTI0_0
.set L0_0_set_21, LBB0_21-LJTI0_0
.set L0_0_set_102, LBB0_102-LJTI0_0
.set L0_0_set_101, LBB0_101-LJTI0_0
.set L0_0_set_96, LBB0_96-LJTI0_0
.set L0_0_set_91, LBB0_91-LJTI0_0
.set L0_0_set_97, LBB0_97-LJTI0_0
.set L0_0_set_40, LBB0_40-LJTI0_0
.set L0_0_set_100, LBB0_100-LJTI0_0
.set L0_0_set_177, LBB0_177-LJTI0_0
.set L0_0_set_15, LBB0_15-LJTI0_0
.set L0_0_set_119, LBB0_119-LJTI0_0
.set L0_0_set_170, LBB0_170-LJTI0_0
.set L0_0_set_29, LBB0_29-LJTI0_0
.set L0_0_set_103, LBB0_103-LJTI0_0
.set L0_0_set_107, LBB0_107-LJTI0_0
.set L0_0_set_111, LBB0_111-LJTI0_0
.set L0_0_set_115, LBB0_115-LJTI0_0
.set L0_0_set_199, LBB0_199-LJTI0_0
.set L0_0_set_230, LBB0_230-LJTI0_0
.set L0_0_set_171, LBB0_171-LJTI0_0
.set L0_0_set_225, LBB0_225-LJTI0_0
.set L0_0_set_172, LBB0_172-LJTI0_0
.set L0_0_set_220, LBB0_220-LJTI0_0
.set L0_0_set_215, LBB0_215-LJTI0_0
.set L0_0_set_169, LBB0_169-LJTI0_0
.set L0_0_set_193, LBB0_193-LJTI0_0
.set L0_0_set_176, LBB0_176-LJTI0_0
.set L0_0_set_184, LBB0_184-LJTI0_0
.set L0_0_set_210, LBB0_210-LJTI0_0
LJTI0_0:
	.long	L0_0_set_32
	.long	L0_0_set_11
	.long	L0_0_set_10
	.long	L0_0_set_3
	.long	L0_0_set_163
	.long	L0_0_set_164
	.long	L0_0_set_28
	.long	L0_0_set_21
	.long	L0_0_set_102
	.long	L0_0_set_101
	.long	L0_0_set_96
	.long	L0_0_set_91
	.long	L0_0_set_97
	.long	L0_0_set_40
	.long	L0_0_set_100
	.long	L0_0_set_177
	.long	L0_0_set_15
	.long	L0_0_set_119
	.long	L0_0_set_170
	.long	L0_0_set_29
	.long	L0_0_set_103
	.long	L0_0_set_107
	.long	L0_0_set_111
	.long	L0_0_set_115
	.long	L0_0_set_199
	.long	L0_0_set_230
	.long	L0_0_set_230
	.long	L0_0_set_230
	.long	L0_0_set_171
	.long	L0_0_set_225
	.long	L0_0_set_172
	.long	L0_0_set_220
	.long	L0_0_set_215
	.long	L0_0_set_169
	.long	L0_0_set_230
	.long	L0_0_set_193
	.long	L0_0_set_176
	.long	L0_0_set_184
	.long	L0_0_set_230
	.long	L0_0_set_210
	.end_data_region
                                        ## -- End function
	.globl	_init_context           ## -- Begin function init_context
	.p2align	4, 0x90
_init_context:                          ## @init_context
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movl	$104, %eax
	movl	%eax, %ecx
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rcx, %rdi
	callq	_dulalloc
	movq	%rax, -24(%rbp)
	callq	_new_IOchannel
	movl	$16000, %edx            ## imm = 0x3E80
	movl	%edx, %edi
	movq	-24(%rbp), %rcx
	movq	%rax, 80(%rcx)
	movq	-8(%rbp), %rax
	movq	-24(%rbp), %rcx
	movq	%rax, 8(%rcx)
	callq	_dulalloc
	movq	-24(%rbp), %rcx
	movq	%rax, 32(%rcx)
	movq	-24(%rbp), %rax
	movq	32(%rax), %rax
	movq	-24(%rbp), %rcx
	movq	%rax, 40(%rcx)
	movq	-8(%rbp), %rax
	movq	80(%rax), %rax
	movq	-24(%rbp), %rcx
	movq	%rax, 16(%rcx)
	cmpq	$0, -16(%rbp)
	je	LBB1_2
## %bb.1:
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	-24(%rbp), %rcx
	movq	%rax, 72(%rcx)
	jmp	LBB1_3
LBB1_2:
	movq	-24(%rbp), %rax
	movq	$0, 72(%rax)
LBB1_3:
	movq	-24(%rbp), %rax
	movq	$0, 64(%rax)
	movq	-16(%rbp), %rax
	movq	-24(%rbp), %rcx
	movq	%rax, 88(%rcx)
	movq	-8(%rbp), %rax
	movl	52(%rax), %edx
	movq	-8(%rbp), %rax
	movq	80(%rax), %rax
	movslq	%edx, %rcx
	imulq	$24, %rcx, %rcx
	addq	%rcx, %rax
	movq	-24(%rbp), %rcx
	movq	%rax, 24(%rcx)
	movq	-24(%rbp), %rax
	movq	$0, 56(%rax)
	movq	-8(%rbp), %rax
	movslq	32(%rax), %rax
	shlq	$3, %rax
	movq	%rax, %rdi
	callq	_dulalloc
	movq	-24(%rbp), %rcx
	movq	%rax, (%rcx)
	movl	$0, -28(%rbp)
LBB1_4:                                 ## =>This Inner Loop Header: Depth=1
	movl	-28(%rbp), %eax
	movq	-8(%rbp), %rcx
	cmpl	32(%rcx), %eax
	jge	LBB1_7
## %bb.5:                               ##   in Loop: Header=BB1_4 Depth=1
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movslq	-28(%rbp), %rcx
	movq	$0, (%rax,%rcx,8)
## %bb.6:                               ##   in Loop: Header=BB1_4 Depth=1
	movl	-28(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -28(%rbp)
	jmp	LBB1_4
LBB1_7:
	movq	-24(%rbp), %rdi
	callq	_eval_std
	cmpq	$0, -16(%rbp)
	je	LBB1_9
## %bb.8:
	movq	-24(%rbp), %rax
	movq	-16(%rbp), %rcx
	movq	%rax, 16(%rcx)
LBB1_9:
	movq	-24(%rbp), %rax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_flush_writer           ## -- Begin function flush_writer
	.p2align	4, 0x90
_flush_writer:                          ## @flush_writer
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$80, %rsp
	movq	%rsi, -16(%rbp)
	movl	%edx, -8(%rbp)
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rsi
	movq	%rsi, -32(%rbp)
	movq	-32(%rbp), %rsi
	cmpq	$0, 48(%rsi)
	jne	LBB2_2
## %bb.1:
	movq	___stdoutp@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	-32(%rbp), %rcx
	movq	%rax, 48(%rcx)
LBB2_2:
	movq	-32(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -40(%rbp)
LBB2_3:                                 ## =>This Inner Loop Header: Depth=1
	movq	-40(%rbp), %rax
	movq	-32(%rbp), %rcx
	cmpq	24(%rcx), %rax
	je	LBB2_12
## %bb.4:                               ##   in Loop: Header=BB2_3 Depth=1
	movq	-40(%rbp), %rax
	cmpq	$0, (%rax)
	je	LBB2_9
## %bb.5:                               ##   in Loop: Header=BB2_3 Depth=1
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	cmpq	$0, 8(%rax)
	je	LBB2_7
## %bb.6:                               ##   in Loop: Header=BB2_3 Depth=1
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	movq	-40(%rbp), %rcx
	movq	(%rcx), %rdi
	callq	*%rax
	movq	%rax, -48(%rbp)
	movq	-32(%rbp), %rax
	movq	48(%rax), %rdi
	movq	-48(%rbp), %rdx
	leaq	L_.str.19(%rip), %rsi
	movb	$0, %al
	callq	_fprintf
	movq	-48(%rbp), %rdi
	movl	%eax, -52(%rbp)         ## 4-byte Spill
	callq	_free
	jmp	LBB2_8
LBB2_7:                                 ##   in Loop: Header=BB2_3 Depth=1
	movq	-32(%rbp), %rax
	movq	48(%rax), %rdi
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	(%rax), %rdx
	movq	-40(%rbp), %rax
	movq	(%rax), %rcx
	leaq	L_.str.20(%rip), %rsi
	movb	$0, %al
	callq	_fprintf
	movl	%eax, -56(%rbp)         ## 4-byte Spill
LBB2_8:                                 ##   in Loop: Header=BB2_3 Depth=1
	jmp	LBB2_10
LBB2_9:                                 ##   in Loop: Header=BB2_3 Depth=1
	movq	-32(%rbp), %rax
	movq	48(%rax), %rdi
	leaq	L_.str.21(%rip), %rsi
	movb	$0, %al
	callq	_fprintf
	movl	%eax, -60(%rbp)         ## 4-byte Spill
LBB2_10:                                ##   in Loop: Header=BB2_3 Depth=1
	movq	-32(%rbp), %rax
	movq	48(%rax), %rsi
	movl	$32, %edi
	callq	_fputc
	movl	%eax, -64(%rbp)         ## 4-byte Spill
## %bb.11:                              ##   in Loop: Header=BB2_3 Depth=1
	movq	-40(%rbp), %rax
	addq	$8, %rax
	movq	%rax, -40(%rbp)
	jmp	LBB2_3
LBB2_12:
	movq	-32(%rbp), %rax
	movq	48(%rax), %rsi
	movl	$10, %edi
	callq	_fputc
	movq	-32(%rbp), %rsi
	movq	16(%rsi), %rsi
	movq	-32(%rbp), %rcx
	movq	%rsi, 24(%rcx)
	movq	-32(%rbp), %rcx
	movq	48(%rcx), %rdi
	movl	%eax, -68(%rbp)         ## 4-byte Spill
	callq	_fflush
	xorl	%edx, %edx
	movl	%edx, %ecx
	movl	%eax, -72(%rbp)         ## 4-byte Spill
	movq	%rcx, %rax
	addq	$80, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_new_IOchannel          ## -- Begin function new_IOchannel
	.p2align	4, 0x90
_new_IOchannel:                         ## @new_IOchannel
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	$56, %eax
	movl	%eax, %edi
	callq	_malloc
	movl	$120, %ecx
	movl	%ecx, %edi
	movq	_CHANTYPE@GOTPCREL(%rip), %rdx
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	$1, 8(%rax)
	movq	-8(%rbp), %rax
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	movl	$15, 32(%rax)
	callq	_malloc
	movq	_output@GOTPCREL(%rip), %rdx
	leaq	_flush(%rip), %rdi
	movq	-8(%rbp), %rsi
	movq	%rax, 16(%rsi)
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	-8(%rbp), %rsi
	movq	%rax, 24(%rsi)
	movq	-8(%rbp), %rax
	movq	%rdi, 40(%rax)
	movq	(%rdx), %rax
	movq	-8(%rbp), %rdx
	movq	%rax, 48(%rdx)
	movq	-8(%rbp), %rax
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_destroy_context        ## -- Begin function destroy_context
	.p2align	4, 0x90
_destroy_context:                       ## @destroy_context
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
	cmpl	$0, 96(%rdi)
	jne	LBB4_14
## %bb.1:
	movl	$0, -12(%rbp)
LBB4_2:                                 ## =>This Inner Loop Header: Depth=1
	movl	-12(%rbp), %eax
	movq	-8(%rbp), %rcx
	movq	8(%rcx), %rcx
	cmpl	32(%rcx), %eax
	jge	LBB4_7
## %bb.3:                               ##   in Loop: Header=BB4_2 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movslq	-12(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	movl	8(%rax), %edx
	addl	$-1, %edx
	movl	%edx, 8(%rax)
	cmpl	$0, %edx
	jne	LBB4_5
## %bb.4:                               ##   in Loop: Header=BB4_2 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movslq	-12(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdi
	callq	_ob_dealloc
LBB4_5:                                 ##   in Loop: Header=BB4_2 Depth=1
	jmp	LBB4_6
LBB4_6:                                 ##   in Loop: Header=BB4_2 Depth=1
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	jmp	LBB4_2
LBB4_7:
	movq	-8(%rbp), %rax
	movq	40(%rax), %rax
	movq	%rax, -24(%rbp)
LBB4_8:                                 ## =>This Inner Loop Header: Depth=1
	movq	-24(%rbp), %rax
	movq	-8(%rbp), %rcx
	cmpq	32(%rcx), %rax
	je	LBB4_13
## %bb.9:                               ##   in Loop: Header=BB4_8 Depth=1
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movl	8(%rax), %ecx
	addl	$-1, %ecx
	movl	%ecx, 8(%rax)
	cmpl	$0, %ecx
	jne	LBB4_11
## %bb.10:                              ##   in Loop: Header=BB4_8 Depth=1
	movq	-24(%rbp), %rax
	movq	(%rax), %rdi
	callq	_ob_dealloc
LBB4_11:                                ##   in Loop: Header=BB4_8 Depth=1
	jmp	LBB4_12
LBB4_12:                                ##   in Loop: Header=BB4_8 Depth=1
	movq	-24(%rbp), %rax
	addq	$8, %rax
	movq	%rax, -24(%rbp)
	jmp	LBB4_8
LBB4_13:
	movq	-8(%rbp), %rax
	movq	40(%rax), %rax
	movq	%rax, %rdi
	callq	_free
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	callq	_free
	movq	-8(%rbp), %rax
	movq	80(%rax), %rax
	movq	%rax, %rdi
	callq	_ob_dealloc
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	callq	_free
LBB4_14:
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_link_async             ## -- Begin function link_async
	.p2align	4, 0x90
_link_async:                            ## @link_async
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movl	$32, %eax
	movl	%eax, %edi
	callq	_dulalloc
	movq	%rax, -16(%rbp)
	movq	_current_thread@TLVP(%rip), %rdi
	callq	*(%rdi)
	movq	(%rax), %rdi
	movq	80(%rdi), %rdi
	movq	%rdi, -24(%rbp)
	movq	(%rax), %rdi
	movq	80(%rdi), %rdi
	movq	(%rdi), %rdi
	movq	%rdi, -32(%rbp)
	movq	-32(%rbp), %rdi
	movq	-16(%rbp), %rcx
	movq	%rdi, (%rcx)
	movq	-16(%rbp), %rcx
	movq	-32(%rbp), %rdi
	movq	%rcx, 8(%rdi)
	movq	-24(%rbp), %rcx
	movq	-16(%rbp), %rdi
	movq	%rcx, 8(%rdi)
	movq	-16(%rbp), %rcx
	movq	-24(%rbp), %rdi
	movq	%rcx, (%rdi)
	movq	(%rax), %rax
	movl	(%rax), %edx
	addl	$1, %edx
	movl	%edx, (%rax)
	movq	-16(%rbp), %rax
	movl	$2, 24(%rax)
	movq	-8(%rbp), %rax
	movq	-16(%rbp), %rcx
	movq	%rax, 16(%rcx)
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"null\n"

L_.str.1:                               ## @.str.1
	.asciz	"null pointer exception: cannot invoke a nulled object\n"

L_.str.2:                               ## @.str.2
	.asciz	"in function %d parameter passed but %d expected\n"

L_.str.3:                               ## @.str.3
	.asciz	"this"

L_.str.4:                               ## @.str.4
	.asciz	"object"

L_.str.5:                               ## @.str.5
	.asciz	"cannot add to %s type\n"

L_.str.6:                               ## @.str.6
	.asciz	"cannot sub from %s type\n"

L_.str.7:                               ## @.str.7
	.asciz	"cannot mult %s type\n"

L_.str.8:                               ## @.str.8
	.asciz	"cannot div %s type\n"

L_.str.9:                               ## @.str.9
	.asciz	"string"

L_.str.10:                              ## @.str.10
	.asciz	"builtin"

L_.str.11:                              ## @.str.11
	.asciz	"functional object"

L_.str.12:                              ## @.str.12
	.asciz	"cannot invoke method of not string type: %s\n"

L_.str.13:                              ## @.str.13
	.asciz	"cannot invoke method of expression type %s"

L_.str.14:                              ## @.str.14
	.asciz	"bundle"

L_.str.15:                              ## @.str.15
	.asciz	"cannot unpack type %s: bundle required\n"

L_.str.16:                              ## @.str.16
	.asciz	"too many items to unpack\n"

L_.str.17:                              ## @.str.17
	.asciz	"DLIB/%s"

L_.str.18:                              ## @.str.18
	.asciz	".dul"

L_.str.19:                              ## @.str.19
	.asciz	"%s"

L_.str.20:                              ## @.str.20
	.asciz	"%s at %lX"

L_.str.21:                              ## @.str.21
	.asciz	"null"

	.section	__DATA,__data
	.globl	_flush                  ## @flush
	.p2align	3
_flush:
	.quad	_BINTYPE
	.long	1                       ## 0x1
	.space	4
	.quad	_flush_writer


.subsections_via_symbols
