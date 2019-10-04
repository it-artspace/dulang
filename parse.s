	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 14	sdk_version 10, 14
	.globl	_bind_to_lexem          ## -- Begin function bind_to_lexem
	.p2align	4, 0x90
_bind_to_lexem:                         ## @bind_to_lexem
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	cmpq	$0, -16(%rbp)
	je	LBB0_2
## %bb.1:
	movq	-16(%rbp), %rax
	movl	28(%rax), %ecx
	movq	-8(%rbp), %rax
	movl	%ecx, 44(%rax)
	movq	-16(%rbp), %rax
	movl	24(%rax), %ecx
	movq	-8(%rbp), %rax
	movl	%ecx, 40(%rax)
LBB0_2:
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_parse_error_at_va      ## -- Begin function parse_error_at_va
	.p2align	4, 0x90
_parse_error_at_va:                     ## @parse_error_at_va
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32896, %rsp            ## imm = 0x8080
	movl	$32767, %eax            ## imm = 0x7FFF
	movl	%eax, %ecx
	xorl	%eax, %eax
	movl	$32768, %r8d            ## imm = 0x8000
	movl	%r8d, %r9d
	leaq	-32784(%rbp), %r10
	movq	___stack_chk_guard@GOTPCREL(%rip), %r11
	movq	(%r11), %r11
	movq	%r11, -8(%rbp)
	movq	%rdi, -32792(%rbp)
	movq	%rsi, -32800(%rbp)
	movq	%rdx, -32808(%rbp)
	movq	-32800(%rbp), %r8
	movq	-32808(%rbp), %rdx
	movq	%r10, %rdi
	movq	%rcx, %rsi
	movq	%rdx, -32848(%rbp)      ## 8-byte Spill
	movl	%eax, %edx
	movq	%r9, %rcx
	movq	-32848(%rbp), %r9       ## 8-byte Reload
	callq	___vsnprintf_chk
	cmpq	$0, -32792(%rbp)
	movl	%eax, -32852(%rbp)      ## 4-byte Spill
	je	LBB1_15
