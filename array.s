	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 14	sdk_version 10, 14
	.globl	_array_subscr_get       ## -- Begin function array_subscr_get
	.p2align	4, 0x90
_array_subscr_get:                      ## @array_subscr_get
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -16(%rbp)
	movq	%rsi, -24(%rbp)
	movq	-24(%rbp), %rsi
	movq	(%rsi), %rsi
	cmpl	$0, 208(%rsi)
	je	LBB0_2
## %bb.1:
	movq	$0, -8(%rbp)
	jmp	LBB0_8
LBB0_2:
	movq	-24(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, -40(%rbp)
	movq	-32(%rbp), %rax
	cvttsd2si	16(%rax), %ecx
	movl	%ecx, -44(%rbp)
	cmpl	$0, -44(%rbp)
	jge	LBB0_4
## %bb.3:
	movq	-40(%rbp), %rax
	movl	12(%rax), %ecx
	addl	-44(%rbp), %ecx
	movl	%ecx, -44(%rbp)
LBB0_4:
	cmpl	$0, -44(%rbp)
	jl	LBB0_6
## %bb.5:
	movl	-44(%rbp), %eax
	movq	-40(%rbp), %rcx
	cmpl	12(%rcx), %eax
	jle	LBB0_7
LBB0_6:
	movq	$0, -8(%rbp)
	jmp	LBB0_8
LBB0_7:
	movq	-40(%rbp), %rax
	movq	24(%rax), %rax
	movslq	-44(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	movq	%rax, -8(%rbp)
LBB0_8:
	movq	-8(%rbp), %rax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_array_subscr_set       ## -- Begin function array_subscr_set
	.p2align	4, 0x90
_array_subscr_set:                      ## @array_subscr_set
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-16(%rbp), %rdx
	movq	(%rdx), %rdx
	cmpl	$0, 208(%rdx)
	je	LBB1_2
## %bb.1:
	jmp	LBB1_9
LBB1_2:
	movq	-16(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -40(%rbp)
	movq	-32(%rbp), %rax
	cvttsd2si	16(%rax), %ecx
	movl	%ecx, -44(%rbp)
	cmpl	$0, -44(%rbp)
	jge	LBB1_4
## %bb.3:
	movq	-40(%rbp), %rax
	movl	12(%rax), %ecx
	addl	-44(%rbp), %ecx
	movl	%ecx, -44(%rbp)
LBB1_4:
	cmpl	$0, -44(%rbp)
	jl	LBB1_6
## %bb.5:
	movl	-44(%rbp), %eax
	movq	-40(%rbp), %rcx
	cmpl	12(%rcx), %eax
	jle	LBB1_7
LBB1_6:
	jmp	LBB1_9
LBB1_7:
	movq	-24(%rbp), %rax
	movq	-40(%rbp), %rcx
	movq	24(%rcx), %rcx
	movslq	-44(%rbp), %rdx
	movq	%rax, (%rcx,%rdx,8)
	cmpq	$0, -24(%rbp)
	je	LBB1_9
## %bb.8:
	movq	-24(%rbp), %rax
	movl	8(%rax), %ecx
	addl	$1, %ecx
	movl	%ecx, 8(%rax)
LBB1_9:
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_length                 ## -- Begin function length
	.p2align	4, 0x90
_length:                                ## @length
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rsi, -16(%rbp)
	movl	%edx, -8(%rbp)
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rsi
	movl	12(%rsi), %edx
	cvtsi2sdl	%edx, %xmm0
	callq	_numfromdouble
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_append                 ## -- Begin function append
	.p2align	4, 0x90
_append:                                ## @append
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movq	%rsi, -16(%rbp)
	movl	%edx, -8(%rbp)
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rsi
	movq	%rsi, -32(%rbp)
	movq	-16(%rbp), %rsi
	movq	%rsi, -40(%rbp)
LBB3_1:                                 ## =>This Inner Loop Header: Depth=1
	movq	-40(%rbp), %rax
	movq	-16(%rbp), %rcx
	movslq	-8(%rbp), %rdx
	shlq	$3, %rdx
	addq	%rdx, %rcx
	cmpq	%rcx, %rax
	jae	LBB3_8
## %bb.2:                               ##   in Loop: Header=BB3_1 Depth=1
	movq	-32(%rbp), %rax
	movl	12(%rax), %ecx
	movl	%ecx, %edx
	addl	$1, %edx
	movl	%edx, 12(%rax)
	movq	-32(%rbp), %rax
	cmpl	16(%rax), %ecx
	jne	LBB3_4
## %bb.3:                               ##   in Loop: Header=BB3_1 Depth=1
	movq	-32(%rbp), %rax
	movq	24(%rax), %rax
	movq	-32(%rbp), %rcx
	movl	16(%rcx), %edx
	shll	$1, %edx
	movl	%edx, 16(%rcx)
	movslq	%edx, %rcx
	shlq	$3, %rcx
	movq	%rax, %rdi
	movq	%rcx, %rsi
	callq	_realloc
	movq	-32(%rbp), %rcx
	movq	%rax, 24(%rcx)
LBB3_4:                                 ##   in Loop: Header=BB3_1 Depth=1
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	-32(%rbp), %rcx
	movq	24(%rcx), %rcx
	movq	-32(%rbp), %rdx
	movl	12(%rdx), %esi
	subl	$1, %esi
	movslq	%esi, %rdx
	movq	%rax, (%rcx,%rdx,8)
	movq	-40(%rbp), %rax
	cmpq	$0, (%rax)
	je	LBB3_6
## %bb.5:                               ##   in Loop: Header=BB3_1 Depth=1
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movl	8(%rax), %ecx
	addl	$1, %ecx
	movl	%ecx, 8(%rax)
LBB3_6:                                 ##   in Loop: Header=BB3_1 Depth=1
	jmp	LBB3_7
LBB3_7:                                 ##   in Loop: Header=BB3_1 Depth=1
	movq	-40(%rbp), %rax
	addq	$8, %rax
	movq	%rax, -40(%rbp)
	jmp	LBB3_1
LBB3_8:
	xorl	%eax, %eax
                                        ## kill: def $rax killed $eax
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_get_array_methods      ## -- Begin function get_array_methods
	.p2align	4, 0x90
_get_array_methods:                     ## @get_array_methods
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	cmpq	$0, _get_array_methods.arrm(%rip)
	jne	LBB4_6
## %bb.1:
	leaq	L_.str(%rip), %rdi
	callq	_getmodule
	movq	%rax, _get_array_methods.arrm(%rip)
	movl	$0, -4(%rbp)
LBB4_2:                                 ## =>This Inner Loop Header: Depth=1
	movl	-4(%rbp), %eax
	cmpl	_arr_mc(%rip), %eax
	jge	LBB4_5
## %bb.3:                               ##   in Loop: Header=BB4_2 Depth=1
	movq	_get_array_methods.arrm(%rip), %rdi
	movslq	-4(%rbp), %rax
	shlq	$5, %rax
	leaq	_arr_methods(%rip), %rcx
	addq	%rax, %rcx
	movq	(%rcx), %rax
	movq	%rdi, -16(%rbp)         ## 8-byte Spill
	movq	%rax, %rdi
	callq	_strfromchar
	movslq	-4(%rbp), %rcx
	shlq	$5, %rcx
	leaq	_arr_methods(%rip), %rdi
	addq	%rcx, %rdi
	addq	$8, %rdi
	movq	-16(%rbp), %rcx         ## 8-byte Reload
	movq	%rdi, -24(%rbp)         ## 8-byte Spill
	movq	%rcx, %rdi
	movq	%rax, %rsi
	movq	-24(%rbp), %rdx         ## 8-byte Reload
	callq	_ob_subscr_set
## %bb.4:                               ##   in Loop: Header=BB4_2 Depth=1
	movl	-4(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4(%rbp)
	jmp	LBB4_2
LBB4_5:
	jmp	LBB4_6
LBB4_6:
	movq	_get_array_methods.arrm(%rip), %rax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_destr_array            ## -- Begin function destr_array
	.p2align	4, 0x90
_destr_array:                           ## @destr_array
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
	callq	_free
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_init_arr_iter          ## -- Begin function init_arr_iter
	.p2align	4, 0x90
_init_arr_iter:                         ## @init_arr_iter
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
	movq	-24(%rbp), %rdi
	cmpl	$0, 12(%rdi)
	jle	LBB6_4
## %bb.1:
	movl	$32, %eax
	movl	%eax, %edi
	callq	_malloc
	leaq	_ARRITER(%rip), %rdi
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movl	$1, 8(%rax)
	movq	-32(%rbp), %rax
	movq	%rdi, (%rax)
	movq	-24(%rbp), %rax
	movq	-32(%rbp), %rdi
	movq	%rax, 16(%rdi)
	cmpq	$0, -16(%rbp)
	je	LBB6_3
## %bb.2:
	movq	-16(%rbp), %rax
	movl	8(%rax), %ecx
	addl	$1, %ecx
	movl	%ecx, 8(%rax)
LBB6_3:
	xorps	%xmm0, %xmm0
	callq	_numfromdouble
	movq	-32(%rbp), %rcx
	movq	%rax, 24(%rcx)
	movq	-32(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB6_5
LBB6_4:
	movq	$0, -8(%rbp)
LBB6_5:
	movq	-8(%rbp), %rax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_dump_arr               ## -- Begin function dump_arr
	.p2align	4, 0x90
_dump_arr:                              ## @dump_arr
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movl	$10000, %eax            ## imm = 0x2710
	movl	%eax, %ecx
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	movq	%rdi, -16(%rbp)
	movq	%rcx, %rdi
	callq	_malloc
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	addq	$1, %rcx
	movq	%rcx, -32(%rbp)
	movb	$91, (%rax)
	movl	$0, -36(%rbp)
LBB7_1:                                 ## =>This Inner Loop Header: Depth=1
	movl	-36(%rbp), %eax
	movq	-16(%rbp), %rcx
	cmpl	12(%rcx), %eax
	jge	LBB7_4
## %bb.2:                               ##   in Loop: Header=BB7_1 Depth=1
	movq	-16(%rbp), %rax
	movq	24(%rax), %rax
	movslq	-36(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	movq	-16(%rbp), %rcx
	movq	24(%rcx), %rcx
	movslq	-36(%rbp), %rdx
	movq	(%rcx,%rdx,8), %rdi
	callq	*%rax
	xorl	%esi, %esi
	movq	$-1, %rdx
	movq	%rax, -48(%rbp)
	movq	-32(%rbp), %rdi
	movq	-48(%rbp), %r8
	leaq	L_.str.1(%rip), %rcx
	movb	$0, %al
	callq	___sprintf_chk
	movq	-32(%rbp), %rcx
	movslq	%eax, %rdx
	addq	%rdx, %rcx
	movq	%rcx, -32(%rbp)
	movq	-48(%rbp), %rdi
	callq	_free
## %bb.3:                               ##   in Loop: Header=BB7_1 Depth=1
	movl	-36(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -36(%rbp)
	jmp	LBB7_1
LBB7_4:
	movq	-16(%rbp), %rax
	cmpl	$0, 12(%rax)
	jle	LBB7_6
## %bb.5:
	movq	-32(%rbp), %rax
	addq	$-2, %rax
	movq	%rax, -32(%rbp)
LBB7_6:
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	addq	$1, %rcx
	movq	%rcx, -32(%rbp)
	movb	$93, (%rax)
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	addq	$1, %rcx
	movq	%rcx, -32(%rbp)
	movb	$0, (%rax)
	movq	-24(%rbp), %rax
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3               ## -- Begin function arr_iter_next
LCPI8_0:
	.quad	4607182418800017408     ## double 1
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_arr_iter_next
	.p2align	4, 0x90
_arr_iter_next:                         ## @arr_iter_next
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movsd	LCPI8_0(%rip), %xmm0    ## xmm0 = mem[0],zero
	movq	%rdi, -16(%rbp)
	movq	-16(%rbp), %rdi
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rdi
	movq	24(%rdi), %rdi
	addsd	16(%rdi), %xmm0
	movsd	%xmm0, 16(%rdi)
	movq	-24(%rbp), %rdi
	movq	24(%rdi), %rdi
	movsd	16(%rdi), %xmm0         ## xmm0 = mem[0],zero
	movq	-24(%rbp), %rdi
	movq	16(%rdi), %rdi
	movl	12(%rdi), %eax
	cvtsi2sdl	%eax, %xmm1
	ucomisd	%xmm1, %xmm0
	jb	LBB8_2
## %bb.1:
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	callq	_free
	movq	$0, -8(%rbp)
	jmp	LBB8_5
LBB8_2:
	movq	-24(%rbp), %rax
	movq	24(%rax), %rax
	cmpl	$1, 8(%rax)
	jle	LBB8_4
## %bb.3:
	movq	-24(%rbp), %rax
	movq	24(%rax), %rax
	movsd	16(%rax), %xmm0         ## xmm0 = mem[0],zero
	callq	_numfromdouble
	movq	-24(%rbp), %rcx
	movq	%rax, 24(%rcx)
LBB8_4:
	movq	-16(%rbp), %rax
	movq	%rax, -8(%rbp)
LBB8_5:
	movq	-8(%rbp), %rax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_unpack_arr_iter        ## -- Begin function unpack_arr_iter
	.p2align	4, 0x90
_unpack_arr_iter:                       ## @unpack_arr_iter
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
	movq	24(%rax), %rax
	cvttsd2si	16(%rax), %ecx
	movslq	%ecx, %rax
	movq	(%rdi,%rax,8), %rax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
.zerofill __DATA,__bss,_get_array_methods.arrm,8,3 ## @get_array_methods.arrm
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"__array"

	.section	__DATA,__data
	.p2align	2               ## @arr_mc
_arr_mc:
	.long	2                       ## 0x2

	.p2align	4               ## @arr_methods
_arr_methods:
	.quad	L_.str.5
	.quad	_BINTYPE
	.long	1                       ## 0x1
	.space	4
	.quad	_length
	.quad	L_.str.6
	.quad	_BINTYPE
	.long	1                       ## 0x1
	.space	4
	.quad	_append

	.section	__TEXT,__cstring,cstring_literals
L_.str.1:                               ## @.str.1
	.asciz	"%s, "

L_.str.2:                               ## @.str.2
	.asciz	"array"

	.section	__DATA,__const
	.globl	_ARRTYPE                ## @ARRTYPE
	.p2align	3
_ARRTYPE:
	.quad	L_.str.2
	.quad	_dump_arr
	.quad	0
	.quad	_destr_array
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
	.quad	_init_arr_iter
	.quad	0
	.quad	_array_subscr_get
	.quad	_array_subscr_set
	.quad	0
	.quad	0
	.quad	0
	.long	3                       ## 0x3
	.space	4
	.quad	_get_array_methods

	.section	__TEXT,__cstring,cstring_literals
L_.str.3:                               ## @.str.3
	.asciz	"array iter"

	.section	__DATA,__const
	.globl	_ARRITER                ## @ARRITER
	.p2align	3
_ARRITER:
	.quad	L_.str.3
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
	.quad	_arr_iter_next
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	_unpack_arr_iter
	.long	4294967295              ## 0xffffffff
	.space	4
	.quad	0

	.section	__TEXT,__cstring,cstring_literals
L_.str.5:                               ## @.str.5
	.asciz	"length"

L_.str.6:                               ## @.str.6
	.asciz	"append"

	.weak_reference _getmodule

.subsections_via_symbols
