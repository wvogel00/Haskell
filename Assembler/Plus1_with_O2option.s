.data
	.align 4
.globl Plus1_foo2_closure
.type Plus1_foo2_closure, @object
Plus1_foo2_closure:
	.long	integerzmgmp_GHCziIntegerziType_Szh_static_info
	.long	2
.data
	.align 4
rEz_closure:
	.long	rEz_info
	.long	0
	.long	0
	.long	0
.section .rodata
	.align 4
cHD_str:
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
rEz_info:
.LcHM:
	leal -12(%ebp),%eax
	cmpl 84(%ebx),%eax
	jb .LcHO
	addl $8,%edi
	cmpl 92(%ebx),%edi
	ja .LcHQ
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
	movl $cHD_str,-12(%ebp)
	addl $-12,%ebp
	jmp base_GHCziBase_unpackCStringzh_info
.LcHQ:
	movl $8,112(%ebx)
.LcHO:
	jmp *-8(%ebx)
.section .data
	.align 4
.globl Plus1_zdszc1_srt
.type Plus1_zdszc1_srt, @object
Plus1_zdszc1_srt:
	.long	base_GHCziErr_error_closure
	.long	rEz_closure
.data
	.align 4
.globl Plus1_zdszc1_closure
.type Plus1_zdszc1_closure, @object
Plus1_zdszc1_closure:
	.long	Plus1_zdszc1_info
	.long	0
	.long	0
	.long	0
.text
	.align 4,0x90
	.long	Plus1_zdszc1_srt-(Plus1_zdszc1_info)+0
	.long	0
	.long	196630
.globl Plus1_zdszc1_info
.type Plus1_zdszc1_info, @object
Plus1_zdszc1_info:
.LcIc:
	leal -12(%ebp),%eax
	cmpl 84(%ebx),%eax
	jb .LcIe
	addl $8,%edi
	cmpl 92(%ebx),%edi
	ja .LcIg
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
	movl $rEz_closure,-12(%ebp)
	addl $-12,%ebp
	jmp base_GHCziErr_error_info
.LcIg:
	movl $8,112(%ebx)
.LcIe:
	jmp *-8(%ebx)
.data
	.align 4
.globl Plus1_zdszc2_closure
.type Plus1_zdszc2_closure, @object
Plus1_zdszc2_closure:
	.long	ghczmprim_GHCziTypes_Izh_static_info
	.long	1
.data
	.align 4
rED_closure:
	.long	integerzmgmp_GHCziIntegerziType_Szh_static_info
	.long	1
.data
	.align 4
rEF_closure:
	.long	rEF_info
.text
	.align 4,0x90
	.long	0
	.long	32
sF2_info:
.LcJn:
	addl $8,%edi
	cmpl 92(%ebx),%edi
	ja .LcJu
	movl $ghczmprim_GHCziTypes_Izh_con_info,-4(%edi)
	movl %esi,0(%edi)
	leal -3(%edi),%esi
	addl $4,%ebp
	jmp *0(%ebp)
.LcJu:
	movl $8,112(%ebx)
	jmp stg_gc_unbx_r1
.text
	.align 4,0x90
	.long	98
	.long	32
sIx_info:
.LcJz:
	movl 8(%ebp),%eax
	imull 8(%ebp),%eax
	movl %esi,0(%ebp)
	movl %eax,-4(%ebp)
	movl $sF2_info,8(%ebp)
	addl $-4,%ebp
	jmp rEF_info
.text
	.align 4,0x90
	.long	98
	.long	32
sIy_info:
.LcJD:
	movl $Plus1_foo2_closure+1,-4(%ebp)
	movl %esi,-8(%ebp)
	movl $sIx_info,0(%ebp)
	addl $-8,%ebp
	jmp integerzmgmp_GHCziInteger_quotInteger_info
.text
	.align 4,0x90
	.long	0
	.long	32
sFg_info:
.LcK2:
	addl $8,%edi
	cmpl 92(%ebx),%edi
	ja .LcK9
	movl $ghczmprim_GHCziTypes_Izh_con_info,-4(%edi)
	movl %esi,0(%edi)
	leal -3(%edi),%esi
	addl $4,%ebp
	jmp *0(%ebp)
