	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 14	sdk_version 10, 14
	.globl	_unpack_ti              ## -- Begin function unpack_ti
	.p2align	4, 0x90
_unpack_ti:                             ## @unpack_ti
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
	movq	24(%rdi), %rdi
	movq	-8(%rbp), %rax
	movq	16(%rax), %rsi
	callq	_tuple_sub_get
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_tuple_sub_get          ## -- Begin function tuple_sub_get
	.p2align	4, 0x90
_tuple_sub_get:                         ## @tuple_sub_get
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -16(%rbp)
	movq	%rsi, -24(%rbp)
	cmpq	$0, -24(%rbp)
	je	LBB1_2
## %bb.1:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 208(%rax)
	je	LBB1_3
LBB1_2:
	movq	$0, -8(%rbp)
	jmp	LBB1_7
LBB1_3:
	movq	-24(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, -40(%rbp)
	movq	-32(%rbp), %rax
	xorps	%xmm0, %xmm0
	ucomisd	16(%rax), %xmm0
	ja	LBB1_5
## %bb.4:
	movq	-32(%rbp), %rax
	movsd	16(%rax), %xmm0         ## xmm0 = mem[0],zero
	movq	-40(%rbp), %rax
	movl	12(%rax), %ecx
	cvtsi2sdl	%ecx, %xmm1
	ucomisd	%xmm1, %xmm0
	jb	LBB1_6
LBB1_5:
	movq	$0, -8(%rbp)
	jmp	LBB1_7
LBB1_6:
	movq	-40(%rbp), %rax
	movq	-32(%rbp), %rcx
	cvttsd2si	16(%rcx), %edx
	movslq	%edx, %rcx
	movq	16(%rax,%rcx,8), %rax
	movq	%rax, -8(%rbp)
LBB1_7:
	movq	-8(%rbp), %rax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3               ## -- Begin function ti_next
LCPI2_0:
	.quad	4607182418800017408     ## double 1
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_ti_next
	.p2align	4, 0x90
_ti_next:                               ## @ti_next
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
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rdi
	movq	24(%rdi), %rdi
	movq	%rdi, -32(%rbp)
	movq	-24(%rbp), %rdi
	movq	16(%rdi), %rdi
	movq	%rdi, -40(%rbp)
	movq	-40(%rbp), %rdi
	cmpl	$1, 8(%rdi)
	jle	LBB2_2
## %bb.1:
	movq	-40(%rbp), %rax
	movsd	16(%rax), %xmm0         ## xmm0 = mem[0],zero
	callq	_numfromdouble
	movq	%rax, -40(%rbp)
	movq	-24(%rbp), %rcx
	movq	%rax, 16(%rcx)
LBB2_2:
	movsd	LCPI2_0(%rip), %xmm0    ## xmm0 = mem[0],zero
	movq	-40(%rbp), %rax
	addsd	16(%rax), %xmm0
	movsd	%xmm0, 16(%rax)
	movq	-40(%rbp), %rax
	movsd	16(%rax), %xmm0         ## xmm0 = mem[0],zero
	movq	-32(%rbp), %rax
	movl	12(%rax), %ecx
	cvtsi2sdl	%ecx, %xmm1
	ucomisd	%xmm1, %xmm0
	jb	LBB2_4
## %bb.3:
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	callq	_free
	movq	$0, -8(%rbp)
	jmp	LBB2_5
LBB2_4:
	movq	-16(%rbp), %rax
	movq	%rax, -8(%rbp)
LBB2_5:
	movq	-8(%rbp), %rax
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_init_tuple_iter        ## -- Begin function init_tuple_iter
	.p2align	4, 0x90
_init_tuple_iter:                       ## @init_tuple_iter
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	$32, %eax
	movl	%eax, %ecx
	movq	%rdi, -8(%rbp)
	movq	%rcx, %rdi
	callq	_malloc
	movq	%rax, -16(%rbp)
	xorps	%xmm0, %xmm0
	callq	_numfromdouble
	leaq	_ti_type(%rip), %rcx
	movq	-16(%rbp), %rdi
	movq	%rax, 16(%rdi)
	movq	-8(%rbp), %rax
	movq	-16(%rbp), %rdi
	movq	%rax, 24(%rdi)
	movq	-16(%rbp), %rax
	movl	$1, 8(%rax)
	movq	-16(%rbp), %rax
	movq	%rcx, (%rax)
	movq	-16(%rbp), %rax
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_tuple_sub_set          ## -- Begin function tuple_sub_set
	.p2align	4, 0x90
_tuple_sub_set:                         ## @tuple_sub_set
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
	cmpq	$0, -16(%rbp)
	je	LBB4_2
## %bb.1:
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 208(%rax)
	je	LBB4_3
LBB4_2:
	jmp	LBB4_8
LBB4_3:
	movq	-16(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -40(%rbp)
	movq	-32(%rbp), %rax
	xorps	%xmm0, %xmm0
	ucomisd	16(%rax), %xmm0
	ja	LBB4_5
## %bb.4:
	movq	-32(%rbp), %rax
	movsd	16(%rax), %xmm0         ## xmm0 = mem[0],zero
	movq	-40(%rbp), %rax
	movl	12(%rax), %ecx
	cvtsi2sdl	%ecx, %xmm1
	ucomisd	%xmm1, %xmm0
	jbe	LBB4_6
LBB4_5:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	leaq	L_.str(%rip), %rsi
	movb	$0, %al
	callq	_fprintf
	movl	%eax, -44(%rbp)         ## 4-byte Spill
	jmp	LBB4_8
LBB4_6:
	movq	-24(%rbp), %rax
	movq	-40(%rbp), %rcx
	movq	-32(%rbp), %rdx
	cvttsd2si	16(%rdx), %esi
	movslq	%esi, %rdx
	movq	%rax, 16(%rcx,%rdx,8)
	cmpq	$0, -24(%rbp)
	je	LBB4_8
## %bb.7:
	movq	-24(%rbp), %rax
	movl	8(%rax), %ecx
	addl	$1, %ecx
	movl	%ecx, 8(%rax)
LBB4_8:
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_mktuple_va             ## -- Begin function mktuple_va
	.p2align	4, 0x90
_mktuple_va:                            ## @mktuple_va
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$464, %rsp              ## imm = 0x1D0
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
	movq	%rdx, -408(%rbp)        ## 8-byte Spill
	movq	%rsi, -416(%rbp)        ## 8-byte Spill
	je	LBB5_13
## %bb.12:
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
LBB5_13:
	movq	-384(%rbp), %rax        ## 8-byte Reload
	movq	%rax, -200(%rbp)
	movq	-392(%rbp), %rcx        ## 8-byte Reload
	movq	%rcx, -208(%rbp)
	movq	-400(%rbp), %rdx        ## 8-byte Reload
	movq	%rdx, -216(%rbp)
	movq	-408(%rbp), %rsi        ## 8-byte Reload
	movq	%rsi, -224(%rbp)
	movq	-416(%rbp), %rdi        ## 8-byte Reload
	movq	%rdi, -232(%rbp)
	movl	-372(%rbp), %r8d        ## 4-byte Reload
	movq	___stack_chk_guard@GOTPCREL(%rip), %r9
	movq	(%r9), %r9
	movq	%r9, -8(%rbp)
	movl	%r8d, -36(%rbp)
	movslq	-36(%rbp), %r9
	shlq	$3, %r9
	addq	$16, %r9
	movq	%r9, %rdi
	callq	_malloc
	leaq	-32(%rbp), %rcx
	leaq	_BUNDLETYPE(%rip), %rdx
	movq	%rax, -48(%rbp)
	movl	-36(%rbp), %r8d
	movq	-48(%rbp), %rax
	movl	%r8d, 12(%rax)
	movq	-48(%rbp), %rax
	movl	$0, 8(%rax)
	movq	-48(%rbp), %rax
	movq	%rdx, (%rax)
	leaq	-240(%rbp), %rax
	movq	%rax, 16(%rcx)
	leaq	16(%rbp), %rax
	movq	%rax, 8(%rcx)
	movl	$48, 4(%rcx)
	movl	$8, (%rcx)
	movl	$0, -52(%rbp)
LBB5_1:                                 ## =>This Inner Loop Header: Depth=1
	movl	-52(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jge	LBB5_9
## %bb.2:                               ##   in Loop: Header=BB5_1 Depth=1
	leaq	-32(%rbp), %rax
	movl	-32(%rbp), %ecx
	cmpl	$40, %ecx
	movq	%rax, -424(%rbp)        ## 8-byte Spill
	movl	%ecx, -428(%rbp)        ## 4-byte Spill
	ja	LBB5_4
## %bb.3:                               ##   in Loop: Header=BB5_1 Depth=1
	movl	-428(%rbp), %eax        ## 4-byte Reload
	movslq	%eax, %rcx
	movq	-424(%rbp), %rdx        ## 8-byte Reload
	addq	16(%rdx), %rcx
	addl	$8, %eax
	movl	%eax, (%rdx)
	movq	%rcx, -440(%rbp)        ## 8-byte Spill
	jmp	LBB5_5
LBB5_4:                                 ##   in Loop: Header=BB5_1 Depth=1
	movq	-424(%rbp), %rax        ## 8-byte Reload
	movq	8(%rax), %rcx
	movq	%rcx, %rdx
	addq	$8, %rcx
	movq	%rcx, 8(%rax)
	movq	%rdx, -440(%rbp)        ## 8-byte Spill
LBB5_5:                                 ##   in Loop: Header=BB5_1 Depth=1
	movq	-440(%rbp), %rax        ## 8-byte Reload
	movq	(%rax), %rax
	movq	-48(%rbp), %rcx
	movslq	-52(%rbp), %rdx
	movq	%rax, 16(%rcx,%rdx,8)
	movq	-48(%rbp), %rax
	movslq	-52(%rbp), %rcx
	cmpq	$0, 16(%rax,%rcx,8)
	je	LBB5_7
## %bb.6:                               ##   in Loop: Header=BB5_1 Depth=1
	movq	-48(%rbp), %rax
	movslq	-52(%rbp), %rcx
	movq	16(%rax,%rcx,8), %rax
	movl	8(%rax), %edx
	addl	$1, %edx
	movl	%edx, 8(%rax)
LBB5_7:                                 ##   in Loop: Header=BB5_1 Depth=1
	jmp	LBB5_8
LBB5_8:                                 ##   in Loop: Header=BB5_1 Depth=1
	movl	-52(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -52(%rbp)
	jmp	LBB5_1
LBB5_9:
	leaq	-32(%rbp), %rax
	movq	-48(%rbp), %rcx
	movq	___stack_chk_guard@GOTPCREL(%rip), %rdx
	movq	(%rdx), %rdx
	movq	-8(%rbp), %rsi
	cmpq	%rsi, %rdx
	movq	%rax, -448(%rbp)        ## 8-byte Spill
	movq	%rcx, -456(%rbp)        ## 8-byte Spill
	jne	LBB5_11
## %bb.10:
	movq	-456(%rbp), %rax        ## 8-byte Reload
	addq	$464, %rsp              ## imm = 0x1D0
	popq	%rbp
	retq
LBB5_11:
	callq	___stack_chk_fail
	ud2
	.cfi_endproc
                                        ## -- End function
	.globl	_dump_tuple             ## -- Begin function dump_tuple
	.p2align	4, 0x90
_dump_tuple:                            ## @dump_tuple
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movl	$1000, %eax             ## imm = 0x3E8
	movl	%eax, %ecx
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	movq	%rdi, -16(%rbp)
	movq	%rcx, %rdi
	callq	_dulalloc
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	addq	$1, %rcx
	movq	%rcx, -32(%rbp)
	movb	$40, (%rax)
	movl	$0, -36(%rbp)
LBB6_1:                                 ## =>This Inner Loop Header: Depth=1
	movl	-36(%rbp), %eax
	movq	-16(%rbp), %rcx
	cmpl	12(%rcx), %eax
	jge	LBB6_9
## %bb.2:                               ##   in Loop: Header=BB6_1 Depth=1
	movq	-16(%rbp), %rax
	movslq	-36(%rbp), %rcx
	cmpq	$0, 16(%rax,%rcx,8)
	je	LBB6_4
## %bb.3:                               ##   in Loop: Header=BB6_1 Depth=1
	movq	-16(%rbp), %rax
	movslq	-36(%rbp), %rcx
	movq	16(%rax,%rcx,8), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	movq	-16(%rbp), %rcx
	movslq	-36(%rbp), %rdx
	movq	16(%rcx,%rdx,8), %rdi
	callq	*%rax
	xorl	%esi, %esi
	movq	$-1, %rdx
	movq	%rax, -48(%rbp)
	movq	-32(%rbp), %rdi
	movq	-48(%rbp), %r8
	leaq	L_.str.4(%rip), %rcx
	movb	$0, %al
	callq	___sprintf_chk
	movq	-32(%rbp), %rcx
	movslq	%eax, %rdx
	addq	%rdx, %rcx
	movq	%rcx, -32(%rbp)
	movq	-48(%rbp), %rdi
	callq	_free
	jmp	LBB6_5
LBB6_4:                                 ##   in Loop: Header=BB6_1 Depth=1
	xorl	%esi, %esi
	movq	$-1, %rdx
	movq	-32(%rbp), %rdi
	leaq	L_.str.5(%rip), %rcx
	movb	$0, %al
	callq	___sprintf_chk
	movq	-32(%rbp), %rcx
	movslq	%eax, %rdx
	addq	%rdx, %rcx
	movq	%rcx, -32(%rbp)
LBB6_5:                                 ##   in Loop: Header=BB6_1 Depth=1
	movl	-36(%rbp), %eax
	movq	-16(%rbp), %rcx
	movl	12(%rcx), %edx
	subl	$1, %edx
	cmpl	%edx, %eax
	je	LBB6_7
## %bb.6:                               ##   in Loop: Header=BB6_1 Depth=1
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	addq	$1, %rcx
	movq	%rcx, -32(%rbp)
	movb	$44, (%rax)
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	addq	$1, %rcx
	movq	%rcx, -32(%rbp)
	movb	$32, (%rax)
LBB6_7:                                 ##   in Loop: Header=BB6_1 Depth=1
	jmp	LBB6_8
LBB6_8:                                 ##   in Loop: Header=BB6_1 Depth=1
	movl	-36(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -36(%rbp)
	jmp	LBB6_1
LBB6_9:
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	addq	$1, %rcx
	movq	%rcx, -32(%rbp)
	movb	$41, (%rax)
	movq	-32(%rbp), %rax
	movb	$0, (%rax)
	movq	-24(%rbp), %rax
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mktuple               ## -- Begin function _mktuple
	.p2align	4, 0x90
__mktuple:                              ## @_mktuple
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movslq	-12(%rbp), %rdi
	shlq	$3, %rdi
	addq	$16, %rdi
	callq	_dulalloc
	xorl	%esi, %esi
	movl	%esi, %edi
	leaq	_BUNDLETYPE(%rip), %rcx
	movq	%rax, -24(%rbp)
	movl	-12(%rbp), %esi
	movq	-24(%rbp), %rax
	movl	%esi, 12(%rax)
	movq	-24(%rbp), %rax
	movl	$0, 8(%rax)
	movq	-24(%rbp), %rax
	movq	%rcx, (%rax)
	movq	-8(%rbp), %rax
	movslq	-12(%rbp), %rcx
	subq	%rcx, %rdi
	shlq	$3, %rdi
	addq	%rdi, %rax
	movq	%rax, -32(%rbp)
LBB7_1:                                 ## =>This Inner Loop Header: Depth=1
	movq	-32(%rbp), %rax
	cmpq	-8(%rbp), %rax
	je	LBB7_6
## %bb.2:                               ##   in Loop: Header=BB7_1 Depth=1
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	-24(%rbp), %rcx
	movslq	-12(%rbp), %rdx
	movq	-32(%rbp), %rsi
	movq	-8(%rbp), %rdi
	subq	%rdi, %rsi
	sarq	$3, %rsi
	addq	%rsi, %rdx
	movq	%rax, 16(%rcx,%rdx,8)
	movq	-32(%rbp), %rax
	cmpq	$0, (%rax)
	je	LBB7_4
## %bb.3:                               ##   in Loop: Header=BB7_1 Depth=1
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movl	8(%rax), %ecx
	addl	$1, %ecx
	movl	%ecx, 8(%rax)
LBB7_4:                                 ##   in Loop: Header=BB7_1 Depth=1
	jmp	LBB7_5
LBB7_5:                                 ##   in Loop: Header=BB7_1 Depth=1
	movq	-32(%rbp), %rax
	addq	$8, %rax
	movq	%rax, -32(%rbp)
	jmp	LBB7_1
LBB7_6:
	movq	-24(%rbp), %rax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_destr_tuple            ## -- Begin function destr_tuple
	.p2align	4, 0x90
_destr_tuple:                           ## @destr_tuple
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
LBB8_1:                                 ## =>This Inner Loop Header: Depth=1
	movl	-20(%rbp), %eax
	movq	-16(%rbp), %rcx
	cmpl	12(%rcx), %eax
	jge	LBB8_6
## %bb.2:                               ##   in Loop: Header=BB8_1 Depth=1
	movq	-16(%rbp), %rax
	movslq	-20(%rbp), %rcx
	movq	16(%rax,%rcx,8), %rax
	movl	8(%rax), %edx
	addl	$-1, %edx
	movl	%edx, 8(%rax)
	cmpl	$0, %edx
	jne	LBB8_4
## %bb.3:                               ##   in Loop: Header=BB8_1 Depth=1
	movq	-16(%rbp), %rax
	movslq	-20(%rbp), %rcx
	movq	16(%rax,%rcx,8), %rdi
	callq	_ob_dealloc
LBB8_4:                                 ##   in Loop: Header=BB8_1 Depth=1
	jmp	LBB8_5
LBB8_5:                                 ##   in Loop: Header=BB8_1 Depth=1
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -20(%rbp)
	jmp	LBB8_1
LBB8_6:
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__DATA,__const
	.globl	_ti_type                ## @ti_type
	.p2align	3
_ti_type:
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
	.quad	_ti_next
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	_unpack_ti
	.long	0                       ## 0x0
	.space	4
	.quad	0

	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"out of index-error"

L_.str.1:                               ## @.str.1
	.asciz	"bundle"

	.section	__DATA,__const
	.globl	_BUNDLETYPE             ## @BUNDLETYPE
	.p2align	3
_BUNDLETYPE:
	.quad	L_.str.1
	.quad	_dump_tuple
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
	.quad	_init_tuple_iter
	.quad	0
	.quad	_tuple_sub_get
	.quad	_tuple_sub_set
	.quad	0
	.quad	0
	.quad	0
	.long	2                       ## 0x2
	.space	4
	.quad	0

	.section	__TEXT,__cstring,cstring_literals
L_.str.3:                               ## @.str.3
	.asciz	"map"

	.section	__DATA,__const
	.globl	_map                    ## @map
	.p2align	3
_map:
	.quad	_BINTYPE
	.long	1                       ## 0x1
	.space	4
	.quad	L_.str.3
	.quad	0

	.section	__TEXT,__cstring,cstring_literals
L_.str.4:                               ## @.str.4
	.asciz	"%s"

L_.str.5:                               ## @.str.5
	.asciz	"null"


.subsections_via_symbols
