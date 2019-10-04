	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 14	sdk_version 10, 14
	.globl	_init_mods              ## -- Begin function init_mods
	.p2align	4, 0x90
_init_mods:                             ## @init_mods
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$80, %rsp
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	callq	_new_ob
	movq	%rax, _mods(%rip)
	movq	l___const.init_mods.modlist(%rip), %rax
	movq	%rax, -16(%rbp)
	movl	$0, -20(%rbp)
LBB0_1:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_3 Depth 2
                                        ##     Child Loop BB0_6 Depth 2
	movslq	-20(%rbp), %rax
	cmpq	$1, %rax
	jae	LBB0_11
## %bb.2:                               ##   in Loop: Header=BB0_1 Depth=1
	movslq	-20(%rbp), %rax
	movq	-16(%rbp,%rax,8), %rdi
	callq	_file_to_fo
	movq	%rax, -32(%rbp)
	movq	_current_thread@TLVP(%rip), %rdi
	callq	*(%rdi)
	movq	(%rax), %rdi
	movq	-32(%rbp), %rsi
	callq	_start_coro
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -48(%rbp)
LBB0_3:                                 ##   Parent Loop BB0_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movq	_current_thread@TLVP(%rip), %rdi
	callq	*(%rdi)
	movq	(%rax), %rax
	movl	(%rax), %ecx
	cmpl	$0, %ecx
	je	LBB0_5
## %bb.4:                               ##   in Loop: Header=BB0_3 Depth=2
	callq	_exec_thread
	movl	%eax, -72(%rbp)         ## 4-byte Spill
	jmp	LBB0_3
LBB0_5:                                 ##   in Loop: Header=BB0_1 Depth=1
	movslq	-20(%rbp), %rax
	movq	-16(%rbp,%rax,8), %rdi
	movl	$47, %esi
	callq	_strrchr
	addq	$1, %rax
	movq	%rax, %rdi
	callq	_strdup
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rdi
	leaq	L_.str.1(%rip), %rsi
	callq	_strtok
	movq	%rax, -56(%rbp)
	callq	_new_ob
	movq	%rax, -64(%rbp)
	movl	$0, -68(%rbp)
LBB0_6:                                 ##   Parent Loop BB0_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	-68(%rbp), %eax
	movq	-32(%rbp), %rcx
	cmpl	32(%rcx), %eax
	jge	LBB0_9