.LcK9:
	movl $8,112(%ebx)
	jmp stg_gc_unbx_r1
.text
	.align 4,0x90
	.long	98
	.long	32
sID_info:
.LcKe:
	movl 8(%ebp),%eax
	imull 8(%ebp),%eax
	movl %esi,0(%ebp)
	movl %eax,-4(%ebp)
	movl $sFg_info,8(%ebp)
	addl $-4,%ebp
	jmp rEF_info
.text
	.align 4,0x90
	.long	98
	.long	32
sIE_info:
.LcKi:
	movl $Plus1_foo2_closure+1,-4(%ebp)
	movl %esi,-8(%ebp)
	movl $sID_info,0(%ebp)
	addl $-8,%ebp
	jmp integerzmgmp_GHCziInteger_quotInteger_info
.text
	.align 4,0x90
	.long	195
	.long	32
sIG_info:
.LcKr:
	testl %esi,%esi
	jne .LcKt
	addl $8,%edi
	cmpl 92(%ebx),%edi
	ja .LcKz
	movl 12(%ebp),%eax
	imull 8(%ebp),%eax
	movl $ghczmprim_GHCziTypes_Izh_con_info,-4(%edi)
	movl %eax,0(%edi)
	leal -3(%edi),%esi
	addl $16,%ebp
	jmp *0(%ebp)
.LcKt:
	movl 12(%ebp),%eax
	imull 8(%ebp),%eax
	movl %eax,8(%ebp)
	movl $rED_closure+1,0(%ebp)
	movl 4(%ebp),%eax
	movl %eax,-4(%ebp)
	movl $sIE_info,4(%ebp)
	addl $-4,%ebp
	jmp integerzmgmp_GHCziInteger_minusInteger_info
.LcKz:
	movl $8,112(%ebx)
	jmp stg_gc_unbx_r1
.text
	.align 4,0x90
	.long	98
	.long	32
sEW_info:
.LcKO:
	movl %esi,%eax
	andl $3,%eax
	cmpl $2,%eax
	jae .LcKP
	addl $8,%edi
	cmpl 92(%ebx),%edi
	ja .LcKT
	cmpl $1,3(%esi)
	jne .LcKV
	movl 8(%ebp),%eax
	imull 4(%ebp),%eax
	movl $ghczmprim_GHCziTypes_Izh_con_info,-4(%edi)
	movl %eax,0(%edi)
	leal -3(%edi),%esi
	addl $12,%ebp
	jmp *0(%ebp)
.LcKP:
	movl %esi,0(%ebp)
	movl 2(%esi),%eax
	movl %eax,4(%ebx)
	movl 6(%esi),%esi
	movl $1,8(%ebx)
	movl $sIG_info,-4(%ebp)
	addl $-4,%ebp
	jmp integer_cmm_cmpIntegerIntzh
.LcKT:
	movl $8,112(%ebx)
.LcKR:
	jmp *-8(%ebx)
.LcKV:
	movl 8(%ebp),%eax
	imull 4(%ebp),%eax
	movl %eax,4(%ebp)
	movl $rED_closure+1,-4(%ebp)
	movl %esi,-8(%ebp)
	movl $sIy_info,0(%ebp)
	addl $-8,%ebp
	addl $-8,%edi
	jmp integerzmgmp_GHCziInteger_minusInteger_info
.text
	.align 4,0x90
	.long	131073
	.long	16
sFi_info:
.LcL6:
	leal -28(%ebp),%eax
	cmpl 84(%ebx),%eax
	jb .LcL8
	movl $stg_upd_frame_info,-8(%ebp)
	movl %esi,-4(%ebp)
	movl 16(%esi),%eax
	movl %eax,-16(%ebp)
	movl 12(%esi),%eax
	movl %eax,-12(%ebp)
	movl 8(%esi),%esi
	movl $sEW_info,-20(%ebp)
	addl $-20,%ebp
	testl $3,%esi
	jne sEW_info
	jmp *(%esi)
.LcL8:
	jmp *-8(%ebx)
.text
	.align 4,0x90
	.long	0
	.long	32
sII_info:
.LcLo:
	movl 3(%esi),%esi
	addl $4,%ebp
	jmp *0(%ebp)
