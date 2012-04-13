.data
	.align 4
rEb_closure:
	.long	rEb_info
	.long	0
	.long	0
	.long	0
.section .rodata
	.align 4
cH8_str:
	.byte	78
	.byte	101
	.byte	103
	.byte	97
	.byte	116
	.byte	105
	.byte	118
	.byte	101
	.byte	32
	.byte	101
	.byte	120
	.byte	112
	.byte	111
	.byte	110
	.byte	101
	.byte	110
	.byte	116
	.byte	0
.text
	.align 4,0x90
	.long	0
	.long	22
rEb_info:
.LcHh:
	leal -12(%ebp),%eax
	cmpl 84(%ebx),%eax
	jb .LcHj
	addl $8,%edi
	cmpl 92(%ebx),%edi
	ja .LcHl
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
	movl $cH8_str,-12(%ebp)
	addl $-12,%ebp
	jmp base_GHCziBase_unpackCStringzh_info
.LcHl:
	movl $8,112(%ebx)
.LcHj:
	jmp *-8(%ebx)
.section .data
	.align 4
.globl Plus2_zdszc1_srt
.type Plus2_zdszc1_srt, @object
Plus2_zdszc1_srt:
	.long	base_GHCziErr_error_closure
	.long	rEb_closure
.data
	.align 4
.globl Plus2_zdszc1_closure
.type Plus2_zdszc1_closure, @object
Plus2_zdszc1_closure:
	.long	Plus2_zdszc1_info
	.long	0
	.long	0
	.long	0
.text
	.align 4,0x90
	.long	Plus2_zdszc1_srt-(Plus2_zdszc1_info)+0
	.long	0
	.long	196630
.globl Plus2_zdszc1_info
.type Plus2_zdszc1_info, @object
Plus2_zdszc1_info:
.LcHH:
	leal -12(%ebp),%eax
	cmpl 84(%ebx),%eax
	jb .LcHJ
	addl $8,%edi
	cmpl 92(%ebx),%edi
	ja .LcHL
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
	movl $rEb_closure,-12(%ebp)
	addl $-12,%ebp
	jmp base_GHCziErr_error_info
.LcHL:
	movl $8,112(%ebx)
.LcHJ:
	jmp *-8(%ebx)
.data
	.align 4
.globl Plus2_zdszc2_closure
.type Plus2_zdszc2_closure, @object
Plus2_zdszc2_closure:
	.long	ghczmprim_GHCziTypes_Izh_static_info
	.long	1
.data
	.align 4
.globl Plus2_foo2_closure
.type Plus2_foo2_closure, @object
Plus2_foo2_closure:
	.long	integerzmgmp_GHCziIntegerziType_Szh_static_info
	.long	2
.data
	.align 4
rEg_closure:
	.long	integerzmgmp_GHCziIntegerziType_Szh_static_info
	.long	1
.data
	.align 4
rEi_closure:
	.long	rEi_info
.text
	.align 4,0x90
	.long	0
	.long	32
sEF_info:
.LcIX:
	addl $8,%edi
	cmpl 92(%ebx),%edi
	ja .LcJ4
	movl $ghczmprim_GHCziTypes_Izh_con_info,-4(%edi)
	movl %esi,0(%edi)
	leal -3(%edi),%esi
	addl $4,%ebp
	jmp *0(%ebp)
.LcJ4:
	movl $8,112(%ebx)
	jmp stg_gc_unbx_r1
.text
	.align 4,0x90
	.long	98
	.long	32
sI6_info:
.LcJ9:
	movl 8(%ebp),%eax
	imull 8(%ebp),%eax
	movl %esi,0(%ebp)
	movl %eax,-4(%ebp)
	movl $sEF_info,8(%ebp)
	addl $-4,%ebp
	jmp rEi_info
.text
	.align 4,0x90
	.long	98
	.long	32
sI7_info:
.LcJd:
	movl $Plus2_foo2_closure+1,-4(%ebp)
	movl %esi,-8(%ebp)
	movl $sI6_info,0(%ebp)
	addl $-8,%ebp
	jmp integerzmgmp_GHCziInteger_quotInteger_info
.text
	.align 4,0x90
	.long	0
	.long	32
