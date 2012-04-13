.data
	.align 4
.globl Plus0_foo_closure
.type Plus0_foo_closure, @object
Plus0_foo_closure:
	.long	Plus0_foo_info
.text
	.align 4,0x90
	.long	0
	.long	32
sll_info:
.Lclz:
	addl $8,%edi
	cmpl 92(%ebx),%edi
	ja .LclF
	movl 3(%esi),%eax
	imull 3(%esi),%eax
	addl $2,%eax
	movl $ghczmprim_GHCziTypes_Izh_con_info,-4(%edi)
	movl %eax,0(%edi)
	leal -3(%edi),%esi
	addl $4,%ebp
	jmp *0(%ebp)
.LclF:
	movl $8,112(%ebx)
.LclD:
	jmp *-8(%ebx)
.text
	.align 4,0x90
	.long	65541
	.long	0
	.long	15
.globl Plus0_foo_info
.type Plus0_foo_info, @object
Plus0_foo_info:
.LclJ:
	movl 0(%ebp),%esi
	movl $sll_info,0(%ebp)
	testl $3,%esi
	jne sll_info
	jmp *(%esi)
.data
	.align 4
_module_registered:
	.long	0
.text
	.align 4,0x90
.globl __stginit_Plus0_
.type __stginit_Plus0_, @object
__stginit_Plus0_:
.LclW:
	cmpl $0,_module_registered
	jne .LclX
.LclY:
	movl $1,_module_registered
	addl $-4,%ebp
	movl $__stginit_base_Prelude_,(%ebp)
.LclX:
	addl $4,%ebp
	jmp *-4(%ebp)
.text
	.align 4,0x90
.globl __stginit_Plus0
.type __stginit_Plus0, @object
__stginit_Plus0:
.Lcm2:
	jmp __stginit_Plus0_
.section .note.GNU-stack,"",@progbits
.ident "GHC 7.0.4"
