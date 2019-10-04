	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 14	sdk_version 10, 14
	.globl	_setCallback            ## -- Begin function setCallback
	.p2align	4, 0x90
_setCallback:                           ## @setCallback
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movq	%rsi, -24(%rbp)
	movl	%edx, -16(%rbp)
	movq	%rdi, -32(%rbp)
	cmpl	$1, -16(%rbp)
	je	LBB0_2
## %bb.1:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	movl	-16(%rbp), %edx
	leaq	L_.str(%rip), %rsi
	movb	$0, %al
	callq	_fprintf
	movq	$0, -8(%rbp)
	movl	%eax, -44(%rbp)         ## 4-byte Spill
	jmp	LBB0_6
LBB0_2:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rdi
	leaq	L_.str.1(%rip), %rsi
	callq	_strcmp
	cmpl	$0, %eax
	je	LBB0_5
## %bb.3:
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rdi
	leaq	L_.str.2(%rip), %rsi
	callq	_strcmp
	cmpl	$0, %eax
	je	LBB0_5
## %bb.4:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	leaq	L_.str.3(%rip), %rsi
	movb	$0, %al
	callq	_fprintf
	movq	$0, -8(%rbp)
	movl	%eax, -48(%rbp)         ## 4-byte Spill
	jmp	LBB0_6
LBB0_5:
	movq	-40(%rbp), %rax
	movq	-32(%rbp), %rcx
	movq	%rax, 40(%rcx)
	movq	$0, -8(%rbp)
LBB0_6:
	movq	-8(%rbp), %rax
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_push                   ## -- Begin function push
	.p2align	4, 0x90
_push:                                  ## @push
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$112, %rsp
	movq	%rsi, -16(%rbp)
	movl	%edx, -8(%rbp)
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rsi
	movq	%rsi, -32(%rbp)
	movq	-32(%rbp), %rsi
	movq	24(%rsi), %rsi
	movq	-32(%rbp), %rdi
	movq	16(%rdi), %rdi
	subq	%rdi, %rsi
	sarq	$3, %rsi
	movslq	-8(%rbp), %rdi
	addq	%rdi, %rsi
	movq	-32(%rbp), %rdi
	movslq	32(%rdi), %rdi
	cmpq	%rdi, %rsi
	jl	LBB1_2
## %bb.1:
	movq	-32(%rbp), %rax
	movq	16(%rax), %rax
	movq	-32(%rbp), %rcx
	movl	32(%rcx), %edx
	shll	$1, %edx
	movl	%edx, 32(%rcx)
	movslq	%edx, %rcx
	shlq	$3, %rcx
	movq	%rax, %rdi
	movq	%rcx, %rsi
	callq	_realloc
	movq	-32(%rbp), %rcx
	movq	%rax, 16(%rcx)
LBB1_2:
	movq	-16(%rbp), %rax
	movq	%rax, -40(%rbp)
LBB1_3:                                 ## =>This Inner Loop Header: Depth=1
	movq	-40(%rbp), %rax
	movq	-16(%rbp), %rcx
	movslq	-8(%rbp), %rdx
	shlq	$3, %rdx
	addq	%rdx, %rcx
	cmpq	%rcx, %rax
	jae	LBB1_6
## %bb.4:                               ##   in Loop: Header=BB1_3 Depth=1
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	-32(%rbp), %rcx
	movq	24(%rcx), %rdx
	movq	%rdx, %rsi
	addq	$8, %rsi
	movq	%rsi, 24(%rcx)
	movq	%rax, (%rdx)
## %bb.5:                               ##   in Loop: Header=BB1_3 Depth=1
	movq	-40(%rbp), %rax
	addq	$8, %rax
	movq	%rax, -40(%rbp)
	jmp	LBB1_3
LBB1_6:
	movq	-32(%rbp), %rax
	cmpq	$0, 40(%rax)
	je	LBB1_18
## %bb.7:
	movq	_FUNCTYPE@GOTPCREL(%rip), %rax
	movq	-32(%rbp), %rcx
	movq	40(%rcx), %rcx
	movq	%rcx, -48(%rbp)
	movq	-48(%rbp), %rcx
	cmpq	%rax, (%rcx)
	jne	LBB1_15
## %bb.8:
	movq	-48(%rbp), %rdi
	movq	%rdi, -96(%rbp)         ## 8-byte Spill
	movq	_current_thread@TLVP(%rip), %rdi
	callq	*(%rdi)
	movq	(%rax), %rax
	movq	80(%rax), %rsi
	movq	-96(%rbp), %rdi         ## 8-byte Reload
	callq	_init_context
	movq	%rax, -56(%rbp)
	movl	$0, -60(%rbp)