sET_info:
.LcJC:
	addl $8,%edi
	cmpl 92(%ebx),%edi
	ja .LcJJ
	movl $ghczmprim_GHCziTypes_Izh_con_info,-4(%edi)
	movl %esi,0(%edi)
	leal -3(%edi),%esi
	addl $4,%ebp
	jmp *0(%ebp)
.LcJJ:
	movl $8,112(%ebx)
	jmp stg_gc_unbx_r1
.text
	.align 4,0x90
	.long	98
	.long	32
sIc_info:
.LcJO:
	movl 8(%ebp),%eax
	imull 8(%ebp),%eax
	movl %esi,0(%ebp)
	movl %eax,-4(%ebp)
	movl $sET_info,8(%ebp)
	addl $-4,%ebp
	jmp rEi_info
.text
	.align 4,0x90
	.long	98
	.long	32
sId_info:
.LcJS:
	movl $Plus2_foo2_closure+1,-4(%ebp)
	movl %esi,-8(%ebp)
	movl $sIc_info,0(%ebp)
	addl $-8,%ebp
	jmp integerzmgmp_GHCziInteger_quotInteger_info
.text
	.align 4,0x90
	.long	195
	.long	32
sIf_info:
.LcK1:
	testl %esi,%esi
	jne .LcK3
	addl $8,%edi
	cmpl 92(%ebx),%edi
	ja .LcK9
	movl 12(%ebp),%eax
	imull 8(%ebp),%eax
	movl $ghczmprim_GHCziTypes_Izh_con_info,-4(%edi)
	movl %eax,0(%edi)
	leal -3(%edi),%esi
	addl $16,%ebp
	jmp *0(%ebp)
.LcK3:
	movl 12(%ebp),%eax
	imull 8(%ebp),%eax
	movl %eax,8(%ebp)
	movl $rEg_closure+1,0(%ebp)
	movl 4(%ebp),%eax
	movl %eax,-4(%ebp)
	movl $sId_info,4(%ebp)
	addl $-4,%ebp
	jmp integerzmgmp_GHCziInteger_minusInteger_info
.LcK9:
	movl $8,112(%ebx)
	jmp stg_gc_unbx_r1
.text
	.align 4,0x90
	.long	98
	.long	32
sEz_info:
.LcKo:
	movl %esi,%eax
	andl $3,%eax
	cmpl $2,%eax
	jae .LcKp
	addl $8,%edi
	cmpl 92(%ebx),%edi
	ja .LcKt
	cmpl $1,3(%esi)
	jne .LcKv
	movl 8(%ebp),%eax
	imull 4(%ebp),%eax
	movl $ghczmprim_GHCziTypes_Izh_con_info,-4(%edi)
	movl %eax,0(%edi)
	leal -3(%edi),%esi
	addl $12,%ebp
	jmp *0(%ebp)
.LcKp:
	movl %esi,0(%ebp)
	movl 2(%esi),%eax
	movl %eax,4(%ebx)
	movl 6(%esi),%esi
	movl $1,8(%ebx)
	movl $sIf_info,-4(%ebp)
	addl $-4,%ebp
	jmp integer_cmm_cmpIntegerIntzh
.LcKt:
	movl $8,112(%ebx)
.LcKr:
	jmp *-8(%ebx)
.LcKv:
	movl 8(%ebp),%eax
	imull 4(%ebp),%eax
	movl %eax,4(%ebp)
	movl $rEg_closure+1,-4(%ebp)
	movl %esi,-8(%ebp)
	movl $sI7_info,0(%ebp)
	addl $-8,%ebp
	addl $-8,%edi
	jmp integerzmgmp_GHCziInteger_minusInteger_info
.text
	.align 4,0x90
	.long	131073
	.long	16
sEV_info:
.LcKG:
	leal -28(%ebp),%eax
	cmpl 84(%ebx),%eax
	jb .LcKI
	movl $stg_upd_frame_info,-8(%ebp)
	movl %esi,-4(%ebp)
	movl 16(%esi),%eax
	movl %eax,-16(%ebp)
	movl 12(%esi),%eax
	movl %eax,-12(%ebp)
	movl 8(%esi),%esi
	movl $sEz_info,-20(%ebp)
	addl $-20,%ebp
	testl $3,%esi
	jne sEz_info
	jmp *(%esi)
