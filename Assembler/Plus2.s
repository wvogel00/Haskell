.section .data
	.align 4
ssH_srt:
	.long	integerzmgmp_GHCziInteger_smallInteger_closure
.data
	.align 4
ssH_closure:
	.long	ssH_info
	.long	0
	.long	0
	.long	0
.text
	.align 4,0x90
	.long	ssH_srt-(ssH_info)+0
	.long	0
	.long	65558
ssH_info:
.Lct0:
	leal -12(%ebp),%eax
	cmpl 84(%ebx),%eax
	jb .Lct2
	addl $8,%edi
	cmpl 92(%ebx),%edi
	ja .Lct4
	movl $stg_CAF_BLACKHOLE_info,-4(%edi)
	movl 96(%ebx),%eax
	movl %eax,0(%edi)
	pushl %esi
	pushl %ebx
	call newCAF
	addl $8,%esp
	leal -4(%edi),%eax
	movl %eax,4(%esi)
	movl $stg_IND_STATIC_info,(%esi)
	movl $stg_bh_upd_frame_info,-8(%ebp)
	leal -4(%edi),%eax
	movl %eax,-4(%ebp)
	movl $integerzmgmp_GHCziInteger_smallInteger_closure,%esi
	movl $2,-12(%ebp)
	addl $-12,%ebp
	jmp stg_ap_n_fast
.Lct4:
	movl $8,112(%ebx)
.Lct2:
	jmp *-8(%ebx)
.section .data
	.align 4
std_srt:
	.long	base_GHCziReal_zc_closure
	.long	base_GHCziNum_zdfNumInt_closure
	.long	base_GHCziReal_zdfIntegralInteger_closure
	.long	ssH_closure
.data
	.align 4
std_closure:
	.long	std_info
	.long	0
.text
	.align 4,0x90
	.long	std_srt-(std_info)+0
	.long	65541
	.long	0
	.long	983055
std_info:
.Lctp:
	leal -12(%ebp),%eax
	cmpl 84(%ebx),%eax
	jb .Lcts
	movl $base_GHCziReal_zc_closure,%esi
	movl 0(%ebp),%eax
	movl %eax,-4(%ebp)
	movl $ssH_closure,0(%ebp)
	movl $base_GHCziReal_zdfIntegralInteger_closure,-8(%ebp)
	movl $base_GHCziNum_zdfNumInt_closure,-12(%ebp)
	addl $-12,%ebp
	jmp stg_ap_pppp_fast
.Lcts:
	movl $std_closure,%esi
	jmp *-4(%ebx)
.data
	.align 4
ssC_closure:
	.long	ghczmprim_GHCziTypes_Izh_static_info
	.long	2
.section .data
	.align 4
stD_srt:
	.long	base_GHCziNum_zdfNumInt_closure
	.long	ssC_closure
.data
	.align 4
stD_closure:
	.long	stD_info
	.long	0
.text
	.align 4,0x90
	.long	stD_srt-(stD_info)+0
	.long	65541
	.long	0
	.long	196623
stD_info:
.LctQ:
	leal -12(%ebp),%eax
	cmpl 84(%ebx),%eax
	jb .LctT
	movl 0(%ebp),%eax
	movl %eax,-4(%ebp)
	movl $ssC_closure+1,0(%ebp)
	movl $stg_ap_pp_info,-8(%ebp)
	movl $base_GHCziNum_zdfNumInt_closure,-12(%ebp)
	addl $-12,%ebp
	jmp base_GHCziNum_zp_info
.LctT:
	movl $stD_closure,%esi
	jmp *-4(%ebx)
.section .data
	.align 4
.globl Plus2_foo_srt
.type Plus2_foo_srt, @object
Plus2_foo_srt:
	.long	base_GHCziBase_zi_closure
	.long	std_closure
	.long	stD_closure
.data
	.align 4
.globl Plus2_foo_closure
.type Plus2_foo_closure, @object
Plus2_foo_closure:
	.long	Plus2_foo_info
	.long	0
	.long	0
	.long	0
.text
	.align 4,0x90
	.long	Plus2_foo_srt-(Plus2_foo_info)+0
	.long	0
	.long	458774
.globl Plus2_foo_info
.type Plus2_foo_info, @object
Plus2_foo_info:
.Lcue:
	leal -16(%ebp),%eax
	cmpl 84(%ebx),%eax
	jb .Lcug
	addl $8,%edi
	cmpl 92(%ebx),%edi
	ja .Lcui
	movl $stg_CAF_BLACKHOLE_info,-4(%edi)
	movl 96(%ebx),%eax
	movl %eax,0(%edi)
	pushl %esi
	pushl %ebx
	call newCAF
	addl $8,%esp
	leal -4(%edi),%eax
	movl %eax,4(%esi)
	movl $stg_IND_STATIC_info,(%esi)
	movl $stg_bh_upd_frame_info,-8(%ebp)
	leal -4(%edi),%eax
	movl %eax,-4(%ebp)
	movl $base_GHCziBase_zi_closure,%esi
	movl $std_closure+1,-12(%ebp)
	movl $stD_closure+1,-16(%ebp)
	addl $-16,%ebp
	jmp stg_ap_pp_fast
.Lcui:
	movl $8,112(%ebx)
.Lcug:
	jmp *-8(%ebx)
.data
	.align 4
_module_registered:
	.long	0
.text
	.align 4,0x90
.globl __stginit_Plus2_
.type __stginit_Plus2_, @object
__stginit_Plus2_:
.Lcux:
	cmpl $0,_module_registered
	jne .Lcuy
.Lcuz:
	movl $1,_module_registered
	addl $-4,%ebp
	movl $__stginit_base_Prelude_,(%ebp)
.Lcuy:
	addl $4,%ebp
	jmp *-4(%ebp)
.text
	.align 4,0x90
.globl __stginit_Plus2
.type __stginit_Plus2, @object
__stginit_Plus2:
.LcuF:
	jmp __stginit_Plus2_
.section .note.GNU-stack,"",@progbits
.ident "GHC 7.0.4"
