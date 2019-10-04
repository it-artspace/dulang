	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 14	sdk_version 10, 14
	.globl	___bin_object           ## -- Begin function __bin_object
	.p2align	4, 0x90
___bin_object:                          ## @__bin_object
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$112, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -16(%rbp)
	cmpl	$0, -16(%rbp)
	jne	LBB0_2
## %bb.1:
	callq	_new_ob
	movq	%rax, -8(%rbp)
	jmp	LBB0_26
LBB0_2:
	cmpl	$1, -16(%rbp)
	jne	LBB0_13
## %bb.3:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	(%rax), %rdi
	leaq	L_.str(%rip), %rsi
	callq	_strcmp
	cmpl	$0, %eax
	jne	LBB0_13
## %bb.4:
	callq	_new_ob
	movq	%rax, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rdi
	movq	%rdi, -104(%rbp)        ## 8-byte Spill
	movq	_current_thread@TLVP(%rip), %rdi
	callq	*(%rdi)
	movq	(%rax), %rax
	movq	80(%rax), %rsi
	movq	-104(%rbp), %rdi        ## 8-byte Reload
	callq	_init_context
	movq	%rax, -48(%rbp)
	movl	$-1, -52(%rbp)
	movl	$0, -56(%rbp)
LBB0_5:                                 ## =>This Inner Loop Header: Depth=1
	movl	-56(%rbp), %eax
	movq	-40(%rbp), %rcx
	cmpl	32(%rcx), %eax
	jge	LBB0_10
## %bb.6:                               ##   in Loop: Header=BB0_5 Depth=1
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	movslq	-56(%rbp), %rcx
	movq	(%rax,%rcx,8), %rsi
	leaq	L_.str.1(%rip), %rdi
	callq	_strcmp
	cmpl	$0, %eax
	jne	LBB0_8
## %bb.7:
	movl	-56(%rbp), %eax
	movl	%eax, -52(%rbp)
	jmp	LBB0_10
LBB0_8:                                 ##   in Loop: Header=BB0_5 Depth=1
	jmp	LBB0_9
LBB0_9:                                 ##   in Loop: Header=BB0_5 Depth=1
	movl	-56(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -56(%rbp)
	jmp	LBB0_5
LBB0_10:
	cmpl	$-1, -52(%rbp)
	je	LBB0_12
## %bb.11:
	movq	-32(%rbp), %rax
	movq	-48(%rbp), %rcx
	movq	(%rcx), %rcx
	movslq	-52(%rbp), %rdx
	movq	%rax, (%rcx,%rdx,8)
	movq	-32(%rbp), %rax
	movq	-48(%rbp), %rcx
	movq	%rax, 56(%rcx)
LBB0_12:
	movq	-32(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB0_26
LBB0_13:
	callq	_new_ob
	movq	%rax, -64(%rbp)
	movl	$0, -68(%rbp)
LBB0_14:                                ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_18 Depth 2
	movl	-68(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jge	LBB0_25
## %bb.15:                              ##   in Loop: Header=BB0_14 Depth=1
	movq	-24(%rbp), %rax
	movslq	-68(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	movq	(%rax), %rax
	movq	(%rax), %rdi
	leaq	L_.str.2(%rip), %rsi
	callq	_strcmp
	cmpl	$0, %eax
	je	LBB0_17
## %bb.16:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	movq	-24(%rbp), %rax
	movslq	-68(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	movq	(%rax), %rax
	movq	(%rax), %rdx
	leaq	L_.str.3(%rip), %rsi
	movb	$0, %al
	callq	_fprintf
	movq	-64(%rbp), %rdi
	movl	%eax, -108(%rbp)        ## 4-byte Spill
	callq	_obj_dealloc
	movq	$0, -8(%rbp)
	jmp	LBB0_26
LBB0_17:                                ##   in Loop: Header=BB0_14 Depth=1
	movq	-24(%rbp), %rax
	movslq	-68(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	movq	%rax, -80(%rbp)
	movl	$0, -84(%rbp)
LBB0_18:                                ##   Parent Loop BB0_14 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	-84(%rbp), %eax
	movq	-80(%rbp), %rcx
	cmpl	16(%rcx), %eax
	jge	LBB0_23
## %bb.19:                              ##   in Loop: Header=BB0_18 Depth=2
	movq	-80(%rbp), %rax
	movq	24(%rax), %rax
	movslq	-84(%rbp), %rcx
	shlq	$4, %rcx
	addq	%rcx, %rax
	cmpq	$0, (%rax)
	je	LBB0_21
## %bb.20:                              ##   in Loop: Header=BB0_18 Depth=2
	movq	-80(%rbp), %rax
	movq	24(%rax), %rax
	movslq	-84(%rbp), %rcx
	shlq	$4, %rcx
	addq	%rcx, %rax
	movq	8(%rax), %rax
	movq	%rax, -96(%rbp)
	movq	-64(%rbp), %rdi
	movq	-80(%rbp), %rax
	movq	24(%rax), %rax
	movslq	-84(%rbp), %rcx
	shlq	$4, %rcx
	addq	%rcx, %rax
	movq	(%rax), %rsi
	movq	-96(%rbp), %rdx
	callq	_ob_subscr_set
LBB0_21:                                ##   in Loop: Header=BB0_18 Depth=2
	jmp	LBB0_22
LBB0_22:                                ##   in Loop: Header=BB0_18 Depth=2
	movl	-84(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -84(%rbp)
	jmp	LBB0_18
LBB0_23:                                ##   in Loop: Header=BB0_14 Depth=1
	jmp	LBB0_24
LBB0_24:                                ##   in Loop: Header=BB0_14 Depth=1
	movl	-68(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -68(%rbp)
	jmp	LBB0_14
LBB0_25:
	movq	-64(%rbp), %rax
	movq	%rax, -8(%rbp)
LBB0_26:
	movq	-8(%rbp), %rax
	addq	$112, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"functional object"

L_.str.1:                               ## @.str.1
	.asciz	"this"

L_.str.2:                               ## @.str.2
	.asciz	"object"

L_.str.3:                               ## @.str.3
	.asciz	"cannot inherit object from %s type"


.subsections_via_symbols