.LcKI:
	jmp *-8(%ebx)
.text
	.align 4,0x90
	.long	0
	.long	32
sIh_info:
.LcKY:
	movl 3(%esi),%esi
	addl $4,%ebp
	jmp *0(%ebp)
.text
	.align 4,0x90
	.long	227
	.long	32
sIl_info:
.LcL6:
	movl 4(%ebp),%eax
	imull 4(%ebp),%eax
	movl %esi,8(%ebp)
	movl %eax,4(%ebp)
	addl $4,%ebp
	jmp rEi_info
.text
	.align 4,0x90
	.long	0
	.long	32
sIm_info:
.LcLj:
	movl 3(%esi),%esi
	addl $4,%ebp
	jmp *0(%ebp)
.text
	.align 4,0x90
	.long	227
	.long	32
sIp_info:
.LcLs:
	movl 4(%ebp),%eax
	imull 4(%ebp),%eax
	movl %esi,8(%ebp)
	movl %eax,4(%ebp)
	addl $4,%ebp
	jmp rEi_info
.text
	.align 4,0x90
	.long	324
	.long	32
sIn_info:
.LcLx:
	testl %esi,%esi
	jne .LcLz
	movl $Plus2_foo2_closure+1,0(%ebp)
	movl 12(%ebp),%eax
	movl %eax,-4(%ebp)
	movl $sIp_info,4(%ebp)
	addl $-4,%ebp
	jmp integerzmgmp_GHCziInteger_quotInteger_info
.LcLz:
	movl 4(%ebp),%esi
	movl $sIm_info,16(%ebp)
	addl $16,%ebp
	testl $3,%esi
	jne sIm_info
	jmp *(%esi)
.text
	.align 4,0x90
	.long	324
	.long	32
sIj_info:
.LcLO:
	movl %esi,%eax
	andl $3,%eax
	cmpl $2,%eax
	jae .LcLP
	cmpl $0,3(%esi)
	jne .LcLR
	movl $Plus2_foo2_closure+1,0(%ebp)
	movl 12(%ebp),%eax
	movl %eax,-4(%ebp)
	movl $sIl_info,4(%ebp)
	addl $-4,%ebp
	jmp integerzmgmp_GHCziInteger_quotInteger_info
.LcLP:
	movl 2(%esi),%eax
	movl %eax,4(%ebx)
	movl 6(%esi),%esi
	movl $0,8(%ebx)
	movl $sIn_info,0(%ebp)
	jmp integer_cmm_cmpIntegerIntzh
.LcLR:
	movl 4(%ebp),%esi
	movl $sIh_info,16(%ebp)
	addl $16,%ebp
	testl $3,%esi
	jne sIh_info
	jmp *(%esi)
.text
	.align 4,0x90
	.long	196623
	.long	0
	.long	15
rEi_info:
.LcM7:
	leal -16(%ebp),%eax
	cmpl 84(%ebx),%eax
	jb .LcM9
	addl $20,%edi
	cmpl 92(%ebx),%edi
	ja .LcMb
	movl $sEV_info,-16(%edi)
	movl 4(%ebp),%eax
	movl %eax,-8(%edi)
	movl 0(%ebp),%eax
	movl %eax,-4(%edi)
	movl 8(%ebp),%eax
	movl %eax,0(%edi)
	leal -16(%edi),%eax
	movl %eax,-4(%ebp)
	movl $base_GHCziReal_even2_closure,-12(%ebp)
	movl 4(%ebp),%eax
	movl %eax,-16(%ebp)
	movl $sIj_info,-8(%ebp)
	addl $-16,%ebp
	jmp integerzmgmp_GHCziInteger_remInteger_info
.LcMb:
	movl $20,112(%ebx)
.LcM9:
	movl $rEi_closure,%esi
	jmp *-4(%ebx)
.data
	.align 4
.globl Plus2_zdwf1_closure
.type Plus2_zdwf1_closure, @object
Plus2_zdwf1_closure:
	.long	Plus2_zdwf1_info
.text
	.align 4,0x90
	.long	0
	.long	32