.text
	.align 4,0x90
	.long	227
	.long	32
sIM_info:
.LcLw:
	movl 4(%ebp),%eax
	imull 4(%ebp),%eax
	movl %esi,8(%ebp)
	movl %eax,4(%ebp)
	addl $4,%ebp
	jmp rEF_info
.text
	.align 4,0x90
	.long	0
	.long	32
sIN_info:
.LcLJ:
	movl 3(%esi),%esi
	addl $4,%ebp
	jmp *0(%ebp)
.text
	.align 4,0x90
	.long	227
	.long	32
sIQ_info:
.LcLS:
	movl 4(%ebp),%eax
	imull 4(%ebp),%eax
	movl %esi,8(%ebp)
	movl %eax,4(%ebp)
	addl $4,%ebp
	jmp rEF_info
.text
	.align 4,0x90
	.long	324
	.long	32
sIO_info:
.LcLX:
	testl %esi,%esi
	jne .LcLZ
	movl $Plus1_foo2_closure+1,0(%ebp)
	movl 12(%ebp),%eax
	movl %eax,-4(%ebp)
	movl $sIQ_info,4(%ebp)
	addl $-4,%ebp
	jmp integerzmgmp_GHCziInteger_quotInteger_info
.LcLZ:
	movl 4(%ebp),%esi
	movl $sIN_info,16(%ebp)
	addl $16,%ebp
	testl $3,%esi
	jne sIN_info
	jmp *(%esi)
.text
	.align 4,0x90
	.long	324
	.long	32
sIK_info:
.LcMe:
	movl %esi,%eax
	andl $3,%eax
	cmpl $2,%eax
	jae .LcMf
	cmpl $0,3(%esi)
	jne .LcMh
	movl $Plus1_foo2_closure+1,0(%ebp)
	movl 12(%ebp),%eax
	movl %eax,-4(%ebp)
	movl $sIM_info,4(%ebp)
	addl $-4,%ebp
	jmp integerzmgmp_GHCziInteger_quotInteger_info
.LcMf:
	movl 2(%esi),%eax
	movl %eax,4(%ebx)
	movl 6(%esi),%esi
	movl $0,8(%ebx)
	movl $sIO_info,0(%ebp)
	jmp integer_cmm_cmpIntegerIntzh
.LcMh:
	movl 4(%ebp),%esi
	movl $sII_info,16(%ebp)
	addl $16,%ebp
	testl $3,%esi
	jne sII_info
	jmp *(%esi)
.text
	.align 4,0x90
	.long	196623
	.long	0
	.long	15
rEF_info:
.LcMx:
	leal -16(%ebp),%eax
	cmpl 84(%ebx),%eax
	jb .LcMz
	addl $20,%edi
	cmpl 92(%ebx),%edi
	ja .LcMB
	movl $sFi_info,-16(%edi)
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
	movl $sIK_info,-8(%ebp)
	addl $-16,%ebp
	jmp integerzmgmp_GHCziInteger_remInteger_info
.LcMB:
	movl $20,112(%ebx)
.LcMz:
	movl $rEF_closure,%esi
	jmp *-4(%ebx)
.data
	.align 4
.globl Plus1_zdwf1_closure
.type Plus1_zdwf1_closure, @object
Plus1_zdwf1_closure:
	.long	Plus1_zdwf1_info
.text
	.align 4,0x90
	.long	0
	.long	32
sFS_info:
.LcNu:
	addl $8,%edi
	cmpl 92(%ebx),%edi
	ja .LcNB
	movl $ghczmprim_GHCziTypes_Izh_con_info,-4(%edi)
	movl %esi,0(%edi)
	leal -3(%edi),%esi
	addl $4,%ebp
	jmp *0(%ebp)
.LcNB:
	movl $8,112(%ebx)
	jmp stg_gc_unbx_r1
.text
	.align 4,0x90
	.long	33
	.long	32
sMM_info:
.LcNH:
	movl 4(%ebp),%ecx
	imull 4(%ebp),%ecx
	movl 4(%ebp),%eax
	movl %eax,0(%ebp)
	movl %esi,-4(%ebp)
	movl %ecx,-8(%ebp)
	movl $sFS_info,4(%ebp)
	addl $-8,%ebp
	jmp rEF_info
