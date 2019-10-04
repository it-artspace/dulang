	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 14	sdk_version 10, 14
	.globl	_check_iden_name        ## -- Begin function check_iden_name
	.p2align	4, 0x90
_check_iden_name:                       ## @check_iden_name
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movb	%dil, %al
	movb	%al, -1(%rbp)
	movsbl	-1(%rbp), %edi
	cmpl	$97, %edi
	jl	LBB0_2
## %bb.1:
	movsbl	-1(%rbp), %eax
	cmpl	$122, %eax
	movb	$1, %cl
	movb	%cl, -2(%rbp)           ## 1-byte Spill
	jle	LBB0_5
LBB0_2:
	movsbl	-1(%rbp), %eax
	cmpl	$90, %eax
	jg	LBB0_4
## %bb.3:
	movsbl	-1(%rbp), %eax
	cmpl	$65, %eax
	movb	$1, %cl
	movb	%cl, -2(%rbp)           ## 1-byte Spill
	jge	LBB0_5
LBB0_4:
	movsbl	-1(%rbp), %eax
	cmpl	$95, %eax
	sete	%cl
	movb	%cl, -2(%rbp)           ## 1-byte Spill
LBB0_5:
	movb	-2(%rbp), %al           ## 1-byte Reload
	andb	$1, %al
	movzbl	%al, %eax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_lexem_print_name       ## -- Begin function lexem_print_name
	.p2align	4, 0x90
_lexem_print_name:                      ## @lexem_print_name
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
	movl	%edx, -28(%rbp)
	cmpq	$0, -16(%rbp)
	jne	LBB1_2
## %bb.1:
	xorl	%edx, %edx
	movq	$-1, %rcx
	movq	-24(%rbp), %rdi
	movslq	-28(%rbp), %rsi
	leaq	L_.str.45(%rip), %r8
	movb	$0, %al
	callq	___snprintf_chk
	movq	-24(%rbp), %rcx
	movq	%rcx, -8(%rbp)
	movl	%eax, -32(%rbp)         ## 4-byte Spill
	jmp	LBB1_9
LBB1_2:
	movq	-16(%rbp), %rax
	movl	(%rax), %ecx
	movl	%ecx, %eax
	movq	%rax, %rdx
	subq	$4, %rdx
	movq	%rax, -40(%rbp)         ## 8-byte Spill
	movq	%rdx, -48(%rbp)         ## 8-byte Spill
	ja	LBB1_8
## %bb.10:
	leaq	LJTI1_0(%rip), %rax
	movq	-40(%rbp), %rcx         ## 8-byte Reload
	movslq	(%rax,%rcx,4), %rdx
	addq	%rax, %rdx
	jmpq	*%rdx