## %bb.1:
	movq	-32792(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -32816(%rbp)
	movq	-32792(%rbp), %rax
	movl	24(%rax), %ecx
	movl	%ecx, -32820(%rbp)
	cmpq	$0, -32816(%rbp)
	je	LBB1_4
## %bb.2:
	movl	-32820(%rbp), %eax
	movq	-32816(%rbp), %rcx
	cmpl	68(%rcx), %eax
	jg	LBB1_4
## %bb.3:
	cmpl	$0, -32820(%rbp)
	jg	LBB1_5
LBB1_4:
	leaq	-32784(%rbp), %r8
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	movq	-32792(%rbp), %rax
	movl	24(%rax), %edx
	movq	-32792(%rbp), %rax
	movl	28(%rax), %ecx
	leaq	L_.str(%rip), %rsi
	movb	$0, %al
	callq	_fprintf
	movl	%eax, -32856(%rbp)      ## 4-byte Spill
	jmp	LBB1_14
LBB1_5:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	-32816(%rbp), %rcx
	movq	56(%rcx), %rcx
	movl	-32820(%rbp), %edx
	subl	$1, %edx
	movslq	%edx, %rsi
	movq	(%rcx,%rsi,8), %rcx
	movq	%rcx, -32832(%rbp)
	movq	(%rax), %rdi
	movq	-32816(%rbp), %rax
	movq	72(%rax), %rdx
	movq	-32792(%rbp), %rax
	movl	24(%rax), %ecx
	movq	-32792(%rbp), %rax
	movl	28(%rax), %r8d
	leaq	L_.str.1(%rip), %rsi
	movb	$0, %al
	callq	_fprintf
	movq	___stderrp@GOTPCREL(%rip), %rdx
	movq	(%rdx), %rdi
	movq	-32832(%rbp), %rdx
	leaq	L_.str.2(%rip), %rsi
	movl	%eax, -32860(%rbp)      ## 4-byte Spill
	movb	$0, %al
	callq	_fprintf
	movl	$0, -32836(%rbp)
	movl	%eax, -32864(%rbp)      ## 4-byte Spill
LBB1_6:                                 ## =>This Inner Loop Header: Depth=1
	movl	-32836(%rbp), %eax
	movq	-32792(%rbp), %rcx
	cmpl	28(%rcx), %eax
	jge	LBB1_9
## %bb.7:                               ##   in Loop: Header=BB1_6 Depth=1
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	leaq	L_.str.3(%rip), %rsi
	movb	$0, %al
	callq	_fprintf
	movl	%eax, -32868(%rbp)      ## 4-byte Spill
## %bb.8:                               ##   in Loop: Header=BB1_6 Depth=1
	movl	-32836(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -32836(%rbp)
	jmp	LBB1_6
LBB1_9:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	leaq	L_.str.4(%rip), %rsi
	movb	$0, %al
	callq	_fprintf
	movl	$0, -32836(%rbp)
	movl	%eax, -32872(%rbp)      ## 4-byte Spill
LBB1_10:                                ## =>This Inner Loop Header: Depth=1
	movl	-32836(%rbp), %eax
	movq	-32792(%rbp), %rcx
	cmpl	28(%rcx), %eax
	jge	LBB1_13
## %bb.11:                              ##   in Loop: Header=BB1_10 Depth=1
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	leaq	L_.str.3(%rip), %rsi
	movb	$0, %al
	callq	_fprintf
	movl	%eax, -32876(%rbp)      ## 4-byte Spill
## %bb.12:                              ##   in Loop: Header=BB1_10 Depth=1
	movl	-32836(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -32836(%rbp)
	jmp	LBB1_10
LBB1_13:
	leaq	-32784(%rbp), %rdx
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	leaq	L_.str.5(%rip), %rsi
	movb	$0, %al
	callq	_fprintf
	movl	%eax, -32880(%rbp)      ## 4-byte Spill
LBB1_14:
	jmp	LBB1_16
LBB1_15:
	leaq	-32784(%rbp), %rdx
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	leaq	L_.str.6(%rip), %rsi
	movb	$0, %al
	callq	_fprintf
	movl	%eax, -32884(%rbp)      ## 4-byte Spill
LBB1_16:
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	-8(%rbp), %rcx
	cmpq	%rcx, %rax
	jne	LBB1_18
## %bb.17:
	addq	$32896, %rsp            ## imm = 0x8080
	popq	%rbp
	retq
LBB1_18:
	callq	___stack_chk_fail
	ud2
	.cfi_endproc
                                        ## -- End function
	.globl	_parse_error            ## -- Begin function parse_error
	.p2align	4, 0x90
_parse_error:                           ## @parse_error
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	subq	$33208, %rsp            ## imm = 0x81B8
	.cfi_offset %rbx, -24
	testb	%al, %al
	movaps	%xmm7, -33040(%rbp)     ## 16-byte Spill
	movaps	%xmm6, -33056(%rbp)     ## 16-byte Spill
	movaps	%xmm5, -33072(%rbp)     ## 16-byte Spill
	movaps	%xmm4, -33088(%rbp)     ## 16-byte Spill
	movaps	%xmm3, -33104(%rbp)     ## 16-byte Spill
	movaps	%xmm2, -33120(%rbp)     ## 16-byte Spill
	movaps	%xmm1, -33136(%rbp)     ## 16-byte Spill
	movaps	%xmm0, -33152(%rbp)     ## 16-byte Spill
	movq	%rdi, -33160(%rbp)      ## 8-byte Spill
	movq	%r9, -33168(%rbp)       ## 8-byte Spill
	movq	%r8, -33176(%rbp)       ## 8-byte Spill
	movq	%rcx, -33184(%rbp)      ## 8-byte Spill
	movq	%rdx, -33192(%rbp)      ## 8-byte Spill
	movq	%rsi, -33200(%rbp)      ## 8-byte Spill
	je	LBB2_4
## %bb.3:
	movaps	-33152(%rbp), %xmm0     ## 16-byte Reload
	movaps	%xmm0, -32976(%rbp)
	movaps	-33136(%rbp), %xmm1     ## 16-byte Reload
	movaps	%xmm1, -32960(%rbp)
	movaps	-33120(%rbp), %xmm2     ## 16-byte Reload
	movaps	%xmm2, -32944(%rbp)
	movaps	-33104(%rbp), %xmm3     ## 16-byte Reload
	movaps	%xmm3, -32928(%rbp)
	movaps	-33088(%rbp), %xmm4     ## 16-byte Reload
	movaps	%xmm4, -32912(%rbp)
	movaps	-33072(%rbp), %xmm5     ## 16-byte Reload
	movaps	%xmm5, -32896(%rbp)
	movaps	-33056(%rbp), %xmm6     ## 16-byte Reload
	movaps	%xmm6, -32880(%rbp)
	movaps	-33040(%rbp), %xmm7     ## 16-byte Reload
	movaps	%xmm7, -32864(%rbp)
LBB2_4:
	movq	-33168(%rbp), %rax      ## 8-byte Reload
	movq	%rax, -32984(%rbp)
	movq	-33176(%rbp), %rcx      ## 8-byte Reload
	movq	%rcx, -32992(%rbp)
	movq	-33184(%rbp), %rdx      ## 8-byte Reload
	movq	%rdx, -33000(%rbp)
	movq	-33192(%rbp), %rsi      ## 8-byte Reload
	movq	%rsi, -33008(%rbp)
	movq	-33200(%rbp), %rdi      ## 8-byte Reload
	movq	-33160(%rbp), %r8       ## 8-byte Reload
	movl	$32767, %r9d            ## imm = 0x7FFF
	movl	%r9d, %esi
	xorl	%edx, %edx
	movl	$32768, %r9d            ## imm = 0x8000
	movl	%r9d, %ecx
	leaq	-48(%rbp), %r10
	leaq	-32816(%rbp), %r11
	movq	___stack_chk_guard@GOTPCREL(%rip), %rbx
	movq	(%rbx), %rbx
	movq	%rbx, -16(%rbp)
	movq	%r8, -32824(%rbp)
	movq	%rdi, -32832(%rbp)
	movq	%r10, %rdi
	leaq	-33024(%rbp), %r8
	movq	%r8, 16(%rdi)
	leaq	16(%rbp), %r8
	movq	%r8, 8(%rdi)
	movl	$48, 4(%rdi)
	movl	$16, (%rdi)
	movq	-32832(%rbp), %r8
	movq	%r11, %rdi
	movq	%r10, %r9
	callq	___vsnprintf_chk
	movq	-32824(%rbp), %rdi
	movl	%eax, -33204(%rbp)      ## 4-byte Spill
	callq	_preview_lexem
	leaq	-48(%rbp), %rdx
	movq	%rax, -32840(%rbp)
	movq	-32840(%rbp), %rdi
	movq	-32832(%rbp), %rsi
	callq	_parse_error_at_va
	leaq	-48(%rbp), %rax
	movq	___stack_chk_guard@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rcx
	movq	-16(%rbp), %rdx
	cmpq	%rdx, %rcx
	movq	%rax, -33216(%rbp)      ## 8-byte Spill
	jne	LBB2_2
## %bb.1:
	addq	$33208, %rsp            ## imm = 0x81B8
	popq	%rbx
	popq	%rbp
	retq
LBB2_2:
	callq	___stack_chk_fail
	ud2
	.cfi_endproc
                                        ## -- End function
	.globl	_parse_error_at         ## -- Begin function parse_error_at
	.p2align	4, 0x90
_parse_error_at:                        ## @parse_error_at
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$416, %rsp              ## imm = 0x1A0
	testb	%al, %al
	movaps	%xmm7, -240(%rbp)       ## 16-byte Spill
	movaps	%xmm6, -256(%rbp)       ## 16-byte Spill
	movaps	%xmm5, -272(%rbp)       ## 16-byte Spill
	movaps	%xmm4, -288(%rbp)       ## 16-byte Spill
	movaps	%xmm3, -304(%rbp)       ## 16-byte Spill
	movaps	%xmm2, -320(%rbp)       ## 16-byte Spill
	movaps	%xmm1, -336(%rbp)       ## 16-byte Spill
	movaps	%xmm0, -352(%rbp)       ## 16-byte Spill
	movq	%rdi, -360(%rbp)        ## 8-byte Spill
	movq	%r9, -368(%rbp)         ## 8-byte Spill
	movq	%r8, -376(%rbp)         ## 8-byte Spill
	movq	%rcx, -384(%rbp)        ## 8-byte Spill
	movq	%rdx, -392(%rbp)        ## 8-byte Spill
	movq	%rsi, -400(%rbp)        ## 8-byte Spill
	je	LBB3_4
## %bb.3:
	movaps	-352(%rbp), %xmm0       ## 16-byte Reload
	movaps	%xmm0, -176(%rbp)
	movaps	-336(%rbp), %xmm1       ## 16-byte Reload
	movaps	%xmm1, -160(%rbp)
	movaps	-320(%rbp), %xmm2       ## 16-byte Reload
	movaps	%xmm2, -144(%rbp)
	movaps	-304(%rbp), %xmm3       ## 16-byte Reload
	movaps	%xmm3, -128(%rbp)
	movaps	-288(%rbp), %xmm4       ## 16-byte Reload
	movaps	%xmm4, -112(%rbp)
	movaps	-272(%rbp), %xmm5       ## 16-byte Reload
	movaps	%xmm5, -96(%rbp)
	movaps	-256(%rbp), %xmm6       ## 16-byte Reload
	movaps	%xmm6, -80(%rbp)
	movaps	-240(%rbp), %xmm7       ## 16-byte Reload
	movaps	%xmm7, -64(%rbp)
LBB3_4:
	movq	-368(%rbp), %rax        ## 8-byte Reload
	movq	%rax, -184(%rbp)
	movq	-376(%rbp), %rcx        ## 8-byte Reload
	movq	%rcx, -192(%rbp)
	movq	-384(%rbp), %rdx        ## 8-byte Reload
	movq	%rdx, -200(%rbp)
	movq	-392(%rbp), %rsi        ## 8-byte Reload
	movq	%rsi, -208(%rbp)
	movq	-400(%rbp), %rdi        ## 8-byte Reload
	movq	-360(%rbp), %r8         ## 8-byte Reload
	leaq	-32(%rbp), %r9
	movq	___stack_chk_guard@GOTPCREL(%rip), %r10
	movq	(%r10), %r10
	movq	%r10, -8(%rbp)
	movq	%r8, -40(%rbp)
	movq	%rdi, -48(%rbp)
	movq	%r9, %rdi
	leaq	-224(%rbp), %r8
	movq	%r8, 16(%rdi)
	leaq	16(%rbp), %r8
	movq	%r8, 8(%rdi)
	movl	$48, 4(%rdi)
	movl	$16, (%rdi)
	movq	-40(%rbp), %rdi
	movq	-48(%rbp), %rsi
	movq	%r9, %rdx
	callq	_parse_error_at_va
	leaq	-32(%rbp), %rax
	movq	___stack_chk_guard@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rcx
	movq	-8(%rbp), %rdx
	cmpq	%rdx, %rcx
	movq	%rax, -408(%rbp)        ## 8-byte Spill
	jne	LBB3_2
## %bb.1:
	addq	$416, %rsp              ## imm = 0x1A0
	popq	%rbp
	retq
LBB3_2:
	callq	___stack_chk_fail
	ud2
	.cfi_endproc
                                        ## -- End function
	.globl	_parse_file             ## -- Begin function parse_file
	.p2align	4, 0x90
_parse_file:                            ## @parse_file
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$64, %rsp
	movq	%rdi, -16(%rbp)
	movq	-16(%rbp), %rdi
	callq	_strdup
	movq	%rax, %rdi
	callq	_open_parser
	movq	%rax, -24(%rbp)
LBB4_1:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB4_3 Depth 2
	movq	-24(%rbp), %rdi
	callq	_get_string
	cmpl	$0, %eax
	jne	LBB4_6
## %bb.2:                               ##   in Loop: Header=BB4_1 Depth=1
	jmp	LBB4_3
LBB4_3:                                 ##   Parent Loop BB4_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movq	-24(%rbp), %rdi
	callq	_getlexem
	cmpl	$4, %eax
	je	LBB4_5
## %bb.4:                               ##   in Loop: Header=BB4_3 Depth=2
	jmp	LBB4_3
LBB4_5:                                 ##   in Loop: Header=BB4_1 Depth=1
	jmp	LBB4_1
LBB4_6:
	xorl	%edx, %edx
	movl	$35, %edi
	movl	$100, %esi
	movb	$0, %al
	callq	_astnode_new
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movl	$1, 40(%rax)
	movq	-32(%rbp), %rax
	movl	$0, 44(%rax)
	movq	-16(%rbp), %rdi
	callq	_strdup
	movq	-32(%rbp), %rdi
	movq	%rax, 48(%rdi)
LBB4_7:                                 ## =>This Inner Loop Header: Depth=1
	movq	-24(%rbp), %rdi
	callq	_preview_lexem
	movq	%rax, -40(%rbp)
	cmpq	$0, %rax
	je	LBB4_14
## %bb.8:                               ##   in Loop: Header=BB4_7 Depth=1
	movq	-40(%rbp), %rax
	cmpl	$3, (%rax)
	jne	LBB4_11
## %bb.9:                               ##   in Loop: Header=BB4_7 Depth=1
	movq	-40(%rbp), %rax
	cmpl	$1, 4(%rax)
	jne	LBB4_11
## %bb.10:                              ##   in Loop: Header=BB4_7 Depth=1
	movq	-24(%rbp), %rdi
	callq	_extract_lexem
	movq	%rax, -56(%rbp)         ## 8-byte Spill
	jmp	LBB4_7
LBB4_11:                                ##   in Loop: Header=BB4_7 Depth=1
	movq	-24(%rbp), %rdi
	callq	_parse_statement
	movq	%rax, -48(%rbp)
	cmpq	$0, -48(%rbp)
	jne	LBB4_13
## %bb.12:
	movq	-40(%rbp), %rdi
	leaq	L_.str.7(%rip), %rsi
	movb	$0, %al
	callq	_parse_error_at
	movq	$0, -8(%rbp)
	jmp	LBB4_15
LBB4_13:                                ##   in Loop: Header=BB4_7 Depth=1
	movq	-32(%rbp), %rdi
	movq	-48(%rbp), %rsi
	callq	_astnode_add_child
	jmp	LBB4_7
LBB4_14:
	movq	-24(%rbp), %rdi
	callq	_destroy_parser
	movq	-32(%rbp), %rdi
	movq	%rdi, -8(%rbp)
LBB4_15:
	movq	-8(%rbp), %rax
	addq	$64, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_parse_statement        ## -- Begin function parse_statement
	.p2align	4, 0x90
_parse_statement:                       ## @parse_statement
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$352, %rsp              ## imm = 0x160
	movq	%rdi, -16(%rbp)
	movq	-16(%rbp), %rdi
	callq	_preview_lexem
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	LBB5_2
## %bb.1:
	movq	$0, -8(%rbp)
	jmp	LBB5_59
LBB5_2:
	movq	-24(%rbp), %rax
	cmpl	$3, (%rax)
	jne	LBB5_50
## %bb.3:
	movq	-24(%rbp), %rax
	movl	4(%rax), %ecx
	addl	$-29, %ecx
	movl	%ecx, %eax
	subl	$13, %ecx
	movq	%rax, -216(%rbp)        ## 8-byte Spill
	movl	%ecx, -220(%rbp)        ## 4-byte Spill
	ja	LBB5_48
## %bb.60:
	leaq	LJTI5_0(%rip), %rax
	movq	-216(%rbp), %rcx        ## 8-byte Reload
	movslq	(%rax,%rcx,4), %rdx
	addq	%rax, %rdx
	jmpq	*%rdx
LBB5_4:
	jmp	LBB5_5
LBB5_5:
	movq	-16(%rbp), %rdi
	callq	_extract_lexem
	movq	-16(%rbp), %rdi
	movq	%rax, -232(%rbp)        ## 8-byte Spill
	callq	_parse_expression
	movq	%rax, -32(%rbp)
	movq	-16(%rbp), %rdi
	callq	_extract_lexem
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	cmpl	$3, (%rax)
	jne	LBB5_8
## %bb.6:
	movq	-40(%rbp), %rax
	cmpl	$1, 4(%rax)
	je	LBB5_8
## %bb.7:
	movq	-40(%rbp), %rdi
	leaq	L_.str.8(%rip), %rsi
	movb	$0, %al
	callq	_parse_error_at
	movq	$0, -8(%rbp)
	jmp	LBB5_59
LBB5_8:
	movq	-16(%rbp), %rdi
	callq	_parse_compound
	movq	%rax, -48(%rbp)
	movq	-16(%rbp), %rdi
	callq	_preview_lexem
	movq	%rax, -40(%rbp)
	movq	-32(%rbp), %rcx
	movq	-48(%rbp), %r8
	movl	$21, %edi
	movl	$3, %esi
	movl	$2, %edx
	movb	$0, %al
	callq	_astnode_new
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rdi
	movq	-40(%rbp), %rsi
	callq	_bind_to_lexem
	cmpq	$0, -40(%rbp)
	je	LBB5_12
## %bb.9:
	movq	-40(%rbp), %rax
	cmpl	$3, (%rax)
	jne	LBB5_12
## %bb.10:
	movq	-40(%rbp), %rax
	cmpl	$33, 4(%rax)
	jne	LBB5_12
## %bb.11:
	movq	-16(%rbp), %rdi
	callq	_extract_lexem
	movq	-16(%rbp), %rdi
	movq	%rax, -240(%rbp)        ## 8-byte Spill
	callq	_extract_lexem
	movq	-16(%rbp), %rdi
	movq	%rax, -248(%rbp)        ## 8-byte Spill
	callq	_parse_compound
	movq	%rax, -64(%rbp)
	movq	-56(%rbp), %rdi
	movq	-64(%rbp), %rsi
	callq	_astnode_add_child
LBB5_12:
	movq	-56(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB5_59
LBB5_13:
	jmp	LBB5_14
LBB5_14:
	movq	-16(%rbp), %rdi
	callq	_extract_lexem
	movq	-16(%rbp), %rdi
	movq	%rax, -256(%rbp)        ## 8-byte Spill
	callq	_parse_expression
	movq	%rax, -72(%rbp)
	movq	-72(%rbp), %rax
	cmpl	$30, 8(%rax)
	je	LBB5_16
## %bb.15:
	movq	-16(%rbp), %rdi
	callq	_preview_lexem
	movq	%rax, -80(%rbp)
	movq	-80(%rbp), %rdi
	leaq	L_.str.9(%rip), %rsi
	movb	$0, %al
	callq	_parse_error_at
LBB5_16:
	movq	-16(%rbp), %rdi
	callq	_extract_lexem
	movq	%rax, -88(%rbp)
	movq	-88(%rbp), %rax
	cmpl	$3, (%rax)
	jne	LBB5_19
## %bb.17:
	movq	-88(%rbp), %rax
	cmpl	$1, 4(%rax)
	je	LBB5_19
## %bb.18:
	movq	-88(%rbp), %rdi
	leaq	L_.str.8(%rip), %rsi
	movb	$0, %al
	callq	_parse_error_at
	movq	$0, -8(%rbp)
	jmp	LBB5_59
LBB5_19:
	movq	-16(%rbp), %rdi
	callq	_parse_compound
	movq	%rax, -96(%rbp)
	movq	-72(%rbp), %rcx
	movq	-96(%rbp), %r8
	movl	$31, %edi
	movl	$2, %edx
	movl	%edx, %esi
	movb	$0, %al
	callq	_astnode_new
	movq	%rax, -104(%rbp)
	movq	-104(%rbp), %rdi
	movq	-88(%rbp), %rsi
	callq	_bind_to_lexem
	movq	-104(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB5_59
LBB5_20:
	jmp	LBB5_21
LBB5_21:
	movq	-16(%rbp), %rdi
	callq	_extract_lexem
	movq	-16(%rbp), %rdi
	movq	%rax, -264(%rbp)        ## 8-byte Spill
	callq	_extract_lexem
	movq	%rax, -112(%rbp)
	movq	-112(%rbp), %rax
	cmpl	$3, (%rax)
	jne	LBB5_24
## %bb.22:
	movq	-112(%rbp), %rax
	cmpl	$1, 4(%rax)
	je	LBB5_24
## %bb.23:
	movq	-112(%rbp), %rdi
	leaq	L_.str.8(%rip), %rsi
	movb	$0, %al
	callq	_parse_error_at
	movq	$0, -8(%rbp)
	jmp	LBB5_59
LBB5_24:
	movq	-16(%rbp), %rdi
	callq	_parse_compound
	movq	%rax, -120(%rbp)
	movq	-120(%rbp), %rcx
	movl	$32, %edi
	movl	$1, %edx
	movl	%edx, %esi
	movb	$0, %al
	callq	_astnode_new
	movq	%rax, -128(%rbp)
	movq	-128(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB5_59
LBB5_25:
	jmp	LBB5_26
LBB5_26:
	movq	-16(%rbp), %rdi
	callq	_extract_lexem
	movq	-16(%rbp), %rdi
	movq	%rax, -272(%rbp)        ## 8-byte Spill
	callq	_parse_expression
	movq	%rax, -136(%rbp)
	cmpq	$0, -136(%rbp)
	jne	LBB5_28
## %bb.27:
	movq	$0, -8(%rbp)
	jmp	LBB5_59
LBB5_28:
	movq	-16(%rbp), %rdi
	callq	_extract_lexem
	movq	-136(%rbp), %rcx
	movl	$34, %edi
	movl	$1, %edx
	movl	%edx, %esi
	movq	%rax, -280(%rbp)        ## 8-byte Spill
	movb	$0, %al
	callq	_astnode_new
	movq	%rax, -8(%rbp)
	jmp	LBB5_59
LBB5_29:
	jmp	LBB5_30
LBB5_30:
	movq	-16(%rbp), %rdi
	callq	_extract_lexem
	movq	-16(%rbp), %rdi
	movq	%rax, -288(%rbp)        ## 8-byte Spill
	callq	_parse_expression
	movq	%rax, -144(%rbp)
	cmpq	$0, -144(%rbp)
	jne	LBB5_32
## %bb.31:
	movq	$0, -8(%rbp)
	jmp	LBB5_59
LBB5_32:
	movq	-16(%rbp), %rdi
	callq	_extract_lexem
	movq	-144(%rbp), %rcx
	movl	$20, %edi
	movl	$1, %edx
	movl	%edx, %esi
	movq	%rax, -296(%rbp)        ## 8-byte Spill
	movb	$0, %al
	callq	_astnode_new
	movq	%rax, -8(%rbp)
	jmp	LBB5_59
LBB5_33:
	movq	-16(%rbp), %rdi
	callq	_extract_lexem
	movq	-16(%rbp), %rdi
	movq	%rax, -304(%rbp)        ## 8-byte Spill
	callq	_parse_toplevel
	movq	%rax, -152(%rbp)
	cmpq	$0, -152(%rbp)
	jne	LBB5_35
## %bb.34:
	movq	$0, -8(%rbp)
	jmp	LBB5_59
LBB5_35:
	movq	-152(%rbp), %rcx
	movl	$37, %edi
	movl	$1, %eax
	movl	%eax, %esi
	movl	%eax, %edx
	movb	$0, %al
	callq	_astnode_new
	movq	%rax, -8(%rbp)
	jmp	LBB5_59
LBB5_36:
	movq	-16(%rbp), %rdi
	callq	_extract_lexem
	movq	-16(%rbp), %rdi
	movq	%rax, -312(%rbp)        ## 8-byte Spill
	callq	_parse_expression
	movq	%rax, -160(%rbp)
	movq	-16(%rbp), %rdi
	callq	_preview_lexem
	cmpl	$3, (%rax)
	jne	LBB5_38
## %bb.37:
	movq	-16(%rbp), %rdi
	callq	_preview_lexem
	cmpl	$1, 4(%rax)
	je	LBB5_39
LBB5_38:
	movq	-16(%rbp), %rdi
	callq	_preview_lexem
	movq	%rax, %rdi
	leaq	L_.str.8(%rip), %rsi
	movb	$0, %al
	callq	_parse_error_at
	movq	$0, -8(%rbp)
	jmp	LBB5_59
LBB5_39:
	movq	-16(%rbp), %rdi
	callq	_extract_lexem
	movq	-16(%rbp), %rdi
	movq	%rax, -320(%rbp)        ## 8-byte Spill
	callq	_parse_compound
	movq	%rax, -168(%rbp)
	cmpq	$0, -168(%rbp)
	jne	LBB5_41
## %bb.40:
	movq	$0, -8(%rbp)
	jmp	LBB5_59
LBB5_41:
	movq	-160(%rbp), %rcx
	movq	-168(%rbp), %r8
	movl	$39, %edi
	movl	$2, %eax
	movl	%eax, %esi
	movl	%eax, %edx
	movb	$0, %al
	callq	_astnode_new
	movq	%rax, -8(%rbp)
	jmp	LBB5_59
LBB5_42:
	movq	-16(%rbp), %rdi
	callq	_extract_lexem
	movq	-16(%rbp), %rdi
	movq	%rax, -328(%rbp)        ## 8-byte Spill
	callq	_preview_lexem
	xorl	%ecx, %ecx
	movq	%rax, -176(%rbp)
	movl	$29, %edi
	movl	%ecx, %esi
	movl	%ecx, %edx
	movb	$0, %al
	callq	_astnode_new
	movq	%rax, -184(%rbp)
	movq	-176(%rbp), %rax
	cmpl	$0, (%rax)
	jne	LBB5_44
## %bb.43:
	movq	-176(%rbp), %rax
	movq	8(%rax), %rdi
	callq	_strdup
	movq	-184(%rbp), %rdi
	movq	%rax, 32(%rdi)
	movq	-16(%rbp), %rdi
	callq	_extract_lexem
	movq	%rax, -336(%rbp)        ## 8-byte Spill
	jmp	LBB5_45
LBB5_44:
	movq	-184(%rbp), %rax
	movq	$0, 32(%rax)
LBB5_45:
	movq	-16(%rbp), %rdi
	callq	_extract_lexem
	movq	-16(%rbp), %rdi
	movq	%rax, -344(%rbp)        ## 8-byte Spill
	callq	_parse_compound
	movq	%rax, -192(%rbp)
	cmpq	$0, -192(%rbp)
	jne	LBB5_47
## %bb.46:
	movq	-16(%rbp), %rdi
	callq	_preview_lexem
	movq	%rax, %rdi
	leaq	L_.str.10(%rip), %rsi
	movb	$0, %al
	callq	_parse_error_at
	movq	$0, -8(%rbp)
	jmp	LBB5_59
LBB5_47:
	movq	-184(%rbp), %rcx
	movq	-192(%rbp), %r8
	movl	$41, %edi
	movl	$2, %eax
	movl	%eax, %esi
	movl	%eax, %edx
	movb	$0, %al
	callq	_astnode_new
	movq	%rax, -8(%rbp)
	jmp	LBB5_59
LBB5_48:
	jmp	LBB5_49
LBB5_49:
	jmp	LBB5_50
LBB5_50:
	movq	-16(%rbp), %rdi
	callq	_parse_expression
	movq	%rax, -200(%rbp)
	cmpq	$0, -200(%rbp)
	je	LBB5_58
## %bb.51:
	movq	-200(%rbp), %rax
	cmpl	$2, 8(%rax)
	jne	LBB5_53
## %bb.52:
	movq	-200(%rbp), %rax
	movq	16(%rax), %rax
	movq	8(%rax), %rax
	cmpl	$19, 8(%rax)
	je	LBB5_58
LBB5_53:
	movq	-16(%rbp), %rdi
	callq	_extract_lexem
	movq	%rax, -208(%rbp)
	cmpq	$0, -208(%rbp)
	je	LBB5_57
## %bb.54:
	movq	-208(%rbp), %rax
	cmpl	$3, (%rax)
	jne	LBB5_56
## %bb.55:
	movq	-208(%rbp), %rax
	cmpl	$1, 4(%rax)
	je	LBB5_57
LBB5_56:
	movq	-208(%rbp), %rdi
	leaq	L_.str.11(%rip), %rsi
	movb	$0, %al
	callq	_parse_error_at
	movq	$0, -8(%rbp)
	jmp	LBB5_59
LBB5_57:
	jmp	LBB5_58
LBB5_58:
	movq	-200(%rbp), %rax
	movq	%rax, -8(%rbp)
LBB5_59:
	movq	-8(%rbp), %rax
	addq	$352, %rsp              ## imm = 0x160
	popq	%rbp
	retq
	.cfi_endproc
	.p2align	2, 0x90
	.data_region jt32
.set L5_0_set_4, LBB5_4-LJTI5_0
.set L5_0_set_13, LBB5_13-LJTI5_0
.set L5_0_set_48, LBB5_48-LJTI5_0
.set L5_0_set_20, LBB5_20-LJTI5_0
.set L5_0_set_29, LBB5_29-LJTI5_0
.set L5_0_set_33, LBB5_33-LJTI5_0
.set L5_0_set_42, LBB5_42-LJTI5_0
.set L5_0_set_25, LBB5_25-LJTI5_0
.set L5_0_set_36, LBB5_36-LJTI5_0
LJTI5_0:
	.long	L5_0_set_4
	.long	L5_0_set_13
	.long	L5_0_set_48
	.long	L5_0_set_48
	.long	L5_0_set_48
	.long	L5_0_set_48
	.long	L5_0_set_48
	.long	L5_0_set_20
	.long	L5_0_set_29
	.long	L5_0_set_33
	.long	L5_0_set_42
	.long	L5_0_set_48
	.long	L5_0_set_25
	.long	L5_0_set_36
	.end_data_region
                                        ## -- End function
	.globl	_parse_expression       ## -- Begin function parse_expression
	.p2align	4, 0x90
_parse_expression:                      ## @parse_expression
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
	callq	_parse_lrvalue
	movq	%rax, -24(%rbp)
	movq	-16(%rbp), %rdi
	callq	_preview_lexem
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	je	LBB6_3
## %bb.1:
	movq	-32(%rbp), %rax
	cmpl	$3, (%rax)
	jne	LBB6_4
## %bb.2:
	movq	-32(%rbp), %rax
	cmpl	$1, 4(%rax)
	jne	LBB6_4
LBB6_3:
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB6_20
LBB6_4:
	movq	-32(%rbp), %rax
	cmpl	$3, (%rax)
	jne	LBB6_18
## %bb.5:
	movl	$0, -36(%rbp)
	movq	-32(%rbp), %rax
	movl	4(%rax), %ecx
	addl	$-4, %ecx
	movl	%ecx, %eax
	subl	$17, %ecx
	movq	%rax, -64(%rbp)         ## 8-byte Spill
	movl	%ecx, -68(%rbp)         ## 4-byte Spill
	ja	LBB6_12
## %bb.21:
	leaq	LJTI6_0(%rip), %rax
	movq	-64(%rbp), %rcx         ## 8-byte Reload
	movslq	(%rax,%rcx,4), %rdx
	addq	%rax, %rdx
	jmpq	*%rdx
LBB6_6:
	movl	$2, -36(%rbp)
	jmp	LBB6_13
LBB6_7:
	movl	$3, -36(%rbp)
	jmp	LBB6_13
LBB6_8:
	movl	$4, -36(%rbp)
	jmp	LBB6_13
LBB6_9:
	movl	$5, -36(%rbp)
	jmp	LBB6_13
LBB6_10:
	movl	$6, -36(%rbp)
	jmp	LBB6_13
LBB6_11:
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB6_20
LBB6_12:
	jmp	LBB6_13
LBB6_13:
	cmpl	$0, -36(%rbp)
	je	LBB6_17
## %bb.14:
	movq	-16(%rbp), %rdi
	callq	_extract_lexem
	movq	-16(%rbp), %rdi
	movq	%rax, -80(%rbp)         ## 8-byte Spill
	callq	_parse_lrvalue
	movq	%rax, -48(%rbp)
	cmpq	$0, -48(%rbp)
	jne	LBB6_16
## %bb.15:
	movq	$0, -8(%rbp)
	jmp	LBB6_20
LBB6_16:
	movl	-36(%rbp), %edi
	movq	-24(%rbp), %rcx
	movq	-48(%rbp), %r8
	movl	$2, %eax
	movl	%eax, %esi
	movl	%eax, %edx
	movb	$0, %al
	callq	_astnode_new
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB6_20
LBB6_17:
	jmp	LBB6_18
LBB6_18:
	jmp	LBB6_19
LBB6_19:
	movq	-16(%rbp), %rdi
	leaq	L_.str.25(%rip), %rsi
	movb	$0, %al
	callq	_parse_error
	movq	$0, -8(%rbp)
LBB6_20:
	movq	-8(%rbp), %rax
	addq	$80, %rsp
	popq	%rbp
	retq
	.cfi_endproc
	.p2align	2, 0x90
	.data_region jt32
.set L6_0_set_11, LBB6_11-LJTI6_0
.set L6_0_set_12, LBB6_12-LJTI6_0
.set L6_0_set_7, LBB6_7-LJTI6_0
.set L6_0_set_8, LBB6_8-LJTI6_0
.set L6_0_set_9, LBB6_9-LJTI6_0
.set L6_0_set_10, LBB6_10-LJTI6_0
.set L6_0_set_6, LBB6_6-LJTI6_0
LJTI6_0:
	.long	L6_0_set_11
	.long	L6_0_set_12
	.long	L6_0_set_11
	.long	L6_0_set_12
	.long	L6_0_set_11
	.long	L6_0_set_12
	.long	L6_0_set_12
	.long	L6_0_set_12
	.long	L6_0_set_12
	.long	L6_0_set_12
	.long	L6_0_set_12
	.long	L6_0_set_12
	.long	L6_0_set_12
	.long	L6_0_set_7
	.long	L6_0_set_8
	.long	L6_0_set_9
	.long	L6_0_set_10
	.long	L6_0_set_6
	.end_data_region
                                        ## -- End function
	.globl	_parse_compound         ## -- Begin function parse_compound
	.p2align	4, 0x90
_parse_compound:                        ## @parse_compound
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$64, %rsp
	movq	%rdi, -16(%rbp)
	movq	-16(%rbp), %rdi
	callq	_extract_lexem
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	cmpl	$3, (%rax)
	jne	LBB7_3
## %bb.1:
	movq	-24(%rbp), %rax
	cmpl	$43, 4(%rax)
	je	LBB7_3
## %bb.2:
	movq	-16(%rbp), %rdi
	leaq	L_.str.12(%rip), %rsi
	movb	$0, %al
	callq	_parse_error
	movq	$0, -8(%rbp)
	jmp	LBB7_18
LBB7_3:
	xorl	%edx, %edx
	movl	$1, %edi
	movl	$16, %esi
	movb	$0, %al
	callq	_astnode_new
	movq	%rax, -32(%rbp)
LBB7_4:                                 ## =>This Inner Loop Header: Depth=1
	movq	-16(%rbp), %rdi
	callq	_parse_statement
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	jne	LBB7_6
## %bb.5:
	movq	$0, -8(%rbp)
	jmp	LBB7_18
LBB7_6:                                 ##   in Loop: Header=BB7_4 Depth=1
	movq	-32(%rbp), %rdi
	movq	-40(%rbp), %rsi
	callq	_astnode_add_child
	movq	-16(%rbp), %rdi
	callq	_preview_lexem
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	LBB7_8
## %bb.7:
	jmp	LBB7_12
LBB7_8:                                 ##   in Loop: Header=BB7_4 Depth=1
	jmp	LBB7_9
LBB7_9:                                 ##   in Loop: Header=BB7_4 Depth=1
	movq	-24(%rbp), %rax
	cmpl	$3, (%rax)
	movb	$1, %cl
	movb	%cl, -41(%rbp)          ## 1-byte Spill
	jne	LBB7_11
## %bb.10:                              ##   in Loop: Header=BB7_4 Depth=1
	movq	-24(%rbp), %rax
	cmpl	$44, 4(%rax)
	setne	%cl
	movb	%cl, -41(%rbp)          ## 1-byte Spill
LBB7_11:                                ##   in Loop: Header=BB7_4 Depth=1
	movb	-41(%rbp), %al          ## 1-byte Reload
	testb	$1, %al
	jne	LBB7_4
LBB7_12:
	cmpq	$0, -24(%rbp)
	je	LBB7_17
## %bb.13:
	movq	-24(%rbp), %rax
	cmpl	$3, (%rax)
	jne	LBB7_16
## %bb.14:
	movq	-24(%rbp), %rax
	cmpl	$44, 4(%rax)
	jne	LBB7_16
## %bb.15:
	movq	-16(%rbp), %rdi
	callq	_extract_lexem
	movq	%rax, -56(%rbp)         ## 8-byte Spill
LBB7_16:
	jmp	LBB7_17
LBB7_17:
	movq	-32(%rbp), %rax
	movq	%rax, -8(%rbp)
LBB7_18:
	movq	-8(%rbp), %rax
	addq	$64, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_parse_toplevel         ## -- Begin function parse_toplevel
	.p2align	4, 0x90
_parse_toplevel:                        ## @parse_toplevel
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$96, %rsp
	xorl	%eax, %eax
	movq	%rdi, -16(%rbp)
	movl	$29, %edi
	movl	%eax, %esi
	movl	%eax, %edx
	movb	$0, %al
	callq	_astnode_new
	movq	%rax, -24(%rbp)
	movq	-16(%rbp), %rdi
	callq	_preview_lexem
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	LBB8_2
## %bb.1:
	movq	-16(%rbp), %rdi
	leaq	L_.str.18(%rip), %rsi
	movb	$0, %al
	callq	_parse_error
	movq	$0, -8(%rbp)
	jmp	LBB8_13
LBB8_2:
	movq	-32(%rbp), %rax
	movl	(%rax), %ecx
	movl	%ecx, %eax
	movq	%rax, %rdx
	subq	$3, %rdx
	movq	%rax, -40(%rbp)         ## 8-byte Spill
	movq	%rdx, -48(%rbp)         ## 8-byte Spill
	ja	LBB8_12
## %bb.14:
	leaq	LJTI8_0(%rip), %rax
	movq	-40(%rbp), %rcx         ## 8-byte Reload
	movslq	(%rax,%rcx,4), %rdx
	addq	%rax, %rdx
	jmpq	*%rdx
LBB8_3:
	movq	-24(%rbp), %rax
	movl	$29, 8(%rax)
	movq	-32(%rbp), %rax
	movq	8(%rax), %rdi
	callq	_strdup
	movq	-24(%rbp), %rdi
	movq	%rax, 32(%rdi)
	movq	-16(%rbp), %rdi
	callq	_extract_lexem
	movq	-24(%rbp), %rdi
	movq	%rdi, -8(%rbp)
	movq	%rax, -56(%rbp)         ## 8-byte Spill
	jmp	LBB8_13
LBB8_4:
	movq	-24(%rbp), %rax
	movl	$27, 8(%rax)
	movq	-32(%rbp), %rax
	movq	8(%rax), %rdi
	callq	_strdup
	movq	-24(%rbp), %rdi
	movq	%rax, 32(%rdi)
	movq	-16(%rbp), %rdi
	callq	_extract_lexem
	movq	-24(%rbp), %rdi
	movq	%rdi, -8(%rbp)
	movq	%rax, -64(%rbp)         ## 8-byte Spill
	jmp	LBB8_13
LBB8_5:
	movl	$8, %eax
	movl	%eax, %edi
	movq	-24(%rbp), %rcx
	movl	$26, 8(%rcx)
	callq	_malloc
	movq	-24(%rbp), %rcx
	movq	%rax, 32(%rcx)
	movq	-32(%rbp), %rax
	movsd	16(%rax), %xmm0         ## xmm0 = mem[0],zero
	movq	-24(%rbp), %rax
	movq	32(%rax), %rax
	movsd	%xmm0, (%rax)
	movq	-16(%rbp), %rdi
	callq	_extract_lexem
	movq	-24(%rbp), %rcx
	movq	%rcx, -8(%rbp)
	movq	%rax, -72(%rbp)         ## 8-byte Spill
	jmp	LBB8_13
LBB8_6:
	movq	-32(%rbp), %rax
	cmpl	$31, 4(%rax)
	je	LBB8_8
## %bb.7:
	movq	-32(%rbp), %rax
	cmpl	$32, 4(%rax)
	jne	LBB8_9
LBB8_8:
	movl	$8, %eax
	movl	%eax, %edi
	movq	-24(%rbp), %rcx
	movl	$28, 8(%rcx)
	callq	_malloc
	xorl	%edx, %edx
	movq	-24(%rbp), %rcx
	movq	%rax, 32(%rcx)
	movq	-32(%rbp), %rax
	movl	4(%rax), %esi
	cmpl	$31, %esi
	movl	$1, %esi
	cmovel	%esi, %edx
	movslq	%edx, %rax
	movq	-24(%rbp), %rcx
	movq	32(%rcx), %rcx
	movq	%rax, (%rcx)
	movq	-16(%rbp), %rdi
	callq	_extract_lexem
	movq	-24(%rbp), %rcx
	movq	%rcx, -8(%rbp)
	movq	%rax, -80(%rbp)         ## 8-byte Spill
	jmp	LBB8_13
LBB8_9:
	movq	-32(%rbp), %rax
	cmpl	$3, 4(%rax)
	jne	LBB8_11
## %bb.10:
	movq	-16(%rbp), %rdi
	callq	_extract_lexem
	movq	-16(%rbp), %rdi
	movl	$4, %esi
	movq	%rax, -88(%rbp)         ## 8-byte Spill
	callq	_parse_subexpr
	movq	%rax, -8(%rbp)
	jmp	LBB8_13
LBB8_11:
	jmp	LBB8_12
LBB8_12:
	movq	-16(%rbp), %rdi
	leaq	L_.str.19(%rip), %rsi
	movb	$0, %al
	callq	_parse_error
	movq	$0, -8(%rbp)
LBB8_13:
	movq	-8(%rbp), %rax
	addq	$96, %rsp
	popq	%rbp
	retq
	.cfi_endproc
	.p2align	2, 0x90
	.data_region jt32
.set L8_0_set_3, LBB8_3-LJTI8_0
.set L8_0_set_4, LBB8_4-LJTI8_0
.set L8_0_set_5, LBB8_5-LJTI8_0
.set L8_0_set_6, LBB8_6-LJTI8_0
LJTI8_0:
	.long	L8_0_set_3
	.long	L8_0_set_4
	.long	L8_0_set_5
	.long	L8_0_set_6
	.end_data_region
                                        ## -- End function
	.globl	_parse_logical_or       ## -- Begin function parse_logical_or
	.p2align	4, 0x90
_parse_logical_or:                      ## @parse_logical_or
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$64, %rsp
	movq	%rdi, -16(%rbp)
	movq	-16(%rbp), %rdi
	callq	_parse_logical_and
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	LBB9_2
## %bb.1:
	movq	$0, -8(%rbp)
	jmp	LBB9_9
LBB9_2:
	movq	-16(%rbp), %rdi
	callq	_preview_lexem
	movq	%rax, -32(%rbp)
LBB9_3:                                 ## =>This Inner Loop Header: Depth=1
	xorl	%eax, %eax
	movb	%al, %cl
	cmpq	$0, -32(%rbp)
	movb	%cl, -41(%rbp)          ## 1-byte Spill
	je	LBB9_6
## %bb.4:                               ##   in Loop: Header=BB9_3 Depth=1
	xorl	%eax, %eax
	movb	%al, %cl
	movq	-32(%rbp), %rdx
	cmpl	$3, (%rdx)
	movb	%cl, -41(%rbp)          ## 1-byte Spill
	jne	LBB9_6
## %bb.5:                               ##   in Loop: Header=BB9_3 Depth=1
	movq	-32(%rbp), %rax
	cmpl	$26, 4(%rax)
	sete	%cl
	movb	%cl, -41(%rbp)          ## 1-byte Spill
LBB9_6:                                 ##   in Loop: Header=BB9_3 Depth=1
	movb	-41(%rbp), %al          ## 1-byte Reload
	testb	$1, %al
	jne	LBB9_7
	jmp	LBB9_8
LBB9_7:                                 ##   in Loop: Header=BB9_3 Depth=1
	movq	-16(%rbp), %rdi
	callq	_extract_lexem
	movq	-16(%rbp), %rdi
	movq	%rax, -56(%rbp)         ## 8-byte Spill
	callq	_parse_logical_and
	movq	%rax, -40(%rbp)
	movq	-24(%rbp), %rcx
	movq	-40(%rbp), %r8
	movl	$14, %edi
	movl	$2, %edx
	movl	%edx, %esi
	movb	$0, %al
	callq	_astnode_new
	movq	%rax, -24(%rbp)
	movq	-16(%rbp), %rdi
	callq	_preview_lexem
	movq	%rax, -32(%rbp)
	jmp	LBB9_3
LBB9_8:
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
LBB9_9:
	movq	-8(%rbp), %rax
	addq	$64, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_parse_logical_and      ## -- Begin function parse_logical_and
	.p2align	4, 0x90
_parse_logical_and:                     ## @parse_logical_and
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$64, %rsp
	movq	%rdi, -16(%rbp)
	movq	-16(%rbp), %rdi
	callq	_parse_in
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	LBB10_2
## %bb.1:
	movq	$0, -8(%rbp)
	jmp	LBB10_9
LBB10_2:
	movq	-16(%rbp), %rdi
	callq	_preview_lexem
	movq	%rax, -32(%rbp)
LBB10_3:                                ## =>This Inner Loop Header: Depth=1
	xorl	%eax, %eax
	movb	%al, %cl
	cmpq	$0, -32(%rbp)
	movb	%cl, -41(%rbp)          ## 1-byte Spill
	je	LBB10_6
## %bb.4:                               ##   in Loop: Header=BB10_3 Depth=1
	xorl	%eax, %eax
	movb	%al, %cl
	movq	-32(%rbp), %rdx
	cmpl	$3, (%rdx)
	movb	%cl, -41(%rbp)          ## 1-byte Spill
	jne	LBB10_6
## %bb.5:                               ##   in Loop: Header=BB10_3 Depth=1
	movq	-32(%rbp), %rax
	cmpl	$27, 4(%rax)
	sete	%cl
	movb	%cl, -41(%rbp)          ## 1-byte Spill
LBB10_6:                                ##   in Loop: Header=BB10_3 Depth=1
	movb	-41(%rbp), %al          ## 1-byte Reload
	testb	$1, %al
	jne	LBB10_7
	jmp	LBB10_8
LBB10_7:                                ##   in Loop: Header=BB10_3 Depth=1
	movq	-16(%rbp), %rdi
	callq	_extract_lexem
	movq	-16(%rbp), %rdi
	movq	%rax, -56(%rbp)         ## 8-byte Spill
	callq	_parse_in
	movq	%rax, -40(%rbp)
	movq	-24(%rbp), %rcx
	movq	-40(%rbp), %r8
	movl	$15, %edi
	movl	$2, %edx
	movl	%edx, %esi
	movb	$0, %al
	callq	_astnode_new
	movq	%rax, -24(%rbp)
	movq	-16(%rbp), %rdi
	callq	_preview_lexem
	movq	%rax, -32(%rbp)
	jmp	LBB10_3
LBB10_8:
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
LBB10_9:
	movq	-8(%rbp), %rax
	addq	$64, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_parse_in               ## -- Begin function parse_in
	.p2align	4, 0x90
_parse_in:                              ## @parse_in
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
	callq	_parse_comparison
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	LBB11_2
## %bb.1:
	movq	$0, -8(%rbp)
	jmp	LBB11_7
LBB11_2:
	movq	-16(%rbp), %rdi
	callq	_preview_lexem
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	je	LBB11_6
## %bb.3:
	movq	-32(%rbp), %rax
	cmpl	$3, (%rax)
	jne	LBB11_6
## %bb.4:
	movq	-32(%rbp), %rax
	cmpl	$40, 4(%rax)
	jne	LBB11_6
## %bb.5:
	movq	-16(%rbp), %rdi
	callq	_extract_lexem
	movq	-16(%rbp), %rdi
	movq	%rax, -48(%rbp)         ## 8-byte Spill
	callq	_parse_comparison
	movq	%rax, -40(%rbp)
	movq	-24(%rbp), %rcx
	movq	-40(%rbp), %r8
	movl	$30, %edi
	movl	$2, %edx
	movl	%edx, %esi
	movb	$0, %al
	callq	_astnode_new
	movq	%rax, -24(%rbp)
LBB11_6:
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
LBB11_7:
	movq	-8(%rbp), %rax
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_parse_comparison       ## -- Begin function parse_comparison
	.p2align	4, 0x90
_parse_comparison:                      ## @parse_comparison
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
	callq	_parse_plusminus
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	LBB12_2
## %bb.1:
	movq	$0, -8(%rbp)
	jmp	LBB12_14
LBB12_2:
	movq	-16(%rbp), %rdi
	callq	_preview_lexem
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	je	LBB12_13
## %bb.3:
	movq	-32(%rbp), %rax
	cmpl	$3, (%rax)
	jne	LBB12_13
## %bb.4:
	movq	-32(%rbp), %rax
	movl	4(%rax), %ecx
	addl	$-11, %ecx
	movl	%ecx, %eax
	subl	$5, %ecx
	movq	%rax, -56(%rbp)         ## 8-byte Spill
	movl	%ecx, -60(%rbp)         ## 4-byte Spill
	ja	LBB12_11
## %bb.15:
	leaq	LJTI12_0(%rip), %rax
	movq	-56(%rbp), %rcx         ## 8-byte Reload
	movslq	(%rax,%rcx,4), %rdx
	addq	%rax, %rdx
	jmpq	*%rdx
LBB12_5:
	movl	$12, -44(%rbp)
	jmp	LBB12_12
LBB12_6:
	movl	$13, -44(%rbp)
	jmp	LBB12_12
LBB12_7:
	movl	$8, -44(%rbp)
	jmp	LBB12_12
LBB12_8:
	movl	$10, -44(%rbp)
	jmp	LBB12_12
LBB12_9:
	movl	$11, -44(%rbp)
	jmp	LBB12_12
LBB12_10:
	movl	$9, -44(%rbp)
	jmp	LBB12_12
LBB12_11:
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB12_14
LBB12_12:
	movq	-16(%rbp), %rdi
	callq	_extract_lexem
	movq	-16(%rbp), %rdi
	movq	%rax, -72(%rbp)         ## 8-byte Spill
	callq	_parse_plusminus
	movq	%rax, -40(%rbp)
	movl	-44(%rbp), %edi
	movq	-24(%rbp), %rcx
	movq	-40(%rbp), %r8
	movl	$2, %edx
	movl	%edx, %esi
	movb	$0, %al
	callq	_astnode_new
	movq	%rax, -24(%rbp)
LBB12_13:
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
LBB12_14:
	movq	-8(%rbp), %rax
	addq	$80, %rsp
	popq	%rbp
	retq
	.cfi_endproc
	.p2align	2, 0x90
	.data_region jt32
.set L12_0_set_5, LBB12_5-LJTI12_0
.set L12_0_set_6, LBB12_6-LJTI12_0
.set L12_0_set_7, LBB12_7-LJTI12_0
.set L12_0_set_8, LBB12_8-LJTI12_0
.set L12_0_set_10, LBB12_10-LJTI12_0
.set L12_0_set_9, LBB12_9-LJTI12_0
LJTI12_0:
	.long	L12_0_set_5
	.long	L12_0_set_6
	.long	L12_0_set_7
	.long	L12_0_set_8
	.long	L12_0_set_10
	.long	L12_0_set_9
	.end_data_region
                                        ## -- End function
	.globl	_parse_plusminus        ## -- Begin function parse_plusminus
	.p2align	4, 0x90
_parse_plusminus:                       ## @parse_plusminus
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
	callq	_parse_multdiv
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	LBB13_2
## %bb.1:
	movq	$0, -8(%rbp)
	jmp	LBB13_12
LBB13_2:
	movq	-16(%rbp), %rdi
	callq	_preview_lexem
	movq	%rax, -32(%rbp)
LBB13_3:                                ## =>This Inner Loop Header: Depth=1
	xorl	%eax, %eax
	movb	%al, %cl
	cmpq	$0, -32(%rbp)
	movb	%cl, -45(%rbp)          ## 1-byte Spill
	je	LBB13_5
## %bb.4:                               ##   in Loop: Header=BB13_3 Depth=1
	movq	-32(%rbp), %rax
	cmpl	$3, (%rax)
	sete	%cl
	movb	%cl, -45(%rbp)          ## 1-byte Spill
LBB13_5:                                ##   in Loop: Header=BB13_3 Depth=1
	movb	-45(%rbp), %al          ## 1-byte Reload
	testb	$1, %al
	jne	LBB13_6
	jmp	LBB13_11
LBB13_6:                                ##   in Loop: Header=BB13_3 Depth=1
	movq	-32(%rbp), %rax
	movl	4(%rax), %ecx
	movl	%ecx, %edx
	subl	$22, %edx
	movl	%ecx, -52(%rbp)         ## 4-byte Spill
	movl	%edx, -56(%rbp)         ## 4-byte Spill
	je	LBB13_7
	jmp	LBB13_13
LBB13_13:                               ##   in Loop: Header=BB13_3 Depth=1
	movl	-52(%rbp), %eax         ## 4-byte Reload
	subl	$23, %eax
	movl	%eax, -60(%rbp)         ## 4-byte Spill
	je	LBB13_8
	jmp	LBB13_9
LBB13_7:                                ##   in Loop: Header=BB13_3 Depth=1
	movl	$22, -44(%rbp)
	jmp	LBB13_10
LBB13_8:                                ##   in Loop: Header=BB13_3 Depth=1
	movl	$23, -44(%rbp)
	jmp	LBB13_10
LBB13_9:
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB13_12
LBB13_10:                               ##   in Loop: Header=BB13_3 Depth=1
	movq	-16(%rbp), %rdi
	callq	_extract_lexem
	movq	-16(%rbp), %rdi
	movq	%rax, -72(%rbp)         ## 8-byte Spill
	callq	_parse_multdiv
	movq	%rax, -40(%rbp)
	movl	-44(%rbp), %edi
	movq	-24(%rbp), %rcx
	movq	-40(%rbp), %r8
	movl	$2, %edx
	movl	%edx, %esi
	movb	$0, %al
	callq	_astnode_new
	movq	%rax, -24(%rbp)
	movq	-16(%rbp), %rdi
	callq	_preview_lexem
	movq	%rax, -32(%rbp)
	jmp	LBB13_3
LBB13_11:
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
LBB13_12:
	movq	-8(%rbp), %rax
	addq	$80, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_parse_multdiv          ## -- Begin function parse_multdiv
	.p2align	4, 0x90
_parse_multdiv:                         ## @parse_multdiv
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
	callq	_parse_unaryprefix
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	LBB14_2
## %bb.1:
	movq	$0, -8(%rbp)
	jmp	LBB14_12
LBB14_2:
	movq	-16(%rbp), %rdi
	callq	_preview_lexem
	movq	%rax, -32(%rbp)
LBB14_3:                                ## =>This Inner Loop Header: Depth=1
	xorl	%eax, %eax
	movb	%al, %cl
	cmpq	$0, -32(%rbp)
	movb	%cl, -45(%rbp)          ## 1-byte Spill
	je	LBB14_5
## %bb.4:                               ##   in Loop: Header=BB14_3 Depth=1
	movq	-32(%rbp), %rax
	cmpl	$3, (%rax)
	sete	%cl
	movb	%cl, -45(%rbp)          ## 1-byte Spill
LBB14_5:                                ##   in Loop: Header=BB14_3 Depth=1
	movb	-45(%rbp), %al          ## 1-byte Reload
	testb	$1, %al
	jne	LBB14_6
	jmp	LBB14_11
LBB14_6:                                ##   in Loop: Header=BB14_3 Depth=1
	movq	-32(%rbp), %rax
	movl	4(%rax), %ecx
	movl	%ecx, %edx
	subl	$24, %edx
	movl	%ecx, -52(%rbp)         ## 4-byte Spill
	movl	%edx, -56(%rbp)         ## 4-byte Spill
	je	LBB14_7
	jmp	LBB14_13
LBB14_13:                               ##   in Loop: Header=BB14_3 Depth=1
	movl	-52(%rbp), %eax         ## 4-byte Reload
	subl	$25, %eax
	movl	%eax, -60(%rbp)         ## 4-byte Spill
	je	LBB14_8
	jmp	LBB14_9
LBB14_7:                                ##   in Loop: Header=BB14_3 Depth=1
	movl	$24, -44(%rbp)
	jmp	LBB14_10
LBB14_8:                                ##   in Loop: Header=BB14_3 Depth=1
	movl	$25, -44(%rbp)
	jmp	LBB14_10
LBB14_9:
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB14_12
LBB14_10:                               ##   in Loop: Header=BB14_3 Depth=1
	movq	-16(%rbp), %rdi
	callq	_extract_lexem
	movq	-16(%rbp), %rdi
	movq	%rax, -72(%rbp)         ## 8-byte Spill
	callq	_parse_unaryprefix
	movq	%rax, -40(%rbp)
	movl	-44(%rbp), %edi
	movq	-24(%rbp), %rcx
	movq	-40(%rbp), %r8
	movl	$2, %edx
	movl	%edx, %esi
	movb	$0, %al
	callq	_astnode_new
	movq	%rax, -24(%rbp)
	movq	-16(%rbp), %rdi
	callq	_preview_lexem
	movq	%rax, -32(%rbp)
	jmp	LBB14_3
LBB14_11:
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
LBB14_12:
	movq	-8(%rbp), %rax
	addq	$80, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_parse_unaryprefix      ## -- Begin function parse_unaryprefix
	.p2align	4, 0x90
_parse_unaryprefix:                     ## @parse_unaryprefix
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$128, %rsp
	movq	%rdi, -16(%rbp)
	movq	-16(%rbp), %rdi
	callq	_preview_lexem
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	LBB15_2
## %bb.1:
	movq	$0, -8(%rbp)
	jmp	LBB15_16
LBB15_2:
	movq	-24(%rbp), %rax
	cmpl	$3, (%rax)
	jne	LBB15_15
## %bb.3:
	movq	-24(%rbp), %rax
	movl	4(%rax), %ecx
	movl	%ecx, %edx
	subl	$2, %edx
	movl	%ecx, -76(%rbp)         ## 4-byte Spill
	movl	%edx, -80(%rbp)         ## 4-byte Spill
	je	LBB15_8
	jmp	LBB15_17
LBB15_17:
	movl	-76(%rbp), %eax         ## 4-byte Reload
	subl	$23, %eax
	movl	%eax, -84(%rbp)         ## 4-byte Spill
	je	LBB15_6
	jmp	LBB15_18
LBB15_18:
	movl	-76(%rbp), %eax         ## 4-byte Reload
	subl	$28, %eax
	movl	%eax, -88(%rbp)         ## 4-byte Spill
	jne	LBB15_14
	jmp	LBB15_4
LBB15_4:
	jmp	LBB15_5
LBB15_5:
	movq	-16(%rbp), %rdi
	callq	_extract_lexem
	movq	-16(%rbp), %rdi
	movq	%rax, -96(%rbp)         ## 8-byte Spill
	callq	_parse_postfix
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rcx
	movl	$16, %edi
	movl	$1, %edx
	movl	%edx, %esi
	movb	$0, %al
	callq	_astnode_new
	movq	%rax, -8(%rbp)
	jmp	LBB15_16
LBB15_6:
	jmp	LBB15_7
LBB15_7:
	movq	-16(%rbp), %rdi
	callq	_extract_lexem
	movq	-16(%rbp), %rdi
	movq	%rax, -104(%rbp)        ## 8-byte Spill
	callq	_parse_postfix
	xorl	%ecx, %ecx
	movq	%rax, -40(%rbp)
	movl	$26, %edi
	movl	%ecx, %esi
	movl	%ecx, %edx
	movb	$0, %al
	callq	_astnode_new
	movl	$8, %ecx
	movl	%ecx, %edi
	movq	%rax, -48(%rbp)
	callq	_malloc
	movq	-48(%rbp), %rdi
	movq	%rax, 32(%rdi)
	movq	-48(%rbp), %rax
	movq	32(%rax), %rax
	xorps	%xmm0, %xmm0
	movsd	%xmm0, (%rax)
	movq	-48(%rbp), %rcx
	movq	-40(%rbp), %r8
	movl	$23, %edi
	movl	$2, %edx
	movl	%edx, %esi
	movb	$0, %al
	callq	_astnode_new
	movq	%rax, -8(%rbp)
	jmp	LBB15_16
LBB15_8:
	movq	-16(%rbp), %rdi
	callq	_extract_lexem
	movq	-16(%rbp), %rdi
	movq	%rax, -112(%rbp)        ## 8-byte Spill
	callq	_parse_postfix
	xorl	%ecx, %ecx
	movq	%rax, -56(%rbp)
	movl	$29, %edi
	movl	%ecx, %esi
	movl	%ecx, %edx
	movb	$0, %al
	callq	_astnode_new
	movq	%rax, -64(%rbp)
	leaq	L_.str.13(%rip), %rdi
	callq	_strdup
	movq	-64(%rbp), %rdi
	movq	%rax, 32(%rdi)
	movq	-56(%rbp), %rax
	cmpl	$0, (%rax)
	je	LBB15_10
## %bb.9:
	movq	-56(%rbp), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rax
	movq	%rax, -120(%rbp)        ## 8-byte Spill
	jmp	LBB15_11
LBB15_10:
	movq	-56(%rbp), %rax
	movq	%rax, -120(%rbp)        ## 8-byte Spill
LBB15_11:
	movq	-120(%rbp), %rax        ## 8-byte Reload
	movq	%rax, -72(%rbp)
	movq	-72(%rbp), %rax
	movl	$27, 8(%rax)
	movq	-56(%rbp), %rax
	cmpl	$0, (%rax)
	jne	LBB15_13
## %bb.12:
	xorl	%edi, %edi
	movq	-64(%rbp), %rcx
	movq	-56(%rbp), %r8
	movl	$2, %eax
	movl	%eax, %esi
	movl	%eax, %edx
	movb	$0, %al
	callq	_astnode_new
	movq	%rax, -8(%rbp)
	jmp	LBB15_16
LBB15_13:
	xorl	%edi, %edi
	movq	-64(%rbp), %rcx
	movq	-72(%rbp), %r8
	movl	$2, %eax
	movl	%eax, %esi
	movl	%eax, %edx
	movb	$0, %al
	callq	_astnode_new
	movq	-56(%rbp), %rcx
	movq	16(%rcx), %rcx
	movq	%rax, (%rcx)
	movq	-56(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB15_16
LBB15_14:
	movq	-16(%rbp), %rdi
	callq	_parse_postfix
	movq	%rax, -8(%rbp)
	jmp	LBB15_16
LBB15_15:
	movq	-16(%rbp), %rdi
	callq	_parse_postfix
	movq	%rax, -8(%rbp)
LBB15_16:
	movq	-8(%rbp), %rax
	addq	$128, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_parse_postfix          ## -- Begin function parse_postfix
	.p2align	4, 0x90
_parse_postfix:                         ## @parse_postfix
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$192, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	callq	_parse_toplevel
	movq	%rax, -16(%rbp)
	movq	-8(%rbp), %rdi
	callq	_preview_lexem
	movq	%rax, -24(%rbp)
LBB16_1:                                ## =>This Inner Loop Header: Depth=1
	xorl	%eax, %eax
	movb	%al, %cl
	cmpq	$0, -24(%rbp)
	movb	%cl, -97(%rbp)          ## 1-byte Spill
	je	LBB16_8
## %bb.2:                               ##   in Loop: Header=BB16_1 Depth=1
	xorl	%eax, %eax
	movb	%al, %cl
	movq	-24(%rbp), %rdx
	cmpl	$3, (%rdx)
	movb	%cl, -97(%rbp)          ## 1-byte Spill
	jne	LBB16_8
## %bb.3:                               ##   in Loop: Header=BB16_1 Depth=1
	movq	-24(%rbp), %rax
	cmpl	$3, 4(%rax)
	movb	$1, %cl
	movb	%cl, -98(%rbp)          ## 1-byte Spill
	je	LBB16_7
## %bb.4:                               ##   in Loop: Header=BB16_1 Depth=1
	movq	-24(%rbp), %rax
	cmpl	$7, 4(%rax)
	movb	$1, %cl
	movb	%cl, -98(%rbp)          ## 1-byte Spill
	je	LBB16_7
## %bb.5:                               ##   in Loop: Header=BB16_1 Depth=1
	movq	-24(%rbp), %rax
	cmpl	$2, 4(%rax)
	movb	$1, %cl
	movb	%cl, -98(%rbp)          ## 1-byte Spill
	je	LBB16_7
## %bb.6:                               ##   in Loop: Header=BB16_1 Depth=1
	movq	-24(%rbp), %rax
	cmpl	$5, 4(%rax)
	sete	%cl
	movb	%cl, -98(%rbp)          ## 1-byte Spill
LBB16_7:                                ##   in Loop: Header=BB16_1 Depth=1
	movb	-98(%rbp), %al          ## 1-byte Reload
	movb	%al, -97(%rbp)          ## 1-byte Spill
LBB16_8:                                ##   in Loop: Header=BB16_1 Depth=1
	movb	-97(%rbp), %al          ## 1-byte Reload
	testb	$1, %al
	jne	LBB16_9
	jmp	LBB16_38
LBB16_9:                                ##   in Loop: Header=BB16_1 Depth=1
	movq	-24(%rbp), %rax
	movl	4(%rax), %ecx
	addl	$-2, %ecx
	movl	%ecx, %eax
	subl	$5, %ecx
	movq	%rax, -112(%rbp)        ## 8-byte Spill
	movl	%ecx, -116(%rbp)        ## 4-byte Spill
	ja	LBB16_36
## %bb.39:                              ##   in Loop: Header=BB16_1 Depth=1
	leaq	LJTI16_0(%rip), %rax
	movq	-112(%rbp), %rcx        ## 8-byte Reload
	movslq	(%rax,%rcx,4), %rdx
	addq	%rax, %rdx
	jmpq	*%rdx
LBB16_10:                               ##   in Loop: Header=BB16_1 Depth=1
	jmp	LBB16_11
LBB16_11:                               ##   in Loop: Header=BB16_1 Depth=1
	movq	-8(%rbp), %rdi
	callq	_extract_lexem
	movq	-8(%rbp), %rdi
	movq	%rax, -128(%rbp)        ## 8-byte Spill
	callq	_preview_lexem
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	je	LBB16_15
## %bb.12:                              ##   in Loop: Header=BB16_1 Depth=1
	movq	-32(%rbp), %rax
	cmpl	$3, (%rax)
	jne	LBB16_14
## %bb.13:                              ##   in Loop: Header=BB16_1 Depth=1
	movq	-32(%rbp), %rax
	cmpl	$4, 4(%rax)
	je	LBB16_15
LBB16_14:                               ##   in Loop: Header=BB16_1 Depth=1
	movq	-8(%rbp), %rdi
	movl	$4, %esi
	callq	_parse_subexpr
	movq	%rax, -40(%rbp)
	jmp	LBB16_16
LBB16_15:                               ##   in Loop: Header=BB16_1 Depth=1
	xorl	%eax, %eax
	movl	$33, %edi
	movl	%eax, %esi
	movl	%eax, %edx
	movb	$0, %al
	callq	_astnode_new
	movq	%rax, -40(%rbp)
	movq	-8(%rbp), %rdi
	callq	_extract_lexem
	movq	%rax, -136(%rbp)        ## 8-byte Spill
LBB16_16:                               ##   in Loop: Header=BB16_1 Depth=1
	movq	-16(%rbp), %rcx
	movq	-40(%rbp), %r8
	movl	$17, %edi
	movl	$2, %eax
	movl	%eax, %esi
	movl	%eax, %edx
	movb	$0, %al
	callq	_astnode_new
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rdi
	movq	-24(%rbp), %rsi
	callq	_bind_to_lexem
## %bb.17:                              ##   in Loop: Header=BB16_1 Depth=1
	jmp	LBB16_37
LBB16_18:                               ##   in Loop: Header=BB16_1 Depth=1
	jmp	LBB16_19
LBB16_19:                               ##   in Loop: Header=BB16_1 Depth=1
	movq	-8(%rbp), %rdi
	callq	_extract_lexem
	movq	-8(%rbp), %rdi
	movl	$8, %esi
	movq	%rax, -144(%rbp)        ## 8-byte Spill
	callq	_parse_subexpr
	xorl	%edi, %edi
	movq	%rax, -48(%rbp)
	movq	-16(%rbp), %rcx
	movq	-48(%rbp), %r8
	movl	$2, %esi
	movl	%esi, -148(%rbp)        ## 4-byte Spill
	movl	-148(%rbp), %edx        ## 4-byte Reload
	movb	$0, %al
	callq	_astnode_new
	movq	%rax, -16(%rbp)
## %bb.20:                              ##   in Loop: Header=BB16_1 Depth=1
	jmp	LBB16_37
LBB16_21:                               ##   in Loop: Header=BB16_1 Depth=1
	movq	-8(%rbp), %rdi
	callq	_extract_lexem
	movq	-8(%rbp), %rdi
	movq	%rax, -160(%rbp)        ## 8-byte Spill
	callq	_parse_toplevel
	movq	%rax, -56(%rbp)
	cmpq	$0, -56(%rbp)
	je	LBB16_23
## %bb.22:                              ##   in Loop: Header=BB16_1 Depth=1
	movq	-56(%rbp), %rax
	cmpl	$29, 8(%rax)
	je	LBB16_24
LBB16_23:                               ##   in Loop: Header=BB16_1 Depth=1
	movq	-8(%rbp), %rdi
	leaq	L_.str.14(%rip), %rsi
	movb	$0, %al
	callq	_parse_error
LBB16_24:                               ##   in Loop: Header=BB16_1 Depth=1
	xorl	%edi, %edi
	movq	-56(%rbp), %rax
	movl	$27, 8(%rax)
	movq	-16(%rbp), %rcx
	movq	-56(%rbp), %r8
	movl	$2, %edx
	movl	%edx, %esi
	movb	$0, %al
	callq	_astnode_new
	movq	%rax, -16(%rbp)
	jmp	LBB16_37
LBB16_25:                               ##   in Loop: Header=BB16_1 Depth=1
	movq	-8(%rbp), %rdi
	callq	_extract_lexem
	movq	-8(%rbp), %rdi
	movq	%rax, -168(%rbp)        ## 8-byte Spill
	callq	_preview_lexem
	movq	%rax, -64(%rbp)
	movq	-64(%rbp), %rax
	cmpl	$3, (%rax)
	jne	LBB16_34
## %bb.26:                              ##   in Loop: Header=BB16_1 Depth=1
	movq	-64(%rbp), %rax
	cmpl	$1, 4(%rax)
	jne	LBB16_34
## %bb.27:                              ##   in Loop: Header=BB16_1 Depth=1
	movq	-8(%rbp), %rdi
	callq	_extract_lexem
	movq	-8(%rbp), %rdi
	movq	%rax, -176(%rbp)        ## 8-byte Spill
	callq	_parse_compound
	movq	%rax, -72(%rbp)
	cmpq	$0, -72(%rbp)
	jne	LBB16_29
## %bb.28:                              ##   in Loop: Header=BB16_1 Depth=1
	movq	-8(%rbp), %rdi
	leaq	L_.str.15(%rip), %rsi
	movb	$0, %al
	callq	_parse_error
	movq	$0, -16(%rbp)
LBB16_29:                               ##   in Loop: Header=BB16_1 Depth=1
	movq	-8(%rbp), %rdi
	callq	_preview_lexem
	movq	%rax, -64(%rbp)
	movq	-64(%rbp), %rax
	cmpl	$3, (%rax)
	jne	LBB16_32
## %bb.30:                              ##   in Loop: Header=BB16_1 Depth=1
	movq	-64(%rbp), %rax
	cmpl	$6, 4(%rax)
	jne	LBB16_32
## %bb.31:                              ##   in Loop: Header=BB16_1 Depth=1
	movq	-8(%rbp), %rdi
	callq	_extract_lexem
	xorl	%ecx, %ecx
	movl	$33, %edi
	movl	%ecx, %esi
	movl	%ecx, %edx
	movq	%rax, -184(%rbp)        ## 8-byte Spill
	movb	$0, %al
	callq	_astnode_new
	movq	-72(%rbp), %r8
	movl	$19, %edi
	movl	$2, %ecx
	movl	%ecx, %esi
	movl	%ecx, %edx
	movq	%rax, %rcx
	movb	$0, %al
	callq	_astnode_new
	movq	%rax, -80(%rbp)
	leaq	L_.str.16(%rip), %rdi
	callq	_strdup
	movq	-80(%rbp), %rcx
	movq	%rax, 32(%rcx)
	movq	-16(%rbp), %rcx
	movq	-80(%rbp), %r8
	movl	$17, %edi
	movl	$2, %edx
	movl	%edx, %esi
	movb	$0, %al
	callq	_astnode_new
	movq	%rax, -16(%rbp)
	jmp	LBB16_33
LBB16_32:                               ##   in Loop: Header=BB16_1 Depth=1
	movq	$0, -16(%rbp)
LBB16_33:                               ##   in Loop: Header=BB16_1 Depth=1
	jmp	LBB16_35
LBB16_34:                               ##   in Loop: Header=BB16_1 Depth=1
	movq	-8(%rbp), %rdi
	callq	_parse_statement
	movq	%rax, -88(%rbp)
	movq	-8(%rbp), %rdi
	callq	_extract_lexem
	movq	-88(%rbp), %rcx
	movl	$38, %edi
	movl	$1, %edx
	movl	%edx, %esi
	movq	%rax, -192(%rbp)        ## 8-byte Spill
	movb	$0, %al
	callq	_astnode_new
	movq	%rax, -96(%rbp)
	movq	-16(%rbp), %rcx
	movq	-96(%rbp), %r8
	movl	$17, %edi
	movl	$2, %edx
	movl	%edx, %esi
	movb	$0, %al
	callq	_astnode_new
	movq	%rax, -16(%rbp)
LBB16_35:                               ##   in Loop: Header=BB16_1 Depth=1
	jmp	LBB16_37
LBB16_36:                               ##   in Loop: Header=BB16_1 Depth=1
	jmp	LBB16_37
LBB16_37:                               ##   in Loop: Header=BB16_1 Depth=1
	movq	-8(%rbp), %rdi
	callq	_preview_lexem
	movq	%rax, -24(%rbp)
	jmp	LBB16_1
LBB16_38:
	movq	-16(%rbp), %rax
	addq	$192, %rsp
	popq	%rbp
	retq
	.cfi_endproc
	.p2align	2, 0x90
	.data_region jt32
.set L16_0_set_21, LBB16_21-LJTI16_0
.set L16_0_set_10, LBB16_10-LJTI16_0
.set L16_0_set_36, LBB16_36-LJTI16_0
.set L16_0_set_25, LBB16_25-LJTI16_0
.set L16_0_set_18, LBB16_18-LJTI16_0
LJTI16_0:
	.long	L16_0_set_21
	.long	L16_0_set_10
	.long	L16_0_set_36
	.long	L16_0_set_25
	.long	L16_0_set_36
	.long	L16_0_set_18
	.end_data_region
                                        ## -- End function
	.globl	_parse_subexpr          ## -- Begin function parse_subexpr
	.p2align	4, 0x90
_parse_subexpr:                         ## @parse_subexpr
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movq	%rdi, -16(%rbp)
	movl	%esi, -20(%rbp)
	movq	-16(%rbp), %rdi
	callq	_parse_expression
	movq	%rax, -32(%rbp)
	movq	-16(%rbp), %rdi
	callq	_preview_lexem
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	je	LBB17_4
## %bb.1:
	movq	-40(%rbp), %rax
	cmpl	$3, (%rax)
	jne	LBB17_4
## %bb.2:
	movq	-40(%rbp), %rax
	movl	4(%rax), %ecx
	cmpl	-20(%rbp), %ecx
	jne	LBB17_4
## %bb.3:
	movq	-16(%rbp), %rdi
	callq	_extract_lexem
	movq	-32(%rbp), %rdi
	movq	%rdi, -8(%rbp)
	movq	%rax, -48(%rbp)         ## 8-byte Spill
	jmp	LBB17_5
LBB17_4:
	movq	-16(%rbp), %rdi
	leaq	L_.str.17(%rip), %rsi
	movb	$0, %al
	callq	_parse_error
	movq	$0, -8(%rbp)
LBB17_5:
	movq	-8(%rbp), %rax
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_parse_lrvalue          ## -- Begin function parse_lrvalue
	.p2align	4, 0x90
_parse_lrvalue:                         ## @parse_lrvalue
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$128, %rsp
	movq	%rdi, -16(%rbp)
	movq	-16(%rbp), %rdi
	callq	_preview_lexem
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	je	LBB18_27
## %bb.1:
	movq	-24(%rbp), %rax
	cmpl	$3, (%rax)
	jne	LBB18_27
## %bb.2:
	movq	-24(%rbp), %rax
	cmpl	$34, 4(%rax)
	jne	LBB18_27
## %bb.3:
	movq	-16(%rbp), %rdi
	callq	_extract_lexem
	xorl	%edx, %edx
	movl	$19, %edi
	movl	$2, %esi
	movq	%rax, -96(%rbp)         ## 8-byte Spill
	movb	$0, %al
	callq	_astnode_new
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rdi
	movq	-24(%rbp), %rsi
	callq	_bind_to_lexem
	movq	-16(%rbp), %rdi
	callq	_preview_lexem
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	jne	LBB18_5
## %bb.4:
	movq	-40(%rbp), %rdi
	leaq	L_.str.20(%rip), %rsi
	movb	$0, %al
	callq	_parse_error_at
	movq	$0, -8(%rbp)
	jmp	LBB18_43
LBB18_5:
	movq	-40(%rbp), %rax
	cmpl	$0, (%rax)
	jne	LBB18_7
## %bb.6:
	movq	-40(%rbp), %rax
	movq	8(%rax), %rdi
	callq	_strdup
	movq	-32(%rbp), %rdi
	movq	%rax, 32(%rdi)
	movq	-16(%rbp), %rdi
	callq	_extract_lexem
	movq	%rax, -104(%rbp)        ## 8-byte Spill
	jmp	LBB18_8
LBB18_7:
	leaq	L_.str.16(%rip), %rdi
	callq	_strdup
	movq	-32(%rbp), %rdi
	movq	%rax, 32(%rdi)
LBB18_8:
	movq	-16(%rbp), %rdi
	callq	_extract_lexem
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	jne	LBB18_10
## %bb.9:
	movq	-40(%rbp), %rdi
	leaq	L_.str.21(%rip), %rsi
	movb	$0, %al
	callq	_parse_error_at
	movq	$0, -8(%rbp)
	jmp	LBB18_43
LBB18_10:
	movq	-40(%rbp), %rax
	cmpl	$3, (%rax)
	jne	LBB18_12
## %bb.11:
	movq	-40(%rbp), %rax
	cmpl	$3, 4(%rax)
	je	LBB18_13
LBB18_12:
	movq	-40(%rbp), %rdi
	leaq	L_.str.21(%rip), %rsi
	movb	$0, %al
	callq	_parse_error_at
	movq	$0, -8(%rbp)
	jmp	LBB18_43
LBB18_13:
	movq	-16(%rbp), %rdi
	callq	_preview_lexem
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	jne	LBB18_15
## %bb.14:
	movq	-40(%rbp), %rdi
	leaq	L_.str.22(%rip), %rsi
	movb	$0, %al
	callq	_parse_error_at
	movq	$0, -8(%rbp)
	jmp	LBB18_43
LBB18_15:
	movq	-40(%rbp), %rax
	cmpl	$3, (%rax)
	jne	LBB18_17
## %bb.16:
	movq	-40(%rbp), %rax
	cmpl	$4, 4(%rax)
	je	LBB18_18
LBB18_17:
	movq	-16(%rbp), %rdi
	callq	_parse_expression
	movq	%rax, -48(%rbp)
	jmp	LBB18_19
LBB18_18:
	xorl	%eax, %eax
	movl	$33, %edi
	movl	%eax, %esi
	movl	%eax, %edx
	movb	$0, %al
	callq	_astnode_new
	movq	%rax, -48(%rbp)
LBB18_19:
	movq	-16(%rbp), %rdi
	callq	_extract_lexem
	movq	-16(%rbp), %rdi
	movq	%rax, -112(%rbp)        ## 8-byte Spill
	callq	_extract_lexem
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	jne	LBB18_21
## %bb.20:
	movq	-40(%rbp), %rdi
	leaq	L_.str.23(%rip), %rsi
	movb	$0, %al
	callq	_parse_error_at
	movq	$0, -8(%rbp)
	jmp	LBB18_43
LBB18_21:
	movq	-40(%rbp), %rax
	cmpl	$3, (%rax)
	jne	LBB18_23
## %bb.22:
	movq	-40(%rbp), %rax
	cmpl	$43, 4(%rax)
	jne	LBB18_24
LBB18_23:
	movq	-40(%rbp), %rdi
	leaq	L_.str.24(%rip), %rsi
	movb	$0, %al
	callq	_parse_error_at
	movq	$0, -8(%rbp)
	jmp	LBB18_43
LBB18_24:
	movq	-16(%rbp), %rdi
	callq	_parse_compound
	movq	%rax, -56(%rbp)
	cmpq	$0, -56(%rbp)
	jne	LBB18_26
## %bb.25:
	movq	$0, -8(%rbp)
	jmp	LBB18_43
LBB18_26:
	movq	-32(%rbp), %rdi
	movq	-48(%rbp), %rsi
	callq	_astnode_add_child
	movq	-32(%rbp), %rdi
	movq	-56(%rbp), %rsi
	callq	_astnode_add_child
	movq	-32(%rbp), %rsi
	movq	%rsi, -8(%rbp)
	jmp	LBB18_43
LBB18_27:
	movq	-16(%rbp), %rdi
	callq	_parse_logical_or
	movq	%rax, -64(%rbp)
	cmpq	$0, -64(%rbp)
	jne	LBB18_29
## %bb.28:
	movq	$0, -8(%rbp)
	jmp	LBB18_43
LBB18_29:
	movq	-16(%rbp), %rdi
	callq	_preview_lexem
	movq	%rax, -72(%rbp)
	cmpq	$0, -72(%rbp)
	jne	LBB18_31
## %bb.30:
	movq	-64(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB18_43
LBB18_31:
	movq	-72(%rbp), %rax
	cmpl	$3, (%rax)
	jne	LBB18_33
## %bb.32:
	movq	-72(%rbp), %rax
	cmpl	$9, 4(%rax)
	je	LBB18_34
LBB18_33:
	movq	-64(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB18_43
LBB18_34:
	movq	-64(%rbp), %rcx
	movl	$7, %edi
	movl	$4, %esi
	movl	$1, %edx
	movb	$0, %al
	callq	_astnode_new
	movq	%rax, -80(%rbp)
LBB18_35:                               ## =>This Inner Loop Header: Depth=1
	movq	-16(%rbp), %rdi
	callq	_extract_lexem
	movq	-16(%rbp), %rdi
	movq	%rax, -120(%rbp)        ## 8-byte Spill
	callq	_parse_logical_or
	movq	%rax, -88(%rbp)
	cmpq	$0, -88(%rbp)
	jne	LBB18_37
## %bb.36:
	movq	$0, -8(%rbp)
	jmp	LBB18_43
LBB18_37:                               ##   in Loop: Header=BB18_35 Depth=1
	movq	-80(%rbp), %rdi
	movq	-88(%rbp), %rsi
	callq	_astnode_add_child
	movq	-16(%rbp), %rdi
	callq	_preview_lexem
	movq	%rax, -72(%rbp)
## %bb.38:                              ##   in Loop: Header=BB18_35 Depth=1
	xorl	%eax, %eax
	movb	%al, %cl
	cmpq	$0, -72(%rbp)
	movb	%cl, -121(%rbp)         ## 1-byte Spill
	je	LBB18_41
## %bb.39:                              ##   in Loop: Header=BB18_35 Depth=1
	xorl	%eax, %eax
	movb	%al, %cl
	movq	-72(%rbp), %rdx
	cmpl	$3, (%rdx)
	movb	%cl, -121(%rbp)         ## 1-byte Spill
	jne	LBB18_41
## %bb.40:                              ##   in Loop: Header=BB18_35 Depth=1
	movq	-72(%rbp), %rax
	cmpl	$9, 4(%rax)
	sete	%cl
	movb	%cl, -121(%rbp)         ## 1-byte Spill
LBB18_41:                               ##   in Loop: Header=BB18_35 Depth=1
	movb	-121(%rbp), %al         ## 1-byte Reload
	testb	$1, %al
	jne	LBB18_35
## %bb.42:
	movq	-80(%rbp), %rax
	movq	%rax, -8(%rbp)
LBB18_43:
	movq	-8(%rbp), %rax
	addq	$128, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"Error at %d:%d: %s\n"

L_.str.1:                               ## @.str.1
	.asciz	"Error at %s:%d:%d\n"

L_.str.2:                               ## @.str.2
	.asciz	"%s\n"

L_.str.3:                               ## @.str.3
	.asciz	" "

L_.str.4:                               ## @.str.4
	.asciz	"^\n"

L_.str.5:                               ## @.str.5
	.asciz	"+----%s\n"

L_.str.6:                               ## @.str.6
	.asciz	"Error beyond of file: %s\n"

L_.str.7:                               ## @.str.7
	.asciz	"Error parsing statement started here"

L_.str.8:                               ## @.str.8
	.asciz	"expected end of line but token found"

L_.str.9:                               ## @.str.9
	.asciz	"expected in statement in for"

L_.str.10:                              ## @.str.10
	.asciz	"expected object body"

L_.str.11:                              ## @.str.11
	.asciz	"unxpected token after expression"

L_.str.12:                              ## @.str.12
	.asciz	"compound is required"

L_.str.13:                              ## @.str.13
	.asciz	"this"

L_.str.14:                              ## @.str.14
	.asciz	"cannot dot-subscript not to an identifier"

L_.str.15:                              ## @.str.15
	.asciz	"error at inline func declaration"

L_.str.16:                              ## @.str.16
	.asciz	"lambda"

L_.str.17:                              ## @.str.17
	.asciz	"Unclosed sub-expression"

L_.str.18:                              ## @.str.18
	.asciz	"lexem expected but eof found"

L_.str.19:                              ## @.str.19
	.asciz	"unexpected token"

L_.str.20:                              ## @.str.20
	.asciz	"expected either identifier or opening bracket ( at func decl but EOF found"

L_.str.21:                              ## @.str.21
	.asciz	"expected ( at func decl but another token found"

L_.str.22:                              ## @.str.22
	.asciz	"expected either argument or closing bracket ), but EOF encountered"

L_.str.23:                              ## @.str.23
	.asciz	"EOF encountered just after function declaration - functions with empty bodies not allowed"

L_.str.24:                              ## @.str.24
	.asciz	"After function declaration ident is expected, but another token found"

L_.str.25:                              ## @.str.25
	.asciz	"Unexpected text after expression"


.subsections_via_symbols
