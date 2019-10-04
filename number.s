	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 14	sdk_version 10, 14
	.globl	_num_lt                 ## -- Begin function num_lt
	.p2align	4, 0x90
_num_lt:                                ## @num_lt
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rsi
	movq	%rsi, -24(%rbp)
	movq	-16(%rbp), %rsi
	movq	%rsi, -32(%rbp)
	movq	-24(%rbp), %rsi
	movsd	16(%rsi), %xmm0         ## xmm0 = mem[0],zero
	movq	-32(%rbp), %rsi
	movsd	16(%rsi), %xmm1         ## xmm1 = mem[0],zero
	ucomisd	%xmm0, %xmm1
	seta	%al
	andb	$1, %al
	movzbl	%al, %ecx
	movb	%cl, %al
	movsbl	%al, %eax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_num_eq                 ## -- Begin function num_eq
	.p2align	4, 0x90
_num_eq:                                ## @num_eq
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -16(%rbp)
	movq	%rsi, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	LBB1_2
## %bb.1:
	movb	$0, -1(%rbp)
	jmp	LBB1_5
LBB1_2:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rdi
	leaq	L_.str(%rip), %rsi
	callq	_strcmp
	cmpl	$0, %eax
	je	LBB1_4
## %bb.3:
	movb	$0, -1(%rbp)
	jmp	LBB1_5
LBB1_4:
	movq	-16(%rbp), %rax
	movsd	16(%rax), %xmm0         ## xmm0 = mem[0],zero
	movq	-24(%rbp), %rax
	ucomisd	16(%rax), %xmm0
	sete	%cl
	setnp	%dl
	andb	%dl, %cl
	andb	$1, %cl
	movzbl	%cl, %esi
	movb	%sil, %cl
	movb	%cl, -1(%rbp)
LBB1_5:
	movsbl	-1(%rbp), %eax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_num_iadd               ## -- Begin function num_iadd
	.p2align	4, 0x90
_num_iadd:                              ## @num_iadd
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movq	%rdi, -16(%rbp)
	movq	%rsi, -24(%rbp)
	movq	-24(%rbp), %rsi
	movq	(%rsi), %rsi
	cmpl	$0, 208(%rsi)
	je	LBB2_2
## %bb.1:
	movq	$0, -8(%rbp)
	jmp	LBB2_5