sFv_info:
.LcN4:
	addl $8,%edi
	cmpl 92(%ebx),%edi
	ja .LcNb
	movl $ghczmprim_GHCziTypes_Izh_con_info,-4(%edi)
	movl %esi,0(%edi)
	leal -3(%edi),%esi
	addl $4,%ebp
	jmp *0(%ebp)
.LcNb:
	movl $8,112(%ebx)
	jmp stg_gc_unbx_r1
.text
	.align 4,0x90
	.long	33
	.long	32
sMm_info:
.LcNh:
	movl 4(%ebp),%ecx
	imull 4(%ebp),%ecx
	movl 4(%ebp),%eax
	movl %eax,0(%ebp)
	movl %esi,-4(%ebp)
	movl %ecx,-8(%ebp)
	movl $sFv_info,4(%ebp)
	addl $-8,%ebp
	jmp rEi_info
.text
	.align 4,0x90
	.long	33
	.long	32
sMn_info:
.LcNm:
	movl $Plus2_foo2_closure+1,-4(%ebp)
	movl %esi,-8(%ebp)
	movl $sMm_info,0(%ebp)
	addl $-8,%ebp
	jmp integerzmgmp_GHCziInteger_quotInteger_info
.text
	.align 4,0x90
	.long	0
	.long	32
sFH_info:
.LcNJ:
	addl $8,%edi
	cmpl 92(%ebx),%edi
	ja .LcNQ
	movl $ghczmprim_GHCziTypes_Izh_con_info,-4(%edi)
	movl %esi,0(%edi)
	leal -3(%edi),%esi
	addl $4,%ebp
	jmp *0(%ebp)
.LcNQ:
	movl $8,112(%ebx)
	jmp stg_gc_unbx_r1
.text
	.align 4,0x90
	.long	33
	.long	32
sMq_info:
.LcNW:
	movl 4(%ebp),%ecx
	imull 4(%ebp),%ecx
	movl 4(%ebp),%eax
	movl %eax,0(%ebp)
	movl %esi,-4(%ebp)
	movl %ecx,-8(%ebp)
	movl $sFH_info,4(%ebp)
	addl $-8,%ebp
	jmp rEi_info
.text
	.align 4,0x90
	.long	33
	.long	32
sMr_info:
.LcO1:
	movl $Plus2_foo2_closure+1,-4(%ebp)
	movl %esi,-8(%ebp)
	movl $sMq_info,0(%ebp)
	addl $-8,%ebp
	jmp integerzmgmp_GHCziInteger_quotInteger_info
.text
	.align 4,0x90
	.long	66
	.long	32
sMs_info:
.LcO7:
	testl %esi,%esi
	jne .LcO9
	addl $8,%edi
	cmpl 92(%ebx),%edi
	ja .LcOf
	movl $ghczmprim_GHCziTypes_Izh_con_info,-4(%edi)
	movl 8(%ebp),%eax
	movl %eax,0(%edi)
	leal -3(%edi),%esi
	addl $12,%ebp
	jmp *0(%ebp)
.LcO9:
	movl $rEg_closure+1,0(%ebp)
	movl 4(%ebp),%eax
	movl %eax,-4(%ebp)
	movl $sMr_info,4(%ebp)
	addl $-4,%ebp
	jmp integerzmgmp_GHCziInteger_minusInteger_info
.LcOf:
	movl $8,112(%ebx)
	jmp stg_gc_unbx_r1
.text
	.align 4,0x90
	.long	33
	.long	32
sFr_info:
.LcOs:
	movl %esi,%eax
	andl $3,%eax
	cmpl $2,%eax
	jae .LcOt
	addl $8,%edi
	cmpl 92(%ebx),%edi
	ja .LcOx
	cmpl $1,3(%esi)
	jne .LcOz
	movl $ghczmprim_GHCziTypes_Izh_con_info,-4(%edi)
	movl 4(%ebp),%eax
	movl %eax,0(%edi)
	leal -3(%edi),%esi
	addl $8,%ebp
	jmp *0(%ebp)
.LcOt:
	movl %esi,0(%ebp)
	movl 2(%esi),%eax
	movl %eax,4(%ebx)
	movl 6(%esi),%esi
	movl $1,8(%ebx)
	movl $sMs_info,-4(%ebp)
	addl $-4,%ebp
	jmp integer_cmm_cmpIntegerIntzh
