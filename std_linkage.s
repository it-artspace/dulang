	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 14	sdk_version 10, 14
	.globl	_eval_std               ## -- Begin function eval_std
	.p2align	4, 0x90
_eval_std:                              ## @eval_std
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	$0, -12(%rbp)
LBB0_1:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_3 Depth 2
	movl	-12(%rbp), %eax
	movq	-8(%rbp), %rcx
	movq	8(%rcx), %rcx
	cmpl	32(%rcx), %eax
	jge	LBB0_10
## %bb.2:                               ##   in Loop: Header=BB0_1 Depth=1
	movl	$0, -16(%rbp)
LBB0_3:                                 ##   Parent Loop BB0_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	cmpl	$8, -16(%rbp)
	jge	LBB0_8
## %bb.4:                               ##   in Loop: Header=BB0_3 Depth=2
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	16(%rax), %rax
	movslq	-12(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdi
	movslq	-16(%rbp), %rax
	leaq	_bins(%rip), %rcx
	movq	(%rcx,%rax,8), %rax
	movq	16(%rax), %rsi
	callq	_strcmp
	cmpl	$0, %eax
	jne	LBB0_6
## %bb.5:                               ##   in Loop: Header=BB0_3 Depth=2
	movslq	-16(%rbp), %rax
	leaq	_bins(%rip), %rcx
	movq	(%rcx,%rax,8), %rax
	movq	-8(%rbp), %rcx
	movq	(%rcx), %rcx
	movslq	-12(%rbp), %rdx
	movq	%rax, (%rcx,%rdx,8)
LBB0_6:                                 ##   in Loop: Header=BB0_3 Depth=2
	jmp	LBB0_7
LBB0_7:                                 ##   in Loop: Header=BB0_3 Depth=2
	movl	-16(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -16(%rbp)
	jmp	LBB0_3
LBB0_8:                                 ##   in Loop: Header=BB0_1 Depth=1
	jmp	LBB0_9
LBB0_9:                                 ##   in Loop: Header=BB0_1 Depth=1
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	jmp	LBB0_1
LBB0_10:
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"obdump"

	.section	__DATA,__const
	.globl	_dump                   ## @dump
	.p2align	3
_dump:
	.quad	_BINTYPE
	.long	1                       ## 0x1
	.space	4
	.quad	L_.str
	.quad	___bin_obdump

	.section	__TEXT,__cstring,cstring_literals
L_.str.1:                               ## @.str.1
	.asciz	"range"

	.section	__DATA,__const
	.globl	_range                  ## @range
	.p2align	3
_range:
	.quad	_BINTYPE
	.long	1                       ## 0x1
	.space	4
	.quad	L_.str.1
	.quad	___bin_range

	.section	__TEXT,__cstring,cstring_literals
L_.str.2:                               ## @.str.2
	.asciz	"object"

	.section	__DATA,__const
	.globl	_obj                    ## @obj
	.p2align	3
_obj:
	.quad	_BINTYPE
	.long	1                       ## 0x1
	.space	4
	.quad	L_.str.2
	.quad	___bin_object

	.section	__TEXT,__cstring,cstring_literals
L_.str.3:                               ## @.str.3
	.asciz	"typeof"

	.section	__DATA,__const
	.globl	_typeof_                ## @typeof_
	.p2align	3
_typeof_:
	.quad	_BINTYPE
	.long	1                       ## 0x1
	.space	4
	.quad	L_.str.3
	.quad	___bin_typeof

	.section	__TEXT,__cstring,cstring_literals
L_.str.4:                               ## @.str.4
	.asciz	"str"

	.section	__DATA,__const
	.globl	_str_                   ## @str_
	.p2align	3
_str_:
	.quad	_BINTYPE
	.long	1                       ## 0x1
	.space	4
	.quad	L_.str.4
	.quad	___bin_str

	.section	__TEXT,__cstring,cstring_literals
L_.str.5:                               ## @.str.5
	.asciz	"channel"

	.section	__DATA,__const
	.globl	_chan_                  ## @chan_
	.p2align	3
_chan_:
	.quad	_BINTYPE
	.long	1                       ## 0x1
	.space	4
	.quad	L_.str.5
	.quad	_new_channel

	.section	__TEXT,__cstring,cstring_literals
L_.str.6:                               ## @.str.6
	.asciz	"time"

	.section	__DATA,__const
	.globl	_time_                  ## @time_
	.p2align	3
_time_:
	.quad	_BINTYPE
	.long	1                       ## 0x1
	.space	4
	.quad	L_.str.6
	.quad	___bin_time

	.section	__TEXT,__cstring,cstring_literals
L_.str.7:                               ## @.str.7
	.asciz	"array"

	.section	__DATA,__const
	.globl	_array                  ## @array
	.p2align	3
_array:
	.quad	_BINTYPE
	.long	1                       ## 0x1
	.space	4
	.quad	L_.str.7
	.quad	___bin_array

	.section	__DATA,__data
	.globl	_bins                   ## @bins
	.p2align	4
_bins:
	.quad	_dump
	.quad	_typeof_
	.quad	_range
	.quad	_obj
	.quad	_str_
	.quad	_chan_
	.quad	_time_
	.quad	_array

	.section	__TEXT,__const
	.globl	_bin_count              ## @bin_count
	.p2align	2
_bin_count:
	.long	8                       ## 0x8


.subsections_via_symbols
