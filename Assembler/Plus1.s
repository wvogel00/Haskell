.section .data
	.align 4
.globl Plus1_foo_srt
.type Plus1_foo_srt, @object
Plus1_foo_srt:
	.long	integerzmgmp_GHCziInteger_smallInteger_closure
	.long	base_GHCziReal_zc_closure
	.long	base_GHCziBase_zdfMonadIO_closure
	.long	base_GHCziNum_zdfNumInt_closure
	.long	base_GHCziReal_zdfIntegralInteger_closure
.data
	.align 4
.globl Plus1_foo_closure
.type Plus1_foo_closure, @object
Plus1_foo_closure:
	.long	Plus1_foo_info
	.long	0
.text
	.align 4,0x90
	.long	Plus1_foo_srt-(ssS_info)+0
	.long	0
	.long	65552
ssS_info:
.Lctd:
	leal -12(%ebp),%eax
	cmpl 84(%ebx),%eax
	jb .Lctf
	movl $stg_upd_frame_info,-8(%ebp)
	movl %esi,-4(%ebp)
	movl $integerzmgmp_GHCziInteger_smallInteger_closure,%esi
	movl $2,-12(%ebp)
	addl $-12,%ebp
	jmp stg_ap_n_fast
.Lctf:
	jmp *-8(%ebx)
.text
	.align 4,0x90
	.long	Plus1_foo_srt-(ssT_info)+0
	.long	1
	.long	1769489
ssT_info:
.Lctp:
	leal -24(%ebp),%eax
	cmpl 84(%ebx),%eax
	jb .Lctr
	addl $8,%edi
	cmpl 92(%ebx),%edi
	ja .Lctt
	movl $stg_upd_frame_info,-8(%ebp)
	movl %esi,-4(%ebp)
	movl $ssS_info,-4(%edi)
	leal -4(%edi),%eax
	movl %eax,-12(%ebp)
	movl 8(%esi),%eax
	movl %eax,-16(%ebp)
	movl $base_GHCziReal_zc_closure,%esi
	movl $base_GHCziReal_zdfIntegralInteger_closure,-20(%ebp)
	movl $base_GHCziNum_zdfNumInt_closure,-24(%ebp)
	addl $-24,%ebp
	jmp stg_ap_pppp_fast
.Lctt:
	movl $8,112(%ebx)
.Lctr:
	jmp *-8(%ebx)
.text
	.align 4,0x90
	.long	Plus1_foo_srt-(ssU_info)+0
	.long	1
	.long	1769489
ssU_info:
.LctF:
	leal -24(%ebp),%eax
	cmpl 84(%ebx),%eax
	jb .LctH
	addl $12,%edi
	cmpl 92(%ebx),%edi
	ja .LctJ
	movl $stg_upd_frame_info,-8(%ebp)
	movl %esi,-4(%ebp)
	movl $ssT_info,-8(%edi)
	movl 8(%esi),%eax
	movl %eax,0(%edi)
	movl $stg_INTLIKE_closure+145,-12(%ebp)
	leal -8(%edi),%eax
	movl %eax,-16(%ebp)
	movl $stg_ap_pp_info,-20(%ebp)
	movl $base_GHCziNum_zdfNumInt_closure,-24(%ebp)
	addl $-24,%ebp
	jmp base_GHCziNum_zp_info
.LctJ:
	movl $12,112(%ebx)
.LctH:
	jmp *-8(%ebx)
.text
	.align 4,0x90
	.long	Plus1_foo_srt-(Plus1_foo_info)+0
	.long	65541
	.long	0
	.long	2031631
.globl Plus1_foo_info
.type Plus1_foo_info, @object
Plus1_foo_info:
.LctU:
	leal -8(%ebp),%eax
	cmpl 84(%ebx),%eax
	jb .LctW
	addl $12,%edi
	cmpl 92(%ebx),%edi
	ja .LctY
	movl $ssU_info,-8(%edi)
	movl 0(%ebp),%eax
	movl %eax,0(%edi)
	leal -8(%edi),%eax
	movl %eax,0(%ebp)
	movl $stg_ap_p_info,-4(%ebp)
	movl $base_GHCziBase_zdfMonadIO_closure,-8(%ebp)
	addl $-8,%ebp
	jmp base_GHCziBase_return_info
.LctY:
	movl $12,112(%ebx)
.LctW:
	movl $Plus1_foo_closure,%esi
	jmp *-4(%ebx)
.data
	.align 4
_module_registered:
	.long	0
.text
	.align 4,0x90
.globl __stginit_Plus1_
.type __stginit_Plus1_, @object
__stginit_Plus1_:
.Lcuc:
	cmpl $0,_module_registered
	jne .Lcud
.Lcue:
	movl $1,_module_registered
	addl $-4,%ebp
	movl $__stginit_base_Prelude_,(%ebp)
.Lcud:
	addl $4,%ebp
	jmp *-4(%ebp)
.text
	.align 4,0x90
.globl __stginit_Plus1
.type __stginit_Plus1, @object
__stginit_Plus1:
.Lcuk:
	jmp __stginit_Plus1_
.section .note.GNU-stack,"",@progbits
.ident "GHC 7.0.4"