.text
	.align 4,0x90
	.long	33
	.long	32
sMN_info:
.LcNM:
	movl $Plus1_foo2_closure+1,-4(%ebp)
	movl %esi,-8(%ebp)
	movl $sMM_info,0(%ebp)
	addl $-8,%ebp
	jmp integerzmgmp_GHCziInteger_quotInteger_info
.text
	.align 4,0x90
	.long	0
	.long	32
sG4_info:
.LcO9:
	addl $8,%edi
	cmpl 92(%ebx),%edi
	ja .LcOg
	movl $ghczmprim_GHCziTypes_Izh_con_info,-4(%edi)
	movl %esi,0(%edi)
	leal -3(%edi),%esi
	addl $4,%ebp
	jmp *0(%ebp)
.LcOg:
	movl $8,112(%ebx)
	jmp stg_gc_unbx_r1
.text
	.align 4,0x90
	.long	33
	.long	32
sMQ_info:
.LcOm:
	movl 4(%ebp),%ecx
	imull 4(%ebp),%ecx
	movl 4(%ebp),%eax
	movl %eax,0(%ebp)
	movl %esi,-4(%ebp)
	movl %ecx,-8(%ebp)
	movl $sG4_info,4(%ebp)
	addl $-8,%ebp
	jmp rEF_info
.text
	.align 4,0x90
	.long	33
	.long	32
sMR_info:
.LcOr:
	movl $Plus1_foo2_closure+1,-4(%ebp)
	movl %esi,-8(%ebp)
	movl $sMQ_info,0(%ebp)
	addl $-8,%ebp
	jmp integerzmgmp_GHCziInteger_quotInteger_info
.text
	.align 4,0x90
	.long	66
	.long	32
sMS_info:
.LcOx:
	testl %esi,%esi
	jne .LcOz
	addl $8,%edi
	cmpl 92(%ebx),%edi
	ja .LcOF
	movl $ghczmprim_GHCziTypes_Izh_con_info,-4(%edi)
	movl 8(%ebp),%eax
	movl %eax,0(%edi)
	leal -3(%edi),%esi
	addl $12,%ebp
	jmp *0(%ebp)
.LcOz:
	movl $rED_closure+1,0(%ebp)
	movl 4(%ebp),%eax
	movl %eax,-4(%ebp)
	movl $sMR_info,4(%ebp)
	addl $-4,%ebp
	jmp integerzmgmp_GHCziInteger_minusInteger_info
.LcOF:
	movl $8,112(%ebx)
	jmp stg_gc_unbx_r1
.text
	.align 4,0x90
	.long	33
	.long	32
sFO_info:
.LcOS:
	movl %esi,%eax
	andl $3,%eax
	cmpl $2,%eax
	jae .LcOT
	addl $8,%edi
	cmpl 92(%ebx),%edi
	ja .LcOX
	cmpl $1,3(%esi)
	jne .LcOZ
	movl $ghczmprim_GHCziTypes_Izh_con_info,-4(%edi)
	movl 4(%ebp),%eax
	movl %eax,0(%edi)
	leal -3(%edi),%esi
	addl $8,%ebp
	jmp *0(%ebp)
.LcOT:
	movl %esi,0(%ebp)
	movl 2(%esi),%eax
	movl %eax,4(%ebx)
	movl 6(%esi),%esi
	movl $1,8(%ebx)
	movl $sMS_info,-4(%ebp)
	addl $-4,%ebp
	jmp integer_cmm_cmpIntegerIntzh
.LcOX:
	movl $8,112(%ebx)
.LcOV:
	jmp *-8(%ebx)
.LcOZ:
	movl $rED_closure+1,-4(%ebp)
	movl %esi,-8(%ebp)
	movl $sMN_info,0(%ebp)
	addl $-8,%ebp
	addl $-8,%edi
	jmp integerzmgmp_GHCziInteger_minusInteger_info
.text
	.align 4,0x90
	.long	65537
	.long	20
