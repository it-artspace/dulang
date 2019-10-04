	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 14	sdk_version 10, 14
	.globl	_f                      ## -- Begin function f
	.p2align	4, 0x90
_f:                                     ## @f
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-4(%rbp), %esi
	addl	-8(%rbp), %esi
	movl	%esi, %eax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_exec                   ## -- Begin function exec
	.p2align	4, 0x90
_exec:                                  ## @exec
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
	callq	_execute_command
	xorl	%eax, %eax
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_workloop               ## -- Begin function workloop
	.p2align	4, 0x90
_workloop:                              ## @workloop
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -16(%rbp)
LBB2_1:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB2_2 Depth 2
                                        ##     Child Loop BB2_7 Depth 2
	leaq	_workload_lock(%rip), %rdi
	callq	_pthread_mutex_lock
	movl	%eax, -20(%rbp)         ## 4-byte Spill
LBB2_2:                                 ##   Parent Loop BB2_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movq	_current_thread@TLVP(%rip), %rdi
	callq	*(%rdi)
	movq	(%rax), %rax
	movl	(%rax), %ecx
	cmpl	$0, %ecx
	setne	%dl
	xorb	$-1, %dl
	testb	$1, %dl
	jne	LBB2_3
	jmp	LBB2_6
LBB2_3:                                 ##   in Loop: Header=BB2_2 Depth=2
	movl	_final_context(%rip), %eax
	cmpl	$0, %eax
	je	LBB2_5
## %bb.4:
	xorl	%edi, %edi
	callq	_exit
LBB2_5:                                 ##   in Loop: Header=BB2_2 Depth=2
	leaq	_workload_cond(%rip), %rdi
	leaq	_workload_lock(%rip), %rsi
	callq	_pthread_cond_wait
	movl	%eax, -24(%rbp)         ## 4-byte Spill
	jmp	LBB2_2
LBB2_6:                                 ##   in Loop: Header=BB2_1 Depth=1
	jmp	LBB2_7
LBB2_7:                                 ##   Parent Loop BB2_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movq	_current_thread@TLVP(%rip), %rdi
	callq	*(%rdi)
	movq	(%rax), %rax
	movl	(%rax), %ecx
	cmpl	$0, %ecx
	je	LBB2_9
## %bb.8:                               ##   in Loop: Header=BB2_7 Depth=2
	callq	_exec_thread
	movl	%eax, -28(%rbp)         ## 4-byte Spill
	jmp	LBB2_7
LBB2_9:                                 ##   in Loop: Header=BB2_1 Depth=1
	leaq	_workload_lock(%rip), %rdi
	callq	_pthread_mutex_unlock
	movl	%eax, -32(%rbp)         ## 4-byte Spill
	jmp	LBB2_1
	.cfi_endproc
                                        ## -- End function
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$1200, %rsp             ## imm = 0x4B0
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movl	$0, -1108(%rbp)
	movl	%edi, -1112(%rbp)
	movq	%rsi, -1120(%rbp)
	callq	_init_mods
	leaq	-72(%rbp), %rdi
	callq	_pthread_attr_init
	xorl	%ecx, %ecx
                                        ## kill: def $rcx killed $ecx
	leaq	-1128(%rbp), %rdi
	leaq	-72(%rbp), %rsi
	leaq	_workloop(%rip), %rdx
	movl	%eax, -1136(%rbp)       ## 4-byte Spill
	callq	_pthread_create
	movl	%eax, -1140(%rbp)       ## 4-byte Spill
	callq	_setup_aa
	movq	___stdoutp@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rcx
	movq	%rcx, _output(%rip)
	callq	_clock
	cmpl	$1, -1112(%rbp)
	movq	%rax, -1152(%rbp)       ## 8-byte Spill
	jle	LBB3_8
## %bb.1:
	movb	$0, -1104(%rbp)
	movl	$1, -1132(%rbp)
LBB3_2:                                 ## =>This Inner Loop Header: Depth=1
	movl	-1132(%rbp), %eax
	cmpl	-1112(%rbp), %eax
	jge	LBB3_7
