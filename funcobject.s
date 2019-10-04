	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 14	sdk_version 10, 14
	.globl	_destroy_func           ## -- Begin function destroy_func
	.p2align	4, 0x90
_destroy_func:                          ## @destroy_func
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
	.globl	_dumpfunc               ## -- Begin function dumpfunc
	.p2align	4, 0x90
_dumpfunc:                              ## @dumpfunc
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movl	$100, %eax
	movl	%eax, %ecx
	movq	%rdi, -8(%rbp)
	movq	%rcx, %rdi
	callq	_dulalloc
	xorl	%esi, %esi
	movq	$-1, %rdx
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rdi
	movq	-8(%rbp), %r8
	leaq	L_.str.42(%rip), %rcx
	movb	$0, %al
	callq	___sprintf_chk
	movq	-16(%rbp), %rcx
	movl	%eax, -20(%rbp)         ## 4-byte Spill
	movq	%rcx, %rax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_fsetup                 ## -- Begin function fsetup
	.p2align	4, 0x90
_fsetup:                                ## @fsetup
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	leaq	_FUNCTYPE(%rip), %rax
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	movq	%rax, (%rdi)
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"load_outer"

L_.str.1:                               ## @.str.1
	.asciz	"load_static"

L_.str.2:                               ## @.str.2
	.asciz	"load_name"

L_.str.3:                               ## @.str.3
	.asciz	"store_name"

L_.str.4:                               ## @.str.4
	.asciz	"_subscr_get"

L_.str.5:                               ## @.str.5
	.asciz	"_subscr_set"

L_.str.6:                               ## @.str.6
	.asciz	"jump"

L_.str.7:                               ## @.str.7
	.asciz	"jump_if_not_true"

L_.str.8:                               ## @.str.8
	.asciz	"init_iter"

L_.str.9:                               ## @.str.9
	.asciz	"iter_next"

L_.str.10:                              ## @.str.10
	.asciz	"mktuple"

L_.str.11:                              ## @.str.11
	.asciz	"dulreturn"

L_.str.12:                              ## @.str.12
	.asciz	"check_iter"

L_.str.13:                              ## @.str.13
	.asciz	"invoke"

L_.str.14:                              ## @.str.14
	.asciz	"unpack_iter"

L_.str.15:                              ## @.str.15
	.asciz	"doasync"

L_.str.16:                              ## @.str.16
	.asciz	"write"

L_.str.17:                              ## @.str.17
	.asciz	"invoke_method"

L_.str.18:                              ## @.str.18
	.asciz	"push_null"

L_.str.19:                              ## @.str.19
	.asciz	"funcdef"

L_.str.20:                              ## @.str.20
	.asciz	"op_plus"

L_.str.21:                              ## @.str.21
	.asciz	"op_minus"

L_.str.22:                              ## @.str.22
	.asciz	"op_mult"

L_.str.23:                              ## @.str.23
	.asciz	"op_div"

L_.str.24:                              ## @.str.24
	.asciz	"op_inpl_add"

L_.str.25:                              ## @.str.25
	.asciz	"op_inpl_sub"

L_.str.26:                              ## @.str.26
	.asciz	"op_inpl_mult"

L_.str.27:                              ## @.str.27
	.asciz	"op_inpl_div"

L_.str.28:                              ## @.str.28
	.asciz	"op_lt"

L_.str.29:                              ## @.str.29
	.asciz	"op_gt"

L_.str.30:                              ## @.str.30
	.asciz	"op_eq"

L_.str.31:                              ## @.str.31
	.asciz	"op_leq"

L_.str.32:                              ## @.str.32
	.asciz	"op_geq"

L_.str.33:                              ## @.str.33
	.asciz	"assign_many"

L_.str.34:                              ## @.str.34
	.asciz	"implsubscr"

L_.str.35:                              ## @.str.35
	.asciz	"import"

L_.str.36:                              ## @.str.36
	.asciz	"contains"

L_.str.37:                              ## @.str.37
	.asciz	"unpack"

L_.str.38:                              ## @.str.38
	.asciz	"expr_stop"

L_.str.39:                              ## @.str.39
	.asciz	"pack_mod"

L_.str.40:                              ## @.str.40
	.asciz	"push_object"

	.section	__DATA,__data
	.globl	_opcode_repres_         ## @opcode_repres_
	.p2align	4
_opcode_repres_:
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

	.section	__TEXT,__cstring,cstring_literals
L_.str.41:                              ## @.str.41
	.asciz	"functional object"

	.section	__DATA,__const
	.globl	_FUNCTYPE               ## @FUNCTYPE
	.p2align	3
_FUNCTYPE:
	.quad	L_.str.41
	.quad	_dumpfunc
	.quad	0
	.quad	_destroy_func
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
	.long	5                       ## 0x5
	.space	4
	.quad	0

	.section	__TEXT,__cstring,cstring_literals
L_.str.42:                              ## @.str.42
	.asciz	"function at %lX"


.subsections_via_symbols