sG5_info:
.LcPa:
	leal -24(%ebp),%eax
	cmpl 84(%ebx),%eax
	jb .LcPc
	movl $stg_upd_frame_info,-8(%ebp)
	movl %esi,-4(%ebp)
	movl 12(%esi),%eax
	movl %eax,-12(%ebp)
	movl 8(%esi),%esi
	movl $sFO_info,-16(%ebp)
	addl $-16,%ebp
	testl $3,%esi
	jne sFO_info
	jmp *(%esi)
.LcPc:
	jmp *-8(%ebx)
.text
	.align 4,0x90
	.long	0
	.long	32
sMT_info:
.LcPr:
	movl 3(%esi),%esi
	addl $4,%ebp
	jmp *0(%ebp)
.text
	.align 4,0x90
	.long	98
	.long	32
sMW_info:
.LcPz:
	movl 4(%ebp),%eax
	imull 4(%ebp),%eax
	movl %esi,8(%ebp)
	movl %eax,4(%ebp)
	addl $4,%ebp
	jmp Plus1_zdwf1_info
.text
	.align 4,0x90
	.long	0
	.long	32
sMY_info:
.LcPM:
	movl 3(%esi),%esi
	addl $4,%ebp
	jmp *0(%ebp)
.text
	.align 4,0x90
	.long	98
	.long	32
sN0_info:
.LcPV:
	movl 4(%ebp),%eax
	imull 4(%ebp),%eax
	movl %esi,8(%ebp)
	movl %eax,4(%ebp)
	addl $4,%ebp
	jmp Plus1_zdwf1_info
.text
	.align 4,0x90
	.long	67
	.long	32
sMZ_info:
.LcQ0:
	testl %esi,%esi
	jne .LcQ2
	movl $Plus1_foo2_closure+1,0(%ebp)
	movl 12(%ebp),%eax
	movl %eax,-4(%ebp)
	movl $sN0_info,4(%ebp)
	addl $-4,%ebp
	jmp integerzmgmp_GHCziInteger_quotInteger_info
.LcQ2:
	movl 4(%ebp),%esi
	movl $sMY_info,12(%ebp)
	addl $12,%ebp
	testl $3,%esi
	jne sMY_info
	jmp *(%esi)
.text
	.align 4,0x90
	.long	67
	.long	32
sMV_info:
.LcQh:
	movl %esi,%eax
	andl $3,%eax
	cmpl $2,%eax
	jae .LcQi
	cmpl $0,3(%esi)
	jne .LcQk
	movl $Plus1_foo2_closure+1,0(%ebp)
	movl 12(%ebp),%eax
	movl %eax,-4(%ebp)
	movl $sMW_info,4(%ebp)
	addl $-4,%ebp
	jmp integerzmgmp_GHCziInteger_quotInteger_info
.LcQi:
	movl 2(%esi),%eax
	movl %eax,4(%ebx)
	movl 6(%esi),%esi
	movl $0,8(%ebx)
	movl $sMZ_info,0(%ebp)
	jmp integer_cmm_cmpIntegerIntzh
.LcQk:
	movl 4(%ebp),%esi
	movl $sMT_info,12(%ebp)
	addl $12,%ebp
	testl $3,%esi
	jne sMT_info
	jmp *(%esi)
.text
	.align 4,0x90
	.long	131082
	.long	0
	.long	15
.globl Plus1_zdwf1_info
.type Plus1_zdwf1_info, @object
Plus1_zdwf1_info:
.LcQz:
	leal -16(%ebp),%eax
	cmpl 84(%ebx),%eax
	jb .LcQB
	addl $16,%edi
	cmpl 92(%ebx),%edi
	ja .LcQD
	movl $sG5_info,-12(%edi)
	movl 4(%ebp),%eax
	movl %eax,-4(%edi)
	movl 0(%ebp),%eax
	movl %eax,0(%edi)
	leal -12(%edi),%eax
	movl %eax,-4(%ebp)
	movl $base_GHCziReal_even2_closure,-12(%ebp)
	movl 4(%ebp),%eax
	movl %eax,-16(%ebp)
	movl $sMV_info,-8(%ebp)
	addl $-16,%ebp
	jmp integerzmgmp_GHCziInteger_remInteger_info
.LcQD:
	movl $16,112(%ebx)
