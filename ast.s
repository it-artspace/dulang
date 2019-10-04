	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 14	sdk_version 10, 14
	.globl	_astnode_emplace_va     ## -- Begin function astnode_emplace_va
	.p2align	4, 0x90
_astnode_emplace_va:                    ## @astnode_emplace_va
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
	movl	%edx, -20(%rbp)
	movl	%ecx, -24(%rbp)
	movl	%r8d, -28(%rbp)
	movq	%r9, -40(%rbp)
	movl	-28(%rbp), %ecx
	cmpl	-24(%rbp), %ecx
	jle	LBB0_2
## %bb.1:
	movl	-28(%rbp), %eax
	movl	%eax, -24(%rbp)
LBB0_2:
	cmpl	$0, -24(%rbp)
	jne	LBB0_4
## %bb.3:
	movl	$1, -24(%rbp)
LBB0_4:
	movl	-20(%rbp), %eax
	movq	-16(%rbp), %rcx
	movl	%eax, 8(%rcx)
	movl	-24(%rbp), %eax
	movq	-16(%rbp), %rcx
	movl	%eax, 4(%rcx)
	movslq	-24(%rbp), %rcx
	shlq	$3, %rcx
	movq	%rcx, %rdi
	callq	_dulalloc
	movq	-16(%rbp), %rcx
	movq	%rax, 16(%rcx)
	movl	-28(%rbp), %edx
	movq	-16(%rbp), %rax
	movl	%edx, (%rax)
	movq	-8(%rbp), %rax
	movq	-16(%rbp), %rcx
	movq	%rax, 24(%rcx)
	movq	-16(%rbp), %rax
	movq	$0, 32(%rax)
	movl	$0, -44(%rbp)
