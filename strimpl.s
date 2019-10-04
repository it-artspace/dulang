	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 14	sdk_version 10, 14
	.globl	_str_len                ## -- Begin function str_len
	.p2align	4, 0x90
_str_len:                               ## @str_len
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
	cmpl	$0, -16(%rbp)
	jle	LBB0_2
## %bb.1:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	movl	-16(%rbp), %edx
	leaq	L_.str(%rip), %rsi
	movb	$0, %al
	callq	_fprintf
	movq	$0, -8(%rbp)
	movl	%eax, -36(%rbp)         ## 4-byte Spill
	jmp	LBB0_3
LBB0_2:
	movq	-32(%rbp), %rax
	movl	12(%rax), %ecx
	cvtsi2sdl	%ecx, %xmm0
	callq	_numfromdouble
	movq	%rax, -8(%rbp)
LBB0_3:
	movq	-8(%rbp), %rax
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_strformat              ## -- Begin function strformat
	.p2align	4, 0x90
_strformat:                             ## @strformat
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$128, %rsp
	movq	%rsi, -16(%rbp)
	movl	%edx, -8(%rbp)
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rsi
	movq	%rsi, -32(%rbp)
	movq	-16(%rbp), %rsi
	movslq	-8(%rbp), %rdi
	shlq	$3, %rdi
	addq	%rdi, %rsi
	movl	-8(%rbp), %edx
	movq	%rsi, %rdi
	movl	%edx, %esi
	callq	__mktuple
	movl	$50000, %edx            ## imm = 0xC350
	movl	%edx, %edi
	movq	%rax, -40(%rbp)
	movq	-32(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, -48(%rbp)
	movq	-32(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, -56(%rbp)
	callq	_malloc
	movq	%rax, -64(%rbp)
	movq	-64(%rbp), %rax
	movq	%rax, -72(%rbp)
	xorps	%xmm0, %xmm0
	callq	_numfromdouble
	movq	%rax, -80(%rbp)
	movq	-32(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, -88(%rbp)
LBB1_1:                                 ## =>This Inner Loop Header: Depth=1
	movq	-88(%rbp), %rax
	movq	-32(%rbp), %rcx
	movq	24(%rcx), %rcx
	movq	-32(%rbp), %rdx
	movslq	12(%rdx), %rdx
	addq	%rdx, %rcx
	cmpq	%rcx, %rax
	jae	LBB1_14
## %bb.2:                               ##   in Loop: Header=BB1_1 Depth=1
	movq	-88(%rbp), %rax
	movsbl	(%rax), %ecx
	cmpl	$36, %ecx
	jne	LBB1_11
## %bb.3:                               ##   in Loop: Header=BB1_1 Depth=1
	movq	-88(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -88(%rbp)
	movq	-88(%rbp), %rdi
	leaq	-104(%rbp), %rsi
	callq	_strtod
	cvttsd2si	%xmm0, %ecx
	movl	%ecx, -92(%rbp)
	movq	-104(%rbp), %rax
	addq	$-1, %rax
	movq	%rax, -88(%rbp)
	movl	-92(%rbp), %ecx
	cvtsi2sdl	%ecx, %xmm0
	movq	-80(%rbp), %rax
	movsd	%xmm0, 16(%rax)
	movq	-40(%rbp), %rax
	movq	-80(%rbp), %rsi
	movq	%rax, %rdi
	callq	_tuple_sub_get
	movq	%rax, -112(%rbp)
	movq	-112(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$1, 208(%rax)
	jne	LBB1_5
## %bb.4:                               ##   in Loop: Header=BB1_1 Depth=1
	xorl	%esi, %esi
	movq	$-1, %rdx
	movq	-72(%rbp), %rdi
	movq	-112(%rbp), %rax
	movl	12(%rax), %r8d
	movq	-112(%rbp), %rax
	movq	24(%rax), %r9
	leaq	L_.str.1(%rip), %rcx
	movb	$0, %al
	callq	___sprintf_chk
	movq	-72(%rbp), %rcx
	movslq	%eax, %rdx
	addq	%rdx, %rcx
	movq	%rcx, -72(%rbp)
	jmp	LBB1_13
LBB1_5:                                 ##   in Loop: Header=BB1_1 Depth=1
	movq	-112(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$5, 208(%rax)
	jne	LBB1_7
## %bb.6:                               ##   in Loop: Header=BB1_1 Depth=1
	jmp	LBB1_13
LBB1_7:                                 ##   in Loop: Header=BB1_1 Depth=1
	cmpq	$0, -112(%rbp)
	je	LBB1_10
## %bb.8:                               ##   in Loop: Header=BB1_1 Depth=1
	movq	-112(%rbp), %rax
	movq	(%rax), %rax
	cmpq	$0, 8(%rax)
	je	LBB1_10
## %bb.9:                               ##   in Loop: Header=BB1_1 Depth=1
	movq	-112(%rbp), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rax
	movq	-112(%rbp), %rdi
	callq	*%rax
	xorl	%esi, %esi
	movq	$-1, %rdx
	movq	%rax, -120(%rbp)
	movq	-72(%rbp), %rdi
	movq	-120(%rbp), %r8
	leaq	L_.str.2(%rip), %rcx
	movb	$0, %al
	callq	___sprintf_chk
	movq	-72(%rbp), %rcx
	movslq	%eax, %rdx
	addq	%rdx, %rcx
	movq	%rcx, -72(%rbp)
	movq	-120(%rbp), %rdi
	callq	_free
LBB1_10:                                ##   in Loop: Header=BB1_1 Depth=1
	jmp	LBB1_12
LBB1_11:                                ##   in Loop: Header=BB1_1 Depth=1
	movq	-88(%rbp), %rax
	movb	(%rax), %cl
	movq	-72(%rbp), %rax
	movq	%rax, %rdx
	addq	$1, %rdx
	movq	%rdx, -72(%rbp)
	movb	%cl, (%rax)
LBB1_12:                                ##   in Loop: Header=BB1_1 Depth=1
	jmp	LBB1_13
LBB1_13:                                ##   in Loop: Header=BB1_1 Depth=1
	movq	-88(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -88(%rbp)
	jmp	LBB1_1
LBB1_14:
	movq	-72(%rbp), %rax
	movb	$0, (%rax)
	movq	-64(%rbp), %rdi
	callq	_strfromchar
	addq	$128, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_strfromchar            ## -- Begin function strfromchar
	.p2align	4, 0x90
_strfromchar:                           ## @strfromchar
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	$40, %eax
	movl	%eax, %ecx
	movq	%rdi, -8(%rbp)
	movq	%rcx, %rdi
	callq	_dulalloc
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	leaq	_STRTYPE(%rip), %rcx
	movq	%rcx, (%rax)
	movq	-16(%rbp), %rax
	movl	$0, 8(%rax)
	movq	-16(%rbp), %rax
	movb	$0, 21(%rax)
	movq	-8(%rbp), %rdi
	callq	_strlen
	movl	%eax, %edx
	movq	-16(%rbp), %rax
	movl	%edx, 12(%rax)
	movq	-16(%rbp), %rax
	movl	12(%rax), %edx
	movq	-16(%rbp), %rax
	movl	%edx, 16(%rax)
	movq	-8(%rbp), %rdi
	callq	_strdup
	movq	-16(%rbp), %rcx
	movq	%rax, 24(%rcx)
	movq	-16(%rbp), %rax
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_get_str_methods        ## -- Begin function get_str_methods
	.p2align	4, 0x90
_get_str_methods:                       ## @get_str_methods
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	cmpq	$0, _get_str_methods.methods(%rip)
	jne	LBB3_6
## %bb.1:
	callq	_new_ob
	movq	%rax, _get_str_methods.methods(%rip)
	movl	$0, -4(%rbp)
LBB3_2:                                 ## =>This Inner Loop Header: Depth=1
	movl	-4(%rbp), %eax
	cmpl	_str_methods_count(%rip), %eax
	jge	LBB3_5
## %bb.3:                               ##   in Loop: Header=BB3_2 Depth=1
	movq	_get_str_methods.methods(%rip), %rdi
	movslq	-4(%rbp), %rax
	shlq	$5, %rax
	leaq	_string_methods(%rip), %rcx
	addq	%rax, %rcx
	movq	(%rcx), %rax
	movq	%rdi, -16(%rbp)         ## 8-byte Spill
	movq	%rax, %rdi
	callq	_strfromchar
	movslq	-4(%rbp), %rcx
	shlq	$5, %rcx
	leaq	_string_methods(%rip), %rdi
	addq	%rcx, %rdi
	addq	$8, %rdi
	movq	-16(%rbp), %rcx         ## 8-byte Reload
	movq	%rdi, -24(%rbp)         ## 8-byte Spill
	movq	%rcx, %rdi
	movq	%rax, %rsi
	movq	-24(%rbp), %rdx         ## 8-byte Reload
	callq	_ob_subscr_set
## %bb.4:                               ##   in Loop: Header=BB3_2 Depth=1
	movl	-4(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4(%rbp)
	jmp	LBB3_2
LBB3_5:
	jmp	LBB3_6
LBB3_6:
	movq	_get_str_methods.methods(%rip), %rax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_eq_str                 ## -- Begin function eq_str
	.p2align	4, 0x90
_eq_str:                                ## @eq_str
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
	jne	LBB4_2
## %bb.1:
	movb	$0, -1(%rbp)
	jmp	LBB4_7
LBB4_2:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rdi
	leaq	L_.str.3(%rip), %rsi
	callq	_strcmp
	cmpl	$0, %eax
	jne	LBB4_6
## %bb.3:
	movq	-16(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	12(%rax), %ecx
	movq	-32(%rbp), %rax
	cmpl	12(%rax), %ecx
	je	LBB4_5
## %bb.4:
	movb	$0, -1(%rbp)
	jmp	LBB4_7
LBB4_5:
	movq	-32(%rbp), %rax
	movq	24(%rax), %rdi
	movq	-40(%rbp), %rax
	movq	24(%rax), %rsi
	movq	-40(%rbp), %rax
	movslq	12(%rax), %rdx
	callq	_strncmp
	cmpl	$0, %eax
	sete	%cl
	andb	$1, %cl
	movzbl	%cl, %eax
	movb	%al, %cl
	movb	%cl, -1(%rbp)
	jmp	LBB4_7
LBB4_6:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	leaq	L_.str.4(%rip), %rsi
	movb	$0, %al
	callq	_fprintf
	movb	$0, -1(%rbp)
	movl	%eax, -44(%rbp)         ## 4-byte Spill
LBB4_7:
	movsbl	-1(%rbp), %eax
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_str_subscr_get         ## -- Begin function str_subscr_get
	.p2align	4, 0x90
_str_subscr_get:                        ## @str_subscr_get
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$64, %rsp
	movq	%rdi, -16(%rbp)
	movq	%rsi, -24(%rbp)
	movq	-16(%rbp), %rsi
	movq	%rsi, -32(%rbp)
	movq	-24(%rbp), %rsi
	movq	(%rsi), %rsi
	cmpl	$0, 208(%rsi)
	je	LBB5_2
## %bb.1:
	movq	$0, -8(%rbp)
	jmp	LBB5_8
LBB5_2:
	movq	-24(%rbp), %rax
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	xorps	%xmm0, %xmm0
	ucomisd	16(%rax), %xmm0
	jbe	LBB5_4
## %bb.3:
	movq	-32(%rbp), %rax
	movl	12(%rax), %ecx
	cvtsi2sdl	%ecx, %xmm0
	movq	-40(%rbp), %rax
	addsd	16(%rax), %xmm0
	movsd	%xmm0, 16(%rax)
LBB5_4:
	movq	-40(%rbp), %rax
	xorps	%xmm0, %xmm0
	ucomisd	16(%rax), %xmm0
	ja	LBB5_6
## %bb.5:
	movq	-40(%rbp), %rax
	movsd	16(%rax), %xmm0         ## xmm0 = mem[0],zero
	movq	-32(%rbp), %rax
	movl	12(%rax), %ecx
	cvtsi2sdl	%ecx, %xmm1
	ucomisd	%xmm1, %xmm0
	jbe	LBB5_7
LBB5_6:
	movq	$0, -8(%rbp)
	jmp	LBB5_8
LBB5_7:
	movl	$1, %eax
	movl	%eax, %esi
	movq	-32(%rbp), %rcx
	movq	24(%rcx), %rcx
	movq	-40(%rbp), %rdx
	cvttsd2si	16(%rdx), %eax
	movslq	%eax, %rdx
	addq	%rdx, %rcx
	movq	%rcx, %rdi
	callq	_strndup
	movq	%rax, -48(%rbp)
	movq	-48(%rbp), %rdi
	callq	_strfromchar
	movq	%rax, -56(%rbp)
	movq	-48(%rbp), %rdi
	callq	_free
	movq	-56(%rbp), %rax
	movq	%rax, -8(%rbp)
LBB5_8:
	movq	-8(%rbp), %rax
	addq	$64, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_str_subscr_set         ## -- Begin function str_subscr_set
	.p2align	4, 0x90
_str_subscr_set:                        ## @str_subscr_set
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
	movq	-24(%rbp), %rdx
	movq	(%rdx), %rdx
	cmpl	$1, 208(%rdx)
	jne	LBB6_2
## %bb.1:
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	cmpl	$0, 208(%rax)
	je	LBB6_3
LBB6_2:
	jmp	LBB6_11
LBB6_3:
	movq	-16(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	cmpl	$1, 12(%rax)
	je	LBB6_5
## %bb.4:
	jmp	LBB6_11
LBB6_5:
	movq	-8(%rbp), %rax
	movq	%rax, -48(%rbp)
	movq	-32(%rbp), %rax
	xorps	%xmm0, %xmm0
	ucomisd	16(%rax), %xmm0
	jbe	LBB6_7
## %bb.6:
	movq	-48(%rbp), %rax
	movl	12(%rax), %ecx
	movq	-16(%rbp), %rax
	movslq	%ecx, %rdx
	shlq	$4, %rdx
	addq	%rdx, %rax
	movq	%rax, -16(%rbp)
LBB6_7:
	movq	-32(%rbp), %rax
	xorps	%xmm0, %xmm0
	ucomisd	16(%rax), %xmm0
	ja	LBB6_9
## %bb.8:
	movq	-32(%rbp), %rax
	movsd	16(%rax), %xmm0         ## xmm0 = mem[0],zero
	movq	-48(%rbp), %rax
	movl	12(%rax), %ecx
	cvtsi2sdl	%ecx, %xmm1
	ucomisd	%xmm1, %xmm0
	jbe	LBB6_10
LBB6_9:
	jmp	LBB6_11
LBB6_10:
	movq	-40(%rbp), %rax
	movq	24(%rax), %rax
	movb	(%rax), %cl
	movq	-48(%rbp), %rax
	movq	24(%rax), %rax
	movq	-32(%rbp), %rdx
	cvttsd2si	16(%rdx), %esi
	movslq	%esi, %rdx
	movb	%cl, (%rax,%rdx)
LBB6_11:
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3               ## -- Begin function str_iter_next
LCPI7_0:
	.quad	4607182418800017408     ## double 1
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_str_iter_next
	.p2align	4, 0x90
_str_iter_next:                         ## @str_iter_next
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movsd	LCPI7_0(%rip), %xmm0    ## xmm0 = mem[0],zero
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
	jb	LBB7_2
## %bb.1:
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	callq	_free
	movq	$0, -8(%rbp)
	jmp	LBB7_3
LBB7_2:
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
LBB7_3:
	movq	-8(%rbp), %rax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_unpack_str_iter        ## -- Begin function unpack_str_iter
	.p2align	4, 0x90
_unpack_str_iter:                       ## @unpack_str_iter
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
	movq	16(%rdi), %rdi
	movq	-16(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rsi
	callq	_str_subscr_get
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_init_str_iter          ## -- Begin function init_str_iter
	.p2align	4, 0x90
_init_str_iter:                         ## @init_str_iter
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movl	$32, %eax
	movl	%eax, %ecx
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	movq	%rdi, -16(%rbp)
	movq	%rcx, %rdi
	callq	_dulalloc
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	leaq	_STRITERTYPE(%rip), %rcx
	movq	%rcx, (%rax)
	movq	-24(%rbp), %rax
	movl	$1, 8(%rax)
	movq	-16(%rbp), %rax
	movq	-24(%rbp), %rcx
	movq	%rax, 16(%rcx)
	xorps	%xmm0, %xmm0
	callq	_numfromdouble
	movq	-24(%rbp), %rcx
	movq	%rax, 24(%rcx)
	movq	-24(%rbp), %rax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_str_iadd               ## -- Begin function str_iadd
	.p2align	4, 0x90
_str_iadd:                              ## @str_iadd
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$80, %rsp
	movq	%rdi, -16(%rbp)
	movq	%rsi, -24(%rbp)
	movq	-24(%rbp), %rsi
	movq	(%rsi), %rsi
	cmpl	$1, 208(%rsi)
	je	LBB10_2
## %bb.1:
	movq	$0, -8(%rbp)
	jmp	LBB10_10
LBB10_2:
	movq	-16(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -40(%rbp)
	movq	-32(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, -48(%rbp)
	movq	-32(%rbp), %rax
	movl	12(%rax), %ecx
	movl	%ecx, -52(%rbp)
	movq	-32(%rbp), %rax
	cmpl	$1, 8(%rax)
	jle	LBB10_4
## %bb.3:
	callq	_allocstr
	movq	%rax, -32(%rbp)
	movslq	-52(%rbp), %rdi
	callq	_malloc
	movq	$-1, %rcx
	movq	-32(%rbp), %rdi
	movq	%rax, 24(%rdi)
	movl	-52(%rbp), %edx
	movq	-32(%rbp), %rax
	movl	%edx, 12(%rax)
	movq	-32(%rbp), %rax
	movq	24(%rax), %rdi
	movq	-48(%rbp), %rsi
	movslq	-52(%rbp), %rdx
	callq	___memcpy_chk
	movq	%rax, -64(%rbp)         ## 8-byte Spill
LBB10_4:
	movq	-32(%rbp), %rax
	movl	16(%rax), %ecx
	movq	-32(%rbp), %rax
	movl	12(%rax), %edx
	movq	-40(%rbp), %rax
	addl	12(%rax), %edx
	cmpl	%edx, %ecx
	jge	LBB10_9
## %bb.5:
	jmp	LBB10_6
LBB10_6:                                ## =>This Inner Loop Header: Depth=1
	movq	-32(%rbp), %rax
	movl	16(%rax), %ecx
	movq	-32(%rbp), %rax
	movl	12(%rax), %edx
	movq	-40(%rbp), %rax
	addl	12(%rax), %edx
	cmpl	%edx, %ecx
	jge	LBB10_8
## %bb.7:                               ##   in Loop: Header=BB10_6 Depth=1
	movq	-32(%rbp), %rax
	movl	16(%rax), %ecx
	shll	$1, %ecx
	movl	%ecx, 16(%rax)
	jmp	LBB10_6
LBB10_8:
	movq	-32(%rbp), %rax
	movq	24(%rax), %rdi
	movq	-32(%rbp), %rax
	movslq	16(%rax), %rsi
	callq	_realloc
	movq	-32(%rbp), %rsi
	movq	%rax, 24(%rsi)
LBB10_9:
	movq	$-1, %rcx
	movq	-32(%rbp), %rax
	movq	24(%rax), %rax
	movq	-32(%rbp), %rdx
	movslq	12(%rdx), %rdx
	addq	%rdx, %rax
	movq	-40(%rbp), %rdx
	movq	24(%rdx), %rsi
	movq	-40(%rbp), %rdx
	movslq	12(%rdx), %rdx
	movq	%rax, %rdi
	callq	___strncpy_chk
	movq	-40(%rbp), %rcx
	movl	12(%rcx), %r8d
	movq	-32(%rbp), %rcx
	addl	12(%rcx), %r8d
	movl	%r8d, 12(%rcx)
	movq	-32(%rbp), %rcx
	movq	%rcx, -8(%rbp)
	movq	%rax, -72(%rbp)         ## 8-byte Spill
LBB10_10:
	movq	-8(%rbp), %rax
	addq	$80, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_allocstr               ## -- Begin function allocstr
	.p2align	4, 0x90
_allocstr:                              ## @allocstr
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	$40, %eax
	movl	%eax, %edi
	callq	_dulalloc
	movl	$15, %ecx
	movl	%ecx, %edi
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	leaq	_STRTYPE(%rip), %rdx
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	movl	$0, 12(%rax)
	movq	-8(%rbp), %rax
	movb	$0, 21(%rax)
	callq	_dulalloc
	movq	-8(%rbp), %rdx
	movq	%rax, 24(%rdx)
	movq	-8(%rbp), %rax
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_dumpstr                ## -- Begin function dumpstr
	.p2align	4, 0x90
_dumpstr:                               ## @dumpstr
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
	movl	12(%rdi), %eax
	addl	$1, %eax
	movslq	%eax, %rdi
	callq	_dulalloc
	movq	%rax, -16(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	-8(%rbp), %rax
	movl	12(%rax), %ecx
	movl	%ecx, -28(%rbp)
	movq	-24(%rbp), %rdi
	movq	-16(%rbp), %rsi
	callq	_dump_cons
	movq	-16(%rbp), %rax
	movslq	-28(%rbp), %rsi
	movb	$0, (%rax,%rsi)
	movq	-16(%rbp), %rax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_destrstr               ## -- Begin function destrstr
	.p2align	4, 0x90
_destrstr:                              ## @destrstr
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
	cmpb	$0, 21(%rdi)
	jne	LBB13_2
## %bb.1:
	movq	-16(%rbp), %rax
	movq	24(%rax), %rdi
	callq	_free
	jmp	LBB13_7
LBB13_2:
	movq	-16(%rbp), %rax
	movq	24(%rax), %rax
	movl	8(%rax), %ecx
	addl	$-1, %ecx
	movl	%ecx, 8(%rax)
	cmpl	$0, %ecx
	jne	LBB13_4
## %bb.3:
	movq	-16(%rbp), %rax
	movq	24(%rax), %rdi
	callq	_ob_dealloc
LBB13_4:
	movq	-16(%rbp), %rax
	movq	32(%rax), %rax
	movl	8(%rax), %ecx
	addl	$-1, %ecx
	movl	%ecx, 8(%rax)
	cmpl	$0, %ecx
	jne	LBB13_6
## %bb.5:
	movq	-16(%rbp), %rax
	movq	32(%rax), %rdi
	callq	_ob_dealloc
LBB13_6:
	jmp	LBB13_7
LBB13_7:
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_concatstr              ## -- Begin function concatstr
	.p2align	4, 0x90
_concatstr:                             ## @concatstr
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
	cmpl	$1, 208(%rsi)
	je	LBB14_2
## %bb.1:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rdx
	leaq	L_.str.6(%rip), %rsi
	movb	$0, %al
	callq	_fprintf
	movq	$0, -8(%rbp)
	movl	%eax, -36(%rbp)         ## 4-byte Spill
	jmp	LBB14_7
LBB14_2:
	movl	$40, %eax
	movl	%eax, %edi
	callq	_malloc
	movq	%rax, -32(%rbp)
	cmpq	$0, -16(%rbp)
	je	LBB14_4
## %bb.3:
	movq	-16(%rbp), %rax
	movl	8(%rax), %ecx
	addl	$1, %ecx
	movl	%ecx, 8(%rax)
LBB14_4:
	cmpq	$0, -24(%rbp)
	je	LBB14_6
## %bb.5:
	movq	-24(%rbp), %rax
	movl	8(%rax), %ecx
	addl	$1, %ecx
	movl	%ecx, 8(%rax)
LBB14_6:
	movq	-32(%rbp), %rax
	movl	$0, 8(%rax)
	movq	-32(%rbp), %rax
	movb	$1, 21(%rax)
	movq	-32(%rbp), %rax
	leaq	_STRTYPE(%rip), %rcx
	movq	%rcx, (%rax)
	movq	-16(%rbp), %rax
	movq	-32(%rbp), %rcx
	movq	%rax, 24(%rcx)
	movq	-24(%rbp), %rax
	movq	-32(%rbp), %rcx
	movq	%rax, 32(%rcx)
	movq	-16(%rbp), %rax
	movl	12(%rax), %edx
	movq	-24(%rbp), %rax
	addl	12(%rax), %edx
	movq	-32(%rbp), %rax
	movl	%edx, 12(%rax)
	movq	-32(%rbp), %rax
	movq	%rax, -8(%rbp)
LBB14_7:
	movq	-8(%rbp), %rax
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_dump_cons              ## -- Begin function dump_cons
	.p2align	4, 0x90
_dump_cons:                             ## @dump_cons
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rsi
	cmpb	$0, 21(%rsi)
	jne	LBB15_2
## %bb.1:
	movq	$-1, %rcx
	movq	-16(%rbp), %rdi
	movq	-8(%rbp), %rax
	movq	24(%rax), %rsi
	movq	-8(%rbp), %rax
	movslq	12(%rax), %rdx
	callq	___memcpy_chk
	movq	%rax, -32(%rbp)         ## 8-byte Spill
	jmp	LBB15_3
LBB15_2:
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	movl	12(%rax), %ecx
	movl	%ecx, -20(%rbp)
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	movq	-16(%rbp), %rsi
	movq	%rax, %rdi
	callq	_dump_cons
	movq	-8(%rbp), %rax
	movq	32(%rax), %rax
	movq	-16(%rbp), %rsi
	movslq	-20(%rbp), %rdi
	addq	%rdi, %rsi
	movq	%rax, %rdi
	callq	_dump_cons
LBB15_3:
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_strleng                ## -- Begin function strleng
	.p2align	4, 0x90
_strleng:                               ## @strleng
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	movl	12(%rdi), %eax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_strfromnchar           ## -- Begin function strfromnchar
	.p2align	4, 0x90
_strfromnchar:                          ## @strfromnchar
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movl	$40, %eax
	movl	%eax, %ecx
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movq	%rcx, %rdi
	callq	_dulalloc
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	leaq	_STRTYPE(%rip), %rcx
	movq	%rcx, (%rax)
	movq	-24(%rbp), %rax
	movl	$0, 8(%rax)
	movq	-24(%rbp), %rax
	movb	$0, 21(%rax)
	movl	-12(%rbp), %esi
	movq	-24(%rbp), %rax
	movl	%esi, 12(%rax)
	movl	-12(%rbp), %esi
	movq	-24(%rbp), %rax
	movl	%esi, 16(%rax)
	movq	-8(%rbp), %rdi
	movslq	-12(%rbp), %rsi
	callq	_strndup
	movq	-24(%rbp), %rcx
	movq	%rax, 24(%rcx)
	movq	-24(%rbp), %rax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_getSubstring           ## -- Begin function getSubstring
	.p2align	4, 0x90
_getSubstring:                          ## @getSubstring
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movl	$40, %eax
	movl	%eax, %ecx
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	%edx, -16(%rbp)
	movq	%rcx, %rdi
	callq	_dulalloc
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	leaq	_STRTYPE(%rip), %rcx
	movq	%rcx, (%rax)
	movq	-8(%rbp), %rax
	movl	8(%rax), %edx
	movl	%edx, %esi
	addl	$1, %esi
	movl	%esi, 8(%rax)
	movq	-24(%rbp), %rax
	movl	%edx, 8(%rax)
	movl	-16(%rbp), %edx
	subl	-12(%rbp), %edx
	movq	-24(%rbp), %rax
	movl	%edx, 12(%rax)
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	movslq	-12(%rbp), %rcx
	addq	%rcx, %rax
	movq	-24(%rbp), %rcx
	movq	%rax, 24(%rcx)
	movq	-24(%rbp), %rax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"expected 0 arguments in len method but %d passed"

L_.str.1:                               ## @.str.1
	.asciz	"%*s"

L_.str.2:                               ## @.str.2
	.asciz	"%s"

.zerofill __DATA,__bss,_get_str_methods.methods,8,3 ## @get_str_methods.methods
	.section	__DATA,__data
	.p2align	2               ## @str_methods_count
_str_methods_count:
	.long	2                       ## 0x2

	.p2align	4               ## @string_methods
_string_methods:
	.quad	L_.str.7
	.quad	_BINTYPE
	.long	1                       ## 0x1
	.space	4
	.quad	_str_len
	.quad	L_.str.8
	.quad	_BINTYPE
	.long	1                       ## 0x1
	.space	4
	.quad	_strformat

	.section	__TEXT,__cstring,cstring_literals
L_.str.3:                               ## @.str.3
	.asciz	"string"

L_.str.4:                               ## @.str.4
	.asciz	"type issue: comparing string to not string\n"

L_.str.5:                               ## @.str.5
	.asciz	"string iterator"

	.section	__DATA,__const
	.globl	_STRITERTYPE            ## @STRITERTYPE
	.p2align	3
_STRITERTYPE:
	.quad	L_.str.5
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
	.quad	_str_iter_next
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	_unpack_str_iter
	.long	1                       ## 0x1
	.space	4
	.quad	0

	.globl	_STRTYPE                ## @STRTYPE
	.p2align	3
_STRTYPE:
	.quad	L_.str.3
	.quad	_dumpstr
	.quad	0
	.quad	_destrstr
	.quad	_concatstr
	.quad	0
	.quad	0
	.quad	0
	.quad	_str_iadd
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	_eq_str
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	_init_str_iter
	.quad	0
	.quad	_str_subscr_get
	.quad	_str_subscr_set
	.quad	0
	.quad	0
	.quad	0
	.long	1                       ## 0x1
	.space	4
	.quad	_get_str_methods

	.section	__TEXT,__cstring,cstring_literals
L_.str.6:                               ## @.str.6
	.asciz	"cannot concat string with %s type\n"

L_.str.7:                               ## @.str.7
	.asciz	"length"

L_.str.8:                               ## @.str.8
	.asciz	"format"


.subsections_via_symbols