LBB1_3:
	xorl	%edx, %edx
	movq	$-1, %rcx
	movq	-24(%rbp), %rdi
	movslq	-28(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	8(%rax), %r9
	leaq	L_.str.46(%rip), %r8
	movb	$0, %al
	callq	___snprintf_chk
	movl	%eax, -52(%rbp)         ## 4-byte Spill
	jmp	LBB1_8
LBB1_4:
	xorl	%edx, %edx
	movq	$-1, %rcx
	movq	-24(%rbp), %rdi
	movslq	-28(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	8(%rax), %r9
	leaq	L_.str.47(%rip), %r8
	movb	$0, %al
	callq	___snprintf_chk
	movl	%eax, -56(%rbp)         ## 4-byte Spill
	jmp	LBB1_8
LBB1_5:
	xorl	%edx, %edx
	movq	$-1, %rcx
	movq	-24(%rbp), %rdi
	movslq	-28(%rbp), %rsi
	movq	-16(%rbp), %rax
	movsd	16(%rax), %xmm0         ## xmm0 = mem[0],zero
	leaq	L_.str.48(%rip), %r8
	movb	$1, %al
	callq	___snprintf_chk
	movl	%eax, -60(%rbp)         ## 4-byte Spill
	jmp	LBB1_8
LBB1_6:
	xorl	%edx, %edx
	movq	$-1, %rcx
	movq	-24(%rbp), %rdi
	movslq	-28(%rbp), %rsi
	movq	-16(%rbp), %rax
	movl	4(%rax), %r8d
	movl	%r8d, %eax
	leaq	__lexem_names(%rip), %r9
	movq	(%r9,%rax,8), %r9
	leaq	L_.str.49(%rip), %r8
	movb	$0, %al
	callq	___snprintf_chk
	movl	%eax, -64(%rbp)         ## 4-byte Spill
	jmp	LBB1_8
LBB1_7:
	xorl	%edx, %edx
	movq	$-1, %rcx
	movq	-24(%rbp), %rdi
	movslq	-28(%rbp), %rsi
	leaq	L_.str.50(%rip), %r8
	movb	$0, %al
	callq	___snprintf_chk
	movl	%eax, -68(%rbp)         ## 4-byte Spill
LBB1_8:
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
LBB1_9:
	movq	-8(%rbp), %rax
	addq	$80, %rsp
	popq	%rbp
	retq
	.cfi_endproc
	.p2align	2, 0x90
	.data_region jt32
.set L1_0_set_3, LBB1_3-LJTI1_0
.set L1_0_set_4, LBB1_4-LJTI1_0
.set L1_0_set_5, LBB1_5-LJTI1_0
.set L1_0_set_6, LBB1_6-LJTI1_0
.set L1_0_set_7, LBB1_7-LJTI1_0
LJTI1_0:
	.long	L1_0_set_3
	.long	L1_0_set_4
	.long	L1_0_set_5
	.long	L1_0_set_6
	.long	L1_0_set_7
	.end_data_region
                                        ## -- End function
	.globl	_destroy_parser         ## -- Begin function destroy_parser
	.p2align	4, 0x90
_destroy_parser:                        ## @destroy_parser
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
	movq	(%rdi), %rdi
	callq	_fclose
	movq	-8(%rbp), %rdi
	movq	24(%rdi), %rdi
	movl	%eax, -12(%rbp)         ## 4-byte Spill
	callq	_free
	movq	-8(%rbp), %rdi
	movq	32(%rdi), %rdi
	callq	_free
	movq	-8(%rbp), %rdi
	movq	56(%rdi), %rdi
	callq	_free
	movq	-8(%rbp), %rdi
	movq	72(%rdi), %rdi
	callq	_free
	movq	-8(%rbp), %rdi
	callq	_free
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_open_parser            ## -- Begin function open_parser
	.p2align	4, 0x90
_open_parser:                           ## @open_parser
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movl	$80, %eax
	movl	%eax, %ecx
	movq	%rdi, -16(%rbp)
	movq	%rcx, %rdi
	callq	_malloc
	movq	%rax, -24(%rbp)
	movq	-16(%rbp), %rdi
	leaq	L_.str.51(%rip), %rsi
	callq	_fopen
	movq	-24(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-24(%rbp), %rax
	cmpq	$0, (%rax)
	jne	LBB3_2
## %bb.1:
	leaq	L_.str.52(%rip), %rdi
	callq	*_trshoot(%rip)
	movq	-24(%rbp), %rdi
	movl	%eax, -28(%rbp)         ## 4-byte Spill
	callq	_free
	movq	$0, -8(%rbp)
	jmp	LBB3_6
LBB3_2:
	movl	$1024, %eax             ## imm = 0x400
	movl	%eax, %edi
	movq	-24(%rbp), %rcx
	movq	$0, 16(%rcx)
	callq	_malloc
	movl	$400000, %edx           ## imm = 0x61A80
	movl	%edx, %edi
	movq	-24(%rbp), %rcx
	movq	%rax, 24(%rcx)
	movq	-24(%rbp), %rax
	movl	$0, 8(%rax)
	callq	_malloc
	movq	-24(%rbp), %rcx
	movq	%rax, 32(%rcx)
	movq	-24(%rbp), %rax
	movl	$0, 40(%rax)
	movq	-24(%rbp), %rax
	movl	$0, 48(%rax)
	movq	-24(%rbp), %rax
	movl	$0, 52(%rax)
	movq	-24(%rbp), %rax
	movl	$2048, 64(%rax)         ## imm = 0x800
	movq	-24(%rbp), %rax
	movslq	64(%rax), %rax
	shlq	$3, %rax
	movq	%rax, %rdi
	callq	_malloc
	movq	-24(%rbp), %rcx
	movq	%rax, 56(%rcx)
	movq	-24(%rbp), %rax
	cmpq	$0, 56(%rax)
	setne	%sil
	xorb	$-1, %sil
	andb	$1, %sil
	movzbl	%sil, %edx
	movslq	%edx, %rax
	cmpq	$0, %rax
	je	LBB3_4
## %bb.3:
	leaq	L___func__.open_parser(%rip), %rdi
	leaq	L_.str.53(%rip), %rsi
	leaq	L_.str.54(%rip), %rcx
	movl	$115, %edx
	callq	___assert_rtn
LBB3_4:
	jmp	LBB3_5
LBB3_5:
	movq	-24(%rbp), %rax
	movl	$0, 68(%rax)
	movq	-16(%rbp), %rdi
	callq	_strdup
	movq	-24(%rbp), %rdi
	movq	%rax, 72(%rdi)
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
LBB3_6:
	movq	-8(%rbp), %rax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_get_string             ## -- Begin function get_string
	.p2align	4, 0x90
_get_string:                            ## @get_string
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$5248, %rsp             ## imm = 0x1480
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	%rdi, -5152(%rbp)
LBB4_1:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB4_4 Depth 2
	leaq	-1040(%rbp), %rdi
	movq	-5152(%rbp), %rax
	movq	(%rax), %rdx
	movl	$1024, %esi             ## imm = 0x400
	callq	_fgets
	movq	%rax, -5160(%rbp)
	cmpq	$0, -5160(%rbp)
	jne	LBB4_3
## %bb.2:
	movq	-5152(%rbp), %rax
	movq	$0, 24(%rax)
	movl	$1, -5140(%rbp)
	jmp	LBB4_37
LBB4_3:                                 ##   in Loop: Header=BB4_1 Depth=1
	movq	-5160(%rbp), %rax
	movq	%rax, -5168(%rbp)
LBB4_4:                                 ##   Parent Loop BB4_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movq	-5168(%rbp), %rax
	movsbl	(%rax), %ecx
	cmpl	$32, %ecx
	movb	$1, %dl
	movb	%dl, -5225(%rbp)        ## 1-byte Spill
	je	LBB4_6
## %bb.5:                               ##   in Loop: Header=BB4_4 Depth=2
	movq	-5168(%rbp), %rax
	movsbl	(%rax), %ecx
	cmpl	$9, %ecx
	sete	%dl
	movb	%dl, -5225(%rbp)        ## 1-byte Spill
LBB4_6:                                 ##   in Loop: Header=BB4_4 Depth=2
	movb	-5225(%rbp), %al        ## 1-byte Reload
	testb	$1, %al
	jne	LBB4_7
	jmp	LBB4_8
LBB4_7:                                 ##   in Loop: Header=BB4_4 Depth=2
	movq	-5168(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -5168(%rbp)
	jmp	LBB4_4
LBB4_8:                                 ##   in Loop: Header=BB4_1 Depth=1
	jmp	LBB4_9
LBB4_9:                                 ##   in Loop: Header=BB4_1 Depth=1
	movq	-5168(%rbp), %rax
	movsbl	(%rax), %ecx
	cmpl	$35, %ecx
	je	LBB4_1
## %bb.10:
	leaq	-1040(%rbp), %rax
	leaq	-5136(%rbp), %rcx
	movq	%rcx, -5176(%rbp)
	movq	%rax, -5184(%rbp)
	movl	$0, -5188(%rbp)
LBB4_11:                                ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB4_14 Depth 2
	movq	-5184(%rbp), %rax
	movsbl	(%rax), %ecx
	cmpl	$0, %ecx
	je	LBB4_20
## %bb.12:                              ##   in Loop: Header=BB4_11 Depth=1
	movq	-5184(%rbp), %rax
	movq	%rax, %rcx
	addq	$1, %rcx
	movq	%rcx, -5184(%rbp)
	movb	(%rax), %dl
	movb	%dl, -5189(%rbp)
	movsbl	-5189(%rbp), %esi
	cmpl	$9, %esi
	jne	LBB4_18
## %bb.13:                              ##   in Loop: Header=BB4_11 Depth=1
	movl	-5188(%rbp), %eax
	cltd
	movl	$4, %ecx
	idivl	%ecx
	movl	%edx, -5196(%rbp)
	subl	-5196(%rbp), %ecx
	movl	%ecx, -5200(%rbp)
	movl	$0, -5204(%rbp)
LBB4_14:                                ##   Parent Loop BB4_11 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	-5204(%rbp), %eax
	cmpl	-5200(%rbp), %eax
	jge	LBB4_17
## %bb.15:                              ##   in Loop: Header=BB4_14 Depth=2
	movq	-5176(%rbp), %rax
	movq	%rax, %rcx
	addq	$1, %rcx
	movq	%rcx, -5176(%rbp)
	movb	$32, (%rax)
	movl	-5188(%rbp), %edx
	addl	$1, %edx
	movl	%edx, -5188(%rbp)
## %bb.16:                              ##   in Loop: Header=BB4_14 Depth=2
	movl	-5204(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -5204(%rbp)
	jmp	LBB4_14
LBB4_17:                                ##   in Loop: Header=BB4_11 Depth=1
	jmp	LBB4_19
LBB4_18:                                ##   in Loop: Header=BB4_11 Depth=1
	movb	-5189(%rbp), %al
	movq	-5176(%rbp), %rcx
	movq	%rcx, %rdx
	addq	$1, %rdx
	movq	%rdx, -5176(%rbp)
	movb	%al, (%rcx)
	movl	-5188(%rbp), %esi
	addl	$1, %esi
	movl	%esi, -5188(%rbp)
LBB4_19:                                ##   in Loop: Header=BB4_11 Depth=1
	jmp	LBB4_11
LBB4_20:
	movq	$-1, %rdx
	leaq	-5136(%rbp), %rsi
	movq	-5176(%rbp), %rax
	movb	$0, (%rax)
	movq	-5152(%rbp), %rax
	movq	24(%rax), %rdi
	callq	___strcpy_chk
	movq	-5152(%rbp), %rdx
	movl	52(%rdx), %ecx
	movq	-5152(%rbp), %rdx
	cmpl	64(%rdx), %ecx
	movq	%rax, -5240(%rbp)       ## 8-byte Spill
	jl	LBB4_25
## %bb.21:
	movq	-5152(%rbp), %rax
	movl	64(%rax), %ecx
	shll	$1, %ecx
	movl	%ecx, 64(%rax)
	movq	-5152(%rbp), %rax
	movq	56(%rax), %rax
	movq	-5152(%rbp), %rdx
	movslq	64(%rdx), %rdx
	shlq	$3, %rdx
	movq	%rax, %rdi
	movq	%rdx, %rsi
	callq	_realloc
	movq	-5152(%rbp), %rdx
	movq	%rax, 56(%rdx)
	movq	-5152(%rbp), %rax
	cmpq	$0, 56(%rax)
	setne	%r8b
	xorb	$-1, %r8b
	andb	$1, %r8b
	movzbl	%r8b, %ecx
	movslq	%ecx, %rax
	cmpq	$0, %rax
	je	LBB4_23
## %bb.22:
	leaq	L___func__.get_string(%rip), %rdi
	leaq	L_.str.53(%rip), %rsi
	leaq	L_.str.55(%rip), %rcx
	movl	$171, %edx
	callq	___assert_rtn
LBB4_23:
	jmp	LBB4_24
LBB4_24:
	jmp	LBB4_25
LBB4_25:
	movq	-5152(%rbp), %rax
	movq	24(%rax), %rdi
	callq	_strdup
	movq	-5152(%rbp), %rdi
	movq	56(%rdi), %rdi
	movq	-5152(%rbp), %rcx
	movslq	52(%rcx), %rcx
	movq	%rax, (%rdi,%rcx,8)
	movq	-5152(%rbp), %rax
	movl	52(%rax), %edx
	addl	$1, %edx
	movl	%edx, 52(%rax)
	movq	-5152(%rbp), %rax
	movl	%edx, 68(%rax)
	movl	$0, -5208(%rbp)
LBB4_26:                                ## =>This Inner Loop Header: Depth=1
	movq	-5152(%rbp), %rax
	movq	24(%rax), %rax
	movl	-5208(%rbp), %ecx
	movl	%ecx, %edx
	addl	$1, %edx
	movl	%edx, -5208(%rbp)
	movslq	%ecx, %rsi
	movsbl	(%rax,%rsi), %ecx
	cmpl	$32, %ecx
	jne	LBB4_28
## %bb.27:                              ##   in Loop: Header=BB4_26 Depth=1
	jmp	LBB4_26
LBB4_28:
	movl	-5208(%rbp), %eax
	cltd
	movl	$4, %ecx
	idivl	%ecx
	cmpl	$1, %edx
	je	LBB4_30
## %bb.29:
	leaq	L_.str.56(%rip), %rdi
	callq	*_trshoot(%rip)
	movq	-5152(%rbp), %rdi
	movl	%eax, -5244(%rbp)       ## 4-byte Spill
	callq	_destroy_parser
LBB4_30:
	movl	-5208(%rbp), %eax
	subl	$1, %eax
	movq	-5152(%rbp), %rcx
	movl	%eax, 44(%rcx)
	movl	-5208(%rbp), %eax
	subl	$1, %eax
	cltd
	movl	$4, %esi
	idivl	%esi
	movl	%eax, -5208(%rbp)
LBB4_31:                                ## =>This Inner Loop Header: Depth=1
	movq	-5152(%rbp), %rax
	movl	8(%rax), %ecx
	cmpl	-5208(%rbp), %ecx
	jle	LBB4_33
## %bb.32:                              ##   in Loop: Header=BB4_31 Depth=1
	movq	-5152(%rbp), %rax
	movq	32(%rax), %rax
	movq	-5152(%rbp), %rcx
	movslq	40(%rcx), %rcx
	imulq	$40, %rcx, %rcx
	addq	%rcx, %rax
	movq	%rax, -5216(%rbp)
	movq	-5152(%rbp), %rax
	movl	52(%rax), %edx
	movq	-5216(%rbp), %rax
	movl	%edx, 24(%rax)
	movq	-5152(%rbp), %rax
	movl	44(%rax), %edx
	movq	-5216(%rbp), %rax
	movl	%edx, 28(%rax)
	movq	-5152(%rbp), %rax
	movq	-5216(%rbp), %rcx
	movq	%rax, 32(%rcx)
	movq	-5216(%rbp), %rax
	movl	$44, 4(%rax)
	movq	-5152(%rbp), %rax
	movl	40(%rax), %edx
	addl	$1, %edx
	movl	%edx, 40(%rax)
	movq	-5216(%rbp), %rax
	movl	$3, (%rax)
	movq	-5152(%rbp), %rax
	movl	8(%rax), %edx
	addl	$-1, %edx
	movl	%edx, 8(%rax)
	jmp	LBB4_31
LBB4_33:
	jmp	LBB4_34
LBB4_34:                                ## =>This Inner Loop Header: Depth=1
	movq	-5152(%rbp), %rax
	movl	8(%rax), %ecx
	cmpl	-5208(%rbp), %ecx
	jge	LBB4_36
## %bb.35:                              ##   in Loop: Header=BB4_34 Depth=1
	movq	-5152(%rbp), %rax
	movq	32(%rax), %rax
	movq	-5152(%rbp), %rcx
	movslq	40(%rcx), %rcx
	imulq	$40, %rcx, %rcx
	addq	%rcx, %rax
	movq	%rax, -5224(%rbp)
	movq	-5152(%rbp), %rax
	movl	52(%rax), %edx
	movq	-5224(%rbp), %rax
	movl	%edx, 24(%rax)
	movq	-5152(%rbp), %rax
	movl	44(%rax), %edx
	movq	-5224(%rbp), %rax
	movl	%edx, 28(%rax)
	movq	-5152(%rbp), %rax
	movq	-5224(%rbp), %rcx
	movq	%rax, 32(%rcx)
	movq	-5152(%rbp), %rax
	movl	40(%rax), %edx
	addl	$1, %edx
	movl	%edx, 40(%rax)
	movq	-5224(%rbp), %rax
	movl	$43, 4(%rax)
	movq	-5224(%rbp), %rax
	movl	$3, (%rax)
	movq	-5152(%rbp), %rax
	movl	8(%rax), %edx
	addl	$1, %edx
	movl	%edx, 8(%rax)
	jmp	LBB4_34
LBB4_36:
	movl	$0, -5140(%rbp)
LBB4_37:
	movl	-5140(%rbp), %eax
	movq	___stack_chk_guard@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rcx
	movq	-8(%rbp), %rdx
	cmpq	%rdx, %rcx
	movl	%eax, -5248(%rbp)       ## 4-byte Spill
	jne	LBB4_39
## %bb.38:
	movl	-5248(%rbp), %eax       ## 4-byte Reload
	addq	$5248, %rsp             ## imm = 0x1480
	popq	%rbp
	retq
LBB4_39:
	callq	___stack_chk_fail
	ud2
	.cfi_endproc
                                        ## -- End function
	.globl	_check_identifier       ## -- Begin function check_identifier
	.p2align	4, 0x90
_check_identifier:                      ## @check_identifier
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
	movsbl	(%rsi), %edi
	callq	_isalpha
	movl	%eax, -28(%rbp)
	movq	-24(%rbp), %rdi
	callq	_strlen
	movq	%rax, -40(%rbp)
	movq	-16(%rbp), %rdi
	movq	-24(%rbp), %rsi
	movq	-40(%rbp), %rdx
	callq	_strncmp
	cmpl	$0, %eax
	je	LBB5_2
## %bb.1:
	movl	$0, -4(%rbp)
	jmp	LBB5_8
LBB5_2:
	cmpl	$0, -28(%rbp)
	jne	LBB5_4
## %bb.3:
	movl	$1, -4(%rbp)
	jmp	LBB5_8
LBB5_4:
	movq	-16(%rbp), %rax
	movq	-40(%rbp), %rcx
	movb	(%rax,%rcx), %dl
	movb	%dl, -41(%rbp)
	movsbl	-41(%rbp), %edi
	callq	_isalnum
	cmpl	$0, %eax
	jne	LBB5_6
## %bb.5:
	movsbl	-41(%rbp), %eax
	cmpl	$95, %eax
	jne	LBB5_7
LBB5_6:
	movl	$0, -4(%rbp)
	jmp	LBB5_8
LBB5_7:
	movl	$1, -4(%rbp)
LBB5_8:
	movl	-4(%rbp), %eax
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_getlexem               ## -- Begin function getlexem
	.p2align	4, 0x90
_getlexem:                              ## @getlexem
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$80, %rsp
	movq	%rdi, -16(%rbp)
	movq	-16(%rbp), %rdi
	movq	(%rdi), %rdi
	callq	_ftell
	movq	-16(%rbp), %rdi
	movq	%rax, 16(%rdi)
LBB6_1:                                 ## =>This Inner Loop Header: Depth=1
	movq	-16(%rbp), %rax
	movq	24(%rax), %rax
	movq	-16(%rbp), %rcx
	movslq	44(%rcx), %rcx
	movsbl	(%rax,%rcx), %edx
	cmpl	$32, %edx
	jne	LBB6_3
## %bb.2:                               ##   in Loop: Header=BB6_1 Depth=1
	movq	-16(%rbp), %rax
	movl	44(%rax), %ecx
	addl	$1, %ecx
	movl	%ecx, 44(%rax)
	jmp	LBB6_1
LBB6_3:
	movq	-16(%rbp), %rax
	movq	32(%rax), %rax
	movq	-16(%rbp), %rcx
	movslq	40(%rcx), %rcx
	imulq	$40, %rcx, %rcx
	addq	%rcx, %rax
	movq	%rax, -24(%rbp)
	movq	-16(%rbp), %rax
	movl	52(%rax), %edx
	movq	-24(%rbp), %rax
	movl	%edx, 24(%rax)
	movq	-16(%rbp), %rax
	movl	44(%rax), %edx
	movq	-24(%rbp), %rax
	movl	%edx, 28(%rax)
	movq	-16(%rbp), %rax
	movq	-24(%rbp), %rcx
	movq	%rax, 32(%rcx)
	movq	-16(%rbp), %rax
	movq	24(%rax), %rax
	movq	-16(%rbp), %rcx
	movslq	44(%rcx), %rcx
	movsbl	(%rax,%rcx), %edx
	cmpl	$10, %edx
	je	LBB6_5
## %bb.4:
	movq	-16(%rbp), %rax
	movq	24(%rax), %rax
	movq	-16(%rbp), %rcx
	movslq	44(%rcx), %rcx
	movsbl	(%rax,%rcx), %edx
	cmpl	$0, %edx
	jne	LBB6_6
LBB6_5:
	movq	-16(%rbp), %rax
	movl	40(%rax), %ecx
	addl	$1, %ecx
	movl	%ecx, 40(%rax)
	movq	-24(%rbp), %rax
	movl	$3, (%rax)
	movq	-24(%rbp), %rax
	movl	$1, 4(%rax)
	movl	$4, -4(%rbp)
	jmp	LBB6_35
LBB6_6:
	movq	-16(%rbp), %rax
	movq	24(%rax), %rax
	movq	-16(%rbp), %rcx
	movslq	44(%rcx), %rcx
	movsbl	(%rax,%rcx), %edx
	cmpl	$34, %edx
	jne	LBB6_13
## %bb.7:
	movq	-16(%rbp), %rax
	movl	44(%rax), %ecx
	movl	%ecx, -28(%rbp)
LBB6_8:                                 ## =>This Inner Loop Header: Depth=1
	movq	-16(%rbp), %rax
	movq	24(%rax), %rax
	movq	-16(%rbp), %rcx
	movl	44(%rcx), %edx
	addl	$1, %edx
	movl	%edx, 44(%rcx)
	movslq	%edx, %rcx
	movsbl	(%rax,%rcx), %edx
	cmpl	$34, %edx
	je	LBB6_12
## %bb.9:                               ##   in Loop: Header=BB6_8 Depth=1
	movq	-16(%rbp), %rax
	movq	24(%rax), %rax
	movq	-16(%rbp), %rcx
	movslq	44(%rcx), %rcx
	movsbl	(%rax,%rcx), %edx
	cmpl	$92, %edx
	jne	LBB6_11
## %bb.10:                              ##   in Loop: Header=BB6_8 Depth=1
	movq	-16(%rbp), %rax
	movl	44(%rax), %ecx
	addl	$1, %ecx
	movl	%ecx, 44(%rax)
LBB6_11:                                ##   in Loop: Header=BB6_8 Depth=1
	jmp	LBB6_8
LBB6_12:
	movq	-16(%rbp), %rax
	movl	44(%rax), %ecx
	addl	$1, %ecx
	movl	%ecx, 44(%rax)
	movq	-16(%rbp), %rax
	movl	44(%rax), %ecx
	subl	-28(%rbp), %ecx
	subl	$2, %ecx
	movl	%ecx, -32(%rbp)
	movl	-32(%rbp), %ecx
	addl	$1, %ecx
	movslq	%ecx, %rdi
	callq	_dulalloc
	movq	$-1, %rcx
	movq	-24(%rbp), %rdi
	movq	%rax, 8(%rdi)
	movq	-24(%rbp), %rax
	movq	8(%rax), %rdi
	movq	-16(%rbp), %rax
	movq	24(%rax), %rax
	movslq	-28(%rbp), %rdx
	addq	%rdx, %rax
	addq	$1, %rax
	movq	-16(%rbp), %rdx
	movl	44(%rdx), %esi
	subl	-28(%rbp), %esi
	subl	$2, %esi
	movslq	%esi, %rdx
	movq	%rax, %rsi
	callq	___strncpy_chk
	movq	-24(%rbp), %rcx
	movq	8(%rcx), %rcx
	movslq	-32(%rbp), %rdx
	movb	$0, (%rcx,%rdx)
	movq	-24(%rbp), %rcx
	movl	$1, (%rcx)
	movq	-16(%rbp), %rcx
	movl	40(%rcx), %r8d
	addl	$1, %r8d
	movl	%r8d, 40(%rcx)
	movl	$1, -4(%rbp)
	movq	%rax, -56(%rbp)         ## 8-byte Spill
	jmp	LBB6_35
LBB6_13:
	movq	-16(%rbp), %rax
	movq	24(%rax), %rax
	movq	-16(%rbp), %rcx
	movslq	44(%rcx), %rcx
	movsbl	(%rax,%rcx), %edx
	cmpl	$64, %edx
	jne	LBB6_15
## %bb.14:
	movq	-24(%rbp), %rax
	movl	$0, (%rax)
	movq	-16(%rbp), %rax
	movl	44(%rax), %ecx
	addl	$1, %ecx
	movl	%ecx, 44(%rax)
	leaq	L_.str.57(%rip), %rdi
	callq	_strdup
	movq	-24(%rbp), %rdi
	movq	%rax, 8(%rdi)
	movq	-16(%rbp), %rax
	movl	40(%rax), %ecx
	addl	$1, %ecx
	movl	%ecx, 40(%rax)
	movq	-24(%rbp), %rax
	addq	$40, %rax
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movl	$2, 4(%rax)
	movq	-24(%rbp), %rax
	movl	$3, (%rax)
	movq	-16(%rbp), %rax
	movl	40(%rax), %ecx
	addl	$1, %ecx
	movl	%ecx, 40(%rax)
	movl	$3, -4(%rbp)
	jmp	LBB6_35
LBB6_15:
	movl	$0, -36(%rbp)
LBB6_16:                                ## =>This Inner Loop Header: Depth=1
	cmpl	$43, -36(%rbp)
	jge	LBB6_21
## %bb.17:                              ##   in Loop: Header=BB6_16 Depth=1
	movq	-16(%rbp), %rax
	movq	24(%rax), %rax
	movq	-16(%rbp), %rcx
	movslq	44(%rcx), %rcx
	addq	%rcx, %rax
	movslq	-36(%rbp), %rcx
	leaq	_ltext(%rip), %rdx
	movq	(%rdx,%rcx,8), %rsi
	movq	%rax, %rdi
	callq	_check_identifier
	cmpl	$0, %eax
	je	LBB6_19
## %bb.18:
	movl	-36(%rbp), %eax
	movq	-24(%rbp), %rcx
	movl	%eax, 4(%rcx)
	movq	-24(%rbp), %rcx
	movl	$3, (%rcx)
	movslq	-36(%rbp), %rcx
	leaq	_ltext(%rip), %rdx
	movq	(%rdx,%rcx,8), %rdi
	callq	_strlen
	movq	-16(%rbp), %rcx
	movslq	44(%rcx), %rdx
	addq	%rax, %rdx
	movl	%edx, %esi
	movl	%esi, 44(%rcx)
	movq	-16(%rbp), %rax
	movl	40(%rax), %esi
	addl	$1, %esi
	movl	%esi, 40(%rax)
	movl	$3, -4(%rbp)
	jmp	LBB6_35
LBB6_19:                                ##   in Loop: Header=BB6_16 Depth=1
	jmp	LBB6_20
LBB6_20:                                ##   in Loop: Header=BB6_16 Depth=1
	movl	-36(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -36(%rbp)
	jmp	LBB6_16
LBB6_21:
	movl	$0, -40(%rbp)
LBB6_22:                                ## =>This Inner Loop Header: Depth=1
	movq	-16(%rbp), %rax
	movq	24(%rax), %rax
	movq	-16(%rbp), %rcx
	movl	44(%rcx), %edx
	addl	-40(%rbp), %edx
	movslq	%edx, %rcx
	movsbl	(%rax,%rcx), %edx
	cmpl	$48, %edx
	jl	LBB6_24
## %bb.23:                              ##   in Loop: Header=BB6_22 Depth=1
	movq	-16(%rbp), %rax
	movq	24(%rax), %rax
	movq	-16(%rbp), %rcx
	movl	44(%rcx), %edx
	addl	-40(%rbp), %edx
	movslq	%edx, %rcx
	movsbl	(%rax,%rcx), %edx
	cmpl	$57, %edx
	movb	$1, %sil
	movb	%sil, -57(%rbp)         ## 1-byte Spill
	jle	LBB6_25
LBB6_24:                                ##   in Loop: Header=BB6_22 Depth=1
	movq	-16(%rbp), %rax
	movq	24(%rax), %rax
	movq	-16(%rbp), %rcx
	movl	44(%rcx), %edx
	addl	-40(%rbp), %edx
	movslq	%edx, %rcx
	movsbl	(%rax,%rcx), %edx
	cmpl	$46, %edx
	sete	%sil
	movb	%sil, -57(%rbp)         ## 1-byte Spill
LBB6_25:                                ##   in Loop: Header=BB6_22 Depth=1
	movb	-57(%rbp), %al          ## 1-byte Reload
	testb	$1, %al
	jne	LBB6_26
	jmp	LBB6_27
LBB6_26:                                ##   in Loop: Header=BB6_22 Depth=1
	movl	-40(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -40(%rbp)
	jmp	LBB6_22
LBB6_27:
	cmpl	$0, -40(%rbp)
	je	LBB6_29
## %bb.28:
	movq	-16(%rbp), %rax
	movq	24(%rax), %rax
	movq	-16(%rbp), %rcx
	movslq	44(%rcx), %rcx
	addq	%rcx, %rax
	movq	%rax, %rdi
	leaq	L_.str.58(%rip), %rsi
	leaq	-48(%rbp), %rdx
	movb	$0, %al
	callq	_sscanf
	movl	-40(%rbp), %r8d
	movq	-16(%rbp), %rcx
	addl	44(%rcx), %r8d
	movl	%r8d, 44(%rcx)
	movsd	-48(%rbp), %xmm0        ## xmm0 = mem[0],zero
	movq	-24(%rbp), %rcx
	movsd	%xmm0, 16(%rcx)
	movq	-24(%rbp), %rcx
	movl	$2, (%rcx)
	movq	-16(%rbp), %rcx
	movl	40(%rcx), %r8d
	addl	$1, %r8d
	movl	%r8d, 40(%rcx)
	movl	$2, -4(%rbp)
	movl	%eax, -64(%rbp)         ## 4-byte Spill
	jmp	LBB6_35
LBB6_29:
	jmp	LBB6_30
LBB6_30:                                ## =>This Inner Loop Header: Depth=1
	movq	-16(%rbp), %rax
	movq	24(%rax), %rax
	movq	-16(%rbp), %rcx
	movl	44(%rcx), %edx
	addl	-40(%rbp), %edx
	movslq	%edx, %rcx
	movsbl	(%rax,%rcx), %edi
	callq	_check_iden_name
	cmpl	$0, %eax
	je	LBB6_32
## %bb.31:                              ##   in Loop: Header=BB6_30 Depth=1
	movl	-40(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -40(%rbp)
	jmp	LBB6_30
LBB6_32:
	cmpl	$0, -40(%rbp)
	je	LBB6_34
## %bb.33:
	movl	-40(%rbp), %eax
	addl	$1, %eax
	movslq	%eax, %rdi
	callq	_dulalloc
	movq	$-1, %rcx
	movq	-24(%rbp), %rdi
	movq	%rax, 8(%rdi)
	movq	-24(%rbp), %rax
	movq	8(%rax), %rdi
	movq	-16(%rbp), %rax
	movq	24(%rax), %rax
	movq	-16(%rbp), %rdx
	movslq	44(%rdx), %rdx
	addq	%rdx, %rax
	movslq	-40(%rbp), %rdx
	movq	%rax, %rsi
	callq	___strncpy_chk
	movq	-24(%rbp), %rcx
	movq	8(%rcx), %rcx
	movslq	-40(%rbp), %rdx
	movb	$0, (%rcx,%rdx)
	movq	-24(%rbp), %rcx
	movl	$0, (%rcx)
	movl	-40(%rbp), %r8d
	movq	-16(%rbp), %rcx
	addl	44(%rcx), %r8d
	movl	%r8d, 44(%rcx)
	movq	-16(%rbp), %rcx
	movl	40(%rcx), %r8d
	addl	$1, %r8d
	movl	%r8d, 40(%rcx)
	movl	$0, -4(%rbp)
	movq	%rax, -72(%rbp)         ## 8-byte Spill
	jmp	LBB6_35
LBB6_34:
	movl	$4, -4(%rbp)
LBB6_35:
	movl	-4(%rbp), %eax
	addq	$80, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_extract_lexem          ## -- Begin function extract_lexem
	.p2align	4, 0x90
_extract_lexem:                         ## @extract_lexem
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -16(%rbp)
	movq	-16(%rbp), %rdi
	movl	48(%rdi), %eax
	movq	-16(%rbp), %rdi
	cmpl	40(%rdi), %eax
	jl	LBB7_2
## %bb.1:
	movq	$0, -8(%rbp)
	jmp	LBB7_3
LBB7_2:
	movq	-16(%rbp), %rax
	movq	32(%rax), %rax
	movq	-16(%rbp), %rcx
	movslq	48(%rcx), %rcx
	imulq	$40, %rcx, %rcx
	addq	%rcx, %rax
	movq	%rax, -24(%rbp)
	movq	-16(%rbp), %rax
	movl	48(%rax), %edx
	addl	$1, %edx
	movl	%edx, 48(%rax)
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
LBB7_3:
	movq	-8(%rbp), %rax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_preview_lexem          ## -- Begin function preview_lexem
	.p2align	4, 0x90
_preview_lexem:                         ## @preview_lexem
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -16(%rbp)
	movq	-16(%rbp), %rdi
	movl	48(%rdi), %eax
	movq	-16(%rbp), %rdi
	cmpl	40(%rdi), %eax
	jl	LBB8_2
## %bb.1:
	movq	$0, -8(%rbp)
	jmp	LBB8_3
LBB8_2:
	movq	-16(%rbp), %rax
	movq	32(%rax), %rax
	movq	-16(%rbp), %rcx
	movslq	48(%rcx), %rcx
	imulq	$40, %rcx, %rcx
	addq	%rcx, %rax
	movq	%rax, -8(%rbp)
LBB8_3:
	movq	-8(%rbp), %rax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"arrow"

L_.str.1:                               ## @.str.1
	.asciz	"EOL"

L_.str.2:                               ## @.str.2
	.asciz	"dot"

L_.str.3:                               ## @.str.3
	.asciz	"ORBracket"

L_.str.4:                               ## @.str.4
	.asciz	"CRBracket"

L_.str.5:                               ## @.str.5
	.asciz	"Obrace"

L_.str.6:                               ## @.str.6
	.asciz	"Cbrace"

L_.str.7:                               ## @.str.7
	.asciz	"OSbracket"

L_.str.8:                               ## @.str.8
	.asciz	"CSbracket"

L_.str.9:                               ## @.str.9
	.asciz	"comma"

L_.str.10:                              ## @.str.10
	.asciz	"colon"

L_.str.11:                              ## @.str.11
	.asciz	"equal"

L_.str.12:                              ## @.str.12
	.asciz	"nequal"

L_.str.13:                              ## @.str.13
	.asciz	"lt"

L_.str.14:                              ## @.str.14
	.asciz	"gt"

L_.str.15:                              ## @.str.15
	.asciz	"le"

L_.str.16:                              ## @.str.16
	.asciz	"ge"

L_.str.17:                              ## @.str.17
	.asciz	"inpadd"

L_.str.18:                              ## @.str.18
	.asciz	"inpsub"

L_.str.19:                              ## @.str.19
	.asciz	"inpmult"

L_.str.20:                              ## @.str.20
	.asciz	"inpdiv"

L_.str.21:                              ## @.str.21
	.asciz	"assign"

L_.str.22:                              ## @.str.22
	.asciz	"plus"

L_.str.23:                              ## @.str.23
	.asciz	"minus"

L_.str.24:                              ## @.str.24
	.asciz	"asterisk"

L_.str.25:                              ## @.str.25
	.asciz	"slash"

L_.str.26:                              ## @.str.26
	.asciz	"kw_logical_or"

L_.str.27:                              ## @.str.27
	.asciz	"kw_logical_and"

L_.str.28:                              ## @.str.28
	.asciz	"kw_logical_not"

L_.str.29:                              ## @.str.29
	.asciz	"kwif"

L_.str.30:                              ## @.str.30
	.asciz	"kwfor"

L_.str.31:                              ## @.str.31
	.asciz	"kwtrue"

L_.str.32:                              ## @.str.32
	.asciz	"kwfalse"

L_.str.33:                              ## @.str.33
	.asciz	"kwelse"

L_.str.34:                              ## @.str.34
	.asciz	"kwfunc"

L_.str.35:                              ## @.str.35
	.asciz	"kwclass"

L_.str.36:                              ## @.str.36
	.asciz	"kwasync"

L_.str.37:                              ## @.str.37
	.asciz	"kwwrite"

L_.str.38:                              ## @.str.38
	.asciz	"kwimport"

L_.str.39:                              ## @.str.39
	.asciz	"kwobject"

L_.str.40:                              ## @.str.40
	.asciz	"kwin"

L_.str.41:                              ## @.str.41
	.asciz	"kwreturn"

L_.str.42:                              ## @.str.42
	.asciz	"while"

L_.str.43:                              ## @.str.43
	.asciz	"indent"

L_.str.44:                              ## @.str.44
	.asciz	"dedent"

	.section	__DATA,__data
	.globl	__lexem_names           ## @_lexem_names
	.p2align	4
__lexem_names:
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
	.quad	L_.str.42
	.quad	L_.str.43
	.quad	L_.str.44

	.section	__TEXT,__cstring,cstring_literals
L_.str.45:                              ## @.str.45
	.asciz	"(null)"

L_.str.46:                              ## @.str.46
	.asciz	"I:%s"

L_.str.47:                              ## @.str.47
	.asciz	"\"%s\""

L_.str.48:                              ## @.str.48
	.asciz	"N:%f"

L_.str.49:                              ## @.str.49
	.asciz	"S:%s"

L_.str.50:                              ## @.str.50
	.asciz	"(none)"

L_.str.51:                              ## @.str.51
	.asciz	"r"

	.section	__DATA,__data
	.p2align	3               ## @trshoot
_trshoot:
	.quad	_puts

	.section	__TEXT,__cstring,cstring_literals
L_.str.52:                              ## @.str.52
	.asciz	"file not opened"

L___func__.open_parser:                 ## @__func__.open_parser
	.asciz	"open_parser"

L_.str.53:                              ## @.str.53
	.asciz	"PARSER/parser.c"

L_.str.54:                              ## @.str.54
	.asciz	"nparser->lines != NULL"

L___func__.get_string:                  ## @__func__.get_string
	.asciz	"get_string"

L_.str.55:                              ## @.str.55
	.asciz	"p->lines != NULL"

L_.str.56:                              ## @.str.56
	.asciz	"INDENTS NOT QUADTUPLE"

L_.str.57:                              ## @.str.57
	.asciz	"this"

	.section	__DATA,__data
	.p2align	4               ## @ltext
_ltext:
	.quad	L_.str.59
	.quad	L_.str.60
	.quad	L_.str.61
	.quad	L_.str.62
	.quad	L_.str.63
	.quad	L_.str.64
	.quad	L_.str.65
	.quad	L_.str.66
	.quad	L_.str.67
	.quad	L_.str.68
	.quad	L_.str.69
	.quad	L_.str.70
	.quad	L_.str.71
	.quad	L_.str.72
	.quad	L_.str.73
	.quad	L_.str.74
	.quad	L_.str.75
	.quad	L_.str.76
	.quad	L_.str.77
	.quad	L_.str.78
	.quad	L_.str.79
	.quad	L_.str.80
	.quad	L_.str.81
	.quad	L_.str.82
	.quad	L_.str.83
	.quad	L_.str.84
	.quad	L_.str.85
	.quad	L_.str.86
	.quad	L_.str.87
	.quad	L_.str.88
	.quad	L_.str.89
	.quad	L_.str.90
	.quad	L_.str.91
	.quad	L_.str.92
	.quad	L_.str.93
	.quad	L_.str.94
	.quad	L_.str.95
	.quad	L_.str.96
	.quad	L_.str.97
	.quad	L_.str.98
	.quad	L_.str.99
	.quad	L_.str.100
	.quad	L_.str.42
	.quad	L_.str.101
	.quad	L_.str.102

	.section	__TEXT,__cstring,cstring_literals
L_.str.58:                              ## @.str.58
	.asciz	"%lf"

L_.str.59:                              ## @.str.59
	.asciz	"->"

L_.str.60:                              ## @.str.60
	.asciz	"$eol"

L_.str.61:                              ## @.str.61
	.asciz	"."

L_.str.62:                              ## @.str.62
	.asciz	"("

L_.str.63:                              ## @.str.63
	.asciz	")"

L_.str.64:                              ## @.str.64
	.asciz	"{"

L_.str.65:                              ## @.str.65
	.asciz	"}"

L_.str.66:                              ## @.str.66
	.asciz	"["

L_.str.67:                              ## @.str.67
	.asciz	"]"

L_.str.68:                              ## @.str.68
	.asciz	","

L_.str.69:                              ## @.str.69
	.asciz	":"

L_.str.70:                              ## @.str.70
	.asciz	"=="

L_.str.71:                              ## @.str.71
	.asciz	"!="

L_.str.72:                              ## @.str.72
	.asciz	"<"

L_.str.73:                              ## @.str.73
	.asciz	">"

L_.str.74:                              ## @.str.74
	.asciz	"<="

L_.str.75:                              ## @.str.75
	.asciz	">="

L_.str.76:                              ## @.str.76
	.asciz	"+="

L_.str.77:                              ## @.str.77
	.asciz	"-="

L_.str.78:                              ## @.str.78
	.asciz	"*="

L_.str.79:                              ## @.str.79
	.asciz	"/="

L_.str.80:                              ## @.str.80
	.asciz	"="

L_.str.81:                              ## @.str.81
	.asciz	"+"

L_.str.82:                              ## @.str.82
	.asciz	"-"

L_.str.83:                              ## @.str.83
	.asciz	"*"

L_.str.84:                              ## @.str.84
	.asciz	"/"

L_.str.85:                              ## @.str.85
	.asciz	"or"

L_.str.86:                              ## @.str.86
	.asciz	"and"

L_.str.87:                              ## @.str.87
	.asciz	"not"

L_.str.88:                              ## @.str.88
	.asciz	"if"

L_.str.89:                              ## @.str.89
	.asciz	"for"

L_.str.90:                              ## @.str.90
	.asciz	"true"

L_.str.91:                              ## @.str.91
	.asciz	"false"

L_.str.92:                              ## @.str.92
	.asciz	"else"

L_.str.93:                              ## @.str.93
	.asciz	"fun"

L_.str.94:                              ## @.str.94
	.asciz	"class"

L_.str.95:                              ## @.str.95
	.asciz	"async"

L_.str.96:                              ## @.str.96
	.asciz	"write"

L_.str.97:                              ## @.str.97
	.asciz	"import"

L_.str.98:                              ## @.str.98
	.asciz	"Object"

L_.str.99:                              ## @.str.99
	.asciz	"in"

L_.str.100:                             ## @.str.100
	.asciz	"return"

L_.str.101:                             ## @.str.101
	.asciz	"$indent"

L_.str.102:                             ## @.str.102
	.asciz	"$dedent"


.subsections_via_symbols