.LcOx:
	movl $8,112(%ebx)
.LcOv:
	jmp *-8(%ebx)
.LcOz:
	movl $rEg_closure+1,-4(%ebp)
	movl %esi,-8(%ebp)
	movl $sMn_info,0(%ebp)
	addl $-8,%ebp
	addl $-8,%edi
	jmp integerzmgmp_GHCziInteger_minusInteger_info
.text
	.align 4,0x90
	.long	65537
	.long	20
sFI_info:
.LcOK:
	leal -24(%ebp),%eax
	cmpl 84(%ebx),%eax
	jb .LcOM
	movl $stg_upd_frame_info,-8(%ebp)
	movl %esi,-4(%ebp)
	movl 12(%esi),%eax
	movl %eax,-12(%ebp)
	movl 8(%esi),%esi
	movl $sFr_info,-16(%ebp)
	addl $-16,%ebp
	testl $3,%esi
	jne sFr_info
	jmp *(%esi)
.LcOM:
	jmp *-8(%ebx)
.text
	.align 4,0x90
	.long	0
	.long	32
sMt_info:
.LcP1:
	movl 3(%esi),%esi
	addl $4,%ebp
	jmp *0(%ebp)
.text
	.align 4,0x90
	.long	98
	.long	32
sMw_info:
.LcP9:
	movl 4(%ebp),%eax
	imull 4(%ebp),%eax
	movl %esi,8(%ebp)
	movl %eax,4(%ebp)
	addl $4,%ebp
	jmp Plus2_zdwf1_info
.text
	.align 4,0x90
	.long	0
	.long	32
sMy_info:
.LcPm:
	movl 3(%esi),%esi
	addl $4,%ebp
	jmp *0(%ebp)
.text
	.align 4,0x90
	.long	98
	.long	32
sMA_info:
.LcPv:
	movl 4(%ebp),%eax
	imull 4(%ebp),%eax
	movl %esi,8(%ebp)
	movl %eax,4(%ebp)
	addl $4,%ebp
	jmp Plus2_zdwf1_info
.text
	.align 4,0x90
	.long	67
	.long	32
sMz_info:
.LcPA:
	testl %esi,%esi
	jne .LcPC
	movl $Plus2_foo2_closure+1,0(%ebp)
	movl 12(%ebp),%eax
	movl %eax,-4(%ebp)
	movl $sMA_info,4(%ebp)
	addl $-4,%ebp
	jmp integerzmgmp_GHCziInteger_quotInteger_info
.LcPC:
	movl 4(%ebp),%esi
	movl $sMy_info,12(%ebp)
	addl $12,%ebp
	testl $3,%esi
	jne sMy_info
	jmp *(%esi)
.text
	.align 4,0x90
	.long	67
	.long	32
sMv_info:
.LcPR:
	movl %esi,%eax
	andl $3,%eax
	cmpl $2,%eax
	jae .LcPS
	cmpl $0,3(%esi)
	jne .LcPU
	movl $Plus2_foo2_closure+1,0(%ebp)
	movl 12(%ebp),%eax
	movl %eax,-4(%ebp)
	movl $sMw_info,4(%ebp)
	addl $-4,%ebp
	jmp integerzmgmp_GHCziInteger_quotInteger_info
.LcPS:
	movl 2(%esi),%eax
	movl %eax,4(%ebx)
	movl 6(%esi),%esi
	movl $0,8(%ebx)
	movl $sMz_info,0(%ebp)
	jmp integer_cmm_cmpIntegerIntzh
.LcPU:
	movl 4(%ebp),%esi
	movl $sMt_info,12(%ebp)
	addl $12,%ebp
	testl $3,%esi
	jne sMt_info
	jmp *(%esi)
.text
	.align 4,0x90
	.long	131082
	.long	0
	.long	15
