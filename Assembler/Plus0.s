.section .data
	.align 4
.globl Plus0_foo_srt
.type Plus0_foo_srt, @object
Plus0_foo_srt:
	.long	base_GHCziNum_zdfNumInt_closure
.data
	.align 4
.globl Plus0_foo_closure
.type Plus0_foo_closure, @object
Plus0_foo_closure:
	.long	Plus0_foo_info
	.long	0
.text
	.align 4,0x90
	.long	Plus0_foo_srt-(skI_info)+0
	.long	1
	.long	65553
skI_info:
.LckZ:
	leal -24(%ebp),%eax
	cmpl 84(%ebx),%eax
	jb .Lcl1
	movl $stg_upd_frame_info,-8(%ebp)
	movl %esi,-4(%ebp)
	movl 8(%esi),%eax
	movl %eax,-12(%ebp)
	movl 8(%esi),%eax
	movl %eax,-16(%ebp)
	movl $stg_ap_pp_info,-20(%ebp)
	movl $base_GHCziNum_zdfNumInt_closure,-24(%ebp)
	addl $-24,%ebp
	jmp base_GHCziNum_zt_info
.Lcl1:
	jmp *-8(%ebx)
.text
	.align 4,0x90
	.long	Plus0_foo_srt-(Plus0_foo_info)+0
	.long	65541
	.long	0
	.long	65551
.globl Plus0_foo_info
.type Plus0_foo_info, @object
Plus0_foo_info:
.Lclc:
	leal -12(%ebp),%eax
	cmpl 84(%ebx),%eax
	jb .Lcle
	addl $12,%edi
	cmpl 92(%ebx),%edi
	ja .Lclg
	movl $skI_info,-8(%edi)
	movl 0(%ebp),%eax
	movl %eax,0(%edi)
	movl $stg_INTLIKE_closure+145,0(%ebp)
	leal -8(%edi),%eax
	movl %eax,-4(%ebp)
	movl $stg_ap_pp_info,-8(%ebp)
	movl $base_GHCziNum_zdfNumInt_closure,-12(%ebp)
	addl $-12,%ebp
	jmp base_GHCziNum_zp_info
.Lclg:
	movl $12,112(%ebx)
.Lcle:
	movl $Plus0_foo_closure,%esi
	jmp *-4(%ebx)
.data
	.align 4
_module_registered:
	.long	0
.text
	.align 4,0x90
.globl __stginit_Plus0_
.type __stginit_Plus0_, @object
__stginit_Plus0_:
.Lclu:
	cmpl $0,_module_registered
	jne .Lclv
.Lclw:
	movl $1,_module_registered
	addl $-4,%ebp
	movl $__stginit_base_Prelude_,(%ebp)
.Lclv:
	addl $4,%ebp
	jmp *-4(%ebp)
.text
	.align 4,0x90
.globl __stginit_Plus0
.type __stginit_Plus0, @object
__stginit_Plus0:
.LclC:
	jmp __stginit_Plus0_
.section .note.GNU-stack,"",@progbits
.ident "GHC 7.0.4"
