	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 14	sdk_version 10, 14
	.globl	_dumpbool               ## -- Begin function dumpbool
	.p2align	4, 0x90
_dumpbool:                              ## @dumpbool
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movl	$16, %eax
	movl	%eax, %ecx
	movq	%rdi, -8(%rbp)
	movq	%rcx, %rdi
	callq	_dulalloc
	movq	$-1, %rdx
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rdi
	leaq	L_.str.1(%rip), %rsi
	callq	___strcpy_chk
	movq	-8(%rbp), %rcx
	movb	12(%rcx), %r8b
	shlb	$7, %r8b
	sarb	$7, %r8b
	cmpb	$0, %r8b
	movq	%rax, -24(%rbp)         ## 8-byte Spill
	je	LBB0_2
## %bb.1:
	movq	$-1, %rdx
	movq	-16(%rbp), %rdi
	leaq	L_.str.2(%rip), %rsi
	callq	___strcpy_chk
	movq	%rax, -32(%rbp)         ## 8-byte Spill
	jmp	LBB0_3
LBB0_2:
	movq	$-1, %rdx
	movq	-16(%rbp), %rdi
	leaq	L_.str.3(%rip), %rsi
	callq	___strcpy_chk
	movq	%rax, -40(%rbp)         ## 8-byte Spill
LBB0_3:
	movq	-16(%rbp), %rax
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_boolfromlexem          ## -- Begin function boolfromlexem
	.p2align	4, 0x90
_boolfromlexem:                         ## @boolfromlexem
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	$16, %eax
	movl	%eax, %ecx
	movq	%rdi, -8(%rbp)
	movq	%rcx, %rdi
	callq	_dulalloc
	xorl	%edx, %edx
	leaq	_BOOLTYPE(%rip), %rcx
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	$0, 8(%rax)
	movq	-16(%rbp), %rax
	movq	%rcx, (%rax)
	movq	-8(%rbp), %rax
	cmpq	$0, %rax
	movl	$1, %esi
	cmovnel	%esi, %edx
	movb	%dl, %r8b
	movq	-16(%rbp), %rax
	movb	12(%rax), %r9b
	andb	$1, %r8b
	andb	$-2, %r9b
	orb	%r8b, %r9b
	movb	%r9b, 12(%rax)
	movq	-16(%rbp), %rax
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"boolean"

	.section	__DATA,__const
	.globl	_BOOLTYPE               ## @BOOLTYPE
	.p2align	3
_BOOLTYPE:
	.quad	L_.str
	.quad	_dumpbool
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
	.long	0                       ## 0x0
	.space	4
	.quad	0

	.section	__TEXT,__cstring,cstring_literals
L_.str.1:                               ## @.str.1
	.space	1

L_.str.2:                               ## @.str.2
	.asciz	"true"

L_.str.3:                               ## @.str.3
	.asciz	"false"


.subsections_via_symbols