.globl Plus2_zdwf1_info
.type Plus2_zdwf1_info, @object
Plus2_zdwf1_info:
.LcQ9:
	leal -16(%ebp),%eax
	cmpl 84(%ebx),%eax
	jb .LcQb
	addl $16,%edi
	cmpl 92(%ebx),%edi
	ja .LcQd
	movl $sFI_info,-12(%edi)
	movl 4(%ebp),%eax
	movl %eax,-4(%edi)
	movl 0(%ebp),%eax
	movl %eax,0(%edi)
	leal -12(%edi),%eax
	movl %eax,-4(%ebp)
	movl $base_GHCziReal_even2_closure,-12(%ebp)
	movl 4(%ebp),%eax
	movl %eax,-16(%ebp)
	movl $sMv_info,-8(%ebp)
	addl $-16,%ebp
	jmp integerzmgmp_GHCziInteger_remInteger_info
.LcQd:
	movl $16,112(%ebx)
.LcQb:
	movl $Plus2_zdwf1_closure,%esi
	jmp *-4(%ebx)
.section .data
	.align 4
.globl Plus2_zdwzdszc_srt
.type Plus2_zdwzdszc_srt, @object
Plus2_zdwzdszc_srt:
	.long	Plus2_zdszc1_closure
.data
	.align 4
.globl Plus2_zdwzdszc_closure
.type Plus2_zdwzdszc_closure, @object
Plus2_zdwzdszc_closure:
	.long	Plus2_zdwzdszc_info
	.long	0
.text
	.align 4,0x90
	.long	0
	.long	32
sGi_info:
.LcQT:
	addl $8,%edi
	cmpl 92(%ebx),%edi
	ja .LcR0
	movl $ghczmprim_GHCziTypes_Izh_con_info,-4(%edi)
	movl %esi,0(%edi)
	leal -3(%edi),%esi
	addl $4,%ebp
	jmp *0(%ebp)
.LcR0:
	movl $8,112(%ebx)
	jmp stg_gc_unbx_r1
.text
	.align 4,0x90
	.long	1
	.long	32
sQm_info:
.LcR6:
	movl 4(%ebp),%eax
	movl %eax,0(%ebp)
	movl 3(%esi),%eax
	movl %eax,-4(%ebp)
	movl $sGi_info,4(%ebp)
	addl $-4,%ebp
	jmp Plus2_zdwf1_info
.text
	.align 4,0x90
	.long	0
	.long	32
sGu_info:
.LcRp:
	addl $8,%edi
	cmpl 92(%ebx),%edi
	ja .LcRw
	movl $ghczmprim_GHCziTypes_Izh_con_info,-4(%edi)
	movl %esi,0(%edi)
	leal -3(%edi),%esi
	addl $4,%ebp
	jmp *0(%ebp)
.LcRw:
	movl $8,112(%ebx)
	jmp stg_gc_unbx_r1
.text
	.align 4,0x90
	.long	66
	.long	32
sQo_info:
.LcRB:
	movl 3(%esi),%eax
	movl %eax,0(%ebp)
	movl $sGu_info,8(%ebp)
	jmp Plus2_zdwf1_info
.text
	.align 4,0x90
	.long	2
	.long	32
sQp_info:
.LcRG:
	testl %esi,%esi
	jne .LcRI
	movl $Plus2_zdszc2_closure+1,%esi
	addl $12,%ebp
	jmp *0(%ebp)
.LcRI:
	movl 8(%ebp),%esi
	movl $sQo_info,0(%ebp)
	testl $3,%esi
	jne sQo_info
	jmp *(%esi)
.text
	.align 4,0x90
	.long	1
	.long	32
sGg_info:
.LcRY:
	movl %esi,%eax
	andl $3,%eax
	cmpl $2,%eax
	jae .LcRZ
	cmpl $0,3(%esi)
	jne .LcS1
	movl $Plus2_zdszc2_closure+1,%esi
	addl $8,%ebp
	jmp *0(%ebp)
.LcRZ:
	movl %esi,0(%ebp)
	movl 2(%esi),%eax
	movl %eax,4(%ebx)
	movl 6(%esi),%esi
	movl $0,8(%ebx)
	movl $sQp_info,-4(%ebp)
	addl $-4,%ebp
	jmp integer_cmm_cmpIntegerIntzh
.LcS1:
	movl 4(%ebp),%eax
	movl %esi,4(%ebp)
	movl %eax,%esi
	movl $sQm_info,0(%ebp)
	testl $3,%esi
	jne sQm_info
	jmp *(%esi)