## %bb.7:                               ##   in Loop: Header=BB0_6 Depth=2
	movq	-64(%rbp), %rdi
	movq	-32(%rbp), %rax
	movq	16(%rax), %rax
	movslq	-68(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	movq	%rdi, -80(%rbp)         ## 8-byte Spill
	movq	%rax, %rdi
	callq	_strfromchar
	movq	-48(%rbp), %rcx
	movq	(%rcx), %rcx
	movslq	-68(%rbp), %rdi
	movq	(%rcx,%rdi,8), %rdx
	movq	-80(%rbp), %rdi         ## 8-byte Reload
	movq	%rax, %rsi
	callq	_ob_subscr_set
## %bb.8:                               ##   in Loop: Header=BB0_6 Depth=2
	movl	-68(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -68(%rbp)
	jmp	LBB0_6
LBB0_9:                                 ##   in Loop: Header=BB0_1 Depth=1
	movq	-56(%rbp), %rdi
	movq	-64(%rbp), %rsi
	callq	_add_module
## %bb.10:                              ##   in Loop: Header=BB0_1 Depth=1
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -20(%rbp)
	jmp	LBB0_1
LBB0_11:
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	-8(%rbp), %rcx
	cmpq	%rcx, %rax
	jne	LBB0_13
## %bb.12:
	addq	$80, %rsp
	popq	%rbp
	retq
LBB0_13:
	callq	___stack_chk_fail
	ud2
	.cfi_endproc
                                        ## -- End function
	.globl	_file_to_fo             ## -- Begin function file_to_fo
	.p2align	4, 0x90
_file_to_fo:                            ## @file_to_fo
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	movsbl	(%rdi), %eax
	cmpl	$47, %eax
	je	LBB1_2
## %bb.1:
	movq	_build_dir(%rip), %rdi
	callq	_strlen
	movq	-8(%rbp), %rdi
	movq	%rax, -40(%rbp)         ## 8-byte Spill
	callq	_strlen
	movq	-40(%rbp), %rdi         ## 8-byte Reload
	addq	%rax, %rdi
	addq	$2, %rdi
	callq	_malloc
	xorl	%esi, %esi
	movq	$-1, %rdx
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rdi
	movq	_build_dir(%rip), %r8
	movq	-8(%rbp), %r9
	leaq	L_.str.6(%rip), %rcx
	movb	$0, %al
	callq	___sprintf_chk
	movq	-16(%rbp), %rcx
	movq	%rcx, -8(%rbp)
	movl	%eax, -44(%rbp)         ## 4-byte Spill
	jmp	LBB1_3
LBB1_2:
	movq	-8(%rbp), %rdi
	callq	_strdup
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rdi
	callq	_dirname
	movq	%rax, _build_dir(%rip)
LBB1_3:
	movq	-8(%rbp), %rdi
	callq	_load_file
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_add_module             ## -- Begin function add_module
	.p2align	4, 0x90
_add_module:                            ## @add_module
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
	movq	_mods(%rip), %rdi
	movq	-8(%rbp), %rsi
	movq	%rdi, -24(%rbp)         ## 8-byte Spill
	movq	%rsi, %rdi
	callq	_strfromchar
	movq	-16(%rbp), %rdx
	movq	-24(%rbp), %rdi         ## 8-byte Reload
	movq	%rax, %rsi
	callq	_ob_subscr_set
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_import_module          ## -- Begin function import_module
	.p2align	4, 0x90
_import_module:                         ## @import_module
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$1232, %rsp             ## imm = 0x4D0
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	%rdi, -1056(%rbp)
	movq	-1056(%rbp), %rax
	movsbl	(%rax), %ecx
	cmpl	$47, %ecx
	je	LBB3_2
## %bb.1:
	movq	_build_dir(%rip), %rdi
	callq	_strlen
	movq	-1056(%rbp), %rdi
	movq	%rax, -1128(%rbp)       ## 8-byte Spill
	callq	_strlen
	movq	-1128(%rbp), %rdi       ## 8-byte Reload
	addq	%rax, %rdi
	addq	$2, %rdi
	callq	_malloc
	xorl	%esi, %esi
	movq	$-1, %rdx
	movq	%rax, -1064(%rbp)
	movq	-1064(%rbp), %rdi
	movq	_build_dir(%rip), %r8
	movq	-1056(%rbp), %r9
	leaq	L_.str.6(%rip), %rcx
	movb	$0, %al
	callq	___sprintf_chk
	movq	-1064(%rbp), %rcx
	movq	%rcx, -1056(%rbp)
	movl	%eax, -1132(%rbp)       ## 4-byte Spill
	jmp	LBB3_3
LBB3_2:
	movq	-1056(%rbp), %rdi
	callq	_strdup
	movq	%rax, -1072(%rbp)
	movq	-1072(%rbp), %rdi
	callq	_dirname
	movq	%rax, _build_dir(%rip)
LBB3_3:
	callq	_new_ob
	movq	%rax, -1080(%rbp)
	movq	-1056(%rbp), %rdi
	leaq	L_.str.7(%rip), %rsi
	callq	_fopen
	movq	%rax, -1088(%rbp)
	cmpq	$0, -1088(%rbp)
	jne	LBB3_5
## %bb.4:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	movq	-1056(%rbp), %rdx
	leaq	L_.str.8(%rip), %rsi
	movb	$0, %al
	callq	_fprintf
	movq	$0, -1048(%rbp)
	movl	%eax, -1136(%rbp)       ## 4-byte Spill
	jmp	LBB3_13
LBB3_5:
	leaq	-1040(%rbp), %rdi
	movq	-1088(%rbp), %rdx
	movl	$1024, %esi             ## imm = 0x400
	callq	_fgets
	leaq	-1040(%rbp), %rdi
	leaq	L_.str.9(%rip), %rsi
	movq	%rax, -1144(%rbp)       ## 8-byte Spill
	callq	_strtok
	leaq	-1040(%rbp), %rdi
	movq	%rax, -1152(%rbp)       ## 8-byte Spill
	callq	_strdup
	leaq	-1040(%rbp), %rdx
	movq	_output@GOTPCREL(%rip), %rsi
	movq	%rax, -1096(%rbp)
	movq	(%rsi), %rdi
	leaq	L_.str.10(%rip), %rsi
	movb	$0, %al
	callq	_fprintf
	leaq	-1040(%rbp), %rdi
	movq	-1088(%rbp), %rdx
	movl	$1024, %esi             ## imm = 0x400
	movl	%eax, -1156(%rbp)       ## 4-byte Spill
	callq	_fgets
	leaq	-1040(%rbp), %rdi
	leaq	L_.str.9(%rip), %rsi
	movq	%rax, -1168(%rbp)       ## 8-byte Spill
	callq	_strtok
	leaq	-1040(%rbp), %rdi
	movl	$2, %esi
	movq	%rax, -1176(%rbp)       ## 8-byte Spill
	callq	_dlopen
	movq	%rax, -1104(%rbp)
	cmpq	$0, -1104(%rbp)
	jne	LBB3_7
## %bb.6:
	leaq	-1040(%rbp), %rdx
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	leaq	L_.str.11(%rip), %rsi
	movb	$0, %al
	callq	_fprintf
	movl	%eax, -1180(%rbp)       ## 4-byte Spill
LBB3_7:
	jmp	LBB3_8
LBB3_8:                                 ## =>This Inner Loop Header: Depth=1
	leaq	-1040(%rbp), %rdx
	movq	-1088(%rbp), %rdi
	leaq	L_.str.12(%rip), %rsi
	movb	$0, %al
	callq	_fscanf
	cmpl	$1, %eax
	jne	LBB3_12
## %bb.9:                               ##   in Loop: Header=BB3_8 Depth=1
	leaq	-1040(%rbp), %rsi
	movq	-1104(%rbp), %rdi
	callq	_dlsym
	movq	%rax, -1112(%rbp)
	cmpq	$0, -1112(%rbp)
	jne	LBB3_11
## %bb.10:
	leaq	-1040(%rbp), %rdx
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	movq	-1096(%rbp), %rcx
	leaq	L_.str.13(%rip), %rsi
	movb	$0, %al
	callq	_fprintf
	movq	$0, -1048(%rbp)
	movl	%eax, -1184(%rbp)       ## 4-byte Spill
	jmp	LBB3_13
LBB3_11:                                ##   in Loop: Header=BB3_8 Depth=1
	movl	$32, %eax
	movl	%eax, %edi
	callq	_malloc
	leaq	-1040(%rbp), %rdi
	movq	_BINTYPE@GOTPCREL(%rip), %rcx
	movq	%rax, -1120(%rbp)
	movq	-1112(%rbp), %rax
	movq	-1120(%rbp), %rdx
	movq	%rax, 24(%rdx)
	movq	-1120(%rbp), %rax
	movq	%rcx, (%rax)
	movq	-1120(%rbp), %rax
	movl	$1, 8(%rax)
	callq	_strdup
	leaq	-1040(%rbp), %rdi
	movq	-1120(%rbp), %rcx
	movq	%rax, 16(%rcx)
	movq	-1080(%rbp), %rax
	movq	%rax, -1192(%rbp)       ## 8-byte Spill
	callq	_strfromchar
	movq	-1120(%rbp), %rcx
	movq	-1192(%rbp), %rdi       ## 8-byte Reload
	movq	%rax, %rsi
	movq	%rcx, %rdx
	callq	_ob_subscr_set
	jmp	LBB3_8
LBB3_12:
	movq	_mods(%rip), %rdi
	movq	-1096(%rbp), %rax
	movq	%rdi, -1200(%rbp)       ## 8-byte Spill
	movq	%rax, %rdi
	callq	_strfromchar
	movq	-1080(%rbp), %rdi
	movq	-1200(%rbp), %rcx       ## 8-byte Reload
	movq	%rdi, -1208(%rbp)       ## 8-byte Spill
	movq	%rcx, %rdi
	movq	%rax, %rsi
	movq	-1208(%rbp), %rdx       ## 8-byte Reload
	callq	_ob_subscr_set
	movq	-1088(%rbp), %rdi
	callq	_fclose
	movq	-1080(%rbp), %rcx
	movq	%rcx, -1048(%rbp)
	movl	%eax, -1212(%rbp)       ## 4-byte Spill
LBB3_13:
	movq	-1048(%rbp), %rax
	movq	___stack_chk_guard@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rcx
	movq	-8(%rbp), %rdx
	cmpq	%rdx, %rcx
	movq	%rax, -1224(%rbp)       ## 8-byte Spill
	jne	LBB3_15
## %bb.14:
	movq	-1224(%rbp), %rax       ## 8-byte Reload
	addq	$1232, %rsp             ## imm = 0x4D0
	popq	%rbp
	retq
LBB3_15:
	callq	___stack_chk_fail
	ud2
	.cfi_endproc
                                        ## -- End function
	.globl	_launch_file            ## -- Begin function launch_file
	.p2align	4, 0x90
_launch_file:                           ## @launch_file
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$128, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	movsbl	(%rdi), %eax
	cmpl	$47, %eax
	je	LBB4_2
## %bb.1:
	movl	$1000, %eax             ## imm = 0x3E8
	movl	%eax, %edi
	callq	_malloc
	movl	$1000, %ecx             ## imm = 0x3E8
	movl	%ecx, %esi
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rdi
	callq	_getcwd
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rdi
	callq	_strlen
	movq	-8(%rbp), %rdi
	movq	%rax, -80(%rbp)         ## 8-byte Spill
	callq	_strlen
	movq	-80(%rbp), %rsi         ## 8-byte Reload
	addq	%rax, %rsi
	addq	$2, %rsi
	movq	%rsi, %rdi
	callq	_malloc
	xorl	%esi, %esi
	movq	$-1, %rdx
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rdi
	movq	-24(%rbp), %r8
	movq	-8(%rbp), %r9
	leaq	L_.str.6(%rip), %rcx
	movb	$0, %al
	callq	___sprintf_chk
	movq	-32(%rbp), %rcx
	movq	%rcx, -8(%rbp)
	movl	%eax, -84(%rbp)         ## 4-byte Spill
	jmp	LBB4_3
LBB4_2:
	movq	-8(%rbp), %rdi
	callq	_strdup
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rdi
	callq	_dirname
	movq	%rax, _build_dir(%rip)
LBB4_3:
	movq	_output@GOTPCREL(%rip), %rax
	movq	-8(%rbp), %rdi
	movq	%rax, -96(%rbp)         ## 8-byte Spill
	callq	_load_file
	movq	%rax, -48(%rbp)
	movq	-8(%rbp), %rdi
	callq	_strdup
	movq	%rax, %rdi
	callq	_basename
	leaq	L_.str.1(%rip), %rsi
	movq	%rax, %rdi
	callq	_strtok
	movq	%rax, -56(%rbp)
	movq	_current_thread@TLVP(%rip), %rdi
	callq	*(%rdi)
	movq	(%rax), %rdi
	movq	-48(%rbp), %rsi
	movq	%rax, -104(%rbp)        ## 8-byte Spill
	callq	_start_coro
	movq	%rax, -64(%rbp)
	movq	-64(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -72(%rbp)
	movq	-72(%rbp), %rax
	movl	$1, 96(%rax)
	movq	_workload_lock@GOTPCREL(%rip), %rdi
	callq	_pthread_mutex_lock
	movq	-64(%rbp), %rsi
	movq	-104(%rbp), %rdi        ## 8-byte Reload
	movq	(%rdi), %rcx
	movq	%rsi, 80(%rcx)
	movq	-96(%rbp), %rcx         ## 8-byte Reload
	movq	(%rcx), %rdi
	movq	-56(%rbp), %rdx
	leaq	L_.str.14(%rip), %rsi
	movl	%eax, -108(%rbp)        ## 4-byte Spill
	movb	$0, %al
	callq	_fprintf
	movq	_workload_cond@GOTPCREL(%rip), %rdi
	movl	%eax, -112(%rbp)        ## 4-byte Spill
	callq	_pthread_cond_signal
	movq	_workload_lock@GOTPCREL(%rip), %rdi
	movl	%eax, -116(%rbp)        ## 4-byte Spill
	callq	_pthread_mutex_unlock
	movl	%eax, -120(%rbp)        ## 4-byte Spill
	addq	$128, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_compile_to_binary      ## -- Begin function compile_to_binary
	.p2align	4, 0x90
_compile_to_binary:                     ## @compile_to_binary
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$2144, %rsp             ## imm = 0x860
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	%rdi, -2072(%rbp)
	movq	$0, -2080(%rbp)
	movq	-2072(%rbp), %rdi
	callq	_basename
	movq	%rax, -2088(%rbp)
	movq	-2088(%rbp), %rdi
	leaq	L_.str.1(%rip), %rsi
	callq	_strtok
	movq	%rax, -2088(%rbp)
	movq	-2088(%rbp), %rdi
	callq	_strlen
	addq	$6, %rax
	movq	%rax, %rdi
	callq	_dulalloc
	xorl	%esi, %esi
	movq	$-1, %rdx
	movq	%rax, -2096(%rbp)
	movq	-2096(%rbp), %rdi
	movq	-2088(%rbp), %r8
	leaq	L_.str.15(%rip), %rcx
	movb	$0, %al
	callq	___sprintf_chk
	movq	-2096(%rbp), %rdi
	leaq	L_.str.16(%rip), %rsi
	movl	%eax, -2116(%rbp)       ## 4-byte Spill
	callq	_fopen
	movl	$8, %r9d
	movl	%r9d, %esi
	movl	$1, %r9d
	movl	%r9d, %edx
	movq	%rax, -2104(%rbp)
	movq	$901342, -2112(%rbp)    ## imm = 0xDC0DE
	leaq	-2112(%rbp), %rax
	movq	-2104(%rbp), %rcx
	movq	%rax, %rdi
	callq	_fwrite
	movq	-2104(%rbp), %rdi
	movq	%rax, -2128(%rbp)       ## 8-byte Spill
	callq	_fclose
	movq	___stack_chk_guard@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rcx
	movq	-8(%rbp), %rdx
	cmpq	%rdx, %rcx
	movl	%eax, -2132(%rbp)       ## 4-byte Spill
	jne	LBB5_2
## %bb.1:
	addq	$2144, %rsp             ## imm = 0x860
	popq	%rbp
	retq
LBB5_2:
	callq	___stack_chk_fail
	ud2
	.cfi_endproc
                                        ## -- End function
	.globl	_execute_command        ## -- Begin function execute_command
	.p2align	4, 0x90
_execute_command:                       ## @execute_command
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$1088, %rsp             ## imm = 0x440
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	%rdi, -1048(%rbp)
	movq	-1048(%rbp), %rdi
	leaq	L_.str.17(%rip), %rsi
	callq	_strtok
	movq	%rax, -1056(%rbp)
	movq	-1056(%rbp), %rdi
	leaq	L_.str.2(%rip), %rsi
	callq	_strcmp
	cmpl	$0, %eax
	jne	LBB6_5
## %bb.1:
	xorl	%eax, %eax
	movl	%eax, %edi
	leaq	L_.str.18(%rip), %rsi
	callq	_strtok
	movq	%rax, -1064(%rbp)
	movq	-1064(%rbp), %rdi
	leaq	L_.str.7(%rip), %rsi
	callq	_fopen
	movq	%rax, -1072(%rbp)
LBB6_2:                                 ## =>This Inner Loop Header: Depth=1
	leaq	-1040(%rbp), %rdi
	movq	-1072(%rbp), %rdx
	movl	$1024, %esi             ## imm = 0x400
	callq	_fgets
	cmpq	$0, %rax
	je	LBB6_4
## %bb.3:                               ##   in Loop: Header=BB6_2 Depth=1
	leaq	-1040(%rbp), %rdi
	callq	_execute_command
	jmp	LBB6_2
LBB6_4:
	movq	-1072(%rbp), %rdi
	callq	_fclose
	movl	%eax, -1076(%rbp)       ## 4-byte Spill
LBB6_5:
	movq	-1056(%rbp), %rdi
	leaq	L_.str.3(%rip), %rsi
	callq	_strcmp
	cmpl	$0, %eax
	jne	LBB6_7
## %bb.6:
	xorl	%eax, %eax
	movl	%eax, %edi
	leaq	L_.str.18(%rip), %rsi
	callq	_strtok
	movq	%rax, %rdi
	callq	_import_module
	movq	%rax, -1088(%rbp)       ## 8-byte Spill
LBB6_7:
	movq	-1056(%rbp), %rdi
	leaq	L_.str.4(%rip), %rsi
	callq	_strcmp
	cmpl	$0, %eax
	jne	LBB6_9
## %bb.8:
	xorl	%eax, %eax
	movl	%eax, %edi
	leaq	L_.str.18(%rip), %rsi
	callq	_strtok
	movq	%rax, %rdi
	callq	_launch_file
LBB6_9:
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	-8(%rbp), %rcx
	cmpq	%rcx, %rax
	jne	LBB6_11
## %bb.10:
	addq	$1088, %rsp             ## imm = 0x440
	popq	%rbp
	retq
LBB6_11:
	callq	___stack_chk_fail
	ud2
	.cfi_endproc
                                        ## -- End function
	.globl	_getmodule              ## -- Begin function getmodule
	.weak_definition	_getmodule
	.p2align	4, 0x90
_getmodule:                             ## @getmodule
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	_mods(%rip), %rdi
	movq	-8(%rbp), %rax
	movq	%rdi, -16(%rbp)         ## 8-byte Spill
	movq	%rax, %rdi
	callq	_strfromchar
	movq	-16(%rbp), %rdi         ## 8-byte Reload
	movq	%rax, %rsi
	callq	_ob_subscr_get
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
.zerofill __DATA,__bss,_mods,8,3        ## @mods
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"/Users/jernicozz/Documents/_Dulang/NIolang/__array.dul"

	.section	__DATA,__const
	.p2align	3               ## @__const.init_mods.modlist
l___const.init_mods.modlist:
	.quad	L_.str

	.section	__TEXT,__cstring,cstring_literals
L_.str.1:                               ## @.str.1
	.asciz	"."

	.section	__DATA,__data
	.globl	_cmd_count              ## @cmd_count
	.p2align	2
_cmd_count:
	.long	4                       ## 0x4

	.section	__TEXT,__cstring,cstring_literals
L_.str.2:                               ## @.str.2
	.asciz	"build"

L_.str.3:                               ## @.str.3
	.asciz	"import"

L_.str.4:                               ## @.str.4
	.asciz	"launch"

L_.str.5:                               ## @.str.5
	.asciz	"compile"

	.section	__DATA,__data
	.globl	_cmds                   ## @cmds
	.p2align	4
_cmds:
	.quad	L_.str.2
	.quad	L_.str.3
	.quad	L_.str.4
	.quad	L_.str.5

	.p2align	3               ## @build_dir
_build_dir:
	.quad	L_.str.19

	.section	__TEXT,__cstring,cstring_literals
L_.str.6:                               ## @.str.6
	.asciz	"%s/%s"

L_.str.7:                               ## @.str.7
	.asciz	"r"

L_.str.8:                               ## @.str.8
	.asciz	"cannot open file %s, aborting"

L_.str.9:                               ## @.str.9
	.asciz	"\n"

L_.str.10:                              ## @.str.10
	.asciz	"importing module %s...\n\n"

L_.str.11:                              ## @.str.11
	.asciz	"cannot open library %s, aborting"

L_.str.12:                              ## @.str.12
	.asciz	"%s"

L_.str.13:                              ## @.str.13
	.asciz	"cannot find %s function in module %s, aborting"

L_.str.14:                              ## @.str.14
	.asciz	"launching module %s...\n\n"

L_.str.15:                              ## @.str.15
	.asciz	"%s.dulc"

L_.str.16:                              ## @.str.16
	.asciz	"w"

L_.str.17:                              ## @.str.17
	.asciz	" "

L_.str.18:                              ## @.str.18
	.asciz	" \n"

L_.str.19:                              ## @.str.19
	.asciz	"/Users/jernicozz/Documents/_Dulang/Niolang/"


.subsections_via_symbols
