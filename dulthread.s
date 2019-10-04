	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 14	sdk_version 10, 14
	.globl	_destroy_coro           ## -- Begin function destroy_coro
	.p2align	4, 0x90
_destroy_coro:                          ## @destroy_coro
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
	.globl	_exec_coro              ## -- Begin function exec_coro
	.p2align	4, 0x90
_exec_coro:                             ## @exec_coro
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
	movl	24(%rdi), %eax
	testl	%eax, %eax
	movl	%eax, -36(%rbp)         ## 4-byte Spill
	je	LBB1_7
	jmp	LBB1_10
LBB1_10:
	movl	-36(%rbp), %eax         ## 4-byte Reload
	subl	$2, %eax
	movl	%eax, -40(%rbp)         ## 4-byte Spill
	jne	LBB1_8
	jmp	LBB1_1
LBB1_1:
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rdi
	callq	_exec_context
	cmpl	$0, %eax
	je	LBB1_6
## %bb.2:
	movq	-24(%rbp), %rax
	movq	72(%rax), %rax
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	je	LBB1_4
## %bb.3:
	movq	-32(%rbp), %rax
	movq	-16(%rbp), %rcx
	movq	%rax, 16(%rcx)
	jmp	LBB1_5
LBB1_4:
	movq	-16(%rbp), %rax
	movl	$0, 24(%rax)
	movl	$0, -4(%rbp)
	jmp	LBB1_9
LBB1_5:
	jmp	LBB1_6
LBB1_6:
	movl	$2, -4(%rbp)
	jmp	LBB1_9
LBB1_7:
	movl	$0, -4(%rbp)
	jmp	LBB1_9
LBB1_8:
	movq	-16(%rbp), %rax
	movl	24(%rax), %ecx
	movl	%ecx, -4(%rbp)
LBB1_9:
	movl	-4(%rbp), %eax
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_start_coro             ## -- Begin function start_coro
	.p2align	4, 0x90
_start_coro:                            ## @start_coro
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$64, %rsp
	movl	$32, %eax
	movl	%eax, %ecx
	movq	%rdi, -16(%rbp)
	movq	%rsi, -24(%rbp)
	movq	%rcx, %rdi
	callq	_dulalloc
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	LBB2_2
## %bb.1:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	leaq	L_.str(%rip), %rsi
	xorl	%ecx, %ecx
	movb	%cl, %dl
	movb	%dl, %al
	callq	_fprintf
	movl	$1, %edi
	movl	%eax, -60(%rbp)         ## 4-byte Spill
	callq	_exit
LBB2_2:
	movq	-32(%rbp), %rax
	movq	$0, 16(%rax)
	movq	-32(%rbp), %rax
	movl	$2, 24(%rax)
	movq	-24(%rbp), %rdi
	movq	-32(%rbp), %rsi
	callq	_init_context
	movq	%rax, -40(%rbp)
	movq	-16(%rbp), %rax
	movl	(%rax), %ecx
	movl	%ecx, %edx
	addl	$1, %edx
	movl	%edx, (%rax)
	cmpl	$0, %ecx
	jne	LBB2_4