.text
	.align 4,0x90
	.long	2
	.long	19
sGv_info:
.LcSd:
	leal -20(%ebp),%eax
	cmpl 84(%ebx),%eax
	jb .LcSf
	movl $stg_upd_frame_info,-8(%ebp)
	movl %esi,-4(%ebp)
	movl 12(%esi),%eax
	movl %eax,-12(%ebp)
	movl 8(%esi),%esi
	movl $sGg_info,-16(%ebp)
	addl $-16,%ebp
	testl $3,%esi
	jne sGg_info
	jmp *(%esi)
.LcSf:
	jmp *-8(%ebx)
.text
	.align 4,0x90
	.long	0
	.long	32
sQq_info:
.LcSv:
	movl 3(%esi),%esi
	addl $4,%ebp
	jmp *0(%ebp)
.text
	.align 4,0x90
	.long	0
	.long	32
sQt_info:
.LcSL:
	movl 3(%esi),%esi
	addl $4,%ebp
	jmp *0(%ebp)
.text
	.align 4,0x90
	.long	Plus2_zdwzdszc_srt-(sGK_info)+0
	.long	1
	.long	65568
sGK_info:
.LcSR:
	testl %esi,%esi
	jl .LcST
	movl 4(%ebp),%esi
	movl $sQt_info,4(%ebp)
	addl $4,%ebp
	testl $3,%esi
	jne sQt_info
	jmp *(%esi)
.LcST:
	movl $Plus2_zdszc1_closure,%esi
	addl $8,%ebp
	andl $-4,%esi
	jmp *(%esi)
.text
	.align 4,0x90
	.long	Plus2_zdwzdszc_srt-(sQs_info)+0
	.long	1
	.long	65568
sQs_info:
.LcT8:
	movl %esi,%eax
	andl $3,%eax
	cmpl $2,%eax
	jae .LcT9
	cmpl $0,3(%esi)
	jl .LcTb
	movl 4(%ebp),%esi
	movl $sQq_info,4(%ebp)
	addl $4,%ebp
	testl $3,%esi
	jne sQq_info
	jmp *(%esi)
.LcT9:
	movl 2(%esi),%eax
	movl %eax,4(%ebx)
	movl 6(%esi),%esi
	movl $0,8(%ebx)
	movl $sGK_info,0(%ebp)
	jmp integer_cmm_cmpIntegerIntzh
.LcTb:
	movl $Plus2_zdszc1_closure,%esi
	addl $8,%ebp
	andl $-4,%esi
	jmp *(%esi)
.text
	.align 4,0x90
	.long	Plus2_zdwzdszc_srt-(Plus2_zdwzdszc_info)+0
	.long	131084
	.long	0
	.long	65551
.globl Plus2_zdwzdszc_info
.type Plus2_zdwzdszc_info, @object
Plus2_zdwzdszc_info:
.LcTn:
	addl $16,%edi
	cmpl 92(%ebx),%edi
	ja .LcTr
	movl $sGv_info,-12(%edi)
	movl 4(%ebp),%eax
	movl %eax,-4(%edi)
	movl 0(%ebp),%eax
	movl %eax,0(%edi)
	movl 4(%ebp),%esi
	leal -12(%edi),%eax
	movl %eax,4(%ebp)
	movl $sQs_info,0(%ebp)
	testl $3,%esi
	jne sQs_info
	jmp *(%esi)
.LcTr:
	movl $16,112(%ebx)
.LcTp:
	movl $Plus2_zdwzdszc_closure,%esi
	jmp *-4(%ebx)
.section .data
	.align 4
.globl Plus2_zdszc_srt
.type Plus2_zdszc_srt, @object
Plus2_zdszc_srt:
	.long	Plus2_zdszc1_closure
.data
	.align 4
.globl Plus2_zdszc_closure
.type Plus2_zdszc_closure, @object
Plus2_zdszc_closure:
	.long	Plus2_zdszc_info
	.long	0
.text
	.align 4,0x90
	.long	0
	.long	32
sGU_info:
.LcTN:
	addl $8,%edi
	cmpl 92(%ebx),%edi
	ja .LcTU
	movl $ghczmprim_GHCziTypes_Izh_con_info,-4(%edi)
	movl %esi,0(%edi)
	leal -3(%edi),%esi
	addl $4,%ebp
	jmp *0(%ebp)