.LcQB:
	movl $Plus1_zdwf1_closure,%esi
	jmp *-4(%ebx)
.section .data
	.align 4
.globl Plus1_zdwzdszc_srt
.type Plus1_zdwzdszc_srt, @object
Plus1_zdwzdszc_srt:
	.long	Plus1_zdszc1_closure
.data
	.align 4
.globl Plus1_zdwzdszc_closure
.type Plus1_zdwzdszc_closure, @object
Plus1_zdwzdszc_closure:
	.long	Plus1_zdwzdszc_info
	.long	0
.text
	.align 4,0x90
	.long	0
	.long	32
sGF_info:
.LcRj:
	addl $8,%edi
	cmpl 92(%ebx),%edi
	ja .LcRq
	movl $ghczmprim_GHCziTypes_Izh_con_info,-4(%edi)
	movl %esi,0(%edi)
	leal -3(%edi),%esi
	addl $4,%ebp
	jmp *0(%ebp)
.LcRq:
	movl $8,112(%ebx)
	jmp stg_gc_unbx_r1
.text
	.align 4,0x90
	.long	1
	.long	32
sQM_info:
.LcRw:
	movl 4(%ebp),%eax
	movl %eax,0(%ebp)
	movl 3(%esi),%eax
	movl %eax,-4(%ebp)
	movl $sGF_info,4(%ebp)
	addl $-4,%ebp
	jmp Plus1_zdwf1_info
.text
	.align 4,0x90
	.long	0
	.long	32
sGR_info:
.LcRP:
	addl $8,%edi
	cmpl 92(%ebx),%edi
	ja .LcRW
	movl $ghczmprim_GHCziTypes_Izh_con_info,-4(%edi)
	movl %esi,0(%edi)
	leal -3(%edi),%esi
	addl $4,%ebp
	jmp *0(%ebp)
.LcRW:
	movl $8,112(%ebx)
	jmp stg_gc_unbx_r1
.text
	.align 4,0x90
	.long	66
	.long	32
sQO_info:
.LcS1:
	movl 3(%esi),%eax
	movl %eax,0(%ebp)
	movl $sGR_info,8(%ebp)
	jmp Plus1_zdwf1_info
.text
	.align 4,0x90
	.long	2
	.long	32
sQP_info:
.LcS6:
	testl %esi,%esi
	jne .LcS8
	movl $Plus1_zdszc2_closure+1,%esi
	addl $12,%ebp
	jmp *0(%ebp)
.LcS8:
	movl 8(%ebp),%esi
	movl $sQO_info,0(%ebp)
	testl $3,%esi
	jne sQO_info
	jmp *(%esi)
.text
	.align 4,0x90
	.long	1
	.long	32
sGD_info:
.LcSo:
	movl %esi,%eax
	andl $3,%eax
	cmpl $2,%eax
	jae .LcSp
	cmpl $0,3(%esi)
	jne .LcSr
	movl $Plus1_zdszc2_closure+1,%esi
	addl $8,%ebp
	jmp *0(%ebp)
.LcSp:
	movl %esi,0(%ebp)
	movl 2(%esi),%eax
	movl %eax,4(%ebx)
	movl 6(%esi),%esi
	movl $0,8(%ebx)
	movl $sQP_info,-4(%ebp)
	addl $-4,%ebp
	jmp integer_cmm_cmpIntegerIntzh
.LcSr:
	movl 4(%ebp),%eax
	movl %esi,4(%ebp)
	movl %eax,%esi
	movl $sQM_info,0(%ebp)
	testl $3,%esi
	jne sQM_info
	jmp *(%esi)
.text
	.align 4,0x90
	.long	2
	.long	19
sGS_info:
.LcSD:
	leal -20(%ebp),%eax
	cmpl 84(%ebx),%eax
	jb .LcSF
	movl $stg_upd_frame_info,-8(%ebp)
	movl %esi,-4(%ebp)
	movl 12(%esi),%eax
	movl %eax,-12(%ebp)
	movl 8(%esi),%esi
	movl $sGD_info,-16(%ebp)
	addl $-16,%ebp
	testl $3,%esi
	jne sGD_info
	jmp *(%esi)
.LcSF:
	jmp *-8(%ebx)