LBB2_2:
	movq	-16(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -40(%rbp)
	movq	-32(%rbp), %rax
	cmpl	$1, 8(%rax)
	jle	LBB2_4
## %bb.3:
	movl	$24, %eax
	movl	%eax, %edi
	movq	-32(%rbp), %rcx
	movsd	16(%rcx), %xmm0         ## xmm0 = mem[0],zero
	movsd	%xmm0, -48(%rbp)
	callq	_ob_alloc
	leaq	_NUMTYPE(%rip), %rcx
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	%rcx, (%rax)
	movq	-32(%rbp), %rax
	movl	$0, 8(%rax)
	movsd	-48(%rbp), %xmm0        ## xmm0 = mem[0],zero
	movq	-32(%rbp), %rax
	movsd	%xmm0, 16(%rax)
LBB2_4:
	movq	-40(%rbp), %rax
	movsd	16(%rax), %xmm0         ## xmm0 = mem[0],zero
	movq	-32(%rbp), %rax
	addsd	16(%rax), %xmm0
	movsd	%xmm0, 16(%rax)
	movq	-32(%rbp), %rax
	movq	%rax, -8(%rbp)
LBB2_5:
	movq	-8(%rbp), %rax
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3               ## -- Begin function dumpnumber
LCPI3_0:
	.quad	4532020583610935537     ## double 1.0000000000000001E-5
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4
LCPI3_1:
	.quad	9223372036854775807     ## double NaN
	.quad	9223372036854775807     ## double NaN
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_dumpnumber
	.p2align	4, 0x90
_dumpnumber:                            ## @dumpnumber
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movl	$100, %eax
	movl	%eax, %ecx
	movq	%rdi, -8(%rbp)
	movq	%rcx, %rdi
	callq	_dulalloc
	movq	%rax, -16(%rbp)
	movq	-8(%rbp), %rax
	movsd	16(%rax), %xmm0         ## xmm0 = mem[0],zero
	leaq	-24(%rbp), %rdi
	callq	_modf
	movsd	LCPI3_0(%rip), %xmm1    ## xmm1 = mem[0],zero
	movsd	%xmm0, -32(%rbp)
	movsd	-32(%rbp), %xmm0        ## xmm0 = mem[0],zero
	movaps	LCPI3_1(%rip), %xmm2    ## xmm2 = [nan,nan]
	pand	%xmm2, %xmm0
	ucomisd	%xmm0, %xmm1
	jbe	LBB3_2
## %bb.1:
	xorl	%esi, %esi
	movq	$-1, %rdx
	movq	-16(%rbp), %rdi
	cvttsd2si	-24(%rbp), %r8
	leaq	L_.str.2(%rip), %rcx
	movb	$0, %al
	callq	___sprintf_chk
	movl	%eax, -36(%rbp)         ## 4-byte Spill
	jmp	LBB3_3
LBB3_2:
	xorl	%esi, %esi
	movq	$-1, %rdx
	movq	-16(%rbp), %rdi
	movq	-8(%rbp), %rax
	movsd	16(%rax), %xmm0         ## xmm0 = mem[0],zero
	leaq	L_.str.3(%rip), %rcx
	movb	$1, %al
	callq	___sprintf_chk
	movl	%eax, -40(%rbp)         ## 4-byte Spill
LBB3_3:
	movq	-16(%rbp), %rax
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_num_dealloc            ## -- Begin function num_dealloc
	.p2align	4, 0x90
_num_dealloc:                           ## @num_dealloc
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_numplus                ## -- Begin function numplus
	.p2align	4, 0x90
_numplus:                               ## @numplus
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movq	%rdi, -16(%rbp)
	movq	%rsi, -24(%rbp)
	cmpq	$0, -24(%rbp)
	je	LBB5_2
## %bb.1:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 208(%rax)
	je	LBB5_3
LBB5_2:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rdx
	leaq	L_.str.4(%rip), %rsi
	movb	$0, %al
	callq	_fprintf
	movq	$0, -8(%rbp)
	movl	%eax, -36(%rbp)         ## 4-byte Spill
	jmp	LBB5_4
LBB5_3:
	movl	$24, %eax
	movl	%eax, %edi
	callq	_ob_alloc
	leaq	_NUMTYPE(%rip), %rdi
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	%rdi, (%rax)
	movq	-32(%rbp), %rax
	movl	$0, 8(%rax)
	movq	-16(%rbp), %rax
	movsd	16(%rax), %xmm0         ## xmm0 = mem[0],zero
	movq	-24(%rbp), %rax
	addsd	16(%rax), %xmm0
	movq	-32(%rbp), %rax
	movsd	%xmm0, 16(%rax)
	movq	-32(%rbp), %rax
	movq	%rax, -8(%rbp)
LBB5_4:
	movq	-8(%rbp), %rax
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_numminus               ## -- Begin function numminus
	.p2align	4, 0x90
_numminus:                              ## @numminus
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movq	%rdi, -16(%rbp)
	movq	%rsi, -24(%rbp)
	cmpq	$0, -24(%rbp)
	je	LBB6_2
## %bb.1:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 208(%rax)
	je	LBB6_3
LBB6_2:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rdx
	leaq	L_.str.4(%rip), %rsi
	movb	$0, %al
	callq	_fprintf
	movq	$0, -8(%rbp)
	movl	%eax, -36(%rbp)         ## 4-byte Spill
	jmp	LBB6_4
LBB6_3:
	movl	$24, %eax
	movl	%eax, %edi
	callq	_ob_alloc
	leaq	_NUMTYPE(%rip), %rdi
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	%rdi, (%rax)
	movq	-32(%rbp), %rax
	movl	$0, 8(%rax)
	movq	-16(%rbp), %rax
	movsd	16(%rax), %xmm0         ## xmm0 = mem[0],zero
	movq	-24(%rbp), %rax
	subsd	16(%rax), %xmm0
	movq	-32(%rbp), %rax
	movsd	%xmm0, 16(%rax)
	movq	-32(%rbp), %rax
	movq	%rax, -8(%rbp)
LBB6_4:
	movq	-8(%rbp), %rax
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_nummult                ## -- Begin function nummult
	.p2align	4, 0x90
_nummult:                               ## @nummult
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movq	%rdi, -16(%rbp)
	movq	%rsi, -24(%rbp)
	movq	-24(%rbp), %rsi
	movq	(%rsi), %rsi
	movq	(%rsi), %rdi
	leaq	L_.str(%rip), %rsi
	callq	_strcmp
	cmpl	$0, %eax
	je	LBB7_2
## %bb.1:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rdx
	leaq	L_.str.4(%rip), %rsi
	movb	$0, %al
	callq	_fprintf
	movq	$0, -8(%rbp)
	movl	%eax, -36(%rbp)         ## 4-byte Spill
	jmp	LBB7_3
LBB7_2:
	movl	$24, %eax
	movl	%eax, %edi
	callq	_ob_alloc
	leaq	_NUMTYPE(%rip), %rdi
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	%rdi, (%rax)
	movq	-32(%rbp), %rax
	movl	$0, 8(%rax)
	movq	-16(%rbp), %rax
	movsd	16(%rax), %xmm0         ## xmm0 = mem[0],zero
	movq	-24(%rbp), %rax
	mulsd	16(%rax), %xmm0
	movq	-32(%rbp), %rax
	movsd	%xmm0, 16(%rax)
	movq	-32(%rbp), %rax
	movq	%rax, -8(%rbp)
LBB7_3:
	movq	-8(%rbp), %rax
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_numdiv                 ## -- Begin function numdiv
	.p2align	4, 0x90
_numdiv:                                ## @numdiv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movq	%rdi, -16(%rbp)
	movq	%rsi, -24(%rbp)
	movq	-24(%rbp), %rsi
	movq	(%rsi), %rsi
	movq	(%rsi), %rdi
	leaq	L_.str(%rip), %rsi
	callq	_strcmp
	cmpl	$0, %eax
	je	LBB8_2
## %bb.1:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rdx
	leaq	L_.str.4(%rip), %rsi
	movb	$0, %al
	callq	_fprintf
	movq	$0, -8(%rbp)
	movl	%eax, -36(%rbp)         ## 4-byte Spill
	jmp	LBB8_3
LBB8_2:
	movl	$24, %eax
	movl	%eax, %edi
	callq	_ob_alloc
	leaq	_NUMTYPE(%rip), %rdi
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	%rdi, (%rax)
	movq	-32(%rbp), %rax
	movl	$0, 8(%rax)
	movq	-16(%rbp), %rax
	movsd	16(%rax), %xmm0         ## xmm0 = mem[0],zero
	movq	-24(%rbp), %rax
	divsd	16(%rax), %xmm0
	movq	-32(%rbp), %rax
	movsd	%xmm0, 16(%rax)
	movq	-32(%rbp), %rax
	movq	%rax, -8(%rbp)
LBB8_3:
	movq	-8(%rbp), %rax
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_numfromdouble          ## -- Begin function numfromdouble
	.p2align	4, 0x90
_numfromdouble:                         ## @numfromdouble
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	$24, %eax
	movl	%eax, %edi
	movsd	%xmm0, -8(%rbp)
	callq	_malloc
	leaq	_NUMTYPE(%rip), %rdi
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	$0, 8(%rax)
	movsd	-8(%rbp), %xmm0         ## xmm0 = mem[0],zero
	movq	-16(%rbp), %rax
	movsd	%xmm0, 16(%rax)
	movq	-16(%rbp), %rax
	movq	%rdi, (%rax)
	movq	-16(%rbp), %rax
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"number"

	.section	__DATA,__const
	.globl	_NUMTYPE                ## @NUMTYPE
	.p2align	3
_NUMTYPE:
	.quad	L_.str
	.quad	_dumpnumber
	.quad	0
	.quad	_num_dealloc
	.quad	_numplus
	.quad	_numminus
	.quad	_nummult
	.quad	_numdiv
	.quad	_num_iadd
	.quad	0
	.quad	0
	.quad	0
	.quad	_num_lt
	.quad	0
	.quad	_num_eq
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
L_.str.2:                               ## @.str.2
	.asciz	"%ld"

L_.str.3:                               ## @.str.3
	.asciz	"%lf"

L_.str.4:                               ## @.str.4
	.asciz	"invalid right operand type: %s, but number expected\n"

	.weak_reference _ob_alloc

.subsections_via_symbols