.LcTU:
	movl $8,112(%ebx)
	jmp stg_gc_unbx_r1
.text
	.align 4,0x90
	.long	Plus2_zdszc_srt-(Plus2_zdszc_info)+0
	.long	131084
	.long	0
	.long	65551
.globl Plus2_zdszc_info
.type Plus2_zdszc_info, @object
Plus2_zdszc_info:
.LcU1:
	leal -4(%ebp),%eax
	cmpl 84(%ebx),%eax
	jb .LcU3
	movl 0(%ebp),%eax
	movl %eax,-4(%ebp)
	movl 4(%ebp),%eax
	movl %eax,0(%ebp)
	movl $sGU_info,4(%ebp)
	addl $-4,%ebp
	jmp Plus2_zdwzdszc_info
.LcU3:
	movl $Plus2_zdszc_closure,%esi
	jmp *-4(%ebx)
.data
	.align 4
.globl Plus2_foo1_closure
.type Plus2_foo1_closure, @object
Plus2_foo1_closure:
	.long	Plus2_foo1_info
	.long	0
	.long	0
	.long	0
.text
	.align 4,0x90
	.long	0
	.long	22
.globl Plus2_foo1_info
.type Plus2_foo1_info, @object
Plus2_foo1_info:
.LcUm:
	leal -8(%ebp),%eax
	cmpl 84(%ebx),%eax
	jb .LcUo
	addl $8,%edi
	cmpl 92(%ebx),%edi
	ja .LcUq
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
	movl $Plus2_foo2_closure+1,%esi
	addl $-8,%ebp
	jmp *0(%ebp)
.LcUq:
	movl $8,112(%ebx)
.LcUo:
	jmp *-8(%ebx)
.section .data
	.align 4
.globl Plus2_foo_srt
.type Plus2_foo_srt, @object
Plus2_foo_srt:
	.long	Plus2_zdszc1_closure
.data
	.align 4
.globl Plus2_foo_closure
.type Plus2_foo_closure, @object
Plus2_foo_closure:
	.long	Plus2_foo_info
	.long	0
.text
	.align 4,0x90
	.long	0
	.long	32
sGY_info:
.LcUL:
	addl $8,%edi
	cmpl 92(%ebx),%edi
	ja .LcUS
	leal 2(%esi),%eax
	movl $ghczmprim_GHCziTypes_Izh_con_info,-4(%edi)
	movl %eax,0(%edi)
	leal -3(%edi),%esi
	addl $4,%ebp
	jmp *0(%ebp)
.LcUS:
	movl $8,112(%ebx)
	jmp stg_gc_unbx_r1
.text
	.align 4,0x90
	.long	Plus2_foo_srt-(Plus2_foo_info)+0
	.long	65541
	.long	0
	.long	65551
.globl Plus2_foo_info
.type Plus2_foo_info, @object
Plus2_foo_info:
.LcUY:
	leal -8(%ebp),%eax
	cmpl 84(%ebx),%eax
	jb .LcV0
	movl $Plus2_foo2_closure+1,-4(%ebp)
	movl 0(%ebp),%eax
	movl %eax,-8(%ebp)
	movl $sGY_info,0(%ebp)
	addl $-8,%ebp
	jmp Plus2_zdwzdszc_info
.LcV0:
	movl $Plus2_foo_closure,%esi
	jmp *-4(%ebx)
.data
	.align 4
_module_registered:
	.long	0
.text
	.align 4,0x90
.globl __stginit_Plus2_
.type __stginit_Plus2_, @object
__stginit_Plus2_:
.LcVc:
	cmpl $0,_module_registered
	jne .LcVd
.LcVe:
	movl $1,_module_registered
	addl $-4,%ebp
	movl $__stginit_base_Prelude_,(%ebp)
.LcVd:
	addl $4,%ebp
	jmp *-4(%ebp)
.text
	.align 4,0x90
.globl __stginit_Plus2
.type __stginit_Plus2, @object
__stginit_Plus2:
.LcVi:
	jmp __stginit_Plus2_
.section .note.GNU-stack,"",@progbits
.ident "GHC 7.0.4"