.text
	.align 4,0x90
	.long	0
	.long	32
sQQ_info:
.LcSV:
	movl 3(%esi),%esi
	addl $4,%ebp
	jmp *0(%ebp)
.text
	.align 4,0x90
	.long	0
	.long	32
sQT_info:
.LcTb:
	movl 3(%esi),%esi
	addl $4,%ebp
	jmp *0(%ebp)
.text
	.align 4,0x90
	.long	Plus1_zdwzdszc_srt-(sH7_info)+0
	.long	1
	.long	65568
sH7_info:
.LcTh:
	testl %esi,%esi
	jl .LcTj
	movl 4(%ebp),%esi
	movl $sQT_info,4(%ebp)
	addl $4,%ebp
	testl $3,%esi
	jne sQT_info
	jmp *(%esi)
.LcTj:
	movl $Plus1_zdszc1_closure,%esi
	addl $8,%ebp
	andl $-4,%esi
	jmp *(%esi)
.text
	.align 4,0x90
	.long	Plus1_zdwzdszc_srt-(sQS_info)+0
	.long	1
	.long	65568
sQS_info:
.LcTy:
	movl %esi,%eax
	andl $3,%eax
	cmpl $2,%eax
	jae .LcTz
	cmpl $0,3(%esi)
	jl .LcTB
	movl 4(%ebp),%esi
	movl $sQQ_info,4(%ebp)
	addl $4,%ebp
	testl $3,%esi
	jne sQQ_info
	jmp *(%esi)
.LcTz:
	movl 2(%esi),%eax
	movl %eax,4(%ebx)
	movl 6(%esi),%esi
	movl $0,8(%ebx)
	movl $sH7_info,0(%ebp)
	jmp integer_cmm_cmpIntegerIntzh
.LcTB:
	movl $Plus1_zdszc1_closure,%esi
	addl $8,%ebp
	andl $-4,%esi
	jmp *(%esi)
.text
	.align 4,0x90
	.long	Plus1_zdwzdszc_srt-(Plus1_zdwzdszc_info)+0
	.long	131084
	.long	0
	.long	65551
.globl Plus1_zdwzdszc_info
.type Plus1_zdwzdszc_info, @object
Plus1_zdwzdszc_info:
.LcTN:
	addl $16,%edi
	cmpl 92(%ebx),%edi
	ja .LcTR
	movl $sGS_info,-12(%edi)
	movl 4(%ebp),%eax
	movl %eax,-4(%edi)
	movl 0(%ebp),%eax
	movl %eax,0(%edi)
	movl 4(%ebp),%esi
	leal -12(%edi),%eax
	movl %eax,4(%ebp)
	movl $sQS_info,0(%ebp)
	testl $3,%esi
	jne sQS_info
	jmp *(%esi)
.LcTR:
	movl $16,112(%ebx)
.LcTP:
	movl $Plus1_zdwzdszc_closure,%esi
	jmp *-4(%ebx)
.section .data
	.align 4
.globl Plus1_zdszc_srt
.type Plus1_zdszc_srt, @object
Plus1_zdszc_srt:
	.long	Plus1_zdszc1_closure
.data
	.align 4
.globl Plus1_zdszc_closure
.type Plus1_zdszc_closure, @object
Plus1_zdszc_closure:
	.long	Plus1_zdszc_info
	.long	0
.text
	.align 4,0x90
	.long	0
	.long	32
sHh_info:
.LcUd:
	addl $8,%edi
	cmpl 92(%ebx),%edi
	ja .LcUk
	movl $ghczmprim_GHCziTypes_Izh_con_info,-4(%edi)
	movl %esi,0(%edi)
	leal -3(%edi),%esi
	addl $4,%ebp
	jmp *0(%ebp)
.LcUk:
	movl $8,112(%ebx)
	jmp stg_gc_unbx_r1
.text
	.align 4,0x90
	.long	Plus1_zdszc_srt-(Plus1_zdszc_info)+0
	.long	131084
	.long	0
	.long	65551