## %bb.3:
	movq	-32(%rbp), %rax
	movq	-16(%rbp), %rcx
	movq	%rax, 80(%rcx)
	movq	-32(%rbp), %rax
	movq	-32(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-32(%rbp), %rax
	movq	-32(%rbp), %rcx
	movq	%rax, 8(%rcx)
	movq	-32(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	LBB2_5
LBB2_4:
	movq	-16(%rbp), %rax
	movq	80(%rax), %rax
	movq	%rax, -48(%rbp)
	movq	-16(%rbp), %rax
	movq	80(%rax), %rax
	movq	(%rax), %rax
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rax
	movq	-32(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-48(%rbp), %rax
	movq	-32(%rbp), %rcx
	movq	%rax, 8(%rcx)
	movq	-32(%rbp), %rax
	movq	-48(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-32(%rbp), %rax
	movq	-56(%rbp), %rcx
	movq	%rax, 8(%rcx)
	movq	-32(%rbp), %rax
	movq	%rax, -8(%rbp)
LBB2_5:
	movq	-8(%rbp), %rax
	addq	$64, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_exec_thread            ## -- Begin function exec_thread
	.p2align	4, 0x90
_exec_thread:                           ## @exec_thread
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$64, %rsp
	movq	_current_thread@TLVP(%rip), %rdi
	callq	*(%rdi)
	movq	(%rax), %rax
	movq	80(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	cmpl	$1, 24(%rax)
	je	LBB3_7
## %bb.1:
	movq	-16(%rbp), %rdi
	callq	_exec_coro
	cmpl	$0, %eax
	jne	LBB3_6
## %bb.2:
	movq	_current_thread@TLVP(%rip), %rdi
	callq	*(%rdi)
	movq	(%rax), %rax
	movl	(%rax), %ecx
	testl	%ecx, %ecx
	movl	%ecx, -36(%rbp)         ## 4-byte Spill
	je	LBB3_3
	jmp	LBB3_9
LBB3_9:
	movl	-36(%rbp), %eax         ## 4-byte Reload
	subl	$1, %eax
	movl	%eax, -40(%rbp)         ## 4-byte Spill
	je	LBB3_4
	jmp	LBB3_5
LBB3_3:
	movl	$0, -4(%rbp)
	jmp	LBB3_8
LBB3_4:
	movq	_current_thread@TLVP(%rip), %rdi
	callq	*(%rdi)
	movq	(%rax), %rdi
	movq	80(%rdi), %rdi
	movq	%rax, -48(%rbp)         ## 8-byte Spill
	callq	_destroy_coro
	movq	-48(%rbp), %rax         ## 8-byte Reload
	movq	(%rax), %rdi
	movl	$0, (%rdi)
	movl	$0, -4(%rbp)
	jmp	LBB3_8
LBB3_5:
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -24(%rbp)
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	-24(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-24(%rbp), %rax
	movq	-32(%rbp), %rcx
	movq	%rax, 8(%rcx)
	movq	-16(%rbp), %rdi
	callq	_destroy_coro
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	_current_thread@TLVP(%rip), %rdi
	movq	%rax, -56(%rbp)         ## 8-byte Spill
	callq	*(%rdi)
	movq	(%rax), %rcx
	movq	-56(%rbp), %rdi         ## 8-byte Reload
	movq	%rdi, 80(%rcx)
	movq	(%rax), %rax
	movl	(%rax), %edx
	addl	$-1, %edx
	movl	%edx, (%rax)
	movl	%edx, -4(%rbp)
	jmp	LBB3_8
LBB3_6:
	jmp	LBB3_7
LBB3_7:
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	_current_thread@TLVP(%rip), %rdi
	movq	%rax, -64(%rbp)         ## 8-byte Spill
	callq	*(%rdi)
	movq	(%rax), %rdi
	movq	-64(%rbp), %rcx         ## 8-byte Reload
	movq	%rcx, 80(%rdi)
	movq	(%rax), %rax
	movl	(%rax), %edx
	movl	%edx, -4(%rbp)
LBB3_8:
	movl	-4(%rbp), %eax
	addq	$64, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.comm	_work_pool,88,4         ## @work_pool
	.section	__DATA,__data
	.globl	_less_loaded            ## @less_loaded
	.p2align	3
_less_loaded:
	.quad	_work_pool

	.section	__DATA,__thread_data,thread_local_regular
	.p2align	3               ## @current_thread
_current_thread$tlv$init:
	.quad	_work_pool

	.section	__DATA,__thread_vars,thread_local_variables
	.globl	_current_thread
_current_thread:
	.quad	__tlv_bootstrap
	.quad	0
	.quad	_current_thread$tlv$init

	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"Can't allocate new coro\n"


.subsections_via_symbols