LBB0_5:                                 ## =>This Inner Loop Header: Depth=1
	movl	-44(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jge	LBB0_11
## %bb.6:                               ##   in Loop: Header=BB0_5 Depth=1
	movq	-40(%rbp), %rax
	movl	(%rax), %ecx
	cmpl	$40, %ecx
	movq	%rax, -56(%rbp)         ## 8-byte Spill
	movl	%ecx, -60(%rbp)         ## 4-byte Spill
	ja	LBB0_8
## %bb.7:                               ##   in Loop: Header=BB0_5 Depth=1
	movl	-60(%rbp), %eax         ## 4-byte Reload
	movslq	%eax, %rcx
	movq	-56(%rbp), %rdx         ## 8-byte Reload
	addq	16(%rdx), %rcx
	addl	$8, %eax
	movl	%eax, (%rdx)
	movq	%rcx, -72(%rbp)         ## 8-byte Spill
	jmp	LBB0_9
LBB0_8:                                 ##   in Loop: Header=BB0_5 Depth=1
	movq	-56(%rbp), %rax         ## 8-byte Reload
	movq	8(%rax), %rcx
	movq	%rcx, %rdx
	addq	$8, %rcx
	movq	%rcx, 8(%rax)
	movq	%rdx, -72(%rbp)         ## 8-byte Spill
LBB0_9:                                 ##   in Loop: Header=BB0_5 Depth=1
	movq	-72(%rbp), %rax         ## 8-byte Reload
	movq	(%rax), %rax
	movq	-16(%rbp), %rcx
	movq	16(%rcx), %rcx
	movslq	-44(%rbp), %rdx
	movq	%rax, (%rcx,%rdx,8)
## %bb.10:                              ##   in Loop: Header=BB0_5 Depth=1
	movl	-44(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -44(%rbp)
	jmp	LBB0_5
LBB0_11:
	addq	$80, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_astnode_emplace        ## -- Begin function astnode_emplace
	.p2align	4, 0x90
_astnode_emplace:                       ## @astnode_emplace
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$416, %rsp              ## imm = 0x1A0
	testb	%al, %al
	movaps	%xmm7, -256(%rbp)       ## 16-byte Spill
	movaps	%xmm6, -272(%rbp)       ## 16-byte Spill
	movaps	%xmm5, -288(%rbp)       ## 16-byte Spill
	movaps	%xmm4, -304(%rbp)       ## 16-byte Spill
	movaps	%xmm3, -320(%rbp)       ## 16-byte Spill
	movaps	%xmm2, -336(%rbp)       ## 16-byte Spill
	movaps	%xmm1, -352(%rbp)       ## 16-byte Spill
	movaps	%xmm0, -368(%rbp)       ## 16-byte Spill
	movq	%rdi, -376(%rbp)        ## 8-byte Spill
	movq	%r9, -384(%rbp)         ## 8-byte Spill
	movl	%r8d, -388(%rbp)        ## 4-byte Spill
	movl	%ecx, -392(%rbp)        ## 4-byte Spill
	movl	%edx, -396(%rbp)        ## 4-byte Spill
	movq	%rsi, -408(%rbp)        ## 8-byte Spill
	je	LBB1_4
## %bb.3:
	movaps	-368(%rbp), %xmm0       ## 16-byte Reload
	movaps	%xmm0, -192(%rbp)
	movaps	-352(%rbp), %xmm1       ## 16-byte Reload
	movaps	%xmm1, -176(%rbp)
	movaps	-336(%rbp), %xmm2       ## 16-byte Reload
	movaps	%xmm2, -160(%rbp)
	movaps	-320(%rbp), %xmm3       ## 16-byte Reload
	movaps	%xmm3, -144(%rbp)
	movaps	-304(%rbp), %xmm4       ## 16-byte Reload
	movaps	%xmm4, -128(%rbp)
	movaps	-288(%rbp), %xmm5       ## 16-byte Reload
	movaps	%xmm5, -112(%rbp)
	movaps	-272(%rbp), %xmm6       ## 16-byte Reload
	movaps	%xmm6, -96(%rbp)
	movaps	-256(%rbp), %xmm7       ## 16-byte Reload
	movaps	%xmm7, -80(%rbp)
LBB1_4:
	movq	-384(%rbp), %rax        ## 8-byte Reload
	movq	%rax, -200(%rbp)
	movl	-388(%rbp), %ecx        ## 4-byte Reload
	movl	-392(%rbp), %edx        ## 4-byte Reload
	movl	-396(%rbp), %esi        ## 4-byte Reload
	movq	-408(%rbp), %rdi        ## 8-byte Reload
	movq	-376(%rbp), %r8         ## 8-byte Reload
	leaq	-32(%rbp), %r9
	movq	___stack_chk_guard@GOTPCREL(%rip), %r10
	movq	(%r10), %r10
	movq	%r10, -8(%rbp)
	movq	%r8, -40(%rbp)
	movq	%rdi, -48(%rbp)
	movl	%esi, -52(%rbp)
	movl	%edx, -56(%rbp)
	movl	%ecx, -60(%rbp)
	movq	%r9, %rdi
	leaq	-240(%rbp), %r8
	movq	%r8, 16(%rdi)
	leaq	16(%rbp), %r8
	movq	%r8, 8(%rdi)
	movl	$48, 4(%rdi)
	movl	$40, (%rdi)
	movq	-40(%rbp), %rdi
	movq	-48(%rbp), %rsi
	movl	-52(%rbp), %edx
	movl	-56(%rbp), %ecx
	movl	-60(%rbp), %r8d
	callq	_astnode_emplace_va
	leaq	-32(%rbp), %rax
	movq	___stack_chk_guard@GOTPCREL(%rip), %rsi
	movq	(%rsi), %rsi
	movq	-8(%rbp), %rdi
	cmpq	%rdi, %rsi
	movq	%rax, -416(%rbp)        ## 8-byte Spill
	jne	LBB1_2
## %bb.1:
	addq	$416, %rsp              ## imm = 0x1A0
	popq	%rbp
	retq
LBB1_2:
	callq	___stack_chk_fail
	ud2
	.cfi_endproc
                                        ## -- End function
	.globl	_astnode_new            ## -- Begin function astnode_new
	.p2align	4, 0x90
_astnode_new:                           ## @astnode_new
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$432, %rsp              ## imm = 0x1B0
	testb	%al, %al
	movaps	%xmm7, -256(%rbp)       ## 16-byte Spill
	movaps	%xmm6, -272(%rbp)       ## 16-byte Spill
	movaps	%xmm5, -288(%rbp)       ## 16-byte Spill
	movaps	%xmm4, -304(%rbp)       ## 16-byte Spill
	movaps	%xmm3, -320(%rbp)       ## 16-byte Spill
	movaps	%xmm2, -336(%rbp)       ## 16-byte Spill
	movaps	%xmm1, -352(%rbp)       ## 16-byte Spill
	movaps	%xmm0, -368(%rbp)       ## 16-byte Spill
	movl	%edi, -372(%rbp)        ## 4-byte Spill
	movq	%r9, -384(%rbp)         ## 8-byte Spill
	movq	%r8, -392(%rbp)         ## 8-byte Spill
	movq	%rcx, -400(%rbp)        ## 8-byte Spill
	movl	%edx, -404(%rbp)        ## 4-byte Spill
	movl	%esi, -408(%rbp)        ## 4-byte Spill
	je	LBB2_4
## %bb.3:
	movaps	-368(%rbp), %xmm0       ## 16-byte Reload
	movaps	%xmm0, -192(%rbp)
	movaps	-352(%rbp), %xmm1       ## 16-byte Reload
	movaps	%xmm1, -176(%rbp)
	movaps	-336(%rbp), %xmm2       ## 16-byte Reload
	movaps	%xmm2, -160(%rbp)
	movaps	-320(%rbp), %xmm3       ## 16-byte Reload
	movaps	%xmm3, -144(%rbp)
	movaps	-304(%rbp), %xmm4       ## 16-byte Reload
	movaps	%xmm4, -128(%rbp)
	movaps	-288(%rbp), %xmm5       ## 16-byte Reload
	movaps	%xmm5, -112(%rbp)
	movaps	-272(%rbp), %xmm6       ## 16-byte Reload
	movaps	%xmm6, -96(%rbp)
	movaps	-256(%rbp), %xmm7       ## 16-byte Reload
	movaps	%xmm7, -80(%rbp)
LBB2_4:
	movq	-384(%rbp), %rax        ## 8-byte Reload
	movq	%rax, -200(%rbp)
	movq	-392(%rbp), %rcx        ## 8-byte Reload
	movq	%rcx, -208(%rbp)
	movq	-400(%rbp), %rdx        ## 8-byte Reload
	movq	%rdx, -216(%rbp)
	movl	-404(%rbp), %esi        ## 4-byte Reload
	movl	-408(%rbp), %edi        ## 4-byte Reload
	movl	-372(%rbp), %r8d        ## 4-byte Reload
	movl	$56, %r9d
	movl	%r9d, %r10d
	movq	___stack_chk_guard@GOTPCREL(%rip), %r11
	movq	(%r11), %r11
	movq	%r11, -8(%rbp)
	movl	%r8d, -36(%rbp)
	movl	%edi, -40(%rbp)
	movl	%esi, -44(%rbp)
	movq	%r10, %rdi
	callq	_dulalloc
	xorl	%esi, %esi
	movl	%esi, %edi
	leaq	-32(%rbp), %rcx
	movq	%rax, -56(%rbp)
	movq	%rcx, %rax
	leaq	-240(%rbp), %rdx
	movq	%rdx, 16(%rax)
	leaq	16(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movl	$48, 4(%rax)
	movl	$24, (%rax)
	movq	-56(%rbp), %rsi
	movl	-36(%rbp), %edx
	movl	-40(%rbp), %r8d
	movl	-44(%rbp), %r9d
	movq	%rcx, -416(%rbp)        ## 8-byte Spill
	movl	%r8d, %ecx
	movl	%r9d, %r8d
	movq	-416(%rbp), %r9         ## 8-byte Reload
	callq	_astnode_emplace_va
	leaq	-32(%rbp), %rax
	movq	-56(%rbp), %rsi
	movq	___stack_chk_guard@GOTPCREL(%rip), %rdi
	movq	(%rdi), %rdi
	movq	-8(%rbp), %r9
	cmpq	%r9, %rdi
	movq	%rax, -424(%rbp)        ## 8-byte Spill
	movq	%rsi, -432(%rbp)        ## 8-byte Spill
	jne	LBB2_2
## %bb.1:
	movq	-432(%rbp), %rax        ## 8-byte Reload
	addq	$432, %rsp              ## imm = 0x1B0
	popq	%rbp
	retq
LBB2_2:
	callq	___stack_chk_fail
	ud2
	.cfi_endproc
                                        ## -- End function
	.globl	_astnode_print          ## -- Begin function astnode_print
	.p2align	4, 0x90
_astnode_print:                         ## @astnode_print
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	xorl	%esi, %esi
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	callq	_astnode_print_impl
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_astnode_print_impl     ## -- Begin function astnode_print_impl
	.p2align	4, 0x90
_astnode_print_impl:                    ## @astnode_print_impl
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$64, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	$0, -16(%rbp)
LBB4_1:                                 ## =>This Inner Loop Header: Depth=1
	movl	-16(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jge	LBB4_4
## %bb.2:                               ##   in Loop: Header=BB4_1 Depth=1
	leaq	L_.str.42(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	%eax, -28(%rbp)         ## 4-byte Spill
## %bb.3:                               ##   in Loop: Header=BB4_1 Depth=1
	movl	-16(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -16(%rbp)
	jmp	LBB4_1
LBB4_4:
	movl	$0, -20(%rbp)
	movq	-8(%rbp), %rax
	movl	8(%rax), %ecx
	movl	%ecx, %eax
	leaq	_astnames(%rip), %rdx
	movq	(%rdx,%rax,8), %rsi
	leaq	L_.str.43(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movq	-8(%rbp), %rdx
	cmpl	$29, 8(%rdx)
	movl	%eax, -32(%rbp)         ## 4-byte Spill
	je	LBB4_7
## %bb.5:
	movq	-8(%rbp), %rax
	cmpl	$27, 8(%rax)
	je	LBB4_7
## %bb.6:
	movq	-8(%rbp), %rax
	cmpl	$19, 8(%rax)
	jne	LBB4_8
LBB4_7:
	movq	-8(%rbp), %rax
	movq	32(%rax), %rsi
	leaq	L_.str.44(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	$1, -20(%rbp)
	movl	%eax, -36(%rbp)         ## 4-byte Spill
LBB4_8:
	movq	-8(%rbp), %rax
	cmpl	$26, 8(%rax)
	jne	LBB4_10
## %bb.9:
	movq	-8(%rbp), %rax
	movq	32(%rax), %rax
	movsd	(%rax), %xmm0           ## xmm0 = mem[0],zero
	leaq	L_.str.45(%rip), %rdi
	movb	$1, %al
	callq	_printf
	movl	$1, -20(%rbp)
	movl	%eax, -40(%rbp)         ## 4-byte Spill
LBB4_10:
	movq	-8(%rbp), %rax
	cmpl	$33, 8(%rax)
	jne	LBB4_12
## %bb.11:
	movl	$10, %edi
	callq	_putchar
	movl	$1, -20(%rbp)
	movl	%eax, -44(%rbp)         ## 4-byte Spill
LBB4_12:
	movq	-8(%rbp), %rax
	cmpl	$28, 8(%rax)
	jne	LBB4_17
## %bb.13:
	movq	-8(%rbp), %rax
	movq	32(%rax), %rax
	cmpb	$0, (%rax)
	je	LBB4_15
## %bb.14:
	leaq	L_.str.46(%rip), %rdi
	callq	_puts
	movl	%eax, -48(%rbp)         ## 4-byte Spill
	jmp	LBB4_16
LBB4_15:
	leaq	L_.str.47(%rip), %rdi
	callq	_puts
	movl	%eax, -52(%rbp)         ## 4-byte Spill
LBB4_16:
	movl	$1, -20(%rbp)
LBB4_17:
	movq	-8(%rbp), %rax
	cmpl	$0, (%rax)
	je	LBB4_25
## %bb.18:
	cmpl	$0, -20(%rbp)
	jne	LBB4_20
## %bb.19:
	leaq	L_.str.48(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	%eax, -56(%rbp)         ## 4-byte Spill
LBB4_20:
	movl	$0, -24(%rbp)
LBB4_21:                                ## =>This Inner Loop Header: Depth=1
	movl	-24(%rbp), %eax
	movq	-8(%rbp), %rcx
	cmpl	(%rcx), %eax
	jge	LBB4_24
## %bb.22:                              ##   in Loop: Header=BB4_21 Depth=1
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movslq	-24(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdi
	movl	-12(%rbp), %edx
	addl	$1, %edx
	movl	%edx, %esi
	callq	_astnode_print_impl
## %bb.23:                              ##   in Loop: Header=BB4_21 Depth=1
	movl	-24(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -24(%rbp)
	jmp	LBB4_21
LBB4_24:
	jmp	LBB4_25
LBB4_25:
	addq	$64, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_astnode_delete         ## -- Begin function astnode_delete
	.p2align	4, 0x90
_astnode_delete:                        ## @astnode_delete
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	LBB5_2
## %bb.1:
	jmp	LBB5_10
LBB5_2:
	movl	$0, -12(%rbp)
LBB5_3:                                 ## =>This Inner Loop Header: Depth=1
	movl	-12(%rbp), %eax
	movq	-8(%rbp), %rcx
	cmpl	(%rcx), %eax
	jge	LBB5_6
## %bb.4:                               ##   in Loop: Header=BB5_3 Depth=1
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movslq	-12(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdi
	callq	_astnode_delete
## %bb.5:                               ##   in Loop: Header=BB5_3 Depth=1
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	jmp	LBB5_3
LBB5_6:
	movq	-8(%rbp), %rax
	cmpq	$0, 16(%rax)
	je	LBB5_8
## %bb.7:
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rdi
	callq	_dulfree
LBB5_8:
	movq	-8(%rbp), %rax
	movq	$0, 16(%rax)
	movq	-8(%rbp), %rax
	movl	$0, 4(%rax)
	movq	-8(%rbp), %rax
	movl	$0, (%rax)
	movq	-8(%rbp), %rax
	movq	$0, 24(%rax)
	movq	-8(%rbp), %rax
	cmpq	$0, 32(%rax)
	je	LBB5_10
## %bb.9:
	movq	-8(%rbp), %rax
	movq	32(%rax), %rdi
	callq	_dulfree
LBB5_10:
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_astnode_add_child      ## -- Begin function astnode_add_child
	.p2align	4, 0x90
_astnode_add_child:                     ## @astnode_add_child
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
	cmpq	$0, -8(%rbp)
	setne	%al
	xorb	$-1, %al
	andb	$1, %al
	movzbl	%al, %ecx
	movslq	%ecx, %rsi
	cmpq	$0, %rsi
	je	LBB6_2
## %bb.1:
	leaq	L___func__.astnode_add_child(%rip), %rdi
	leaq	L_.str.49(%rip), %rsi
	leaq	L_.str.50(%rip), %rcx
	movl	$153, %edx
	callq	___assert_rtn
LBB6_2:
	jmp	LBB6_3
LBB6_3:
	cmpq	$0, -16(%rbp)
	setne	%al
	xorb	$-1, %al
	andb	$1, %al
	movzbl	%al, %ecx
	movslq	%ecx, %rdx
	cmpq	$0, %rdx
	je	LBB6_5
## %bb.4:
	leaq	L___func__.astnode_add_child(%rip), %rdi
	leaq	L_.str.49(%rip), %rsi
	leaq	L_.str.51(%rip), %rcx
	movl	$154, %edx
	callq	___assert_rtn
LBB6_5:
	jmp	LBB6_6
LBB6_6:
	movq	-8(%rbp), %rax
	movl	(%rax), %ecx
	movq	-8(%rbp), %rax
	cmpl	4(%rax), %ecx
	jl	LBB6_11
## %bb.7:
	movq	-8(%rbp), %rax
	movl	4(%rax), %ecx
	shll	$1, %ecx
	movl	%ecx, 4(%rax)
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	-8(%rbp), %rdx
	movslq	4(%rdx), %rdx
	shlq	$3, %rdx
	movq	%rax, %rdi
	movq	%rdx, %rsi
	callq	_realloc
	movq	-8(%rbp), %rdx
	movq	%rax, 16(%rdx)
	movq	-8(%rbp), %rax
	cmpq	$0, 16(%rax)
	setne	%r8b
	xorb	$-1, %r8b
	andb	$1, %r8b
	movzbl	%r8b, %ecx
	movslq	%ecx, %rax
	cmpq	$0, %rax
	je	LBB6_9
## %bb.8:
	leaq	L___func__.astnode_add_child(%rip), %rdi
	leaq	L_.str.49(%rip), %rsi
	leaq	L_.str.52(%rip), %rcx
	movl	$160, %edx
	callq	___assert_rtn
LBB6_9:
	jmp	LBB6_10
LBB6_10:
	jmp	LBB6_11
LBB6_11:
	movq	-16(%rbp), %rax
	movq	-8(%rbp), %rcx
	movq	16(%rcx), %rcx
	movq	-8(%rbp), %rdx
	movslq	(%rdx), %rdx
	movq	%rax, (%rcx,%rdx,8)
	movq	-8(%rbp), %rax
	movl	(%rax), %esi
	addl	$1, %esi
	movl	%esi, (%rax)
	movq	-8(%rbp), %rax
	movq	-16(%rbp), %rcx
	movq	%rax, 24(%rcx)
	movq	-8(%rbp), %rax
	movq	48(%rax), %rax
	movq	-16(%rbp), %rcx
	movq	%rax, 48(%rcx)
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"SUBSCRIPT"

L_.str.1:                               ## @.str.1
	.asciz	"COMPOUND"

L_.str.2:                               ## @.str.2
	.asciz	"ASSIGN"

L_.str.3:                               ## @.str.3
	.asciz	"INPLADD"

L_.str.4:                               ## @.str.4
	.asciz	"INPLSUB"

L_.str.5:                               ## @.str.5
	.asciz	"INPLMULT"

L_.str.6:                               ## @.str.6
	.asciz	"INPLDIV"

L_.str.7:                               ## @.str.7
	.asciz	"MKTUPLE"

L_.str.8:                               ## @.str.8
	.asciz	"LESSTHAN"

L_.str.9:                               ## @.str.9
	.asciz	"LESSEQ"

L_.str.10:                              ## @.str.10
	.asciz	"GREATERTHAN"

L_.str.11:                              ## @.str.11
	.asciz	"GREATEREQ"

L_.str.12:                              ## @.str.12
	.asciz	"EQUAL"

L_.str.13:                              ## @.str.13
	.asciz	"NEQUAL"

L_.str.14:                              ## @.str.14
	.asciz	"LOGOR"

L_.str.15:                              ## @.str.15
	.asciz	"LOGAND"

L_.str.16:                              ## @.str.16
	.asciz	"LOGNOT"

L_.str.17:                              ## @.str.17
	.asciz	"FUNCCALL"

L_.str.18:                              ## @.str.18
	.asciz	"DECL"

L_.str.19:                              ## @.str.19
	.asciz	"FUNCDEF"

L_.str.20:                              ## @.str.20
	.asciz	"WRITE"

L_.str.21:                              ## @.str.21
	.asciz	"IFSTAT"

L_.str.22:                              ## @.str.22
	.asciz	"PLUS"

L_.str.23:                              ## @.str.23
	.asciz	"MINUS"

L_.str.24:                              ## @.str.24
	.asciz	"MULT"

L_.str.25:                              ## @.str.25
	.asciz	"DIV"

L_.str.26:                              ## @.str.26
	.asciz	"NUMLIT"

L_.str.27:                              ## @.str.27
	.asciz	"STRLIT"

L_.str.28:                              ## @.str.28
	.asciz	"BOOLLIT"

L_.str.29:                              ## @.str.29
	.asciz	"NAME"

L_.str.30:                              ## @.str.30
	.asciz	"IN"

L_.str.31:                              ## @.str.31
	.asciz	"FOR"

L_.str.32:                              ## @.str.32
	.asciz	"ASYNC"

L_.str.33:                              ## @.str.33
	.asciz	"NULL"

L_.str.34:                              ## @.str.34
	.asciz	"RETURN"

L_.str.35:                              ## @.str.35
	.asciz	"MODULE"

L_.str.36:                              ## @.str.36
	.asciz	"UNPACK_ITER"

L_.str.37:                              ## @.str.37
	.asciz	"IMPORT"

L_.str.38:                              ## @.str.38
	.asciz	"EXPR"

L_.str.39:                              ## @.str.39
	.asciz	"WHILE"

L_.str.40:                              ## @.str.40
	.asciz	"CLASS"

L_.str.41:                              ## @.str.41
	.asciz	"OBJECT"

	.section	__DATA,__data
	.globl	_astnames               ## @astnames
	.p2align	4
_astnames:
	.quad	L_.str
	.quad	L_.str.1
	.quad	L_.str.2
	.quad	L_.str.3
	.quad	L_.str.4
	.quad	L_.str.5
	.quad	L_.str.6
	.quad	L_.str.7
	.quad	L_.str.8
	.quad	L_.str.9
	.quad	L_.str.10
	.quad	L_.str.11
	.quad	L_.str.12
	.quad	L_.str.13
	.quad	L_.str.14
	.quad	L_.str.15
	.quad	L_.str.16
	.quad	L_.str.17
	.quad	L_.str.18
	.quad	L_.str.19
	.quad	L_.str.20
	.quad	L_.str.21
	.quad	L_.str.22
	.quad	L_.str.23
	.quad	L_.str.24
	.quad	L_.str.25
	.quad	L_.str.26
	.quad	L_.str.27
	.quad	L_.str.28
	.quad	L_.str.29
	.quad	L_.str.30
	.quad	L_.str.31
	.quad	L_.str.32
	.quad	L_.str.33
	.quad	L_.str.34
	.quad	L_.str.35
	.quad	L_.str.36
	.quad	L_.str.37
	.quad	L_.str.38
	.quad	L_.str.39
	.quad	L_.str.40
	.quad	L_.str.41

	.section	__TEXT,__cstring,cstring_literals
L_.str.42:                              ## @.str.42
	.asciz	"\t"

L_.str.43:                              ## @.str.43
	.asciz	"%s "

L_.str.44:                              ## @.str.44
	.asciz	"%s\n"

L_.str.45:                              ## @.str.45
	.asciz	"%lf\n"

L_.str.46:                              ## @.str.46
	.asciz	"true\n"

L_.str.47:                              ## @.str.47
	.asciz	"false\n"

L_.str.48:                              ## @.str.48
	.asciz	"\n"

L___func__.astnode_add_child:           ## @__func__.astnode_add_child
	.asciz	"astnode_add_child"

L_.str.49:                              ## @.str.49
	.asciz	"PARSER/ast.c"

L_.str.50:                              ## @.str.50
	.asciz	"parent"

L_.str.51:                              ## @.str.51
	.asciz	"child"

L_.str.52:                              ## @.str.52
	.asciz	"parent->children != NULL"


.subsections_via_symbols