.globl Plus1_zdszc_info
.type Plus1_zdszc_info, @object
Plus1_zdszc_info:
.LcUr:
	leal -4(%ebp),%eax
	cmpl 84(%ebx),%eax
	jb .LcUt
	movl 0(%ebp),%eax
	movl %eax,-4(%ebp)
	movl 4(%ebp),%eax
	movl %eax,0(%ebp)
	movl $sHh_info,4(%ebp)
	addl $-4,%ebp
	jmp Plus1_zdwzdszc_info
.LcUt:
	movl $Plus1_zdszc_closure,%esi
	jmp *-4(%ebx)
.section .data
	.align 4
.globl Plus1_foo1_srt
.type Plus1_foo1_srt, @object
Plus1_foo1_srt:
	.long	Plus1_zdszc1_closure
.data
	.align 4
.globl Plus1_foo1_closure
.type Plus1_foo1_closure, @object
Plus1_foo1_closure:
	.long	Plus1_foo1_info
	.long	0
.text
	.align 4,0x90
	.long	0
	.long	32
sHn_info:
.LcUQ:
	addl $8,%edi
	cmpl 92(%ebx),%edi
	ja .LcUX
	leal 2(%esi),%eax
	movl $ghczmprim_GHCziTypes_Izh_con_info,-4(%edi)
	movl %eax,0(%edi)
	leal -3(%edi),%esi
	addl $4,%ebp
	jmp *0(%ebp)
.LcUX:
	movl $8,112(%ebx)
	jmp stg_gc_unbx_r1
.text
	.align 4,0x90
	.long	Plus1_foo1_srt-(sUB_info)+0
	.long	1
	.long	65553
sUB_info:
.LcV4:
	leal -20(%ebp),%eax
	cmpl 84(%ebx),%eax
	jb .LcV6
	movl $stg_upd_frame_info,-8(%ebp)
	movl %esi,-4(%ebp)
	movl $Plus1_foo2_closure+1,-16(%ebp)
	movl 8(%esi),%eax
	movl %eax,-20(%ebp)
	movl $sHn_info,-12(%ebp)
	addl $-20,%ebp
	jmp Plus1_zdwzdszc_info
.LcV6:
	jmp *-8(%ebx)
.text
	.align 4,0x90
	.long	Plus1_foo1_srt-(Plus1_foo1_info)+0
	.long	131077
	.long	0
	.long	65551
.globl Plus1_foo1_info
.type Plus1_foo1_info, @object
Plus1_foo1_info:
.LcVd:
	addl $12,%edi
	cmpl 92(%ebx),%edi
	ja .LcVh
	movl $sUB_info,-8(%edi)
	movl 0(%ebp),%eax
	movl %eax,0(%edi)
	leal -8(%edi),%esi
	addl $4,%ebp
	jmp *0(%ebp)
.LcVh:
	movl $12,112(%ebx)
.LcVf:
	movl $Plus1_foo1_closure,%esi
	jmp *-4(%ebx)
.section .data
	.align 4
.globl Plus1_foo_srt
.type Plus1_foo_srt, @object
Plus1_foo_srt:
	.long	Plus1_zdszc1_closure
.data
	.align 4
.globl Plus1_foo_closure
.type Plus1_foo_closure, @object
Plus1_foo_closure:
	.long	Plus1_foo_info
	.long	0
.text
	.align 4,0x90
	.long	Plus1_foo_srt-(Plus1_foo_info)+0
	.long	131077
	.long	0
	.long	65551
.globl Plus1_foo_info
.type Plus1_foo_info, @object
Plus1_foo_info:
.LcVv:
	jmp Plus1_foo1_info
.data
	.align 4
_module_registered:
	.long	0
.text
	.align 4,0x90
.globl __stginit_Plus1_
.type __stginit_Plus1_, @object
__stginit_Plus1_:
.LcVF:
	cmpl $0,_module_registered
	jne .LcVG
.LcVH:
	movl $1,_module_registered
	addl $-4,%ebp
	movl $__stginit_base_Prelude_,(%ebp)
.LcVG:
	addl $4,%ebp
	jmp *-4(%ebp)
.text
	.align 4,0x90
.globl __stginit_Plus1
.type __stginit_Plus1, @object
__stginit_Plus1:
.LcVL:
	jmp __stginit_Plus1_
.section .note.GNU-stack,"",@progbits
.ident "GHC 7.0.4"
