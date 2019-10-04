	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 14	sdk_version 10, 14
	.globl	_range_iter_next        ## -- Begin function range_iter_next
	.p2align	4, 0x90
_range_iter_next:                       ## @range_iter_next
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
	cmpl	$1, 8(%rdi)
	jle	LBB0_2
## %bb.1:
	movq	-24(%rbp), %rax
	movq	24(%rax), %rax
	movsd	16(%rax), %xmm0         ## xmm0 = mem[0],zero
	callq	_numfromdouble
	movq	-24(%rbp), %rcx
	movq	%rax, 24(%rcx)
LBB0_2:
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	movl	20(%rax), %ecx
	cvtsi2sdl	%ecx, %xmm0
	movq	-24(%rbp), %rax
	movq	24(%rax), %rax
	addsd	16(%rax), %xmm0
	movsd	%xmm0, 16(%rax)
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	movl	12(%rax), %ecx
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	cmpl	16(%rax), %ecx
	jge	LBB0_4
## %bb.3:
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	movl	12(%rax), %ecx
	movl	%ecx, -36(%rbp)         ## 4-byte Spill
	jmp	LBB0_5
LBB0_4:
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	movl	16(%rax), %ecx
	movl	%ecx, -36(%rbp)         ## 4-byte Spill
LBB0_5:
	movl	-36(%rbp), %eax         ## 4-byte Reload
	movl	%eax, -28(%rbp)
	movq	-24(%rbp), %rcx
	movq	16(%rcx), %rcx
	movl	12(%rcx), %eax
	movq	-24(%rbp), %rcx
	movq	16(%rcx), %rcx
	cmpl	16(%rcx), %eax
	jle	LBB0_7
## %bb.6:
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	movl	12(%rax), %ecx
	movl	%ecx, -40(%rbp)         ## 4-byte Spill
	jmp	LBB0_8
LBB0_7:
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	movl	16(%rax), %ecx
	movl	%ecx, -40(%rbp)         ## 4-byte Spill
LBB0_8:
	movl	-40(%rbp), %eax         ## 4-byte Reload
	movl	%eax, -32(%rbp)
	movq	-24(%rbp), %rcx
	movq	24(%rcx), %rcx
	movsd	16(%rcx), %xmm0         ## xmm0 = mem[0],zero
	movl	-32(%rbp), %eax
	cvtsi2sdl	%eax, %xmm1
	ucomisd	%xmm1, %xmm0
	jae	LBB0_10
## %bb.9:
	movq	-24(%rbp), %rax
	movq	24(%rax), %rax
	movsd	16(%rax), %xmm0         ## xmm0 = mem[0],zero
	movl	-28(%rbp), %ecx
	cvtsi2sdl	%ecx, %xmm1
	ucomisd	%xmm0, %xmm1
	jbe	LBB0_11
LBB0_10:
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	callq	_free
	movq	$0, -8(%rbp)
	jmp	LBB0_12
LBB0_11:
	movq	-16(%rbp), %rax
	movq	%rax, -8(%rbp)
LBB0_12:
	movq	-8(%rbp), %rax
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_unpack_range_iter      ## -- Begin function unpack_range_iter
	.p2align	4, 0x90
_unpack_range_iter:                     ## @unpack_range_iter
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	movq	24(%rdi), %rdi
	movq	%rdi, %rax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_init_range_iter        ## -- Begin function init_range_iter
	.p2align	4, 0x90
_init_range_iter:                       ## @init_range_iter
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
	leaq	_RANGEITERTYPE(%rip), %rcx
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	$1, 8(%rax)
	movq	-16(%rbp), %rax
	movq	%rcx, (%rax)
	movq	-8(%rbp), %rax
	movq	-16(%rbp), %rcx
	movq	%rax, 16(%rcx)
	movq	-8(%rbp), %rax
	movl	12(%rax), %edx
	cvtsi2sdl	%edx, %xmm0
	callq	_numfromdouble
	movq	-16(%rbp), %rcx
	movq	%rax, 24(%rcx)
	movq	-16(%rbp), %rax
	movq	24(%rax), %rax
	movl	$1, 8(%rax)
	movq	-16(%rbp), %rax
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"range iterator"

	.section	__DATA,__const
	.globl	_RANGEITERTYPE          ## @RANGEITERTYPE
	.p2align	3
_RANGEITERTYPE:
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
	.quad	_range_iter_next
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	_unpack_range_iter
	.long	4294967295              ## 0xffffffff
	.space	4
	.quad	0

	.section	__TEXT,__cstring,cstring_literals
L_.str.1:                               ## @.str.1
	.asciz	"range object"

	.section	__DATA,__const
	.globl	_RANGEOBJECTTYPE        ## @RANGEOBJECTTYPE
	.p2align	3
_RANGEOBJECTTYPE:
	.quad	L_.str.1
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
	.quad	_init_range_iter
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.long	0                       ## 0x0
	.space	4
	.quad	0


.subsections_via_symbols