## %bb.3:                               ##   in Loop: Header=BB3_2 Depth=1
	leaq	-1104(%rbp), %rdi
	callq	_strlen
	cmpq	$0, %rax
	jbe	LBB3_5
## %bb.4:                               ##   in Loop: Header=BB3_2 Depth=1
	movl	$1024, %eax             ## imm = 0x400
	movl	%eax, %edx
	leaq	-1104(%rbp), %rdi
	leaq	L_.str(%rip), %rsi
	callq	___strcat_chk
	movq	%rax, -1160(%rbp)       ## 8-byte Spill
LBB3_5:                                 ##   in Loop: Header=BB3_2 Depth=1
	movl	$1024, %eax             ## imm = 0x400
	movl	%eax, %edx
	leaq	-1104(%rbp), %rdi
	movq	-1120(%rbp), %rcx
	movslq	-1132(%rbp), %rsi
	movq	(%rcx,%rsi,8), %rsi
	callq	___strcat_chk
	movq	%rax, -1168(%rbp)       ## 8-byte Spill
## %bb.6:                               ##   in Loop: Header=BB3_2 Depth=1
	movl	-1132(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -1132(%rbp)
	jmp	LBB3_2
LBB3_7:
	movl	$1024, %eax             ## imm = 0x400
	movl	%eax, %edx
	leaq	-1104(%rbp), %rdi
	leaq	L_.str.1(%rip), %rsi
	callq	___strcat_chk
	leaq	-1104(%rbp), %rdi
	movq	%rax, -1176(%rbp)       ## 8-byte Spill
	callq	_exec
	movl	%eax, -1180(%rbp)       ## 4-byte Spill
	jmp	LBB3_12
LBB3_8:
	jmp	LBB3_9
LBB3_9:                                 ## =>This Inner Loop Header: Depth=1
	movq	___stdinp@GOTPCREL(%rip), %rax
	leaq	-1104(%rbp), %rdi
	movq	(%rax), %rdx
	movl	$1024, %esi             ## imm = 0x400
	callq	_fgets
	cmpq	$0, %rax
	je	LBB3_11
## %bb.10:                              ##   in Loop: Header=BB3_9 Depth=1
	leaq	-1104(%rbp), %rdi
	callq	_exec
	movl	%eax, -1184(%rbp)       ## 4-byte Spill
	jmp	LBB3_9
LBB3_11:
	jmp	LBB3_12
LBB3_12:
	xorl	%eax, %eax
	movl	%eax, %esi
	movl	$1, _final_context(%rip)
	movq	-1128(%rbp), %rdi
	callq	_pthread_join
	movq	___stack_chk_guard@GOTPCREL(%rip), %rsi
	movq	(%rsi), %rsi
	movq	-8(%rbp), %rdi
	cmpq	%rdi, %rsi
	movl	%eax, -1188(%rbp)       ## 4-byte Spill
	jne	LBB3_14
## %bb.13:
	xorl	%eax, %eax
	addq	$1200, %rsp             ## imm = 0x4B0
	popq	%rbp
	retq
LBB3_14:
	callq	___stack_chk_fail
	ud2
	.cfi_endproc
                                        ## -- End function
	.globl	_output                 ## @output
.zerofill __DATA,__common,_output,8,3
	.globl	_alloc_log              ## @alloc_log
.zerofill __DATA,__common,_alloc_log,8,3
	.section	__DATA,__data
	.globl	_workload_lock          ## @workload_lock
	.p2align	3
_workload_lock:
	.quad	850045863               ## 0x32aaaba7
	.space	56

	.globl	_workload_cond          ## @workload_cond
	.p2align	3
_workload_cond:
	.quad	1018212795              ## 0x3cb0b1bb
	.space	40

	.globl	_final_context          ## @final_context
.zerofill __DATA,__common,_final_context,4,2
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	" "

L_.str.1:                               ## @.str.1
	.asciz	"\n"


.subsections_via_symbols