LBB1_9:                                 ## =>This Inner Loop Header: Depth=1
	movl	-60(%rbp), %eax
	movq	-48(%rbp), %rcx
	cmpl	32(%rcx), %eax
	jge	LBB1_14
## %bb.10:                              ##   in Loop: Header=BB1_9 Depth=1
	movq	-48(%rbp), %rax
	movq	16(%rax), %rax
	movslq	-60(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdi
	leaq	L_.str.4(%rip), %rsi
	callq	_strcmp
	cmpl	$0, %eax
	jne	LBB1_12
## %bb.11:                              ##   in Loop: Header=BB1_9 Depth=1
	movq	-24(%rbp), %rax
	movq	-56(%rbp), %rcx
	movq	(%rcx), %rcx
	movslq	-60(%rbp), %rdx
	movq	%rax, (%rcx,%rdx,8)
	movq	-24(%rbp), %rax
	movq	-56(%rbp), %rcx
	movq	%rax, 56(%rcx)
LBB1_12:                                ##   in Loop: Header=BB1_9 Depth=1
	jmp	LBB1_13
LBB1_13:                                ##   in Loop: Header=BB1_9 Depth=1
	movl	-60(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -60(%rbp)
	jmp	LBB1_9
LBB1_14:
	jmp	LBB1_15
LBB1_15:
	movq	_BINTYPE@GOTPCREL(%rip), %rax
	movq	-48(%rbp), %rcx
	cmpq	%rax, (%rcx)
	jne	LBB1_17
## %bb.16:
	movq	-48(%rbp), %rax
	movq	%rax, -72(%rbp)
	movq	-72(%rbp), %rax
	movq	16(%rax), %rax
	movq	-24(%rbp), %rdi
	movq	-88(%rbp), %rsi
	movl	-80(%rbp), %edx
	callq	*%rax
	movq	%rax, -104(%rbp)        ## 8-byte Spill
LBB1_17:
	jmp	LBB1_18
LBB1_18:
	xorl	%eax, %eax
                                        ## kill: def $rax killed $eax
	addq	$112, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_get                    ## -- Begin function get
	.p2align	4, 0x90
_get:                                   ## @get
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$64, %rsp
	movq	%rsi, -24(%rbp)
	movl	%edx, -16(%rbp)
	movq	%rdi, -32(%rbp)
	movq	-32(%rbp), %rsi
	movq	%rsi, -40(%rbp)
	movq	-40(%rbp), %rsi
	movq	16(%rsi), %rsi
	movq	-40(%rbp), %rdi
	cmpq	24(%rdi), %rsi
	jne	LBB2_2
## %bb.1:
	movq	$0, -8(%rbp)
	jmp	LBB2_3
LBB2_2:
	movq	$-1, %rcx
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rax
	movq	%rax, -48(%rbp)
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	movq	-40(%rbp), %rdx
	movq	16(%rdx), %rdx
	addq	$8, %rdx
	movq	-40(%rbp), %rsi
	movq	24(%rsi), %rsi
	movq	-40(%rbp), %rdi
	movq	16(%rdi), %rdi
	subq	%rdi, %rsi
	sarq	$3, %rsi
	shlq	$3, %rsi
	movq	%rax, %rdi
	movq	%rsi, -56(%rbp)         ## 8-byte Spill
	movq	%rdx, %rsi
	movq	-56(%rbp), %rdx         ## 8-byte Reload
	callq	___memmove_chk
	movq	-48(%rbp), %rcx
	movq	%rcx, -8(%rbp)
	movq	%rax, -64(%rbp)         ## 8-byte Spill
LBB2_3:
	movq	-8(%rbp), %rax
	addq	$64, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_get_all                ## -- Begin function get_all
	.p2align	4, 0x90
_get_all:                               ## @get_all
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movq	%rsi, -24(%rbp)
	movl	%edx, -16(%rbp)
	movq	%rdi, -32(%rbp)
	movq	-32(%rbp), %rsi
	movq	%rsi, -40(%rbp)
	movq	-40(%rbp), %rsi
	movq	16(%rsi), %rsi
	movq	-40(%rbp), %rdi
	cmpq	24(%rdi), %rsi
	jne	LBB3_2
## %bb.1:
	movq	$0, -8(%rbp)
	jmp	LBB3_3
LBB3_2:
	movq	-40(%rbp), %rax
	movq	24(%rax), %rdi
	movq	-40(%rbp), %rax
	movq	24(%rax), %rax
	movq	-40(%rbp), %rcx
	movq	16(%rcx), %rcx
	subq	%rcx, %rax
	sarq	$3, %rax
	movl	%eax, %edx
	movl	%edx, %esi
	callq	__mktuple
	movq	%rax, -48(%rbp)
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	movq	-40(%rbp), %rcx
	movq	%rax, 24(%rcx)
	movq	-48(%rbp), %rax
	movq	%rax, -8(%rbp)
LBB3_3:
	movq	-8(%rbp), %rax
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_new_channel            ## -- Begin function new_channel
	.p2align	4, 0x90
_new_channel:                           ## @new_channel
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movl	$48, %eax
	movl	%eax, %ecx
	movq	%rdi, -16(%rbp)
	movl	%esi, -8(%rbp)
	movq	%rcx, %rdi
	callq	_dulalloc
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movl	$15, 32(%rax)
	movq	-24(%rbp), %rax
	movslq	32(%rax), %rax
	shlq	$3, %rax
	movq	%rax, %rdi
	callq	_dulalloc
	movq	-24(%rbp), %rcx
	movq	%rax, 16(%rcx)
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	movq	-24(%rbp), %rcx
	movq	%rax, 24(%rcx)
	movq	-24(%rbp), %rax
	movl	$0, 8(%rax)
	movq	-24(%rbp), %rax
	leaq	_CHANTYPE(%rip), %rcx
	movq	%rcx, (%rax)
	movq	-24(%rbp), %rax
	movq	$0, 40(%rax)
	movq	-24(%rbp), %rax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_get_chan_methods       ## -- Begin function get_chan_methods
	.p2align	4, 0x90
_get_chan_methods:                      ## @get_chan_methods
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	cmpq	$0, _get_chan_methods.methods(%rip)
	jne	LBB5_6
## %bb.1:
	callq	_new_ob
	movq	%rax, _get_chan_methods.methods(%rip)
	movl	$0, -4(%rbp)
LBB5_2:                                 ## =>This Inner Loop Header: Depth=1
	movl	-4(%rbp), %eax
	cmpl	_chan_mc(%rip), %eax
	jge	LBB5_5
## %bb.3:                               ##   in Loop: Header=BB5_2 Depth=1
	movq	_get_chan_methods.methods(%rip), %rdi
	movslq	-4(%rbp), %rax
	shlq	$5, %rax
	leaq	_chan_methods(%rip), %rcx
	addq	%rax, %rcx
	movq	(%rcx), %rax
	movq	%rdi, -16(%rbp)         ## 8-byte Spill
	movq	%rax, %rdi
	callq	_strfromchar
	movslq	-4(%rbp), %rcx
	shlq	$5, %rcx
	leaq	_chan_methods(%rip), %rdi
	addq	%rcx, %rdi
	addq	$8, %rdi
	movq	-16(%rbp), %rcx         ## 8-byte Reload
	movq	%rdi, -24(%rbp)         ## 8-byte Spill
	movq	%rcx, %rdi
	movq	%rax, %rsi
	movq	-24(%rbp), %rdx         ## 8-byte Reload
	callq	_ob_subscr_set
## %bb.4:                               ##   in Loop: Header=BB5_2 Depth=1
	movl	-4(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4(%rbp)
	jmp	LBB5_2
LBB5_5:
	jmp	LBB5_6
LBB5_6:
	movq	_get_chan_methods.methods(%rip), %rax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_dump_channel           ## -- Begin function dump_channel
	.p2align	4, 0x90
_dump_channel:                          ## @dump_channel
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$80, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	movq	%rdi, -16(%rbp)
	movq	-16(%rbp), %rdi
	movq	24(%rdi), %rdi
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	subq	%rax, %rdi
	sarq	$3, %rdi
	movl	%edi, %ecx
	movl	%ecx, -20(%rbp)
	movslq	-20(%rbp), %rax
	shlq	$3, %rax
	movq	%rax, %rdi
	callq	_dulalloc
	movq	%rax, -32(%rbp)
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -40(%rbp)
LBB6_1:                                 ## =>This Inner Loop Header: Depth=1
	movq	-40(%rbp), %rax
	movq	-16(%rbp), %rcx
	cmpq	24(%rcx), %rax
	je	LBB6_4
## %bb.2:                               ##   in Loop: Header=BB6_1 Depth=1
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	movq	-40(%rbp), %rcx
	movq	(%rcx), %rdi
	callq	*%rax
	movq	-32(%rbp), %rcx
	movq	-40(%rbp), %rdi
	movq	-16(%rbp), %rdx
	movq	16(%rdx), %rdx
	subq	%rdx, %rdi
	sarq	$3, %rdi
	movq	%rax, (%rcx,%rdi,8)
## %bb.3:                               ##   in Loop: Header=BB6_1 Depth=1
	movq	-40(%rbp), %rax
	addq	$8, %rax
	movq	%rax, -40(%rbp)
	jmp	LBB6_1
LBB6_4:
	movl	$0, -44(%rbp)
	movl	$0, -48(%rbp)
LBB6_5:                                 ## =>This Inner Loop Header: Depth=1
	movl	-48(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jge	LBB6_8
## %bb.6:                               ##   in Loop: Header=BB6_5 Depth=1
	movq	-32(%rbp), %rax
	movslq	-48(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdi
	callq	_strlen
	addq	$2, %rax
	movslq	-44(%rbp), %rcx
	addq	%rax, %rcx
	movl	%ecx, %edx
	movl	%edx, -44(%rbp)
## %bb.7:                               ##   in Loop: Header=BB6_5 Depth=1
	movl	-48(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -48(%rbp)
	jmp	LBB6_5
LBB6_8:
	movl	-44(%rbp), %eax
	addl	$3, %eax
	movslq	%eax, %rdi
	callq	_dulalloc
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rax
	movl	-44(%rbp), %ecx
	addl	$2, %ecx
	movslq	%ecx, %rdi
	movb	$0, (%rax,%rdi)
	movq	-56(%rbp), %rax
	movq	%rax, -64(%rbp)
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	addq	$1, %rdi
	movq	%rdi, -64(%rbp)
	movb	$60, (%rax)
	movl	$0, -68(%rbp)
LBB6_9:                                 ## =>This Inner Loop Header: Depth=1
	movl	-68(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jge	LBB6_12
## %bb.10:                              ##   in Loop: Header=BB6_9 Depth=1
	xorl	%esi, %esi
	movq	$-1, %rdx
	movq	-64(%rbp), %rdi
	movq	-32(%rbp), %rax
	movslq	-68(%rbp), %rcx
	movq	(%rax,%rcx,8), %r8
	leaq	L_.str.5(%rip), %rcx
	movb	$0, %al
	callq	___sprintf_chk
	movq	-64(%rbp), %rcx
	movslq	%eax, %rdx
	addq	%rdx, %rcx
	movq	%rcx, -64(%rbp)
## %bb.11:                              ##   in Loop: Header=BB6_9 Depth=1
	movl	-68(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -68(%rbp)
	jmp	LBB6_9
LBB6_12:
	movq	-64(%rbp), %rax
	movb	$62, (%rax)
	movl	$0, -72(%rbp)
LBB6_13:                                ## =>This Inner Loop Header: Depth=1
	movl	-72(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jge	LBB6_16
## %bb.14:                              ##   in Loop: Header=BB6_13 Depth=1
	movq	-32(%rbp), %rax
	movslq	-72(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdi
	callq	_free
## %bb.15:                              ##   in Loop: Header=BB6_13 Depth=1
	movl	-72(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -72(%rbp)
	jmp	LBB6_13
LBB6_16:
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	callq	_free
	movq	-56(%rbp), %rax
	addq	$80, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"in setCallback 1 argument expected but %d passed"

L_.str.1:                               ## @.str.1
	.asciz	"functional object"

L_.str.2:                               ## @.str.2
	.asciz	"builtin"

L_.str.3:                               ## @.str.3
	.asciz	"passed argument not callable"

L_.str.4:                               ## @.str.4
	.asciz	"this"

	.section	__DATA,__const
	.globl	_CHANTYPE               ## @CHANTYPE
	.p2align	3
_CHANTYPE:
	.quad	L_.str.6
	.quad	_dump_channel
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
	.long	4294967295              ## 0xffffffff
	.space	4
	.quad	_get_chan_methods

.zerofill __DATA,__bss,_get_chan_methods.methods,8,3 ## @get_chan_methods.methods
	.section	__DATA,__data
	.p2align	2               ## @chan_mc
_chan_mc:
	.long	4                       ## 0x4

	.p2align	4               ## @chan_methods
_chan_methods:
	.quad	L_.str.7
	.quad	_BINTYPE
	.long	1                       ## 0x1
	.space	4
	.quad	_setCallback
	.quad	L_.str.8
	.quad	_BINTYPE
	.long	1                       ## 0x1
	.space	4
	.quad	_push
	.quad	L_.str.9
	.quad	_BINTYPE
	.long	1                       ## 0x1
	.space	4
	.quad	_get
	.quad	L_.str.10
	.quad	_BINTYPE
	.long	1                       ## 0x1
	.space	4
	.quad	_get_all

	.section	__TEXT,__cstring,cstring_literals
L_.str.5:                               ## @.str.5
	.asciz	"%s, "

L_.str.6:                               ## @.str.6
	.asciz	"channel"

L_.str.7:                               ## @.str.7
	.asciz	"setCallback"

L_.str.8:                               ## @.str.8
	.asciz	"push"

L_.str.9:                               ## @.str.9
	.asciz	"get"

L_.str.10:                              ## @.str.10
	.asciz	"getAll"


.subsections_via_symbols
