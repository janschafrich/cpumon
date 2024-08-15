	.file	"machine_specific_registers.c"
	.intel_syntax noprefix
# GNU C17 (Ubuntu 11.4.0-1ubuntu1~22.04) version 11.4.0 (x86_64-linux-gnu)
#	compiled by GNU C version 11.4.0, GMP version 6.2.1, MPFR version 4.1.0, MPC version 1.2.1, isl version isl-0.24-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -masm=intel -mtune=generic -march=x86-64 -g -g -ggdb3 -gdwarf-2 -O0 -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection
	.text
.Ltext0:
	.section	.rodata
.LC0:
	.string	"/dev/cpu/%d/msr"
.LC1:
	.string	"rdmsr: No CPU %d\n"
	.align 8
.LC2:
	.string	"rdmsr: CPU %d doesn't support MSRs\n"
.LC3:
	.string	"rdmsr: open"
.LC4:
	.string	"Trying to open %s\n"
	.text
	.globl	open_msr
	.type	open_msr, @function
open_msr:
.LFB36:
	.file 1 "/home/jscha/dvp/cpumon/src/machine_specific_registers.c"
	.loc 1 25 1
	.cfi_startproc
	endbr64	
	push	rbp	#
.LCFI0:
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
.LCFI1:
	.cfi_def_cfa_register 6
	sub	rsp, 4096	#,
	or	QWORD PTR [rsp], 0	#,
	sub	rsp, 4096	#,
	or	QWORD PTR [rsp], 0	#,
	sub	rsp, 48	#,
	mov	DWORD PTR -8228[rbp], edi	# core, core
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:25: {
	.loc 1 25 1
	mov	rax, QWORD PTR fs:40	# tmp104, MEM[(<address-space-1> long unsigned int *)40B]
	mov	QWORD PTR -8[rbp], rax	# D.6956, tmp104
	xor	eax, eax	# tmp104
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:29: 	sprintf(msr_filename, "/dev/cpu/%d/msr", core);
	.loc 1 29 2
	mov	edx, DWORD PTR -8228[rbp]	# tmp91, core
	lea	rax, -8208[rbp]	# tmp92,
	lea	rcx, .LC0[rip]	# tmp93,
	mov	rsi, rcx	#, tmp93
	mov	rdi, rax	#, tmp92
	mov	eax, 0	#,
	call	sprintf@PLT	#
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:30: 	fd = open(msr_filename, O_RDONLY);
	.loc 1 30 7
	lea	rax, -8208[rbp]	# tmp94,
	mov	esi, 0	#,
	mov	rdi, rax	#, tmp94
	mov	eax, 0	#,
	call	open@PLT	#
	mov	DWORD PTR -8212[rbp], eax	# fd, tmp95
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:31: 	if ( fd < 0 ) {
	.loc 1 31 5
	cmp	DWORD PTR -8212[rbp], 0	# fd,
	jns	.L2	#,
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:32: 		if ( errno == ENXIO ) {
	.loc 1 32 9
	call	__errno_location@PLT	#
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:32: 		if ( errno == ENXIO ) {
	.loc 1 32 8
	mov	eax, DWORD PTR [rax]	# _2, *_1
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:32: 		if ( errno == ENXIO ) {
	.loc 1 32 6
	cmp	eax, 6	# _2,
	jne	.L3	#,
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:33: 			fprintf(stderr, "rdmsr: No CPU %d\n", core);
	.loc 1 33 4
	mov	rax, QWORD PTR stderr[rip]	# stderr.0_3, stderr
	mov	edx, DWORD PTR -8228[rbp]	# tmp96, core
	lea	rcx, .LC1[rip]	# tmp97,
	mov	rsi, rcx	#, tmp97
	mov	rdi, rax	#, stderr.0_3
	mov	eax, 0	#,
	call	fprintf@PLT	#
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:34: 			exit(2);
	.loc 1 34 4
	mov	edi, 2	#,
	call	exit@PLT	#
.L3:
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:35: 		} else if ( errno == EIO ) {
	.loc 1 35 16
	call	__errno_location@PLT	#
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:35: 		} else if ( errno == EIO ) {
	.loc 1 35 15
	mov	eax, DWORD PTR [rax]	# _5, *_4
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:35: 		} else if ( errno == EIO ) {
	.loc 1 35 13
	cmp	eax, 5	# _5,
	jne	.L4	#,
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:36: 			fprintf(stderr, "rdmsr: CPU %d doesn't support MSRs\n",
	.loc 1 36 4
	mov	rax, QWORD PTR stderr[rip]	# stderr.1_6, stderr
	mov	edx, DWORD PTR -8228[rbp]	# tmp98, core
	lea	rcx, .LC2[rip]	# tmp99,
	mov	rsi, rcx	#, tmp99
	mov	rdi, rax	#, stderr.1_6
	mov	eax, 0	#,
	call	fprintf@PLT	#
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:38: 			exit(3);
	.loc 1 38 4
	mov	edi, 3	#,
	call	exit@PLT	#
.L4:
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:40: 			perror("rdmsr: open");
	.loc 1 40 4
	lea	rax, .LC3[rip]	# tmp100,
	mov	rdi, rax	#, tmp100
	call	perror@PLT	#
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:41: 			fprintf(stderr,"Trying to open %s\n",msr_filename);
	.loc 1 41 4
	mov	rax, QWORD PTR stderr[rip]	# stderr.2_7, stderr
	lea	rdx, -8208[rbp]	# tmp101,
	lea	rcx, .LC4[rip]	# tmp102,
	mov	rsi, rcx	#, tmp102
	mov	rdi, rax	#, stderr.2_7
	mov	eax, 0	#,
	call	fprintf@PLT	#
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:42: 			exit(127);
	.loc 1 42 4
	mov	edi, 127	#,
	call	exit@PLT	#
.L2:
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:48: 	return fd;
	.loc 1 48 9
	mov	eax, DWORD PTR -8212[rbp]	# _13, fd
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:49: }
	.loc 1 49 1
	mov	rdx, QWORD PTR -8[rbp]	# tmp105, D.6956
	sub	rdx, QWORD PTR fs:40	# tmp105, MEM[(<address-space-1> long unsigned int *)40B]
	je	.L6	#,
	call	__stack_chk_fail@PLT	#
.L6:
	leave	
.LCFI2:
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE36:
	.size	open_msr, .-open_msr
	.section	.rodata
.LC5:
	.string	"rdmsr: pread"
	.text
	.globl	read_msr
	.type	read_msr, @function
read_msr:
.LFB37:
	.loc 1 52 1
	.cfi_startproc
	endbr64	
	push	rbp	#
.LCFI3:
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
.LCFI4:
	.cfi_def_cfa_register 6
	sub	rsp, 32	#,
	mov	DWORD PTR -20[rbp], edi	# fd, fd
	mov	DWORD PTR -24[rbp], esi	# offset, offset
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:52: {
	.loc 1 52 1
	mov	rax, QWORD PTR fs:40	# tmp91, MEM[(<address-space-1> long unsigned int *)40B]
	mov	QWORD PTR -8[rbp], rax	# D.6963, tmp91
	xor	eax, eax	# tmp91
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:55: 	if ( pread(fd, &register_val, sizeof register_val, offset) != sizeof register_val )
	.loc 1 55 7
	mov	edx, DWORD PTR -24[rbp]	# _1, offset
	lea	rsi, -16[rbp]	# tmp87,
	mov	eax, DWORD PTR -20[rbp]	# tmp88, fd
	mov	rcx, rdx	#, _1
	mov	edx, 8	#,
	mov	edi, eax	#, tmp88
	call	pread@PLT	#
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:55: 	if ( pread(fd, &register_val, sizeof register_val, offset) != sizeof register_val )
	.loc 1 55 5
	cmp	rax, 8	# _2,
	je	.L8	#,
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:60:         perror("rdmsr: pread");
	.loc 1 60 9
	lea	rax, .LC5[rip]	# tmp89,
	mov	rdi, rax	#, tmp89
	call	perror@PLT	#
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:61: 		exit(127);
	.loc 1 61 3
	mov	edi, 127	#,
	call	exit@PLT	#
.L8:
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:64: 	return (long long)register_val;
	.loc 1 64 9
	mov	rax, QWORD PTR -16[rbp]	# register_val.3_3, register_val
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:65: }
	.loc 1 65 1
	mov	rdx, QWORD PTR -8[rbp]	# tmp92, D.6963
	sub	rdx, QWORD PTR fs:40	# tmp92, MEM[(<address-space-1> long unsigned int *)40B]
	je	.L10	#,
	call	__stack_chk_fail@PLT	#
.L10:
	leave	
.LCFI5:
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE37:
	.size	read_msr, .-read_msr
	.globl	voltage_v
	.type	voltage_v, @function
voltage_v:
.LFB38:
	.loc 1 69 1
	.cfi_startproc
	endbr64	
	push	rbp	#
.LCFI6:
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
.LCFI7:
	.cfi_def_cfa_register 6
	push	rbx	#
	sub	rsp, 88	#,
	.cfi_offset 3, -24
	mov	QWORD PTR -72[rbp], rdi	# voltage, voltage
	mov	QWORD PTR -80[rbp], rsi	# average, average
	mov	DWORD PTR -84[rbp], edx	# core_count, core_count
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:69: {
	.loc 1 69 1
	mov	rax, QWORD PTR fs:40	# tmp173, MEM[(<address-space-1> long unsigned int *)40B]
	mov	QWORD PTR -24[rbp], rax	# D.6965, tmp173
	xor	eax, eax	# tmp173
	mov	rax, rsp	# tmp116,
	mov	rbx, rax	# saved_stack.6_40, tmp116
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:71:     uint64_t result[core_count];
	.loc 1 71 5
	mov	eax, DWORD PTR -84[rbp]	# core_count.4_42, core_count
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:71:     uint64_t result[core_count];
	.loc 1 71 14
	movsx	rdx, eax	# _1, core_count.4_42
	sub	rdx, 1	# _2,
	mov	QWORD PTR -40[rbp], rdx	# D.6882, _3
	movsx	rdx, eax	# _4, core_count.4_42
	mov	r10, rdx	# _5, _4
	mov	r11d, 0	# _5,
	movsx	rdx, eax	# _9, core_count.4_42
	mov	r8, rdx	# _10, _9
	mov	r9d, 0	# _10,
	cdqe
	lea	rdx, 0[0+rax*8]	# _13,
	mov	eax, 16	# tmp171,
	sub	rax, 1	# tmp117,
	add	rax, rdx	# tmp118, _13
	mov	esi, 16	# tmp172,
	mov	edx, 0	# tmp121,
	div	rsi	# tmp172
	imul	rax, rax, 16	# tmp122, tmp120,
	mov	rcx, rax	# tmp124, tmp122
	and	rcx, -4096	# tmp124,
	mov	rdx, rsp	# tmp125,
	sub	rdx, rcx	# tmp125, tmp124
.L12:
	cmp	rsp, rdx	#, tmp125
	je	.L13	#,
	sub	rsp, 4096	#,
	or	QWORD PTR 4088[rsp], 0	#,
	jmp	.L12	#
.L13:
	mov	rdx, rax	# tmp126, tmp122
	and	edx, 4095	# tmp126,
	sub	rsp, rdx	#, tmp126
	mov	rdx, rax	# tmp127, tmp122
	and	edx, 4095	# tmp127,
	test	rdx, rdx	# tmp127
	je	.L14	#,
	and	eax, 4095	# tmp128,
	sub	rax, 8	# tmp128,
	add	rax, rsp	# tmp129,
	or	QWORD PTR [rax], 0	#,
.L14:
	mov	rax, rsp	# tmp123,
	add	rax, 7	# tmp130,
	shr	rax, 3	# tmp131,
	sal	rax, 3	# tmp132,
	mov	QWORD PTR -32[rbp], rax	# result.5, tmp132
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:72:     float total = 0;
	.loc 1 72 11
	pxor	xmm0, xmm0	# tmp133
	movss	DWORD PTR -56[rbp], xmm0	# total, tmp133
.LBB2:
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:74:     for (int core = 0; core < core_count; core++) {
	.loc 1 74 14
	mov	DWORD PTR -52[rbp], 0	# core,
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:74:     for (int core = 0; core < core_count; core++) {
	.loc 1 74 5
	jmp	.L15	#
.L16:
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:75:         fd=open_msr(core);
	.loc 1 75 12 discriminator 3
	mov	eax, DWORD PTR -52[rbp]	# tmp134, core
	mov	edi, eax	#, tmp134
	call	open_msr	#
	mov	DWORD PTR -44[rbp], eax	# fd, tmp135
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:76:         result[core] = read_msr(fd,MSR_PERF_STATUS); 
	.loc 1 76 24 discriminator 3
	mov	eax, DWORD PTR -44[rbp]	# tmp136, fd
	mov	esi, 408	#,
	mov	edi, eax	#, tmp136
	call	read_msr	#
	mov	rcx, rax	# _15, _14
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:76:         result[core] = read_msr(fd,MSR_PERF_STATUS); 
	.loc 1 76 22 discriminator 3
	mov	rax, QWORD PTR -32[rbp]	# tmp137, result.5
	mov	edx, DWORD PTR -52[rbp]	# tmp139, core
	movsx	rdx, edx	# tmp138, tmp139
	mov	QWORD PTR [rax+rdx*8], rcx	# (*result.5_49)[core_34], _15
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:77:         close(fd);
	.loc 1 77 9 discriminator 3
	mov	eax, DWORD PTR -44[rbp]	# tmp140, fd
	mov	edi, eax	#, tmp140
	call	close@PLT	#
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:74:     for (int core = 0; core < core_count; core++) {
	.loc 1 74 47 discriminator 3
	add	DWORD PTR -52[rbp], 1	# core,
.L15:
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:74:     for (int core = 0; core < core_count; core++) {
	.loc 1 74 29 discriminator 1
	mov	eax, DWORD PTR -52[rbp]	# tmp141, core
	cmp	eax, DWORD PTR -84[rbp]	# tmp141, core_count
	jl	.L16	#,
.LBE2:
.LBB3:
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:80:     for (int i= 0; i < core_count; i++) {
	.loc 1 80 14
	mov	DWORD PTR -48[rbp], 0	# i,
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:80:     for (int i= 0; i < core_count; i++) {
	.loc 1 80 5
	jmp	.L17	#
.L20:
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:81:         result[i] = result[i]&0xffff00000000;   // remove all bits except 47:32 via bitmask, thx: https://askubuntu.com/questions/876286/how-to-monitor-the-vcore-voltage
	.loc 1 81 27 discriminator 3
	mov	rax, QWORD PTR -32[rbp]	# tmp142, result.5
	mov	edx, DWORD PTR -48[rbp]	# tmp144, i
	movsx	rdx, edx	# tmp143, tmp144
	mov	rax, QWORD PTR [rax+rdx*8]	# _16, (*result.5_49)[i_35]
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:81:         result[i] = result[i]&0xffff00000000;   // remove all bits except 47:32 via bitmask, thx: https://askubuntu.com/questions/876286/how-to-monitor-the-vcore-voltage
	.loc 1 81 30 discriminator 3
	movabs	rdx, 281470681743360	# tmp145,
	and	rax, rdx	# _16, tmp145
	mov	rcx, rax	# _17, _16
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:81:         result[i] = result[i]&0xffff00000000;   // remove all bits except 47:32 via bitmask, thx: https://askubuntu.com/questions/876286/how-to-monitor-the-vcore-voltage
	.loc 1 81 19 discriminator 3
	mov	rax, QWORD PTR -32[rbp]	# tmp146, result.5
	mov	edx, DWORD PTR -48[rbp]	# tmp148, i
	movsx	rdx, edx	# tmp147, tmp148
	mov	QWORD PTR [rax+rdx*8], rcx	# (*result.5_49)[i_35], _17
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:82:         result[i] = result[i]>>32;              // correct for positioning of bits so that value is correctly interpreted (Bitshift)
	.loc 1 82 27 discriminator 3
	mov	rax, QWORD PTR -32[rbp]	# tmp149, result.5
	mov	edx, DWORD PTR -48[rbp]	# tmp151, i
	movsx	rdx, edx	# tmp150, tmp151
	mov	rax, QWORD PTR [rax+rdx*8]	# _18, (*result.5_49)[i_35]
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:82:         result[i] = result[i]>>32;              // correct for positioning of bits so that value is correctly interpreted (Bitshift)
	.loc 1 82 30 discriminator 3
	shr	rax, 32	# _18,
	mov	rcx, rax	# _19, _18
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:82:         result[i] = result[i]>>32;              // correct for positioning of bits so that value is correctly interpreted (Bitshift)
	.loc 1 82 19 discriminator 3
	mov	rax, QWORD PTR -32[rbp]	# tmp152, result.5
	mov	edx, DWORD PTR -48[rbp]	# tmp154, i
	movsx	rdx, edx	# tmp153, tmp154
	mov	QWORD PTR [rax+rdx*8], rcx	# (*result.5_49)[i_35], _19
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:83:         voltage[i] = (1.0/8192.0) * result[i];    // correct for scaling according to intel documentation    
	.loc 1 83 43 discriminator 3
	mov	rax, QWORD PTR -32[rbp]	# tmp155, result.5
	mov	edx, DWORD PTR -48[rbp]	# tmp157, i
	movsx	rdx, edx	# tmp156, tmp157
	mov	rax, QWORD PTR [rax+rdx*8]	# _20, (*result.5_49)[i_35]
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:83:         voltage[i] = (1.0/8192.0) * result[i];    // correct for scaling according to intel documentation    
	.loc 1 83 35 discriminator 3
	test	rax, rax	# _20
	js	.L18	#,
	pxor	xmm0, xmm0	# _21
	cvtsi2sd	xmm0, rax	# _21, _20
	jmp	.L19	#
.L18:
	mov	rdx, rax	# tmp159, _20
	shr	rdx	# tmp159
	and	eax, 1	# tmp160,
	or	rdx, rax	# tmp159, tmp160
	pxor	xmm0, xmm0	# tmp158
	cvtsi2sd	xmm0, rdx	# tmp158, tmp159
	addsd	xmm0, xmm0	# _21, tmp158
.L19:
	movsd	xmm1, QWORD PTR .LC7[rip]	# tmp161,
	mulsd	xmm0, xmm1	# _22, tmp161
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:83:         voltage[i] = (1.0/8192.0) * result[i];    // correct for scaling according to intel documentation    
	.loc 1 83 16 discriminator 3
	mov	eax, DWORD PTR -48[rbp]	# tmp162, i
	cdqe
	lea	rdx, 0[0+rax*4]	# _24,
	mov	rax, QWORD PTR -72[rbp]	# tmp163, voltage
	add	rax, rdx	# _25, _24
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:83:         voltage[i] = (1.0/8192.0) * result[i];    // correct for scaling according to intel documentation    
	.loc 1 83 35 discriminator 3
	cvtsd2ss	xmm0, xmm0	# _26, _22
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:83:         voltage[i] = (1.0/8192.0) * result[i];    // correct for scaling according to intel documentation    
	.loc 1 83 20 discriminator 3
	movss	DWORD PTR [rax], xmm0	# *_25, _26
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:84:         total += voltage[i];
	.loc 1 84 25 discriminator 3
	mov	eax, DWORD PTR -48[rbp]	# tmp164, i
	cdqe
	lea	rdx, 0[0+rax*4]	# _28,
	mov	rax, QWORD PTR -72[rbp]	# tmp165, voltage
	add	rax, rdx	# _29, _28
	movss	xmm0, DWORD PTR [rax]	# _30, *_29
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:84:         total += voltage[i];
	.loc 1 84 15 discriminator 3
	movss	xmm1, DWORD PTR -56[rbp]	# tmp167, total
	addss	xmm0, xmm1	# tmp166, tmp167
	movss	DWORD PTR -56[rbp], xmm0	# total, tmp166
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:80:     for (int i= 0; i < core_count; i++) {
	.loc 1 80 37 discriminator 3
	add	DWORD PTR -48[rbp], 1	# i,
.L17:
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:80:     for (int i= 0; i < core_count; i++) {
	.loc 1 80 22 discriminator 1
	mov	eax, DWORD PTR -48[rbp]	# tmp168, i
	cmp	eax, DWORD PTR -84[rbp]	# tmp168, core_count
	jl	.L20	#,
.LBE3:
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:87:     *average = total / core_count;
	.loc 1 87 22
	pxor	xmm1, xmm1	# _31
	cvtsi2ss	xmm1, DWORD PTR -84[rbp]	# _31, core_count
	movss	xmm0, DWORD PTR -56[rbp]	# tmp169, total
	divss	xmm0, xmm1	# _32, _31
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:87:     *average = total / core_count;
	.loc 1 87 14
	mov	rax, QWORD PTR -80[rbp]	# tmp170, average
	movss	DWORD PTR [rax], xmm0	# *average_53(D), _32
	mov	rsp, rbx	#, saved_stack.6_40
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:88: }
	.loc 1 88 1
	nop	
	mov	rax, QWORD PTR -24[rbp]	# tmp174, D.6965
	sub	rax, QWORD PTR fs:40	# tmp174, MEM[(<address-space-1> long unsigned int *)40B]
	je	.L21	#,
	call	__stack_chk_fail@PLT	#
.L21:
	mov	rbx, QWORD PTR -8[rbp]	#,
	leave	
.LCFI8:
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE38:
	.size	voltage_v, .-voltage_v
	.section	.rodata
	.align 8
.LC8:
	.string	"Digital temperature reading from IA_THERM_STATUS not valid"
	.text
	.globl	msr_temperature_c
	.type	msr_temperature_c, @function
msr_temperature_c:
.LFB39:
	.loc 1 91 1
	.cfi_startproc
	endbr64	
	push	rbp	#
.LCFI9:
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
.LCFI10:
	.cfi_def_cfa_register 6
	push	r15	#
	push	r14	#
	push	r13	#
	push	r12	#
	push	rbx	#
	sub	rsp, 152	#,
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	mov	QWORD PTR -136[rbp], rdi	# temperature, temperature
	mov	QWORD PTR -144[rbp], rsi	# average, average
	mov	DWORD PTR -148[rbp], edx	# core_count, core_count
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:91: {
	.loc 1 91 1
	mov	rax, QWORD PTR fs:40	# tmp289, MEM[(<address-space-1> long unsigned int *)40B]
	mov	QWORD PTR -56[rbp], rax	# D.6967, tmp289
	xor	eax, eax	# tmp289
	mov	rax, rsp	# tmp155,
	mov	rbx, rax	# saved_stack.13_83, tmp155
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:93:     uint64_t register_content[core_count];
	.loc 1 93 5
	mov	edx, DWORD PTR -148[rbp]	# core_count.7_85, core_count
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:93:     uint64_t register_content[core_count];
	.loc 1 93 14
	movsx	rax, edx	# _1, core_count.7_85
	sub	rax, 1	# _2,
	mov	QWORD PTR -104[rbp], rax	# D.6890, _3
	movsx	rax, edx	# _4, core_count.7_85
	mov	QWORD PTR -176[rbp], rax	# %sfp, _4
	mov	QWORD PTR -168[rbp], 0	# %sfp,
	movsx	rax, edx	# _9, core_count.7_85
	mov	QWORD PTR -192[rbp], rax	# %sfp, _9
	mov	QWORD PTR -184[rbp], 0	# %sfp,
	movsx	rax, edx	# _12, core_count.7_85
	lea	rdx, 0[0+rax*8]	# _13,
	mov	eax, 16	# tmp283,
	sub	rax, 1	# tmp156,
	add	rax, rdx	# tmp157, _13
	mov	esi, 16	# tmp284,
	mov	edx, 0	# tmp160,
	div	rsi	# tmp284
	imul	rax, rax, 16	# tmp161, tmp159,
	mov	rcx, rax	# tmp163, tmp161
	and	rcx, -4096	# tmp163,
	mov	rdx, rsp	# tmp164,
	sub	rdx, rcx	# tmp164, tmp163
.L23:
	cmp	rsp, rdx	#, tmp164
	je	.L24	#,
	sub	rsp, 4096	#,
	or	QWORD PTR 4088[rsp], 0	#,
	jmp	.L23	#
.L24:
	mov	rdx, rax	# tmp165, tmp161
	and	edx, 4095	# tmp165,
	sub	rsp, rdx	#, tmp165
	mov	rdx, rax	# tmp166, tmp161
	and	edx, 4095	# tmp166,
	test	rdx, rdx	# tmp166
	je	.L25	#,
	and	eax, 4095	# tmp167,
	sub	rax, 8	# tmp167,
	add	rax, rsp	# tmp168,
	or	QWORD PTR [rax], 0	#,
.L25:
	mov	rax, rsp	# tmp162,
	add	rax, 7	# tmp169,
	shr	rax, 3	# tmp170,
	sal	rax, 3	# tmp171,
	mov	QWORD PTR -96[rbp], rax	# register_content.8, tmp171
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:94:     float temperature_target[core_count];
	.loc 1 94 5
	mov	eax, DWORD PTR -148[rbp]	# core_count.9_93, core_count
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:94:     float temperature_target[core_count];
	.loc 1 94 11
	movsx	rdx, eax	# _14, core_count.9_93
	sub	rdx, 1	# _15,
	mov	QWORD PTR -88[rbp], rdx	# D.6897, _16
	movsx	rdx, eax	# _17, core_count.9_93
	mov	r10, rdx	# _18, _17
	mov	r11d, 0	# _18,
	movsx	rdx, eax	# _22, core_count.9_93
	mov	r8, rdx	# _23, _22
	mov	r9d, 0	# _23,
	cdqe
	lea	rdx, 0[0+rax*4]	# _26,
	mov	eax, 16	# tmp285,
	sub	rax, 1	# tmp172,
	add	rax, rdx	# tmp173, _26
	mov	esi, 16	# tmp286,
	mov	edx, 0	# tmp176,
	div	rsi	# tmp286
	imul	rax, rax, 16	# tmp177, tmp175,
	mov	rcx, rax	# tmp179, tmp177
	and	rcx, -4096	# tmp179,
	mov	rdx, rsp	# tmp180,
	sub	rdx, rcx	# tmp180, tmp179
.L26:
	cmp	rsp, rdx	#, tmp180
	je	.L27	#,
	sub	rsp, 4096	#,
	or	QWORD PTR 4088[rsp], 0	#,
	jmp	.L26	#
.L27:
	mov	rdx, rax	# tmp181, tmp177
	and	edx, 4095	# tmp181,
	sub	rsp, rdx	#, tmp181
	mov	rdx, rax	# tmp182, tmp177
	and	edx, 4095	# tmp182,
	test	rdx, rdx	# tmp182
	je	.L28	#,
	and	eax, 4095	# tmp183,
	sub	rax, 8	# tmp183,
	add	rax, rsp	# tmp184,
	or	QWORD PTR [rax], 0	#,
.L28:
	mov	rax, rsp	# tmp178,
	add	rax, 3	# tmp185,
	shr	rax, 2	# tmp186,
	sal	rax, 2	# tmp187,
	mov	QWORD PTR -80[rbp], rax	# temperature_target.10, tmp187
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:95:     float total = 0;
	.loc 1 95 11
	pxor	xmm0, xmm0	# tmp188
	movss	DWORD PTR -128[rbp], xmm0	# total, tmp188
.LBB4:
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:97:     for (int core = 0; core < core_count; core++) {
	.loc 1 97 14
	mov	DWORD PTR -124[rbp], 0	# core,
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:97:     for (int core = 0; core < core_count; core++) {
	.loc 1 97 5
	jmp	.L29	#
.L30:
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:98:         fd=open_msr(core);
	.loc 1 98 12 discriminator 3
	mov	eax, DWORD PTR -124[rbp]	# tmp189, core
	mov	edi, eax	#, tmp189
	call	open_msr	#
	mov	DWORD PTR -108[rbp], eax	# fd, tmp190
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:99:         register_content[core] = read_msr(fd, MSR_TEMPERATURE_TARGET); 
	.loc 1 99 34 discriminator 3
	mov	eax, DWORD PTR -108[rbp]	# tmp191, fd
	mov	esi, 418	#,
	mov	edi, eax	#, tmp191
	call	read_msr	#
	mov	rcx, rax	# _28, _27
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:99:         register_content[core] = read_msr(fd, MSR_TEMPERATURE_TARGET); 
	.loc 1 99 32 discriminator 3
	mov	rax, QWORD PTR -96[rbp]	# tmp192, register_content.8
	mov	edx, DWORD PTR -124[rbp]	# tmp194, core
	movsx	rdx, edx	# tmp193, tmp194
	mov	QWORD PTR [rax+rdx*8], rcx	# (*register_content.8_92)[core_72], _28
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:100:         close(fd);
	.loc 1 100 9 discriminator 3
	mov	eax, DWORD PTR -108[rbp]	# tmp195, fd
	mov	edi, eax	#, tmp195
	call	close@PLT	#
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:97:     for (int core = 0; core < core_count; core++) {
	.loc 1 97 47 discriminator 3
	add	DWORD PTR -124[rbp], 1	# core,
.L29:
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:97:     for (int core = 0; core < core_count; core++) {
	.loc 1 97 29 discriminator 1
	mov	eax, DWORD PTR -124[rbp]	# tmp196, core
	cmp	eax, DWORD PTR -148[rbp]	# tmp196, core_count
	jl	.L30	#,
.LBE4:
.LBB5:
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:103:     for (int i= 0; i < core_count; i++) {
	.loc 1 103 14
	mov	DWORD PTR -120[rbp], 0	# i,
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:103:     for (int i= 0; i < core_count; i++) {
	.loc 1 103 5
	jmp	.L31	#
.L34:
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:104:         register_content[i] = register_content[i]&0xff0000;     // remove all bits except 23:16 via bitmask, IA32 SW Developer Manual p. 2-186
	.loc 1 104 47 discriminator 3
	mov	rax, QWORD PTR -96[rbp]	# tmp197, register_content.8
	mov	edx, DWORD PTR -120[rbp]	# tmp199, i
	movsx	rdx, edx	# tmp198, tmp199
	mov	rax, QWORD PTR [rax+rdx*8]	# _29, (*register_content.8_92)[i_73]
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:104:         register_content[i] = register_content[i]&0xff0000;     // remove all bits except 23:16 via bitmask, IA32 SW Developer Manual p. 2-186
	.loc 1 104 50 discriminator 3
	and	eax, 16711680	# _29,
	mov	rcx, rax	# _30, _29
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:104:         register_content[i] = register_content[i]&0xff0000;     // remove all bits except 23:16 via bitmask, IA32 SW Developer Manual p. 2-186
	.loc 1 104 29 discriminator 3
	mov	rax, QWORD PTR -96[rbp]	# tmp200, register_content.8
	mov	edx, DWORD PTR -120[rbp]	# tmp202, i
	movsx	rdx, edx	# tmp201, tmp202
	mov	QWORD PTR [rax+rdx*8], rcx	# (*register_content.8_92)[i_73], _30
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:105:         register_content[i] = register_content[i]>>16;          // correct for positioning of bits so that value is correctly interpreted (Bitshift)
	.loc 1 105 47 discriminator 3
	mov	rax, QWORD PTR -96[rbp]	# tmp203, register_content.8
	mov	edx, DWORD PTR -120[rbp]	# tmp205, i
	movsx	rdx, edx	# tmp204, tmp205
	mov	rax, QWORD PTR [rax+rdx*8]	# _31, (*register_content.8_92)[i_73]
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:105:         register_content[i] = register_content[i]>>16;          // correct for positioning of bits so that value is correctly interpreted (Bitshift)
	.loc 1 105 50 discriminator 3
	shr	rax, 16	# _31,
	mov	rcx, rax	# _32, _31
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:105:         register_content[i] = register_content[i]>>16;          // correct for positioning of bits so that value is correctly interpreted (Bitshift)
	.loc 1 105 29 discriminator 3
	mov	rax, QWORD PTR -96[rbp]	# tmp206, register_content.8
	mov	edx, DWORD PTR -120[rbp]	# tmp208, i
	movsx	rdx, edx	# tmp207, tmp208
	mov	QWORD PTR [rax+rdx*8], rcx	# (*register_content.8_92)[i_73], _32
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:106:         temperature_target[i] = register_content[i];                   
	.loc 1 106 49 discriminator 3
	mov	rax, QWORD PTR -96[rbp]	# tmp209, register_content.8
	mov	edx, DWORD PTR -120[rbp]	# tmp211, i
	movsx	rdx, edx	# tmp210, tmp211
	mov	rax, QWORD PTR [rax+rdx*8]	# _33, (*register_content.8_92)[i_73]
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:106:         temperature_target[i] = register_content[i];                   
	.loc 1 106 31 discriminator 3
	test	rax, rax	# _33
	js	.L32	#,
	pxor	xmm0, xmm0	# _34
	cvtsi2ss	xmm0, rax	# _34, _33
	jmp	.L33	#
.L32:
	mov	rdx, rax	# tmp213, _33
	shr	rdx	# tmp213
	and	eax, 1	# tmp214,
	or	rdx, rax	# tmp213, tmp214
	pxor	xmm0, xmm0	# tmp212
	cvtsi2ss	xmm0, rdx	# tmp212, tmp213
	addss	xmm0, xmm0	# _34, tmp212
.L33:
	mov	rax, QWORD PTR -80[rbp]	# tmp215, temperature_target.10
	mov	edx, DWORD PTR -120[rbp]	# tmp217, i
	movsx	rdx, edx	# tmp216, tmp217
	movss	DWORD PTR [rax+rdx*4], xmm0	# (*temperature_target.10_100)[i_73], _34
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:103:     for (int i= 0; i < core_count; i++) {
	.loc 1 103 37 discriminator 3
	add	DWORD PTR -120[rbp], 1	# i,
.L31:
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:103:     for (int i= 0; i < core_count; i++) {
	.loc 1 103 22 discriminator 1
	mov	eax, DWORD PTR -120[rbp]	# tmp218, i
	cmp	eax, DWORD PTR -148[rbp]	# tmp218, core_count
	jl	.L34	#,
.LBE5:
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:110:     float temperature_digital_readout[core_count];
	.loc 1 110 5
	mov	eax, DWORD PTR -148[rbp]	# core_count.11_104, core_count
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:110:     float temperature_digital_readout[core_count];
	.loc 1 110 11
	movsx	rdx, eax	# _35, core_count.11_104
	sub	rdx, 1	# _36,
	mov	QWORD PTR -72[rbp], rdx	# D.6904, _37
	movsx	rdx, eax	# _38, core_count.11_104
	mov	r14, rdx	# _39, _38
	mov	r15d, 0	# _39,
	movsx	rdx, eax	# _43, core_count.11_104
	mov	r12, rdx	# _44, _43
	mov	r13d, 0	# _44,
	cdqe
	lea	rdx, 0[0+rax*4]	# _47,
	mov	eax, 16	# tmp287,
	sub	rax, 1	# tmp219,
	add	rax, rdx	# tmp220, _47
	mov	esi, 16	# tmp288,
	mov	edx, 0	# tmp223,
	div	rsi	# tmp288
	imul	rax, rax, 16	# tmp224, tmp222,
	mov	rcx, rax	# tmp226, tmp224
	and	rcx, -4096	# tmp226,
	mov	rdx, rsp	# tmp227,
	sub	rdx, rcx	# tmp227, tmp226
.L35:
	cmp	rsp, rdx	#, tmp227
	je	.L36	#,
	sub	rsp, 4096	#,
	or	QWORD PTR 4088[rsp], 0	#,
	jmp	.L35	#
.L36:
	mov	rdx, rax	# tmp228, tmp224
	and	edx, 4095	# tmp228,
	sub	rsp, rdx	#, tmp228
	mov	rdx, rax	# tmp229, tmp224
	and	edx, 4095	# tmp229,
	test	rdx, rdx	# tmp229
	je	.L37	#,
	and	eax, 4095	# tmp230,
	sub	rax, 8	# tmp230,
	add	rax, rsp	# tmp231,
	or	QWORD PTR [rax], 0	#,
.L37:
	mov	rax, rsp	# tmp225,
	add	rax, 3	# tmp232,
	shr	rax, 2	# tmp233,
	sal	rax, 2	# tmp234,
	mov	QWORD PTR -64[rbp], rax	# temperature_digital_readout.12, tmp234
.LBB6:
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:112:     for (int core = 0; core < core_count; core++) {
	.loc 1 112 14
	mov	DWORD PTR -116[rbp], 0	# core,
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:112:     for (int core = 0; core < core_count; core++) {
	.loc 1 112 5
	jmp	.L38	#
.L39:
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:113:         fd=open_msr(core);
	.loc 1 113 12 discriminator 3
	mov	eax, DWORD PTR -116[rbp]	# tmp235, core
	mov	edi, eax	#, tmp235
	call	open_msr	#
	mov	DWORD PTR -108[rbp], eax	# fd, tmp236
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:114:         register_content[core] = read_msr(fd, IA32_THERM_STATUS); 
	.loc 1 114 34 discriminator 3
	mov	eax, DWORD PTR -108[rbp]	# tmp237, fd
	mov	esi, 412	#,
	mov	edi, eax	#, tmp237
	call	read_msr	#
	mov	rcx, rax	# _49, _48
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:114:         register_content[core] = read_msr(fd, IA32_THERM_STATUS); 
	.loc 1 114 32 discriminator 3
	mov	rax, QWORD PTR -96[rbp]	# tmp238, register_content.8
	mov	edx, DWORD PTR -116[rbp]	# tmp240, core
	movsx	rdx, edx	# tmp239, tmp240
	mov	QWORD PTR [rax+rdx*8], rcx	# (*register_content.8_92)[core_74], _49
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:115:         close(fd);
	.loc 1 115 9 discriminator 3
	mov	eax, DWORD PTR -108[rbp]	# tmp241, fd
	mov	edi, eax	#, tmp241
	call	close@PLT	#
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:112:     for (int core = 0; core < core_count; core++) {
	.loc 1 112 47 discriminator 3
	add	DWORD PTR -116[rbp], 1	# core,
.L38:
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:112:     for (int core = 0; core < core_count; core++) {
	.loc 1 112 29 discriminator 1
	mov	eax, DWORD PTR -116[rbp]	# tmp242, core
	cmp	eax, DWORD PTR -148[rbp]	# tmp242, core_count
	jl	.L39	#,
.LBE6:
.LBB7:
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:118:     for (int i= 0; i < core_count; i++) {
	.loc 1 118 14
	mov	DWORD PTR -112[rbp], 0	# i,
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:118:     for (int i= 0; i < core_count; i++) {
	.loc 1 118 5
	jmp	.L40	#
.L45:
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:119:         if (register_content[i] & (1 << 31)) {
	.loc 1 119 29
	mov	rax, QWORD PTR -96[rbp]	# tmp243, register_content.8
	mov	edx, DWORD PTR -112[rbp]	# tmp245, i
	movsx	rdx, edx	# tmp244, tmp245
	mov	rax, QWORD PTR [rax+rdx*8]	# _50, (*register_content.8_92)[i_75]
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:119:         if (register_content[i] & (1 << 31)) {
	.loc 1 119 33
	and	rax, -2147483648	# _51,
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:119:         if (register_content[i] & (1 << 31)) {
	.loc 1 119 12
	test	rax, rax	# _51
	je	.L41	#,
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:120:             register_content[i] = register_content[i] & 0x7f0000;     // remove all bits except 22:16 via bitmask, IA32 SW Developer Manual p. 2-185
	.loc 1 120 51
	mov	rax, QWORD PTR -96[rbp]	# tmp246, register_content.8
	mov	edx, DWORD PTR -112[rbp]	# tmp248, i
	movsx	rdx, edx	# tmp247, tmp248
	mov	rax, QWORD PTR [rax+rdx*8]	# _52, (*register_content.8_92)[i_75]
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:120:             register_content[i] = register_content[i] & 0x7f0000;     // remove all bits except 22:16 via bitmask, IA32 SW Developer Manual p. 2-185
	.loc 1 120 55
	and	eax, 8323072	# _52,
	mov	rcx, rax	# _53, _52
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:120:             register_content[i] = register_content[i] & 0x7f0000;     // remove all bits except 22:16 via bitmask, IA32 SW Developer Manual p. 2-185
	.loc 1 120 33
	mov	rax, QWORD PTR -96[rbp]	# tmp249, register_content.8
	mov	edx, DWORD PTR -112[rbp]	# tmp251, i
	movsx	rdx, edx	# tmp250, tmp251
	mov	QWORD PTR [rax+rdx*8], rcx	# (*register_content.8_92)[i_75], _53
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:121:             register_content[i] = register_content[i]>>16;          // correct for positioning of bits so that value is correctly interpreted (Bitshift)
	.loc 1 121 51
	mov	rax, QWORD PTR -96[rbp]	# tmp252, register_content.8
	mov	edx, DWORD PTR -112[rbp]	# tmp254, i
	movsx	rdx, edx	# tmp253, tmp254
	mov	rax, QWORD PTR [rax+rdx*8]	# _54, (*register_content.8_92)[i_75]
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:121:             register_content[i] = register_content[i]>>16;          // correct for positioning of bits so that value is correctly interpreted (Bitshift)
	.loc 1 121 54
	shr	rax, 16	# _54,
	mov	rcx, rax	# _55, _54
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:121:             register_content[i] = register_content[i]>>16;          // correct for positioning of bits so that value is correctly interpreted (Bitshift)
	.loc 1 121 33
	mov	rax, QWORD PTR -96[rbp]	# tmp255, register_content.8
	mov	edx, DWORD PTR -112[rbp]	# tmp257, i
	movsx	rdx, edx	# tmp256, tmp257
	mov	QWORD PTR [rax+rdx*8], rcx	# (*register_content.8_92)[i_75], _55
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:122:             temperature_digital_readout[i] = register_content[i];                     
	.loc 1 122 62
	mov	rax, QWORD PTR -96[rbp]	# tmp258, register_content.8
	mov	edx, DWORD PTR -112[rbp]	# tmp260, i
	movsx	rdx, edx	# tmp259, tmp260
	mov	rax, QWORD PTR [rax+rdx*8]	# _56, (*register_content.8_92)[i_75]
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:122:             temperature_digital_readout[i] = register_content[i];                     
	.loc 1 122 44
	test	rax, rax	# _56
	js	.L42	#,
	pxor	xmm0, xmm0	# _57
	cvtsi2ss	xmm0, rax	# _57, _56
	jmp	.L43	#
.L42:
	mov	rdx, rax	# tmp262, _56
	shr	rdx	# tmp262
	and	eax, 1	# tmp263,
	or	rdx, rax	# tmp262, tmp263
	pxor	xmm0, xmm0	# tmp261
	cvtsi2ss	xmm0, rdx	# tmp261, tmp262
	addss	xmm0, xmm0	# _57, tmp261
.L43:
	mov	rax, QWORD PTR -64[rbp]	# tmp264, temperature_digital_readout.12
	mov	edx, DWORD PTR -112[rbp]	# tmp266, i
	movsx	rdx, edx	# tmp265, tmp266
	movss	DWORD PTR [rax+rdx*4], xmm0	# (*temperature_digital_readout.12_111)[i_75], _57
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:123:             temperature[i] = temperature_target[i] - temperature_digital_readout[i];
	.loc 1 123 48
	mov	rax, QWORD PTR -80[rbp]	# tmp267, temperature_target.10
	mov	edx, DWORD PTR -112[rbp]	# tmp269, i
	movsx	rdx, edx	# tmp268, tmp269
	movss	xmm0, DWORD PTR [rax+rdx*4]	# _58, (*temperature_target.10_100)[i_75]
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:123:             temperature[i] = temperature_target[i] - temperature_digital_readout[i];
	.loc 1 123 81
	mov	rax, QWORD PTR -64[rbp]	# tmp270, temperature_digital_readout.12
	mov	edx, DWORD PTR -112[rbp]	# tmp272, i
	movsx	rdx, edx	# tmp271, tmp272
	movss	xmm1, DWORD PTR [rax+rdx*4]	# _59, (*temperature_digital_readout.12_111)[i_75]
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:123:             temperature[i] = temperature_target[i] - temperature_digital_readout[i];
	.loc 1 123 24
	mov	eax, DWORD PTR -112[rbp]	# tmp273, i
	cdqe
	lea	rdx, 0[0+rax*4]	# _61,
	mov	rax, QWORD PTR -136[rbp]	# tmp274, temperature
	add	rax, rdx	# _62, _61
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:123:             temperature[i] = temperature_target[i] - temperature_digital_readout[i];
	.loc 1 123 52
	subss	xmm0, xmm1	# _63, _59
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:123:             temperature[i] = temperature_target[i] - temperature_digital_readout[i];
	.loc 1 123 28
	movss	DWORD PTR [rax], xmm0	# *_62, _63
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:124:             total += temperature[i];
	.loc 1 124 33
	mov	eax, DWORD PTR -112[rbp]	# tmp275, i
	cdqe
	lea	rdx, 0[0+rax*4]	# _65,
	mov	rax, QWORD PTR -136[rbp]	# tmp276, temperature
	add	rax, rdx	# _66, _65
	movss	xmm0, DWORD PTR [rax]	# _67, *_66
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:124:             total += temperature[i];
	.loc 1 124 19
	movss	xmm1, DWORD PTR -128[rbp]	# tmp278, total
	addss	xmm0, xmm1	# tmp277, tmp278
	movss	DWORD PTR -128[rbp], xmm0	# total, tmp277
	jmp	.L44	#
.L41:
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:127:             printf("Digital temperature reading from IA_THERM_STATUS not valid\n");
	.loc 1 127 13
	lea	rax, .LC8[rip]	# tmp279,
	mov	rdi, rax	#, tmp279
	call	puts@PLT	#
.L44:
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:118:     for (int i= 0; i < core_count; i++) {
	.loc 1 118 37 discriminator 2
	add	DWORD PTR -112[rbp], 1	# i,
.L40:
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:118:     for (int i= 0; i < core_count; i++) {
	.loc 1 118 22 discriminator 1
	mov	eax, DWORD PTR -112[rbp]	# tmp280, i
	cmp	eax, DWORD PTR -148[rbp]	# tmp280, core_count
	jl	.L45	#,
.LBE7:
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:131:     *average = total / core_count;     
	.loc 1 131 22
	pxor	xmm1, xmm1	# _68
	cvtsi2ss	xmm1, DWORD PTR -148[rbp]	# _68, core_count
	movss	xmm0, DWORD PTR -128[rbp]	# tmp281, total
	divss	xmm0, xmm1	# _69, _68
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:131:     *average = total / core_count;     
	.loc 1 131 14
	mov	rax, QWORD PTR -144[rbp]	# tmp282, average
	movss	DWORD PTR [rax], xmm0	# *average_114(D), _69
	mov	rsp, rbx	#, saved_stack.13_83
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:132: }
	.loc 1 132 1
	nop	
	mov	rax, QWORD PTR -56[rbp]	# tmp290, D.6967
	sub	rax, QWORD PTR fs:40	# tmp290, MEM[(<address-space-1> long unsigned int *)40B]
	je	.L46	#,
	call	__stack_chk_fail@PLT	#
.L46:
	lea	rsp, -40[rbp]	#,
	pop	rbx	#
	pop	r12	#
	pop	r13	#
	pop	r14	#
	pop	r15	#
	pop	rbp	#
.LCFI11:
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE39:
	.size	msr_temperature_c, .-msr_temperature_c
	.section	.rodata
.LC11:
	.string	"Power unit %f\n"
.LC12:
	.string	"Time unit %f\n"
.LC14:
	.string	"PL1 = %f W\n"
.LC15:
	.string	"Time Window = %f s\n"
.LC16:
	.string	"Lock status = %lld\n"
	.text
	.globl	core_power_units
	.type	core_power_units, @function
core_power_units:
.LFB40:
	.loc 1 136 1
	.cfi_startproc
	endbr64	
	push	rbp	#
.LCFI12:
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
.LCFI13:
	.cfi_def_cfa_register 6
	sub	rsp, 80	#,
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:142:     fd=open_msr(0);
	.loc 1 142 8
	mov	edi, 0	#,
	call	open_msr	#
	mov	DWORD PTR -68[rbp], eax	# fd, tmp103
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:143:     result = read_msr(fd, MSR_RAPL_POWER_UNIT);
	.loc 1 143 14
	mov	eax, DWORD PTR -68[rbp]	# tmp104, fd
	mov	esi, 1542	#,
	mov	edi, eax	#, tmp104
	call	read_msr	#
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:143:     result = read_msr(fd, MSR_RAPL_POWER_UNIT);
	.loc 1 143 12
	mov	QWORD PTR -64[rbp], rax	# result, _1
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:144:     close(fd);
	.loc 1 144 5
	mov	eax, DWORD PTR -68[rbp]	# tmp105, fd
	mov	edi, eax	#, tmp105
	call	close@PLT	#
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:146:     power_unit = 1 / pow(2,result&0xF);          // default 0,125 W increments
	.loc 1 146 34
	mov	rax, QWORD PTR -64[rbp]	# tmp106, result
	and	eax, 15	# _2,
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:146:     power_unit = 1 / pow(2,result&0xF);          // default 0,125 W increments
	.loc 1 146 22
	test	rax, rax	# _2
	js	.L48	#,
	pxor	xmm0, xmm0	# _3
	cvtsi2sd	xmm0, rax	# _3, _2
	jmp	.L49	#
.L48:
	mov	rdx, rax	# tmp108, _2
	shr	rdx	# tmp108
	and	eax, 1	# tmp109,
	or	rdx, rax	# tmp108, tmp109
	pxor	xmm0, xmm0	# tmp107
	cvtsi2sd	xmm0, rdx	# tmp107, tmp108
	addsd	xmm0, xmm0	# _3, tmp107
.L49:
	mov	rax, QWORD PTR .LC9[rip]	# tmp110,
	movapd	xmm1, xmm0	#, _3
	movq	xmm0, rax	#, tmp110
	call	pow@PLT	#
	movapd	xmm1, xmm0	# _4,
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:146:     power_unit = 1 / pow(2,result&0xF);          // default 0,125 W increments
	.loc 1 146 16
	movsd	xmm0, QWORD PTR .LC10[rip]	# tmp112,
	divsd	xmm0, xmm1	# tmp111, _4
	movsd	QWORD PTR -56[rbp], xmm0	# power_unit, tmp111
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:148:     time_unit = 1 / pow(2,(result&0xF0000)>> 16);      // default 976 µs
	.loc 1 148 43
	mov	rax, QWORD PTR -64[rbp]	# tmp113, result
	shr	rax, 16	# _5,
	and	eax, 15	# _6,
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:148:     time_unit = 1 / pow(2,(result&0xF0000)>> 16);      // default 976 µs
	.loc 1 148 21
	test	rax, rax	# _6
	js	.L50	#,
	pxor	xmm0, xmm0	# _7
	cvtsi2sd	xmm0, rax	# _7, _6
	jmp	.L51	#
.L50:
	mov	rdx, rax	# tmp115, _6
	shr	rdx	# tmp115
	and	eax, 1	# tmp116,
	or	rdx, rax	# tmp115, tmp116
	pxor	xmm0, xmm0	# tmp114
	cvtsi2sd	xmm0, rdx	# tmp114, tmp115
	addsd	xmm0, xmm0	# _7, tmp114
.L51:
	mov	rax, QWORD PTR .LC9[rip]	# tmp117,
	movapd	xmm1, xmm0	#, _7
	movq	xmm0, rax	#, tmp117
	call	pow@PLT	#
	movapd	xmm1, xmm0	# _8,
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:148:     time_unit = 1 / pow(2,(result&0xF0000)>> 16);      // default 976 µs
	.loc 1 148 15
	movsd	xmm0, QWORD PTR .LC10[rip]	# tmp119,
	divsd	xmm0, xmm1	# tmp118, _8
	movsd	QWORD PTR -48[rbp], xmm0	# time_unit, tmp118
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:150:     printf("Power unit %f\n", power_unit); 
	.loc 1 150 5
	mov	rax, QWORD PTR -56[rbp]	# tmp120, power_unit
	movq	xmm0, rax	#, tmp120
	lea	rax, .LC11[rip]	# tmp121,
	mov	rdi, rax	#, tmp121
	mov	eax, 1	#,
	call	printf@PLT	#
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:151:     printf("Time unit %f\n", time_unit);
	.loc 1 151 5
	mov	rax, QWORD PTR -48[rbp]	# tmp122, time_unit
	movq	xmm0, rax	#, tmp122
	lea	rax, .LC12[rip]	# tmp123,
	mov	rdi, rax	#, tmp123
	mov	eax, 1	#,
	call	printf@PLT	#
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:153:     fd=open_msr(0);
	.loc 1 153 8
	mov	edi, 0	#,
	call	open_msr	#
	mov	DWORD PTR -68[rbp], eax	# fd, tmp124
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:154:     result = read_msr(fd, MSR_PKG_POWER_LIMIT);
	.loc 1 154 14
	mov	eax, DWORD PTR -68[rbp]	# tmp125, fd
	mov	esi, 1552	#,
	mov	edi, eax	#, tmp125
	call	read_msr	#
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:154:     result = read_msr(fd, MSR_PKG_POWER_LIMIT);
	.loc 1 154 12
	mov	QWORD PTR -64[rbp], rax	# result, _9
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:155:     close(fd);
	.loc 1 155 5
	mov	eax, DWORD PTR -68[rbp]	# tmp126, fd
	mov	edi, eax	#, tmp126
	call	close@PLT	#
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:157:     pkg_pl1 = (double)(result&0x7FFF) * power_unit;
	.loc 1 157 30
	mov	rax, QWORD PTR -64[rbp]	# tmp127, result
	and	eax, 32767	# _10,
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:157:     pkg_pl1 = (double)(result&0x7FFF) * power_unit;
	.loc 1 157 15
	test	rax, rax	# _10
	js	.L52	#,
	pxor	xmm0, xmm0	# _11
	cvtsi2sd	xmm0, rax	# _11, _10
	jmp	.L53	#
.L52:
	mov	rdx, rax	# tmp129, _10
	shr	rdx	# tmp129
	and	eax, 1	# tmp130,
	or	rdx, rax	# tmp129, tmp130
	pxor	xmm0, xmm0	# tmp128
	cvtsi2sd	xmm0, rdx	# tmp128, tmp129
	addsd	xmm0, xmm0	# _11, tmp128
.L53:
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:157:     pkg_pl1 = (double)(result&0x7FFF) * power_unit;
	.loc 1 157 13
	movsd	xmm1, QWORD PTR -56[rbp]	# tmp132, power_unit
	mulsd	xmm0, xmm1	# tmp131, tmp132
	movsd	QWORD PTR -40[rbp], xmm0	# pkg_pl1, tmp131
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:158:     time_y = (double)((result&0x3E0000)>>17);
	.loc 1 158 40
	mov	rax, QWORD PTR -64[rbp]	# tmp133, result
	shr	rax, 17	# _12,
	and	eax, 31	# _13,
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:158:     time_y = (double)((result&0x3E0000)>>17);
	.loc 1 158 12
	test	rax, rax	# _13
	js	.L54	#,
	pxor	xmm0, xmm0	# tmp134
	cvtsi2sd	xmm0, rax	# tmp134, _13
	jmp	.L55	#
.L54:
	mov	rdx, rax	# tmp136, _13
	shr	rdx	# tmp136
	and	eax, 1	# tmp137,
	or	rdx, rax	# tmp136, tmp137
	pxor	xmm0, xmm0	# tmp135
	cvtsi2sd	xmm0, rdx	# tmp135, tmp136
	addsd	xmm0, xmm0	# tmp134, tmp135
.L55:
	movsd	QWORD PTR -32[rbp], xmm0	# time_y, tmp134
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:159:     time_z = (double)((result&0xC00000)>>22);
	.loc 1 159 40
	mov	rax, QWORD PTR -64[rbp]	# tmp138, result
	shr	rax, 22	# _14,
	and	eax, 3	# _15,
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:159:     time_z = (double)((result&0xC00000)>>22);
	.loc 1 159 12
	test	rax, rax	# _15
	js	.L56	#,
	pxor	xmm0, xmm0	# tmp139
	cvtsi2sd	xmm0, rax	# tmp139, _15
	jmp	.L57	#
.L56:
	mov	rdx, rax	# tmp141, _15
	shr	rdx	# tmp141
	and	eax, 1	# tmp142,
	or	rdx, rax	# tmp141, tmp142
	pxor	xmm0, xmm0	# tmp140
	cvtsi2sd	xmm0, rdx	# tmp140, tmp141
	addsd	xmm0, xmm0	# tmp139, tmp140
.L57:
	movsd	QWORD PTR -24[rbp], xmm0	# time_z, tmp139
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:160:     pkg_tw1 = pow(2,time_y * (1.0 + time_z / 4.0)) * time_unit;
	.loc 1 160 44
	movsd	xmm0, QWORD PTR -24[rbp]	# tmp143, time_z
	movsd	xmm2, QWORD PTR .LC13[rip]	# tmp144,
	movapd	xmm1, xmm0	# tmp143, tmp143
	divsd	xmm1, xmm2	# tmp143, tmp144
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:160:     pkg_tw1 = pow(2,time_y * (1.0 + time_z / 4.0)) * time_unit;
	.loc 1 160 35
	movsd	xmm0, QWORD PTR .LC10[rip]	# tmp145,
	addsd	xmm0, xmm1	# _17, _16
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:160:     pkg_tw1 = pow(2,time_y * (1.0 + time_z / 4.0)) * time_unit;
	.loc 1 160 15
	mulsd	xmm0, QWORD PTR -32[rbp]	# _18, time_y
	mov	rax, QWORD PTR .LC9[rip]	# tmp146,
	movapd	xmm1, xmm0	#, _18
	movq	xmm0, rax	#, tmp146
	call	pow@PLT	#
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:160:     pkg_tw1 = pow(2,time_y * (1.0 + time_z / 4.0)) * time_unit;
	.loc 1 160 13
	movsd	xmm1, QWORD PTR -48[rbp]	# tmp148, time_unit
	mulsd	xmm0, xmm1	# tmp147, tmp148
	movsd	QWORD PTR -16[rbp], xmm0	# pkg_tw1, tmp147
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:161:     lock = (result>>63)&0x1;
	.loc 1 161 10
	mov	rax, QWORD PTR -64[rbp]	# tmp152, result
	shr	rax, 63	# tmp151,
	mov	QWORD PTR -8[rbp], rax	# lock, tmp151
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:163:     printf("PL1 = %f W\n", pkg_pl1);
	.loc 1 163 5
	mov	rax, QWORD PTR -40[rbp]	# tmp153, pkg_pl1
	movq	xmm0, rax	#, tmp153
	lea	rax, .LC14[rip]	# tmp154,
	mov	rdi, rax	#, tmp154
	mov	eax, 1	#,
	call	printf@PLT	#
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:164:     printf("Time Window = %f s\n", pkg_tw1);
	.loc 1 164 5
	mov	rax, QWORD PTR -16[rbp]	# tmp155, pkg_tw1
	movq	xmm0, rax	#, tmp155
	lea	rax, .LC15[rip]	# tmp156,
	mov	rdi, rax	#, tmp156
	mov	eax, 1	#,
	call	printf@PLT	#
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:165:     printf("Lock status = %lld\n", lock);
	.loc 1 165 5
	mov	rax, QWORD PTR -8[rbp]	# tmp157, lock
	mov	rsi, rax	#, tmp157
	lea	rax, .LC16[rip]	# tmp158,
	mov	rdi, rax	#, tmp158
	mov	eax, 0	#,
	call	printf@PLT	#
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:166:     return 0;
	.loc 1 166 12
	mov	eax, 0	# _46,
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:167: }
	.loc 1 167 1
	leave	
.LCFI14:
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE40:
	.size	core_power_units, .-core_power_units
	.section	.rodata
	.align 8
.LC17:
	.string	"/sys/class/powercap/intel-rapl/intel-rapl:0/energy_uj"
	.align 8
.LC18:
	.string	"/sys/class/powercap/intel-rapl/intel-rapl:0/intel-rapl:0:0/energy_uj"
	.align 8
.LC19:
	.string	"/sys/class/powercap/intel-rapl/intel-rapl:0/intel-rapl:0:1/energy_uj"
.LC20:
	.string	"r"
.LC21:
	.string	"\tError opening %s"
.LC22:
	.string	""
.LC23:
	.string	"%lld"
	.align 8
.LC24:
	.string	"couldnt read from energy counter form %s \n"
	.text
	.globl	get_intel_msr_power_w
	.type	get_intel_msr_power_w, @function
get_intel_msr_power_w:
.LFB41:
	.loc 1 171 1
	.cfi_startproc
	endbr64	
	push	rbp	#
.LCFI15:
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
.LCFI16:
	.cfi_def_cfa_register 6
	sub	rsp, 112	#,
	mov	QWORD PTR -104[rbp], rdi	# power_w, power_w
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:171: {
	.loc 1 171 1
	mov	rax, QWORD PTR fs:40	# tmp134, MEM[(<address-space-1> long unsigned int *)40B]
	mov	QWORD PTR -8[rbp], rax	# D.6975, tmp134
	xor	eax, eax	# tmp134
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:176:     char *power_domains[] = {"/sys/class/powercap/intel-rapl/intel-rapl:0/energy_uj",                   // package domain
	.loc 1 176 11
	lea	rax, .LC17[rip]	# tmp98,
	mov	QWORD PTR -32[rbp], rax	# power_domains[0], tmp98
	lea	rax, .LC18[rip]	# tmp99,
	mov	QWORD PTR -24[rbp], rax	# power_domains[1], tmp99
	lea	rax, .LC19[rip]	# tmp100,
	mov	QWORD PTR -16[rbp], rax	# power_domains[2], tmp100
.LBB8:
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:180:     for (int i = 0; i < POWER_DOMAIN_COUNT; i++) {
	.loc 1 180 14
	mov	DWORD PTR -84[rbp], 0	# i,
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:180:     for (int i = 0; i < POWER_DOMAIN_COUNT; i++) {
	.loc 1 180 5
	jmp	.L60	#
.L64:
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:181:         fp = fopen(power_domains[i],"r");
	.loc 1 181 33
	mov	eax, DWORD PTR -84[rbp]	# tmp102, i
	cdqe
	mov	rax, QWORD PTR -32[rbp+rax*8]	# _1, power_domains[i_17]
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:181:         fp = fopen(power_domains[i],"r");
	.loc 1 181 14
	lea	rdx, .LC20[rip]	# tmp103,
	mov	rsi, rdx	#, tmp103
	mov	rdi, rax	#, _1
	call	fopen@PLT	#
	mov	QWORD PTR -72[rbp], rax	# fp, tmp104
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:182: 				if (fp==NULL) {
	.loc 1 182 8
	cmp	QWORD PTR -72[rbp], 0	# fp,
	jne	.L61	#,
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:183: 					fprintf(stderr,"\tError opening %s", power_domains[i]);
	.loc 1 183 6
	mov	eax, DWORD PTR -84[rbp]	# tmp106, i
	cdqe
	mov	rdx, QWORD PTR -32[rbp+rax*8]	# _2, power_domains[i_17]
	mov	rax, QWORD PTR stderr[rip]	# stderr.14_3, stderr
	lea	rcx, .LC21[rip]	# tmp107,
	mov	rsi, rcx	#, tmp107
	mov	rdi, rax	#, stderr.14_3
	mov	eax, 0	#,
	call	fprintf@PLT	#
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:184:                     perror("");
	.loc 1 184 21
	lea	rax, .LC22[rip]	# tmp108,
	mov	rdi, rax	#, tmp108
	call	perror@PLT	#
	jmp	.L62	#
.L61:
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:187: 					if (fscanf(fp,"%lld",&energy_uj_after[i]) == EOF)
	.loc 1 187 10
	lea	rdx, -64[rbp]	# tmp109,
	mov	eax, DWORD PTR -84[rbp]	# tmp111, i
	cdqe
	sal	rax, 3	# tmp112,
	add	rdx, rax	# _4, tmp112
	mov	rax, QWORD PTR -72[rbp]	# tmp113, fp
	lea	rcx, .LC23[rip]	# tmp114,
	mov	rsi, rcx	#, tmp114
	mov	rdi, rax	#, tmp113
	mov	eax, 0	#,
	call	__isoc99_fscanf@PLT	#
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:187: 					if (fscanf(fp,"%lld",&energy_uj_after[i]) == EOF)
	.loc 1 187 9
	cmp	eax, -1	# _5,
	jne	.L63	#,
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:189:                         printf("couldnt read from energy counter form %s \n", power_domains[i]);
	.loc 1 189 25
	mov	eax, DWORD PTR -84[rbp]	# tmp116, i
	cdqe
	mov	rax, QWORD PTR -32[rbp+rax*8]	# _6, power_domains[i_17]
	mov	rsi, rax	#, _6
	lea	rax, .LC24[rip]	# tmp117,
	mov	rdi, rax	#, tmp117
	mov	eax, 0	#,
	call	printf@PLT	#
.L63:
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:191: 					fclose(fp);
	.loc 1 191 6
	mov	rax, QWORD PTR -72[rbp]	# tmp118, fp
	mov	rdi, rax	#, tmp118
	call	fclose@PLT	#
.L62:
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:180:     for (int i = 0; i < POWER_DOMAIN_COUNT; i++) {
	.loc 1 180 29 discriminator 2
	add	DWORD PTR -84[rbp], 1	# i,
.L60:
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:180:     for (int i = 0; i < POWER_DOMAIN_COUNT; i++) {
	.loc 1 180 23 discriminator 1
	cmp	DWORD PTR -84[rbp], 2	# i,
	jle	.L64	#,
.LBE8:
.LBB9:
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:195:     for (int i = 0; i < POWER_DOMAIN_COUNT; i++){
	.loc 1 195 14
	mov	DWORD PTR -80[rbp], 0	# i,
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:195:     for (int i = 0; i < POWER_DOMAIN_COUNT; i++){
	.loc 1 195 5
	jmp	.L65	#
.L66:
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:196:         power_w[i] = (float)( (energy_uj_after[i] - energy_uj_before[i]) * 1e-6) / (float) POLL_INTERVAL_S ;
	.loc 1 196 47 discriminator 3
	mov	eax, DWORD PTR -80[rbp]	# tmp120, i
	cdqe
	mov	rax, QWORD PTR -64[rbp+rax*8]	# _7, energy_uj_after[i_18]
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:196:         power_w[i] = (float)( (energy_uj_after[i] - energy_uj_before[i]) * 1e-6) / (float) POLL_INTERVAL_S ;
	.loc 1 196 69 discriminator 3
	mov	edx, DWORD PTR -80[rbp]	# tmp122, i
	movsx	rdx, edx	# tmp121, tmp122
	lea	rcx, 0[0+rdx*8]	# tmp123,
	lea	rdx, energy_uj_before.1[rip]	# tmp124,
	mov	rdx, QWORD PTR [rcx+rdx]	# _8, energy_uj_before[i_18]
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:196:         power_w[i] = (float)( (energy_uj_after[i] - energy_uj_before[i]) * 1e-6) / (float) POLL_INTERVAL_S ;
	.loc 1 196 51 discriminator 3
	sub	rax, rdx	# _9, _8
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:196:         power_w[i] = (float)( (energy_uj_after[i] - energy_uj_before[i]) * 1e-6) / (float) POLL_INTERVAL_S ;
	.loc 1 196 74 discriminator 3
	pxor	xmm1, xmm1	# _10
	cvtsi2sd	xmm1, rax	# _10, _9
	movsd	xmm0, QWORD PTR .LC25[rip]	# tmp125,
	mulsd	xmm0, xmm1	# _11, _10
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:196:         power_w[i] = (float)( (energy_uj_after[i] - energy_uj_before[i]) * 1e-6) / (float) POLL_INTERVAL_S ;
	.loc 1 196 16 discriminator 3
	mov	eax, DWORD PTR -80[rbp]	# tmp126, i
	cdqe
	lea	rdx, 0[0+rax*4]	# _13,
	mov	rax, QWORD PTR -104[rbp]	# tmp127, power_w
	add	rax, rdx	# _14, _13
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:196:         power_w[i] = (float)( (energy_uj_after[i] - energy_uj_before[i]) * 1e-6) / (float) POLL_INTERVAL_S ;
	.loc 1 196 82 discriminator 3
	cvtsd2ss	xmm0, xmm0	# _15, _11
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:196:         power_w[i] = (float)( (energy_uj_after[i] - energy_uj_before[i]) * 1e-6) / (float) POLL_INTERVAL_S ;
	.loc 1 196 20 discriminator 3
	movss	DWORD PTR [rax], xmm0	# *_14, _15
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:195:     for (int i = 0; i < POWER_DOMAIN_COUNT; i++){
	.loc 1 195 29 discriminator 3
	add	DWORD PTR -80[rbp], 1	# i,
.L65:
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:195:     for (int i = 0; i < POWER_DOMAIN_COUNT; i++){
	.loc 1 195 23 discriminator 1
	cmp	DWORD PTR -80[rbp], 2	# i,
	jle	.L66	#,
.LBE9:
.LBB10:
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:198:     for (int i = 0; i < POWER_DOMAIN_COUNT; i++){
	.loc 1 198 14
	mov	DWORD PTR -76[rbp], 0	# i,
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:198:     for (int i = 0; i < POWER_DOMAIN_COUNT; i++){
	.loc 1 198 5
	jmp	.L67	#
.L68:
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:199:         energy_uj_before[i] = energy_uj_after[i];
	.loc 1 199 46 discriminator 3
	mov	eax, DWORD PTR -76[rbp]	# tmp129, i
	cdqe
	mov	rax, QWORD PTR -64[rbp+rax*8]	# _16, energy_uj_after[i_19]
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:199:         energy_uj_before[i] = energy_uj_after[i];
	.loc 1 199 29 discriminator 3
	mov	edx, DWORD PTR -76[rbp]	# tmp131, i
	movsx	rdx, edx	# tmp130, tmp131
	lea	rcx, 0[0+rdx*8]	# tmp132,
	lea	rdx, energy_uj_before.1[rip]	# tmp133,
	mov	QWORD PTR [rcx+rdx], rax	# energy_uj_before[i_19], _16
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:198:     for (int i = 0; i < POWER_DOMAIN_COUNT; i++){
	.loc 1 198 29 discriminator 3
	add	DWORD PTR -76[rbp], 1	# i,
.L67:
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:198:     for (int i = 0; i < POWER_DOMAIN_COUNT; i++){
	.loc 1 198 23 discriminator 1
	cmp	DWORD PTR -76[rbp], 2	# i,
	jle	.L68	#,
.LBE10:
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:201: }
	.loc 1 201 1
	nop	
	mov	rax, QWORD PTR -8[rbp]	# tmp135, D.6975
	sub	rax, QWORD PTR fs:40	# tmp135, MEM[(<address-space-1> long unsigned int *)40B]
	je	.L69	#,
	call	__stack_chk_fail@PLT	#
.L69:
	leave	
.LCFI17:
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE41:
	.size	get_intel_msr_power_w, .-get_intel_msr_power_w
	.section	.rodata
	.align 8
.LC26:
	.string	"Reading from AMD_MSR_PACKAGE_ENERGY"
	.align 8
.LC27:
	.string	"Received raw energy Reading = %lld\n"
	.text
	.globl	get_amd_pkg_power_w
	.type	get_amd_pkg_power_w, @function
get_amd_pkg_power_w:
.LFB42:
	.loc 1 204 1
	.cfi_startproc
	endbr64	
	push	rbp	#
.LCFI18:
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
.LCFI19:
	.cfi_def_cfa_register 6
	sub	rsp, 32	#,
	mov	QWORD PTR -24[rbp], rdi	# my_power, my_power
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:209:     float package_after = 0;
	.loc 1 209 11
	pxor	xmm0, xmm0	# tmp88
	movss	DWORD PTR -16[rbp], xmm0	# package_after, tmp88
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:211:     int fp = open_msr(0);
	.loc 1 211 14
	mov	edi, 0	#,
	call	open_msr	#
	mov	DWORD PTR -12[rbp], eax	# fp, tmp89
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:213:     printf("Reading from AMD_MSR_PACKAGE_ENERGY\n");
	.loc 1 213 5
	lea	rax, .LC26[rip]	# tmp90,
	mov	rdi, rax	#, tmp90
	call	puts@PLT	#
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:214:     long long package_raw = read_msr(fp, AMD_MSR_PACKAGE_ENERGY);
	.loc 1 214 29
	mov	eax, DWORD PTR -12[rbp]	# tmp91, fp
	mov	esi, -1073675621	#,
	mov	edi, eax	#, tmp91
	call	read_msr	#
	mov	QWORD PTR -8[rbp], rax	# package_raw, tmp92
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:215:     printf("Received raw energy Reading = %lld\n", package_raw);
	.loc 1 215 5
	mov	rax, QWORD PTR -8[rbp]	# tmp93, package_raw
	mov	rsi, rax	#, tmp93
	lea	rax, .LC27[rip]	# tmp94,
	mov	rdi, rax	#, tmp94
	mov	eax, 0	#,
	call	printf@PLT	#
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:217:     package_after = (float)package_raw * my_power->energy_unit;
	.loc 1 217 21
	pxor	xmm1, xmm1	# _1
	cvtsi2ss	xmm1, QWORD PTR -8[rbp]	# _1, package_raw
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:217:     package_after = (float)package_raw * my_power->energy_unit;
	.loc 1 217 50
	mov	rax, QWORD PTR -24[rbp]	# tmp95, my_power
	movss	xmm0, DWORD PTR 24[rax]	# _2, my_power_13(D)->energy_unit
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:217:     package_after = (float)package_raw * my_power->energy_unit;
	.loc 1 217 19
	mulss	xmm0, xmm1	# tmp96, _1
	movss	DWORD PTR -16[rbp], xmm0	# package_after, tmp96
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:218:     my_power->pkg_now = package_after - package_before;
	.loc 1 218 39
	movss	xmm1, DWORD PTR package_before.0[rip]	# package_before.15_3, package_before
	movss	xmm0, DWORD PTR -16[rbp]	# tmp97, package_after
	subss	xmm0, xmm1	# _4, package_before.15_3
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:218:     my_power->pkg_now = package_after - package_before;
	.loc 1 218 23
	mov	rax, QWORD PTR -24[rbp]	# tmp98, my_power
	movss	DWORD PTR 8[rax], xmm0	# my_power_13(D)->pkg_now, _4
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:219:     package_before = package_after;
	.loc 1 219 20
	movss	xmm0, DWORD PTR -16[rbp]	# tmp99, package_after
	movss	DWORD PTR package_before.0[rip], xmm0	# package_before, tmp99
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:221: 	return 0;
	.loc 1 221 9
	mov	eax, 0	# _17,
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:222: }
	.loc 1 222 1
	leave	
.LCFI20:
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE42:
	.size	get_amd_pkg_power_w, .-get_amd_pkg_power_w
	.globl	get_msr_core_units
	.type	get_msr_core_units, @function
get_msr_core_units:
.LFB43:
	.loc 1 225 1
	.cfi_startproc
	endbr64	
	push	rbp	#
.LCFI21:
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
.LCFI22:
	.cfi_def_cfa_register 6
	sub	rsp, 48	#,
	mov	QWORD PTR -40[rbp], rdi	# my_power, my_power
	mov	DWORD PTR -44[rbp], esi	# designer, designer
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:226:     switch (designer)
	.loc 1 226 5
	cmp	DWORD PTR -44[rbp], 1	# designer,
	jne	.L82	#,
.LBB11:
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:229:             int fp = open_msr(0);   // using units of Core 0 for all others cores
	.loc 1 229 22
	mov	edi, 0	#,
	call	open_msr	#
	mov	DWORD PTR -20[rbp], eax	# fp, tmp102
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:230:             int core_energy_units = read_msr(fp, AMD_MSR_PWR_UNIT);
	.loc 1 230 37
	mov	eax, DWORD PTR -20[rbp]	# tmp103, fp
	mov	esi, -1073675623	#,
	mov	edi, eax	#, tmp103
	call	read_msr	#
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:230:             int core_energy_units = read_msr(fp, AMD_MSR_PWR_UNIT);
	.loc 1 230 17
	mov	DWORD PTR -16[rbp], eax	# core_energy_units, _1
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:231:             unsigned int time_unit_raw = (core_energy_units & AMD_TIME_UNIT_MASK) >> 16;
	.loc 1 231 72
	mov	eax, DWORD PTR -16[rbp]	# tmp104, core_energy_units
	sar	eax, 16	# _2,
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:231:             unsigned int time_unit_raw = (core_energy_units & AMD_TIME_UNIT_MASK) >> 16;
	.loc 1 231 26
	and	eax, 15	# tmp105,
	mov	DWORD PTR -12[rbp], eax	# time_unit_raw, tmp105
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:232: 	        unsigned int energy_unit_raw = (core_energy_units & AMD_ENERGY_UNIT_MASK) >> 8;
	.loc 1 232 70
	mov	eax, DWORD PTR -16[rbp]	# tmp106, core_energy_units
	sar	eax, 8	# _4,
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:232: 	        unsigned int energy_unit_raw = (core_energy_units & AMD_ENERGY_UNIT_MASK) >> 8;
	.loc 1 232 23
	and	eax, 31	# tmp107,
	mov	DWORD PTR -8[rbp], eax	# energy_unit_raw, tmp107
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:233: 	        unsigned int power_unit_raw = (core_energy_units & AMD_POWER_UNIT_MASK);
	.loc 1 233 59
	mov	eax, DWORD PTR -16[rbp]	# core_energy_units.16_6, core_energy_units
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:233: 	        unsigned int power_unit_raw = (core_energy_units & AMD_POWER_UNIT_MASK);
	.loc 1 233 23
	and	eax, 15	# tmp108,
	mov	DWORD PTR -4[rbp], eax	# power_unit_raw, tmp108
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:234:             my_power->time_unit = pow(0.5,(float)(time_unit_raw));
	.loc 1 234 43
	mov	eax, DWORD PTR -12[rbp]	# tmp109, time_unit_raw
	test	rax, rax	# tmp109
	js	.L74	#,
	pxor	xmm0, xmm0	# _7
	cvtsi2ss	xmm0, rax	# _7, tmp109
	jmp	.L75	#
.L74:
	mov	rdx, rax	# tmp111, tmp109
	shr	rdx	# tmp111
	and	eax, 1	# tmp112,
	or	rdx, rax	# tmp111, tmp112
	pxor	xmm0, xmm0	# tmp110
	cvtsi2ss	xmm0, rdx	# tmp110, tmp111
	addss	xmm0, xmm0	# _7, tmp110
.L75:
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:234:             my_power->time_unit = pow(0.5,(float)(time_unit_raw));
	.loc 1 234 35
	cvtss2sd	xmm0, xmm0	# _8, _7
	mov	rax, QWORD PTR .LC28[rip]	# tmp113,
	movapd	xmm1, xmm0	#, _8
	movq	xmm0, rax	#, tmp113
	call	pow@PLT	#
	cvtsd2ss	xmm0, xmm0	# _10, _9
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:234:             my_power->time_unit = pow(0.5,(float)(time_unit_raw));
	.loc 1 234 33
	mov	rax, QWORD PTR -40[rbp]	# tmp114, my_power
	movss	DWORD PTR 20[rax], xmm0	# my_power_30(D)->time_unit, _10
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:235: 	        my_power->energy_unit = pow(0.5,(float)(energy_unit_raw));
	.loc 1 235 42
	mov	eax, DWORD PTR -8[rbp]	# tmp115, energy_unit_raw
	test	rax, rax	# tmp115
	js	.L76	#,
	pxor	xmm0, xmm0	# _11
	cvtsi2ss	xmm0, rax	# _11, tmp115
	jmp	.L77	#
.L76:
	mov	rdx, rax	# tmp117, tmp115
	shr	rdx	# tmp117
	and	eax, 1	# tmp118,
	or	rdx, rax	# tmp117, tmp118
	pxor	xmm0, xmm0	# tmp116
	cvtsi2ss	xmm0, rdx	# tmp116, tmp117
	addss	xmm0, xmm0	# _11, tmp116
.L77:
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:235: 	        my_power->energy_unit = pow(0.5,(float)(energy_unit_raw));
	.loc 1 235 34
	cvtss2sd	xmm0, xmm0	# _12, _11
	mov	rax, QWORD PTR .LC28[rip]	# tmp119,
	movapd	xmm1, xmm0	#, _12
	movq	xmm0, rax	#, tmp119
	call	pow@PLT	#
	cvtsd2ss	xmm0, xmm0	# _14, _13
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:235: 	        my_power->energy_unit = pow(0.5,(float)(energy_unit_raw));
	.loc 1 235 32
	mov	rax, QWORD PTR -40[rbp]	# tmp120, my_power
	movss	DWORD PTR 24[rax], xmm0	# my_power_30(D)->energy_unit, _14
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:236: 	        my_power->power_unit = pow(0.5,(float)(power_unit_raw));
	.loc 1 236 41
	mov	eax, DWORD PTR -4[rbp]	# tmp121, power_unit_raw
	test	rax, rax	# tmp121
	js	.L78	#,
	pxor	xmm0, xmm0	# _15
	cvtsi2ss	xmm0, rax	# _15, tmp121
	jmp	.L79	#
.L78:
	mov	rdx, rax	# tmp123, tmp121
	shr	rdx	# tmp123
	and	eax, 1	# tmp124,
	or	rdx, rax	# tmp123, tmp124
	pxor	xmm0, xmm0	# tmp122
	cvtsi2ss	xmm0, rdx	# tmp122, tmp123
	addss	xmm0, xmm0	# _15, tmp122
.L79:
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:236: 	        my_power->power_unit = pow(0.5,(float)(power_unit_raw));
	.loc 1 236 33
	cvtss2sd	xmm0, xmm0	# _16, _15
	mov	rax, QWORD PTR .LC28[rip]	# tmp125,
	movapd	xmm1, xmm0	#, _16
	movq	xmm0, rax	#, tmp125
	call	pow@PLT	#
	cvtsd2ss	xmm0, xmm0	# _18, _17
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:236: 	        my_power->power_unit = pow(0.5,(float)(power_unit_raw));
	.loc 1 236 31
	mov	rax, QWORD PTR -40[rbp]	# tmp126, my_power
	movss	DWORD PTR 28[rax], xmm0	# my_power_30(D)->power_unit, _18
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:237:             break;
	.loc 1 237 13
	jmp	.L80	#
.L82:
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:239:             break;
	.loc 1 239 13
	nop	
.L80:
.LBE11:
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:242:     return 0;
	.loc 1 242 12
	mov	eax, 0	# _36,
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:243: }
	.loc 1 243 1
	leave	
.LCFI23:
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE43:
	.size	get_msr_core_units, .-get_msr_core_units
	.section	.rodata
.LC29:
	.string	"TEMPERATURE\n"
.LC30:
	.string	"POWER\n"
.LC31:
	.string	"RESIDENCY\n"
.LC32:
	.string	"THERMAL\n"
.LC33:
	.string	"VOLTAGE REGULATOR\n"
.LC34:
	.string	"CURRENT\n"
.LC35:
	.string	"OTHER\n"
.LC36:
	.string	"PL1\n"
.LC37:
	.string	"PL2\n"
.LC38:
	.string	"MC_TURBO\n"
.LC39:
	.string	"TRANSITION ATTENUATION\n"
	.text
	.globl	get_msr_power_limits_w
	.type	get_msr_power_limits_w, @function
get_msr_power_limits_w:
.LFB44:
	.loc 1 321 44
	.cfi_startproc
	endbr64	
	push	rbp	#
.LCFI24:
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
.LCFI25:
	.cfi_def_cfa_register 6
	sub	rsp, 80	#,
	mov	DWORD PTR -68[rbp], edi	# core_count, core_count
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:323:     uint64_t result = 0;
	.loc 1 323 14
	mov	QWORD PTR -8[rbp], 0	# result,
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:325:     int prochot = 0;               // Table 2-2 IA-32 Architectural MSRs
	.loc 1 325 9
	mov	DWORD PTR -56[rbp], 0	# prochot,
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:326:     int thermal = 0;
	.loc 1 326 9
	mov	DWORD PTR -52[rbp], 0	# thermal,
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:327:     int residency_state = 0;
	.loc 1 327 9
	mov	DWORD PTR -48[rbp], 0	# residency_state,
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:328:     int running_average_thermal = 0;
	.loc 1 328 9
	mov	DWORD PTR -44[rbp], 0	# running_average_thermal,
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:329:     int vr_therm = 0;               // thermal alert of processor voltage regulator
	.loc 1 329 9
	mov	DWORD PTR -40[rbp], 0	# vr_therm,
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:330:     int vr_therm_design_current = 0;
	.loc 1 330 9
	mov	DWORD PTR -36[rbp], 0	# vr_therm_design_current,
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:331:     int other = 0;
	.loc 1 331 9
	mov	DWORD PTR -32[rbp], 0	# other,
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:332:     int pkg_pl1 = 0;
	.loc 1 332 9
	mov	DWORD PTR -28[rbp], 0	# pkg_pl1,
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:333:     int pkg_pl2 = 0;
	.loc 1 333 9
	mov	DWORD PTR -24[rbp], 0	# pkg_pl2,
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:334:     int max_turbo_limit = 0;        // multicore turbo limit
	.loc 1 334 9
	mov	DWORD PTR -20[rbp], 0	# max_turbo_limit,
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:335:     int turbo_transition_attenuation = 0;   
	.loc 1 335 9
	mov	DWORD PTR -16[rbp], 0	# turbo_transition_attenuation,
.LBB12:
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:338:     for (int i = 0; i < core_count; i++){
	.loc 1 338 14
	mov	DWORD PTR -60[rbp], 0	# i,
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:338:     for (int i = 0; i < core_count; i++){
	.loc 1 338 5
	jmp	.L84	#
.L85:
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:339:         fd = open_msr(i);
	.loc 1 339 14 discriminator 3
	mov	eax, DWORD PTR -60[rbp]	# tmp94, i
	mov	edi, eax	#, tmp94
	call	open_msr	#
	mov	DWORD PTR -12[rbp], eax	# fd, tmp95
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:340:         result = read_msr(fd,IA32_PACKAGE_THERM_STATUS);
	.loc 1 340 18 discriminator 3
	mov	eax, DWORD PTR -12[rbp]	# tmp96, fd
	mov	esi, 433	#,
	mov	edi, eax	#, tmp96
	call	read_msr	#
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:340:         result = read_msr(fd,IA32_PACKAGE_THERM_STATUS);
	.loc 1 340 16 discriminator 3
	mov	QWORD PTR -8[rbp], rax	# result, _1
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:341:         close(fd);
	.loc 1 341 9 discriminator 3
	mov	eax, DWORD PTR -12[rbp]	# tmp97, fd
	mov	edi, eax	#, tmp97
	call	close@PLT	#
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:338:     for (int i = 0; i < core_count; i++){
	.loc 1 338 38 discriminator 3
	add	DWORD PTR -60[rbp], 1	# i,
.L84:
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:338:     for (int i = 0; i < core_count; i++){
	.loc 1 338 23 discriminator 1
	mov	eax, DWORD PTR -60[rbp]	# tmp98, i
	cmp	eax, DWORD PTR -68[rbp]	# tmp98, core_count
	jl	.L85	#,
.LBE12:
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:344:         prochot = result&PROCHOT;
	.loc 1 344 25
	mov	rax, QWORD PTR -8[rbp]	# tmp99, result
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:344:         prochot = result&PROCHOT;
	.loc 1 344 17
	and	eax, 1	# tmp100,
	mov	DWORD PTR -56[rbp], eax	# prochot, tmp100
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:345:         thermal = result&THERMAL_STATUS;
	.loc 1 345 25
	mov	rax, QWORD PTR -8[rbp]	# tmp101, result
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:345:         thermal = result&THERMAL_STATUS;
	.loc 1 345 17
	and	eax, 2	# tmp102,
	mov	DWORD PTR -52[rbp], eax	# thermal, tmp102
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:346:         residency_state = result&RESIDENCY_STATE_REGULATION_STATUS;
	.loc 1 346 33
	mov	rax, QWORD PTR -8[rbp]	# tmp103, result
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:346:         residency_state = result&RESIDENCY_STATE_REGULATION_STATUS;
	.loc 1 346 25
	and	eax, 16	# tmp104,
	mov	DWORD PTR -48[rbp], eax	# residency_state, tmp104
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:347:         running_average_thermal = result&RUNNING_AVERAGE_THERMAL_LIMIT_STATUS;
	.loc 1 347 41
	mov	rax, QWORD PTR -8[rbp]	# tmp105, result
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:347:         running_average_thermal = result&RUNNING_AVERAGE_THERMAL_LIMIT_STATUS;
	.loc 1 347 33
	and	eax, 32	# tmp106,
	mov	DWORD PTR -44[rbp], eax	# running_average_thermal, tmp106
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:348:         vr_therm = result&VR_THERM_ALERT_STATUS;
	.loc 1 348 26
	mov	rax, QWORD PTR -8[rbp]	# tmp107, result
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:348:         vr_therm = result&VR_THERM_ALERT_STATUS;
	.loc 1 348 18
	and	eax, 64	# tmp108,
	mov	DWORD PTR -40[rbp], eax	# vr_therm, tmp108
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:349:         vr_therm_design_current = result&VR_THERM_DESIGN_CURRENT_STATUS;
	.loc 1 349 41
	mov	rax, QWORD PTR -8[rbp]	# tmp109, result
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:349:         vr_therm_design_current = result&VR_THERM_DESIGN_CURRENT_STATUS;
	.loc 1 349 33
	and	eax, 128	# tmp110,
	mov	DWORD PTR -36[rbp], eax	# vr_therm_design_current, tmp110
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:350:         other = result&OTHER_STATUS;
	.loc 1 350 23
	mov	rax, QWORD PTR -8[rbp]	# tmp111, result
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:350:         other = result&OTHER_STATUS;
	.loc 1 350 15
	and	eax, 256	# tmp112,
	mov	DWORD PTR -32[rbp], eax	# other, tmp112
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:351:         pkg_pl1 = result&PKG_PL1_STATUS;
	.loc 1 351 25
	mov	rax, QWORD PTR -8[rbp]	# tmp113, result
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:351:         pkg_pl1 = result&PKG_PL1_STATUS;
	.loc 1 351 17
	and	eax, 1024	# tmp114,
	mov	DWORD PTR -28[rbp], eax	# pkg_pl1, tmp114
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:352:         pkg_pl2 = result&PKG_PL2_STATUS;
	.loc 1 352 25
	mov	rax, QWORD PTR -8[rbp]	# tmp115, result
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:352:         pkg_pl2 = result&PKG_PL2_STATUS;
	.loc 1 352 17
	and	eax, 2048	# tmp116,
	mov	DWORD PTR -24[rbp], eax	# pkg_pl2, tmp116
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:353:         max_turbo_limit = result&MAX_TURBO_LIMIT_STATUS;
	.loc 1 353 33
	mov	rax, QWORD PTR -8[rbp]	# tmp117, result
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:353:         max_turbo_limit = result&MAX_TURBO_LIMIT_STATUS;
	.loc 1 353 25
	and	eax, 4096	# tmp118,
	mov	DWORD PTR -20[rbp], eax	# max_turbo_limit, tmp118
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:354:         turbo_transition_attenuation = result&TURBO_TRANSITION_ATTENUATION_STATUS;
	.loc 1 354 46
	mov	rax, QWORD PTR -8[rbp]	# tmp119, result
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:354:         turbo_transition_attenuation = result&TURBO_TRANSITION_ATTENUATION_STATUS;
	.loc 1 354 38
	and	eax, 8192	# tmp120,
	mov	DWORD PTR -16[rbp], eax	# turbo_transition_attenuation, tmp120
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:356:     if (prochot == 1) printw("TEMPERATURE\n");
	.loc 1 356 8
	cmp	DWORD PTR -56[rbp], 1	# prochot,
	jne	.L86	#,
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:356:     if (prochot == 1) printw("TEMPERATURE\n");
	.loc 1 356 23 discriminator 1
	lea	rax, .LC29[rip]	# tmp121,
	mov	rdi, rax	#, tmp121
	mov	eax, 0	#,
	call	printw@PLT	#
.L86:
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:357:     if (thermal == 1) printw("POWER\n");
	.loc 1 357 8
	cmp	DWORD PTR -52[rbp], 1	# thermal,
	jne	.L87	#,
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:357:     if (thermal == 1) printw("POWER\n");
	.loc 1 357 23 discriminator 1
	lea	rax, .LC30[rip]	# tmp122,
	mov	rdi, rax	#, tmp122
	mov	eax, 0	#,
	call	printw@PLT	#
.L87:
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:358:     if (residency_state == 1) printw("RESIDENCY\n"); 
	.loc 1 358 8
	cmp	DWORD PTR -48[rbp], 1	# residency_state,
	jne	.L88	#,
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:358:     if (residency_state == 1) printw("RESIDENCY\n"); 
	.loc 1 358 31 discriminator 1
	lea	rax, .LC31[rip]	# tmp123,
	mov	rdi, rax	#, tmp123
	mov	eax, 0	#,
	call	printw@PLT	#
.L88:
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:359:     if (running_average_thermal == 1) printw("THERMAL\n"); 
	.loc 1 359 8
	cmp	DWORD PTR -44[rbp], 1	# running_average_thermal,
	jne	.L89	#,
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:359:     if (running_average_thermal == 1) printw("THERMAL\n"); 
	.loc 1 359 39 discriminator 1
	lea	rax, .LC32[rip]	# tmp124,
	mov	rdi, rax	#, tmp124
	mov	eax, 0	#,
	call	printw@PLT	#
.L89:
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:360:     if (vr_therm == 1) printw("VOLTAGE REGULATOR\n");  
	.loc 1 360 8
	cmp	DWORD PTR -40[rbp], 1	# vr_therm,
	jne	.L90	#,
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:360:     if (vr_therm == 1) printw("VOLTAGE REGULATOR\n");  
	.loc 1 360 24 discriminator 1
	lea	rax, .LC33[rip]	# tmp125,
	mov	rdi, rax	#, tmp125
	mov	eax, 0	#,
	call	printw@PLT	#
.L90:
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:361:     if (vr_therm_design_current == 1) printw("CURRENT\n");   
	.loc 1 361 8
	cmp	DWORD PTR -36[rbp], 1	# vr_therm_design_current,
	jne	.L91	#,
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:361:     if (vr_therm_design_current == 1) printw("CURRENT\n");   
	.loc 1 361 39 discriminator 1
	lea	rax, .LC34[rip]	# tmp126,
	mov	rdi, rax	#, tmp126
	mov	eax, 0	#,
	call	printw@PLT	#
.L91:
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:362:     if (other == 1) printw("OTHER\n"); 
	.loc 1 362 8
	cmp	DWORD PTR -32[rbp], 1	# other,
	jne	.L92	#,
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:362:     if (other == 1) printw("OTHER\n"); 
	.loc 1 362 21 discriminator 1
	lea	rax, .LC35[rip]	# tmp127,
	mov	rdi, rax	#, tmp127
	mov	eax, 0	#,
	call	printw@PLT	#
.L92:
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:363:     if (pkg_pl1 == 1) printw("PL1\n"); 
	.loc 1 363 8
	cmp	DWORD PTR -28[rbp], 1	# pkg_pl1,
	jne	.L93	#,
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:363:     if (pkg_pl1 == 1) printw("PL1\n"); 
	.loc 1 363 23 discriminator 1
	lea	rax, .LC36[rip]	# tmp128,
	mov	rdi, rax	#, tmp128
	mov	eax, 0	#,
	call	printw@PLT	#
.L93:
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:364:     if (pkg_pl2 == 1) printw("PL2\n"); 
	.loc 1 364 8
	cmp	DWORD PTR -24[rbp], 1	# pkg_pl2,
	jne	.L94	#,
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:364:     if (pkg_pl2 == 1) printw("PL2\n"); 
	.loc 1 364 23 discriminator 1
	lea	rax, .LC37[rip]	# tmp129,
	mov	rdi, rax	#, tmp129
	mov	eax, 0	#,
	call	printw@PLT	#
.L94:
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:365:     if (max_turbo_limit == 1) printw("MC_TURBO\n"); 
	.loc 1 365 8
	cmp	DWORD PTR -20[rbp], 1	# max_turbo_limit,
	jne	.L95	#,
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:365:     if (max_turbo_limit == 1) printw("MC_TURBO\n"); 
	.loc 1 365 31 discriminator 1
	lea	rax, .LC38[rip]	# tmp130,
	mov	rdi, rax	#, tmp130
	mov	eax, 0	#,
	call	printw@PLT	#
.L95:
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:366:     if (turbo_transition_attenuation == 1) printw("TRANSITION ATTENUATION\n"); 
	.loc 1 366 8
	cmp	DWORD PTR -16[rbp], 1	# turbo_transition_attenuation,
	jne	.L97	#,
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:366:     if (turbo_transition_attenuation == 1) printw("TRANSITION ATTENUATION\n"); 
	.loc 1 366 44 discriminator 1
	lea	rax, .LC39[rip]	# tmp131,
	mov	rdi, rax	#, tmp131
	mov	eax, 0	#,
	call	printw@PLT	#
.L97:
# /home/jscha/dvp/cpumon/src/machine_specific_registers.c:367: }
	.loc 1 367 1
	nop	
	leave	
.LCFI26:
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE44:
	.size	get_msr_power_limits_w, .-get_msr_power_limits_w
	.local	energy_uj_before.1
	.comm	energy_uj_before.1,24,16
	.local	package_before.0
	.comm	package_before.0,4,4
	.section	.rodata
	.align 8
.LC7:
	.long	0
	.long	1059061760
	.align 8
.LC9:
	.long	0
	.long	1073741824
	.align 8
.LC10:
	.long	0
	.long	1072693248
	.align 8
.LC13:
	.long	0
	.long	1074790400
	.align 8
.LC25:
	.long	-1598689907
	.long	1051772663
	.align 8
.LC28:
	.long	0
	.long	1071644672
	.text
.Letext0:
	.file 2 "/usr/lib/gcc/x86_64-linux-gnu/11/include/stddef.h"
	.file 3 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 4 "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h"
	.file 5 "/usr/include/x86_64-linux-gnu/bits/types/FILE.h"
	.file 6 "/usr/include/stdio.h"
	.file 7 "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h"
	.file 8 "/home/jscha/dvp/cpumon/src/../include/cpumonlib.h"
	.file 9 "/usr/include/curses.h"
	.file 10 "/usr/include/unistd.h"
	.file 11 "/usr/include/stdlib.h"
	.file 12 "/usr/include/fcntl.h"
	.file 13 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h"
	.file 14 "/usr/include/errno.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xcc2
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF3632
	.byte	0xc
	.long	.LASF3633
	.long	.LASF3634
	.quad	.Ltext0
	.quad	.Letext0
	.long	.Ldebug_line0
	.long	.Ldebug_macro0
	.uleb128 0x2
	.long	.LASF3512
	.byte	0x2
	.byte	0xd1
	.byte	0x1b
	.long	0x3d
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF3505
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF3506
	.uleb128 0x4
	.byte	0x8
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF3507
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF3508
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF3509
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF3510
	.uleb128 0x5
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF3511
	.uleb128 0x2
	.long	.LASF3513
	.byte	0x3
	.byte	0x2d
	.byte	0x1b
	.long	0x3d
	.uleb128 0x2
	.long	.LASF3514
	.byte	0x3
	.byte	0x98
	.byte	0x12
	.long	0x70
	.uleb128 0x2
	.long	.LASF3515
	.byte	0x3
	.byte	0x99
	.byte	0x12
	.long	0x70
	.uleb128 0x2
	.long	.LASF3516
	.byte	0x3
	.byte	0xc2
	.byte	0x12
	.long	0x70
	.uleb128 0x6
	.byte	0x8
	.long	0xad
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF3517
	.uleb128 0x7
	.long	0xad
	.uleb128 0x8
	.long	.LASF3558
	.byte	0xd8
	.byte	0x4
	.byte	0x31
	.byte	0x8
	.long	0x286
	.uleb128 0x9
	.long	.LASF3518
	.byte	0x4
	.byte	0x33
	.byte	0x7
	.long	0x69
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x9
	.long	.LASF3519
	.byte	0x4
	.byte	0x36
	.byte	0x9
	.long	0xa7
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x9
	.long	.LASF3520
	.byte	0x4
	.byte	0x37
	.byte	0x9
	.long	0xa7
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x9
	.long	.LASF3521
	.byte	0x4
	.byte	0x38
	.byte	0x9
	.long	0xa7
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x9
	.long	.LASF3522
	.byte	0x4
	.byte	0x39
	.byte	0x9
	.long	0xa7
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x9
	.long	.LASF3523
	.byte	0x4
	.byte	0x3a
	.byte	0x9
	.long	0xa7
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x9
	.long	.LASF3524
	.byte	0x4
	.byte	0x3b
	.byte	0x9
	.long	0xa7
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0x9
	.long	.LASF3525
	.byte	0x4
	.byte	0x3c
	.byte	0x9
	.long	0xa7
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.uleb128 0x9
	.long	.LASF3526
	.byte	0x4
	.byte	0x3d
	.byte	0x9
	.long	0xa7
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0x9
	.long	.LASF3527
	.byte	0x4
	.byte	0x40
	.byte	0x9
	.long	0xa7
	.byte	0x2
	.byte	0x23
	.uleb128 0x48
	.uleb128 0x9
	.long	.LASF3528
	.byte	0x4
	.byte	0x41
	.byte	0x9
	.long	0xa7
	.byte	0x2
	.byte	0x23
	.uleb128 0x50
	.uleb128 0x9
	.long	.LASF3529
	.byte	0x4
	.byte	0x42
	.byte	0x9
	.long	0xa7
	.byte	0x2
	.byte	0x23
	.uleb128 0x58
	.uleb128 0x9
	.long	.LASF3530
	.byte	0x4
	.byte	0x44
	.byte	0x16
	.long	0x2a0
	.byte	0x2
	.byte	0x23
	.uleb128 0x60
	.uleb128 0x9
	.long	.LASF3531
	.byte	0x4
	.byte	0x46
	.byte	0x14
	.long	0x2a6
	.byte	0x2
	.byte	0x23
	.uleb128 0x68
	.uleb128 0x9
	.long	.LASF3532
	.byte	0x4
	.byte	0x48
	.byte	0x7
	.long	0x69
	.byte	0x2
	.byte	0x23
	.uleb128 0x70
	.uleb128 0x9
	.long	.LASF3533
	.byte	0x4
	.byte	0x49
	.byte	0x7
	.long	0x69
	.byte	0x2
	.byte	0x23
	.uleb128 0x74
	.uleb128 0x9
	.long	.LASF3534
	.byte	0x4
	.byte	0x4a
	.byte	0xb
	.long	0x83
	.byte	0x2
	.byte	0x23
	.uleb128 0x78
	.uleb128 0x9
	.long	.LASF3535
	.byte	0x4
	.byte	0x4d
	.byte	0x12
	.long	0x54
	.byte	0x3
	.byte	0x23
	.uleb128 0x80
	.uleb128 0x9
	.long	.LASF3536
	.byte	0x4
	.byte	0x4e
	.byte	0xf
	.long	0x5b
	.byte	0x3
	.byte	0x23
	.uleb128 0x82
	.uleb128 0x9
	.long	.LASF3537
	.byte	0x4
	.byte	0x4f
	.byte	0x8
	.long	0x2ac
	.byte	0x3
	.byte	0x23
	.uleb128 0x83
	.uleb128 0x9
	.long	.LASF3538
	.byte	0x4
	.byte	0x51
	.byte	0xf
	.long	0x2bc
	.byte	0x3
	.byte	0x23
	.uleb128 0x88
	.uleb128 0x9
	.long	.LASF3539
	.byte	0x4
	.byte	0x59
	.byte	0xd
	.long	0x8f
	.byte	0x3
	.byte	0x23
	.uleb128 0x90
	.uleb128 0x9
	.long	.LASF3540
	.byte	0x4
	.byte	0x5b
	.byte	0x17
	.long	0x2c8
	.byte	0x3
	.byte	0x23
	.uleb128 0x98
	.uleb128 0x9
	.long	.LASF3541
	.byte	0x4
	.byte	0x5c
	.byte	0x19
	.long	0x2d4
	.byte	0x3
	.byte	0x23
	.uleb128 0xa0
	.uleb128 0x9
	.long	.LASF3542
	.byte	0x4
	.byte	0x5d
	.byte	0x14
	.long	0x2a6
	.byte	0x3
	.byte	0x23
	.uleb128 0xa8
	.uleb128 0x9
	.long	.LASF3543
	.byte	0x4
	.byte	0x5e
	.byte	0x9
	.long	0x4b
	.byte	0x3
	.byte	0x23
	.uleb128 0xb0
	.uleb128 0x9
	.long	.LASF3544
	.byte	0x4
	.byte	0x5f
	.byte	0xa
	.long	0x31
	.byte	0x3
	.byte	0x23
	.uleb128 0xb8
	.uleb128 0x9
	.long	.LASF3545
	.byte	0x4
	.byte	0x60
	.byte	0x7
	.long	0x69
	.byte	0x3
	.byte	0x23
	.uleb128 0xc0
	.uleb128 0x9
	.long	.LASF3546
	.byte	0x4
	.byte	0x62
	.byte	0x8
	.long	0x2da
	.byte	0x3
	.byte	0x23
	.uleb128 0xc4
	.byte	0
	.uleb128 0x2
	.long	.LASF3547
	.byte	0x5
	.byte	0x7
	.byte	0x19
	.long	0xb9
	.uleb128 0xa
	.long	.LASF3635
	.byte	0x4
	.byte	0x2b
	.byte	0xe
	.uleb128 0xb
	.long	.LASF3548
	.byte	0x1
	.uleb128 0x6
	.byte	0x8
	.long	0x29a
	.uleb128 0x6
	.byte	0x8
	.long	0xb9
	.uleb128 0xc
	.long	0xad
	.long	0x2bc
	.uleb128 0xd
	.long	0x3d
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x292
	.uleb128 0xb
	.long	.LASF3549
	.byte	0x1
	.uleb128 0x6
	.byte	0x8
	.long	0x2c2
	.uleb128 0xb
	.long	.LASF3550
	.byte	0x1
	.uleb128 0x6
	.byte	0x8
	.long	0x2ce
	.uleb128 0xc
	.long	0xad
	.long	0x2ea
	.uleb128 0xd
	.long	0x3d
	.byte	0x13
	.byte	0
	.uleb128 0x2
	.long	.LASF3551
	.byte	0x6
	.byte	0x4d
	.byte	0x13
	.long	0x9b
	.uleb128 0x6
	.byte	0x8
	.long	0x286
	.uleb128 0xe
	.long	.LASF3636
	.byte	0x6
	.byte	0x91
	.byte	0xe
	.long	0x2f6
	.byte	0x1
	.byte	0x1
	.uleb128 0x2
	.long	.LASF3552
	.byte	0x7
	.byte	0x1b
	.byte	0x14
	.long	0x77
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF3553
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF3554
	.uleb128 0x3
	.byte	0x4
	.byte	0x4
	.long	.LASF3555
	.uleb128 0x3
	.byte	0x8
	.byte	0x4
	.long	.LASF3556
	.uleb128 0x3
	.byte	0x1
	.byte	0x2
	.long	.LASF3557
	.uleb128 0xc
	.long	0x324
	.long	0x348
	.uleb128 0xf
	.long	0x3d
	.byte	0
	.uleb128 0x8
	.long	.LASF3559
	.byte	0x20
	.byte	0x8
	.byte	0x19
	.byte	0x8
	.long	0x3dd
	.uleb128 0x9
	.long	.LASF3560
	.byte	0x8
	.byte	0x1a
	.byte	0xb
	.long	0x324
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x10
	.string	"gpu"
	.byte	0x8
	.byte	0x1b
	.byte	0xb
	.long	0x324
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x9
	.long	.LASF3561
	.byte	0x8
	.byte	0x1c
	.byte	0xb
	.long	0x324
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x9
	.long	.LASF3562
	.byte	0x8
	.byte	0x1d
	.byte	0xb
	.long	0x324
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x9
	.long	.LASF3563
	.byte	0x8
	.byte	0x1e
	.byte	0xb
	.long	0x324
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x9
	.long	.LASF3564
	.byte	0x8
	.byte	0x1f
	.byte	0xb
	.long	0x324
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x9
	.long	.LASF3565
	.byte	0x8
	.byte	0x1f
	.byte	0x16
	.long	0x324
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x9
	.long	.LASF3566
	.byte	0x8
	.byte	0x1f
	.byte	0x23
	.long	0x324
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x9
	.long	.LASF3567
	.byte	0x8
	.byte	0x20
	.byte	0xb
	.long	0x339
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.byte	0
	.uleb128 0x2
	.long	.LASF3559
	.byte	0x8
	.byte	0x22
	.byte	0x16
	.long	0x348
	.uleb128 0x11
	.byte	0x7
	.byte	0x4
	.long	0x44
	.byte	0x8
	.byte	0x2f
	.byte	0xe
	.long	0x404
	.uleb128 0x12
	.long	.LASF3568
	.byte	0
	.uleb128 0x13
	.string	"AMD"
	.byte	0x1
	.byte	0
	.uleb128 0x2
	.long	.LASF3569
	.byte	0x8
	.byte	0x2f
	.byte	0x1d
	.long	0x3e9
	.uleb128 0x3
	.byte	0x10
	.byte	0x5
	.long	.LASF3570
	.uleb128 0x3
	.byte	0x10
	.byte	0x7
	.long	.LASF3571
	.uleb128 0x14
	.byte	0x1
	.long	.LASF3572
	.byte	0x9
	.value	0x2f9
	.byte	0xc
	.byte	0x1
	.long	0x69
	.byte	0x1
	.long	0x439
	.uleb128 0x15
	.long	0x439
	.uleb128 0x16
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0xb4
	.uleb128 0x17
	.byte	0x1
	.long	.LASF3573
	.byte	0x6
	.byte	0xb2
	.byte	0xc
	.byte	0x1
	.long	0x69
	.byte	0x1
	.long	0x458
	.uleb128 0x15
	.long	0x2f6
	.byte	0
	.uleb128 0x18
	.byte	0x1
	.long	.LASF3637
	.byte	0x6
	.value	0x1b2
	.byte	0xc
	.long	.LASF3638
	.byte	0x1
	.long	0x69
	.byte	0x1
	.long	0x47c
	.uleb128 0x15
	.long	0x2f6
	.uleb128 0x15
	.long	0x439
	.uleb128 0x16
	.byte	0
	.uleb128 0x14
	.byte	0x1
	.long	.LASF3574
	.byte	0x6
	.value	0x102
	.byte	0xe
	.byte	0x1
	.long	0x2f6
	.byte	0x1
	.long	0x49b
	.uleb128 0x15
	.long	0x439
	.uleb128 0x15
	.long	0x439
	.byte	0
	.uleb128 0x14
	.byte	0x1
	.long	.LASF3575
	.byte	0x6
	.value	0x164
	.byte	0xc
	.byte	0x1
	.long	0x69
	.byte	0x1
	.long	0x4b6
	.uleb128 0x15
	.long	0x439
	.uleb128 0x16
	.byte	0
	.uleb128 0x19
	.byte	0x1
	.string	"pow"
	.byte	0xd
	.byte	0x8c
	.byte	0x10
	.byte	0x1
	.long	0x32b
	.byte	0x1
	.long	0x4d4
	.uleb128 0x15
	.long	0x32b
	.uleb128 0x15
	.long	0x32b
	.byte	0
	.uleb128 0x14
	.byte	0x1
	.long	.LASF3576
	.byte	0xa
	.value	0x166
	.byte	0xc
	.byte	0x1
	.long	0x69
	.byte	0x1
	.long	0x4ee
	.uleb128 0x15
	.long	0x69
	.byte	0
	.uleb128 0x14
	.byte	0x1
	.long	.LASF3577
	.byte	0xa
	.value	0x185
	.byte	0x10
	.byte	0x1
	.long	0x2ea
	.byte	0x1
	.long	0x517
	.uleb128 0x15
	.long	0x69
	.uleb128 0x15
	.long	0x4b
	.uleb128 0x15
	.long	0x31
	.uleb128 0x15
	.long	0x83
	.byte	0
	.uleb128 0x1a
	.byte	0x1
	.long	.LASF3639
	.byte	0x6
	.value	0x324
	.byte	0xd
	.byte	0x1
	.byte	0x1
	.long	0x52d
	.uleb128 0x15
	.long	0x439
	.byte	0
	.uleb128 0x1b
	.byte	0x1
	.long	.LASF3578
	.byte	0xb
	.value	0x270
	.byte	0xd
	.byte	0x1
	.byte	0x1
	.byte	0x1
	.long	0x544
	.uleb128 0x15
	.long	0x69
	.byte	0
	.uleb128 0x14
	.byte	0x1
	.long	.LASF3579
	.byte	0x6
	.value	0x15e
	.byte	0xc
	.byte	0x1
	.long	0x69
	.byte	0x1
	.long	0x564
	.uleb128 0x15
	.long	0x2f6
	.uleb128 0x15
	.long	0x439
	.uleb128 0x16
	.byte	0
	.uleb128 0x1c
	.byte	0x1
	.long	.LASF3640
	.byte	0xe
	.byte	0x25
	.byte	0xd
	.byte	0x1
	.long	0x573
	.byte	0x1
	.uleb128 0x6
	.byte	0x8
	.long	0x69
	.uleb128 0x17
	.byte	0x1
	.long	.LASF3580
	.byte	0xc
	.byte	0xb5
	.byte	0xc
	.byte	0x1
	.long	0x69
	.byte	0x1
	.long	0x598
	.uleb128 0x15
	.long	0x439
	.uleb128 0x15
	.long	0x69
	.uleb128 0x16
	.byte	0
	.uleb128 0x14
	.byte	0x1
	.long	.LASF3581
	.byte	0x6
	.value	0x166
	.byte	0xc
	.byte	0x1
	.long	0x69
	.byte	0x1
	.long	0x5b8
	.uleb128 0x15
	.long	0xa7
	.uleb128 0x15
	.long	0x439
	.uleb128 0x16
	.byte	0
	.uleb128 0x1d
	.byte	0x1
	.long	.LASF3606
	.byte	0x1
	.value	0x141
	.byte	0x6
	.byte	0x1
	.quad	.LFB44
	.quad	.LFE44
	.long	.LLST8
	.byte	0x1
	.long	0x6e0
	.uleb128 0x1e
	.long	.LASF3594
	.byte	0x1
	.value	0x141
	.byte	0x21
	.long	0x69
	.byte	0x3
	.byte	0x91
	.sleb128 -84
	.uleb128 0x1f
	.string	"fd"
	.byte	0x1
	.value	0x142
	.byte	0x9
	.long	0x69
	.byte	0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x20
	.long	.LASF3582
	.byte	0x1
	.value	0x143
	.byte	0xe
	.long	0x30a
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x20
	.long	.LASF3583
	.byte	0x1
	.value	0x145
	.byte	0x9
	.long	0x69
	.byte	0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x20
	.long	.LASF3584
	.byte	0x1
	.value	0x146
	.byte	0x9
	.long	0x69
	.byte	0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x20
	.long	.LASF3585
	.byte	0x1
	.value	0x147
	.byte	0x9
	.long	0x69
	.byte	0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x20
	.long	.LASF3586
	.byte	0x1
	.value	0x148
	.byte	0x9
	.long	0x69
	.byte	0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x20
	.long	.LASF3587
	.byte	0x1
	.value	0x149
	.byte	0x9
	.long	0x69
	.byte	0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x20
	.long	.LASF3588
	.byte	0x1
	.value	0x14a
	.byte	0x9
	.long	0x69
	.byte	0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x20
	.long	.LASF3589
	.byte	0x1
	.value	0x14b
	.byte	0x9
	.long	0x69
	.byte	0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x20
	.long	.LASF3590
	.byte	0x1
	.value	0x14c
	.byte	0x9
	.long	0x69
	.byte	0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x20
	.long	.LASF3591
	.byte	0x1
	.value	0x14d
	.byte	0x9
	.long	0x69
	.byte	0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x20
	.long	.LASF3592
	.byte	0x1
	.value	0x14e
	.byte	0x9
	.long	0x69
	.byte	0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x20
	.long	.LASF3593
	.byte	0x1
	.value	0x14f
	.byte	0x9
	.long	0x69
	.byte	0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x21
	.quad	.LBB12
	.quad	.LBE12
	.uleb128 0x1f
	.string	"i"
	.byte	0x1
	.value	0x152
	.byte	0xe
	.long	0x69
	.byte	0x3
	.byte	0x91
	.sleb128 -76
	.byte	0
	.byte	0
	.uleb128 0x22
	.byte	0x1
	.long	.LASF3601
	.byte	0x1
	.byte	0xe0
	.byte	0x5
	.byte	0x1
	.long	0x69
	.quad	.LFB43
	.quad	.LFE43
	.long	.LLST7
	.byte	0x1
	.long	0x782
	.uleb128 0x23
	.long	.LASF3595
	.byte	0x1
	.byte	0xe0
	.byte	0x1f
	.long	0x782
	.byte	0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x23
	.long	.LASF3596
	.byte	0x1
	.byte	0xe0
	.byte	0x38
	.long	0x404
	.byte	0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x21
	.quad	.LBB11
	.quad	.LBE11
	.uleb128 0x24
	.string	"fp"
	.byte	0x1
	.byte	0xe5
	.byte	0x11
	.long	0x69
	.byte	0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x25
	.long	.LASF3597
	.byte	0x1
	.byte	0xe6
	.byte	0x11
	.long	0x69
	.byte	0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x25
	.long	.LASF3598
	.byte	0x1
	.byte	0xe7
	.byte	0x1a
	.long	0x44
	.byte	0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x25
	.long	.LASF3599
	.byte	0x1
	.byte	0xe8
	.byte	0x17
	.long	0x44
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x25
	.long	.LASF3600
	.byte	0x1
	.byte	0xe9
	.byte	0x17
	.long	0x44
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x3dd
	.uleb128 0x22
	.byte	0x1
	.long	.LASF3602
	.byte	0x1
	.byte	0xcb
	.byte	0x5
	.byte	0x1
	.long	0x69
	.quad	.LFB42
	.quad	.LFE42
	.long	.LLST6
	.byte	0x1
	.long	0x801
	.uleb128 0x23
	.long	.LASF3595
	.byte	0x1
	.byte	0xcb
	.byte	0x20
	.long	0x782
	.byte	0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x25
	.long	.LASF3603
	.byte	0x1
	.byte	0xd0
	.byte	0x12
	.long	0x324
	.byte	0x9
	.byte	0x3
	.quad	package_before.0
	.uleb128 0x25
	.long	.LASF3604
	.byte	0x1
	.byte	0xd1
	.byte	0xb
	.long	0x324
	.byte	0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x24
	.string	"fp"
	.byte	0x1
	.byte	0xd3
	.byte	0x9
	.long	0x69
	.byte	0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x25
	.long	.LASF3605
	.byte	0x1
	.byte	0xd6
	.byte	0xf
	.long	0x316
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x26
	.byte	0x1
	.long	.LASF3607
	.byte	0x1
	.byte	0xaa
	.byte	0x6
	.byte	0x1
	.quad	.LFB41
	.quad	.LFE41
	.long	.LLST5
	.byte	0x1
	.long	0x8e1
	.uleb128 0x23
	.long	.LASF3608
	.byte	0x1
	.byte	0xaa
	.byte	0x24
	.long	0x8e1
	.byte	0x3
	.byte	0x91
	.sleb128 -120
	.uleb128 0x24
	.string	"fp"
	.byte	0x1
	.byte	0xac
	.byte	0x8
	.long	0x2f6
	.byte	0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x25
	.long	.LASF3609
	.byte	0x1
	.byte	0xad
	.byte	0x16
	.long	0x8e7
	.byte	0x9
	.byte	0x3
	.quad	energy_uj_before.1
	.uleb128 0x25
	.long	.LASF3610
	.byte	0x1
	.byte	0xae
	.byte	0xf
	.long	0x8e7
	.byte	0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x25
	.long	.LASF3611
	.byte	0x1
	.byte	0xb0
	.byte	0xb
	.long	0x8f7
	.byte	0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x27
	.quad	.LBB8
	.quad	.LBE8
	.long	0x89c
	.uleb128 0x24
	.string	"i"
	.byte	0x1
	.byte	0xb4
	.byte	0xe
	.long	0x69
	.byte	0x3
	.byte	0x91
	.sleb128 -100
	.byte	0
	.uleb128 0x27
	.quad	.LBB9
	.quad	.LBE9
	.long	0x8c0
	.uleb128 0x24
	.string	"i"
	.byte	0x1
	.byte	0xc3
	.byte	0xe
	.long	0x69
	.byte	0x3
	.byte	0x91
	.sleb128 -96
	.byte	0
	.uleb128 0x21
	.quad	.LBB10
	.quad	.LBE10
	.uleb128 0x24
	.string	"i"
	.byte	0x1
	.byte	0xc6
	.byte	0xe
	.long	0x69
	.byte	0x3
	.byte	0x91
	.sleb128 -92
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x324
	.uleb128 0xc
	.long	0x316
	.long	0x8f7
	.uleb128 0xd
	.long	0x3d
	.byte	0x2
	.byte	0
	.uleb128 0xc
	.long	0xa7
	.long	0x907
	.uleb128 0xd
	.long	0x3d
	.byte	0x2
	.byte	0
	.uleb128 0x22
	.byte	0x1
	.long	.LASF3612
	.byte	0x1
	.byte	0x87
	.byte	0xa
	.byte	0x1
	.long	0x9b8
	.quad	.LFB40
	.quad	.LFE40
	.long	.LLST4
	.byte	0x1
	.long	0x9b8
	.uleb128 0x24
	.string	"fd"
	.byte	0x1
	.byte	0x89
	.byte	0x9
	.long	0x69
	.byte	0x3
	.byte	0x91
	.sleb128 -84
	.uleb128 0x25
	.long	.LASF3582
	.byte	0x1
	.byte	0x8a
	.byte	0x18
	.long	0x31d
	.byte	0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x25
	.long	.LASF3613
	.byte	0x1
	.byte	0x8a
	.byte	0x20
	.long	0x31d
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x25
	.long	.LASF3566
	.byte	0x1
	.byte	0x8b
	.byte	0xc
	.long	0x32b
	.byte	0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x25
	.long	.LASF3564
	.byte	0x1
	.byte	0x8b
	.byte	0x18
	.long	0x32b
	.byte	0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x25
	.long	.LASF3614
	.byte	0x1
	.byte	0x8b
	.byte	0x23
	.long	0x32b
	.byte	0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x25
	.long	.LASF3615
	.byte	0x1
	.byte	0x8b
	.byte	0x2b
	.long	0x32b
	.byte	0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x25
	.long	.LASF3590
	.byte	0x1
	.byte	0x8c
	.byte	0xc
	.long	0x32b
	.byte	0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x25
	.long	.LASF3616
	.byte	0x1
	.byte	0x8c
	.byte	0x15
	.long	0x32b
	.byte	0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x32b
	.uleb128 0x26
	.byte	0x1
	.long	.LASF3617
	.byte	0x1
	.byte	0x5a
	.byte	0x6
	.byte	0x1
	.quad	.LFB39
	.quad	.LFE39
	.long	.LLST3
	.byte	0x1
	.long	0xaf4
	.uleb128 0x23
	.long	.LASF3618
	.byte	0x1
	.byte	0x5a
	.byte	0x1f
	.long	0x8e1
	.byte	0x3
	.byte	0x91
	.sleb128 -152
	.uleb128 0x23
	.long	.LASF3619
	.byte	0x1
	.byte	0x5a
	.byte	0x33
	.long	0x8e1
	.byte	0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0x23
	.long	.LASF3594
	.byte	0x1
	.byte	0x5a
	.byte	0x40
	.long	0x69
	.byte	0x3
	.byte	0x91
	.sleb128 -164
	.uleb128 0x24
	.string	"fd"
	.byte	0x1
	.byte	0x5c
	.byte	0x9
	.long	0x69
	.byte	0x3
	.byte	0x91
	.sleb128 -124
	.uleb128 0x25
	.long	.LASF3620
	.byte	0x1
	.byte	0x5d
	.byte	0xe
	.long	0xaf4
	.byte	0x4
	.byte	0x91
	.sleb128 -112
	.byte	0x6
	.uleb128 0x25
	.long	.LASF3621
	.byte	0x1
	.byte	0x5e
	.byte	0xb
	.long	0xb08
	.byte	0x4
	.byte	0x91
	.sleb128 -96
	.byte	0x6
	.uleb128 0x25
	.long	.LASF3622
	.byte	0x1
	.byte	0x5f
	.byte	0xb
	.long	0x324
	.byte	0x3
	.byte	0x91
	.sleb128 -144
	.uleb128 0x25
	.long	.LASF3623
	.byte	0x1
	.byte	0x6e
	.byte	0xb
	.long	0xb1c
	.byte	0x4
	.byte	0x91
	.sleb128 -80
	.byte	0x6
	.uleb128 0x27
	.quad	.LBB4
	.quad	.LBE4
	.long	0xa89
	.uleb128 0x25
	.long	.LASF3624
	.byte	0x1
	.byte	0x61
	.byte	0xe
	.long	0x69
	.byte	0x3
	.byte	0x91
	.sleb128 -140
	.byte	0
	.uleb128 0x27
	.quad	.LBB5
	.quad	.LBE5
	.long	0xaad
	.uleb128 0x24
	.string	"i"
	.byte	0x1
	.byte	0x67
	.byte	0xe
	.long	0x69
	.byte	0x3
	.byte	0x91
	.sleb128 -136
	.byte	0
	.uleb128 0x27
	.quad	.LBB6
	.quad	.LBE6
	.long	0xad3
	.uleb128 0x25
	.long	.LASF3624
	.byte	0x1
	.byte	0x70
	.byte	0xe
	.long	0x69
	.byte	0x3
	.byte	0x91
	.sleb128 -132
	.byte	0
	.uleb128 0x21
	.quad	.LBB7
	.quad	.LBE7
	.uleb128 0x24
	.string	"i"
	.byte	0x1
	.byte	0x76
	.byte	0xe
	.long	0x69
	.byte	0x3
	.byte	0x91
	.sleb128 -128
	.byte	0
	.byte	0
	.uleb128 0xc
	.long	0x30a
	.long	0xb08
	.uleb128 0x28
	.long	0x3d
	.byte	0x4
	.byte	0x91
	.sleb128 -120
	.byte	0x6
	.byte	0
	.uleb128 0xc
	.long	0x324
	.long	0xb1c
	.uleb128 0x28
	.long	0x3d
	.byte	0x4
	.byte	0x91
	.sleb128 -104
	.byte	0x6
	.byte	0
	.uleb128 0xc
	.long	0x324
	.long	0xb30
	.uleb128 0x28
	.long	0x3d
	.byte	0x4
	.byte	0x91
	.sleb128 -88
	.byte	0x6
	.byte	0
	.uleb128 0x26
	.byte	0x1
	.long	.LASF3625
	.byte	0x1
	.byte	0x44
	.byte	0x6
	.byte	0x1
	.quad	.LFB38
	.quad	.LFE38
	.long	.LLST2
	.byte	0x1
	.long	0xbf7
	.uleb128 0x23
	.long	.LASF3626
	.byte	0x1
	.byte	0x44
	.byte	0x17
	.long	0x8e1
	.byte	0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x23
	.long	.LASF3619
	.byte	0x1
	.byte	0x44
	.byte	0x27
	.long	0x8e1
	.byte	0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x23
	.long	.LASF3594
	.byte	0x1
	.byte	0x44
	.byte	0x34
	.long	0x69
	.byte	0x3
	.byte	0x91
	.sleb128 -100
	.uleb128 0x24
	.string	"fd"
	.byte	0x1
	.byte	0x46
	.byte	0x9
	.long	0x69
	.byte	0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x25
	.long	.LASF3582
	.byte	0x1
	.byte	0x47
	.byte	0xe
	.long	0xbf7
	.byte	0x3
	.byte	0x91
	.sleb128 -48
	.byte	0x6
	.uleb128 0x25
	.long	.LASF3622
	.byte	0x1
	.byte	0x48
	.byte	0xb
	.long	0x324
	.byte	0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x27
	.quad	.LBB2
	.quad	.LBE2
	.long	0xbd7
	.uleb128 0x25
	.long	.LASF3624
	.byte	0x1
	.byte	0x4a
	.byte	0xe
	.long	0x69
	.byte	0x3
	.byte	0x91
	.sleb128 -68
	.byte	0
	.uleb128 0x21
	.quad	.LBB3
	.quad	.LBE3
	.uleb128 0x24
	.string	"i"
	.byte	0x1
	.byte	0x50
	.byte	0xe
	.long	0x69
	.byte	0x2
	.byte	0x91
	.sleb128 -64
	.byte	0
	.byte	0
	.uleb128 0xc
	.long	0x30a
	.long	0xc0a
	.uleb128 0x28
	.long	0x3d
	.byte	0x3
	.byte	0x91
	.sleb128 -56
	.byte	0x6
	.byte	0
	.uleb128 0x22
	.byte	0x1
	.long	.LASF3627
	.byte	0x1
	.byte	0x33
	.byte	0xb
	.byte	0x1
	.long	0x316
	.quad	.LFB37
	.quad	.LFE37
	.long	.LLST1
	.byte	0x1
	.long	0xc5e
	.uleb128 0x29
	.string	"fd"
	.byte	0x1
	.byte	0x33
	.byte	0x18
	.long	0x69
	.byte	0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x23
	.long	.LASF3628
	.byte	0x1
	.byte	0x33
	.byte	0x29
	.long	0x44
	.byte	0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x25
	.long	.LASF3629
	.byte	0x1
	.byte	0x35
	.byte	0xb
	.long	0x30a
	.byte	0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x22
	.byte	0x1
	.long	.LASF3630
	.byte	0x1
	.byte	0x18
	.byte	0x5
	.byte	0x1
	.long	0x69
	.quad	.LFB36
	.quad	.LFE36
	.long	.LLST0
	.byte	0x1
	.long	0xcb8
	.uleb128 0x23
	.long	.LASF3624
	.byte	0x1
	.byte	0x18
	.byte	0x12
	.long	0x69
	.byte	0x4
	.byte	0x91
	.sleb128 -8244
	.uleb128 0x25
	.long	.LASF3631
	.byte	0x1
	.byte	0x1a
	.byte	0x7
	.long	0xcb8
	.byte	0x4
	.byte	0x91
	.sleb128 -8224
	.uleb128 0x24
	.string	"fd"
	.byte	0x1
	.byte	0x1b
	.byte	0x6
	.long	0x69
	.byte	0x4
	.byte	0x91
	.sleb128 -8228
	.byte	0
	.uleb128 0x2a
	.long	0xad
	.uleb128 0x2b
	.long	0x3d
	.value	0x1fff
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x6
	.uleb128 0x2119
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x2007
	.uleb128 0xe
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x87
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2116
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2116
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2116
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x2a
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2b
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST8:
	.quad	.LFB44-.Ltext0
	.quad	.LCFI24-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI24-.Ltext0
	.quad	.LCFI25-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI25-.Ltext0
	.quad	.LCFI26-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 16
	.quad	.LCFI26-.Ltext0
	.quad	.LFE44-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	0
	.quad	0
.LLST7:
	.quad	.LFB43-.Ltext0
	.quad	.LCFI21-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI21-.Ltext0
	.quad	.LCFI22-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI22-.Ltext0
	.quad	.LCFI23-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 16
	.quad	.LCFI23-.Ltext0
	.quad	.LFE43-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	0
	.quad	0
.LLST6:
	.quad	.LFB42-.Ltext0
	.quad	.LCFI18-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI18-.Ltext0
	.quad	.LCFI19-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI19-.Ltext0
	.quad	.LCFI20-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 16
	.quad	.LCFI20-.Ltext0
	.quad	.LFE42-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	0
	.quad	0
.LLST5:
	.quad	.LFB41-.Ltext0
	.quad	.LCFI15-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI15-.Ltext0
	.quad	.LCFI16-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI16-.Ltext0
	.quad	.LCFI17-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 16
	.quad	.LCFI17-.Ltext0
	.quad	.LFE41-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	0
	.quad	0
.LLST4:
	.quad	.LFB40-.Ltext0
	.quad	.LCFI12-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI12-.Ltext0
	.quad	.LCFI13-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI13-.Ltext0
	.quad	.LCFI14-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 16
	.quad	.LCFI14-.Ltext0
	.quad	.LFE40-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	0
	.quad	0
.LLST3:
	.quad	.LFB39-.Ltext0
	.quad	.LCFI9-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI9-.Ltext0
	.quad	.LCFI10-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI10-.Ltext0
	.quad	.LCFI11-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 16
	.quad	.LCFI11-.Ltext0
	.quad	.LFE39-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	0
	.quad	0
.LLST2:
	.quad	.LFB38-.Ltext0
	.quad	.LCFI6-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI6-.Ltext0
	.quad	.LCFI7-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI7-.Ltext0
	.quad	.LCFI8-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 16
	.quad	.LCFI8-.Ltext0
	.quad	.LFE38-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	0
	.quad	0
.LLST1:
	.quad	.LFB37-.Ltext0
	.quad	.LCFI3-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI3-.Ltext0
	.quad	.LCFI4-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI4-.Ltext0
	.quad	.LCFI5-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 16
	.quad	.LCFI5-.Ltext0
	.quad	.LFE37-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	0
	.quad	0
.LLST0:
	.quad	.LFB36-.Ltext0
	.quad	.LCFI0-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI0-.Ltext0
	.quad	.LCFI1-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI1-.Ltext0
	.quad	.LCFI2-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 16
	.quad	.LCFI2-.Ltext0
	.quad	.LFE36-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	0
	.quad	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_macro,"",@progbits
.Ldebug_macro0:
	.value	0x4
	.byte	0x2
	.long	.Ldebug_line0
	.byte	0x3
	.uleb128 0
	.uleb128 0x1
	.byte	0x5
	.uleb128 0
	.long	.LASF0
	.byte	0x5
	.uleb128 0
	.long	.LASF1
	.byte	0x5
	.uleb128 0
	.long	.LASF2
	.byte	0x5
	.uleb128 0
	.long	.LASF3
	.byte	0x5
	.uleb128 0
	.long	.LASF4
	.byte	0x5
	.uleb128 0
	.long	.LASF5
	.byte	0x5
	.uleb128 0
	.long	.LASF6
	.byte	0x5
	.uleb128 0
	.long	.LASF7
	.byte	0x5
	.uleb128 0
	.long	.LASF8
	.byte	0x5
	.uleb128 0
	.long	.LASF9
	.byte	0x5
	.uleb128 0
	.long	.LASF10
	.byte	0x5
	.uleb128 0
	.long	.LASF11
	.byte	0x5
	.uleb128 0
	.long	.LASF12
	.byte	0x5
	.uleb128 0
	.long	.LASF13
	.byte	0x5
	.uleb128 0
	.long	.LASF14
	.byte	0x5
	.uleb128 0
	.long	.LASF15
	.byte	0x5
	.uleb128 0
	.long	.LASF16
	.byte	0x5
	.uleb128 0
	.long	.LASF17
	.byte	0x5
	.uleb128 0
	.long	.LASF18
	.byte	0x5
	.uleb128 0
	.long	.LASF19
	.byte	0x5
	.uleb128 0
	.long	.LASF20
	.byte	0x5
	.uleb128 0
	.long	.LASF21
	.byte	0x5
	.uleb128 0
	.long	.LASF22
	.byte	0x5
	.uleb128 0
	.long	.LASF23
	.byte	0x5
	.uleb128 0
	.long	.LASF24
	.byte	0x5
	.uleb128 0
	.long	.LASF25
	.byte	0x5
	.uleb128 0
	.long	.LASF26
	.byte	0x5
	.uleb128 0
	.long	.LASF27
	.byte	0x5
	.uleb128 0
	.long	.LASF28
	.byte	0x5
	.uleb128 0
	.long	.LASF29
	.byte	0x5
	.uleb128 0
	.long	.LASF30
	.byte	0x5
	.uleb128 0
	.long	.LASF31
	.byte	0x5
	.uleb128 0
	.long	.LASF32
	.byte	0x5
	.uleb128 0
	.long	.LASF33
	.byte	0x5
	.uleb128 0
	.long	.LASF34
	.byte	0x5
	.uleb128 0
	.long	.LASF35
	.byte	0x5
	.uleb128 0
	.long	.LASF36
	.byte	0x5
	.uleb128 0
	.long	.LASF37
	.byte	0x5
	.uleb128 0
	.long	.LASF38
	.byte	0x5
	.uleb128 0
	.long	.LASF39
	.byte	0x5
	.uleb128 0
	.long	.LASF40
	.byte	0x5
	.uleb128 0
	.long	.LASF41
	.byte	0x5
	.uleb128 0
	.long	.LASF42
	.byte	0x5
	.uleb128 0
	.long	.LASF43
	.byte	0x5
	.uleb128 0
	.long	.LASF44
	.byte	0x5
	.uleb128 0
	.long	.LASF45
	.byte	0x5
	.uleb128 0
	.long	.LASF46
	.byte	0x5
	.uleb128 0
	.long	.LASF47
	.byte	0x5
	.uleb128 0
	.long	.LASF48
	.byte	0x5
	.uleb128 0
	.long	.LASF49
	.byte	0x5
	.uleb128 0
	.long	.LASF50
	.byte	0x5
	.uleb128 0
	.long	.LASF51
	.byte	0x5
	.uleb128 0
	.long	.LASF52
	.byte	0x5
	.uleb128 0
	.long	.LASF53
	.byte	0x5
	.uleb128 0
	.long	.LASF54
	.byte	0x5
	.uleb128 0
	.long	.LASF55
	.byte	0x5
	.uleb128 0
	.long	.LASF56
	.byte	0x5
	.uleb128 0
	.long	.LASF57
	.byte	0x5
	.uleb128 0
	.long	.LASF58
	.byte	0x5
	.uleb128 0
	.long	.LASF59
	.byte	0x5
	.uleb128 0
	.long	.LASF60
	.byte	0x5
	.uleb128 0
	.long	.LASF61
	.byte	0x5
	.uleb128 0
	.long	.LASF62
	.byte	0x5
	.uleb128 0
	.long	.LASF63
	.byte	0x5
	.uleb128 0
	.long	.LASF64
	.byte	0x5
	.uleb128 0
	.long	.LASF65
	.byte	0x5
	.uleb128 0
	.long	.LASF66
	.byte	0x5
	.uleb128 0
	.long	.LASF67
	.byte	0x5
	.uleb128 0
	.long	.LASF68
	.byte	0x5
	.uleb128 0
	.long	.LASF69
	.byte	0x5
	.uleb128 0
	.long	.LASF70
	.byte	0x5
	.uleb128 0
	.long	.LASF71
	.byte	0x5
	.uleb128 0
	.long	.LASF72
	.byte	0x5
	.uleb128 0
	.long	.LASF73
	.byte	0x5
	.uleb128 0
	.long	.LASF74
	.byte	0x5
	.uleb128 0
	.long	.LASF75
	.byte	0x5
	.uleb128 0
	.long	.LASF76
	.byte	0x5
	.uleb128 0
	.long	.LASF77
	.byte	0x5
	.uleb128 0
	.long	.LASF78
	.byte	0x5
	.uleb128 0
	.long	.LASF79
	.byte	0x5
	.uleb128 0
	.long	.LASF80
	.byte	0x5
	.uleb128 0
	.long	.LASF81
	.byte	0x5
	.uleb128 0
	.long	.LASF82
	.byte	0x5
	.uleb128 0
	.long	.LASF83
	.byte	0x5
	.uleb128 0
	.long	.LASF84
	.byte	0x5
	.uleb128 0
	.long	.LASF85
	.byte	0x5
	.uleb128 0
	.long	.LASF86
	.byte	0x5
	.uleb128 0
	.long	.LASF87
	.byte	0x5
	.uleb128 0
	.long	.LASF88
	.byte	0x5
	.uleb128 0
	.long	.LASF89
	.byte	0x5
	.uleb128 0
	.long	.LASF90
	.byte	0x5
	.uleb128 0
	.long	.LASF91
	.byte	0x5
	.uleb128 0
	.long	.LASF92
	.byte	0x5
	.uleb128 0
	.long	.LASF93
	.byte	0x5
	.uleb128 0
	.long	.LASF94
	.byte	0x5
	.uleb128 0
	.long	.LASF95
	.byte	0x5
	.uleb128 0
	.long	.LASF96
	.byte	0x5
	.uleb128 0
	.long	.LASF97
	.byte	0x5
	.uleb128 0
	.long	.LASF98
	.byte	0x5
	.uleb128 0
	.long	.LASF99
	.byte	0x5
	.uleb128 0
	.long	.LASF100
	.byte	0x5
	.uleb128 0
	.long	.LASF101
	.byte	0x5
	.uleb128 0
	.long	.LASF102
	.byte	0x5
	.uleb128 0
	.long	.LASF103
	.byte	0x5
	.uleb128 0
	.long	.LASF104
	.byte	0x5
	.uleb128 0
	.long	.LASF105
	.byte	0x5
	.uleb128 0
	.long	.LASF106
	.byte	0x5
	.uleb128 0
	.long	.LASF107
	.byte	0x5
	.uleb128 0
	.long	.LASF108
	.byte	0x5
	.uleb128 0
	.long	.LASF109
	.byte	0x5
	.uleb128 0
	.long	.LASF110
	.byte	0x5
	.uleb128 0
	.long	.LASF111
	.byte	0x5
	.uleb128 0
	.long	.LASF112
	.byte	0x5
	.uleb128 0
	.long	.LASF113
	.byte	0x5
	.uleb128 0
	.long	.LASF114
	.byte	0x5
	.uleb128 0
	.long	.LASF115
	.byte	0x5
	.uleb128 0
	.long	.LASF116
	.byte	0x5
	.uleb128 0
	.long	.LASF117
	.byte	0x5
	.uleb128 0
	.long	.LASF118
	.byte	0x5
	.uleb128 0
	.long	.LASF119
	.byte	0x5
	.uleb128 0
	.long	.LASF120
	.byte	0x5
	.uleb128 0
	.long	.LASF121
	.byte	0x5
	.uleb128 0
	.long	.LASF122
	.byte	0x5
	.uleb128 0
	.long	.LASF123
	.byte	0x5
	.uleb128 0
	.long	.LASF124
	.byte	0x5
	.uleb128 0
	.long	.LASF125
	.byte	0x5
	.uleb128 0
	.long	.LASF126
	.byte	0x5
	.uleb128 0
	.long	.LASF127
	.byte	0x5
	.uleb128 0
	.long	.LASF128
	.byte	0x5
	.uleb128 0
	.long	.LASF129
	.byte	0x5
	.uleb128 0
	.long	.LASF130
	.byte	0x5
	.uleb128 0
	.long	.LASF131
	.byte	0x5
	.uleb128 0
	.long	.LASF132
	.byte	0x5
	.uleb128 0
	.long	.LASF133
	.byte	0x5
	.uleb128 0
	.long	.LASF134
	.byte	0x5
	.uleb128 0
	.long	.LASF135
	.byte	0x5
	.uleb128 0
	.long	.LASF136
	.byte	0x5
	.uleb128 0
	.long	.LASF137
	.byte	0x5
	.uleb128 0
	.long	.LASF138
	.byte	0x5
	.uleb128 0
	.long	.LASF139
	.byte	0x5
	.uleb128 0
	.long	.LASF140
	.byte	0x5
	.uleb128 0
	.long	.LASF141
	.byte	0x5
	.uleb128 0
	.long	.LASF142
	.byte	0x5
	.uleb128 0
	.long	.LASF143
	.byte	0x5
	.uleb128 0
	.long	.LASF144
	.byte	0x5
	.uleb128 0
	.long	.LASF145
	.byte	0x5
	.uleb128 0
	.long	.LASF146
	.byte	0x5
	.uleb128 0
	.long	.LASF147
	.byte	0x5
	.uleb128 0
	.long	.LASF148
	.byte	0x5
	.uleb128 0
	.long	.LASF149
	.byte	0x5
	.uleb128 0
	.long	.LASF150
	.byte	0x5
	.uleb128 0
	.long	.LASF151
	.byte	0x5
	.uleb128 0
	.long	.LASF152
	.byte	0x5
	.uleb128 0
	.long	.LASF153
	.byte	0x5
	.uleb128 0
	.long	.LASF154
	.byte	0x5
	.uleb128 0
	.long	.LASF155
	.byte	0x5
	.uleb128 0
	.long	.LASF156
	.byte	0x5
	.uleb128 0
	.long	.LASF157
	.byte	0x5
	.uleb128 0
	.long	.LASF158
	.byte	0x5
	.uleb128 0
	.long	.LASF159
	.byte	0x5
	.uleb128 0
	.long	.LASF160
	.byte	0x5
	.uleb128 0
	.long	.LASF161
	.byte	0x5
	.uleb128 0
	.long	.LASF162
	.byte	0x5
	.uleb128 0
	.long	.LASF163
	.byte	0x5
	.uleb128 0
	.long	.LASF164
	.byte	0x5
	.uleb128 0
	.long	.LASF165
	.byte	0x5
	.uleb128 0
	.long	.LASF166
	.byte	0x5
	.uleb128 0
	.long	.LASF167
	.byte	0x5
	.uleb128 0
	.long	.LASF168
	.byte	0x5
	.uleb128 0
	.long	.LASF169
	.byte	0x5
	.uleb128 0
	.long	.LASF170
	.byte	0x5
	.uleb128 0
	.long	.LASF171
	.byte	0x5
	.uleb128 0
	.long	.LASF172
	.byte	0x5
	.uleb128 0
	.long	.LASF173
	.byte	0x5
	.uleb128 0
	.long	.LASF174
	.byte	0x5
	.uleb128 0
	.long	.LASF175
	.byte	0x5
	.uleb128 0
	.long	.LASF176
	.byte	0x5
	.uleb128 0
	.long	.LASF177
	.byte	0x5
	.uleb128 0
	.long	.LASF178
	.byte	0x5
	.uleb128 0
	.long	.LASF179
	.byte	0x5
	.uleb128 0
	.long	.LASF180
	.byte	0x5
	.uleb128 0
	.long	.LASF181
	.byte	0x5
	.uleb128 0
	.long	.LASF182
	.byte	0x5
	.uleb128 0
	.long	.LASF183
	.byte	0x5
	.uleb128 0
	.long	.LASF184
	.byte	0x5
	.uleb128 0
	.long	.LASF185
	.byte	0x5
	.uleb128 0
	.long	.LASF186
	.byte	0x5
	.uleb128 0
	.long	.LASF187
	.byte	0x5
	.uleb128 0
	.long	.LASF188
	.byte	0x5
	.uleb128 0
	.long	.LASF189
	.byte	0x5
	.uleb128 0
	.long	.LASF190
	.byte	0x5
	.uleb128 0
	.long	.LASF191
	.byte	0x5
	.uleb128 0
	.long	.LASF192
	.byte	0x5
	.uleb128 0
	.long	.LASF193
	.byte	0x5
	.uleb128 0
	.long	.LASF194
	.byte	0x5
	.uleb128 0
	.long	.LASF195
	.byte	0x5
	.uleb128 0
	.long	.LASF196
	.byte	0x5
	.uleb128 0
	.long	.LASF197
	.byte	0x5
	.uleb128 0
	.long	.LASF198
	.byte	0x5
	.uleb128 0
	.long	.LASF199
	.byte	0x5
	.uleb128 0
	.long	.LASF200
	.byte	0x5
	.uleb128 0
	.long	.LASF201
	.byte	0x5
	.uleb128 0
	.long	.LASF202
	.byte	0x5
	.uleb128 0
	.long	.LASF203
	.byte	0x5
	.uleb128 0
	.long	.LASF204
	.byte	0x5
	.uleb128 0
	.long	.LASF205
	.byte	0x5
	.uleb128 0
	.long	.LASF206
	.byte	0x5
	.uleb128 0
	.long	.LASF207
	.byte	0x5
	.uleb128 0
	.long	.LASF208
	.byte	0x5
	.uleb128 0
	.long	.LASF209
	.byte	0x5
	.uleb128 0
	.long	.LASF210
	.byte	0x5
	.uleb128 0
	.long	.LASF211
	.byte	0x5
	.uleb128 0
	.long	.LASF212
	.byte	0x5
	.uleb128 0
	.long	.LASF213
	.byte	0x5
	.uleb128 0
	.long	.LASF214
	.byte	0x5
	.uleb128 0
	.long	.LASF215
	.byte	0x5
	.uleb128 0
	.long	.LASF216
	.byte	0x5
	.uleb128 0
	.long	.LASF217
	.byte	0x5
	.uleb128 0
	.long	.LASF218
	.byte	0x5
	.uleb128 0
	.long	.LASF219
	.byte	0x5
	.uleb128 0
	.long	.LASF220
	.byte	0x5
	.uleb128 0
	.long	.LASF221
	.byte	0x5
	.uleb128 0
	.long	.LASF222
	.byte	0x5
	.uleb128 0
	.long	.LASF223
	.byte	0x5
	.uleb128 0
	.long	.LASF224
	.byte	0x5
	.uleb128 0
	.long	.LASF225
	.byte	0x5
	.uleb128 0
	.long	.LASF226
	.byte	0x5
	.uleb128 0
	.long	.LASF227
	.byte	0x5
	.uleb128 0
	.long	.LASF228
	.byte	0x5
	.uleb128 0
	.long	.LASF229
	.byte	0x5
	.uleb128 0
	.long	.LASF230
	.byte	0x5
	.uleb128 0
	.long	.LASF231
	.byte	0x5
	.uleb128 0
	.long	.LASF232
	.byte	0x5
	.uleb128 0
	.long	.LASF233
	.byte	0x5
	.uleb128 0
	.long	.LASF234
	.byte	0x5
	.uleb128 0
	.long	.LASF235
	.byte	0x5
	.uleb128 0
	.long	.LASF236
	.byte	0x5
	.uleb128 0
	.long	.LASF237
	.byte	0x5
	.uleb128 0
	.long	.LASF238
	.byte	0x5
	.uleb128 0
	.long	.LASF239
	.byte	0x5
	.uleb128 0
	.long	.LASF240
	.byte	0x5
	.uleb128 0
	.long	.LASF241
	.byte	0x5
	.uleb128 0
	.long	.LASF242
	.byte	0x5
	.uleb128 0
	.long	.LASF243
	.byte	0x5
	.uleb128 0
	.long	.LASF244
	.byte	0x5
	.uleb128 0
	.long	.LASF245
	.byte	0x5
	.uleb128 0
	.long	.LASF246
	.byte	0x5
	.uleb128 0
	.long	.LASF247
	.byte	0x5
	.uleb128 0
	.long	.LASF248
	.byte	0x5
	.uleb128 0
	.long	.LASF249
	.byte	0x5
	.uleb128 0
	.long	.LASF250
	.byte	0x5
	.uleb128 0
	.long	.LASF251
	.byte	0x5
	.uleb128 0
	.long	.LASF252
	.byte	0x5
	.uleb128 0
	.long	.LASF253
	.byte	0x5
	.uleb128 0
	.long	.LASF254
	.byte	0x5
	.uleb128 0
	.long	.LASF255
	.byte	0x5
	.uleb128 0
	.long	.LASF256
	.byte	0x5
	.uleb128 0
	.long	.LASF257
	.byte	0x5
	.uleb128 0
	.long	.LASF258
	.byte	0x5
	.uleb128 0
	.long	.LASF259
	.byte	0x5
	.uleb128 0
	.long	.LASF260
	.byte	0x5
	.uleb128 0
	.long	.LASF261
	.byte	0x5
	.uleb128 0
	.long	.LASF262
	.byte	0x5
	.uleb128 0
	.long	.LASF263
	.byte	0x5
	.uleb128 0
	.long	.LASF264
	.byte	0x5
	.uleb128 0
	.long	.LASF265
	.byte	0x5
	.uleb128 0
	.long	.LASF266
	.byte	0x5
	.uleb128 0
	.long	.LASF267
	.byte	0x5
	.uleb128 0
	.long	.LASF268
	.byte	0x5
	.uleb128 0
	.long	.LASF269
	.byte	0x5
	.uleb128 0
	.long	.LASF270
	.byte	0x5
	.uleb128 0
	.long	.LASF271
	.byte	0x5
	.uleb128 0
	.long	.LASF272
	.byte	0x5
	.uleb128 0
	.long	.LASF273
	.byte	0x5
	.uleb128 0
	.long	.LASF274
	.byte	0x5
	.uleb128 0
	.long	.LASF275
	.byte	0x5
	.uleb128 0
	.long	.LASF276
	.byte	0x5
	.uleb128 0
	.long	.LASF277
	.byte	0x5
	.uleb128 0
	.long	.LASF278
	.byte	0x5
	.uleb128 0
	.long	.LASF279
	.byte	0x5
	.uleb128 0
	.long	.LASF280
	.byte	0x5
	.uleb128 0
	.long	.LASF281
	.byte	0x5
	.uleb128 0
	.long	.LASF282
	.byte	0x5
	.uleb128 0
	.long	.LASF283
	.byte	0x5
	.uleb128 0
	.long	.LASF284
	.byte	0x5
	.uleb128 0
	.long	.LASF285
	.byte	0x5
	.uleb128 0
	.long	.LASF286
	.byte	0x5
	.uleb128 0
	.long	.LASF287
	.byte	0x5
	.uleb128 0
	.long	.LASF288
	.byte	0x5
	.uleb128 0
	.long	.LASF289
	.byte	0x5
	.uleb128 0
	.long	.LASF290
	.byte	0x5
	.uleb128 0
	.long	.LASF291
	.byte	0x5
	.uleb128 0
	.long	.LASF292
	.byte	0x5
	.uleb128 0
	.long	.LASF293
	.byte	0x5
	.uleb128 0
	.long	.LASF294
	.byte	0x5
	.uleb128 0
	.long	.LASF295
	.byte	0x5
	.uleb128 0
	.long	.LASF296
	.byte	0x5
	.uleb128 0
	.long	.LASF297
	.byte	0x5
	.uleb128 0
	.long	.LASF298
	.byte	0x5
	.uleb128 0
	.long	.LASF299
	.byte	0x5
	.uleb128 0
	.long	.LASF300
	.byte	0x5
	.uleb128 0
	.long	.LASF301
	.byte	0x5
	.uleb128 0
	.long	.LASF302
	.byte	0x5
	.uleb128 0
	.long	.LASF303
	.byte	0x5
	.uleb128 0
	.long	.LASF304
	.byte	0x5
	.uleb128 0
	.long	.LASF305
	.byte	0x5
	.uleb128 0
	.long	.LASF306
	.byte	0x5
	.uleb128 0
	.long	.LASF307
	.byte	0x5
	.uleb128 0
	.long	.LASF308
	.byte	0x5
	.uleb128 0
	.long	.LASF309
	.byte	0x5
	.uleb128 0
	.long	.LASF310
	.byte	0x5
	.uleb128 0
	.long	.LASF311
	.byte	0x5
	.uleb128 0
	.long	.LASF312
	.byte	0x5
	.uleb128 0
	.long	.LASF313
	.byte	0x5
	.uleb128 0
	.long	.LASF314
	.byte	0x5
	.uleb128 0
	.long	.LASF315
	.byte	0x5
	.uleb128 0
	.long	.LASF316
	.byte	0x5
	.uleb128 0
	.long	.LASF317
	.byte	0x5
	.uleb128 0
	.long	.LASF318
	.byte	0x5
	.uleb128 0
	.long	.LASF319
	.byte	0x5
	.uleb128 0
	.long	.LASF320
	.byte	0x5
	.uleb128 0
	.long	.LASF321
	.byte	0x5
	.uleb128 0
	.long	.LASF322
	.byte	0x5
	.uleb128 0
	.long	.LASF323
	.byte	0x5
	.uleb128 0
	.long	.LASF324
	.byte	0x5
	.uleb128 0
	.long	.LASF325
	.byte	0x5
	.uleb128 0
	.long	.LASF326
	.byte	0x5
	.uleb128 0
	.long	.LASF327
	.byte	0x5
	.uleb128 0
	.long	.LASF328
	.byte	0x5
	.uleb128 0
	.long	.LASF329
	.byte	0x5
	.uleb128 0
	.long	.LASF330
	.byte	0x5
	.uleb128 0
	.long	.LASF331
	.byte	0x5
	.uleb128 0
	.long	.LASF332
	.byte	0x5
	.uleb128 0
	.long	.LASF333
	.byte	0x5
	.uleb128 0
	.long	.LASF334
	.byte	0x5
	.uleb128 0
	.long	.LASF335
	.byte	0x5
	.uleb128 0
	.long	.LASF336
	.byte	0x5
	.uleb128 0
	.long	.LASF337
	.byte	0x5
	.uleb128 0
	.long	.LASF338
	.byte	0x5
	.uleb128 0
	.long	.LASF339
	.byte	0x5
	.uleb128 0
	.long	.LASF340
	.byte	0x5
	.uleb128 0
	.long	.LASF341
	.byte	0x5
	.uleb128 0
	.long	.LASF342
	.byte	0x5
	.uleb128 0
	.long	.LASF343
	.byte	0x5
	.uleb128 0
	.long	.LASF344
	.byte	0x5
	.uleb128 0
	.long	.LASF345
	.byte	0x5
	.uleb128 0
	.long	.LASF346
	.byte	0x5
	.uleb128 0
	.long	.LASF347
	.byte	0x5
	.uleb128 0
	.long	.LASF348
	.byte	0x5
	.uleb128 0
	.long	.LASF349
	.byte	0x5
	.uleb128 0
	.long	.LASF350
	.byte	0x5
	.uleb128 0
	.long	.LASF351
	.byte	0x5
	.uleb128 0
	.long	.LASF352
	.byte	0x5
	.uleb128 0
	.long	.LASF353
	.byte	0x5
	.uleb128 0
	.long	.LASF354
	.byte	0x5
	.uleb128 0
	.long	.LASF355
	.byte	0x5
	.uleb128 0
	.long	.LASF356
	.byte	0x5
	.uleb128 0
	.long	.LASF357
	.byte	0x5
	.uleb128 0
	.long	.LASF358
	.byte	0x5
	.uleb128 0
	.long	.LASF359
	.byte	0x5
	.uleb128 0
	.long	.LASF360
	.file 15 "/usr/include/stdc-predef.h"
	.byte	0x3
	.uleb128 0
	.uleb128 0xf
	.byte	0x7
	.long	.Ldebug_macro2
	.byte	0x4
	.byte	0x3
	.uleb128 0x5
	.uleb128 0x6
	.byte	0x7
	.long	.Ldebug_macro3
	.file 16 "/usr/include/x86_64-linux-gnu/bits/libc-header-start.h"
	.byte	0x3
	.uleb128 0x1b
	.uleb128 0x10
	.byte	0x6
	.uleb128 0x1f
	.long	.LASF369
	.file 17 "/usr/include/features.h"
	.byte	0x3
	.uleb128 0x21
	.uleb128 0x11
	.byte	0x7
	.long	.Ldebug_macro4
	.file 18 "/usr/include/features-time64.h"
	.byte	0x3
	.uleb128 0x188
	.uleb128 0x12
	.file 19 "/usr/include/x86_64-linux-gnu/bits/wordsize.h"
	.byte	0x3
	.uleb128 0x14
	.uleb128 0x13
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.file 20 "/usr/include/x86_64-linux-gnu/bits/timesize.h"
	.byte	0x3
	.uleb128 0x15
	.uleb128 0x14
	.byte	0x3
	.uleb128 0x13
	.uleb128 0x13
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF424
	.byte	0x4
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro6
	.file 21 "/usr/include/x86_64-linux-gnu/sys/cdefs.h"
	.byte	0x3
	.uleb128 0x1e6
	.uleb128 0x15
	.byte	0x7
	.long	.Ldebug_macro7
	.byte	0x3
	.uleb128 0x22f
	.uleb128 0x13
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.file 22 "/usr/include/x86_64-linux-gnu/bits/long-double.h"
	.byte	0x3
	.uleb128 0x230
	.uleb128 0x16
	.byte	0x5
	.uleb128 0x15
	.long	.LASF503
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro8
	.byte	0x4
	.file 23 "/usr/include/x86_64-linux-gnu/gnu/stubs.h"
	.byte	0x3
	.uleb128 0x1fe
	.uleb128 0x17
	.file 24 "/usr/include/x86_64-linux-gnu/gnu/stubs-64.h"
	.byte	0x3
	.uleb128 0xa
	.uleb128 0x18
	.byte	0x7
	.long	.Ldebug_macro9
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro10
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro11
	.byte	0x3
	.uleb128 0x21
	.uleb128 0x2
	.byte	0x7
	.long	.Ldebug_macro12
	.byte	0x4
	.byte	0x5
	.uleb128 0x23
	.long	.LASF566
	.file 25 "/usr/lib/gcc/x86_64-linux-gnu/11/include/stdarg.h"
	.byte	0x3
	.uleb128 0x24
	.uleb128 0x19
	.byte	0x7
	.long	.Ldebug_macro13
	.byte	0x4
	.byte	0x3
	.uleb128 0x26
	.uleb128 0x3
	.byte	0x5
	.uleb128 0x18
	.long	.LASF569
	.byte	0x3
	.uleb128 0x1b
	.uleb128 0x13
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.byte	0x3
	.uleb128 0x1c
	.uleb128 0x14
	.byte	0x3
	.uleb128 0x13
	.uleb128 0x13
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF424
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro14
	.file 26 "/usr/include/x86_64-linux-gnu/bits/typesizes.h"
	.byte	0x3
	.uleb128 0x8d
	.uleb128 0x1a
	.byte	0x7
	.long	.Ldebug_macro15
	.byte	0x4
	.file 27 "/usr/include/x86_64-linux-gnu/bits/time64.h"
	.byte	0x3
	.uleb128 0x8e
	.uleb128 0x1b
	.byte	0x7
	.long	.Ldebug_macro16
	.byte	0x4
	.byte	0x6
	.uleb128 0xe2
	.long	.LASF629
	.byte	0x4
	.file 28 "/usr/include/x86_64-linux-gnu/bits/types/__fpos_t.h"
	.byte	0x3
	.uleb128 0x27
	.uleb128 0x1c
	.byte	0x5
	.uleb128 0x2
	.long	.LASF630
	.file 29 "/usr/include/x86_64-linux-gnu/bits/types/__mbstate_t.h"
	.byte	0x3
	.uleb128 0x5
	.uleb128 0x1d
	.byte	0x5
	.uleb128 0x2
	.long	.LASF631
	.byte	0x4
	.byte	0x4
	.file 30 "/usr/include/x86_64-linux-gnu/bits/types/__fpos64_t.h"
	.byte	0x3
	.uleb128 0x28
	.uleb128 0x1e
	.byte	0x5
	.uleb128 0x2
	.long	.LASF632
	.byte	0x4
	.file 31 "/usr/include/x86_64-linux-gnu/bits/types/__FILE.h"
	.byte	0x3
	.uleb128 0x29
	.uleb128 0x1f
	.byte	0x5
	.uleb128 0x2
	.long	.LASF633
	.byte	0x4
	.byte	0x3
	.uleb128 0x2a
	.uleb128 0x5
	.byte	0x5
	.uleb128 0x2
	.long	.LASF634
	.byte	0x4
	.byte	0x3
	.uleb128 0x2b
	.uleb128 0x4
	.byte	0x7
	.long	.Ldebug_macro17
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro18
	.file 32 "/usr/include/x86_64-linux-gnu/bits/stdio_lim.h"
	.byte	0x3
	.uleb128 0x85
	.uleb128 0x20
	.byte	0x7
	.long	.Ldebug_macro19
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro20
	.file 33 "/usr/include/x86_64-linux-gnu/bits/floatn.h"
	.byte	0x3
	.uleb128 0x1ae
	.uleb128 0x21
	.byte	0x7
	.long	.Ldebug_macro21
	.file 34 "/usr/include/x86_64-linux-gnu/bits/floatn-common.h"
	.byte	0x3
	.uleb128 0x77
	.uleb128 0x22
	.byte	0x5
	.uleb128 0x15
	.long	.LASF674
	.byte	0x3
	.uleb128 0x18
	.uleb128 0x16
	.byte	0x5
	.uleb128 0x15
	.long	.LASF503
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro22
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.file 35 "/usr/lib/gcc/x86_64-linux-gnu/11/include/stdint.h"
	.byte	0x3
	.uleb128 0x6
	.uleb128 0x23
	.file 36 "/usr/include/stdint.h"
	.byte	0x3
	.uleb128 0x9
	.uleb128 0x24
	.byte	0x7
	.long	.Ldebug_macro23
	.byte	0x3
	.uleb128 0x1a
	.uleb128 0x10
	.byte	0x7
	.long	.Ldebug_macro24
	.byte	0x4
	.file 37 "/usr/include/x86_64-linux-gnu/bits/wchar.h"
	.byte	0x3
	.uleb128 0x1c
	.uleb128 0x25
	.byte	0x7
	.long	.Ldebug_macro25
	.byte	0x4
	.byte	0x3
	.uleb128 0x1d
	.uleb128 0x13
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.file 38 "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h"
	.byte	0x3
	.uleb128 0x22
	.uleb128 0x26
	.byte	0x5
	.uleb128 0x14
	.long	.LASF700
	.byte	0x4
	.byte	0x3
	.uleb128 0x25
	.uleb128 0x7
	.byte	0x5
	.uleb128 0x14
	.long	.LASF701
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro26
	.byte	0x4
	.byte	0x5
	.uleb128 0xd
	.long	.LASF764
	.byte	0x4
	.byte	0x3
	.uleb128 0x7
	.uleb128 0xb
	.byte	0x5
	.uleb128 0x19
	.long	.LASF368
	.byte	0x3
	.uleb128 0x1a
	.uleb128 0x10
	.byte	0x7
	.long	.Ldebug_macro24
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro27
	.byte	0x3
	.uleb128 0x20
	.uleb128 0x2
	.byte	0x7
	.long	.Ldebug_macro28
	.byte	0x4
	.byte	0x5
	.uleb128 0x24
	.long	.LASF783
	.file 39 "/usr/include/x86_64-linux-gnu/bits/waitflags.h"
	.byte	0x3
	.uleb128 0x28
	.uleb128 0x27
	.byte	0x7
	.long	.Ldebug_macro29
	.byte	0x4
	.file 40 "/usr/include/x86_64-linux-gnu/bits/waitstatus.h"
	.byte	0x3
	.uleb128 0x29
	.uleb128 0x28
	.byte	0x7
	.long	.Ldebug_macro30
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro31
	.file 41 "/usr/include/x86_64-linux-gnu/sys/types.h"
	.byte	0x3
	.uleb128 0x18b
	.uleb128 0x29
	.byte	0x7
	.long	.Ldebug_macro32
	.file 42 "/usr/include/x86_64-linux-gnu/bits/types/clock_t.h"
	.byte	0x3
	.uleb128 0x7e
	.uleb128 0x2a
	.byte	0x5
	.uleb128 0x2
	.long	.LASF830
	.byte	0x4
	.file 43 "/usr/include/x86_64-linux-gnu/bits/types/clockid_t.h"
	.byte	0x3
	.uleb128 0x80
	.uleb128 0x2b
	.byte	0x5
	.uleb128 0x2
	.long	.LASF831
	.byte	0x4
	.file 44 "/usr/include/x86_64-linux-gnu/bits/types/time_t.h"
	.byte	0x3
	.uleb128 0x81
	.uleb128 0x2c
	.byte	0x5
	.uleb128 0x2
	.long	.LASF832
	.byte	0x4
	.file 45 "/usr/include/x86_64-linux-gnu/bits/types/timer_t.h"
	.byte	0x3
	.uleb128 0x82
	.uleb128 0x2d
	.byte	0x5
	.uleb128 0x2
	.long	.LASF833
	.byte	0x4
	.byte	0x5
	.uleb128 0x8f
	.long	.LASF543
	.byte	0x3
	.uleb128 0x90
	.uleb128 0x2
	.byte	0x7
	.long	.Ldebug_macro33
	.byte	0x4
	.byte	0x5
	.uleb128 0xab
	.long	.LASF834
	.file 46 "/usr/include/endian.h"
	.byte	0x3
	.uleb128 0xb0
	.uleb128 0x2e
	.byte	0x5
	.uleb128 0x13
	.long	.LASF835
	.file 47 "/usr/include/x86_64-linux-gnu/bits/endian.h"
	.byte	0x3
	.uleb128 0x18
	.uleb128 0x2f
	.byte	0x7
	.long	.Ldebug_macro34
	.file 48 "/usr/include/x86_64-linux-gnu/bits/endianness.h"
	.byte	0x3
	.uleb128 0x23
	.uleb128 0x30
	.byte	0x7
	.long	.Ldebug_macro35
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro36
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro37
	.file 49 "/usr/include/x86_64-linux-gnu/bits/byteswap.h"
	.byte	0x3
	.uleb128 0x23
	.uleb128 0x31
	.byte	0x7
	.long	.Ldebug_macro38
	.byte	0x4
	.file 50 "/usr/include/x86_64-linux-gnu/bits/uintn-identity.h"
	.byte	0x3
	.uleb128 0x24
	.uleb128 0x32
	.byte	0x5
	.uleb128 0x18
	.long	.LASF852
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro39
	.byte	0x4
	.file 51 "/usr/include/x86_64-linux-gnu/sys/select.h"
	.byte	0x3
	.uleb128 0xb3
	.uleb128 0x33
	.byte	0x5
	.uleb128 0x16
	.long	.LASF865
	.file 52 "/usr/include/x86_64-linux-gnu/bits/select.h"
	.byte	0x3
	.uleb128 0x1e
	.uleb128 0x34
	.byte	0x7
	.long	.Ldebug_macro40
	.byte	0x4
	.file 53 "/usr/include/x86_64-linux-gnu/bits/types/sigset_t.h"
	.byte	0x3
	.uleb128 0x21
	.uleb128 0x35
	.byte	0x5
	.uleb128 0x2
	.long	.LASF870
	.file 54 "/usr/include/x86_64-linux-gnu/bits/types/__sigset_t.h"
	.byte	0x3
	.uleb128 0x4
	.uleb128 0x36
	.byte	0x7
	.long	.Ldebug_macro41
	.byte	0x4
	.byte	0x4
	.file 55 "/usr/include/x86_64-linux-gnu/bits/types/struct_timeval.h"
	.byte	0x3
	.uleb128 0x25
	.uleb128 0x37
	.byte	0x5
	.uleb128 0x2
	.long	.LASF873
	.byte	0x4
	.file 56 "/usr/include/x86_64-linux-gnu/bits/types/struct_timespec.h"
	.byte	0x3
	.uleb128 0x27
	.uleb128 0x38
	.byte	0x5
	.uleb128 0x3
	.long	.LASF874
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro42
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro43
	.file 57 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h"
	.byte	0x3
	.uleb128 0xe3
	.uleb128 0x39
	.byte	0x5
	.uleb128 0x14
	.long	.LASF891
	.file 58 "/usr/include/x86_64-linux-gnu/bits/thread-shared-types.h"
	.byte	0x3
	.uleb128 0x17
	.uleb128 0x3a
	.byte	0x5
	.uleb128 0x14
	.long	.LASF892
	.file 59 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes-arch.h"
	.byte	0x3
	.uleb128 0x2c
	.uleb128 0x3b
	.byte	0x5
	.uleb128 0x13
	.long	.LASF893
	.byte	0x3
	.uleb128 0x15
	.uleb128 0x13
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro44
	.byte	0x4
	.file 60 "/usr/include/x86_64-linux-gnu/bits/atomic_wide_counter.h"
	.byte	0x3
	.uleb128 0x2e
	.uleb128 0x3c
	.byte	0x5
	.uleb128 0x14
	.long	.LASF905
	.byte	0x4
	.file 61 "/usr/include/x86_64-linux-gnu/bits/struct_mutex.h"
	.byte	0x3
	.uleb128 0x4c
	.uleb128 0x3d
	.byte	0x7
	.long	.Ldebug_macro45
	.byte	0x4
	.file 62 "/usr/include/x86_64-linux-gnu/bits/struct_rwlock.h"
	.byte	0x3
	.uleb128 0x59
	.uleb128 0x3e
	.byte	0x7
	.long	.Ldebug_macro46
	.byte	0x4
	.byte	0x5
	.uleb128 0x71
	.long	.LASF912
	.byte	0x4
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF913
	.byte	0x4
	.byte	0x4
	.file 63 "/usr/include/alloca.h"
	.byte	0x3
	.uleb128 0x23e
	.uleb128 0x3f
	.byte	0x7
	.long	.Ldebug_macro47
	.byte	0x3
	.uleb128 0x18
	.uleb128 0x2
	.byte	0x7
	.long	.Ldebug_macro33
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro48
	.byte	0x4
	.byte	0x5
	.uleb128 0x32f
	.long	.LASF917
	.file 64 "/usr/include/x86_64-linux-gnu/bits/stdlib-float.h"
	.byte	0x3
	.uleb128 0x3ff
	.uleb128 0x40
	.byte	0x4
	.byte	0x4
	.byte	0x3
	.uleb128 0x8
	.uleb128 0xe
	.byte	0x5
	.uleb128 0x17
	.long	.LASF918
	.file 65 "/usr/include/x86_64-linux-gnu/bits/errno.h"
	.byte	0x3
	.uleb128 0x1c
	.uleb128 0x41
	.byte	0x5
	.uleb128 0x14
	.long	.LASF919
	.file 66 "/usr/include/linux/errno.h"
	.byte	0x3
	.uleb128 0x1a
	.uleb128 0x42
	.file 67 "/usr/include/x86_64-linux-gnu/asm/errno.h"
	.byte	0x3
	.uleb128 0x1
	.uleb128 0x43
	.file 68 "/usr/include/asm-generic/errno.h"
	.byte	0x3
	.uleb128 0x1
	.uleb128 0x44
	.byte	0x5
	.uleb128 0x3
	.long	.LASF920
	.file 69 "/usr/include/asm-generic/errno-base.h"
	.byte	0x3
	.uleb128 0x5
	.uleb128 0x45
	.byte	0x7
	.long	.Ldebug_macro49
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro50
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF1055
	.byte	0x4
	.byte	0x5
	.uleb128 0x26
	.long	.LASF1056
	.byte	0x4
	.file 70 "/usr/include/x86_64-linux-gnu/sys/stat.h"
	.byte	0x3
	.uleb128 0x9
	.uleb128 0x46
	.byte	0x5
	.uleb128 0x17
	.long	.LASF1057
	.file 71 "/usr/include/x86_64-linux-gnu/bits/stat.h"
	.byte	0x3
	.uleb128 0x65
	.uleb128 0x47
	.byte	0x5
	.uleb128 0x17
	.long	.LASF1058
	.file 72 "/usr/include/x86_64-linux-gnu/bits/struct_stat.h"
	.byte	0x3
	.uleb128 0x19
	.uleb128 0x48
	.byte	0x7
	.long	.Ldebug_macro51
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro52
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro53
	.byte	0x4
	.byte	0x3
	.uleb128 0xa
	.uleb128 0xc
	.byte	0x5
	.uleb128 0x17
	.long	.LASF1126
	.file 73 "/usr/include/x86_64-linux-gnu/bits/fcntl.h"
	.byte	0x3
	.uleb128 0x23
	.uleb128 0x49
	.byte	0x7
	.long	.Ldebug_macro54
	.file 74 "/usr/include/x86_64-linux-gnu/bits/fcntl-linux.h"
	.byte	0x3
	.uleb128 0x3d
	.uleb128 0x4a
	.byte	0x7
	.long	.Ldebug_macro55
	.byte	0x4
	.byte	0x4
	.byte	0x5
	.uleb128 0x28
	.long	.LASF1203
	.byte	0x3
	.uleb128 0x4e
	.uleb128 0x47
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro56
	.byte	0x4
	.byte	0x3
	.uleb128 0xb
	.uleb128 0xa
	.byte	0x7
	.long	.Ldebug_macro57
	.file 75 "/usr/include/x86_64-linux-gnu/bits/posix_opt.h"
	.byte	0x3
	.uleb128 0xca
	.uleb128 0x4b
	.byte	0x7
	.long	.Ldebug_macro58
	.byte	0x4
	.file 76 "/usr/include/x86_64-linux-gnu/bits/environments.h"
	.byte	0x3
	.uleb128 0xce
	.uleb128 0x4c
	.byte	0x3
	.uleb128 0x16
	.uleb128 0x13
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro59
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro60
	.byte	0x3
	.uleb128 0xe2
	.uleb128 0x2
	.byte	0x7
	.long	.Ldebug_macro61
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro62
	.file 77 "/usr/include/x86_64-linux-gnu/bits/confname.h"
	.byte	0x3
	.uleb128 0x276
	.uleb128 0x4d
	.byte	0x7
	.long	.Ldebug_macro63
	.byte	0x4
	.file 78 "/usr/include/x86_64-linux-gnu/bits/getopt_posix.h"
	.byte	0x3
	.uleb128 0x387
	.uleb128 0x4e
	.byte	0x5
	.uleb128 0x15
	.long	.LASF1617
	.file 79 "/usr/include/x86_64-linux-gnu/bits/getopt_core.h"
	.byte	0x3
	.uleb128 0x1b
	.uleb128 0x4f
	.byte	0x5
	.uleb128 0x15
	.long	.LASF1618
	.byte	0x4
	.byte	0x4
	.file 80 "/usr/include/x86_64-linux-gnu/bits/unistd_ext.h"
	.byte	0x3
	.uleb128 0x4c2
	.uleb128 0x50
	.byte	0x4
	.byte	0x4
	.file 81 "/usr/include/math.h"
	.byte	0x3
	.uleb128 0xc
	.uleb128 0x51
	.byte	0x7
	.long	.Ldebug_macro64
	.byte	0x3
	.uleb128 0x1b
	.uleb128 0x10
	.byte	0x7
	.long	.Ldebug_macro24
	.byte	0x4
	.file 82 "/usr/include/x86_64-linux-gnu/bits/math-vector.h"
	.byte	0x3
	.uleb128 0x28
	.uleb128 0x52
	.file 83 "/usr/include/x86_64-linux-gnu/bits/libm-simd-decl-stubs.h"
	.byte	0x3
	.uleb128 0x19
	.uleb128 0x53
	.byte	0x7
	.long	.Ldebug_macro65
	.byte	0x4
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro66
	.file 84 "/usr/include/x86_64-linux-gnu/bits/flt-eval-method.h"
	.byte	0x3
	.uleb128 0x98
	.uleb128 0x54
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF1896
	.byte	0x4
	.file 85 "/usr/include/x86_64-linux-gnu/bits/fp-logb.h"
	.byte	0x3
	.uleb128 0xcc
	.uleb128 0x55
	.byte	0x7
	.long	.Ldebug_macro67
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro68
	.file 86 "/usr/include/x86_64-linux-gnu/bits/fp-fast.h"
	.byte	0x3
	.uleb128 0xf7
	.uleb128 0x56
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro69
	.file 87 "/usr/include/x86_64-linux-gnu/bits/mathcalls-helper-functions.h"
	.byte	0x3
	.uleb128 0x138
	.uleb128 0x57
	.byte	0x4
	.byte	0x3
	.uleb128 0x139
	.uleb128 0xd
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro70
	.byte	0x3
	.uleb128 0x149
	.uleb128 0x57
	.byte	0x4
	.byte	0x3
	.uleb128 0x14a
	.uleb128 0xd
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro71
	.byte	0x3
	.uleb128 0x18e
	.uleb128 0x57
	.byte	0x4
	.byte	0x3
	.uleb128 0x18f
	.uleb128 0xd
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro72
	.byte	0x3
	.uleb128 0x1e1
	.uleb128 0x57
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro73
	.byte	0x4
	.byte	0x3
	.uleb128 0xd
	.uleb128 0x9
	.byte	0x7
	.long	.Ldebug_macro74
	.file 88 "/usr/include/ncurses_dll.h"
	.byte	0x3
	.uleb128 0x59
	.uleb128 0x58
	.byte	0x7
	.long	.Ldebug_macro75
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro76
	.byte	0x3
	.uleb128 0xf9
	.uleb128 0x19
	.byte	0x7
	.long	.Ldebug_macro77
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro78
	.file 89 "/usr/lib/gcc/x86_64-linux-gnu/11/include/stdbool.h"
	.byte	0x3
	.uleb128 0x11a
	.uleb128 0x59
	.byte	0x7
	.long	.Ldebug_macro79
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro80
	.file 90 "/usr/include/unctrl.h"
	.byte	0x3
	.uleb128 0x830
	.uleb128 0x5a
	.byte	0x7
	.long	.Ldebug_macro81
	.byte	0x3
	.uleb128 0x37
	.uleb128 0x9
	.byte	0x4
	.byte	0x6
	.uleb128 0x39
	.long	.LASF2484
	.byte	0x4
	.byte	0x4
	.file 91 "/home/jscha/dvp/cpumon/src/../include/utils.h"
	.byte	0x3
	.uleb128 0xe
	.uleb128 0x5b
	.byte	0x5
	.uleb128 0x2
	.long	.LASF2485
	.byte	0x4
	.byte	0x3
	.uleb128 0xf
	.uleb128 0x8
	.byte	0x7
	.long	.Ldebug_macro82
	.byte	0x4
	.file 92 "/home/jscha/dvp/cpumon/src/../include/machine_specific_registers.h"
	.byte	0x3
	.uleb128 0x10
	.uleb128 0x5c
	.byte	0x7
	.long	.Ldebug_macro83
	.byte	0x4
	.file 93 "/usr/include/x86_64-linux-gnu/sys/syscall.h"
	.byte	0x3
	.uleb128 0x13
	.uleb128 0x5d
	.byte	0x5
	.uleb128 0x13
	.long	.LASF2524
	.file 94 "/usr/include/x86_64-linux-gnu/asm/unistd.h"
	.byte	0x3
	.uleb128 0x18
	.uleb128 0x5e
	.byte	0x7
	.long	.Ldebug_macro84
	.file 95 "/usr/include/x86_64-linux-gnu/asm/unistd_64.h"
	.byte	0x3
	.uleb128 0x14
	.uleb128 0x5f
	.byte	0x7
	.long	.Ldebug_macro85
	.byte	0x4
	.byte	0x4
	.file 96 "/usr/include/x86_64-linux-gnu/bits/syscall.h"
	.byte	0x3
	.uleb128 0x1d
	.uleb128 0x60
	.byte	0x7
	.long	.Ldebug_macro86
	.byte	0x4
	.byte	0x4
	.file 97 "/usr/include/linux/perf_event.h"
	.byte	0x3
	.uleb128 0x14
	.uleb128 0x61
	.byte	0x5
	.uleb128 0x10
	.long	.LASF3263
	.file 98 "/usr/include/linux/types.h"
	.byte	0x3
	.uleb128 0x12
	.uleb128 0x62
	.byte	0x5
	.uleb128 0x3
	.long	.LASF3264
	.file 99 "/usr/include/x86_64-linux-gnu/asm/types.h"
	.byte	0x3
	.uleb128 0x5
	.uleb128 0x63
	.file 100 "/usr/include/asm-generic/types.h"
	.byte	0x3
	.uleb128 0x1
	.uleb128 0x64
	.byte	0x5
	.uleb128 0x3
	.long	.LASF3265
	.file 101 "/usr/include/asm-generic/int-ll64.h"
	.byte	0x3
	.uleb128 0x7
	.uleb128 0x65
	.byte	0x5
	.uleb128 0xa
	.long	.LASF3266
	.file 102 "/usr/include/x86_64-linux-gnu/asm/bitsperlong.h"
	.byte	0x3
	.uleb128 0xc
	.uleb128 0x66
	.byte	0x7
	.long	.Ldebug_macro87
	.file 103 "/usr/include/asm-generic/bitsperlong.h"
	.byte	0x3
	.uleb128 0xb
	.uleb128 0x67
	.byte	0x7
	.long	.Ldebug_macro88
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.file 104 "/usr/include/linux/posix_types.h"
	.byte	0x3
	.uleb128 0x9
	.uleb128 0x68
	.byte	0x5
	.uleb128 0x3
	.long	.LASF3271
	.file 105 "/usr/include/linux/stddef.h"
	.byte	0x3
	.uleb128 0x5
	.uleb128 0x69
	.byte	0x7
	.long	.Ldebug_macro89
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro90
	.file 106 "/usr/include/x86_64-linux-gnu/asm/posix_types.h"
	.byte	0x3
	.uleb128 0x24
	.uleb128 0x6a
	.file 107 "/usr/include/x86_64-linux-gnu/asm/posix_types_64.h"
	.byte	0x3
	.uleb128 0x7
	.uleb128 0x6b
	.byte	0x7
	.long	.Ldebug_macro91
	.file 108 "/usr/include/asm-generic/posix_types.h"
	.byte	0x3
	.uleb128 0x12
	.uleb128 0x6c
	.byte	0x5
	.uleb128 0x3
	.long	.LASF3280
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro92
	.byte	0x4
	.file 109 "/usr/include/linux/ioctl.h"
	.byte	0x3
	.uleb128 0x13
	.uleb128 0x6d
	.byte	0x5
	.uleb128 0x3
	.long	.LASF3286
	.file 110 "/usr/include/x86_64-linux-gnu/asm/ioctl.h"
	.byte	0x3
	.uleb128 0x5
	.uleb128 0x6e
	.file 111 "/usr/include/asm-generic/ioctl.h"
	.byte	0x3
	.uleb128 0x1
	.uleb128 0x6f
	.byte	0x7
	.long	.Ldebug_macro93
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.file 112 "/usr/include/x86_64-linux-gnu/asm/byteorder.h"
	.byte	0x3
	.uleb128 0x14
	.uleb128 0x70
	.byte	0x5
	.uleb128 0x3
	.long	.LASF3321
	.file 113 "/usr/include/linux/byteorder/little_endian.h"
	.byte	0x3
	.uleb128 0x5
	.uleb128 0x71
	.byte	0x7
	.long	.Ldebug_macro94
	.file 114 "/usr/include/linux/swab.h"
	.byte	0x3
	.uleb128 0xe
	.uleb128 0x72
	.byte	0x5
	.uleb128 0x3
	.long	.LASF3324
	.file 115 "/usr/include/x86_64-linux-gnu/asm/swab.h"
	.byte	0x3
	.uleb128 0x8
	.uleb128 0x73
	.byte	0x7
	.long	.Ldebug_macro95
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro96
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro97
	.byte	0x4
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro98
	.byte	0x4
	.byte	0x4
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdcpredef.h.19.88fdbfd5cf6f83ed579effc3e425f09b,comdat
.Ldebug_macro2:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x13
	.long	.LASF361
	.byte	0x5
	.uleb128 0x26
	.long	.LASF362
	.byte	0x5
	.uleb128 0x27
	.long	.LASF363
	.byte	0x5
	.uleb128 0x30
	.long	.LASF364
	.byte	0x5
	.uleb128 0x31
	.long	.LASF365
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF366
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdio.h.24.5c1b97eef3c86b7a2549420f69f4f128,comdat
.Ldebug_macro3:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x18
	.long	.LASF367
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF368
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.features.h.19.94fa84bfdc4fa1f32c117154c6101507,comdat
.Ldebug_macro4:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x13
	.long	.LASF370
	.byte	0x6
	.uleb128 0x7e
	.long	.LASF371
	.byte	0x6
	.uleb128 0x7f
	.long	.LASF372
	.byte	0x6
	.uleb128 0x80
	.long	.LASF373
	.byte	0x6
	.uleb128 0x81
	.long	.LASF374
	.byte	0x6
	.uleb128 0x82
	.long	.LASF375
	.byte	0x6
	.uleb128 0x83
	.long	.LASF376
	.byte	0x6
	.uleb128 0x84
	.long	.LASF377
	.byte	0x6
	.uleb128 0x85
	.long	.LASF378
	.byte	0x6
	.uleb128 0x86
	.long	.LASF379
	.byte	0x6
	.uleb128 0x87
	.long	.LASF380
	.byte	0x6
	.uleb128 0x88
	.long	.LASF381
	.byte	0x6
	.uleb128 0x89
	.long	.LASF382
	.byte	0x6
	.uleb128 0x8a
	.long	.LASF383
	.byte	0x6
	.uleb128 0x8b
	.long	.LASF384
	.byte	0x6
	.uleb128 0x8c
	.long	.LASF385
	.byte	0x6
	.uleb128 0x8d
	.long	.LASF386
	.byte	0x6
	.uleb128 0x8e
	.long	.LASF387
	.byte	0x6
	.uleb128 0x8f
	.long	.LASF388
	.byte	0x6
	.uleb128 0x90
	.long	.LASF389
	.byte	0x6
	.uleb128 0x91
	.long	.LASF390
	.byte	0x6
	.uleb128 0x92
	.long	.LASF391
	.byte	0x6
	.uleb128 0x93
	.long	.LASF392
	.byte	0x6
	.uleb128 0x94
	.long	.LASF393
	.byte	0x6
	.uleb128 0x95
	.long	.LASF394
	.byte	0x6
	.uleb128 0x96
	.long	.LASF395
	.byte	0x6
	.uleb128 0x97
	.long	.LASF396
	.byte	0x6
	.uleb128 0x98
	.long	.LASF397
	.byte	0x5
	.uleb128 0x9d
	.long	.LASF398
	.byte	0x5
	.uleb128 0xa8
	.long	.LASF399
	.byte	0x5
	.uleb128 0xb6
	.long	.LASF400
	.byte	0x5
	.uleb128 0xba
	.long	.LASF401
	.byte	0x6
	.uleb128 0xeb
	.long	.LASF402
	.byte	0x5
	.uleb128 0xec
	.long	.LASF403
	.byte	0x5
	.uleb128 0xf4
	.long	.LASF404
	.byte	0x5
	.uleb128 0xfa
	.long	.LASF405
	.byte	0x5
	.uleb128 0x101
	.long	.LASF406
	.byte	0x5
	.uleb128 0x108
	.long	.LASF407
	.byte	0x5
	.uleb128 0x11d
	.long	.LASF408
	.byte	0x6
	.uleb128 0x11f
	.long	.LASF409
	.byte	0x5
	.uleb128 0x120
	.long	.LASF410
	.byte	0x6
	.uleb128 0x121
	.long	.LASF411
	.byte	0x5
	.uleb128 0x122
	.long	.LASF412
	.byte	0x5
	.uleb128 0x145
	.long	.LASF413
	.byte	0x5
	.uleb128 0x149
	.long	.LASF414
	.byte	0x5
	.uleb128 0x14d
	.long	.LASF415
	.byte	0x5
	.uleb128 0x151
	.long	.LASF416
	.byte	0x5
	.uleb128 0x155
	.long	.LASF417
	.byte	0x6
	.uleb128 0x156
	.long	.LASF373
	.byte	0x5
	.uleb128 0x157
	.long	.LASF407
	.byte	0x6
	.uleb128 0x158
	.long	.LASF372
	.byte	0x5
	.uleb128 0x159
	.long	.LASF406
	.byte	0x5
	.uleb128 0x15d
	.long	.LASF418
	.byte	0x6
	.uleb128 0x15e
	.long	.LASF419
	.byte	0x5
	.uleb128 0x15f
	.long	.LASF420
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.wordsize.h.4.baf119258a1e53d8dba67ceac44ab6bc,comdat
.Ldebug_macro5:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x4
	.long	.LASF421
	.byte	0x5
	.uleb128 0xc
	.long	.LASF422
	.byte	0x5
	.uleb128 0xe
	.long	.LASF423
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.features.h.395.e2af5c05e8a4fd5a2d004043e21657e0,comdat
.Ldebug_macro6:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x18b
	.long	.LASF425
	.byte	0x5
	.uleb128 0x18f
	.long	.LASF426
	.byte	0x5
	.uleb128 0x1ac
	.long	.LASF427
	.byte	0x5
	.uleb128 0x1b4
	.long	.LASF428
	.byte	0x5
	.uleb128 0x1cb
	.long	.LASF429
	.byte	0x6
	.uleb128 0x1d8
	.long	.LASF430
	.byte	0x5
	.uleb128 0x1d9
	.long	.LASF431
	.byte	0x5
	.uleb128 0x1dd
	.long	.LASF432
	.byte	0x5
	.uleb128 0x1de
	.long	.LASF433
	.byte	0x5
	.uleb128 0x1e0
	.long	.LASF434
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.cdefs.h.20.49c9437adba4cb37cdb1b4e91d72989f,comdat
.Ldebug_macro7:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.long	.LASF435
	.byte	0x2
	.uleb128 0x23
	.string	"__P"
	.byte	0x6
	.uleb128 0x24
	.long	.LASF436
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF437
	.byte	0x5
	.uleb128 0x32
	.long	.LASF438
	.byte	0x5
	.uleb128 0x39
	.long	.LASF439
	.byte	0x5
	.uleb128 0x41
	.long	.LASF440
	.byte	0x5
	.uleb128 0x42
	.long	.LASF441
	.byte	0x5
	.uleb128 0x4f
	.long	.LASF442
	.byte	0x5
	.uleb128 0x50
	.long	.LASF443
	.byte	0x5
	.uleb128 0x51
	.long	.LASF444
	.byte	0x5
	.uleb128 0x52
	.long	.LASF445
	.byte	0x5
	.uleb128 0x76
	.long	.LASF446
	.byte	0x5
	.uleb128 0x77
	.long	.LASF447
	.byte	0x5
	.uleb128 0x7c
	.long	.LASF448
	.byte	0x5
	.uleb128 0x7d
	.long	.LASF449
	.byte	0x5
	.uleb128 0x80
	.long	.LASF450
	.byte	0x5
	.uleb128 0x88
	.long	.LASF451
	.byte	0x5
	.uleb128 0x89
	.long	.LASF452
	.byte	0x5
	.uleb128 0x8e
	.long	.LASF453
	.byte	0x5
	.uleb128 0x8f
	.long	.LASF454
	.byte	0x5
	.uleb128 0x97
	.long	.LASF455
	.byte	0x5
	.uleb128 0x98
	.long	.LASF456
	.byte	0x5
	.uleb128 0x9f
	.long	.LASF457
	.byte	0x5
	.uleb128 0xa0
	.long	.LASF458
	.byte	0x5
	.uleb128 0xa7
	.long	.LASF459
	.byte	0x5
	.uleb128 0xb0
	.long	.LASF460
	.byte	0x5
	.uleb128 0xb9
	.long	.LASF461
	.byte	0x5
	.uleb128 0xc3
	.long	.LASF462
	.byte	0x5
	.uleb128 0xcb
	.long	.LASF463
	.byte	0x5
	.uleb128 0xcc
	.long	.LASF464
	.byte	0x5
	.uleb128 0xd8
	.long	.LASF465
	.byte	0x5
	.uleb128 0xd9
	.long	.LASF466
	.byte	0x5
	.uleb128 0xf7
	.long	.LASF467
	.byte	0x5
	.uleb128 0xfe
	.long	.LASF468
	.byte	0x5
	.uleb128 0x100
	.long	.LASF469
	.byte	0x5
	.uleb128 0x103
	.long	.LASF470
	.byte	0x5
	.uleb128 0x104
	.long	.LASF471
	.byte	0x5
	.uleb128 0x119
	.long	.LASF472
	.byte	0x5
	.uleb128 0x121
	.long	.LASF473
	.byte	0x5
	.uleb128 0x12a
	.long	.LASF474
	.byte	0x5
	.uleb128 0x134
	.long	.LASF475
	.byte	0x5
	.uleb128 0x13b
	.long	.LASF476
	.byte	0x5
	.uleb128 0x141
	.long	.LASF477
	.byte	0x5
	.uleb128 0x14a
	.long	.LASF478
	.byte	0x5
	.uleb128 0x14b
	.long	.LASF479
	.byte	0x5
	.uleb128 0x153
	.long	.LASF480
	.byte	0x5
	.uleb128 0x15d
	.long	.LASF481
	.byte	0x5
	.uleb128 0x16a
	.long	.LASF482
	.byte	0x5
	.uleb128 0x174
	.long	.LASF483
	.byte	0x5
	.uleb128 0x180
	.long	.LASF484
	.byte	0x5
	.uleb128 0x186
	.long	.LASF485
	.byte	0x5
	.uleb128 0x18d
	.long	.LASF486
	.byte	0x5
	.uleb128 0x196
	.long	.LASF487
	.byte	0x5
	.uleb128 0x19f
	.long	.LASF488
	.byte	0x6
	.uleb128 0x1a7
	.long	.LASF489
	.byte	0x5
	.uleb128 0x1a8
	.long	.LASF490
	.byte	0x5
	.uleb128 0x1b1
	.long	.LASF491
	.byte	0x5
	.uleb128 0x1c3
	.long	.LASF492
	.byte	0x5
	.uleb128 0x1c4
	.long	.LASF493
	.byte	0x5
	.uleb128 0x1cd
	.long	.LASF494
	.byte	0x5
	.uleb128 0x1d3
	.long	.LASF495
	.byte	0x5
	.uleb128 0x1d4
	.long	.LASF496
	.byte	0x5
	.uleb128 0x1ef
	.long	.LASF497
	.byte	0x5
	.uleb128 0x1fe
	.long	.LASF498
	.byte	0x5
	.uleb128 0x1ff
	.long	.LASF499
	.byte	0x5
	.uleb128 0x214
	.long	.LASF500
	.byte	0x6
	.uleb128 0x21a
	.long	.LASF501
	.byte	0x5
	.uleb128 0x21e
	.long	.LASF502
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.cdefs.h.616.8d7ca1b9d01e52f5b2c040c19a111f7b,comdat
.Ldebug_macro8:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x268
	.long	.LASF504
	.byte	0x5
	.uleb128 0x269
	.long	.LASF505
	.byte	0x5
	.uleb128 0x26a
	.long	.LASF506
	.byte	0x5
	.uleb128 0x26b
	.long	.LASF507
	.byte	0x5
	.uleb128 0x26c
	.long	.LASF508
	.byte	0x5
	.uleb128 0x26d
	.long	.LASF509
	.byte	0x5
	.uleb128 0x26f
	.long	.LASF510
	.byte	0x5
	.uleb128 0x270
	.long	.LASF511
	.byte	0x5
	.uleb128 0x27b
	.long	.LASF512
	.byte	0x5
	.uleb128 0x27c
	.long	.LASF513
	.byte	0x5
	.uleb128 0x28e
	.long	.LASF514
	.byte	0x5
	.uleb128 0x299
	.long	.LASF515
	.byte	0x5
	.uleb128 0x2a1
	.long	.LASF516
	.byte	0x5
	.uleb128 0x2a4
	.long	.LASF517
	.byte	0x5
	.uleb128 0x2b1
	.long	.LASF518
	.byte	0x5
	.uleb128 0x2b3
	.long	.LASF519
	.byte	0x5
	.uleb128 0x2bc
	.long	.LASF520
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stubs64.h.10.7865f4f7062bab1c535c1f73f43aa9b9,comdat
.Ldebug_macro9:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xa
	.long	.LASF521
	.byte	0x5
	.uleb128 0xb
	.long	.LASF522
	.byte	0x5
	.uleb128 0xc
	.long	.LASF523
	.byte	0x5
	.uleb128 0xd
	.long	.LASF524
	.byte	0x5
	.uleb128 0xe
	.long	.LASF525
	.byte	0x5
	.uleb128 0xf
	.long	.LASF526
	.byte	0x5
	.uleb128 0x10
	.long	.LASF527
	.byte	0x5
	.uleb128 0x11
	.long	.LASF528
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.libcheaderstart.h.37.e7d4b6f4649b40d3e0dce357ae78234f,comdat
.Ldebug_macro10:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x25
	.long	.LASF529
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF530
	.byte	0x6
	.uleb128 0x43
	.long	.LASF531
	.byte	0x5
	.uleb128 0x47
	.long	.LASF532
	.byte	0x6
	.uleb128 0x49
	.long	.LASF533
	.byte	0x5
	.uleb128 0x4d
	.long	.LASF534
	.byte	0x6
	.uleb128 0x4f
	.long	.LASF535
	.byte	0x5
	.uleb128 0x53
	.long	.LASF536
	.byte	0x6
	.uleb128 0x5a
	.long	.LASF537
	.byte	0x5
	.uleb128 0x5e
	.long	.LASF538
	.byte	0x6
	.uleb128 0x60
	.long	.LASF539
	.byte	0x5
	.uleb128 0x64
	.long	.LASF540
	.byte	0x6
	.uleb128 0x69
	.long	.LASF541
	.byte	0x5
	.uleb128 0x6d
	.long	.LASF542
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdio.h.31.e39a94e203ad4e1d978c0fc68ce016ee,comdat
.Ldebug_macro11:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF543
	.byte	0x5
	.uleb128 0x20
	.long	.LASF544
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stddef.h.181.c3f52a3b0f4c288bddb5dda1562858e2,comdat
.Ldebug_macro12:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xb5
	.long	.LASF545
	.byte	0x5
	.uleb128 0xb6
	.long	.LASF546
	.byte	0x5
	.uleb128 0xb7
	.long	.LASF547
	.byte	0x5
	.uleb128 0xb8
	.long	.LASF548
	.byte	0x5
	.uleb128 0xb9
	.long	.LASF549
	.byte	0x5
	.uleb128 0xba
	.long	.LASF550
	.byte	0x5
	.uleb128 0xbb
	.long	.LASF551
	.byte	0x5
	.uleb128 0xbc
	.long	.LASF552
	.byte	0x5
	.uleb128 0xbd
	.long	.LASF553
	.byte	0x5
	.uleb128 0xbe
	.long	.LASF554
	.byte	0x5
	.uleb128 0xbf
	.long	.LASF555
	.byte	0x5
	.uleb128 0xc0
	.long	.LASF556
	.byte	0x5
	.uleb128 0xc1
	.long	.LASF557
	.byte	0x5
	.uleb128 0xc2
	.long	.LASF558
	.byte	0x5
	.uleb128 0xc3
	.long	.LASF559
	.byte	0x5
	.uleb128 0xc4
	.long	.LASF560
	.byte	0x5
	.uleb128 0xcb
	.long	.LASF561
	.byte	0x6
	.uleb128 0xe7
	.long	.LASF562
	.byte	0x6
	.uleb128 0x186
	.long	.LASF563
	.byte	0x5
	.uleb128 0x18b
	.long	.LASF564
	.byte	0x6
	.uleb128 0x191
	.long	.LASF565
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdarg.h.34.3a23a216c0c293b3d2ea2e89281481e6,comdat
.Ldebug_macro13:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x22
	.long	.LASF567
	.byte	0x5
	.uleb128 0x27
	.long	.LASF568
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.types.h.109.56eb9ae966b255288cc544f18746a7ff,comdat
.Ldebug_macro14:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x6d
	.long	.LASF570
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF571
	.byte	0x5
	.uleb128 0x6f
	.long	.LASF572
	.byte	0x5
	.uleb128 0x70
	.long	.LASF573
	.byte	0x5
	.uleb128 0x71
	.long	.LASF574
	.byte	0x5
	.uleb128 0x72
	.long	.LASF575
	.byte	0x5
	.uleb128 0x80
	.long	.LASF576
	.byte	0x5
	.uleb128 0x81
	.long	.LASF577
	.byte	0x5
	.uleb128 0x82
	.long	.LASF578
	.byte	0x5
	.uleb128 0x83
	.long	.LASF579
	.byte	0x5
	.uleb128 0x84
	.long	.LASF580
	.byte	0x5
	.uleb128 0x85
	.long	.LASF581
	.byte	0x5
	.uleb128 0x86
	.long	.LASF582
	.byte	0x5
	.uleb128 0x87
	.long	.LASF583
	.byte	0x5
	.uleb128 0x89
	.long	.LASF584
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.typesizes.h.24.ccf5919b8e01b553263cf8f4ab1d5fde,comdat
.Ldebug_macro15:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x18
	.long	.LASF585
	.byte	0x5
	.uleb128 0x22
	.long	.LASF586
	.byte	0x5
	.uleb128 0x23
	.long	.LASF587
	.byte	0x5
	.uleb128 0x26
	.long	.LASF588
	.byte	0x5
	.uleb128 0x27
	.long	.LASF589
	.byte	0x5
	.uleb128 0x28
	.long	.LASF590
	.byte	0x5
	.uleb128 0x29
	.long	.LASF591
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF592
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF593
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF594
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF595
	.byte	0x5
	.uleb128 0x33
	.long	.LASF596
	.byte	0x5
	.uleb128 0x34
	.long	.LASF597
	.byte	0x5
	.uleb128 0x35
	.long	.LASF598
	.byte	0x5
	.uleb128 0x36
	.long	.LASF599
	.byte	0x5
	.uleb128 0x37
	.long	.LASF600
	.byte	0x5
	.uleb128 0x38
	.long	.LASF601
	.byte	0x5
	.uleb128 0x39
	.long	.LASF602
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF603
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF604
	.byte	0x5
	.uleb128 0x3c
	.long	.LASF605
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF606
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF607
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF608
	.byte	0x5
	.uleb128 0x40
	.long	.LASF609
	.byte	0x5
	.uleb128 0x41
	.long	.LASF610
	.byte	0x5
	.uleb128 0x42
	.long	.LASF611
	.byte	0x5
	.uleb128 0x43
	.long	.LASF612
	.byte	0x5
	.uleb128 0x44
	.long	.LASF613
	.byte	0x5
	.uleb128 0x45
	.long	.LASF614
	.byte	0x5
	.uleb128 0x46
	.long	.LASF615
	.byte	0x5
	.uleb128 0x47
	.long	.LASF616
	.byte	0x5
	.uleb128 0x48
	.long	.LASF617
	.byte	0x5
	.uleb128 0x49
	.long	.LASF618
	.byte	0x5
	.uleb128 0x4a
	.long	.LASF619
	.byte	0x5
	.uleb128 0x4b
	.long	.LASF620
	.byte	0x5
	.uleb128 0x51
	.long	.LASF621
	.byte	0x5
	.uleb128 0x54
	.long	.LASF622
	.byte	0x5
	.uleb128 0x57
	.long	.LASF623
	.byte	0x5
	.uleb128 0x5a
	.long	.LASF624
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF625
	.byte	0x5
	.uleb128 0x67
	.long	.LASF626
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.time64.h.24.a8166ae916ec910dab0d8987098d42ee,comdat
.Ldebug_macro16:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x18
	.long	.LASF627
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF628
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.struct_FILE.h.19.0888ac70396abe1031c03d393554032f,comdat
.Ldebug_macro17:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x13
	.long	.LASF635
	.byte	0x5
	.uleb128 0x66
	.long	.LASF636
	.byte	0x5
	.uleb128 0x6a
	.long	.LASF637
	.byte	0x5
	.uleb128 0x6f
	.long	.LASF638
	.byte	0x5
	.uleb128 0x70
	.long	.LASF639
	.byte	0x5
	.uleb128 0x72
	.long	.LASF640
	.byte	0x5
	.uleb128 0x73
	.long	.LASF641
	.byte	0x5
	.uleb128 0x75
	.long	.LASF642
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdio.h.53.78a7f18f3bc87ded52f05aa6f6a64310,comdat
.Ldebug_macro18:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x35
	.long	.LASF643
	.byte	0x5
	.uleb128 0x43
	.long	.LASF644
	.byte	0x5
	.uleb128 0x4e
	.long	.LASF645
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF646
	.byte	0x5
	.uleb128 0x5e
	.long	.LASF647
	.byte	0x5
	.uleb128 0x5f
	.long	.LASF648
	.byte	0x5
	.uleb128 0x63
	.long	.LASF649
	.byte	0x5
	.uleb128 0x68
	.long	.LASF650
	.byte	0x5
	.uleb128 0x6d
	.long	.LASF651
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF652
	.byte	0x5
	.uleb128 0x6f
	.long	.LASF653
	.byte	0x5
	.uleb128 0x78
	.long	.LASF654
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdio_lim.h.19.e4b00b560d878dcfbc6635b3406640c5,comdat
.Ldebug_macro19:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x13
	.long	.LASF655
	.byte	0x5
	.uleb128 0x19
	.long	.LASF656
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF657
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF658
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF659
	.byte	0x6
	.uleb128 0x24
	.long	.LASF660
	.byte	0x5
	.uleb128 0x25
	.long	.LASF661
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdio.h.147.dbd603e98db8f3e1583090fab2abd54e,comdat
.Ldebug_macro20:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x93
	.long	.LASF662
	.byte	0x5
	.uleb128 0x94
	.long	.LASF663
	.byte	0x5
	.uleb128 0x95
	.long	.LASF664
	.byte	0x6
	.uleb128 0xb4
	.long	.LASF665
	.byte	0x5
	.uleb128 0xb5
	.long	.LASF666
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.floatn.h.20.a55feb25f1f7464b830caad4873a8713,comdat
.Ldebug_macro21:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.long	.LASF667
	.byte	0x5
	.uleb128 0x20
	.long	.LASF668
	.byte	0x5
	.uleb128 0x28
	.long	.LASF669
	.byte	0x5
	.uleb128 0x30
	.long	.LASF670
	.byte	0x5
	.uleb128 0x36
	.long	.LASF671
	.byte	0x5
	.uleb128 0x41
	.long	.LASF672
	.byte	0x5
	.uleb128 0x4d
	.long	.LASF673
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.floatncommon.h.34.7e1840d7dfb19e9bdb51aeb077d76637,comdat
.Ldebug_macro22:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x22
	.long	.LASF675
	.byte	0x5
	.uleb128 0x23
	.long	.LASF676
	.byte	0x5
	.uleb128 0x24
	.long	.LASF677
	.byte	0x5
	.uleb128 0x25
	.long	.LASF678
	.byte	0x5
	.uleb128 0x26
	.long	.LASF679
	.byte	0x5
	.uleb128 0x34
	.long	.LASF680
	.byte	0x5
	.uleb128 0x35
	.long	.LASF681
	.byte	0x5
	.uleb128 0x36
	.long	.LASF682
	.byte	0x5
	.uleb128 0x37
	.long	.LASF683
	.byte	0x5
	.uleb128 0x38
	.long	.LASF684
	.byte	0x5
	.uleb128 0x39
	.long	.LASF685
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF686
	.byte	0x5
	.uleb128 0x46
	.long	.LASF687
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF688
	.byte	0x5
	.uleb128 0x69
	.long	.LASF689
	.byte	0x5
	.uleb128 0x71
	.long	.LASF690
	.byte	0x5
	.uleb128 0x7d
	.long	.LASF691
	.byte	0x5
	.uleb128 0x97
	.long	.LASF692
	.byte	0x5
	.uleb128 0xa3
	.long	.LASF693
	.byte	0x5
	.uleb128 0xab
	.long	.LASF694
	.byte	0x5
	.uleb128 0xb7
	.long	.LASF695
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdint.h.23.022efde71688fcb285fe42cc87d41ee3,comdat
.Ldebug_macro23:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x17
	.long	.LASF696
	.byte	0x5
	.uleb128 0x19
	.long	.LASF368
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.libcheaderstart.h.31.045646cfd09d1c615866e08d91c4f364,comdat
.Ldebug_macro24:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x1f
	.long	.LASF369
	.byte	0x6
	.uleb128 0x25
	.long	.LASF529
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF530
	.byte	0x6
	.uleb128 0x43
	.long	.LASF531
	.byte	0x5
	.uleb128 0x47
	.long	.LASF532
	.byte	0x6
	.uleb128 0x49
	.long	.LASF533
	.byte	0x5
	.uleb128 0x4d
	.long	.LASF534
	.byte	0x6
	.uleb128 0x4f
	.long	.LASF535
	.byte	0x5
	.uleb128 0x53
	.long	.LASF536
	.byte	0x6
	.uleb128 0x5a
	.long	.LASF537
	.byte	0x5
	.uleb128 0x5e
	.long	.LASF538
	.byte	0x6
	.uleb128 0x60
	.long	.LASF539
	.byte	0x5
	.uleb128 0x64
	.long	.LASF540
	.byte	0x6
	.uleb128 0x69
	.long	.LASF541
	.byte	0x5
	.uleb128 0x6d
	.long	.LASF542
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.wchar.h.20.510818a05484290d697a517509bf4b2d,comdat
.Ldebug_macro25:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.long	.LASF697
	.byte	0x5
	.uleb128 0x22
	.long	.LASF698
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF699
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdint.h.88.7e8071bbba3b822ff5b29420f80324ec,comdat
.Ldebug_macro26:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x58
	.long	.LASF702
	.byte	0x5
	.uleb128 0x6a
	.long	.LASF122
	.byte	0x5
	.uleb128 0x6b
	.long	.LASF131
	.byte	0x5
	.uleb128 0x74
	.long	.LASF703
	.byte	0x5
	.uleb128 0x75
	.long	.LASF704
	.byte	0x5
	.uleb128 0x76
	.long	.LASF705
	.byte	0x5
	.uleb128 0x77
	.long	.LASF706
	.byte	0x5
	.uleb128 0x79
	.long	.LASF707
	.byte	0x5
	.uleb128 0x7a
	.long	.LASF708
	.byte	0x5
	.uleb128 0x7b
	.long	.LASF709
	.byte	0x5
	.uleb128 0x7c
	.long	.LASF710
	.byte	0x5
	.uleb128 0x7f
	.long	.LASF711
	.byte	0x5
	.uleb128 0x80
	.long	.LASF712
	.byte	0x5
	.uleb128 0x81
	.long	.LASF713
	.byte	0x5
	.uleb128 0x82
	.long	.LASF714
	.byte	0x5
	.uleb128 0x86
	.long	.LASF715
	.byte	0x5
	.uleb128 0x87
	.long	.LASF716
	.byte	0x5
	.uleb128 0x88
	.long	.LASF717
	.byte	0x5
	.uleb128 0x89
	.long	.LASF718
	.byte	0x5
	.uleb128 0x8b
	.long	.LASF719
	.byte	0x5
	.uleb128 0x8c
	.long	.LASF720
	.byte	0x5
	.uleb128 0x8d
	.long	.LASF721
	.byte	0x5
	.uleb128 0x8e
	.long	.LASF722
	.byte	0x5
	.uleb128 0x91
	.long	.LASF723
	.byte	0x5
	.uleb128 0x92
	.long	.LASF724
	.byte	0x5
	.uleb128 0x93
	.long	.LASF725
	.byte	0x5
	.uleb128 0x94
	.long	.LASF726
	.byte	0x5
	.uleb128 0x98
	.long	.LASF727
	.byte	0x5
	.uleb128 0x9a
	.long	.LASF728
	.byte	0x5
	.uleb128 0x9b
	.long	.LASF729
	.byte	0x5
	.uleb128 0xa0
	.long	.LASF730
	.byte	0x5
	.uleb128 0xa2
	.long	.LASF731
	.byte	0x5
	.uleb128 0xa4
	.long	.LASF732
	.byte	0x5
	.uleb128 0xa5
	.long	.LASF733
	.byte	0x5
	.uleb128 0xaa
	.long	.LASF734
	.byte	0x5
	.uleb128 0xad
	.long	.LASF735
	.byte	0x5
	.uleb128 0xaf
	.long	.LASF736
	.byte	0x5
	.uleb128 0xb0
	.long	.LASF737
	.byte	0x5
	.uleb128 0xb5
	.long	.LASF738
	.byte	0x5
	.uleb128 0xba
	.long	.LASF739
	.byte	0x5
	.uleb128 0xbb
	.long	.LASF740
	.byte	0x5
	.uleb128 0xbc
	.long	.LASF741
	.byte	0x5
	.uleb128 0xc5
	.long	.LASF742
	.byte	0x5
	.uleb128 0xc7
	.long	.LASF743
	.byte	0x5
	.uleb128 0xca
	.long	.LASF744
	.byte	0x5
	.uleb128 0xd1
	.long	.LASF745
	.byte	0x5
	.uleb128 0xd2
	.long	.LASF746
	.byte	0x5
	.uleb128 0xde
	.long	.LASF747
	.byte	0x5
	.uleb128 0xdf
	.long	.LASF748
	.byte	0x5
	.uleb128 0xe3
	.long	.LASF749
	.byte	0x5
	.uleb128 0xef
	.long	.LASF750
	.byte	0x5
	.uleb128 0xf0
	.long	.LASF751
	.byte	0x5
	.uleb128 0xf4
	.long	.LASF752
	.byte	0x5
	.uleb128 0xf5
	.long	.LASF753
	.byte	0x5
	.uleb128 0xf8
	.long	.LASF754
	.byte	0x5
	.uleb128 0xf9
	.long	.LASF755
	.byte	0x5
	.uleb128 0xfa
	.long	.LASF756
	.byte	0x5
	.uleb128 0xfc
	.long	.LASF757
	.byte	0x5
	.uleb128 0x102
	.long	.LASF758
	.byte	0x5
	.uleb128 0x103
	.long	.LASF759
	.byte	0x5
	.uleb128 0x104
	.long	.LASF760
	.byte	0x5
	.uleb128 0x106
	.long	.LASF761
	.byte	0x5
	.uleb128 0x10d
	.long	.LASF762
	.byte	0x5
	.uleb128 0x10e
	.long	.LASF763
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdlib.h.29.dde59e751a3b6c4506ba901b60a85c87,comdat
.Ldebug_macro27:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF543
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF765
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF544
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stddef.h.231.ac1e89356001c54fbeb8aaa0d15e8b3c,comdat
.Ldebug_macro28:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0xe7
	.long	.LASF562
	.byte	0x5
	.uleb128 0x104
	.long	.LASF766
	.byte	0x5
	.uleb128 0x105
	.long	.LASF767
	.byte	0x5
	.uleb128 0x106
	.long	.LASF768
	.byte	0x5
	.uleb128 0x107
	.long	.LASF769
	.byte	0x5
	.uleb128 0x108
	.long	.LASF770
	.byte	0x5
	.uleb128 0x109
	.long	.LASF771
	.byte	0x5
	.uleb128 0x10a
	.long	.LASF772
	.byte	0x5
	.uleb128 0x10b
	.long	.LASF773
	.byte	0x5
	.uleb128 0x10c
	.long	.LASF774
	.byte	0x5
	.uleb128 0x10d
	.long	.LASF775
	.byte	0x5
	.uleb128 0x10e
	.long	.LASF776
	.byte	0x5
	.uleb128 0x10f
	.long	.LASF777
	.byte	0x5
	.uleb128 0x110
	.long	.LASF778
	.byte	0x5
	.uleb128 0x111
	.long	.LASF779
	.byte	0x5
	.uleb128 0x112
	.long	.LASF780
	.byte	0x6
	.uleb128 0x11f
	.long	.LASF781
	.byte	0x6
	.uleb128 0x154
	.long	.LASF782
	.byte	0x6
	.uleb128 0x186
	.long	.LASF563
	.byte	0x5
	.uleb128 0x18b
	.long	.LASF564
	.byte	0x6
	.uleb128 0x191
	.long	.LASF565
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.waitflags.h.25.33c1a56564084888d0719c1519fd9fc3,comdat
.Ldebug_macro29:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x19
	.long	.LASF784
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF785
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF786
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF787
	.byte	0x5
	.uleb128 0x20
	.long	.LASF788
	.byte	0x5
	.uleb128 0x21
	.long	.LASF789
	.byte	0x5
	.uleb128 0x24
	.long	.LASF790
	.byte	0x5
	.uleb128 0x26
	.long	.LASF791
	.byte	0x5
	.uleb128 0x27
	.long	.LASF792
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.waitstatus.h.28.93f167f49d64e2b9b99f98d1162a93bf,comdat
.Ldebug_macro30:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF793
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF794
	.byte	0x5
	.uleb128 0x22
	.long	.LASF795
	.byte	0x5
	.uleb128 0x25
	.long	.LASF796
	.byte	0x5
	.uleb128 0x28
	.long	.LASF797
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF798
	.byte	0x5
	.uleb128 0x31
	.long	.LASF799
	.byte	0x5
	.uleb128 0x35
	.long	.LASF800
	.byte	0x5
	.uleb128 0x38
	.long	.LASF801
	.byte	0x5
	.uleb128 0x39
	.long	.LASF802
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF803
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF804
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdlib.h.44.fc9d051d38577d71bf2818359e56065c,comdat
.Ldebug_macro31:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF805
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF806
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF807
	.byte	0x5
	.uleb128 0x2f
	.long	.LASF808
	.byte	0x5
	.uleb128 0x30
	.long	.LASF809
	.byte	0x5
	.uleb128 0x31
	.long	.LASF810
	.byte	0x5
	.uleb128 0x33
	.long	.LASF811
	.byte	0x5
	.uleb128 0x48
	.long	.LASF812
	.byte	0x5
	.uleb128 0x52
	.long	.LASF813
	.byte	0x5
	.uleb128 0x57
	.long	.LASF814
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF815
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF816
	.byte	0x5
	.uleb128 0x61
	.long	.LASF817
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.types.h.23.882ecbf54662e1f16e101552381a65da,comdat
.Ldebug_macro32:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x17
	.long	.LASF818
	.byte	0x5
	.uleb128 0x28
	.long	.LASF819
	.byte	0x5
	.uleb128 0x33
	.long	.LASF820
	.byte	0x5
	.uleb128 0x3c
	.long	.LASF821
	.byte	0x5
	.uleb128 0x41
	.long	.LASF822
	.byte	0x5
	.uleb128 0x46
	.long	.LASF823
	.byte	0x5
	.uleb128 0x4b
	.long	.LASF824
	.byte	0x5
	.uleb128 0x50
	.long	.LASF825
	.byte	0x5
	.uleb128 0x62
	.long	.LASF826
	.byte	0x5
	.uleb128 0x68
	.long	.LASF827
	.byte	0x5
	.uleb128 0x74
	.long	.LASF828
	.byte	0x5
	.uleb128 0x7a
	.long	.LASF829
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stddef.h.231.0adce5c8c1fd8096aaff50981b3d1f0f,comdat
.Ldebug_macro33:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0xe7
	.long	.LASF562
	.byte	0x6
	.uleb128 0x191
	.long	.LASF565
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.endian.h.20.efabd1018df5d7b4052c27dc6bdd5ce5,comdat
.Ldebug_macro34:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.long	.LASF836
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF837
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF838
	.byte	0x5
	.uleb128 0x20
	.long	.LASF839
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.endianness.h.2.2c6a211f7909f3af5e9e9cfa3b6b63c8,comdat
.Ldebug_macro35:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x2
	.long	.LASF840
	.byte	0x5
	.uleb128 0x9
	.long	.LASF841
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.endian.h.40.9e5d395adda2f4eb53ae69b69b664084,comdat
.Ldebug_macro36:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x28
	.long	.LASF842
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF843
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.endian.h.27.4c4f94262c4eaee2982fe00ed1b4f173,comdat
.Ldebug_macro37:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF844
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF845
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF846
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF847
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.byteswap.h.24.5363c019348146aada5aeadf51456576,comdat
.Ldebug_macro38:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x18
	.long	.LASF848
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF849
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF850
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF851
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.endian.h.39.30a606dbd99b6c3df61c1f06dbdabd4e,comdat
.Ldebug_macro39:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x27
	.long	.LASF853
	.byte	0x5
	.uleb128 0x28
	.long	.LASF854
	.byte	0x5
	.uleb128 0x29
	.long	.LASF855
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF856
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF857
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF858
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF859
	.byte	0x5
	.uleb128 0x2f
	.long	.LASF860
	.byte	0x5
	.uleb128 0x31
	.long	.LASF861
	.byte	0x5
	.uleb128 0x32
	.long	.LASF862
	.byte	0x5
	.uleb128 0x33
	.long	.LASF863
	.byte	0x5
	.uleb128 0x34
	.long	.LASF864
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.select.h.25.df647f04fce2d846f134ede6a14ddf91,comdat
.Ldebug_macro40:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x19
	.long	.LASF866
	.byte	0x5
	.uleb128 0x20
	.long	.LASF867
	.byte	0x5
	.uleb128 0x22
	.long	.LASF868
	.byte	0x5
	.uleb128 0x24
	.long	.LASF869
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.__sigset_t.h.2.6b1ab6ff3d7b8fd9c0c42b0d80afbd80,comdat
.Ldebug_macro41:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x2
	.long	.LASF871
	.byte	0x5
	.uleb128 0x4
	.long	.LASF872
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.select.h.44.887a4ff60aa97fcd9c1be017735e1675,comdat
.Ldebug_macro42:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF875
	.byte	0x6
	.uleb128 0x34
	.long	.LASF876
	.byte	0x5
	.uleb128 0x36
	.long	.LASF877
	.byte	0x5
	.uleb128 0x37
	.long	.LASF878
	.byte	0x5
	.uleb128 0x38
	.long	.LASF879
	.byte	0x5
	.uleb128 0x44
	.long	.LASF880
	.byte	0x5
	.uleb128 0x49
	.long	.LASF881
	.byte	0x5
	.uleb128 0x50
	.long	.LASF882
	.byte	0x5
	.uleb128 0x55
	.long	.LASF883
	.byte	0x5
	.uleb128 0x56
	.long	.LASF884
	.byte	0x5
	.uleb128 0x57
	.long	.LASF885
	.byte	0x5
	.uleb128 0x58
	.long	.LASF886
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.types.h.186.489a4ed8f2d29cd358843490f54ddea5,comdat
.Ldebug_macro43:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xba
	.long	.LASF887
	.byte	0x5
	.uleb128 0xc1
	.long	.LASF888
	.byte	0x5
	.uleb128 0xc5
	.long	.LASF889
	.byte	0x5
	.uleb128 0xc9
	.long	.LASF890
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.pthreadtypesarch.h.25.6063cba99664c916e22d3a912bcc348a,comdat
.Ldebug_macro44:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x19
	.long	.LASF894
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF895
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF896
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF897
	.byte	0x5
	.uleb128 0x29
	.long	.LASF898
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF899
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF900
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF901
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF902
	.byte	0x5
	.uleb128 0x2f
	.long	.LASF903
	.byte	0x5
	.uleb128 0x30
	.long	.LASF904
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.struct_mutex.h.20.ed51f515172b9be99e450ba83eb5dd99,comdat
.Ldebug_macro45:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.long	.LASF906
	.byte	0x5
	.uleb128 0x25
	.long	.LASF907
	.byte	0x5
	.uleb128 0x38
	.long	.LASF908
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.struct_rwlock.h.21.0254880f2904e3833fb8ae683e0f0330,comdat
.Ldebug_macro46:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x15
	.long	.LASF909
	.byte	0x5
	.uleb128 0x28
	.long	.LASF910
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF911
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.alloca.h.19.edefa922a76c1cbaaf1e416903ba2d1c,comdat
.Ldebug_macro47:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x13
	.long	.LASF914
	.byte	0x5
	.uleb128 0x17
	.long	.LASF543
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.alloca.h.29.156e12058824cc23d961c4d3b13031f6,comdat
.Ldebug_macro48:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x1d
	.long	.LASF915
	.byte	0x5
	.uleb128 0x23
	.long	.LASF916
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.errnobase.h.3.496c97749cc421db8c7f3a88bb19be3e,comdat
.Ldebug_macro49:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x3
	.long	.LASF921
	.byte	0x5
	.uleb128 0x5
	.long	.LASF922
	.byte	0x5
	.uleb128 0x6
	.long	.LASF923
	.byte	0x5
	.uleb128 0x7
	.long	.LASF924
	.byte	0x5
	.uleb128 0x8
	.long	.LASF925
	.byte	0x5
	.uleb128 0x9
	.long	.LASF926
	.byte	0x5
	.uleb128 0xa
	.long	.LASF927
	.byte	0x5
	.uleb128 0xb
	.long	.LASF928
	.byte	0x5
	.uleb128 0xc
	.long	.LASF929
	.byte	0x5
	.uleb128 0xd
	.long	.LASF930
	.byte	0x5
	.uleb128 0xe
	.long	.LASF931
	.byte	0x5
	.uleb128 0xf
	.long	.LASF932
	.byte	0x5
	.uleb128 0x10
	.long	.LASF933
	.byte	0x5
	.uleb128 0x11
	.long	.LASF934
	.byte	0x5
	.uleb128 0x12
	.long	.LASF935
	.byte	0x5
	.uleb128 0x13
	.long	.LASF936
	.byte	0x5
	.uleb128 0x14
	.long	.LASF937
	.byte	0x5
	.uleb128 0x15
	.long	.LASF938
	.byte	0x5
	.uleb128 0x16
	.long	.LASF939
	.byte	0x5
	.uleb128 0x17
	.long	.LASF940
	.byte	0x5
	.uleb128 0x18
	.long	.LASF941
	.byte	0x5
	.uleb128 0x19
	.long	.LASF942
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF943
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF944
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF945
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF946
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF947
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF948
	.byte	0x5
	.uleb128 0x20
	.long	.LASF949
	.byte	0x5
	.uleb128 0x21
	.long	.LASF950
	.byte	0x5
	.uleb128 0x22
	.long	.LASF951
	.byte	0x5
	.uleb128 0x23
	.long	.LASF952
	.byte	0x5
	.uleb128 0x24
	.long	.LASF953
	.byte	0x5
	.uleb128 0x25
	.long	.LASF954
	.byte	0x5
	.uleb128 0x26
	.long	.LASF955
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.errno.h.7.abb72fb4c24e8d4d14afee66cc0be915,comdat
.Ldebug_macro50:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x7
	.long	.LASF956
	.byte	0x5
	.uleb128 0x8
	.long	.LASF957
	.byte	0x5
	.uleb128 0x9
	.long	.LASF958
	.byte	0x5
	.uleb128 0x12
	.long	.LASF959
	.byte	0x5
	.uleb128 0x14
	.long	.LASF960
	.byte	0x5
	.uleb128 0x15
	.long	.LASF961
	.byte	0x5
	.uleb128 0x16
	.long	.LASF962
	.byte	0x5
	.uleb128 0x17
	.long	.LASF963
	.byte	0x5
	.uleb128 0x18
	.long	.LASF964
	.byte	0x5
	.uleb128 0x19
	.long	.LASF965
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF966
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF967
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF968
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF969
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF970
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF971
	.byte	0x5
	.uleb128 0x20
	.long	.LASF972
	.byte	0x5
	.uleb128 0x21
	.long	.LASF973
	.byte	0x5
	.uleb128 0x22
	.long	.LASF974
	.byte	0x5
	.uleb128 0x23
	.long	.LASF975
	.byte	0x5
	.uleb128 0x24
	.long	.LASF976
	.byte	0x5
	.uleb128 0x25
	.long	.LASF977
	.byte	0x5
	.uleb128 0x26
	.long	.LASF978
	.byte	0x5
	.uleb128 0x28
	.long	.LASF979
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF980
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF981
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF982
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF983
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF984
	.byte	0x5
	.uleb128 0x2f
	.long	.LASF985
	.byte	0x5
	.uleb128 0x30
	.long	.LASF986
	.byte	0x5
	.uleb128 0x31
	.long	.LASF987
	.byte	0x5
	.uleb128 0x32
	.long	.LASF988
	.byte	0x5
	.uleb128 0x33
	.long	.LASF989
	.byte	0x5
	.uleb128 0x34
	.long	.LASF990
	.byte	0x5
	.uleb128 0x35
	.long	.LASF991
	.byte	0x5
	.uleb128 0x36
	.long	.LASF992
	.byte	0x5
	.uleb128 0x37
	.long	.LASF993
	.byte	0x5
	.uleb128 0x38
	.long	.LASF994
	.byte	0x5
	.uleb128 0x39
	.long	.LASF995
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF996
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF997
	.byte	0x5
	.uleb128 0x3c
	.long	.LASF998
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF999
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF1000
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF1001
	.byte	0x5
	.uleb128 0x40
	.long	.LASF1002
	.byte	0x5
	.uleb128 0x41
	.long	.LASF1003
	.byte	0x5
	.uleb128 0x42
	.long	.LASF1004
	.byte	0x5
	.uleb128 0x43
	.long	.LASF1005
	.byte	0x5
	.uleb128 0x44
	.long	.LASF1006
	.byte	0x5
	.uleb128 0x45
	.long	.LASF1007
	.byte	0x5
	.uleb128 0x46
	.long	.LASF1008
	.byte	0x5
	.uleb128 0x47
	.long	.LASF1009
	.byte	0x5
	.uleb128 0x48
	.long	.LASF1010
	.byte	0x5
	.uleb128 0x49
	.long	.LASF1011
	.byte	0x5
	.uleb128 0x4a
	.long	.LASF1012
	.byte	0x5
	.uleb128 0x4b
	.long	.LASF1013
	.byte	0x5
	.uleb128 0x4c
	.long	.LASF1014
	.byte	0x5
	.uleb128 0x4d
	.long	.LASF1015
	.byte	0x5
	.uleb128 0x4e
	.long	.LASF1016
	.byte	0x5
	.uleb128 0x4f
	.long	.LASF1017
	.byte	0x5
	.uleb128 0x50
	.long	.LASF1018
	.byte	0x5
	.uleb128 0x51
	.long	.LASF1019
	.byte	0x5
	.uleb128 0x52
	.long	.LASF1020
	.byte	0x5
	.uleb128 0x53
	.long	.LASF1021
	.byte	0x5
	.uleb128 0x54
	.long	.LASF1022
	.byte	0x5
	.uleb128 0x55
	.long	.LASF1023
	.byte	0x5
	.uleb128 0x56
	.long	.LASF1024
	.byte	0x5
	.uleb128 0x57
	.long	.LASF1025
	.byte	0x5
	.uleb128 0x58
	.long	.LASF1026
	.byte	0x5
	.uleb128 0x59
	.long	.LASF1027
	.byte	0x5
	.uleb128 0x5a
	.long	.LASF1028
	.byte	0x5
	.uleb128 0x5b
	.long	.LASF1029
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF1030
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF1031
	.byte	0x5
	.uleb128 0x5e
	.long	.LASF1032
	.byte	0x5
	.uleb128 0x5f
	.long	.LASF1033
	.byte	0x5
	.uleb128 0x60
	.long	.LASF1034
	.byte	0x5
	.uleb128 0x61
	.long	.LASF1035
	.byte	0x5
	.uleb128 0x62
	.long	.LASF1036
	.byte	0x5
	.uleb128 0x63
	.long	.LASF1037
	.byte	0x5
	.uleb128 0x64
	.long	.LASF1038
	.byte	0x5
	.uleb128 0x65
	.long	.LASF1039
	.byte	0x5
	.uleb128 0x66
	.long	.LASF1040
	.byte	0x5
	.uleb128 0x67
	.long	.LASF1041
	.byte	0x5
	.uleb128 0x68
	.long	.LASF1042
	.byte	0x5
	.uleb128 0x69
	.long	.LASF1043
	.byte	0x5
	.uleb128 0x6b
	.long	.LASF1044
	.byte	0x5
	.uleb128 0x6c
	.long	.LASF1045
	.byte	0x5
	.uleb128 0x6d
	.long	.LASF1046
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF1047
	.byte	0x5
	.uleb128 0x6f
	.long	.LASF1048
	.byte	0x5
	.uleb128 0x70
	.long	.LASF1049
	.byte	0x5
	.uleb128 0x71
	.long	.LASF1050
	.byte	0x5
	.uleb128 0x74
	.long	.LASF1051
	.byte	0x5
	.uleb128 0x75
	.long	.LASF1052
	.byte	0x5
	.uleb128 0x77
	.long	.LASF1053
	.byte	0x5
	.uleb128 0x79
	.long	.LASF1054
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.struct_stat.h.24.58804b9fde232cb81d58c44500307576,comdat
.Ldebug_macro51:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x18
	.long	.LASF1059
	.byte	0x5
	.uleb128 0x4d
	.long	.LASF1060
	.byte	0x5
	.uleb128 0x4e
	.long	.LASF1061
	.byte	0x5
	.uleb128 0x4f
	.long	.LASF1062
	.byte	0x5
	.uleb128 0xa0
	.long	.LASF1063
	.byte	0x5
	.uleb128 0xa1
	.long	.LASF1064
	.byte	0x5
	.uleb128 0xa3
	.long	.LASF1065
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stat.h.29.cab33b67e546bcdba0ebb7d142404f85,comdat
.Ldebug_macro52:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF1066
	.byte	0x5
	.uleb128 0x20
	.long	.LASF1067
	.byte	0x5
	.uleb128 0x21
	.long	.LASF1068
	.byte	0x5
	.uleb128 0x22
	.long	.LASF1069
	.byte	0x5
	.uleb128 0x23
	.long	.LASF1070
	.byte	0x5
	.uleb128 0x24
	.long	.LASF1071
	.byte	0x5
	.uleb128 0x25
	.long	.LASF1072
	.byte	0x5
	.uleb128 0x26
	.long	.LASF1073
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF1074
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF1075
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF1076
	.byte	0x5
	.uleb128 0x30
	.long	.LASF1077
	.byte	0x5
	.uleb128 0x31
	.long	.LASF1078
	.byte	0x5
	.uleb128 0x32
	.long	.LASF1079
	.byte	0x5
	.uleb128 0x33
	.long	.LASF1080
	.byte	0x5
	.uleb128 0x34
	.long	.LASF1081
	.byte	0x5
	.uleb128 0x35
	.long	.LASF1082
	.byte	0x5
	.uleb128 0x38
	.long	.LASF1083
	.byte	0x5
	.uleb128 0x39
	.long	.LASF1084
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stat.h.104.75fb58194ba4379fc75175a5977edd6b,comdat
.Ldebug_macro53:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x68
	.long	.LASF1085
	.byte	0x5
	.uleb128 0x69
	.long	.LASF1086
	.byte	0x5
	.uleb128 0x6a
	.long	.LASF1087
	.byte	0x5
	.uleb128 0x6b
	.long	.LASF1088
	.byte	0x5
	.uleb128 0x6c
	.long	.LASF1089
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF1090
	.byte	0x5
	.uleb128 0x71
	.long	.LASF1091
	.byte	0x5
	.uleb128 0x75
	.long	.LASF1092
	.byte	0x5
	.uleb128 0x7b
	.long	.LASF1093
	.byte	0x5
	.uleb128 0x7d
	.long	.LASF1094
	.byte	0x5
	.uleb128 0x7e
	.long	.LASF1095
	.byte	0x5
	.uleb128 0x7f
	.long	.LASF1096
	.byte	0x5
	.uleb128 0x80
	.long	.LASF1097
	.byte	0x5
	.uleb128 0x82
	.long	.LASF1098
	.byte	0x5
	.uleb128 0x85
	.long	.LASF1099
	.byte	0x5
	.uleb128 0x8e
	.long	.LASF1100
	.byte	0x5
	.uleb128 0x98
	.long	.LASF1101
	.byte	0x5
	.uleb128 0x99
	.long	.LASF1102
	.byte	0x5
	.uleb128 0x9a
	.long	.LASF1103
	.byte	0x5
	.uleb128 0xa0
	.long	.LASF1104
	.byte	0x5
	.uleb128 0xa1
	.long	.LASF1105
	.byte	0x5
	.uleb128 0xa5
	.long	.LASF1106
	.byte	0x5
	.uleb128 0xa8
	.long	.LASF1107
	.byte	0x5
	.uleb128 0xa9
	.long	.LASF1108
	.byte	0x5
	.uleb128 0xaa
	.long	.LASF1109
	.byte	0x5
	.uleb128 0xac
	.long	.LASF1110
	.byte	0x5
	.uleb128 0xaf
	.long	.LASF1111
	.byte	0x5
	.uleb128 0xb0
	.long	.LASF1112
	.byte	0x5
	.uleb128 0xb1
	.long	.LASF1113
	.byte	0x5
	.uleb128 0xb4
	.long	.LASF1114
	.byte	0x5
	.uleb128 0xb5
	.long	.LASF1115
	.byte	0x5
	.uleb128 0xb6
	.long	.LASF1116
	.byte	0x5
	.uleb128 0xb8
	.long	.LASF1117
	.byte	0x5
	.uleb128 0xba
	.long	.LASF1118
	.byte	0x5
	.uleb128 0xbb
	.long	.LASF1119
	.byte	0x5
	.uleb128 0xbc
	.long	.LASF1120
	.byte	0x5
	.uleb128 0xbe
	.long	.LASF1121
	.byte	0x5
	.uleb128 0xc3
	.long	.LASF1122
	.byte	0x5
	.uleb128 0xc4
	.long	.LASF1123
	.byte	0x5
	.uleb128 0xc5
	.long	.LASF1124
	.byte	0x5
	.uleb128 0xc7
	.long	.LASF1125
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.fcntl.h.24.62c7e777a8b210e920ccbb92cfe8b9d8,comdat
.Ldebug_macro54:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x18
	.long	.LASF1127
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF1128
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF1129
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF1130
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.fcntllinux.h.42.7b9e552d9406ec7dcbae181d11a9a9e1,comdat
.Ldebug_macro55:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF1131
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF1132
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF1133
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF1134
	.byte	0x5
	.uleb128 0x2f
	.long	.LASF1135
	.byte	0x5
	.uleb128 0x32
	.long	.LASF1136
	.byte	0x5
	.uleb128 0x35
	.long	.LASF1137
	.byte	0x5
	.uleb128 0x38
	.long	.LASF1138
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF1139
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF1140
	.byte	0x5
	.uleb128 0x41
	.long	.LASF1141
	.byte	0x5
	.uleb128 0x44
	.long	.LASF1142
	.byte	0x5
	.uleb128 0x46
	.long	.LASF1143
	.byte	0x5
	.uleb128 0x48
	.long	.LASF1144
	.byte	0x5
	.uleb128 0x4f
	.long	.LASF1145
	.byte	0x5
	.uleb128 0x52
	.long	.LASF1146
	.byte	0x5
	.uleb128 0x55
	.long	.LASF1147
	.byte	0x5
	.uleb128 0x58
	.long	.LASF1148
	.byte	0x5
	.uleb128 0x5b
	.long	.LASF1149
	.byte	0x5
	.uleb128 0x5e
	.long	.LASF1150
	.byte	0x5
	.uleb128 0x61
	.long	.LASF1151
	.byte	0x5
	.uleb128 0x64
	.long	.LASF1152
	.byte	0x5
	.uleb128 0x69
	.long	.LASF1153
	.byte	0x5
	.uleb128 0x6a
	.long	.LASF1154
	.byte	0x5
	.uleb128 0x6b
	.long	.LASF1155
	.byte	0x5
	.uleb128 0x8e
	.long	.LASF1156
	.byte	0x5
	.uleb128 0x8f
	.long	.LASF1157
	.byte	0x5
	.uleb128 0x90
	.long	.LASF1158
	.byte	0x5
	.uleb128 0x9e
	.long	.LASF1159
	.byte	0x5
	.uleb128 0xa2
	.long	.LASF1160
	.byte	0x5
	.uleb128 0xa7
	.long	.LASF1161
	.byte	0x5
	.uleb128 0xa8
	.long	.LASF1162
	.byte	0x5
	.uleb128 0xa9
	.long	.LASF1163
	.byte	0x5
	.uleb128 0xaa
	.long	.LASF1164
	.byte	0x5
	.uleb128 0xab
	.long	.LASF1165
	.byte	0x5
	.uleb128 0xae
	.long	.LASF1166
	.byte	0x5
	.uleb128 0xaf
	.long	.LASF1167
	.byte	0x5
	.uleb128 0xb3
	.long	.LASF1168
	.byte	0x5
	.uleb128 0xb4
	.long	.LASF1169
	.byte	0x5
	.uleb128 0xb8
	.long	.LASF1170
	.byte	0x5
	.uleb128 0xb9
	.long	.LASF1171
	.byte	0x5
	.uleb128 0xbc
	.long	.LASF1172
	.byte	0x5
	.uleb128 0xbd
	.long	.LASF1173
	.byte	0x5
	.uleb128 0xd6
	.long	.LASF1174
	.byte	0x5
	.uleb128 0xdb
	.long	.LASF1175
	.byte	0x5
	.uleb128 0xdf
	.long	.LASF1176
	.byte	0x5
	.uleb128 0xe0
	.long	.LASF1177
	.byte	0x5
	.uleb128 0xe1
	.long	.LASF1178
	.byte	0x5
	.uleb128 0xe7
	.long	.LASF1179
	.byte	0x5
	.uleb128 0xe8
	.long	.LASF1180
	.byte	0x5
	.uleb128 0xed
	.long	.LASF1181
	.byte	0x5
	.uleb128 0xee
	.long	.LASF1182
	.byte	0x5
	.uleb128 0xef
	.long	.LASF1183
	.byte	0x5
	.uleb128 0xf1
	.long	.LASF1184
	.byte	0x5
	.uleb128 0x131
	.long	.LASF1185
	.byte	0x5
	.uleb128 0x132
	.long	.LASF1186
	.byte	0x5
	.uleb128 0x133
	.long	.LASF1187
	.byte	0x5
	.uleb128 0x134
	.long	.LASF1188
	.byte	0x5
	.uleb128 0x135
	.long	.LASF1189
	.byte	0x5
	.uleb128 0x139
	.long	.LASF1190
	.byte	0x5
	.uleb128 0x13a
	.long	.LASF1191
	.byte	0x5
	.uleb128 0x13e
	.long	.LASF1192
	.byte	0x5
	.uleb128 0x13f
	.long	.LASF1193
	.byte	0x5
	.uleb128 0x140
	.long	.LASF1194
	.byte	0x5
	.uleb128 0x141
	.long	.LASF1195
	.byte	0x5
	.uleb128 0x142
	.long	.LASF1196
	.byte	0x5
	.uleb128 0x143
	.long	.LASF1197
	.byte	0x5
	.uleb128 0x174
	.long	.LASF1198
	.byte	0x5
	.uleb128 0x177
	.long	.LASF1199
	.byte	0x5
	.uleb128 0x178
	.long	.LASF1200
	.byte	0x5
	.uleb128 0x17a
	.long	.LASF1201
	.byte	0x5
	.uleb128 0x185
	.long	.LASF1202
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.fcntl.h.80.34001020898245d8535bf89fc94e0aa0,comdat
.Ldebug_macro56:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x50
	.long	.LASF1085
	.byte	0x5
	.uleb128 0x51
	.long	.LASF1086
	.byte	0x5
	.uleb128 0x52
	.long	.LASF1087
	.byte	0x5
	.uleb128 0x53
	.long	.LASF1088
	.byte	0x5
	.uleb128 0x54
	.long	.LASF1089
	.byte	0x5
	.uleb128 0x56
	.long	.LASF1090
	.byte	0x5
	.uleb128 0x59
	.long	.LASF1091
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF1092
	.byte	0x5
	.uleb128 0x61
	.long	.LASF1104
	.byte	0x5
	.uleb128 0x62
	.long	.LASF1105
	.byte	0x5
	.uleb128 0x66
	.long	.LASF1106
	.byte	0x5
	.uleb128 0x69
	.long	.LASF1107
	.byte	0x5
	.uleb128 0x6a
	.long	.LASF1108
	.byte	0x5
	.uleb128 0x6b
	.long	.LASF1109
	.byte	0x5
	.uleb128 0x6d
	.long	.LASF1110
	.byte	0x5
	.uleb128 0x6f
	.long	.LASF1114
	.byte	0x5
	.uleb128 0x70
	.long	.LASF1115
	.byte	0x5
	.uleb128 0x71
	.long	.LASF1116
	.byte	0x5
	.uleb128 0x73
	.long	.LASF1117
	.byte	0x5
	.uleb128 0x75
	.long	.LASF1118
	.byte	0x5
	.uleb128 0x76
	.long	.LASF1119
	.byte	0x5
	.uleb128 0x77
	.long	.LASF1120
	.byte	0x5
	.uleb128 0x79
	.long	.LASF1121
	.byte	0x5
	.uleb128 0x80
	.long	.LASF1204
	.byte	0x5
	.uleb128 0x81
	.long	.LASF1205
	.byte	0x5
	.uleb128 0x82
	.long	.LASF1206
	.byte	0x5
	.uleb128 0x83
	.long	.LASF1207
	.byte	0x5
	.uleb128 0x89
	.long	.LASF651
	.byte	0x5
	.uleb128 0x8a
	.long	.LASF652
	.byte	0x5
	.uleb128 0x8b
	.long	.LASF653
	.byte	0x5
	.uleb128 0xfa
	.long	.LASF1208
	.byte	0x5
	.uleb128 0xfb
	.long	.LASF1209
	.byte	0x5
	.uleb128 0xfc
	.long	.LASF1210
	.byte	0x5
	.uleb128 0xfd
	.long	.LASF1211
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.unistd.h.23.e34f3a5c100123d9385c8b91a86a6783,comdat
.Ldebug_macro57:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x17
	.long	.LASF1212
	.byte	0x5
	.uleb128 0x22
	.long	.LASF1213
	.byte	0x5
	.uleb128 0x35
	.long	.LASF1214
	.byte	0x5
	.uleb128 0x43
	.long	.LASF1215
	.byte	0x5
	.uleb128 0x46
	.long	.LASF1216
	.byte	0x5
	.uleb128 0x4a
	.long	.LASF1217
	.byte	0x5
	.uleb128 0x4e
	.long	.LASF1218
	.byte	0x5
	.uleb128 0x52
	.long	.LASF1219
	.byte	0x5
	.uleb128 0x56
	.long	.LASF1220
	.byte	0x5
	.uleb128 0x5a
	.long	.LASF1221
	.byte	0x5
	.uleb128 0x64
	.long	.LASF1222
	.byte	0x5
	.uleb128 0x67
	.long	.LASF1223
	.byte	0x5
	.uleb128 0x68
	.long	.LASF1224
	.byte	0x5
	.uleb128 0x69
	.long	.LASF1225
	.byte	0x5
	.uleb128 0x6c
	.long	.LASF1226
	.byte	0x5
	.uleb128 0x70
	.long	.LASF1227
	.byte	0x5
	.uleb128 0x73
	.long	.LASF1228
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.posix_opt.h.20.21a42956ee7763f6aa309b86c7756272,comdat
.Ldebug_macro58:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.long	.LASF1229
	.byte	0x5
	.uleb128 0x17
	.long	.LASF1230
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF1231
	.byte	0x5
	.uleb128 0x20
	.long	.LASF1232
	.byte	0x5
	.uleb128 0x23
	.long	.LASF1233
	.byte	0x5
	.uleb128 0x26
	.long	.LASF1234
	.byte	0x5
	.uleb128 0x29
	.long	.LASF1235
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF1236
	.byte	0x5
	.uleb128 0x2f
	.long	.LASF1237
	.byte	0x5
	.uleb128 0x32
	.long	.LASF1238
	.byte	0x5
	.uleb128 0x35
	.long	.LASF1239
	.byte	0x5
	.uleb128 0x39
	.long	.LASF1240
	.byte	0x5
	.uleb128 0x3c
	.long	.LASF1241
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF1242
	.byte	0x5
	.uleb128 0x42
	.long	.LASF1243
	.byte	0x5
	.uleb128 0x45
	.long	.LASF1244
	.byte	0x5
	.uleb128 0x48
	.long	.LASF1245
	.byte	0x5
	.uleb128 0x4b
	.long	.LASF1246
	.byte	0x5
	.uleb128 0x4c
	.long	.LASF1247
	.byte	0x5
	.uleb128 0x4f
	.long	.LASF1248
	.byte	0x5
	.uleb128 0x52
	.long	.LASF1249
	.byte	0x5
	.uleb128 0x55
	.long	.LASF1250
	.byte	0x5
	.uleb128 0x58
	.long	.LASF1251
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF1252
	.byte	0x5
	.uleb128 0x60
	.long	.LASF1253
	.byte	0x5
	.uleb128 0x63
	.long	.LASF1254
	.byte	0x5
	.uleb128 0x67
	.long	.LASF1255
	.byte	0x5
	.uleb128 0x6a
	.long	.LASF1256
	.byte	0x5
	.uleb128 0x6d
	.long	.LASF1257
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF1258
	.byte	0x5
	.uleb128 0x70
	.long	.LASF1259
	.byte	0x5
	.uleb128 0x72
	.long	.LASF1260
	.byte	0x5
	.uleb128 0x75
	.long	.LASF1261
	.byte	0x5
	.uleb128 0x78
	.long	.LASF1262
	.byte	0x5
	.uleb128 0x79
	.long	.LASF1263
	.byte	0x5
	.uleb128 0x7a
	.long	.LASF1264
	.byte	0x5
	.uleb128 0x7d
	.long	.LASF1265
	.byte	0x5
	.uleb128 0x80
	.long	.LASF1266
	.byte	0x5
	.uleb128 0x83
	.long	.LASF1267
	.byte	0x5
	.uleb128 0x86
	.long	.LASF1268
	.byte	0x5
	.uleb128 0x89
	.long	.LASF1269
	.byte	0x5
	.uleb128 0x8c
	.long	.LASF1270
	.byte	0x5
	.uleb128 0x8f
	.long	.LASF1271
	.byte	0x5
	.uleb128 0x92
	.long	.LASF1272
	.byte	0x5
	.uleb128 0x95
	.long	.LASF1273
	.byte	0x5
	.uleb128 0x98
	.long	.LASF1274
	.byte	0x5
	.uleb128 0x9b
	.long	.LASF1275
	.byte	0x5
	.uleb128 0x9e
	.long	.LASF1276
	.byte	0x5
	.uleb128 0xa1
	.long	.LASF1277
	.byte	0x5
	.uleb128 0xa4
	.long	.LASF1278
	.byte	0x5
	.uleb128 0xa7
	.long	.LASF1279
	.byte	0x5
	.uleb128 0xaa
	.long	.LASF1280
	.byte	0x5
	.uleb128 0xad
	.long	.LASF1281
	.byte	0x5
	.uleb128 0xb0
	.long	.LASF1282
	.byte	0x5
	.uleb128 0xb3
	.long	.LASF1283
	.byte	0x5
	.uleb128 0xb6
	.long	.LASF1284
	.byte	0x5
	.uleb128 0xb7
	.long	.LASF1285
	.byte	0x5
	.uleb128 0xba
	.long	.LASF1286
	.byte	0x5
	.uleb128 0xbb
	.long	.LASF1287
	.byte	0x5
	.uleb128 0xbc
	.long	.LASF1288
	.byte	0x5
	.uleb128 0xbd
	.long	.LASF1289
	.byte	0x5
	.uleb128 0xc0
	.long	.LASF1290
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.environments.h.56.c5802092ccc191baeb41f8d355bb878f,comdat
.Ldebug_macro59:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x38
	.long	.LASF1291
	.byte	0x5
	.uleb128 0x39
	.long	.LASF1292
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF1293
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF1294
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF1295
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF1296
	.byte	0x5
	.uleb128 0x5f
	.long	.LASF1297
	.byte	0x5
	.uleb128 0x60
	.long	.LASF1298
	.byte	0x5
	.uleb128 0x65
	.long	.LASF1299
	.byte	0x5
	.uleb128 0x66
	.long	.LASF1300
	.byte	0x5
	.uleb128 0x68
	.long	.LASF1301
	.byte	0x5
	.uleb128 0x69
	.long	.LASF1302
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.unistd.h.210.b40c6c15db1d0b653f8dce03f258da9c,comdat
.Ldebug_macro60:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xd2
	.long	.LASF1303
	.byte	0x5
	.uleb128 0xd3
	.long	.LASF1304
	.byte	0x5
	.uleb128 0xd4
	.long	.LASF1305
	.byte	0x5
	.uleb128 0xe0
	.long	.LASF543
	.byte	0x5
	.uleb128 0xe1
	.long	.LASF544
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stddef.h.231.8136eebbab3406dbf57a7ec475dd5d83,comdat
.Ldebug_macro61:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0xe7
	.long	.LASF562
	.byte	0x6
	.uleb128 0x186
	.long	.LASF563
	.byte	0x5
	.uleb128 0x18b
	.long	.LASF564
	.byte	0x6
	.uleb128 0x191
	.long	.LASF565
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.unistd.h.256.25a1178bedb86e5af9165e2b967aab70,comdat
.Ldebug_macro62:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x100
	.long	.LASF1306
	.byte	0x5
	.uleb128 0x113
	.long	.LASF1307
	.byte	0x5
	.uleb128 0x119
	.long	.LASF1204
	.byte	0x5
	.uleb128 0x11a
	.long	.LASF1205
	.byte	0x5
	.uleb128 0x11b
	.long	.LASF1206
	.byte	0x5
	.uleb128 0x11c
	.long	.LASF1207
	.byte	0x5
	.uleb128 0x147
	.long	.LASF1308
	.byte	0x5
	.uleb128 0x148
	.long	.LASF1309
	.byte	0x5
	.uleb128 0x149
	.long	.LASF1310
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.confname.h.27.257966e7e49af2ab4cb41132b3606cbf,comdat
.Ldebug_macro63:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF1311
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF1312
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF1313
	.byte	0x5
	.uleb128 0x21
	.long	.LASF1314
	.byte	0x5
	.uleb128 0x23
	.long	.LASF1315
	.byte	0x5
	.uleb128 0x25
	.long	.LASF1316
	.byte	0x5
	.uleb128 0x27
	.long	.LASF1317
	.byte	0x5
	.uleb128 0x29
	.long	.LASF1318
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF1319
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF1320
	.byte	0x5
	.uleb128 0x2f
	.long	.LASF1321
	.byte	0x5
	.uleb128 0x31
	.long	.LASF1322
	.byte	0x5
	.uleb128 0x33
	.long	.LASF1323
	.byte	0x5
	.uleb128 0x35
	.long	.LASF1324
	.byte	0x5
	.uleb128 0x37
	.long	.LASF1325
	.byte	0x5
	.uleb128 0x39
	.long	.LASF1326
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF1327
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF1328
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF1329
	.byte	0x5
	.uleb128 0x41
	.long	.LASF1330
	.byte	0x5
	.uleb128 0x43
	.long	.LASF1331
	.byte	0x5
	.uleb128 0x4a
	.long	.LASF1332
	.byte	0x5
	.uleb128 0x4c
	.long	.LASF1333
	.byte	0x5
	.uleb128 0x4e
	.long	.LASF1334
	.byte	0x5
	.uleb128 0x50
	.long	.LASF1335
	.byte	0x5
	.uleb128 0x52
	.long	.LASF1336
	.byte	0x5
	.uleb128 0x54
	.long	.LASF1337
	.byte	0x5
	.uleb128 0x56
	.long	.LASF1338
	.byte	0x5
	.uleb128 0x58
	.long	.LASF1339
	.byte	0x5
	.uleb128 0x5a
	.long	.LASF1340
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF1341
	.byte	0x5
	.uleb128 0x5e
	.long	.LASF1342
	.byte	0x5
	.uleb128 0x60
	.long	.LASF1343
	.byte	0x5
	.uleb128 0x62
	.long	.LASF1344
	.byte	0x5
	.uleb128 0x64
	.long	.LASF1345
	.byte	0x5
	.uleb128 0x66
	.long	.LASF1346
	.byte	0x5
	.uleb128 0x68
	.long	.LASF1347
	.byte	0x5
	.uleb128 0x6a
	.long	.LASF1348
	.byte	0x5
	.uleb128 0x6c
	.long	.LASF1349
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF1350
	.byte	0x5
	.uleb128 0x70
	.long	.LASF1351
	.byte	0x5
	.uleb128 0x72
	.long	.LASF1352
	.byte	0x5
	.uleb128 0x74
	.long	.LASF1353
	.byte	0x5
	.uleb128 0x76
	.long	.LASF1354
	.byte	0x5
	.uleb128 0x78
	.long	.LASF1355
	.byte	0x5
	.uleb128 0x7a
	.long	.LASF1356
	.byte	0x5
	.uleb128 0x7c
	.long	.LASF1357
	.byte	0x5
	.uleb128 0x7e
	.long	.LASF1358
	.byte	0x5
	.uleb128 0x80
	.long	.LASF1359
	.byte	0x5
	.uleb128 0x82
	.long	.LASF1360
	.byte	0x5
	.uleb128 0x84
	.long	.LASF1361
	.byte	0x5
	.uleb128 0x86
	.long	.LASF1362
	.byte	0x5
	.uleb128 0x87
	.long	.LASF1363
	.byte	0x5
	.uleb128 0x89
	.long	.LASF1364
	.byte	0x5
	.uleb128 0x8b
	.long	.LASF1365
	.byte	0x5
	.uleb128 0x8d
	.long	.LASF1366
	.byte	0x5
	.uleb128 0x8f
	.long	.LASF1367
	.byte	0x5
	.uleb128 0x91
	.long	.LASF1368
	.byte	0x5
	.uleb128 0x96
	.long	.LASF1369
	.byte	0x5
	.uleb128 0x98
	.long	.LASF1370
	.byte	0x5
	.uleb128 0x9a
	.long	.LASF1371
	.byte	0x5
	.uleb128 0x9c
	.long	.LASF1372
	.byte	0x5
	.uleb128 0x9e
	.long	.LASF1373
	.byte	0x5
	.uleb128 0xa0
	.long	.LASF1374
	.byte	0x5
	.uleb128 0xa2
	.long	.LASF1375
	.byte	0x5
	.uleb128 0xa4
	.long	.LASF1376
	.byte	0x5
	.uleb128 0xa6
	.long	.LASF1377
	.byte	0x5
	.uleb128 0xa8
	.long	.LASF1378
	.byte	0x5
	.uleb128 0xab
	.long	.LASF1379
	.byte	0x5
	.uleb128 0xad
	.long	.LASF1380
	.byte	0x5
	.uleb128 0xaf
	.long	.LASF1381
	.byte	0x5
	.uleb128 0xb1
	.long	.LASF1382
	.byte	0x5
	.uleb128 0xb3
	.long	.LASF1383
	.byte	0x5
	.uleb128 0xb5
	.long	.LASF1384
	.byte	0x5
	.uleb128 0xb7
	.long	.LASF1385
	.byte	0x5
	.uleb128 0xba
	.long	.LASF1386
	.byte	0x5
	.uleb128 0xbc
	.long	.LASF1387
	.byte	0x5
	.uleb128 0xbe
	.long	.LASF1388
	.byte	0x5
	.uleb128 0xc0
	.long	.LASF1389
	.byte	0x5
	.uleb128 0xc2
	.long	.LASF1390
	.byte	0x5
	.uleb128 0xc4
	.long	.LASF1391
	.byte	0x5
	.uleb128 0xc6
	.long	.LASF1392
	.byte	0x5
	.uleb128 0xc8
	.long	.LASF1393
	.byte	0x5
	.uleb128 0xca
	.long	.LASF1394
	.byte	0x5
	.uleb128 0xcc
	.long	.LASF1395
	.byte	0x5
	.uleb128 0xce
	.long	.LASF1396
	.byte	0x5
	.uleb128 0xd0
	.long	.LASF1397
	.byte	0x5
	.uleb128 0xd2
	.long	.LASF1398
	.byte	0x5
	.uleb128 0xd4
	.long	.LASF1399
	.byte	0x5
	.uleb128 0xd6
	.long	.LASF1400
	.byte	0x5
	.uleb128 0xda
	.long	.LASF1401
	.byte	0x5
	.uleb128 0xdc
	.long	.LASF1402
	.byte	0x5
	.uleb128 0xde
	.long	.LASF1403
	.byte	0x5
	.uleb128 0xe0
	.long	.LASF1404
	.byte	0x5
	.uleb128 0xe2
	.long	.LASF1405
	.byte	0x5
	.uleb128 0xe4
	.long	.LASF1406
	.byte	0x5
	.uleb128 0xe6
	.long	.LASF1407
	.byte	0x5
	.uleb128 0xe8
	.long	.LASF1408
	.byte	0x5
	.uleb128 0xea
	.long	.LASF1409
	.byte	0x5
	.uleb128 0xec
	.long	.LASF1410
	.byte	0x5
	.uleb128 0xee
	.long	.LASF1411
	.byte	0x5
	.uleb128 0xf0
	.long	.LASF1412
	.byte	0x5
	.uleb128 0xf2
	.long	.LASF1413
	.byte	0x5
	.uleb128 0xf4
	.long	.LASF1414
	.byte	0x5
	.uleb128 0xf6
	.long	.LASF1415
	.byte	0x5
	.uleb128 0xf8
	.long	.LASF1416
	.byte	0x5
	.uleb128 0xfb
	.long	.LASF1417
	.byte	0x5
	.uleb128 0xfd
	.long	.LASF1418
	.byte	0x5
	.uleb128 0xff
	.long	.LASF1419
	.byte	0x5
	.uleb128 0x101
	.long	.LASF1420
	.byte	0x5
	.uleb128 0x103
	.long	.LASF1421
	.byte	0x5
	.uleb128 0x105
	.long	.LASF1422
	.byte	0x5
	.uleb128 0x108
	.long	.LASF1423
	.byte	0x5
	.uleb128 0x10a
	.long	.LASF1424
	.byte	0x5
	.uleb128 0x10c
	.long	.LASF1425
	.byte	0x5
	.uleb128 0x10e
	.long	.LASF1426
	.byte	0x5
	.uleb128 0x110
	.long	.LASF1427
	.byte	0x5
	.uleb128 0x112
	.long	.LASF1428
	.byte	0x5
	.uleb128 0x115
	.long	.LASF1429
	.byte	0x5
	.uleb128 0x117
	.long	.LASF1430
	.byte	0x5
	.uleb128 0x119
	.long	.LASF1431
	.byte	0x5
	.uleb128 0x11c
	.long	.LASF1432
	.byte	0x5
	.uleb128 0x11e
	.long	.LASF1433
	.byte	0x5
	.uleb128 0x120
	.long	.LASF1434
	.byte	0x5
	.uleb128 0x123
	.long	.LASF1435
	.byte	0x5
	.uleb128 0x125
	.long	.LASF1436
	.byte	0x5
	.uleb128 0x127
	.long	.LASF1437
	.byte	0x5
	.uleb128 0x129
	.long	.LASF1438
	.byte	0x5
	.uleb128 0x12b
	.long	.LASF1439
	.byte	0x5
	.uleb128 0x12d
	.long	.LASF1440
	.byte	0x5
	.uleb128 0x12f
	.long	.LASF1441
	.byte	0x5
	.uleb128 0x131
	.long	.LASF1442
	.byte	0x5
	.uleb128 0x133
	.long	.LASF1443
	.byte	0x5
	.uleb128 0x135
	.long	.LASF1444
	.byte	0x5
	.uleb128 0x137
	.long	.LASF1445
	.byte	0x5
	.uleb128 0x139
	.long	.LASF1446
	.byte	0x5
	.uleb128 0x13b
	.long	.LASF1447
	.byte	0x5
	.uleb128 0x13d
	.long	.LASF1448
	.byte	0x5
	.uleb128 0x13f
	.long	.LASF1449
	.byte	0x5
	.uleb128 0x141
	.long	.LASF1450
	.byte	0x5
	.uleb128 0x143
	.long	.LASF1451
	.byte	0x5
	.uleb128 0x145
	.long	.LASF1452
	.byte	0x5
	.uleb128 0x148
	.long	.LASF1453
	.byte	0x5
	.uleb128 0x14a
	.long	.LASF1454
	.byte	0x5
	.uleb128 0x14c
	.long	.LASF1455
	.byte	0x5
	.uleb128 0x14e
	.long	.LASF1456
	.byte	0x5
	.uleb128 0x150
	.long	.LASF1457
	.byte	0x5
	.uleb128 0x152
	.long	.LASF1458
	.byte	0x5
	.uleb128 0x155
	.long	.LASF1459
	.byte	0x5
	.uleb128 0x157
	.long	.LASF1460
	.byte	0x5
	.uleb128 0x159
	.long	.LASF1461
	.byte	0x5
	.uleb128 0x15b
	.long	.LASF1462
	.byte	0x5
	.uleb128 0x15e
	.long	.LASF1463
	.byte	0x5
	.uleb128 0x160
	.long	.LASF1464
	.byte	0x5
	.uleb128 0x162
	.long	.LASF1465
	.byte	0x5
	.uleb128 0x165
	.long	.LASF1466
	.byte	0x5
	.uleb128 0x167
	.long	.LASF1467
	.byte	0x5
	.uleb128 0x169
	.long	.LASF1468
	.byte	0x5
	.uleb128 0x16b
	.long	.LASF1469
	.byte	0x5
	.uleb128 0x16d
	.long	.LASF1470
	.byte	0x5
	.uleb128 0x16f
	.long	.LASF1471
	.byte	0x5
	.uleb128 0x171
	.long	.LASF1472
	.byte	0x5
	.uleb128 0x173
	.long	.LASF1473
	.byte	0x5
	.uleb128 0x175
	.long	.LASF1474
	.byte	0x5
	.uleb128 0x177
	.long	.LASF1475
	.byte	0x5
	.uleb128 0x179
	.long	.LASF1476
	.byte	0x5
	.uleb128 0x17b
	.long	.LASF1477
	.byte	0x5
	.uleb128 0x17d
	.long	.LASF1478
	.byte	0x5
	.uleb128 0x17f
	.long	.LASF1479
	.byte	0x5
	.uleb128 0x181
	.long	.LASF1480
	.byte	0x5
	.uleb128 0x183
	.long	.LASF1481
	.byte	0x5
	.uleb128 0x185
	.long	.LASF1482
	.byte	0x5
	.uleb128 0x187
	.long	.LASF1483
	.byte	0x5
	.uleb128 0x189
	.long	.LASF1484
	.byte	0x5
	.uleb128 0x18b
	.long	.LASF1485
	.byte	0x5
	.uleb128 0x18d
	.long	.LASF1486
	.byte	0x5
	.uleb128 0x18f
	.long	.LASF1487
	.byte	0x5
	.uleb128 0x191
	.long	.LASF1488
	.byte	0x5
	.uleb128 0x193
	.long	.LASF1489
	.byte	0x5
	.uleb128 0x195
	.long	.LASF1490
	.byte	0x5
	.uleb128 0x197
	.long	.LASF1491
	.byte	0x5
	.uleb128 0x199
	.long	.LASF1492
	.byte	0x5
	.uleb128 0x19b
	.long	.LASF1493
	.byte	0x5
	.uleb128 0x19d
	.long	.LASF1494
	.byte	0x5
	.uleb128 0x19f
	.long	.LASF1495
	.byte	0x5
	.uleb128 0x1a1
	.long	.LASF1496
	.byte	0x5
	.uleb128 0x1a3
	.long	.LASF1497
	.byte	0x5
	.uleb128 0x1a5
	.long	.LASF1498
	.byte	0x5
	.uleb128 0x1a7
	.long	.LASF1499
	.byte	0x5
	.uleb128 0x1a9
	.long	.LASF1500
	.byte	0x5
	.uleb128 0x1ab
	.long	.LASF1501
	.byte	0x5
	.uleb128 0x1ad
	.long	.LASF1502
	.byte	0x5
	.uleb128 0x1af
	.long	.LASF1503
	.byte	0x5
	.uleb128 0x1b1
	.long	.LASF1504
	.byte	0x5
	.uleb128 0x1b3
	.long	.LASF1505
	.byte	0x5
	.uleb128 0x1b5
	.long	.LASF1506
	.byte	0x5
	.uleb128 0x1b7
	.long	.LASF1507
	.byte	0x5
	.uleb128 0x1b9
	.long	.LASF1508
	.byte	0x5
	.uleb128 0x1bb
	.long	.LASF1509
	.byte	0x5
	.uleb128 0x1be
	.long	.LASF1510
	.byte	0x5
	.uleb128 0x1c0
	.long	.LASF1511
	.byte	0x5
	.uleb128 0x1c2
	.long	.LASF1512
	.byte	0x5
	.uleb128 0x1c4
	.long	.LASF1513
	.byte	0x5
	.uleb128 0x1c7
	.long	.LASF1514
	.byte	0x5
	.uleb128 0x1c9
	.long	.LASF1515
	.byte	0x5
	.uleb128 0x1cb
	.long	.LASF1516
	.byte	0x5
	.uleb128 0x1cd
	.long	.LASF1517
	.byte	0x5
	.uleb128 0x1cf
	.long	.LASF1518
	.byte	0x5
	.uleb128 0x1d2
	.long	.LASF1519
	.byte	0x5
	.uleb128 0x1d4
	.long	.LASF1520
	.byte	0x5
	.uleb128 0x1d6
	.long	.LASF1521
	.byte	0x5
	.uleb128 0x1d8
	.long	.LASF1522
	.byte	0x5
	.uleb128 0x1da
	.long	.LASF1523
	.byte	0x5
	.uleb128 0x1dc
	.long	.LASF1524
	.byte	0x5
	.uleb128 0x1de
	.long	.LASF1525
	.byte	0x5
	.uleb128 0x1e0
	.long	.LASF1526
	.byte	0x5
	.uleb128 0x1e2
	.long	.LASF1527
	.byte	0x5
	.uleb128 0x1e4
	.long	.LASF1528
	.byte	0x5
	.uleb128 0x1e6
	.long	.LASF1529
	.byte	0x5
	.uleb128 0x1e8
	.long	.LASF1530
	.byte	0x5
	.uleb128 0x1ea
	.long	.LASF1531
	.byte	0x5
	.uleb128 0x1ec
	.long	.LASF1532
	.byte	0x5
	.uleb128 0x1ee
	.long	.LASF1533
	.byte	0x5
	.uleb128 0x1f2
	.long	.LASF1534
	.byte	0x5
	.uleb128 0x1f4
	.long	.LASF1535
	.byte	0x5
	.uleb128 0x1f7
	.long	.LASF1536
	.byte	0x5
	.uleb128 0x1f9
	.long	.LASF1537
	.byte	0x5
	.uleb128 0x1fb
	.long	.LASF1538
	.byte	0x5
	.uleb128 0x1fd
	.long	.LASF1539
	.byte	0x5
	.uleb128 0x200
	.long	.LASF1540
	.byte	0x5
	.uleb128 0x203
	.long	.LASF1541
	.byte	0x5
	.uleb128 0x205
	.long	.LASF1542
	.byte	0x5
	.uleb128 0x207
	.long	.LASF1543
	.byte	0x5
	.uleb128 0x209
	.long	.LASF1544
	.byte	0x5
	.uleb128 0x20c
	.long	.LASF1545
	.byte	0x5
	.uleb128 0x20f
	.long	.LASF1546
	.byte	0x5
	.uleb128 0x211
	.long	.LASF1547
	.byte	0x5
	.uleb128 0x214
	.long	.LASF1548
	.byte	0x5
	.uleb128 0x217
	.long	.LASF1549
	.byte	0x5
	.uleb128 0x21e
	.long	.LASF1550
	.byte	0x5
	.uleb128 0x221
	.long	.LASF1551
	.byte	0x5
	.uleb128 0x222
	.long	.LASF1552
	.byte	0x5
	.uleb128 0x225
	.long	.LASF1553
	.byte	0x5
	.uleb128 0x227
	.long	.LASF1554
	.byte	0x5
	.uleb128 0x22a
	.long	.LASF1555
	.byte	0x5
	.uleb128 0x22b
	.long	.LASF1556
	.byte	0x5
	.uleb128 0x22e
	.long	.LASF1557
	.byte	0x5
	.uleb128 0x22f
	.long	.LASF1558
	.byte	0x5
	.uleb128 0x232
	.long	.LASF1559
	.byte	0x5
	.uleb128 0x234
	.long	.LASF1560
	.byte	0x5
	.uleb128 0x236
	.long	.LASF1561
	.byte	0x5
	.uleb128 0x238
	.long	.LASF1562
	.byte	0x5
	.uleb128 0x23a
	.long	.LASF1563
	.byte	0x5
	.uleb128 0x23c
	.long	.LASF1564
	.byte	0x5
	.uleb128 0x23e
	.long	.LASF1565
	.byte	0x5
	.uleb128 0x240
	.long	.LASF1566
	.byte	0x5
	.uleb128 0x243
	.long	.LASF1567
	.byte	0x5
	.uleb128 0x245
	.long	.LASF1568
	.byte	0x5
	.uleb128 0x247
	.long	.LASF1569
	.byte	0x5
	.uleb128 0x249
	.long	.LASF1570
	.byte	0x5
	.uleb128 0x24b
	.long	.LASF1571
	.byte	0x5
	.uleb128 0x24d
	.long	.LASF1572
	.byte	0x5
	.uleb128 0x24f
	.long	.LASF1573
	.byte	0x5
	.uleb128 0x251
	.long	.LASF1574
	.byte	0x5
	.uleb128 0x253
	.long	.LASF1575
	.byte	0x5
	.uleb128 0x255
	.long	.LASF1576
	.byte	0x5
	.uleb128 0x257
	.long	.LASF1577
	.byte	0x5
	.uleb128 0x259
	.long	.LASF1578
	.byte	0x5
	.uleb128 0x25b
	.long	.LASF1579
	.byte	0x5
	.uleb128 0x25d
	.long	.LASF1580
	.byte	0x5
	.uleb128 0x25f
	.long	.LASF1581
	.byte	0x5
	.uleb128 0x261
	.long	.LASF1582
	.byte	0x5
	.uleb128 0x264
	.long	.LASF1583
	.byte	0x5
	.uleb128 0x266
	.long	.LASF1584
	.byte	0x5
	.uleb128 0x268
	.long	.LASF1585
	.byte	0x5
	.uleb128 0x26a
	.long	.LASF1586
	.byte	0x5
	.uleb128 0x26c
	.long	.LASF1587
	.byte	0x5
	.uleb128 0x26e
	.long	.LASF1588
	.byte	0x5
	.uleb128 0x270
	.long	.LASF1589
	.byte	0x5
	.uleb128 0x272
	.long	.LASF1590
	.byte	0x5
	.uleb128 0x274
	.long	.LASF1591
	.byte	0x5
	.uleb128 0x276
	.long	.LASF1592
	.byte	0x5
	.uleb128 0x278
	.long	.LASF1593
	.byte	0x5
	.uleb128 0x27a
	.long	.LASF1594
	.byte	0x5
	.uleb128 0x27c
	.long	.LASF1595
	.byte	0x5
	.uleb128 0x27e
	.long	.LASF1596
	.byte	0x5
	.uleb128 0x280
	.long	.LASF1597
	.byte	0x5
	.uleb128 0x282
	.long	.LASF1598
	.byte	0x5
	.uleb128 0x285
	.long	.LASF1599
	.byte	0x5
	.uleb128 0x287
	.long	.LASF1600
	.byte	0x5
	.uleb128 0x289
	.long	.LASF1601
	.byte	0x5
	.uleb128 0x28b
	.long	.LASF1602
	.byte	0x5
	.uleb128 0x28d
	.long	.LASF1603
	.byte	0x5
	.uleb128 0x28f
	.long	.LASF1604
	.byte	0x5
	.uleb128 0x291
	.long	.LASF1605
	.byte	0x5
	.uleb128 0x293
	.long	.LASF1606
	.byte	0x5
	.uleb128 0x295
	.long	.LASF1607
	.byte	0x5
	.uleb128 0x297
	.long	.LASF1608
	.byte	0x5
	.uleb128 0x299
	.long	.LASF1609
	.byte	0x5
	.uleb128 0x29b
	.long	.LASF1610
	.byte	0x5
	.uleb128 0x29d
	.long	.LASF1611
	.byte	0x5
	.uleb128 0x29f
	.long	.LASF1612
	.byte	0x5
	.uleb128 0x2a1
	.long	.LASF1613
	.byte	0x5
	.uleb128 0x2a3
	.long	.LASF1614
	.byte	0x5
	.uleb128 0x2a6
	.long	.LASF1615
	.byte	0x5
	.uleb128 0x2a8
	.long	.LASF1616
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.math.h.24.808d6e83a8b3b11b5fa9117392e0d6ca,comdat
.Ldebug_macro64:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x18
	.long	.LASF1619
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF368
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.libmsimddeclstubs.h.34.70d39999a9be1e0e0e3916021c6182d5,comdat
.Ldebug_macro65:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x22
	.long	.LASF1620
	.byte	0x5
	.uleb128 0x24
	.long	.LASF1621
	.byte	0x5
	.uleb128 0x25
	.long	.LASF1622
	.byte	0x5
	.uleb128 0x26
	.long	.LASF1623
	.byte	0x5
	.uleb128 0x27
	.long	.LASF1624
	.byte	0x5
	.uleb128 0x28
	.long	.LASF1625
	.byte	0x5
	.uleb128 0x29
	.long	.LASF1626
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF1627
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF1628
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF1629
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF1630
	.byte	0x5
	.uleb128 0x2f
	.long	.LASF1631
	.byte	0x5
	.uleb128 0x30
	.long	.LASF1632
	.byte	0x5
	.uleb128 0x31
	.long	.LASF1633
	.byte	0x5
	.uleb128 0x32
	.long	.LASF1634
	.byte	0x5
	.uleb128 0x33
	.long	.LASF1635
	.byte	0x5
	.uleb128 0x34
	.long	.LASF1636
	.byte	0x5
	.uleb128 0x35
	.long	.LASF1637
	.byte	0x5
	.uleb128 0x36
	.long	.LASF1638
	.byte	0x5
	.uleb128 0x37
	.long	.LASF1639
	.byte	0x5
	.uleb128 0x38
	.long	.LASF1640
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF1641
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF1642
	.byte	0x5
	.uleb128 0x3c
	.long	.LASF1643
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF1644
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF1645
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF1646
	.byte	0x5
	.uleb128 0x40
	.long	.LASF1647
	.byte	0x5
	.uleb128 0x41
	.long	.LASF1648
	.byte	0x5
	.uleb128 0x42
	.long	.LASF1649
	.byte	0x5
	.uleb128 0x43
	.long	.LASF1650
	.byte	0x5
	.uleb128 0x45
	.long	.LASF1651
	.byte	0x5
	.uleb128 0x46
	.long	.LASF1652
	.byte	0x5
	.uleb128 0x47
	.long	.LASF1653
	.byte	0x5
	.uleb128 0x48
	.long	.LASF1654
	.byte	0x5
	.uleb128 0x49
	.long	.LASF1655
	.byte	0x5
	.uleb128 0x4a
	.long	.LASF1656
	.byte	0x5
	.uleb128 0x4b
	.long	.LASF1657
	.byte	0x5
	.uleb128 0x4c
	.long	.LASF1658
	.byte	0x5
	.uleb128 0x4d
	.long	.LASF1659
	.byte	0x5
	.uleb128 0x4e
	.long	.LASF1660
	.byte	0x5
	.uleb128 0x50
	.long	.LASF1661
	.byte	0x5
	.uleb128 0x51
	.long	.LASF1662
	.byte	0x5
	.uleb128 0x52
	.long	.LASF1663
	.byte	0x5
	.uleb128 0x53
	.long	.LASF1664
	.byte	0x5
	.uleb128 0x54
	.long	.LASF1665
	.byte	0x5
	.uleb128 0x55
	.long	.LASF1666
	.byte	0x5
	.uleb128 0x56
	.long	.LASF1667
	.byte	0x5
	.uleb128 0x57
	.long	.LASF1668
	.byte	0x5
	.uleb128 0x58
	.long	.LASF1669
	.byte	0x5
	.uleb128 0x59
	.long	.LASF1670
	.byte	0x5
	.uleb128 0x5b
	.long	.LASF1671
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF1672
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF1673
	.byte	0x5
	.uleb128 0x5e
	.long	.LASF1674
	.byte	0x5
	.uleb128 0x5f
	.long	.LASF1675
	.byte	0x5
	.uleb128 0x60
	.long	.LASF1676
	.byte	0x5
	.uleb128 0x61
	.long	.LASF1677
	.byte	0x5
	.uleb128 0x62
	.long	.LASF1678
	.byte	0x5
	.uleb128 0x63
	.long	.LASF1679
	.byte	0x5
	.uleb128 0x64
	.long	.LASF1680
	.byte	0x5
	.uleb128 0x66
	.long	.LASF1681
	.byte	0x5
	.uleb128 0x67
	.long	.LASF1682
	.byte	0x5
	.uleb128 0x68
	.long	.LASF1683
	.byte	0x5
	.uleb128 0x69
	.long	.LASF1684
	.byte	0x5
	.uleb128 0x6a
	.long	.LASF1685
	.byte	0x5
	.uleb128 0x6b
	.long	.LASF1686
	.byte	0x5
	.uleb128 0x6c
	.long	.LASF1687
	.byte	0x5
	.uleb128 0x6d
	.long	.LASF1688
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF1689
	.byte	0x5
	.uleb128 0x6f
	.long	.LASF1690
	.byte	0x5
	.uleb128 0x71
	.long	.LASF1691
	.byte	0x5
	.uleb128 0x72
	.long	.LASF1692
	.byte	0x5
	.uleb128 0x73
	.long	.LASF1693
	.byte	0x5
	.uleb128 0x74
	.long	.LASF1694
	.byte	0x5
	.uleb128 0x75
	.long	.LASF1695
	.byte	0x5
	.uleb128 0x76
	.long	.LASF1696
	.byte	0x5
	.uleb128 0x77
	.long	.LASF1697
	.byte	0x5
	.uleb128 0x78
	.long	.LASF1698
	.byte	0x5
	.uleb128 0x79
	.long	.LASF1699
	.byte	0x5
	.uleb128 0x7a
	.long	.LASF1700
	.byte	0x5
	.uleb128 0x7c
	.long	.LASF1701
	.byte	0x5
	.uleb128 0x7d
	.long	.LASF1702
	.byte	0x5
	.uleb128 0x7e
	.long	.LASF1703
	.byte	0x5
	.uleb128 0x7f
	.long	.LASF1704
	.byte	0x5
	.uleb128 0x80
	.long	.LASF1705
	.byte	0x5
	.uleb128 0x81
	.long	.LASF1706
	.byte	0x5
	.uleb128 0x82
	.long	.LASF1707
	.byte	0x5
	.uleb128 0x83
	.long	.LASF1708
	.byte	0x5
	.uleb128 0x84
	.long	.LASF1709
	.byte	0x5
	.uleb128 0x85
	.long	.LASF1710
	.byte	0x5
	.uleb128 0x87
	.long	.LASF1711
	.byte	0x5
	.uleb128 0x88
	.long	.LASF1712
	.byte	0x5
	.uleb128 0x89
	.long	.LASF1713
	.byte	0x5
	.uleb128 0x8a
	.long	.LASF1714
	.byte	0x5
	.uleb128 0x8b
	.long	.LASF1715
	.byte	0x5
	.uleb128 0x8c
	.long	.LASF1716
	.byte	0x5
	.uleb128 0x8d
	.long	.LASF1717
	.byte	0x5
	.uleb128 0x8e
	.long	.LASF1718
	.byte	0x5
	.uleb128 0x8f
	.long	.LASF1719
	.byte	0x5
	.uleb128 0x90
	.long	.LASF1720
	.byte	0x5
	.uleb128 0x92
	.long	.LASF1721
	.byte	0x5
	.uleb128 0x93
	.long	.LASF1722
	.byte	0x5
	.uleb128 0x94
	.long	.LASF1723
	.byte	0x5
	.uleb128 0x95
	.long	.LASF1724
	.byte	0x5
	.uleb128 0x96
	.long	.LASF1725
	.byte	0x5
	.uleb128 0x97
	.long	.LASF1726
	.byte	0x5
	.uleb128 0x98
	.long	.LASF1727
	.byte	0x5
	.uleb128 0x99
	.long	.LASF1728
	.byte	0x5
	.uleb128 0x9a
	.long	.LASF1729
	.byte	0x5
	.uleb128 0x9b
	.long	.LASF1730
	.byte	0x5
	.uleb128 0x9d
	.long	.LASF1731
	.byte	0x5
	.uleb128 0x9e
	.long	.LASF1732
	.byte	0x5
	.uleb128 0x9f
	.long	.LASF1733
	.byte	0x5
	.uleb128 0xa0
	.long	.LASF1734
	.byte	0x5
	.uleb128 0xa1
	.long	.LASF1735
	.byte	0x5
	.uleb128 0xa2
	.long	.LASF1736
	.byte	0x5
	.uleb128 0xa3
	.long	.LASF1737
	.byte	0x5
	.uleb128 0xa4
	.long	.LASF1738
	.byte	0x5
	.uleb128 0xa5
	.long	.LASF1739
	.byte	0x5
	.uleb128 0xa6
	.long	.LASF1740
	.byte	0x5
	.uleb128 0xa8
	.long	.LASF1741
	.byte	0x5
	.uleb128 0xa9
	.long	.LASF1742
	.byte	0x5
	.uleb128 0xaa
	.long	.LASF1743
	.byte	0x5
	.uleb128 0xab
	.long	.LASF1744
	.byte	0x5
	.uleb128 0xac
	.long	.LASF1745
	.byte	0x5
	.uleb128 0xad
	.long	.LASF1746
	.byte	0x5
	.uleb128 0xae
	.long	.LASF1747
	.byte	0x5
	.uleb128 0xaf
	.long	.LASF1748
	.byte	0x5
	.uleb128 0xb0
	.long	.LASF1749
	.byte	0x5
	.uleb128 0xb1
	.long	.LASF1750
	.byte	0x5
	.uleb128 0xb3
	.long	.LASF1751
	.byte	0x5
	.uleb128 0xb4
	.long	.LASF1752
	.byte	0x5
	.uleb128 0xb5
	.long	.LASF1753
	.byte	0x5
	.uleb128 0xb6
	.long	.LASF1754
	.byte	0x5
	.uleb128 0xb7
	.long	.LASF1755
	.byte	0x5
	.uleb128 0xb8
	.long	.LASF1756
	.byte	0x5
	.uleb128 0xb9
	.long	.LASF1757
	.byte	0x5
	.uleb128 0xba
	.long	.LASF1758
	.byte	0x5
	.uleb128 0xbb
	.long	.LASF1759
	.byte	0x5
	.uleb128 0xbc
	.long	.LASF1760
	.byte	0x5
	.uleb128 0xbe
	.long	.LASF1761
	.byte	0x5
	.uleb128 0xbf
	.long	.LASF1762
	.byte	0x5
	.uleb128 0xc0
	.long	.LASF1763
	.byte	0x5
	.uleb128 0xc1
	.long	.LASF1764
	.byte	0x5
	.uleb128 0xc2
	.long	.LASF1765
	.byte	0x5
	.uleb128 0xc3
	.long	.LASF1766
	.byte	0x5
	.uleb128 0xc4
	.long	.LASF1767
	.byte	0x5
	.uleb128 0xc5
	.long	.LASF1768
	.byte	0x5
	.uleb128 0xc6
	.long	.LASF1769
	.byte	0x5
	.uleb128 0xc7
	.long	.LASF1770
	.byte	0x5
	.uleb128 0xc9
	.long	.LASF1771
	.byte	0x5
	.uleb128 0xca
	.long	.LASF1772
	.byte	0x5
	.uleb128 0xcb
	.long	.LASF1773
	.byte	0x5
	.uleb128 0xcc
	.long	.LASF1774
	.byte	0x5
	.uleb128 0xcd
	.long	.LASF1775
	.byte	0x5
	.uleb128 0xce
	.long	.LASF1776
	.byte	0x5
	.uleb128 0xcf
	.long	.LASF1777
	.byte	0x5
	.uleb128 0xd0
	.long	.LASF1778
	.byte	0x5
	.uleb128 0xd1
	.long	.LASF1779
	.byte	0x5
	.uleb128 0xd2
	.long	.LASF1780
	.byte	0x5
	.uleb128 0xd4
	.long	.LASF1781
	.byte	0x5
	.uleb128 0xd5
	.long	.LASF1782
	.byte	0x5
	.uleb128 0xd6
	.long	.LASF1783
	.byte	0x5
	.uleb128 0xd7
	.long	.LASF1784
	.byte	0x5
	.uleb128 0xd8
	.long	.LASF1785
	.byte	0x5
	.uleb128 0xd9
	.long	.LASF1786
	.byte	0x5
	.uleb128 0xda
	.long	.LASF1787
	.byte	0x5
	.uleb128 0xdb
	.long	.LASF1788
	.byte	0x5
	.uleb128 0xdc
	.long	.LASF1789
	.byte	0x5
	.uleb128 0xdd
	.long	.LASF1790
	.byte	0x5
	.uleb128 0xdf
	.long	.LASF1791
	.byte	0x5
	.uleb128 0xe0
	.long	.LASF1792
	.byte	0x5
	.uleb128 0xe1
	.long	.LASF1793
	.byte	0x5
	.uleb128 0xe2
	.long	.LASF1794
	.byte	0x5
	.uleb128 0xe3
	.long	.LASF1795
	.byte	0x5
	.uleb128 0xe4
	.long	.LASF1796
	.byte	0x5
	.uleb128 0xe5
	.long	.LASF1797
	.byte	0x5
	.uleb128 0xe6
	.long	.LASF1798
	.byte	0x5
	.uleb128 0xe7
	.long	.LASF1799
	.byte	0x5
	.uleb128 0xe8
	.long	.LASF1800
	.byte	0x5
	.uleb128 0xea
	.long	.LASF1801
	.byte	0x5
	.uleb128 0xeb
	.long	.LASF1802
	.byte	0x5
	.uleb128 0xec
	.long	.LASF1803
	.byte	0x5
	.uleb128 0xed
	.long	.LASF1804
	.byte	0x5
	.uleb128 0xee
	.long	.LASF1805
	.byte	0x5
	.uleb128 0xef
	.long	.LASF1806
	.byte	0x5
	.uleb128 0xf0
	.long	.LASF1807
	.byte	0x5
	.uleb128 0xf1
	.long	.LASF1808
	.byte	0x5
	.uleb128 0xf2
	.long	.LASF1809
	.byte	0x5
	.uleb128 0xf3
	.long	.LASF1810
	.byte	0x5
	.uleb128 0xf5
	.long	.LASF1811
	.byte	0x5
	.uleb128 0xf6
	.long	.LASF1812
	.byte	0x5
	.uleb128 0xf7
	.long	.LASF1813
	.byte	0x5
	.uleb128 0xf8
	.long	.LASF1814
	.byte	0x5
	.uleb128 0xf9
	.long	.LASF1815
	.byte	0x5
	.uleb128 0xfa
	.long	.LASF1816
	.byte	0x5
	.uleb128 0xfb
	.long	.LASF1817
	.byte	0x5
	.uleb128 0xfc
	.long	.LASF1818
	.byte	0x5
	.uleb128 0xfd
	.long	.LASF1819
	.byte	0x5
	.uleb128 0xfe
	.long	.LASF1820
	.byte	0x5
	.uleb128 0x100
	.long	.LASF1821
	.byte	0x5
	.uleb128 0x101
	.long	.LASF1822
	.byte	0x5
	.uleb128 0x102
	.long	.LASF1823
	.byte	0x5
	.uleb128 0x103
	.long	.LASF1824
	.byte	0x5
	.uleb128 0x104
	.long	.LASF1825
	.byte	0x5
	.uleb128 0x105
	.long	.LASF1826
	.byte	0x5
	.uleb128 0x106
	.long	.LASF1827
	.byte	0x5
	.uleb128 0x107
	.long	.LASF1828
	.byte	0x5
	.uleb128 0x108
	.long	.LASF1829
	.byte	0x5
	.uleb128 0x109
	.long	.LASF1830
	.byte	0x5
	.uleb128 0x10b
	.long	.LASF1831
	.byte	0x5
	.uleb128 0x10c
	.long	.LASF1832
	.byte	0x5
	.uleb128 0x10d
	.long	.LASF1833
	.byte	0x5
	.uleb128 0x10e
	.long	.LASF1834
	.byte	0x5
	.uleb128 0x10f
	.long	.LASF1835
	.byte	0x5
	.uleb128 0x110
	.long	.LASF1836
	.byte	0x5
	.uleb128 0x111
	.long	.LASF1837
	.byte	0x5
	.uleb128 0x112
	.long	.LASF1838
	.byte	0x5
	.uleb128 0x113
	.long	.LASF1839
	.byte	0x5
	.uleb128 0x114
	.long	.LASF1840
	.byte	0x5
	.uleb128 0x116
	.long	.LASF1841
	.byte	0x5
	.uleb128 0x117
	.long	.LASF1842
	.byte	0x5
	.uleb128 0x118
	.long	.LASF1843
	.byte	0x5
	.uleb128 0x119
	.long	.LASF1844
	.byte	0x5
	.uleb128 0x11a
	.long	.LASF1845
	.byte	0x5
	.uleb128 0x11b
	.long	.LASF1846
	.byte	0x5
	.uleb128 0x11c
	.long	.LASF1847
	.byte	0x5
	.uleb128 0x11d
	.long	.LASF1848
	.byte	0x5
	.uleb128 0x11e
	.long	.LASF1849
	.byte	0x5
	.uleb128 0x11f
	.long	.LASF1850
	.byte	0x5
	.uleb128 0x121
	.long	.LASF1851
	.byte	0x5
	.uleb128 0x122
	.long	.LASF1852
	.byte	0x5
	.uleb128 0x123
	.long	.LASF1853
	.byte	0x5
	.uleb128 0x124
	.long	.LASF1854
	.byte	0x5
	.uleb128 0x125
	.long	.LASF1855
	.byte	0x5
	.uleb128 0x126
	.long	.LASF1856
	.byte	0x5
	.uleb128 0x127
	.long	.LASF1857
	.byte	0x5
	.uleb128 0x128
	.long	.LASF1858
	.byte	0x5
	.uleb128 0x129
	.long	.LASF1859
	.byte	0x5
	.uleb128 0x12a
	.long	.LASF1860
	.byte	0x5
	.uleb128 0x12c
	.long	.LASF1861
	.byte	0x5
	.uleb128 0x12d
	.long	.LASF1862
	.byte	0x5
	.uleb128 0x12e
	.long	.LASF1863
	.byte	0x5
	.uleb128 0x12f
	.long	.LASF1864
	.byte	0x5
	.uleb128 0x130
	.long	.LASF1865
	.byte	0x5
	.uleb128 0x131
	.long	.LASF1866
	.byte	0x5
	.uleb128 0x132
	.long	.LASF1867
	.byte	0x5
	.uleb128 0x133
	.long	.LASF1868
	.byte	0x5
	.uleb128 0x134
	.long	.LASF1869
	.byte	0x5
	.uleb128 0x135
	.long	.LASF1870
	.byte	0x5
	.uleb128 0x137
	.long	.LASF1871
	.byte	0x5
	.uleb128 0x138
	.long	.LASF1872
	.byte	0x5
	.uleb128 0x139
	.long	.LASF1873
	.byte	0x5
	.uleb128 0x13a
	.long	.LASF1874
	.byte	0x5
	.uleb128 0x13b
	.long	.LASF1875
	.byte	0x5
	.uleb128 0x13c
	.long	.LASF1876
	.byte	0x5
	.uleb128 0x13d
	.long	.LASF1877
	.byte	0x5
	.uleb128 0x13e
	.long	.LASF1878
	.byte	0x5
	.uleb128 0x13f
	.long	.LASF1879
	.byte	0x5
	.uleb128 0x140
	.long	.LASF1880
	.byte	0x5
	.uleb128 0x142
	.long	.LASF1881
	.byte	0x5
	.uleb128 0x143
	.long	.LASF1882
	.byte	0x5
	.uleb128 0x144
	.long	.LASF1883
	.byte	0x5
	.uleb128 0x145
	.long	.LASF1884
	.byte	0x5
	.uleb128 0x146
	.long	.LASF1885
	.byte	0x5
	.uleb128 0x147
	.long	.LASF1886
	.byte	0x5
	.uleb128 0x148
	.long	.LASF1887
	.byte	0x5
	.uleb128 0x149
	.long	.LASF1888
	.byte	0x5
	.uleb128 0x14a
	.long	.LASF1889
	.byte	0x5
	.uleb128 0x14b
	.long	.LASF1890
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.math.h.48.5dafc6157c80230c0414aa9de5e109ba,comdat
.Ldebug_macro66:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x30
	.long	.LASF1891
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF1892
	.byte	0x5
	.uleb128 0x3c
	.long	.LASF1893
	.byte	0x5
	.uleb128 0x5b
	.long	.LASF1894
	.byte	0x5
	.uleb128 0x62
	.long	.LASF1895
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.fplogb.h.23.f264b61801f4cf347bed2d0fad7232d9,comdat
.Ldebug_macro67:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x17
	.long	.LASF1897
	.byte	0x5
	.uleb128 0x18
	.long	.LASF1898
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.math.h.207.154fc91142a9a5fbf7efb31ec64eb6b5,comdat
.Ldebug_macro68:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xcf
	.long	.LASF1899
	.byte	0x5
	.uleb128 0xd4
	.long	.LASF1900
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.math.h.276.0ce1639e4fd0f75af1ac8728ad903714,comdat
.Ldebug_macro69:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x114
	.long	.LASF1901
	.byte	0x5
	.uleb128 0x116
	.long	.LASF1902
	.byte	0x5
	.uleb128 0x11a
	.long	.LASF1903
	.byte	0x5
	.uleb128 0x11e
	.long	.LASF1904
	.byte	0x5
	.uleb128 0x120
	.long	.LASF1905
	.byte	0x5
	.uleb128 0x123
	.long	.LASF1906
	.byte	0x5
	.uleb128 0x125
	.long	.LASF1907
	.byte	0x5
	.uleb128 0x128
	.long	.LASF1908
	.byte	0x5
	.uleb128 0x12a
	.long	.LASF1909
	.byte	0x5
	.uleb128 0x12e
	.long	.LASF1910
	.byte	0x5
	.uleb128 0x131
	.long	.LASF1911
	.byte	0x5
	.uleb128 0x134
	.long	.LASF1912
	.byte	0x5
	.uleb128 0x135
	.long	.LASF1913
	.byte	0x5
	.uleb128 0x136
	.long	.LASF1914
	.byte	0x5
	.uleb128 0x137
	.long	.LASF1915
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.math.h.314.55d9bc10b03e05989ad6400842f5a189,comdat
.Ldebug_macro70:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x13a
	.long	.LASF1916
	.byte	0x6
	.uleb128 0x13b
	.long	.LASF1917
	.byte	0x6
	.uleb128 0x13c
	.long	.LASF1918
	.byte	0x6
	.uleb128 0x13d
	.long	.LASF1919
	.byte	0x5
	.uleb128 0x145
	.long	.LASF1920
	.byte	0x5
	.uleb128 0x146
	.long	.LASF1921
	.byte	0x5
	.uleb128 0x147
	.long	.LASF1922
	.byte	0x5
	.uleb128 0x148
	.long	.LASF1915
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.math.h.331.a75427efad95ca361cbcd39e72516aa4,comdat
.Ldebug_macro71:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x14b
	.long	.LASF1916
	.byte	0x6
	.uleb128 0x14c
	.long	.LASF1917
	.byte	0x6
	.uleb128 0x14d
	.long	.LASF1918
	.byte	0x6
	.uleb128 0x14e
	.long	.LASF1919
	.byte	0x5
	.uleb128 0x189
	.long	.LASF1923
	.byte	0x5
	.uleb128 0x18a
	.long	.LASF1924
	.byte	0x5
	.uleb128 0x18b
	.long	.LASF1922
	.byte	0x5
	.uleb128 0x18c
	.long	.LASF1915
	.byte	0x5
	.uleb128 0x18d
	.long	.LASF1925
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.math.h.401.6bdb6458b6d78f00f8450a35891b9a64,comdat
.Ldebug_macro72:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x191
	.long	.LASF1916
	.byte	0x6
	.uleb128 0x192
	.long	.LASF1917
	.byte	0x6
	.uleb128 0x193
	.long	.LASF1918
	.byte	0x6
	.uleb128 0x194
	.long	.LASF1919
	.byte	0x5
	.uleb128 0x1ba
	.long	.LASF1926
	.byte	0x5
	.uleb128 0x1bb
	.long	.LASF1927
	.byte	0x5
	.uleb128 0x1bc
	.long	.LASF1922
	.byte	0x5
	.uleb128 0x1bd
	.long	.LASF1928
	.byte	0x6
	.uleb128 0x1c4
	.long	.LASF1916
	.byte	0x6
	.uleb128 0x1c5
	.long	.LASF1917
	.byte	0x6
	.uleb128 0x1c6
	.long	.LASF1918
	.byte	0x6
	.uleb128 0x1c7
	.long	.LASF1919
	.byte	0x5
	.uleb128 0x1cb
	.long	.LASF1929
	.byte	0x5
	.uleb128 0x1cc
	.long	.LASF1930
	.byte	0x5
	.uleb128 0x1cd
	.long	.LASF1922
	.byte	0x5
	.uleb128 0x1ce
	.long	.LASF1928
	.byte	0x6
	.uleb128 0x1d5
	.long	.LASF1916
	.byte	0x6
	.uleb128 0x1d6
	.long	.LASF1917
	.byte	0x6
	.uleb128 0x1d7
	.long	.LASF1918
	.byte	0x6
	.uleb128 0x1d8
	.long	.LASF1919
	.byte	0x5
	.uleb128 0x1dc
	.long	.LASF1931
	.byte	0x5
	.uleb128 0x1dd
	.long	.LASF1932
	.byte	0x5
	.uleb128 0x1de
	.long	.LASF1922
	.byte	0x5
	.uleb128 0x1df
	.long	.LASF1928
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.math.h.486.a7407a4b77ad0f3687700042629bc5bf,comdat
.Ldebug_macro73:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x1e6
	.long	.LASF1916
	.byte	0x6
	.uleb128 0x1e7
	.long	.LASF1917
	.byte	0x6
	.uleb128 0x1e8
	.long	.LASF1918
	.byte	0x6
	.uleb128 0x1e9
	.long	.LASF1919
	.byte	0x5
	.uleb128 0x1ed
	.long	.LASF1933
	.byte	0x5
	.uleb128 0x1ee
	.long	.LASF1934
	.byte	0x5
	.uleb128 0x1ef
	.long	.LASF1922
	.byte	0x5
	.uleb128 0x1f0
	.long	.LASF1928
	.byte	0x6
	.uleb128 0x1f7
	.long	.LASF1916
	.byte	0x6
	.uleb128 0x1f8
	.long	.LASF1917
	.byte	0x6
	.uleb128 0x1f9
	.long	.LASF1918
	.byte	0x6
	.uleb128 0x1fa
	.long	.LASF1919
	.byte	0x5
	.uleb128 0x1fe
	.long	.LASF1935
	.byte	0x5
	.uleb128 0x1ff
	.long	.LASF1936
	.byte	0x5
	.uleb128 0x200
	.long	.LASF1922
	.byte	0x5
	.uleb128 0x201
	.long	.LASF1928
	.byte	0x6
	.uleb128 0x208
	.long	.LASF1916
	.byte	0x6
	.uleb128 0x209
	.long	.LASF1917
	.byte	0x6
	.uleb128 0x20a
	.long	.LASF1918
	.byte	0x6
	.uleb128 0x20b
	.long	.LASF1919
	.byte	0x6
	.uleb128 0x21f
	.long	.LASF1937
	.byte	0x6
	.uleb128 0x220
	.long	.LASF1938
	.byte	0x6
	.uleb128 0x221
	.long	.LASF1939
	.byte	0x6
	.uleb128 0x222
	.long	.LASF1940
	.byte	0x6
	.uleb128 0x223
	.long	.LASF1941
	.byte	0x5
	.uleb128 0x226
	.long	.LASF1942
	.byte	0x5
	.uleb128 0x227
	.long	.LASF1943
	.byte	0x5
	.uleb128 0x228
	.long	.LASF1944
	.byte	0x5
	.uleb128 0x229
	.long	.LASF1945
	.byte	0x5
	.uleb128 0x22b
	.long	.LASF1946
	.byte	0x5
	.uleb128 0x22e
	.long	.LASF1947
	.byte	0x6
	.uleb128 0x34d
	.long	.LASF1948
	.byte	0x6
	.uleb128 0x34e
	.long	.LASF1949
	.byte	0x6
	.uleb128 0x34f
	.long	.LASF1950
	.byte	0x6
	.uleb128 0x350
	.long	.LASF1951
	.byte	0x6
	.uleb128 0x351
	.long	.LASF1952
	.byte	0x6
	.uleb128 0x352
	.long	.LASF1953
	.byte	0x5
	.uleb128 0x374
	.long	.LASF1954
	.byte	0x5
	.uleb128 0x37a
	.long	.LASF1955
	.byte	0x5
	.uleb128 0x381
	.long	.LASF1956
	.byte	0x5
	.uleb128 0x3a9
	.long	.LASF1957
	.byte	0x5
	.uleb128 0x3ac
	.long	.LASF1958
	.byte	0x5
	.uleb128 0x3af
	.long	.LASF1959
	.byte	0x5
	.uleb128 0x3b2
	.long	.LASF1960
	.byte	0x5
	.uleb128 0x3b5
	.long	.LASF1961
	.byte	0x5
	.uleb128 0x3c7
	.long	.LASF1962
	.byte	0x5
	.uleb128 0x3cf
	.long	.LASF1963
	.byte	0x5
	.uleb128 0x3e2
	.long	.LASF1964
	.byte	0x5
	.uleb128 0x3ea
	.long	.LASF1965
	.byte	0x5
	.uleb128 0x3f3
	.long	.LASF1966
	.byte	0x5
	.uleb128 0x405
	.long	.LASF1967
	.byte	0x5
	.uleb128 0x40b
	.long	.LASF1968
	.byte	0x5
	.uleb128 0x40c
	.long	.LASF1969
	.byte	0x5
	.uleb128 0x418
	.long	.LASF1970
	.byte	0x5
	.uleb128 0x47a
	.long	.LASF1971
	.byte	0x5
	.uleb128 0x47b
	.long	.LASF1972
	.byte	0x5
	.uleb128 0x47c
	.long	.LASF1973
	.byte	0x5
	.uleb128 0x47d
	.long	.LASF1974
	.byte	0x5
	.uleb128 0x47e
	.long	.LASF1975
	.byte	0x5
	.uleb128 0x47f
	.long	.LASF1976
	.byte	0x5
	.uleb128 0x480
	.long	.LASF1977
	.byte	0x5
	.uleb128 0x481
	.long	.LASF1978
	.byte	0x5
	.uleb128 0x482
	.long	.LASF1979
	.byte	0x5
	.uleb128 0x483
	.long	.LASF1980
	.byte	0x5
	.uleb128 0x484
	.long	.LASF1981
	.byte	0x5
	.uleb128 0x485
	.long	.LASF1982
	.byte	0x5
	.uleb128 0x486
	.long	.LASF1983
	.byte	0x5
	.uleb128 0x519
	.long	.LASF1984
	.byte	0x5
	.uleb128 0x51a
	.long	.LASF1985
	.byte	0x5
	.uleb128 0x51b
	.long	.LASF1986
	.byte	0x5
	.uleb128 0x51c
	.long	.LASF1987
	.byte	0x5
	.uleb128 0x51d
	.long	.LASF1988
	.byte	0x5
	.uleb128 0x51e
	.long	.LASF1989
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.curses.h.39.3b102e3630033b221c3e41b51ca3db05,comdat
.Ldebug_macro74:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x27
	.long	.LASF1990
	.byte	0x5
	.uleb128 0x45
	.long	.LASF1991
	.byte	0x5
	.uleb128 0x46
	.long	.LASF1992
	.byte	0x5
	.uleb128 0x49
	.long	.LASF1993
	.byte	0x5
	.uleb128 0x4a
	.long	.LASF1994
	.byte	0x5
	.uleb128 0x4b
	.long	.LASF1995
	.byte	0x6
	.uleb128 0x4e
	.long	.LASF1996
	.byte	0x5
	.uleb128 0x4f
	.long	.LASF1997
	.byte	0x5
	.uleb128 0x54
	.long	.LASF1998
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.ncurses_dll.h.32.4f7d5f75878767130cff27603ec5ce98,comdat
.Ldebug_macro75:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x20
	.long	.LASF1999
	.byte	0x5
	.uleb128 0x44
	.long	.LASF2000
	.byte	0x5
	.uleb128 0x49
	.long	.LASF2001
	.byte	0x5
	.uleb128 0x4c
	.long	.LASF2002
	.byte	0x5
	.uleb128 0x4e
	.long	.LASF2003
	.byte	0x5
	.uleb128 0x4f
	.long	.LASF2004
	.byte	0x5
	.uleb128 0x5e
	.long	.LASF2005
	.byte	0x5
	.uleb128 0x5f
	.long	.LASF2006
	.byte	0x5
	.uleb128 0x60
	.long	.LASF2007
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.curses.h.111.996a0c5f11e7351daad14d76d85bb96b,comdat
.Ldebug_macro76:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x6f
	.long	.LASF2008
	.byte	0x5
	.uleb128 0x77
	.long	.LASF2009
	.byte	0x6
	.uleb128 0x7e
	.long	.LASF2010
	.byte	0x5
	.uleb128 0x7f
	.long	.LASF2011
	.byte	0x6
	.uleb128 0x81
	.long	.LASF2012
	.byte	0x5
	.uleb128 0x82
	.long	.LASF2013
	.byte	0x6
	.uleb128 0x8d
	.long	.LASF2014
	.byte	0x5
	.uleb128 0x8e
	.long	.LASF2015
	.byte	0x6
	.uleb128 0x90
	.long	.LASF2016
	.byte	0x5
	.uleb128 0x91
	.long	.LASF2017
	.byte	0x5
	.uleb128 0x97
	.long	.LASF2018
	.byte	0x5
	.uleb128 0x98
	.long	.LASF2019
	.byte	0x5
	.uleb128 0x99
	.long	.LASF2020
	.byte	0x5
	.uleb128 0x9a
	.long	.LASF2021
	.byte	0x5
	.uleb128 0xa3
	.long	.LASF2022
	.byte	0x5
	.uleb128 0xaa
	.long	.LASF2023
	.byte	0x6
	.uleb128 0xb0
	.long	.LASF2024
	.byte	0x6
	.uleb128 0xb8
	.long	.LASF2025
	.byte	0x5
	.uleb128 0xb9
	.long	.LASF2026
	.byte	0x6
	.uleb128 0xbe
	.long	.LASF2027
	.byte	0x5
	.uleb128 0xbf
	.long	.LASF2028
	.byte	0x6
	.uleb128 0xc4
	.long	.LASF2029
	.byte	0x5
	.uleb128 0xc5
	.long	.LASF2030
	.byte	0x6
	.uleb128 0xcb
	.long	.LASF2031
	.byte	0x5
	.uleb128 0xcc
	.long	.LASF2032
	.byte	0x6
	.uleb128 0xd2
	.long	.LASF2033
	.byte	0x5
	.uleb128 0xd3
	.long	.LASF2034
	.byte	0x6
	.uleb128 0xda
	.long	.LASF2035
	.byte	0x5
	.uleb128 0xdb
	.long	.LASF2036
	.byte	0x5
	.uleb128 0xf5
	.long	.LASF2037
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdarg.h.31.3fa7b8f6daaa31edd1696c08c77f2a73,comdat
.Ldebug_macro77:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF2038
	.byte	0x5
	.uleb128 0x20
	.long	.LASF2039
	.byte	0x6
	.uleb128 0x22
	.long	.LASF567
	.byte	0x5
	.uleb128 0x2f
	.long	.LASF2040
	.byte	0x5
	.uleb128 0x30
	.long	.LASF2041
	.byte	0x5
	.uleb128 0x31
	.long	.LASF2042
	.byte	0x5
	.uleb128 0x34
	.long	.LASF2043
	.byte	0x5
	.uleb128 0x36
	.long	.LASF2044
	.byte	0x5
	.uleb128 0x69
	.long	.LASF2045
	.byte	0x5
	.uleb128 0x6c
	.long	.LASF2046
	.byte	0x5
	.uleb128 0x72
	.long	.LASF2047
	.byte	0x5
	.uleb128 0x75
	.long	.LASF2048
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.curses.h.266.a6aa4f23550a6272814a993111e6627b,comdat
.Ldebug_macro78:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x10a
	.long	.LASF2049
	.byte	0x5
	.uleb128 0x10b
	.long	.LASF2050
	.byte	0x6
	.uleb128 0x10d
	.long	.LASF2051
	.byte	0x5
	.uleb128 0x10e
	.long	.LASF2052
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdbool.h.29.4a1c88fe569adb8d03217dd16982ca34,comdat
.Ldebug_macro79:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF2053
	.byte	0x5
	.uleb128 0x21
	.long	.LASF2054
	.byte	0x5
	.uleb128 0x26
	.long	.LASF2055
	.byte	0x5
	.uleb128 0x27
	.long	.LASF2056
	.byte	0x5
	.uleb128 0x32
	.long	.LASF2057
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.curses.h.284.b5c88a40caf804363b8dba931290ab8a,comdat
.Ldebug_macro80:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x11c
	.long	.LASF2058
	.byte	0x5
	.uleb128 0x129
	.long	.LASF2059
	.byte	0x5
	.uleb128 0x12c
	.long	.LASF2060
	.byte	0x5
	.uleb128 0x132
	.long	.LASF2061
	.byte	0x5
	.uleb128 0x133
	.long	.LASF2062
	.byte	0x5
	.uleb128 0x134
	.long	.LASF2063
	.byte	0x5
	.uleb128 0x135
	.long	.LASF2064
	.byte	0x5
	.uleb128 0x136
	.long	.LASF2065
	.byte	0x5
	.uleb128 0x137
	.long	.LASF2066
	.byte	0x5
	.uleb128 0x138
	.long	.LASF2067
	.byte	0x5
	.uleb128 0x139
	.long	.LASF2068
	.byte	0x5
	.uleb128 0x13a
	.long	.LASF2069
	.byte	0x5
	.uleb128 0x13b
	.long	.LASF2070
	.byte	0x5
	.uleb128 0x13c
	.long	.LASF2071
	.byte	0x5
	.uleb128 0x13d
	.long	.LASF2072
	.byte	0x5
	.uleb128 0x13e
	.long	.LASF2073
	.byte	0x5
	.uleb128 0x13f
	.long	.LASF2074
	.byte	0x5
	.uleb128 0x140
	.long	.LASF2075
	.byte	0x5
	.uleb128 0x141
	.long	.LASF2076
	.byte	0x5
	.uleb128 0x142
	.long	.LASF2077
	.byte	0x5
	.uleb128 0x145
	.long	.LASF2078
	.byte	0x5
	.uleb128 0x149
	.long	.LASF2079
	.byte	0x5
	.uleb128 0x14a
	.long	.LASF2080
	.byte	0x5
	.uleb128 0x14b
	.long	.LASF2081
	.byte	0x5
	.uleb128 0x14c
	.long	.LASF2082
	.byte	0x5
	.uleb128 0x14d
	.long	.LASF2083
	.byte	0x5
	.uleb128 0x14e
	.long	.LASF2084
	.byte	0x5
	.uleb128 0x14f
	.long	.LASF2085
	.byte	0x5
	.uleb128 0x150
	.long	.LASF2086
	.byte	0x5
	.uleb128 0x15b
	.long	.LASF2087
	.byte	0x5
	.uleb128 0x15e
	.long	.LASF2088
	.byte	0x5
	.uleb128 0x15f
	.long	.LASF2089
	.byte	0x5
	.uleb128 0x160
	.long	.LASF2090
	.byte	0x5
	.uleb128 0x161
	.long	.LASF2091
	.byte	0x5
	.uleb128 0x162
	.long	.LASF2092
	.byte	0x5
	.uleb128 0x163
	.long	.LASF2093
	.byte	0x5
	.uleb128 0x164
	.long	.LASF2094
	.byte	0x5
	.uleb128 0x165
	.long	.LASF2095
	.byte	0x5
	.uleb128 0x166
	.long	.LASF2096
	.byte	0x5
	.uleb128 0x167
	.long	.LASF2097
	.byte	0x5
	.uleb128 0x168
	.long	.LASF2098
	.byte	0x5
	.uleb128 0x169
	.long	.LASF2099
	.byte	0x5
	.uleb128 0x16a
	.long	.LASF2100
	.byte	0x5
	.uleb128 0x16b
	.long	.LASF2101
	.byte	0x5
	.uleb128 0x16c
	.long	.LASF2102
	.byte	0x5
	.uleb128 0x16d
	.long	.LASF2103
	.byte	0x5
	.uleb128 0x16e
	.long	.LASF2104
	.byte	0x5
	.uleb128 0x16f
	.long	.LASF2105
	.byte	0x5
	.uleb128 0x171
	.long	.LASF2106
	.byte	0x5
	.uleb128 0x172
	.long	.LASF2107
	.byte	0x5
	.uleb128 0x173
	.long	.LASF2108
	.byte	0x5
	.uleb128 0x174
	.long	.LASF2109
	.byte	0x5
	.uleb128 0x175
	.long	.LASF2110
	.byte	0x5
	.uleb128 0x176
	.long	.LASF2111
	.byte	0x5
	.uleb128 0x177
	.long	.LASF2112
	.byte	0x5
	.uleb128 0x17d
	.long	.LASF2113
	.byte	0x5
	.uleb128 0x17e
	.long	.LASF2114
	.byte	0x5
	.uleb128 0x17f
	.long	.LASF2115
	.byte	0x5
	.uleb128 0x180
	.long	.LASF2116
	.byte	0x5
	.uleb128 0x181
	.long	.LASF2117
	.byte	0x5
	.uleb128 0x182
	.long	.LASF2118
	.byte	0x5
	.uleb128 0x183
	.long	.LASF2119
	.byte	0x5
	.uleb128 0x18b
	.long	.LASF2120
	.byte	0x5
	.uleb128 0x18c
	.long	.LASF2121
	.byte	0x5
	.uleb128 0x18d
	.long	.LASF2122
	.byte	0x5
	.uleb128 0x18e
	.long	.LASF2123
	.byte	0x5
	.uleb128 0x18f
	.long	.LASF2124
	.byte	0x5
	.uleb128 0x190
	.long	.LASF2125
	.byte	0x5
	.uleb128 0x191
	.long	.LASF2126
	.byte	0x5
	.uleb128 0x192
	.long	.LASF2127
	.byte	0x5
	.uleb128 0x193
	.long	.LASF2128
	.byte	0x5
	.uleb128 0x194
	.long	.LASF2129
	.byte	0x5
	.uleb128 0x195
	.long	.LASF2130
	.byte	0x2
	.uleb128 0x197
	.string	"ERR"
	.byte	0x5
	.uleb128 0x198
	.long	.LASF2131
	.byte	0x2
	.uleb128 0x19a
	.string	"OK"
	.byte	0x5
	.uleb128 0x19b
	.long	.LASF2132
	.byte	0x5
	.uleb128 0x19e
	.long	.LASF2133
	.byte	0x5
	.uleb128 0x19f
	.long	.LASF2134
	.byte	0x5
	.uleb128 0x1a0
	.long	.LASF2135
	.byte	0x5
	.uleb128 0x1a1
	.long	.LASF2136
	.byte	0x5
	.uleb128 0x1a2
	.long	.LASF2137
	.byte	0x5
	.uleb128 0x1a3
	.long	.LASF2138
	.byte	0x5
	.uleb128 0x1a4
	.long	.LASF2139
	.byte	0x5
	.uleb128 0x1aa
	.long	.LASF2140
	.byte	0x5
	.uleb128 0x1b0
	.long	.LASF2141
	.byte	0x5
	.uleb128 0x234
	.long	.LASF2142
	.byte	0x5
	.uleb128 0x23c
	.long	.LASF2143
	.byte	0x5
	.uleb128 0x243
	.long	.LASF2144
	.byte	0x5
	.uleb128 0x247
	.long	.LASF2145
	.byte	0x6
	.uleb128 0x24a
	.long	.LASF2146
	.byte	0x5
	.uleb128 0x24c
	.long	.LASF2147
	.byte	0x5
	.uleb128 0x395
	.long	.LASF2148
	.byte	0x6
	.uleb128 0x39c
	.long	.LASF2149
	.byte	0x5
	.uleb128 0x39d
	.long	.LASF2150
	.byte	0x6
	.uleb128 0x3da
	.long	.LASF2151
	.byte	0x5
	.uleb128 0x3db
	.long	.LASF2152
	.byte	0x5
	.uleb128 0x3dc
	.long	.LASF2153
	.byte	0x5
	.uleb128 0x3df
	.long	.LASF2154
	.byte	0x5
	.uleb128 0x44f
	.long	.LASF2155
	.byte	0x5
	.uleb128 0x450
	.long	.LASF2156
	.byte	0x5
	.uleb128 0x452
	.long	.LASF2157
	.byte	0x5
	.uleb128 0x453
	.long	.LASF2158
	.byte	0x5
	.uleb128 0x454
	.long	.LASF2159
	.byte	0x5
	.uleb128 0x455
	.long	.LASF2160
	.byte	0x5
	.uleb128 0x456
	.long	.LASF2161
	.byte	0x5
	.uleb128 0x457
	.long	.LASF2162
	.byte	0x5
	.uleb128 0x458
	.long	.LASF2163
	.byte	0x5
	.uleb128 0x459
	.long	.LASF2164
	.byte	0x5
	.uleb128 0x45a
	.long	.LASF2165
	.byte	0x5
	.uleb128 0x45b
	.long	.LASF2166
	.byte	0x5
	.uleb128 0x45c
	.long	.LASF2167
	.byte	0x5
	.uleb128 0x45d
	.long	.LASF2168
	.byte	0x5
	.uleb128 0x45e
	.long	.LASF2169
	.byte	0x5
	.uleb128 0x45f
	.long	.LASF2170
	.byte	0x5
	.uleb128 0x460
	.long	.LASF2171
	.byte	0x5
	.uleb128 0x461
	.long	.LASF2172
	.byte	0x5
	.uleb128 0x462
	.long	.LASF2173
	.byte	0x5
	.uleb128 0x463
	.long	.LASF2174
	.byte	0x5
	.uleb128 0x464
	.long	.LASF2175
	.byte	0x5
	.uleb128 0x467
	.long	.LASF2176
	.byte	0x5
	.uleb128 0x474
	.long	.LASF2177
	.byte	0x5
	.uleb128 0x475
	.long	.LASF2178
	.byte	0x5
	.uleb128 0x476
	.long	.LASF2179
	.byte	0x5
	.uleb128 0x477
	.long	.LASF2180
	.byte	0x5
	.uleb128 0x479
	.long	.LASF2181
	.byte	0x5
	.uleb128 0x481
	.long	.LASF2182
	.byte	0x5
	.uleb128 0x491
	.long	.LASF2183
	.byte	0x5
	.uleb128 0x492
	.long	.LASF2184
	.byte	0x5
	.uleb128 0x494
	.long	.LASF2185
	.byte	0x5
	.uleb128 0x496
	.long	.LASF2186
	.byte	0x5
	.uleb128 0x497
	.long	.LASF2187
	.byte	0x5
	.uleb128 0x498
	.long	.LASF2188
	.byte	0x5
	.uleb128 0x499
	.long	.LASF2189
	.byte	0x5
	.uleb128 0x49a
	.long	.LASF2190
	.byte	0x5
	.uleb128 0x49b
	.long	.LASF2191
	.byte	0x5
	.uleb128 0x49f
	.long	.LASF2192
	.byte	0x5
	.uleb128 0x4a0
	.long	.LASF2193
	.byte	0x5
	.uleb128 0x4a1
	.long	.LASF2194
	.byte	0x5
	.uleb128 0x4a2
	.long	.LASF2195
	.byte	0x5
	.uleb128 0x4a3
	.long	.LASF2196
	.byte	0x5
	.uleb128 0x4a4
	.long	.LASF2197
	.byte	0x5
	.uleb128 0x4a5
	.long	.LASF2198
	.byte	0x5
	.uleb128 0x4a6
	.long	.LASF2199
	.byte	0x5
	.uleb128 0x4a7
	.long	.LASF2200
	.byte	0x5
	.uleb128 0x4aa
	.long	.LASF2201
	.byte	0x5
	.uleb128 0x4ab
	.long	.LASF2202
	.byte	0x5
	.uleb128 0x4ad
	.long	.LASF2203
	.byte	0x5
	.uleb128 0x4ae
	.long	.LASF2204
	.byte	0x5
	.uleb128 0x4c3
	.long	.LASF2205
	.byte	0x5
	.uleb128 0x4c5
	.long	.LASF2206
	.byte	0x5
	.uleb128 0x4c6
	.long	.LASF2207
	.byte	0x5
	.uleb128 0x4c7
	.long	.LASF2208
	.byte	0x5
	.uleb128 0x4c9
	.long	.LASF2209
	.byte	0x5
	.uleb128 0x4ca
	.long	.LASF2210
	.byte	0x5
	.uleb128 0x4cb
	.long	.LASF2211
	.byte	0x5
	.uleb128 0x4cc
	.long	.LASF2212
	.byte	0x5
	.uleb128 0x4ce
	.long	.LASF2213
	.byte	0x5
	.uleb128 0x4cf
	.long	.LASF2214
	.byte	0x5
	.uleb128 0x4d0
	.long	.LASF2215
	.byte	0x5
	.uleb128 0x4d3
	.long	.LASF2216
	.byte	0x5
	.uleb128 0x4d6
	.long	.LASF2217
	.byte	0x5
	.uleb128 0x4d7
	.long	.LASF2218
	.byte	0x5
	.uleb128 0x4dc
	.long	.LASF2219
	.byte	0x5
	.uleb128 0x4dd
	.long	.LASF2220
	.byte	0x5
	.uleb128 0x4e3
	.long	.LASF2221
	.byte	0x5
	.uleb128 0x4e4
	.long	.LASF2222
	.byte	0x5
	.uleb128 0x4e5
	.long	.LASF2223
	.byte	0x5
	.uleb128 0x4e6
	.long	.LASF2224
	.byte	0x5
	.uleb128 0x4e7
	.long	.LASF2225
	.byte	0x5
	.uleb128 0x4e8
	.long	.LASF2226
	.byte	0x5
	.uleb128 0x4e9
	.long	.LASF2227
	.byte	0x5
	.uleb128 0x4ea
	.long	.LASF2228
	.byte	0x5
	.uleb128 0x4eb
	.long	.LASF2229
	.byte	0x5
	.uleb128 0x4ec
	.long	.LASF2230
	.byte	0x5
	.uleb128 0x4ed
	.long	.LASF2231
	.byte	0x5
	.uleb128 0x4ee
	.long	.LASF2232
	.byte	0x5
	.uleb128 0x4ef
	.long	.LASF2233
	.byte	0x5
	.uleb128 0x4f0
	.long	.LASF2234
	.byte	0x5
	.uleb128 0x4f1
	.long	.LASF2235
	.byte	0x5
	.uleb128 0x4f2
	.long	.LASF2236
	.byte	0x5
	.uleb128 0x4f3
	.long	.LASF2237
	.byte	0x5
	.uleb128 0x4f4
	.long	.LASF2238
	.byte	0x5
	.uleb128 0x4f5
	.long	.LASF2239
	.byte	0x5
	.uleb128 0x4f6
	.long	.LASF2240
	.byte	0x5
	.uleb128 0x4f7
	.long	.LASF2241
	.byte	0x5
	.uleb128 0x4f8
	.long	.LASF2242
	.byte	0x5
	.uleb128 0x4f9
	.long	.LASF2243
	.byte	0x5
	.uleb128 0x4fa
	.long	.LASF2244
	.byte	0x5
	.uleb128 0x4fb
	.long	.LASF2245
	.byte	0x5
	.uleb128 0x4fc
	.long	.LASF2246
	.byte	0x5
	.uleb128 0x4fd
	.long	.LASF2247
	.byte	0x5
	.uleb128 0x4fe
	.long	.LASF2248
	.byte	0x5
	.uleb128 0x4ff
	.long	.LASF2249
	.byte	0x5
	.uleb128 0x500
	.long	.LASF2250
	.byte	0x5
	.uleb128 0x501
	.long	.LASF2251
	.byte	0x5
	.uleb128 0x502
	.long	.LASF2252
	.byte	0x5
	.uleb128 0x503
	.long	.LASF2253
	.byte	0x5
	.uleb128 0x504
	.long	.LASF2254
	.byte	0x5
	.uleb128 0x505
	.long	.LASF2255
	.byte	0x5
	.uleb128 0x506
	.long	.LASF2256
	.byte	0x5
	.uleb128 0x507
	.long	.LASF2257
	.byte	0x5
	.uleb128 0x508
	.long	.LASF2258
	.byte	0x5
	.uleb128 0x509
	.long	.LASF2259
	.byte	0x5
	.uleb128 0x50a
	.long	.LASF2260
	.byte	0x5
	.uleb128 0x50b
	.long	.LASF2261
	.byte	0x5
	.uleb128 0x50c
	.long	.LASF2262
	.byte	0x5
	.uleb128 0x50d
	.long	.LASF2263
	.byte	0x5
	.uleb128 0x50e
	.long	.LASF2264
	.byte	0x5
	.uleb128 0x514
	.long	.LASF2265
	.byte	0x5
	.uleb128 0x515
	.long	.LASF2266
	.byte	0x5
	.uleb128 0x516
	.long	.LASF2267
	.byte	0x5
	.uleb128 0x517
	.long	.LASF2268
	.byte	0x5
	.uleb128 0x518
	.long	.LASF2269
	.byte	0x5
	.uleb128 0x519
	.long	.LASF2270
	.byte	0x5
	.uleb128 0x51a
	.long	.LASF2271
	.byte	0x5
	.uleb128 0x51b
	.long	.LASF2272
	.byte	0x5
	.uleb128 0x51c
	.long	.LASF2273
	.byte	0x5
	.uleb128 0x51d
	.long	.LASF2274
	.byte	0x5
	.uleb128 0x51e
	.long	.LASF2275
	.byte	0x5
	.uleb128 0x51f
	.long	.LASF2276
	.byte	0x5
	.uleb128 0x520
	.long	.LASF2277
	.byte	0x5
	.uleb128 0x521
	.long	.LASF2278
	.byte	0x5
	.uleb128 0x522
	.long	.LASF2279
	.byte	0x5
	.uleb128 0x523
	.long	.LASF2280
	.byte	0x5
	.uleb128 0x524
	.long	.LASF2281
	.byte	0x5
	.uleb128 0x525
	.long	.LASF2282
	.byte	0x5
	.uleb128 0x526
	.long	.LASF2283
	.byte	0x5
	.uleb128 0x527
	.long	.LASF2284
	.byte	0x5
	.uleb128 0x529
	.long	.LASF2285
	.byte	0x5
	.uleb128 0x52a
	.long	.LASF2286
	.byte	0x5
	.uleb128 0x52b
	.long	.LASF2287
	.byte	0x5
	.uleb128 0x52c
	.long	.LASF2288
	.byte	0x5
	.uleb128 0x52d
	.long	.LASF2289
	.byte	0x5
	.uleb128 0x52e
	.long	.LASF2290
	.byte	0x5
	.uleb128 0x52f
	.long	.LASF2291
	.byte	0x5
	.uleb128 0x530
	.long	.LASF2292
	.byte	0x5
	.uleb128 0x531
	.long	.LASF2293
	.byte	0x5
	.uleb128 0x532
	.long	.LASF2294
	.byte	0x5
	.uleb128 0x533
	.long	.LASF2295
	.byte	0x5
	.uleb128 0x534
	.long	.LASF2296
	.byte	0x5
	.uleb128 0x535
	.long	.LASF2297
	.byte	0x5
	.uleb128 0x536
	.long	.LASF2298
	.byte	0x5
	.uleb128 0x537
	.long	.LASF2299
	.byte	0x5
	.uleb128 0x538
	.long	.LASF2300
	.byte	0x5
	.uleb128 0x539
	.long	.LASF2301
	.byte	0x5
	.uleb128 0x53a
	.long	.LASF2302
	.byte	0x5
	.uleb128 0x53b
	.long	.LASF2303
	.byte	0x5
	.uleb128 0x53c
	.long	.LASF2304
	.byte	0x5
	.uleb128 0x542
	.long	.LASF2305
	.byte	0x5
	.uleb128 0x545
	.long	.LASF2306
	.byte	0x5
	.uleb128 0x546
	.long	.LASF2307
	.byte	0x5
	.uleb128 0x589
	.long	.LASF2308
	.byte	0x5
	.uleb128 0x58a
	.long	.LASF2309
	.byte	0x5
	.uleb128 0x58b
	.long	.LASF2310
	.byte	0x5
	.uleb128 0x58c
	.long	.LASF2311
	.byte	0x5
	.uleb128 0x58d
	.long	.LASF2312
	.byte	0x5
	.uleb128 0x58e
	.long	.LASF2313
	.byte	0x5
	.uleb128 0x58f
	.long	.LASF2314
	.byte	0x5
	.uleb128 0x590
	.long	.LASF2315
	.byte	0x5
	.uleb128 0x591
	.long	.LASF2316
	.byte	0x5
	.uleb128 0x592
	.long	.LASF2317
	.byte	0x5
	.uleb128 0x593
	.long	.LASF2318
	.byte	0x5
	.uleb128 0x594
	.long	.LASF2319
	.byte	0x5
	.uleb128 0x595
	.long	.LASF2320
	.byte	0x5
	.uleb128 0x596
	.long	.LASF2321
	.byte	0x5
	.uleb128 0x597
	.long	.LASF2322
	.byte	0x5
	.uleb128 0x59f
	.long	.LASF2323
	.byte	0x5
	.uleb128 0x5de
	.long	.LASF2324
	.byte	0x5
	.uleb128 0x5df
	.long	.LASF2325
	.byte	0x5
	.uleb128 0x5e0
	.long	.LASF2326
	.byte	0x5
	.uleb128 0x5e1
	.long	.LASF2327
	.byte	0x5
	.uleb128 0x5e2
	.long	.LASF2328
	.byte	0x5
	.uleb128 0x5e6
	.long	.LASF2329
	.byte	0x5
	.uleb128 0x5e7
	.long	.LASF2330
	.byte	0x5
	.uleb128 0x5e8
	.long	.LASF2331
	.byte	0x5
	.uleb128 0x5e9
	.long	.LASF2332
	.byte	0x5
	.uleb128 0x5ea
	.long	.LASF2333
	.byte	0x5
	.uleb128 0x5eb
	.long	.LASF2334
	.byte	0x5
	.uleb128 0x5ec
	.long	.LASF2335
	.byte	0x5
	.uleb128 0x5ed
	.long	.LASF2336
	.byte	0x5
	.uleb128 0x5ee
	.long	.LASF2337
	.byte	0x5
	.uleb128 0x5ef
	.long	.LASF2338
	.byte	0x5
	.uleb128 0x5f0
	.long	.LASF2339
	.byte	0x5
	.uleb128 0x5f1
	.long	.LASF2340
	.byte	0x5
	.uleb128 0x5f2
	.long	.LASF2341
	.byte	0x5
	.uleb128 0x5f3
	.long	.LASF2342
	.byte	0x5
	.uleb128 0x5f4
	.long	.LASF2343
	.byte	0x5
	.uleb128 0x5f5
	.long	.LASF2344
	.byte	0x5
	.uleb128 0x5f6
	.long	.LASF2345
	.byte	0x5
	.uleb128 0x5f7
	.long	.LASF2346
	.byte	0x5
	.uleb128 0x5f8
	.long	.LASF2347
	.byte	0x5
	.uleb128 0x5f9
	.long	.LASF2348
	.byte	0x5
	.uleb128 0x5fa
	.long	.LASF2349
	.byte	0x5
	.uleb128 0x5fb
	.long	.LASF2350
	.byte	0x5
	.uleb128 0x5fc
	.long	.LASF2351
	.byte	0x5
	.uleb128 0x5fd
	.long	.LASF2352
	.byte	0x5
	.uleb128 0x5fe
	.long	.LASF2353
	.byte	0x5
	.uleb128 0x5ff
	.long	.LASF2354
	.byte	0x5
	.uleb128 0x600
	.long	.LASF2355
	.byte	0x5
	.uleb128 0x601
	.long	.LASF2356
	.byte	0x5
	.uleb128 0x602
	.long	.LASF2357
	.byte	0x5
	.uleb128 0x603
	.long	.LASF2358
	.byte	0x5
	.uleb128 0x604
	.long	.LASF2359
	.byte	0x5
	.uleb128 0x605
	.long	.LASF2360
	.byte	0x5
	.uleb128 0x606
	.long	.LASF2361
	.byte	0x5
	.uleb128 0x607
	.long	.LASF2362
	.byte	0x5
	.uleb128 0x608
	.long	.LASF2363
	.byte	0x5
	.uleb128 0x609
	.long	.LASF2364
	.byte	0x5
	.uleb128 0x60a
	.long	.LASF2365
	.byte	0x5
	.uleb128 0x60b
	.long	.LASF2366
	.byte	0x5
	.uleb128 0x60c
	.long	.LASF2367
	.byte	0x5
	.uleb128 0x60d
	.long	.LASF2368
	.byte	0x5
	.uleb128 0x60e
	.long	.LASF2369
	.byte	0x5
	.uleb128 0x60f
	.long	.LASF2370
	.byte	0x5
	.uleb128 0x610
	.long	.LASF2371
	.byte	0x5
	.uleb128 0x611
	.long	.LASF2372
	.byte	0x5
	.uleb128 0x612
	.long	.LASF2373
	.byte	0x5
	.uleb128 0x613
	.long	.LASF2374
	.byte	0x5
	.uleb128 0x614
	.long	.LASF2375
	.byte	0x5
	.uleb128 0x615
	.long	.LASF2376
	.byte	0x5
	.uleb128 0x616
	.long	.LASF2377
	.byte	0x5
	.uleb128 0x617
	.long	.LASF2378
	.byte	0x5
	.uleb128 0x618
	.long	.LASF2379
	.byte	0x5
	.uleb128 0x619
	.long	.LASF2380
	.byte	0x5
	.uleb128 0x61a
	.long	.LASF2381
	.byte	0x5
	.uleb128 0x61b
	.long	.LASF2382
	.byte	0x5
	.uleb128 0x61c
	.long	.LASF2383
	.byte	0x5
	.uleb128 0x61d
	.long	.LASF2384
	.byte	0x5
	.uleb128 0x61e
	.long	.LASF2385
	.byte	0x5
	.uleb128 0x61f
	.long	.LASF2386
	.byte	0x5
	.uleb128 0x620
	.long	.LASF2387
	.byte	0x5
	.uleb128 0x621
	.long	.LASF2388
	.byte	0x5
	.uleb128 0x622
	.long	.LASF2389
	.byte	0x5
	.uleb128 0x623
	.long	.LASF2390
	.byte	0x5
	.uleb128 0x624
	.long	.LASF2391
	.byte	0x5
	.uleb128 0x625
	.long	.LASF2392
	.byte	0x5
	.uleb128 0x626
	.long	.LASF2393
	.byte	0x5
	.uleb128 0x627
	.long	.LASF2394
	.byte	0x5
	.uleb128 0x628
	.long	.LASF2395
	.byte	0x5
	.uleb128 0x629
	.long	.LASF2396
	.byte	0x5
	.uleb128 0x62a
	.long	.LASF2397
	.byte	0x5
	.uleb128 0x62b
	.long	.LASF2398
	.byte	0x5
	.uleb128 0x62c
	.long	.LASF2399
	.byte	0x5
	.uleb128 0x62d
	.long	.LASF2400
	.byte	0x5
	.uleb128 0x62e
	.long	.LASF2401
	.byte	0x5
	.uleb128 0x62f
	.long	.LASF2402
	.byte	0x5
	.uleb128 0x630
	.long	.LASF2403
	.byte	0x5
	.uleb128 0x631
	.long	.LASF2404
	.byte	0x5
	.uleb128 0x632
	.long	.LASF2405
	.byte	0x5
	.uleb128 0x633
	.long	.LASF2406
	.byte	0x5
	.uleb128 0x634
	.long	.LASF2407
	.byte	0x5
	.uleb128 0x635
	.long	.LASF2408
	.byte	0x5
	.uleb128 0x636
	.long	.LASF2409
	.byte	0x5
	.uleb128 0x637
	.long	.LASF2410
	.byte	0x5
	.uleb128 0x638
	.long	.LASF2411
	.byte	0x5
	.uleb128 0x639
	.long	.LASF2412
	.byte	0x5
	.uleb128 0x63a
	.long	.LASF2413
	.byte	0x5
	.uleb128 0x63b
	.long	.LASF2414
	.byte	0x5
	.uleb128 0x63c
	.long	.LASF2415
	.byte	0x5
	.uleb128 0x63d
	.long	.LASF2416
	.byte	0x5
	.uleb128 0x640
	.long	.LASF2417
	.byte	0x5
	.uleb128 0x643
	.long	.LASF2418
	.byte	0x5
	.uleb128 0x64a
	.long	.LASF2419
	.byte	0x5
	.uleb128 0x788
	.long	.LASF2420
	.byte	0x5
	.uleb128 0x78d
	.long	.LASF2421
	.byte	0x5
	.uleb128 0x78e
	.long	.LASF2422
	.byte	0x5
	.uleb128 0x78f
	.long	.LASF2423
	.byte	0x5
	.uleb128 0x790
	.long	.LASF2424
	.byte	0x5
	.uleb128 0x791
	.long	.LASF2425
	.byte	0x5
	.uleb128 0x792
	.long	.LASF2426
	.byte	0x5
	.uleb128 0x795
	.long	.LASF2427
	.byte	0x5
	.uleb128 0x796
	.long	.LASF2428
	.byte	0x5
	.uleb128 0x797
	.long	.LASF2429
	.byte	0x5
	.uleb128 0x798
	.long	.LASF2430
	.byte	0x5
	.uleb128 0x799
	.long	.LASF2431
	.byte	0x5
	.uleb128 0x79b
	.long	.LASF2432
	.byte	0x5
	.uleb128 0x79c
	.long	.LASF2433
	.byte	0x5
	.uleb128 0x79d
	.long	.LASF2434
	.byte	0x5
	.uleb128 0x79e
	.long	.LASF2435
	.byte	0x5
	.uleb128 0x79f
	.long	.LASF2436
	.byte	0x5
	.uleb128 0x7a1
	.long	.LASF2437
	.byte	0x5
	.uleb128 0x7a2
	.long	.LASF2438
	.byte	0x5
	.uleb128 0x7a3
	.long	.LASF2439
	.byte	0x5
	.uleb128 0x7a4
	.long	.LASF2440
	.byte	0x5
	.uleb128 0x7a5
	.long	.LASF2441
	.byte	0x5
	.uleb128 0x7a7
	.long	.LASF2442
	.byte	0x5
	.uleb128 0x7a8
	.long	.LASF2443
	.byte	0x5
	.uleb128 0x7a9
	.long	.LASF2444
	.byte	0x5
	.uleb128 0x7aa
	.long	.LASF2445
	.byte	0x5
	.uleb128 0x7ab
	.long	.LASF2446
	.byte	0x5
	.uleb128 0x7b3
	.long	.LASF2447
	.byte	0x5
	.uleb128 0x7b4
	.long	.LASF2448
	.byte	0x5
	.uleb128 0x7b5
	.long	.LASF2449
	.byte	0x5
	.uleb128 0x7b6
	.long	.LASF2450
	.byte	0x5
	.uleb128 0x7b7
	.long	.LASF2451
	.byte	0x5
	.uleb128 0x7b9
	.long	.LASF2452
	.byte	0x5
	.uleb128 0x7ba
	.long	.LASF2453
	.byte	0x5
	.uleb128 0x7bb
	.long	.LASF2454
	.byte	0x5
	.uleb128 0x7bc
	.long	.LASF2455
	.byte	0x5
	.uleb128 0x7cc
	.long	.LASF2456
	.byte	0x5
	.uleb128 0x7cf
	.long	.LASF2457
	.byte	0x5
	.uleb128 0x7d0
	.long	.LASF2458
	.byte	0x5
	.uleb128 0x7d1
	.long	.LASF2459
	.byte	0x5
	.uleb128 0x7d2
	.long	.LASF2460
	.byte	0x5
	.uleb128 0x7d3
	.long	.LASF2461
	.byte	0x5
	.uleb128 0x7d4
	.long	.LASF2462
	.byte	0x5
	.uleb128 0x7f0
	.long	.LASF2463
	.byte	0x5
	.uleb128 0x80b
	.long	.LASF2464
	.byte	0x5
	.uleb128 0x80c
	.long	.LASF2465
	.byte	0x5
	.uleb128 0x812
	.long	.LASF2466
	.byte	0x5
	.uleb128 0x813
	.long	.LASF2467
	.byte	0x5
	.uleb128 0x814
	.long	.LASF2468
	.byte	0x5
	.uleb128 0x815
	.long	.LASF2469
	.byte	0x5
	.uleb128 0x816
	.long	.LASF2470
	.byte	0x5
	.uleb128 0x817
	.long	.LASF2471
	.byte	0x5
	.uleb128 0x818
	.long	.LASF2472
	.byte	0x5
	.uleb128 0x819
	.long	.LASF2473
	.byte	0x5
	.uleb128 0x81a
	.long	.LASF2474
	.byte	0x5
	.uleb128 0x81b
	.long	.LASF2475
	.byte	0x5
	.uleb128 0x81c
	.long	.LASF2476
	.byte	0x5
	.uleb128 0x81d
	.long	.LASF2477
	.byte	0x5
	.uleb128 0x81e
	.long	.LASF2478
	.byte	0x5
	.uleb128 0x81f
	.long	.LASF2479
	.byte	0x5
	.uleb128 0x820
	.long	.LASF2480
	.byte	0x5
	.uleb128 0x822
	.long	.LASF2481
	.byte	0x5
	.uleb128 0x823
	.long	.LASF2482
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.unctrl.h.46.c707778f5afc46808288a843c83a4633,comdat
.Ldebug_macro81:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF2483
	.byte	0x6
	.uleb128 0x30
	.long	.LASF1996
	.byte	0x5
	.uleb128 0x31
	.long	.LASF1997
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.cpumonlib.h.3.02eaf6afe85a1ee5acd07b0e880f112e,comdat
.Ldebug_macro82:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x3
	.long	.LASF2486
	.byte	0x5
	.uleb128 0x6
	.long	.LASF2487
	.byte	0x5
	.uleb128 0x7
	.long	.LASF2488
	.byte	0x5
	.uleb128 0x8
	.long	.LASF2489
	.byte	0x5
	.uleb128 0x9
	.long	.LASF2490
	.byte	0x5
	.uleb128 0xa
	.long	.LASF2491
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.machine_specific_registers.h.3.d2e1d0b1ada7d991f2dcf44fe45b2999,comdat
.Ldebug_macro83:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x3
	.long	.LASF2492
	.byte	0x5
	.uleb128 0x5
	.long	.LASF2493
	.byte	0x5
	.uleb128 0x6
	.long	.LASF2491
	.byte	0x5
	.uleb128 0xa
	.long	.LASF2494
	.byte	0x5
	.uleb128 0xb
	.long	.LASF2495
	.byte	0x5
	.uleb128 0xc
	.long	.LASF2496
	.byte	0x5
	.uleb128 0xd
	.long	.LASF2497
	.byte	0x5
	.uleb128 0xe
	.long	.LASF2498
	.byte	0x5
	.uleb128 0xf
	.long	.LASF2499
	.byte	0x5
	.uleb128 0x11
	.long	.LASF2500
	.byte	0x5
	.uleb128 0x12
	.long	.LASF2501
	.byte	0x5
	.uleb128 0x13
	.long	.LASF2502
	.byte	0x5
	.uleb128 0x15
	.long	.LASF2503
	.byte	0x5
	.uleb128 0x16
	.long	.LASF2504
	.byte	0x5
	.uleb128 0x17
	.long	.LASF2505
	.byte	0x5
	.uleb128 0x18
	.long	.LASF2506
	.byte	0x5
	.uleb128 0x19
	.long	.LASF2507
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF2508
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF2509
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF2510
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF2511
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF2512
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF2513
	.byte	0x5
	.uleb128 0x20
	.long	.LASF2514
	.byte	0x5
	.uleb128 0x22
	.long	.LASF2515
	.byte	0x5
	.uleb128 0x24
	.long	.LASF2516
	.byte	0x5
	.uleb128 0x29
	.long	.LASF2517
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF2518
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF2519
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF2520
	.byte	0x5
	.uleb128 0x30
	.long	.LASF2521
	.byte	0x5
	.uleb128 0x31
	.long	.LASF2522
	.byte	0x5
	.uleb128 0x32
	.long	.LASF2523
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.unistd.h.3.07fa498113c35e37966156c8d3da3918,comdat
.Ldebug_macro84:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x3
	.long	.LASF2525
	.byte	0x5
	.uleb128 0xd
	.long	.LASF2526
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.unistd_64.h.2.1d5f5ffe681b35c1e3b9a6eaccfb5b61,comdat
.Ldebug_macro85:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x2
	.long	.LASF2527
	.byte	0x5
	.uleb128 0x4
	.long	.LASF2528
	.byte	0x5
	.uleb128 0x5
	.long	.LASF2529
	.byte	0x5
	.uleb128 0x6
	.long	.LASF2530
	.byte	0x5
	.uleb128 0x7
	.long	.LASF2531
	.byte	0x5
	.uleb128 0x8
	.long	.LASF2532
	.byte	0x5
	.uleb128 0x9
	.long	.LASF2533
	.byte	0x5
	.uleb128 0xa
	.long	.LASF2534
	.byte	0x5
	.uleb128 0xb
	.long	.LASF2535
	.byte	0x5
	.uleb128 0xc
	.long	.LASF2536
	.byte	0x5
	.uleb128 0xd
	.long	.LASF2537
	.byte	0x5
	.uleb128 0xe
	.long	.LASF2538
	.byte	0x5
	.uleb128 0xf
	.long	.LASF2539
	.byte	0x5
	.uleb128 0x10
	.long	.LASF2540
	.byte	0x5
	.uleb128 0x11
	.long	.LASF2541
	.byte	0x5
	.uleb128 0x12
	.long	.LASF2542
	.byte	0x5
	.uleb128 0x13
	.long	.LASF2543
	.byte	0x5
	.uleb128 0x14
	.long	.LASF2544
	.byte	0x5
	.uleb128 0x15
	.long	.LASF2545
	.byte	0x5
	.uleb128 0x16
	.long	.LASF2546
	.byte	0x5
	.uleb128 0x17
	.long	.LASF2547
	.byte	0x5
	.uleb128 0x18
	.long	.LASF2548
	.byte	0x5
	.uleb128 0x19
	.long	.LASF2549
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF2550
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF2551
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF2552
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF2553
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF2554
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF2555
	.byte	0x5
	.uleb128 0x20
	.long	.LASF2556
	.byte	0x5
	.uleb128 0x21
	.long	.LASF2557
	.byte	0x5
	.uleb128 0x22
	.long	.LASF2558
	.byte	0x5
	.uleb128 0x23
	.long	.LASF2559
	.byte	0x5
	.uleb128 0x24
	.long	.LASF2560
	.byte	0x5
	.uleb128 0x25
	.long	.LASF2561
	.byte	0x5
	.uleb128 0x26
	.long	.LASF2562
	.byte	0x5
	.uleb128 0x27
	.long	.LASF2563
	.byte	0x5
	.uleb128 0x28
	.long	.LASF2564
	.byte	0x5
	.uleb128 0x29
	.long	.LASF2565
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF2566
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF2567
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF2568
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF2569
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF2570
	.byte	0x5
	.uleb128 0x2f
	.long	.LASF2571
	.byte	0x5
	.uleb128 0x30
	.long	.LASF2572
	.byte	0x5
	.uleb128 0x31
	.long	.LASF2573
	.byte	0x5
	.uleb128 0x32
	.long	.LASF2574
	.byte	0x5
	.uleb128 0x33
	.long	.LASF2575
	.byte	0x5
	.uleb128 0x34
	.long	.LASF2576
	.byte	0x5
	.uleb128 0x35
	.long	.LASF2577
	.byte	0x5
	.uleb128 0x36
	.long	.LASF2578
	.byte	0x5
	.uleb128 0x37
	.long	.LASF2579
	.byte	0x5
	.uleb128 0x38
	.long	.LASF2580
	.byte	0x5
	.uleb128 0x39
	.long	.LASF2581
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF2582
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF2583
	.byte	0x5
	.uleb128 0x3c
	.long	.LASF2584
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF2585
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF2586
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF2587
	.byte	0x5
	.uleb128 0x40
	.long	.LASF2588
	.byte	0x5
	.uleb128 0x41
	.long	.LASF2589
	.byte	0x5
	.uleb128 0x42
	.long	.LASF2590
	.byte	0x5
	.uleb128 0x43
	.long	.LASF2591
	.byte	0x5
	.uleb128 0x44
	.long	.LASF2592
	.byte	0x5
	.uleb128 0x45
	.long	.LASF2593
	.byte	0x5
	.uleb128 0x46
	.long	.LASF2594
	.byte	0x5
	.uleb128 0x47
	.long	.LASF2595
	.byte	0x5
	.uleb128 0x48
	.long	.LASF2596
	.byte	0x5
	.uleb128 0x49
	.long	.LASF2597
	.byte	0x5
	.uleb128 0x4a
	.long	.LASF2598
	.byte	0x5
	.uleb128 0x4b
	.long	.LASF2599
	.byte	0x5
	.uleb128 0x4c
	.long	.LASF2600
	.byte	0x5
	.uleb128 0x4d
	.long	.LASF2601
	.byte	0x5
	.uleb128 0x4e
	.long	.LASF2602
	.byte	0x5
	.uleb128 0x4f
	.long	.LASF2603
	.byte	0x5
	.uleb128 0x50
	.long	.LASF2604
	.byte	0x5
	.uleb128 0x51
	.long	.LASF2605
	.byte	0x5
	.uleb128 0x52
	.long	.LASF2606
	.byte	0x5
	.uleb128 0x53
	.long	.LASF2607
	.byte	0x5
	.uleb128 0x54
	.long	.LASF2608
	.byte	0x5
	.uleb128 0x55
	.long	.LASF2609
	.byte	0x5
	.uleb128 0x56
	.long	.LASF2610
	.byte	0x5
	.uleb128 0x57
	.long	.LASF2611
	.byte	0x5
	.uleb128 0x58
	.long	.LASF2612
	.byte	0x5
	.uleb128 0x59
	.long	.LASF2613
	.byte	0x5
	.uleb128 0x5a
	.long	.LASF2614
	.byte	0x5
	.uleb128 0x5b
	.long	.LASF2615
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF2616
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF2617
	.byte	0x5
	.uleb128 0x5e
	.long	.LASF2618
	.byte	0x5
	.uleb128 0x5f
	.long	.LASF2619
	.byte	0x5
	.uleb128 0x60
	.long	.LASF2620
	.byte	0x5
	.uleb128 0x61
	.long	.LASF2621
	.byte	0x5
	.uleb128 0x62
	.long	.LASF2622
	.byte	0x5
	.uleb128 0x63
	.long	.LASF2623
	.byte	0x5
	.uleb128 0x64
	.long	.LASF2624
	.byte	0x5
	.uleb128 0x65
	.long	.LASF2625
	.byte	0x5
	.uleb128 0x66
	.long	.LASF2626
	.byte	0x5
	.uleb128 0x67
	.long	.LASF2627
	.byte	0x5
	.uleb128 0x68
	.long	.LASF2628
	.byte	0x5
	.uleb128 0x69
	.long	.LASF2629
	.byte	0x5
	.uleb128 0x6a
	.long	.LASF2630
	.byte	0x5
	.uleb128 0x6b
	.long	.LASF2631
	.byte	0x5
	.uleb128 0x6c
	.long	.LASF2632
	.byte	0x5
	.uleb128 0x6d
	.long	.LASF2633
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF2634
	.byte	0x5
	.uleb128 0x6f
	.long	.LASF2635
	.byte	0x5
	.uleb128 0x70
	.long	.LASF2636
	.byte	0x5
	.uleb128 0x71
	.long	.LASF2637
	.byte	0x5
	.uleb128 0x72
	.long	.LASF2638
	.byte	0x5
	.uleb128 0x73
	.long	.LASF2639
	.byte	0x5
	.uleb128 0x74
	.long	.LASF2640
	.byte	0x5
	.uleb128 0x75
	.long	.LASF2641
	.byte	0x5
	.uleb128 0x76
	.long	.LASF2642
	.byte	0x5
	.uleb128 0x77
	.long	.LASF2643
	.byte	0x5
	.uleb128 0x78
	.long	.LASF2644
	.byte	0x5
	.uleb128 0x79
	.long	.LASF2645
	.byte	0x5
	.uleb128 0x7a
	.long	.LASF2646
	.byte	0x5
	.uleb128 0x7b
	.long	.LASF2647
	.byte	0x5
	.uleb128 0x7c
	.long	.LASF2648
	.byte	0x5
	.uleb128 0x7d
	.long	.LASF2649
	.byte	0x5
	.uleb128 0x7e
	.long	.LASF2650
	.byte	0x5
	.uleb128 0x7f
	.long	.LASF2651
	.byte	0x5
	.uleb128 0x80
	.long	.LASF2652
	.byte	0x5
	.uleb128 0x81
	.long	.LASF2653
	.byte	0x5
	.uleb128 0x82
	.long	.LASF2654
	.byte	0x5
	.uleb128 0x83
	.long	.LASF2655
	.byte	0x5
	.uleb128 0x84
	.long	.LASF2656
	.byte	0x5
	.uleb128 0x85
	.long	.LASF2657
	.byte	0x5
	.uleb128 0x86
	.long	.LASF2658
	.byte	0x5
	.uleb128 0x87
	.long	.LASF2659
	.byte	0x5
	.uleb128 0x88
	.long	.LASF2660
	.byte	0x5
	.uleb128 0x89
	.long	.LASF2661
	.byte	0x5
	.uleb128 0x8a
	.long	.LASF2662
	.byte	0x5
	.uleb128 0x8b
	.long	.LASF2663
	.byte	0x5
	.uleb128 0x8c
	.long	.LASF2664
	.byte	0x5
	.uleb128 0x8d
	.long	.LASF2665
	.byte	0x5
	.uleb128 0x8e
	.long	.LASF2666
	.byte	0x5
	.uleb128 0x8f
	.long	.LASF2667
	.byte	0x5
	.uleb128 0x90
	.long	.LASF2668
	.byte	0x5
	.uleb128 0x91
	.long	.LASF2669
	.byte	0x5
	.uleb128 0x92
	.long	.LASF2670
	.byte	0x5
	.uleb128 0x93
	.long	.LASF2671
	.byte	0x5
	.uleb128 0x94
	.long	.LASF2672
	.byte	0x5
	.uleb128 0x95
	.long	.LASF2673
	.byte	0x5
	.uleb128 0x96
	.long	.LASF2674
	.byte	0x5
	.uleb128 0x97
	.long	.LASF2675
	.byte	0x5
	.uleb128 0x98
	.long	.LASF2676
	.byte	0x5
	.uleb128 0x99
	.long	.LASF2677
	.byte	0x5
	.uleb128 0x9a
	.long	.LASF2678
	.byte	0x5
	.uleb128 0x9b
	.long	.LASF2679
	.byte	0x5
	.uleb128 0x9c
	.long	.LASF2680
	.byte	0x5
	.uleb128 0x9d
	.long	.LASF2681
	.byte	0x5
	.uleb128 0x9e
	.long	.LASF2682
	.byte	0x5
	.uleb128 0x9f
	.long	.LASF2683
	.byte	0x5
	.uleb128 0xa0
	.long	.LASF2684
	.byte	0x5
	.uleb128 0xa1
	.long	.LASF2685
	.byte	0x5
	.uleb128 0xa2
	.long	.LASF2686
	.byte	0x5
	.uleb128 0xa3
	.long	.LASF2687
	.byte	0x5
	.uleb128 0xa4
	.long	.LASF2688
	.byte	0x5
	.uleb128 0xa5
	.long	.LASF2689
	.byte	0x5
	.uleb128 0xa6
	.long	.LASF2690
	.byte	0x5
	.uleb128 0xa7
	.long	.LASF2691
	.byte	0x5
	.uleb128 0xa8
	.long	.LASF2692
	.byte	0x5
	.uleb128 0xa9
	.long	.LASF2693
	.byte	0x5
	.uleb128 0xaa
	.long	.LASF2694
	.byte	0x5
	.uleb128 0xab
	.long	.LASF2695
	.byte	0x5
	.uleb128 0xac
	.long	.LASF2696
	.byte	0x5
	.uleb128 0xad
	.long	.LASF2697
	.byte	0x5
	.uleb128 0xae
	.long	.LASF2698
	.byte	0x5
	.uleb128 0xaf
	.long	.LASF2699
	.byte	0x5
	.uleb128 0xb0
	.long	.LASF2700
	.byte	0x5
	.uleb128 0xb1
	.long	.LASF2701
	.byte	0x5
	.uleb128 0xb2
	.long	.LASF2702
	.byte	0x5
	.uleb128 0xb3
	.long	.LASF2703
	.byte	0x5
	.uleb128 0xb4
	.long	.LASF2704
	.byte	0x5
	.uleb128 0xb5
	.long	.LASF2705
	.byte	0x5
	.uleb128 0xb6
	.long	.LASF2706
	.byte	0x5
	.uleb128 0xb7
	.long	.LASF2707
	.byte	0x5
	.uleb128 0xb8
	.long	.LASF2708
	.byte	0x5
	.uleb128 0xb9
	.long	.LASF2709
	.byte	0x5
	.uleb128 0xba
	.long	.LASF2710
	.byte	0x5
	.uleb128 0xbb
	.long	.LASF2711
	.byte	0x5
	.uleb128 0xbc
	.long	.LASF2712
	.byte	0x5
	.uleb128 0xbd
	.long	.LASF2713
	.byte	0x5
	.uleb128 0xbe
	.long	.LASF2714
	.byte	0x5
	.uleb128 0xbf
	.long	.LASF2715
	.byte	0x5
	.uleb128 0xc0
	.long	.LASF2716
	.byte	0x5
	.uleb128 0xc1
	.long	.LASF2717
	.byte	0x5
	.uleb128 0xc2
	.long	.LASF2718
	.byte	0x5
	.uleb128 0xc3
	.long	.LASF2719
	.byte	0x5
	.uleb128 0xc4
	.long	.LASF2720
	.byte	0x5
	.uleb128 0xc5
	.long	.LASF2721
	.byte	0x5
	.uleb128 0xc6
	.long	.LASF2722
	.byte	0x5
	.uleb128 0xc7
	.long	.LASF2723
	.byte	0x5
	.uleb128 0xc8
	.long	.LASF2724
	.byte	0x5
	.uleb128 0xc9
	.long	.LASF2725
	.byte	0x5
	.uleb128 0xca
	.long	.LASF2726
	.byte	0x5
	.uleb128 0xcb
	.long	.LASF2727
	.byte	0x5
	.uleb128 0xcc
	.long	.LASF2728
	.byte	0x5
	.uleb128 0xcd
	.long	.LASF2729
	.byte	0x5
	.uleb128 0xce
	.long	.LASF2730
	.byte	0x5
	.uleb128 0xcf
	.long	.LASF2731
	.byte	0x5
	.uleb128 0xd0
	.long	.LASF2732
	.byte	0x5
	.uleb128 0xd1
	.long	.LASF2733
	.byte	0x5
	.uleb128 0xd2
	.long	.LASF2734
	.byte	0x5
	.uleb128 0xd3
	.long	.LASF2735
	.byte	0x5
	.uleb128 0xd4
	.long	.LASF2736
	.byte	0x5
	.uleb128 0xd5
	.long	.LASF2737
	.byte	0x5
	.uleb128 0xd6
	.long	.LASF2738
	.byte	0x5
	.uleb128 0xd7
	.long	.LASF2739
	.byte	0x5
	.uleb128 0xd8
	.long	.LASF2740
	.byte	0x5
	.uleb128 0xd9
	.long	.LASF2741
	.byte	0x5
	.uleb128 0xda
	.long	.LASF2742
	.byte	0x5
	.uleb128 0xdb
	.long	.LASF2743
	.byte	0x5
	.uleb128 0xdc
	.long	.LASF2744
	.byte	0x5
	.uleb128 0xdd
	.long	.LASF2745
	.byte	0x5
	.uleb128 0xde
	.long	.LASF2746
	.byte	0x5
	.uleb128 0xdf
	.long	.LASF2747
	.byte	0x5
	.uleb128 0xe0
	.long	.LASF2748
	.byte	0x5
	.uleb128 0xe1
	.long	.LASF2749
	.byte	0x5
	.uleb128 0xe2
	.long	.LASF2750
	.byte	0x5
	.uleb128 0xe3
	.long	.LASF2751
	.byte	0x5
	.uleb128 0xe4
	.long	.LASF2752
	.byte	0x5
	.uleb128 0xe5
	.long	.LASF2753
	.byte	0x5
	.uleb128 0xe6
	.long	.LASF2754
	.byte	0x5
	.uleb128 0xe7
	.long	.LASF2755
	.byte	0x5
	.uleb128 0xe8
	.long	.LASF2756
	.byte	0x5
	.uleb128 0xe9
	.long	.LASF2757
	.byte	0x5
	.uleb128 0xea
	.long	.LASF2758
	.byte	0x5
	.uleb128 0xeb
	.long	.LASF2759
	.byte	0x5
	.uleb128 0xec
	.long	.LASF2760
	.byte	0x5
	.uleb128 0xed
	.long	.LASF2761
	.byte	0x5
	.uleb128 0xee
	.long	.LASF2762
	.byte	0x5
	.uleb128 0xef
	.long	.LASF2763
	.byte	0x5
	.uleb128 0xf0
	.long	.LASF2764
	.byte	0x5
	.uleb128 0xf1
	.long	.LASF2765
	.byte	0x5
	.uleb128 0xf2
	.long	.LASF2766
	.byte	0x5
	.uleb128 0xf3
	.long	.LASF2767
	.byte	0x5
	.uleb128 0xf4
	.long	.LASF2768
	.byte	0x5
	.uleb128 0xf5
	.long	.LASF2769
	.byte	0x5
	.uleb128 0xf6
	.long	.LASF2770
	.byte	0x5
	.uleb128 0xf7
	.long	.LASF2771
	.byte	0x5
	.uleb128 0xf8
	.long	.LASF2772
	.byte	0x5
	.uleb128 0xf9
	.long	.LASF2773
	.byte	0x5
	.uleb128 0xfa
	.long	.LASF2774
	.byte	0x5
	.uleb128 0xfb
	.long	.LASF2775
	.byte	0x5
	.uleb128 0xfc
	.long	.LASF2776
	.byte	0x5
	.uleb128 0xfd
	.long	.LASF2777
	.byte	0x5
	.uleb128 0xfe
	.long	.LASF2778
	.byte	0x5
	.uleb128 0xff
	.long	.LASF2779
	.byte	0x5
	.uleb128 0x100
	.long	.LASF2780
	.byte	0x5
	.uleb128 0x101
	.long	.LASF2781
	.byte	0x5
	.uleb128 0x102
	.long	.LASF2782
	.byte	0x5
	.uleb128 0x103
	.long	.LASF2783
	.byte	0x5
	.uleb128 0x104
	.long	.LASF2784
	.byte	0x5
	.uleb128 0x105
	.long	.LASF2785
	.byte	0x5
	.uleb128 0x106
	.long	.LASF2786
	.byte	0x5
	.uleb128 0x107
	.long	.LASF2787
	.byte	0x5
	.uleb128 0x108
	.long	.LASF2788
	.byte	0x5
	.uleb128 0x109
	.long	.LASF2789
	.byte	0x5
	.uleb128 0x10a
	.long	.LASF2790
	.byte	0x5
	.uleb128 0x10b
	.long	.LASF2791
	.byte	0x5
	.uleb128 0x10c
	.long	.LASF2792
	.byte	0x5
	.uleb128 0x10d
	.long	.LASF2793
	.byte	0x5
	.uleb128 0x10e
	.long	.LASF2794
	.byte	0x5
	.uleb128 0x10f
	.long	.LASF2795
	.byte	0x5
	.uleb128 0x110
	.long	.LASF2796
	.byte	0x5
	.uleb128 0x111
	.long	.LASF2797
	.byte	0x5
	.uleb128 0x112
	.long	.LASF2798
	.byte	0x5
	.uleb128 0x113
	.long	.LASF2799
	.byte	0x5
	.uleb128 0x114
	.long	.LASF2800
	.byte	0x5
	.uleb128 0x115
	.long	.LASF2801
	.byte	0x5
	.uleb128 0x116
	.long	.LASF2802
	.byte	0x5
	.uleb128 0x117
	.long	.LASF2803
	.byte	0x5
	.uleb128 0x118
	.long	.LASF2804
	.byte	0x5
	.uleb128 0x119
	.long	.LASF2805
	.byte	0x5
	.uleb128 0x11a
	.long	.LASF2806
	.byte	0x5
	.uleb128 0x11b
	.long	.LASF2807
	.byte	0x5
	.uleb128 0x11c
	.long	.LASF2808
	.byte	0x5
	.uleb128 0x11d
	.long	.LASF2809
	.byte	0x5
	.uleb128 0x11e
	.long	.LASF2810
	.byte	0x5
	.uleb128 0x11f
	.long	.LASF2811
	.byte	0x5
	.uleb128 0x120
	.long	.LASF2812
	.byte	0x5
	.uleb128 0x121
	.long	.LASF2813
	.byte	0x5
	.uleb128 0x122
	.long	.LASF2814
	.byte	0x5
	.uleb128 0x123
	.long	.LASF2815
	.byte	0x5
	.uleb128 0x124
	.long	.LASF2816
	.byte	0x5
	.uleb128 0x125
	.long	.LASF2817
	.byte	0x5
	.uleb128 0x126
	.long	.LASF2818
	.byte	0x5
	.uleb128 0x127
	.long	.LASF2819
	.byte	0x5
	.uleb128 0x128
	.long	.LASF2820
	.byte	0x5
	.uleb128 0x129
	.long	.LASF2821
	.byte	0x5
	.uleb128 0x12a
	.long	.LASF2822
	.byte	0x5
	.uleb128 0x12b
	.long	.LASF2823
	.byte	0x5
	.uleb128 0x12c
	.long	.LASF2824
	.byte	0x5
	.uleb128 0x12d
	.long	.LASF2825
	.byte	0x5
	.uleb128 0x12e
	.long	.LASF2826
	.byte	0x5
	.uleb128 0x12f
	.long	.LASF2827
	.byte	0x5
	.uleb128 0x130
	.long	.LASF2828
	.byte	0x5
	.uleb128 0x131
	.long	.LASF2829
	.byte	0x5
	.uleb128 0x132
	.long	.LASF2830
	.byte	0x5
	.uleb128 0x133
	.long	.LASF2831
	.byte	0x5
	.uleb128 0x134
	.long	.LASF2832
	.byte	0x5
	.uleb128 0x135
	.long	.LASF2833
	.byte	0x5
	.uleb128 0x136
	.long	.LASF2834
	.byte	0x5
	.uleb128 0x137
	.long	.LASF2835
	.byte	0x5
	.uleb128 0x138
	.long	.LASF2836
	.byte	0x5
	.uleb128 0x139
	.long	.LASF2837
	.byte	0x5
	.uleb128 0x13a
	.long	.LASF2838
	.byte	0x5
	.uleb128 0x13b
	.long	.LASF2839
	.byte	0x5
	.uleb128 0x13c
	.long	.LASF2840
	.byte	0x5
	.uleb128 0x13d
	.long	.LASF2841
	.byte	0x5
	.uleb128 0x13e
	.long	.LASF2842
	.byte	0x5
	.uleb128 0x13f
	.long	.LASF2843
	.byte	0x5
	.uleb128 0x140
	.long	.LASF2844
	.byte	0x5
	.uleb128 0x141
	.long	.LASF2845
	.byte	0x5
	.uleb128 0x142
	.long	.LASF2846
	.byte	0x5
	.uleb128 0x143
	.long	.LASF2847
	.byte	0x5
	.uleb128 0x144
	.long	.LASF2848
	.byte	0x5
	.uleb128 0x145
	.long	.LASF2849
	.byte	0x5
	.uleb128 0x146
	.long	.LASF2850
	.byte	0x5
	.uleb128 0x147
	.long	.LASF2851
	.byte	0x5
	.uleb128 0x148
	.long	.LASF2852
	.byte	0x5
	.uleb128 0x149
	.long	.LASF2853
	.byte	0x5
	.uleb128 0x14a
	.long	.LASF2854
	.byte	0x5
	.uleb128 0x14b
	.long	.LASF2855
	.byte	0x5
	.uleb128 0x14c
	.long	.LASF2856
	.byte	0x5
	.uleb128 0x14d
	.long	.LASF2857
	.byte	0x5
	.uleb128 0x14e
	.long	.LASF2858
	.byte	0x5
	.uleb128 0x14f
	.long	.LASF2859
	.byte	0x5
	.uleb128 0x150
	.long	.LASF2860
	.byte	0x5
	.uleb128 0x151
	.long	.LASF2861
	.byte	0x5
	.uleb128 0x152
	.long	.LASF2862
	.byte	0x5
	.uleb128 0x153
	.long	.LASF2863
	.byte	0x5
	.uleb128 0x154
	.long	.LASF2864
	.byte	0x5
	.uleb128 0x155
	.long	.LASF2865
	.byte	0x5
	.uleb128 0x156
	.long	.LASF2866
	.byte	0x5
	.uleb128 0x157
	.long	.LASF2867
	.byte	0x5
	.uleb128 0x158
	.long	.LASF2868
	.byte	0x5
	.uleb128 0x159
	.long	.LASF2869
	.byte	0x5
	.uleb128 0x15a
	.long	.LASF2870
	.byte	0x5
	.uleb128 0x15b
	.long	.LASF2871
	.byte	0x5
	.uleb128 0x15c
	.long	.LASF2872
	.byte	0x5
	.uleb128 0x15d
	.long	.LASF2873
	.byte	0x5
	.uleb128 0x15e
	.long	.LASF2874
	.byte	0x5
	.uleb128 0x15f
	.long	.LASF2875
	.byte	0x5
	.uleb128 0x160
	.long	.LASF2876
	.byte	0x5
	.uleb128 0x161
	.long	.LASF2877
	.byte	0x5
	.uleb128 0x162
	.long	.LASF2878
	.byte	0x5
	.uleb128 0x163
	.long	.LASF2879
	.byte	0x5
	.uleb128 0x164
	.long	.LASF2880
	.byte	0x5
	.uleb128 0x165
	.long	.LASF2881
	.byte	0x5
	.uleb128 0x166
	.long	.LASF2882
	.byte	0x5
	.uleb128 0x167
	.long	.LASF2883
	.byte	0x5
	.uleb128 0x168
	.long	.LASF2884
	.byte	0x5
	.uleb128 0x169
	.long	.LASF2885
	.byte	0x5
	.uleb128 0x16a
	.long	.LASF2886
	.byte	0x5
	.uleb128 0x16b
	.long	.LASF2887
	.byte	0x5
	.uleb128 0x16c
	.long	.LASF2888
	.byte	0x5
	.uleb128 0x16d
	.long	.LASF2889
	.byte	0x5
	.uleb128 0x16e
	.long	.LASF2890
	.byte	0x5
	.uleb128 0x16f
	.long	.LASF2891
	.byte	0x5
	.uleb128 0x170
	.long	.LASF2892
	.byte	0x5
	.uleb128 0x171
	.long	.LASF2893
	.byte	0x5
	.uleb128 0x172
	.long	.LASF2894
	.byte	0x5
	.uleb128 0x173
	.long	.LASF2895
	.byte	0x5
	.uleb128 0x174
	.long	.LASF2896
	.byte	0x5
	.uleb128 0x175
	.long	.LASF2897
	.byte	0x5
	.uleb128 0x176
	.long	.LASF2898
	.byte	0x5
	.uleb128 0x177
	.long	.LASF2899
	.byte	0x5
	.uleb128 0x178
	.long	.LASF2900
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.syscall.h.8.de0020f5d110fe6453c8f014241812fe,comdat
.Ldebug_macro86:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x8
	.long	.LASF2901
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF2902
	.byte	0x5
	.uleb128 0x23
	.long	.LASF2903
	.byte	0x5
	.uleb128 0x27
	.long	.LASF2904
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF2905
	.byte	0x5
	.uleb128 0x2f
	.long	.LASF2906
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF2907
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF2908
	.byte	0x5
	.uleb128 0x43
	.long	.LASF2909
	.byte	0x5
	.uleb128 0x47
	.long	.LASF2910
	.byte	0x5
	.uleb128 0x5b
	.long	.LASF2911
	.byte	0x5
	.uleb128 0x77
	.long	.LASF2912
	.byte	0x5
	.uleb128 0x7b
	.long	.LASF2913
	.byte	0x5
	.uleb128 0x87
	.long	.LASF2914
	.byte	0x5
	.uleb128 0x93
	.long	.LASF2915
	.byte	0x5
	.uleb128 0x97
	.long	.LASF2916
	.byte	0x5
	.uleb128 0x9b
	.long	.LASF2917
	.byte	0x5
	.uleb128 0x9f
	.long	.LASF2918
	.byte	0x5
	.uleb128 0xa3
	.long	.LASF2919
	.byte	0x5
	.uleb128 0xab
	.long	.LASF2920
	.byte	0x5
	.uleb128 0xaf
	.long	.LASF2921
	.byte	0x5
	.uleb128 0xb7
	.long	.LASF2922
	.byte	0x5
	.uleb128 0xbf
	.long	.LASF2923
	.byte	0x5
	.uleb128 0xc7
	.long	.LASF2924
	.byte	0x5
	.uleb128 0xcf
	.long	.LASF2925
	.byte	0x5
	.uleb128 0xd7
	.long	.LASF2926
	.byte	0x5
	.uleb128 0xdf
	.long	.LASF2927
	.byte	0x5
	.uleb128 0xe3
	.long	.LASF2928
	.byte	0x5
	.uleb128 0xe7
	.long	.LASF2929
	.byte	0x5
	.uleb128 0xef
	.long	.LASF2930
	.byte	0x5
	.uleb128 0xf3
	.long	.LASF2931
	.byte	0x5
	.uleb128 0xf7
	.long	.LASF2932
	.byte	0x5
	.uleb128 0xfb
	.long	.LASF2933
	.byte	0x5
	.uleb128 0xff
	.long	.LASF2934
	.byte	0x5
	.uleb128 0x107
	.long	.LASF2935
	.byte	0x5
	.uleb128 0x10b
	.long	.LASF2936
	.byte	0x5
	.uleb128 0x10f
	.long	.LASF2937
	.byte	0x5
	.uleb128 0x113
	.long	.LASF2938
	.byte	0x5
	.uleb128 0x117
	.long	.LASF2939
	.byte	0x5
	.uleb128 0x11b
	.long	.LASF2940
	.byte	0x5
	.uleb128 0x11f
	.long	.LASF2941
	.byte	0x5
	.uleb128 0x123
	.long	.LASF2942
	.byte	0x5
	.uleb128 0x127
	.long	.LASF2943
	.byte	0x5
	.uleb128 0x12b
	.long	.LASF2944
	.byte	0x5
	.uleb128 0x12f
	.long	.LASF2945
	.byte	0x5
	.uleb128 0x133
	.long	.LASF2946
	.byte	0x5
	.uleb128 0x137
	.long	.LASF2947
	.byte	0x5
	.uleb128 0x143
	.long	.LASF2948
	.byte	0x5
	.uleb128 0x147
	.long	.LASF2949
	.byte	0x5
	.uleb128 0x14b
	.long	.LASF2950
	.byte	0x5
	.uleb128 0x14f
	.long	.LASF2951
	.byte	0x5
	.uleb128 0x153
	.long	.LASF2952
	.byte	0x5
	.uleb128 0x157
	.long	.LASF2953
	.byte	0x5
	.uleb128 0x15b
	.long	.LASF2954
	.byte	0x5
	.uleb128 0x163
	.long	.LASF2955
	.byte	0x5
	.uleb128 0x167
	.long	.LASF2956
	.byte	0x5
	.uleb128 0x16b
	.long	.LASF2957
	.byte	0x5
	.uleb128 0x16f
	.long	.LASF2958
	.byte	0x5
	.uleb128 0x173
	.long	.LASF2959
	.byte	0x5
	.uleb128 0x177
	.long	.LASF2960
	.byte	0x5
	.uleb128 0x17b
	.long	.LASF2961
	.byte	0x5
	.uleb128 0x183
	.long	.LASF2962
	.byte	0x5
	.uleb128 0x187
	.long	.LASF2963
	.byte	0x5
	.uleb128 0x18f
	.long	.LASF2964
	.byte	0x5
	.uleb128 0x193
	.long	.LASF2965
	.byte	0x5
	.uleb128 0x197
	.long	.LASF2966
	.byte	0x5
	.uleb128 0x19b
	.long	.LASF2967
	.byte	0x5
	.uleb128 0x19f
	.long	.LASF2968
	.byte	0x5
	.uleb128 0x1a3
	.long	.LASF2969
	.byte	0x5
	.uleb128 0x1af
	.long	.LASF2970
	.byte	0x5
	.uleb128 0x1b3
	.long	.LASF2971
	.byte	0x5
	.uleb128 0x1b7
	.long	.LASF2972
	.byte	0x5
	.uleb128 0x1bb
	.long	.LASF2973
	.byte	0x5
	.uleb128 0x1bf
	.long	.LASF2974
	.byte	0x5
	.uleb128 0x1c3
	.long	.LASF2975
	.byte	0x5
	.uleb128 0x1c7
	.long	.LASF2976
	.byte	0x5
	.uleb128 0x1d3
	.long	.LASF2977
	.byte	0x5
	.uleb128 0x1db
	.long	.LASF2978
	.byte	0x5
	.uleb128 0x1e3
	.long	.LASF2979
	.byte	0x5
	.uleb128 0x1eb
	.long	.LASF2980
	.byte	0x5
	.uleb128 0x1f3
	.long	.LASF2981
	.byte	0x5
	.uleb128 0x1f7
	.long	.LASF2982
	.byte	0x5
	.uleb128 0x1fb
	.long	.LASF2983
	.byte	0x5
	.uleb128 0x1ff
	.long	.LASF2984
	.byte	0x5
	.uleb128 0x203
	.long	.LASF2985
	.byte	0x5
	.uleb128 0x207
	.long	.LASF2986
	.byte	0x5
	.uleb128 0x20f
	.long	.LASF2987
	.byte	0x5
	.uleb128 0x213
	.long	.LASF2988
	.byte	0x5
	.uleb128 0x217
	.long	.LASF2989
	.byte	0x5
	.uleb128 0x21b
	.long	.LASF2990
	.byte	0x5
	.uleb128 0x227
	.long	.LASF2991
	.byte	0x5
	.uleb128 0x22f
	.long	.LASF2992
	.byte	0x5
	.uleb128 0x237
	.long	.LASF2993
	.byte	0x5
	.uleb128 0x23f
	.long	.LASF2994
	.byte	0x5
	.uleb128 0x24b
	.long	.LASF2995
	.byte	0x5
	.uleb128 0x253
	.long	.LASF2996
	.byte	0x5
	.uleb128 0x257
	.long	.LASF2997
	.byte	0x5
	.uleb128 0x25b
	.long	.LASF2998
	.byte	0x5
	.uleb128 0x25f
	.long	.LASF2999
	.byte	0x5
	.uleb128 0x263
	.long	.LASF3000
	.byte	0x5
	.uleb128 0x267
	.long	.LASF3001
	.byte	0x5
	.uleb128 0x26b
	.long	.LASF3002
	.byte	0x5
	.uleb128 0x26f
	.long	.LASF3003
	.byte	0x5
	.uleb128 0x273
	.long	.LASF3004
	.byte	0x5
	.uleb128 0x27b
	.long	.LASF3005
	.byte	0x5
	.uleb128 0x283
	.long	.LASF3006
	.byte	0x5
	.uleb128 0x287
	.long	.LASF3007
	.byte	0x5
	.uleb128 0x28b
	.long	.LASF3008
	.byte	0x5
	.uleb128 0x28f
	.long	.LASF3009
	.byte	0x5
	.uleb128 0x293
	.long	.LASF3010
	.byte	0x5
	.uleb128 0x297
	.long	.LASF3011
	.byte	0x5
	.uleb128 0x29b
	.long	.LASF3012
	.byte	0x5
	.uleb128 0x29f
	.long	.LASF3013
	.byte	0x5
	.uleb128 0x2ab
	.long	.LASF3014
	.byte	0x5
	.uleb128 0x2c3
	.long	.LASF3015
	.byte	0x5
	.uleb128 0x2c7
	.long	.LASF3016
	.byte	0x5
	.uleb128 0x2cb
	.long	.LASF3017
	.byte	0x5
	.uleb128 0x2cf
	.long	.LASF3018
	.byte	0x5
	.uleb128 0x2d3
	.long	.LASF3019
	.byte	0x5
	.uleb128 0x2d7
	.long	.LASF3020
	.byte	0x5
	.uleb128 0x2db
	.long	.LASF3021
	.byte	0x5
	.uleb128 0x2df
	.long	.LASF3022
	.byte	0x5
	.uleb128 0x2e3
	.long	.LASF3023
	.byte	0x5
	.uleb128 0x2eb
	.long	.LASF3024
	.byte	0x5
	.uleb128 0x2ef
	.long	.LASF3025
	.byte	0x5
	.uleb128 0x2f3
	.long	.LASF3026
	.byte	0x5
	.uleb128 0x2f7
	.long	.LASF3027
	.byte	0x5
	.uleb128 0x2fb
	.long	.LASF3028
	.byte	0x5
	.uleb128 0x2ff
	.long	.LASF3029
	.byte	0x5
	.uleb128 0x303
	.long	.LASF3030
	.byte	0x5
	.uleb128 0x307
	.long	.LASF3031
	.byte	0x5
	.uleb128 0x30b
	.long	.LASF3032
	.byte	0x5
	.uleb128 0x30f
	.long	.LASF3033
	.byte	0x5
	.uleb128 0x317
	.long	.LASF3034
	.byte	0x5
	.uleb128 0x31f
	.long	.LASF3035
	.byte	0x5
	.uleb128 0x323
	.long	.LASF3036
	.byte	0x5
	.uleb128 0x327
	.long	.LASF3037
	.byte	0x5
	.uleb128 0x32b
	.long	.LASF3038
	.byte	0x5
	.uleb128 0x32f
	.long	.LASF3039
	.byte	0x5
	.uleb128 0x333
	.long	.LASF3040
	.byte	0x5
	.uleb128 0x337
	.long	.LASF3041
	.byte	0x5
	.uleb128 0x33b
	.long	.LASF3042
	.byte	0x5
	.uleb128 0x343
	.long	.LASF3043
	.byte	0x5
	.uleb128 0x347
	.long	.LASF3044
	.byte	0x5
	.uleb128 0x34b
	.long	.LASF3045
	.byte	0x5
	.uleb128 0x34f
	.long	.LASF3046
	.byte	0x5
	.uleb128 0x353
	.long	.LASF3047
	.byte	0x5
	.uleb128 0x357
	.long	.LASF3048
	.byte	0x5
	.uleb128 0x363
	.long	.LASF3049
	.byte	0x5
	.uleb128 0x367
	.long	.LASF3050
	.byte	0x5
	.uleb128 0x36b
	.long	.LASF3051
	.byte	0x5
	.uleb128 0x36f
	.long	.LASF3052
	.byte	0x5
	.uleb128 0x373
	.long	.LASF3053
	.byte	0x5
	.uleb128 0x37b
	.long	.LASF3054
	.byte	0x5
	.uleb128 0x37f
	.long	.LASF3055
	.byte	0x5
	.uleb128 0x383
	.long	.LASF3056
	.byte	0x5
	.uleb128 0x387
	.long	.LASF3057
	.byte	0x5
	.uleb128 0x38b
	.long	.LASF3058
	.byte	0x5
	.uleb128 0x393
	.long	.LASF3059
	.byte	0x5
	.uleb128 0x397
	.long	.LASF3060
	.byte	0x5
	.uleb128 0x39b
	.long	.LASF3061
	.byte	0x5
	.uleb128 0x39f
	.long	.LASF3062
	.byte	0x5
	.uleb128 0x3a3
	.long	.LASF3063
	.byte	0x5
	.uleb128 0x3a7
	.long	.LASF3064
	.byte	0x5
	.uleb128 0x3ab
	.long	.LASF3065
	.byte	0x5
	.uleb128 0x3af
	.long	.LASF3066
	.byte	0x5
	.uleb128 0x3b3
	.long	.LASF3067
	.byte	0x5
	.uleb128 0x3b7
	.long	.LASF3068
	.byte	0x5
	.uleb128 0x3bf
	.long	.LASF3069
	.byte	0x5
	.uleb128 0x3c3
	.long	.LASF3070
	.byte	0x5
	.uleb128 0x3c7
	.long	.LASF3071
	.byte	0x5
	.uleb128 0x3cb
	.long	.LASF3072
	.byte	0x5
	.uleb128 0x3cf
	.long	.LASF3073
	.byte	0x5
	.uleb128 0x3d3
	.long	.LASF3074
	.byte	0x5
	.uleb128 0x3db
	.long	.LASF3075
	.byte	0x5
	.uleb128 0x3df
	.long	.LASF3076
	.byte	0x5
	.uleb128 0x3e3
	.long	.LASF3077
	.byte	0x5
	.uleb128 0x3e7
	.long	.LASF3078
	.byte	0x5
	.uleb128 0x3ef
	.long	.LASF3079
	.byte	0x5
	.uleb128 0x3f7
	.long	.LASF3080
	.byte	0x5
	.uleb128 0x3fb
	.long	.LASF3081
	.byte	0x5
	.uleb128 0x3ff
	.long	.LASF3082
	.byte	0x5
	.uleb128 0x403
	.long	.LASF3083
	.byte	0x5
	.uleb128 0x407
	.long	.LASF3084
	.byte	0x5
	.uleb128 0x40b
	.long	.LASF3085
	.byte	0x5
	.uleb128 0x40f
	.long	.LASF3086
	.byte	0x5
	.uleb128 0x417
	.long	.LASF3087
	.byte	0x5
	.uleb128 0x41b
	.long	.LASF3088
	.byte	0x5
	.uleb128 0x41f
	.long	.LASF3089
	.byte	0x5
	.uleb128 0x423
	.long	.LASF3090
	.byte	0x5
	.uleb128 0x427
	.long	.LASF3091
	.byte	0x5
	.uleb128 0x42b
	.long	.LASF3092
	.byte	0x5
	.uleb128 0x42f
	.long	.LASF3093
	.byte	0x5
	.uleb128 0x45b
	.long	.LASF3094
	.byte	0x5
	.uleb128 0x45f
	.long	.LASF3095
	.byte	0x5
	.uleb128 0x463
	.long	.LASF3096
	.byte	0x5
	.uleb128 0x467
	.long	.LASF3097
	.byte	0x5
	.uleb128 0x46b
	.long	.LASF3098
	.byte	0x5
	.uleb128 0x62b
	.long	.LASF3099
	.byte	0x5
	.uleb128 0x63b
	.long	.LASF3100
	.byte	0x5
	.uleb128 0x647
	.long	.LASF3101
	.byte	0x5
	.uleb128 0x64b
	.long	.LASF3102
	.byte	0x5
	.uleb128 0x64f
	.long	.LASF3103
	.byte	0x5
	.uleb128 0x653
	.long	.LASF3104
	.byte	0x5
	.uleb128 0x657
	.long	.LASF3105
	.byte	0x5
	.uleb128 0x65b
	.long	.LASF3106
	.byte	0x5
	.uleb128 0x65f
	.long	.LASF3107
	.byte	0x5
	.uleb128 0x663
	.long	.LASF3108
	.byte	0x5
	.uleb128 0x667
	.long	.LASF3109
	.byte	0x5
	.uleb128 0x66b
	.long	.LASF3110
	.byte	0x5
	.uleb128 0x66f
	.long	.LASF3111
	.byte	0x5
	.uleb128 0x673
	.long	.LASF3112
	.byte	0x5
	.uleb128 0x67b
	.long	.LASF3113
	.byte	0x5
	.uleb128 0x67f
	.long	.LASF3114
	.byte	0x5
	.uleb128 0x683
	.long	.LASF3115
	.byte	0x5
	.uleb128 0x687
	.long	.LASF3116
	.byte	0x5
	.uleb128 0x68b
	.long	.LASF3117
	.byte	0x5
	.uleb128 0x68f
	.long	.LASF3118
	.byte	0x5
	.uleb128 0x693
	.long	.LASF3119
	.byte	0x5
	.uleb128 0x697
	.long	.LASF3120
	.byte	0x5
	.uleb128 0x69b
	.long	.LASF3121
	.byte	0x5
	.uleb128 0x6a7
	.long	.LASF3122
	.byte	0x5
	.uleb128 0x6af
	.long	.LASF3123
	.byte	0x5
	.uleb128 0x6b3
	.long	.LASF3124
	.byte	0x5
	.uleb128 0x6b7
	.long	.LASF3125
	.byte	0x5
	.uleb128 0x6bb
	.long	.LASF3126
	.byte	0x5
	.uleb128 0x6bf
	.long	.LASF3127
	.byte	0x5
	.uleb128 0x6c3
	.long	.LASF3128
	.byte	0x5
	.uleb128 0x6c7
	.long	.LASF3129
	.byte	0x5
	.uleb128 0x6cb
	.long	.LASF3130
	.byte	0x5
	.uleb128 0x6cf
	.long	.LASF3131
	.byte	0x5
	.uleb128 0x6d3
	.long	.LASF3132
	.byte	0x5
	.uleb128 0x6db
	.long	.LASF3133
	.byte	0x5
	.uleb128 0x6df
	.long	.LASF3134
	.byte	0x5
	.uleb128 0x6e3
	.long	.LASF3135
	.byte	0x5
	.uleb128 0x6e7
	.long	.LASF3136
	.byte	0x5
	.uleb128 0x6ef
	.long	.LASF3137
	.byte	0x5
	.uleb128 0x6f3
	.long	.LASF3138
	.byte	0x5
	.uleb128 0x6fb
	.long	.LASF3139
	.byte	0x5
	.uleb128 0x6ff
	.long	.LASF3140
	.byte	0x5
	.uleb128 0x703
	.long	.LASF3141
	.byte	0x5
	.uleb128 0x707
	.long	.LASF3142
	.byte	0x5
	.uleb128 0x70b
	.long	.LASF3143
	.byte	0x5
	.uleb128 0x70f
	.long	.LASF3144
	.byte	0x5
	.uleb128 0x713
	.long	.LASF3145
	.byte	0x5
	.uleb128 0x717
	.long	.LASF3146
	.byte	0x5
	.uleb128 0x71f
	.long	.LASF3147
	.byte	0x5
	.uleb128 0x723
	.long	.LASF3148
	.byte	0x5
	.uleb128 0x727
	.long	.LASF3149
	.byte	0x5
	.uleb128 0x72b
	.long	.LASF3150
	.byte	0x5
	.uleb128 0x72f
	.long	.LASF3151
	.byte	0x5
	.uleb128 0x733
	.long	.LASF3152
	.byte	0x5
	.uleb128 0x737
	.long	.LASF3153
	.byte	0x5
	.uleb128 0x73b
	.long	.LASF3154
	.byte	0x5
	.uleb128 0x73f
	.long	.LASF3155
	.byte	0x5
	.uleb128 0x747
	.long	.LASF3156
	.byte	0x5
	.uleb128 0x767
	.long	.LASF3157
	.byte	0x5
	.uleb128 0x76b
	.long	.LASF3158
	.byte	0x5
	.uleb128 0x76f
	.long	.LASF3159
	.byte	0x5
	.uleb128 0x773
	.long	.LASF3160
	.byte	0x5
	.uleb128 0x777
	.long	.LASF3161
	.byte	0x5
	.uleb128 0x77b
	.long	.LASF3162
	.byte	0x5
	.uleb128 0x77f
	.long	.LASF3163
	.byte	0x5
	.uleb128 0x78b
	.long	.LASF3164
	.byte	0x5
	.uleb128 0x78f
	.long	.LASF3165
	.byte	0x5
	.uleb128 0x793
	.long	.LASF3166
	.byte	0x5
	.uleb128 0x797
	.long	.LASF3167
	.byte	0x5
	.uleb128 0x79b
	.long	.LASF3168
	.byte	0x5
	.uleb128 0x79f
	.long	.LASF3169
	.byte	0x5
	.uleb128 0x7a3
	.long	.LASF3170
	.byte	0x5
	.uleb128 0x7a7
	.long	.LASF3171
	.byte	0x5
	.uleb128 0x7ab
	.long	.LASF3172
	.byte	0x5
	.uleb128 0x7af
	.long	.LASF3173
	.byte	0x5
	.uleb128 0x7b3
	.long	.LASF3174
	.byte	0x5
	.uleb128 0x7b7
	.long	.LASF3175
	.byte	0x5
	.uleb128 0x7c3
	.long	.LASF3176
	.byte	0x5
	.uleb128 0x7cb
	.long	.LASF3177
	.byte	0x5
	.uleb128 0x7cf
	.long	.LASF3178
	.byte	0x5
	.uleb128 0x7d3
	.long	.LASF3179
	.byte	0x5
	.uleb128 0x7d7
	.long	.LASF3180
	.byte	0x5
	.uleb128 0x7db
	.long	.LASF3181
	.byte	0x5
	.uleb128 0x7df
	.long	.LASF3182
	.byte	0x5
	.uleb128 0x7e3
	.long	.LASF3183
	.byte	0x5
	.uleb128 0x7eb
	.long	.LASF3184
	.byte	0x5
	.uleb128 0x7ef
	.long	.LASF3185
	.byte	0x5
	.uleb128 0x7f7
	.long	.LASF3186
	.byte	0x5
	.uleb128 0x7ff
	.long	.LASF3187
	.byte	0x5
	.uleb128 0x807
	.long	.LASF3188
	.byte	0x5
	.uleb128 0x813
	.long	.LASF3189
	.byte	0x5
	.uleb128 0x817
	.long	.LASF3190
	.byte	0x5
	.uleb128 0x81b
	.long	.LASF3191
	.byte	0x5
	.uleb128 0x81f
	.long	.LASF3192
	.byte	0x5
	.uleb128 0x827
	.long	.LASF3193
	.byte	0x5
	.uleb128 0x82b
	.long	.LASF3194
	.byte	0x5
	.uleb128 0x833
	.long	.LASF3195
	.byte	0x5
	.uleb128 0x83b
	.long	.LASF3196
	.byte	0x5
	.uleb128 0x843
	.long	.LASF3197
	.byte	0x5
	.uleb128 0x84b
	.long	.LASF3198
	.byte	0x5
	.uleb128 0x84f
	.long	.LASF3199
	.byte	0x5
	.uleb128 0x853
	.long	.LASF3200
	.byte	0x5
	.uleb128 0x857
	.long	.LASF3201
	.byte	0x5
	.uleb128 0x85b
	.long	.LASF3202
	.byte	0x5
	.uleb128 0x863
	.long	.LASF3203
	.byte	0x5
	.uleb128 0x86b
	.long	.LASF3204
	.byte	0x5
	.uleb128 0x86f
	.long	.LASF3205
	.byte	0x5
	.uleb128 0x873
	.long	.LASF3206
	.byte	0x5
	.uleb128 0x877
	.long	.LASF3207
	.byte	0x5
	.uleb128 0x87b
	.long	.LASF3208
	.byte	0x5
	.uleb128 0x883
	.long	.LASF3209
	.byte	0x5
	.uleb128 0x88b
	.long	.LASF3210
	.byte	0x5
	.uleb128 0x88f
	.long	.LASF3211
	.byte	0x5
	.uleb128 0x8a3
	.long	.LASF3212
	.byte	0x5
	.uleb128 0x8ab
	.long	.LASF3213
	.byte	0x5
	.uleb128 0x8af
	.long	.LASF3214
	.byte	0x5
	.uleb128 0x8bf
	.long	.LASF3215
	.byte	0x5
	.uleb128 0x8c7
	.long	.LASF3216
	.byte	0x5
	.uleb128 0x8cf
	.long	.LASF3217
	.byte	0x5
	.uleb128 0x8e3
	.long	.LASF3218
	.byte	0x5
	.uleb128 0x8e7
	.long	.LASF3219
	.byte	0x5
	.uleb128 0x8ef
	.long	.LASF3220
	.byte	0x5
	.uleb128 0x8f3
	.long	.LASF3221
	.byte	0x5
	.uleb128 0x8f7
	.long	.LASF3222
	.byte	0x5
	.uleb128 0x8fb
	.long	.LASF3223
	.byte	0x5
	.uleb128 0x903
	.long	.LASF3224
	.byte	0x5
	.uleb128 0x91b
	.long	.LASF3225
	.byte	0x5
	.uleb128 0x91f
	.long	.LASF3226
	.byte	0x5
	.uleb128 0x923
	.long	.LASF3227
	.byte	0x5
	.uleb128 0x92b
	.long	.LASF3228
	.byte	0x5
	.uleb128 0x92f
	.long	.LASF3229
	.byte	0x5
	.uleb128 0x933
	.long	.LASF3230
	.byte	0x5
	.uleb128 0x937
	.long	.LASF3231
	.byte	0x5
	.uleb128 0x93b
	.long	.LASF3232
	.byte	0x5
	.uleb128 0x93f
	.long	.LASF3233
	.byte	0x5
	.uleb128 0x943
	.long	.LASF3234
	.byte	0x5
	.uleb128 0x94b
	.long	.LASF3235
	.byte	0x5
	.uleb128 0x957
	.long	.LASF3236
	.byte	0x5
	.uleb128 0x95b
	.long	.LASF3237
	.byte	0x5
	.uleb128 0x963
	.long	.LASF3238
	.byte	0x5
	.uleb128 0x96b
	.long	.LASF3239
	.byte	0x5
	.uleb128 0x96f
	.long	.LASF3240
	.byte	0x5
	.uleb128 0x973
	.long	.LASF3241
	.byte	0x5
	.uleb128 0x97b
	.long	.LASF3242
	.byte	0x5
	.uleb128 0x98b
	.long	.LASF3243
	.byte	0x5
	.uleb128 0x993
	.long	.LASF3244
	.byte	0x5
	.uleb128 0x997
	.long	.LASF3245
	.byte	0x5
	.uleb128 0x99b
	.long	.LASF3246
	.byte	0x5
	.uleb128 0x99f
	.long	.LASF3247
	.byte	0x5
	.uleb128 0x9a3
	.long	.LASF3248
	.byte	0x5
	.uleb128 0x9a7
	.long	.LASF3249
	.byte	0x5
	.uleb128 0x9ab
	.long	.LASF3250
	.byte	0x5
	.uleb128 0x9b7
	.long	.LASF3251
	.byte	0x5
	.uleb128 0x9bb
	.long	.LASF3252
	.byte	0x5
	.uleb128 0x9bf
	.long	.LASF3253
	.byte	0x5
	.uleb128 0x9c7
	.long	.LASF3254
	.byte	0x5
	.uleb128 0x9cf
	.long	.LASF3255
	.byte	0x5
	.uleb128 0x9d3
	.long	.LASF3256
	.byte	0x5
	.uleb128 0x9df
	.long	.LASF3257
	.byte	0x5
	.uleb128 0x9e3
	.long	.LASF3258
	.byte	0x5
	.uleb128 0x9e7
	.long	.LASF3259
	.byte	0x5
	.uleb128 0x9eb
	.long	.LASF3260
	.byte	0x5
	.uleb128 0x9f3
	.long	.LASF3261
	.byte	0x5
	.uleb128 0x9f7
	.long	.LASF3262
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.bitsperlong.h.3.81201f16c5ebf9ebeb0f369d7d7d8e27,comdat
.Ldebug_macro87:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x3
	.long	.LASF3267
	.byte	0x5
	.uleb128 0x6
	.long	.LASF3268
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.bitsperlong.h.3.c81570a1b11d23e1da1277c0e6d6abad,comdat
.Ldebug_macro88:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x3
	.long	.LASF3269
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF3270
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stddef.h.3.4407f68d52a41fe0b6a4cd538647eed6,comdat
.Ldebug_macro89:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x3
	.long	.LASF3272
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF3273
	.byte	0x5
	.uleb128 0x2f
	.long	.LASF3274
	.byte	0x5
	.uleb128 0x37
	.long	.LASF3275
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.posix_types.h.22.ce27b629270cbb91230af7498cb5994b,comdat
.Ldebug_macro90:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x16
	.long	.LASF3276
	.byte	0x5
	.uleb128 0x17
	.long	.LASF626
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.posix_types_64.h.3.c35937438f2f85070758d4696b933189,comdat
.Ldebug_macro91:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x3
	.long	.LASF3277
	.byte	0x5
	.uleb128 0xd
	.long	.LASF3278
	.byte	0x5
	.uleb128 0x10
	.long	.LASF3279
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.types.h.25.149aa340ebf50c8bc18801229121ab10,comdat
.Ldebug_macro92:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x19
	.long	.LASF3281
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF3282
	.byte	0x5
	.uleb128 0x32
	.long	.LASF3283
	.byte	0x5
	.uleb128 0x33
	.long	.LASF3284
	.byte	0x5
	.uleb128 0x34
	.long	.LASF3285
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.ioctl.h.3.dea0ef8af0ad8d1d6e8e1ec2ee97119b,comdat
.Ldebug_macro93:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x3
	.long	.LASF3287
	.byte	0x5
	.uleb128 0x17
	.long	.LASF3288
	.byte	0x5
	.uleb128 0x18
	.long	.LASF3289
	.byte	0x5
	.uleb128 0x20
	.long	.LASF3290
	.byte	0x5
	.uleb128 0x24
	.long	.LASF3291
	.byte	0x5
	.uleb128 0x27
	.long	.LASF3292
	.byte	0x5
	.uleb128 0x28
	.long	.LASF3293
	.byte	0x5
	.uleb128 0x29
	.long	.LASF3294
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF3295
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF3296
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF3297
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF3298
	.byte	0x5
	.uleb128 0x2f
	.long	.LASF3299
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF3300
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF3301
	.byte	0x5
	.uleb128 0x42
	.long	.LASF3302
	.byte	0x5
	.uleb128 0x45
	.long	.LASF3303
	.byte	0x5
	.uleb128 0x4b
	.long	.LASF3304
	.byte	0x5
	.uleb128 0x53
	.long	.LASF3305
	.byte	0x5
	.uleb128 0x54
	.long	.LASF3306
	.byte	0x5
	.uleb128 0x55
	.long	.LASF3307
	.byte	0x5
	.uleb128 0x56
	.long	.LASF3308
	.byte	0x5
	.uleb128 0x57
	.long	.LASF3309
	.byte	0x5
	.uleb128 0x58
	.long	.LASF3310
	.byte	0x5
	.uleb128 0x59
	.long	.LASF3311
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF3312
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF3313
	.byte	0x5
	.uleb128 0x5e
	.long	.LASF3314
	.byte	0x5
	.uleb128 0x5f
	.long	.LASF3315
	.byte	0x5
	.uleb128 0x63
	.long	.LASF3316
	.byte	0x5
	.uleb128 0x64
	.long	.LASF3317
	.byte	0x5
	.uleb128 0x65
	.long	.LASF3318
	.byte	0x5
	.uleb128 0x66
	.long	.LASF3319
	.byte	0x5
	.uleb128 0x67
	.long	.LASF3320
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.little_endian.h.3.65eb9971b8eca71ba04b53bb30dfdd07,comdat
.Ldebug_macro94:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x3
	.long	.LASF3322
	.byte	0x5
	.uleb128 0x9
	.long	.LASF3323
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.swab.h.3.5c61f086d228fe7e8ffe5753117b848d,comdat
.Ldebug_macro95:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x3
	.long	.LASF3325
	.byte	0x5
	.uleb128 0xd
	.long	.LASF3326
	.byte	0x5
	.uleb128 0x23
	.long	.LASF3327
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.swab.h.14.2128cf6255d421b39e5bb6f0cb388073,comdat
.Ldebug_macro96:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xe
	.long	.LASF3328
	.byte	0x5
	.uleb128 0x12
	.long	.LASF3329
	.byte	0x5
	.uleb128 0x18
	.long	.LASF3330
	.byte	0x5
	.uleb128 0x22
	.long	.LASF3331
	.byte	0x5
	.uleb128 0x26
	.long	.LASF3332
	.byte	0x5
	.uleb128 0x68
	.long	.LASF3333
	.byte	0x5
	.uleb128 0x75
	.long	.LASF3334
	.byte	0x5
	.uleb128 0x82
	.long	.LASF3335
	.byte	0x5
	.uleb128 0x97
	.long	.LASF3336
	.byte	0x5
	.uleb128 0xa2
	.long	.LASF3337
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.little_endian.h.16.e65d8da6d4a3c2e8b6c63e6f638d89c6,comdat
.Ldebug_macro97:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x10
	.long	.LASF3338
	.byte	0x5
	.uleb128 0x11
	.long	.LASF3339
	.byte	0x5
	.uleb128 0x12
	.long	.LASF3340
	.byte	0x5
	.uleb128 0x13
	.long	.LASF3341
	.byte	0x5
	.uleb128 0x14
	.long	.LASF3342
	.byte	0x5
	.uleb128 0x15
	.long	.LASF3343
	.byte	0x5
	.uleb128 0x16
	.long	.LASF3344
	.byte	0x5
	.uleb128 0x17
	.long	.LASF3345
	.byte	0x5
	.uleb128 0x18
	.long	.LASF3346
	.byte	0x5
	.uleb128 0x19
	.long	.LASF3347
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF3348
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF3349
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF3350
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF3351
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF3352
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF3353
	.byte	0x5
	.uleb128 0x20
	.long	.LASF3354
	.byte	0x5
	.uleb128 0x21
	.long	.LASF3355
	.byte	0x5
	.uleb128 0x22
	.long	.LASF3356
	.byte	0x5
	.uleb128 0x23
	.long	.LASF3357
	.byte	0x5
	.uleb128 0x24
	.long	.LASF3358
	.byte	0x5
	.uleb128 0x25
	.long	.LASF3359
	.byte	0x5
	.uleb128 0x26
	.long	.LASF3360
	.byte	0x5
	.uleb128 0x27
	.long	.LASF3361
	.byte	0x5
	.uleb128 0x28
	.long	.LASF3362
	.byte	0x5
	.uleb128 0x29
	.long	.LASF3363
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF3364
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF3365
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF3366
	.byte	0x5
	.uleb128 0x5e
	.long	.LASF3367
	.byte	0x5
	.uleb128 0x5f
	.long	.LASF3368
	.byte	0x5
	.uleb128 0x60
	.long	.LASF3369
	.byte	0x5
	.uleb128 0x61
	.long	.LASF3370
	.byte	0x5
	.uleb128 0x62
	.long	.LASF3371
	.byte	0x5
	.uleb128 0x63
	.long	.LASF3372
	.byte	0x5
	.uleb128 0x64
	.long	.LASF3373
	.byte	0x5
	.uleb128 0x65
	.long	.LASF3374
	.byte	0x5
	.uleb128 0x66
	.long	.LASF3375
	.byte	0x5
	.uleb128 0x67
	.long	.LASF3376
	.byte	0x5
	.uleb128 0x68
	.long	.LASF3377
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.perf_event.h.52.e5e9c5207c1fa3a8e786ba9008e815b4,comdat
.Ldebug_macro98:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x34
	.long	.LASF3378
	.byte	0x5
	.uleb128 0x35
	.long	.LASF3379
	.byte	0x5
	.uleb128 0xa9
	.long	.LASF3380
	.byte	0x5
	.uleb128 0x12a
	.long	.LASF3381
	.byte	0x5
	.uleb128 0x12b
	.long	.LASF3382
	.byte	0x5
	.uleb128 0x12c
	.long	.LASF3383
	.byte	0x5
	.uleb128 0x12d
	.long	.LASF3384
	.byte	0x5
	.uleb128 0x12e
	.long	.LASF3385
	.byte	0x5
	.uleb128 0x130
	.long	.LASF3386
	.byte	0x5
	.uleb128 0x174
	.long	.LASF3387
	.byte	0x5
	.uleb128 0x175
	.long	.LASF3388
	.byte	0x5
	.uleb128 0x176
	.long	.LASF3389
	.byte	0x5
	.uleb128 0x177
	.long	.LASF3390
	.byte	0x5
	.uleb128 0x179
	.long	.LASF3391
	.byte	0x5
	.uleb128 0x17a
	.long	.LASF3392
	.byte	0x5
	.uleb128 0x17b
	.long	.LASF3393
	.byte	0x5
	.uleb128 0x17c
	.long	.LASF3394
	.byte	0x5
	.uleb128 0x17d
	.long	.LASF3395
	.byte	0x5
	.uleb128 0x227
	.long	.LASF3396
	.byte	0x5
	.uleb128 0x228
	.long	.LASF3397
	.byte	0x5
	.uleb128 0x229
	.long	.LASF3398
	.byte	0x5
	.uleb128 0x22a
	.long	.LASF3399
	.byte	0x5
	.uleb128 0x22b
	.long	.LASF3400
	.byte	0x5
	.uleb128 0x22c
	.long	.LASF3401
	.byte	0x5
	.uleb128 0x22d
	.long	.LASF3402
	.byte	0x5
	.uleb128 0x22e
	.long	.LASF3403
	.byte	0x5
	.uleb128 0x22f
	.long	.LASF3404
	.byte	0x5
	.uleb128 0x230
	.long	.LASF3405
	.byte	0x5
	.uleb128 0x231
	.long	.LASF3406
	.byte	0x5
	.uleb128 0x232
	.long	.LASF3407
	.byte	0x5
	.uleb128 0x2fa
	.long	.LASF3408
	.byte	0x5
	.uleb128 0x2fb
	.long	.LASF3409
	.byte	0x5
	.uleb128 0x2fc
	.long	.LASF3410
	.byte	0x5
	.uleb128 0x2fd
	.long	.LASF3411
	.byte	0x5
	.uleb128 0x2fe
	.long	.LASF3412
	.byte	0x5
	.uleb128 0x2ff
	.long	.LASF3413
	.byte	0x5
	.uleb128 0x300
	.long	.LASF3414
	.byte	0x5
	.uleb128 0x305
	.long	.LASF3415
	.byte	0x5
	.uleb128 0x30f
	.long	.LASF3416
	.byte	0x5
	.uleb128 0x310
	.long	.LASF3417
	.byte	0x5
	.uleb128 0x311
	.long	.LASF3418
	.byte	0x5
	.uleb128 0x312
	.long	.LASF3419
	.byte	0x5
	.uleb128 0x327
	.long	.LASF3420
	.byte	0x5
	.uleb128 0x328
	.long	.LASF3421
	.byte	0x5
	.uleb128 0x329
	.long	.LASF3422
	.byte	0x5
	.uleb128 0x32d
	.long	.LASF3423
	.byte	0x5
	.uleb128 0x4d2
	.long	.LASF3424
	.byte	0x5
	.uleb128 0x4db
	.long	.LASF3425
	.byte	0x5
	.uleb128 0x4dc
	.long	.LASF3426
	.byte	0x5
	.uleb128 0x4ed
	.long	.LASF3427
	.byte	0x5
	.uleb128 0x4ee
	.long	.LASF3428
	.byte	0x5
	.uleb128 0x4ef
	.long	.LASF3429
	.byte	0x5
	.uleb128 0x4f0
	.long	.LASF3430
	.byte	0x5
	.uleb128 0x4f1
	.long	.LASF3431
	.byte	0x5
	.uleb128 0x4f4
	.long	.LASF3432
	.byte	0x5
	.uleb128 0x4f5
	.long	.LASF3433
	.byte	0x5
	.uleb128 0x4f7
	.long	.LASF3434
	.byte	0x5
	.uleb128 0x4f8
	.long	.LASF3435
	.byte	0x5
	.uleb128 0x4f9
	.long	.LASF3436
	.byte	0x5
	.uleb128 0x4fa
	.long	.LASF3437
	.byte	0x5
	.uleb128 0x523
	.long	.LASF3438
	.byte	0x5
	.uleb128 0x524
	.long	.LASF3439
	.byte	0x5
	.uleb128 0x525
	.long	.LASF3440
	.byte	0x5
	.uleb128 0x526
	.long	.LASF3441
	.byte	0x5
	.uleb128 0x527
	.long	.LASF3442
	.byte	0x5
	.uleb128 0x528
	.long	.LASF3443
	.byte	0x5
	.uleb128 0x531
	.long	.LASF3444
	.byte	0x5
	.uleb128 0x532
	.long	.LASF3445
	.byte	0x5
	.uleb128 0x533
	.long	.LASF3446
	.byte	0x5
	.uleb128 0x534
	.long	.LASF3447
	.byte	0x5
	.uleb128 0x535
	.long	.LASF3448
	.byte	0x5
	.uleb128 0x536
	.long	.LASF3449
	.byte	0x5
	.uleb128 0x537
	.long	.LASF3450
	.byte	0x5
	.uleb128 0x538
	.long	.LASF3451
	.byte	0x5
	.uleb128 0x539
	.long	.LASF3452
	.byte	0x5
	.uleb128 0x53a
	.long	.LASF3453
	.byte	0x5
	.uleb128 0x53b
	.long	.LASF3454
	.byte	0x5
	.uleb128 0x53c
	.long	.LASF3455
	.byte	0x5
	.uleb128 0x53d
	.long	.LASF3456
	.byte	0x5
	.uleb128 0x53e
	.long	.LASF3457
	.byte	0x5
	.uleb128 0x53f
	.long	.LASF3458
	.byte	0x5
	.uleb128 0x541
	.long	.LASF3459
	.byte	0x5
	.uleb128 0x542
	.long	.LASF3460
	.byte	0x5
	.uleb128 0x544
	.long	.LASF3461
	.byte	0x5
	.uleb128 0x545
	.long	.LASF3462
	.byte	0x5
	.uleb128 0x546
	.long	.LASF3463
	.byte	0x5
	.uleb128 0x547
	.long	.LASF3464
	.byte	0x5
	.uleb128 0x549
	.long	.LASF3465
	.byte	0x5
	.uleb128 0x54a
	.long	.LASF3466
	.byte	0x5
	.uleb128 0x54b
	.long	.LASF3467
	.byte	0x5
	.uleb128 0x54c
	.long	.LASF3468
	.byte	0x5
	.uleb128 0x54d
	.long	.LASF3469
	.byte	0x5
	.uleb128 0x54e
	.long	.LASF3470
	.byte	0x5
	.uleb128 0x54f
	.long	.LASF3471
	.byte	0x5
	.uleb128 0x550
	.long	.LASF3472
	.byte	0x5
	.uleb128 0x552
	.long	.LASF3473
	.byte	0x5
	.uleb128 0x555
	.long	.LASF3474
	.byte	0x5
	.uleb128 0x556
	.long	.LASF3475
	.byte	0x5
	.uleb128 0x557
	.long	.LASF3476
	.byte	0x5
	.uleb128 0x558
	.long	.LASF3477
	.byte	0x5
	.uleb128 0x559
	.long	.LASF3478
	.byte	0x5
	.uleb128 0x55a
	.long	.LASF3479
	.byte	0x5
	.uleb128 0x55c
	.long	.LASF3480
	.byte	0x5
	.uleb128 0x55d
	.long	.LASF3481
	.byte	0x5
	.uleb128 0x55e
	.long	.LASF3482
	.byte	0x5
	.uleb128 0x561
	.long	.LASF3483
	.byte	0x5
	.uleb128 0x562
	.long	.LASF3484
	.byte	0x5
	.uleb128 0x563
	.long	.LASF3485
	.byte	0x5
	.uleb128 0x566
	.long	.LASF3486
	.byte	0x5
	.uleb128 0x567
	.long	.LASF3487
	.byte	0x5
	.uleb128 0x568
	.long	.LASF3488
	.byte	0x5
	.uleb128 0x569
	.long	.LASF3489
	.byte	0x5
	.uleb128 0x56a
	.long	.LASF3490
	.byte	0x5
	.uleb128 0x56b
	.long	.LASF3491
	.byte	0x5
	.uleb128 0x56c
	.long	.LASF3492
	.byte	0x5
	.uleb128 0x56d
	.long	.LASF3493
	.byte	0x5
	.uleb128 0x570
	.long	.LASF3494
	.byte	0x5
	.uleb128 0x571
	.long	.LASF3495
	.byte	0x5
	.uleb128 0x572
	.long	.LASF3496
	.byte	0x5
	.uleb128 0x573
	.long	.LASF3497
	.byte	0x5
	.uleb128 0x576
	.long	.LASF3498
	.byte	0x5
	.uleb128 0x577
	.long	.LASF3499
	.byte	0x5
	.uleb128 0x578
	.long	.LASF3500
	.byte	0x5
	.uleb128 0x579
	.long	.LASF3501
	.byte	0x5
	.uleb128 0x57b
	.long	.LASF3502
	.byte	0x5
	.uleb128 0x57d
	.long	.LASF3503
	.byte	0x5
	.uleb128 0x5a1
	.long	.LASF3504
	.byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF2191:
	.string	"gettmode() "
.LASF3440:
	.string	"PERF_MEM_OP_STORE 0x04"
.LASF2127:
	.string	"ACS_BSSS ACS_TTEE"
.LASF3553:
	.string	"long long int"
.LASF1610:
	.string	"_CS_POSIX_V7_LP64_OFF64_LINTFLAGS _CS_POSIX_V7_LP64_OFF64_LINTFLAGS"
.LASF1470:
	.string	"_SC_C_LANG_SUPPORT_R _SC_C_LANG_SUPPORT_R"
.LASF1200:
	.string	"AT_REMOVEDIR 0x200"
.LASF1733:
	.string	"__DECL_SIMD_exp10l "
.LASF1292:
	.string	"_POSIX_V6_LPBIG_OFFBIG -1"
.LASF2506:
	.string	"RESIDENCY_STATE_REGULATION_STATUS 16"
.LASF2705:
	.string	"__NR_get_kernel_syms 177"
.LASF727:
	.string	"INT_FAST8_MIN (-128)"
.LASF3619:
	.string	"average"
.LASF1815:
	.string	"__DECL_SIMD_log1pf32 "
.LASF467:
	.string	"__REDIRECT(name,proto,alias) name proto __asm__ (__ASMNAME (#alias))"
.LASF1415:
	.string	"_SC_THREAD_PRIO_PROTECT _SC_THREAD_PRIO_PROTECT"
.LASF2834:
	.string	"__NR_syncfs 306"
.LASF3226:
	.string	"SYS_sysinfo __NR_sysinfo"
.LASF3235:
	.string	"SYS_timer_settime __NR_timer_settime"
.LASF2687:
	.string	"__NR_adjtimex 159"
.LASF3485:
	.string	"PERF_MEM_LOCK_SHIFT 24"
.LASF1728:
	.string	"__DECL_SIMD_exp2f32x "
.LASF2483:
	.string	"NCURSES_UNCTRL_H_incl 1"
.LASF538:
	.string	"__GLIBC_USE_IEC_60559_FUNCS_EXT 0"
.LASF2908:
	.string	"SYS_adjtimex __NR_adjtimex"
.LASF2829:
	.string	"__NR_fanotify_mark 301"
.LASF997:
	.string	"ENOTUNIQ 76"
.LASF1891:
	.string	"HUGE_VAL (__builtin_huge_val ())"
.LASF158:
	.string	"__FLT_MAX_10_EXP__ 38"
.LASF310:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 1"
.LASF1797:
	.string	"__DECL_SIMD_log10f128 "
.LASF2588:
	.string	"__NR_exit 60"
.LASF2606:
	.string	"__NR_getdents 78"
.LASF2844:
	.string	"__NR_renameat2 316"
.LASF2621:
	.string	"__NR_fchown 93"
.LASF119:
	.string	"__INT32_C(c) c"
.LASF2073:
	.string	"WA_LEFT A_LEFT"
.LASF783:
	.string	"_STDLIB_H 1"
.LASF1001:
	.string	"ELIBBAD 80"
.LASF3544:
	.string	"__pad5"
.LASF1124:
	.string	"DEFFILEMODE (S_IRUSR|S_IWUSR|S_IRGRP|S_IWGRP|S_IROTH|S_IWOTH)"
.LASF3323:
	.string	"__LITTLE_ENDIAN_BITFIELD "
.LASF922:
	.string	"EPERM 1"
.LASF2017:
	.string	"NCURSES_PAIRS_T short"
.LASF1998:
	.string	"NCURSES_MOUSE_VERSION 2"
.LASF3505:
	.string	"long unsigned int"
.LASF2161:
	.string	"A_STANDOUT NCURSES_BITS(1U,8)"
.LASF2668:
	.string	"__NR_getpriority 140"
.LASF121:
	.string	"__INT_LEAST64_MAX__ 0x7fffffffffffffffL"
.LASF766:
	.string	"__wchar_t__ "
.LASF3177:
	.string	"SYS_sendmmsg __NR_sendmmsg"
.LASF327:
	.string	"__SIZEOF_WCHAR_T__ 4"
.LASF2707:
	.string	"__NR_quotactl 179"
.LASF1091:
	.string	"S_IFLNK __S_IFLNK"
.LASF1236:
	.string	"_POSIX_MEMLOCK 200809L"
.LASF3205:
	.string	"SYS_shmctl __NR_shmctl"
.LASF1381:
	.string	"_SC_2_C_DEV _SC_2_C_DEV"
.LASF259:
	.string	"__FLT32X_MIN__ 2.22507385850720138309023271733240406e-308F32x"
.LASF2053:
	.string	"_STDBOOL_H "
.LASF1182:
	.string	"LOCK_EX 2"
.LASF2765:
	.string	"__NR_mbind 237"
.LASF1034:
	.string	"EHOSTUNREACH 113"
.LASF567:
	.string	"__need___va_list"
.LASF2389:
	.string	"KEY_SCREATE 0576"
.LASF1569:
	.string	"_CS_XBS5_ILP32_OFF32_LIBS _CS_XBS5_ILP32_OFF32_LIBS"
.LASF560:
	.string	"_SIZET_ "
.LASF2107:
	.string	"ACS_RARROW NCURSES_ACS('+')"
.LASF1186:
	.string	"FFSYNC O_FSYNC"
.LASF1035:
	.string	"EALREADY 114"
.LASF968:
	.string	"EL3RST 47"
.LASF2120:
	.string	"ACS_BSSB ACS_ULCORNER"
.LASF1503:
	.string	"_SC_2_PBS_ACCOUNTING _SC_2_PBS_ACCOUNTING"
.LASF3092:
	.string	"SYS_newfstatat __NR_newfstatat"
.LASF1268:
	.string	"_POSIX_REGEXP 1"
.LASF257:
	.string	"__FLT32X_MAX__ 1.79769313486231570814527423731704357e+308F32x"
.LASF3286:
	.string	"_LINUX_IOCTL_H "
.LASF3637:
	.string	"fscanf"
.LASF1687:
	.string	"__DECL_SIMD_acosf128 "
.LASF1719:
	.string	"__DECL_SIMD_hypotf64x "
.LASF602:
	.string	"__BLKCNT64_T_TYPE __SQUAD_TYPE"
.LASF3564:
	.string	"time_unit"
.LASF1740:
	.string	"__DECL_SIMD_exp10f128x "
.LASF1264:
	.string	"_LFS64_STDIO 1"
.LASF2800:
	.string	"__NR_unshare 272"
.LASF2983:
	.string	"SYS_get_kernel_syms __NR_get_kernel_syms"
.LASF302:
	.string	"__DEC128_SUBNORMAL_MIN__ 0.000000000000000000000000000000001E-6143DL"
.LASF2424:
	.string	"NCURSES_DOUBLE_CLICKED 010L"
.LASF837:
	.string	"__LITTLE_ENDIAN 1234"
.LASF1008:
	.string	"EUSERS 87"
.LASF3362:
	.string	"__cpu_to_be32(x) ((__be32)__swab32((x)))"
.LASF1310:
	.string	"L_XTND SEEK_END"
.LASF1551:
	.string	"_CS_V6_WIDTH_RESTRICTED_ENVS _CS_V6_WIDTH_RESTRICTED_ENVS"
.LASF2585:
	.string	"__NR_fork 57"
.LASF1488:
	.string	"_SC_SPIN_LOCKS _SC_SPIN_LOCKS"
.LASF810:
	.string	"WIFSTOPPED(status) __WIFSTOPPED (status)"
.LASF1615:
	.string	"_CS_V6_ENV _CS_V6_ENV"
.LASF426:
	.string	"__USE_ATFILE 1"
.LASF37:
	.string	"__SIZEOF_POINTER__ 8"
.LASF2458:
	.string	"BUTTON_PRESS(e,x) ((e) & NCURSES_MOUSE_MASK(x, 002))"
.LASF384:
	.string	"__USE_XOPEN2K8"
.LASF797:
	.string	"__WIFSIGNALED(status) (((signed char) (((status) & 0x7f) + 1) >> 1) > 0)"
.LASF3410:
	.string	"PERF_RECORD_MISC_KERNEL (1 << 0)"
.LASF3499:
	.string	"PERF_MEM_HOPS_1 0x02"
.LASF1578:
	.string	"_CS_XBS5_LP64_OFF64_LINTFLAGS _CS_XBS5_LP64_OFF64_LINTFLAGS"
.LASF2323:
	.string	"is_linetouched(w,l) ((!(w) || ((l) > getmaxy(w)) || ((l) < 0)) ? ERR : (is_linetouched)((w),(l)))"
.LASF1710:
	.string	"__DECL_SIMD_asinf128x "
.LASF1251:
	.string	"_POSIX_THREAD_PRIO_INHERIT 200809L"
.LASF3374:
	.string	"__cpu_to_be32s(x) __swab32s((x))"
.LASF2061:
	.string	"WA_ATTRIBUTES A_ATTRIBUTES"
.LASF1269:
	.string	"_POSIX_READER_WRITER_LOCKS 200809L"
.LASF764:
	.string	"_GCC_WRAP_STDINT_H "
.LASF287:
	.string	"__DEC32_EPSILON__ 1E-6DF"
.LASF1831:
	.string	"__DECL_SIMD_acosh "
.LASF2372:
	.string	"KEY_MESSAGE 0555"
.LASF1275:
	.string	"_POSIX_BARRIERS 200809L"
.LASF3020:
	.string	"SYS_io_cancel __NR_io_cancel"
.LASF2311:
	.string	"is_immedok(win) (NCURSES_OK_ADDR(win) ? (win)->_immed : FALSE)"
.LASF3037:
	.string	"SYS_keyctl __NR_keyctl"
.LASF1115:
	.string	"S_IWGRP (S_IWUSR >> 3)"
.LASF898:
	.string	"__SIZEOF_PTHREAD_MUTEXATTR_T 4"
.LASF2182:
	.string	"setsyx(y,x) do { if (newscr) { if ((y) == -1 && (x) == -1) leaveok(newscr, TRUE); else { leaveok(newscr, FALSE); wmove(newscr, (y), (x)); } } } while(0)"
.LASF1691:
	.string	"__DECL_SIMD_atan "
.LASF3129:
	.string	"SYS_quotactl __NR_quotactl"
.LASF1472:
	.string	"_SC_CPUTIME _SC_CPUTIME"
.LASF149:
	.string	"__FLT_EVAL_METHOD__ 0"
.LASF2308:
	.string	"is_cleared(win) (NCURSES_OK_ADDR(win) ? (win)->_clear : FALSE)"
.LASF2023:
	.string	"NCURSES_REENTRANT 0"
.LASF20:
	.string	"_LP64 1"
.LASF3481:
	.string	"PERF_MEM_SNOOPX_PEER 0x02"
.LASF2888:
	.string	"__NR_futex_waitv 449"
.LASF1493:
	.string	"_SC_SPAWN _SC_SPAWN"
.LASF1853:
	.string	"__DECL_SIMD_tanhl "
.LASF2196:
	.string	"getbegy(win) (NCURSES_OK_ADDR(win) ? (win)->_begy : ERR)"
.LASF2630:
	.string	"__NR_getuid 102"
.LASF454:
	.string	"__bos0(ptr) __builtin_object_size (ptr, 0)"
.LASF2165:
	.string	"A_DIM NCURSES_BITS(1U,12)"
.LASF1952:
	.string	"__MATHCALL_NARROW_REDIR"
.LASF1379:
	.string	"_SC_2_VERSION _SC_2_VERSION"
.LASF1505:
	.string	"_SC_2_PBS_MESSAGE _SC_2_PBS_MESSAGE"
.LASF379:
	.string	"__USE_XOPEN"
.LASF2464:
	.string	"_tracech_t _tracechtype"
.LASF630:
	.string	"_____fpos_t_defined 1"
.LASF1966:
	.string	"isnan(x) __builtin_isnan (x)"
.LASF3470:
	.string	"PERF_MEM_LVLNUM_RAM 0x0d"
.LASF1329:
	.string	"_PC_ALLOC_SIZE_MIN _PC_ALLOC_SIZE_MIN"
.LASF1496:
	.string	"_SC_SYSTEM_DATABASE _SC_SYSTEM_DATABASE"
.LASF2955:
	.string	"SYS_fallocate __NR_fallocate"
.LASF1738:
	.string	"__DECL_SIMD_exp10f32x "
.LASF1727:
	.string	"__DECL_SIMD_exp2f128 "
.LASF2982:
	.string	"SYS_futimesat __NR_futimesat"
.LASF1956:
	.string	"__MATH_TG(TG_ARG,FUNC,ARGS) _Generic ((TG_ARG), float: FUNC ## f ARGS, __MATH_TG_F32 (FUNC, ARGS) default: FUNC ARGS, long double: FUNC ## l ARGS, __MATH_TG_F64X (FUNC, ARGS) _Float128: FUNC ## f128 ARGS)"
.LASF3118:
	.string	"SYS_process_madvise __NR_process_madvise"
.LASF2275:
	.string	"mvwhline(win,y,x,c,n) (wmove((win),(y),(x)) == ERR ? ERR : whline((win),(c),(n)))"
.LASF190:
	.string	"__LDBL_MAX_10_EXP__ 4932"
.LASF69:
	.string	"__UINT_FAST8_TYPE__ unsigned char"
.LASF58:
	.string	"__INT_LEAST16_TYPE__ short int"
.LASF907:
	.string	"__PTHREAD_MUTEX_HAVE_PREV 1"
.LASF3128:
	.string	"SYS_query_module __NR_query_module"
.LASF1073:
	.string	"__S_IFSOCK 0140000"
.LASF956:
	.string	"EDEADLK 35"
.LASF838:
	.string	"__BIG_ENDIAN 4321"
.LASF978:
	.string	"EBADSLT 57"
.LASF1572:
	.string	"_CS_XBS5_ILP32_OFFBIG_LDFLAGS _CS_XBS5_ILP32_OFFBIG_LDFLAGS"
.LASF2361:
	.string	"KEY_BEG 0542"
.LASF1116:
	.string	"S_IXGRP (S_IXUSR >> 3)"
.LASF1579:
	.string	"_CS_XBS5_LPBIG_OFFBIG_CFLAGS _CS_XBS5_LPBIG_OFFBIG_CFLAGS"
.LASF2500:
	.string	"PKG_THERMAL_STATUS 1"
.LASF1345:
	.string	"_SC_PRIORITIZED_IO _SC_PRIORITIZED_IO"
.LASF3158:
	.string	"SYS_sched_get_priority_min __NR_sched_get_priority_min"
.LASF60:
	.string	"__INT_LEAST64_TYPE__ long int"
.LASF196:
	.string	"__LDBL_EPSILON__ 1.08420217248550443400745280086994171e-19L"
.LASF1594:
	.string	"_CS_POSIX_V6_LP64_OFF64_LINTFLAGS _CS_POSIX_V6_LP64_OFF64_LINTFLAGS"
.LASF1901:
	.string	"__SIMD_DECL(function) __CONCAT (__DECL_SIMD_, function)"
.LASF2623:
	.string	"__NR_umask 95"
.LASF2997:
	.string	"SYS_getpgid __NR_getpgid"
.LASF1323:
	.string	"_PC_SOCK_MAXBUF _PC_SOCK_MAXBUF"
.LASF118:
	.string	"__INT_LEAST32_MAX__ 0x7fffffff"
.LASF399:
	.string	"__GNUC_PREREQ(maj,min) ((__GNUC__ << 16) + __GNUC_MINOR__ >= ((maj) << 16) + (min))"
.LASF2388:
	.string	"KEY_SCOPY 0575"
.LASF466:
	.string	"__glibc_c99_flexarr_available 1"
.LASF1118:
	.string	"S_IROTH (S_IRGRP >> 3)"
.LASF2065:
	.string	"WA_REVERSE A_REVERSE"
.LASF1680:
	.string	"__DECL_SIMD_powf128x "
.LASF3582:
	.string	"result"
.LASF3024:
	.string	"SYS_io_setup __NR_io_setup"
.LASF2712:
	.string	"__NR_tuxcall 184"
.LASF1083:
	.string	"UTIME_NOW ((1l << 30) - 1l)"
.LASF3234:
	.string	"SYS_timer_gettime __NR_timer_gettime"
.LASF2659:
	.string	"__NR_sigaltstack 131"
.LASF1201:
	.string	"AT_SYMLINK_FOLLOW 0x400"
.LASF3011:
	.string	"SYS_gettid __NR_gettid"
.LASF2310:
	.string	"is_idlok(win) (NCURSES_OK_ADDR(win) ? (win)->_idlok : FALSE)"
.LASF1222:
	.string	"_XOPEN_XCU_VERSION 4"
.LASF1860:
	.string	"__DECL_SIMD_tanhf128x "
.LASF1077:
	.string	"__S_ISUID 04000"
.LASF1595:
	.string	"_CS_POSIX_V6_LPBIG_OFFBIG_CFLAGS _CS_POSIX_V6_LPBIG_OFFBIG_CFLAGS"
.LASF2988:
	.string	"SYS_getcwd __NR_getcwd"
.LASF3602:
	.string	"get_amd_pkg_power_w"
.LASF2012:
	.string	"NCURSES_INLINE"
.LASF3316:
	.string	"IOC_IN (_IOC_WRITE << _IOC_DIRSHIFT)"
.LASF1983:
	.string	"M_SQRT1_2 0.70710678118654752440"
.LASF48:
	.string	"__SIG_ATOMIC_TYPE__ int"
.LASF2717:
	.string	"__NR_lsetxattr 189"
.LASF3456:
	.string	"PERF_MEM_LVL_IO 0x1000"
.LASF410:
	.string	"_POSIX_SOURCE 1"
.LASF1180:
	.string	"F_SHLCK 8"
.LASF856:
	.string	"le16toh(x) __uint16_identity (x)"
.LASF3109:
	.string	"SYS_pkey_free __NR_pkey_free"
.LASF1038:
	.string	"EUCLEAN 117"
.LASF3354:
	.string	"__cpu_to_le64(x) ((__le64)(__u64)(x))"
.LASF458:
	.string	"__glibc_unsigned_or_positive(__l) ((__typeof (__l)) 0 < (__typeof (__l)) -1 || (__builtin_constant_p (__l) && (__l) > 0))"
.LASF2206:
	.string	"touchwin(win) wtouchln((win), 0, getmaxy(win), 1)"
.LASF619:
	.string	"__SSIZE_T_TYPE __SWORD_TYPE"
.LASF3467:
	.string	"PERF_MEM_LVLNUM_IO 0x0a"
.LASF1313:
	.string	"_PC_MAX_INPUT _PC_MAX_INPUT"
.LASF1683:
	.string	"__DECL_SIMD_acosl "
.LASF3224:
	.string	"SYS_syncfs __NR_syncfs"
.LASF605:
	.string	"__FSFILCNT_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF1947:
	.string	"__MATHCALL_NARROW(func,redir,nargs) __MATHCALL_NARROW_NORMAL (func, nargs)"
.LASF2000:
	.string	"NCURSES_PUBLIC_VAR(name) _nc_ ##name"
.LASF1859:
	.string	"__DECL_SIMD_tanhf64x "
.LASF1297:
	.string	"__ILP32_OFF32_CFLAGS \"-m32\""
.LASF1427:
	.string	"_SC_XOPEN_ENH_I18N _SC_XOPEN_ENH_I18N"
.LASF999:
	.string	"EREMCHG 78"
.LASF2320:
	.string	"wgetdelay(win) (NCURSES_OK_ADDR(win) ? (win)->_delay : 0)"
.LASF2974:
	.string	"SYS_fsopen __NR_fsopen"
.LASF3462:
	.string	"PERF_MEM_LVLNUM_L2 0x02"
.LASF2419:
	.string	"_XOPEN_CURSES 1"
.LASF289:
	.string	"__DEC64_MANT_DIG__ 16"
.LASF2737:
	.string	"__NR_io_submit 209"
.LASF2934:
	.string	"SYS_delete_module __NR_delete_module"
.LASF335:
	.string	"__SIZEOF_FLOAT128__ 16"
.LASF666:
	.string	"__attr_dealloc_fclose __attr_dealloc (fclose, 1)"
.LASF3395:
	.string	"PERF_ATTR_SIZE_VER8 136"
.LASF3342:
	.string	"__constant_cpu_to_le64(x) ((__le64)(__u64)(x))"
.LASF2927:
	.string	"SYS_clone3 __NR_clone3"
.LASF3026:
	.string	"SYS_io_uring_enter __NR_io_uring_enter"
.LASF3122:
	.string	"SYS_pselect6 __NR_pselect6"
.LASF499:
	.string	"__glibc_likely(cond) __builtin_expect ((cond), 1)"
.LASF3561:
	.string	"pkg_now"
.LASF972:
	.string	"EL2HLT 51"
.LASF3331:
	.string	"___constant_swahw32(x) ((__u32)( (((__u32)(x) & (__u32)0x0000ffffUL) << 16) | (((__u32)(x) & (__u32)0xffff0000UL) >> 16)))"
.LASF3009:
	.string	"SYS_getsockname __NR_getsockname"
.LASF7:
	.string	"__GNUC_PATCHLEVEL__ 0"
.LASF1082:
	.string	"__S_IEXEC 0100"
.LASF2759:
	.string	"__NR_exit_group 231"
.LASF2842:
	.string	"__NR_sched_setattr 314"
.LASF1635:
	.string	"__DECL_SIMD_sinf32 "
.LASF1565:
	.string	"_CS_LFS64_LIBS _CS_LFS64_LIBS"
.LASF2370:
	.string	"KEY_HELP 0553"
.LASF338:
	.string	"__GCC_ASM_FLAG_OUTPUTS__ 1"
.LASF1992:
	.string	"CURSES_H 1"
.LASF424:
	.string	"__TIMESIZE __WORDSIZE"
.LASF72:
	.string	"__UINT_FAST64_TYPE__ long unsigned int"
.LASF3031:
	.string	"SYS_iopl __NR_iopl"
.LASF2494:
	.string	"MSR_PERF_STATUS 0x198"
.LASF2383:
	.string	"KEY_RESUME 0570"
.LASF2815:
	.string	"__NR_timerfd_gettime 287"
.LASF1015:
	.string	"ESOCKTNOSUPPORT 94"
.LASF2496:
	.string	"MSR_PKG_POWER_LIMIT 0x610"
.LASF3583:
	.string	"prochot"
.LASF3207:
	.string	"SYS_shmget __NR_shmget"
.LASF329:
	.string	"__SIZEOF_PTRDIFF_T__ 8"
.LASF3321:
	.string	"_ASM_X86_BYTEORDER_H "
.LASF1164:
	.string	"F_GETFL 3"
.LASF658:
	.string	"FILENAME_MAX 4096"
.LASF318:
	.string	"__GCC_ATOMIC_LONG_LOCK_FREE 2"
.LASF31:
	.string	"__BIGGEST_ALIGNMENT__ 16"
.LASF2356:
	.string	"KEY_A3 0535"
.LASF1099:
	.string	"S_ISLNK(mode) __S_ISTYPE((mode), __S_IFLNK)"
.LASF2866:
	.string	"__NR_io_uring_register 427"
.LASF1618:
	.string	"_GETOPT_CORE_H 1"
.LASF1609:
	.string	"_CS_POSIX_V7_LP64_OFF64_LIBS _CS_POSIX_V7_LP64_OFF64_LIBS"
.LASF3269:
	.string	"__ASM_GENERIC_BITS_PER_LONG "
.LASF1896:
	.string	"__GLIBC_FLT_EVAL_METHOD __FLT_EVAL_METHOD__"
.LASF2732:
	.string	"__NR_sched_getaffinity 204"
.LASF3193:
	.string	"SYS_setpriority __NR_setpriority"
.LASF3006:
	.string	"SYS_getrlimit __NR_getrlimit"
.LASF676:
	.string	"__HAVE_FLOAT32 1"
.LASF1625:
	.string	"__DECL_SIMD_cosf32 "
.LASF2877:
	.string	"__NR_pidfd_getfd 438"
.LASF2426:
	.string	"NCURSES_RESERVED_EVENT 040L"
.LASF1117:
	.string	"S_IRWXG (S_IRWXU >> 3)"
.LASF2783:
	.string	"__NR_inotify_rm_watch 255"
.LASF3042:
	.string	"SYS_lchown __NR_lchown"
.LASF688:
	.string	"__f32(x) x ##f32"
.LASF2925:
	.string	"SYS_clock_settime __NR_clock_settime"
.LASF2488:
	.string	"BATTERY_STATUS_BUF_SIZE 20"
.LASF2106:
	.string	"ACS_LARROW NCURSES_ACS(',')"
.LASF187:
	.string	"__LDBL_MIN_EXP__ (-16381)"
.LASF3161:
	.string	"SYS_sched_getparam __NR_sched_getparam"
.LASF3550:
	.string	"_IO_wide_data"
.LASF1167:
	.string	"__F_GETOWN 9"
.LASF298:
	.string	"__DEC128_MAX_EXP__ 6145"
.LASF3268:
	.string	"__BITS_PER_LONG 64"
.LASF3104:
	.string	"SYS_pidfd_send_signal __NR_pidfd_send_signal"
.LASF3587:
	.string	"vr_therm"
.LASF2624:
	.string	"__NR_gettimeofday 96"
.LASF1431:
	.string	"_SC_2_UPE _SC_2_UPE"
.LASF1303:
	.string	"STDIN_FILENO 0"
.LASF2711:
	.string	"__NR_afs_syscall 183"
.LASF2736:
	.string	"__NR_io_getevents 208"
.LASF1794:
	.string	"__DECL_SIMD_log10f16 "
.LASF3639:
	.string	"perror"
.LASF1631:
	.string	"__DECL_SIMD_sin "
.LASF2703:
	.string	"__NR_init_module 175"
.LASF3250:
	.string	"SYS_userfaultfd __NR_userfaultfd"
.LASF879:
	.string	"__FD_MASK(d) ((__fd_mask) (1UL << ((d) % __NFDBITS)))"
.LASF1037:
	.string	"ESTALE 116"
.LASF503:
	.string	"__LDOUBLE_REDIRECTS_TO_FLOAT128_ABI 0"
.LASF1903:
	.string	"__MATHDECL_VEC(type,function,suffix,args) __SIMD_DECL (__MATH_PRECNAME (function, suffix)) __MATHDECL(type, function,suffix, args)"
.LASF823:
	.string	"__mode_t_defined "
.LASF2813:
	.string	"__NR_fallocate 285"
.LASF1658:
	.string	"__DECL_SIMD_logf32x "
.LASF2208:
	.string	"untouchwin(win) wtouchln((win), 0, getmaxy(win), 0)"
.LASF1630:
	.string	"__DECL_SIMD_cosf128x "
.LASF3131:
	.string	"SYS_read __NR_read"
.LASF2189:
	.string	"crmode() cbreak()"
.LASF1067:
	.string	"__S_IFDIR 0040000"
.LASF873:
	.string	"__timeval_defined 1"
.LASF2123:
	.string	"ACS_SBBS ACS_LRCORNER"
.LASF2267:
	.string	"mvwaddchstr(win,y,x,str) (wmove((win),(y),(x)) == ERR ? ERR : waddchnstr((win),(str),-1))"
.LASF2366:
	.string	"KEY_CREATE 0547"
.LASF1239:
	.string	"_POSIX_CHOWN_RESTRICTED 0"
.LASF1394:
	.string	"_SC_IOV_MAX _SC_IOV_MAX"
.LASF2466:
	.string	"TRACE_DISABLE 0x0000"
.LASF1935:
	.string	"_Mdouble_ _Float64x"
.LASF2846:
	.string	"__NR_getrandom 318"
.LASF2142:
	.string	"GCC_PRINTFLIKE(fmt,var) __attribute__((format(printf,fmt,var)))"
.LASF987:
	.string	"EREMOTE 66"
.LASF47:
	.string	"__CHAR32_TYPE__ unsigned int"
.LASF2960:
	.string	"SYS_fchmodat __NR_fchmodat"
.LASF301:
	.string	"__DEC128_EPSILON__ 1E-33DL"
.LASF54:
	.string	"__UINT16_TYPE__ short unsigned int"
.LASF3076:
	.string	"SYS_mq_notify __NR_mq_notify"
.LASF2657:
	.string	"__NR_rt_sigqueueinfo 129"
.LASF3179:
	.string	"SYS_sendto __NR_sendto"
.LASF155:
	.string	"__FLT_MIN_EXP__ (-125)"
.LASF64:
	.string	"__UINT_LEAST64_TYPE__ long unsigned int"
.LASF2022:
	.string	"NCURSES_WATTR_MACROS 0"
.LASF1981:
	.string	"M_2_SQRTPI 1.12837916709551257390"
.LASF2244:
	.string	"getch() wgetch(stdscr)"
.LASF1139:
	.string	"O_APPEND 02000"
.LASF320:
	.string	"__GCC_ATOMIC_TEST_AND_SET_TRUEVAL 1"
.LASF3054:
	.string	"SYS_madvise __NR_madvise"
.LASF1075:
	.string	"__S_TYPEISSEM(buf) ((buf)->st_mode - (buf)->st_mode)"
.LASF3453:
	.string	"PERF_MEM_LVL_REM_RAM2 0x200"
.LASF1302:
	.string	"__LP64_OFF64_LDFLAGS \"-m64\""
.LASF349:
	.string	"__SEG_FS 1"
.LASF586:
	.string	"__SYSCALL_SLONG_TYPE __SLONGWORD_TYPE"
.LASF1018:
	.string	"EAFNOSUPPORT 97"
.LASF114:
	.string	"__INT_LEAST8_WIDTH__ 8"
.LASF1819:
	.string	"__DECL_SIMD_log1pf64x "
.LASF610:
	.string	"__USECONDS_T_TYPE __U32_TYPE"
.LASF2586:
	.string	"__NR_vfork 58"
.LASF478:
	.string	"__attribute_used__ __attribute__ ((__used__))"
.LASF3073:
	.string	"SYS_move_pages __NR_move_pages"
.LASF2916:
	.string	"SYS_capset __NR_capset"
.LASF1893:
	.string	"HUGE_VALL (__builtin_huge_vall ())"
.LASF2910:
	.string	"SYS_alarm __NR_alarm"
.LASF1145:
	.string	"__O_DIRECTORY 0200000"
.LASF27:
	.string	"__SIZEOF_DOUBLE__ 8"
.LASF2134:
	.string	"_ENDLINE 0x02"
.LASF1790:
	.string	"__DECL_SIMD_atan2f128x "
.LASF2784:
	.string	"__NR_migrate_pages 256"
.LASF3614:
	.string	"time_y"
.LASF3615:
	.string	"time_z"
.LASF381:
	.string	"__USE_UNIX98"
.LASF2445:
	.string	"BUTTON4_DOUBLE_CLICKED NCURSES_MOUSE_MASK(4, NCURSES_DOUBLE_CLICKED)"
.LASF488:
	.string	"__wur "
.LASF2913:
	.string	"SYS_bpf __NR_bpf"
.LASF306:
	.string	"__NO_INLINE__ 1"
.LASF1010:
	.string	"EDESTADDRREQ 89"
.LASF2278:
	.string	"mvwinchstr(win,y,x,s) (wmove((win),(y),(x)) == ERR ? ERR : winchstr((win),(s)))"
.LASF2263:
	.string	"wdeleteln(win) winsdelln(win,-1)"
.LASF2538:
	.string	"__NR_mprotect 10"
.LASF661:
	.string	"FOPEN_MAX 16"
.LASF3140:
	.string	"SYS_remap_file_pages __NR_remap_file_pages"
.LASF1538:
	.string	"_SC_V7_LP64_OFF64 _SC_V7_LP64_OFF64"
.LASF3080:
	.string	"SYS_mq_unlink __NR_mq_unlink"
.LASF2678:
	.string	"__NR_munlock 150"
.LASF3418:
	.string	"PERF_RECORD_MISC_FORK_EXEC (1 << 13)"
.LASF3119:
	.string	"SYS_process_mrelease __NR_process_mrelease"
.LASF1660:
	.string	"__DECL_SIMD_logf128x "
.LASF1953:
	.string	"__MATHCALL_NARROW"
.LASF3230:
	.string	"SYS_time __NR_time"
.LASF816:
	.string	"EXIT_SUCCESS 0"
.LASF2862:
	.string	"__NR_rseq 334"
.LASF2018:
	.string	"NCURSES_OPAQUE 0"
.LASF715:
	.string	"INT_LEAST8_MIN (-128)"
.LASF3397:
	.string	"PERF_EVENT_IOC_DISABLE _IO ('$', 1)"
.LASF35:
	.string	"__BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__"
.LASF3398:
	.string	"PERF_EVENT_IOC_REFRESH _IO ('$', 2)"
.LASF3593:
	.string	"turbo_transition_attenuation"
.LASF2302:
	.string	"mvinsstr(y,x,s) mvwinsstr(stdscr,(y),(x),(s))"
.LASF3239:
	.string	"SYS_times __NR_times"
.LASF365:
	.string	"__STDC_IEC_60559_COMPLEX__ 201404L"
.LASF672:
	.string	"__f128(x) x ##f128"
.LASF962:
	.string	"EWOULDBLOCK EAGAIN"
.LASF2369:
	.string	"KEY_FIND 0552"
.LASF2978:
	.string	"SYS_fsync __NR_fsync"
.LASF626:
	.string	"__FD_SETSIZE 1024"
.LASF2863:
	.string	"__NR_pidfd_send_signal 424"
.LASF2080:
	.string	"COLOR_RED 1"
.LASF3442:
	.string	"PERF_MEM_OP_EXEC 0x10"
.LASF957:
	.string	"ENAMETOOLONG 36"
.LASF1160:
	.string	"O_RSYNC O_SYNC"
.LASF368:
	.string	"__GLIBC_INTERNAL_STARTING_HEADER_IMPLEMENTATION "
.LASF1729:
	.string	"__DECL_SIMD_exp2f64x "
.LASF3493:
	.string	"PERF_MEM_TLB_SHIFT 26"
.LASF3357:
	.string	"__le32_to_cpu(x) ((__u32)(__le32)(x))"
.LASF0:
	.string	"__STDC__ 1"
.LASF1408:
	.string	"_SC_THREAD_KEYS_MAX _SC_THREAD_KEYS_MAX"
.LASF1233:
	.string	"_POSIX_SYNCHRONIZED_IO 200809L"
.LASF930:
	.string	"EBADF 9"
.LASF2572:
	.string	"__NR_sendto 44"
.LASF3266:
	.string	"_ASM_GENERIC_INT_LL64_H "
.LASF3620:
	.string	"register_content"
.LASF1138:
	.string	"O_TRUNC 01000"
.LASF2414:
	.string	"KEY_SUSPEND 0627"
.LASF3216:
	.string	"SYS_statfs __NR_statfs"
.LASF1554:
	.string	"_CS_GNU_LIBPTHREAD_VERSION _CS_GNU_LIBPTHREAD_VERSION"
.LASF1709:
	.string	"__DECL_SIMD_asinf64x "
.LASF1737:
	.string	"__DECL_SIMD_exp10f128 "
.LASF3198:
	.string	"SYS_setrlimit __NR_setrlimit"
.LASF860:
	.string	"le32toh(x) __uint32_identity (x)"
.LASF1031:
	.string	"ETIMEDOUT 110"
.LASF1971:
	.string	"M_E 2.7182818284590452354"
.LASF2658:
	.string	"__NR_rt_sigsuspend 130"
.LASF2007:
	.string	"NCURSES_API "
.LASF2647:
	.string	"__NR_setresgid 119"
.LASF1257:
	.string	"_POSIX_ASYNCHRONOUS_IO 200809L"
.LASF3210:
	.string	"SYS_signalfd __NR_signalfd"
.LASF1199:
	.string	"AT_SYMLINK_NOFOLLOW 0x100"
.LASF916:
	.string	"alloca(size) __builtin_alloca (size)"
.LASF2973:
	.string	"SYS_fsmount __NR_fsmount"
.LASF2355:
	.string	"KEY_A1 0534"
.LASF1101:
	.string	"S_TYPEISMQ(buf) __S_TYPEISMQ(buf)"
.LASF1119:
	.string	"S_IWOTH (S_IWGRP >> 3)"
.LASF574:
	.string	"__SLONGWORD_TYPE long int"
.LASF592:
	.string	"__INO64_T_TYPE __UQUAD_TYPE"
.LASF1975:
	.string	"M_LN10 2.30258509299404568402"
.LASF2970:
	.string	"SYS_fremovexattr __NR_fremovexattr"
.LASF2950:
	.string	"SYS_exit __NR_exit"
.LASF2088:
	.string	"ACS_ULCORNER NCURSES_ACS('l')"
.LASF594:
	.string	"__NLINK_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF1560:
	.string	"_CS_LFS_LDFLAGS _CS_LFS_LDFLAGS"
.LASF3059:
	.string	"SYS_migrate_pages __NR_migrate_pages"
.LASF1512:
	.string	"_SC_V6_LP64_OFF64 _SC_V6_LP64_OFF64"
.LASF1122:
	.string	"ACCESSPERMS (S_IRWXU|S_IRWXG|S_IRWXO)"
.LASF2760:
	.string	"__NR_epoll_wait 232"
.LASF2702:
	.string	"__NR_create_module 174"
.LASF132:
	.string	"__INT_FAST8_MAX__ 0x7f"
.LASF835:
	.string	"_ENDIAN_H 1"
.LASF1656:
	.string	"__DECL_SIMD_logf64 "
.LASF2977:
	.string	"SYS_fstatfs __NR_fstatfs"
.LASF1442:
	.string	"_SC_MB_LEN_MAX _SC_MB_LEN_MAX"
.LASF305:
	.string	"__GNUC_STDC_INLINE__ 1"
.LASF1320:
	.string	"_PC_SYNC_IO _PC_SYNC_IO"
.LASF564:
	.string	"NULL ((void *)0)"
.LASF2396:
	.string	"KEY_SFIND 0605"
.LASF601:
	.string	"__BLKCNT_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF3349:
	.string	"__constant_be64_to_cpu(x) ___constant_swab64((__u64)(__be64)(x))"
.LASF470:
	.string	"__ASMNAME(cname) __ASMNAME2 (__USER_LABEL_PREFIX__, cname)"
.LASF890:
	.string	"__fsfilcnt_t_defined "
.LASF994:
	.string	"EDOTDOT 73"
.LASF2129:
	.string	"ACS_SBSB ACS_VLINE"
.LASF990:
	.string	"ESRMNT 69"
.LASF1351:
	.string	"_SC_MEMORY_PROTECTION _SC_MEMORY_PROTECTION"
.LASF1140:
	.string	"O_NONBLOCK 04000"
.LASF1657:
	.string	"__DECL_SIMD_logf128 "
.LASF3591:
	.string	"pkg_pl2"
.LASF3546:
	.string	"_unused2"
.LASF528:
	.string	"__stub_stty "
.LASF1539:
	.string	"_SC_V7_LPBIG_OFFBIG _SC_V7_LPBIG_OFFBIG"
.LASF1460:
	.string	"_SC_XBS5_ILP32_OFFBIG _SC_XBS5_ILP32_OFFBIG"
.LASF1617:
	.string	"_GETOPT_POSIX_H 1"
.LASF3388:
	.string	"PERF_ATTR_SIZE_VER1 72"
.LASF2379:
	.string	"KEY_REFERENCE 0564"
.LASF1026:
	.string	"ENOBUFS 105"
.LASF1307:
	.string	"__socklen_t_defined "
.LASF2322:
	.string	"wgetscrreg(win,t,b) (NCURSES_OK_ADDR(win) ? (*(t) = (win)->_regtop, *(b) = (win)->_regbottom, OK) : ERR)"
.LASF2179:
	.string	"getmaxyx(win,y,x) (y = getmaxy(win), x = getmaxx(win))"
.LASF3512:
	.string	"size_t"
.LASF3021:
	.string	"SYS_io_destroy __NR_io_destroy"
.LASF790:
	.string	"__WNOTHREAD 0x20000000"
.LASF422:
	.string	"__WORDSIZE_TIME64_COMPAT32 1"
.LASF804:
	.string	"__WCOREFLAG 0x80"
.LASF220:
	.string	"__FLT64_MIN_EXP__ (-1021)"
.LASF2293:
	.string	"mvgetnstr(y,x,str,n) mvwgetnstr(stdscr,(y),(x),(str),(n))"
.LASF304:
	.string	"__USER_LABEL_PREFIX__ "
.LASF2126:
	.string	"ACS_SSBS ACS_BTEE"
.LASF3281:
	.string	"__bitwise "
.LASF2984:
	.string	"SYS_get_mempolicy __NR_get_mempolicy"
.LASF3220:
	.string	"SYS_symlink __NR_symlink"
.LASF1120:
	.string	"S_IXOTH (S_IXGRP >> 3)"
.LASF2662:
	.string	"__NR_uselib 134"
.LASF2128:
	.string	"ACS_BSBS ACS_HLINE"
.LASF2010:
	.string	"NCURSES_CONST"
.LASF407:
	.string	"__USE_ISOC95 1"
.LASF2963:
	.string	"SYS_fcntl __NR_fcntl"
.LASF3256:
	.string	"SYS_vhangup __NR_vhangup"
.LASF279:
	.string	"__FLT64X_HAS_INFINITY__ 1"
.LASF945:
	.string	"EMFILE 24"
.LASF3439:
	.string	"PERF_MEM_OP_LOAD 0x02"
.LASF845:
	.string	"BIG_ENDIAN __BIG_ENDIAN"
.LASF1033:
	.string	"EHOSTDOWN 112"
.LASF1808:
	.string	"__DECL_SIMD_log2f32x "
.LASF1319:
	.string	"_PC_VDISABLE _PC_VDISABLE"
.LASF2670:
	.string	"__NR_sched_setparam 142"
.LASF93:
	.string	"__WINT_WIDTH__ 32"
.LASF565:
	.string	"__need_NULL"
.LASF2520:
	.string	"AMD_MSR_PACKAGE_ENERGY 0xC001029B"
.LASF518:
	.string	"__attr_dealloc(dealloc,argno) __attribute__ ((__malloc__ (dealloc, argno)))"
.LASF485:
	.string	"__nonnull(params) __attribute_nonnull__ (params)"
.LASF3384:
	.string	"PERF_BR_ARM64_DEBUG_INST PERF_BR_NEW_ARCH_4"
.LASF2072:
	.string	"WA_HORIZONTAL A_HORIZONTAL"
.LASF1810:
	.string	"__DECL_SIMD_log2f128x "
.LASF354:
	.string	"__linux__ 1"
.LASF1270:
	.string	"_POSIX_SHELL 1"
.LASF3348:
	.string	"__constant_cpu_to_be64(x) ((__be64)___constant_swab64((x)))"
.LASF1886:
	.string	"__DECL_SIMD_tanf64 "
.LASF1646:
	.string	"__DECL_SIMD_sincosf64 "
.LASF1520:
	.string	"_SC_LEVEL1_ICACHE_ASSOC _SC_LEVEL1_ICACHE_ASSOC"
.LASF800:
	.string	"__WCOREDUMP(status) ((status) & __WCOREFLAG)"
.LASF986:
	.string	"ENOPKG 65"
.LASF3578:
	.string	"exit"
.LASF2817:
	.string	"__NR_signalfd4 289"
.LASF2144:
	.string	"GCC_NORETURN "
.LASF1105:
	.string	"S_ISGID __S_ISGID"
.LASF2528:
	.string	"__NR_read 0"
.LASF1704:
	.string	"__DECL_SIMD_asinf16 "
.LASF446:
	.string	"__P(args) args"
.LASF2417:
	.string	"KEY_RESIZE 0632"
.LASF3371:
	.string	"__le16_to_cpus(x) do { (void)(x); } while (0)"
.LASF2131:
	.string	"ERR (-1)"
.LASF705:
	.string	"INT32_MIN (-2147483647-1)"
.LASF3175:
	.string	"SYS_semtimedop __NR_semtimedop"
.LASF3425:
	.string	"PERF_MAX_STACK_DEPTH 127"
.LASF684:
	.string	"__HAVE_DISTINCT_FLOAT64X 0"
.LASF3545:
	.string	"_mode"
.LASF1121:
	.string	"S_IRWXO (S_IRWXG >> 3)"
.LASF846:
	.string	"PDP_ENDIAN __PDP_ENDIAN"
.LASF2243:
	.string	"erase() werase(stdscr)"
.LASF1795:
	.string	"__DECL_SIMD_log10f32 "
.LASF3629:
	.string	"register_val"
.LASF2945:
	.string	"SYS_epoll_wait_old __NR_epoll_wait_old"
.LASF217:
	.string	"__FLT32_IS_IEC_60559__ 2"
.LASF1824:
	.string	"__DECL_SIMD_atanhf16 "
.LASF1072:
	.string	"__S_IFLNK 0120000"
.LASF1492:
	.string	"_SC_SIGNALS _SC_SIGNALS"
.LASF2710:
	.string	"__NR_putpmsg 182"
.LASF2303:
	.string	"mvinstr(y,x,s) mvwinstr(stdscr,(y),(x),(s))"
.LASF3502:
	.string	"PERF_MEM_HOPS_SHIFT 43"
.LASF1946:
	.string	"__MATHCALL_NARROW_REDIR(func,redir,nargs) extern _Mret_ __REDIRECT_NTH (func, __MATHCALL_NARROW_ARGS_ ## nargs, redir)"
.LASF3212:
	.string	"SYS_socket __NR_socket"
.LASF902:
	.string	"__SIZEOF_PTHREAD_BARRIERATTR_T 4"
.LASF455:
	.string	"__glibc_objsize0(__o) __bos0 (__o)"
.LASF1290:
	.string	"_POSIX_TYPED_MEMORY_OBJECTS -1"
.LASF1354:
	.string	"_SC_SHARED_MEMORY_OBJECTS _SC_SHARED_MEMORY_OBJECTS"
.LASF56:
	.string	"__UINT64_TYPE__ long unsigned int"
.LASF2511:
	.string	"PKG_PL1_STATUS 1024"
.LASF477:
	.string	"__attribute_maybe_unused__ __attribute__ ((__unused__))"
.LASF2336:
	.string	"KEY_F(n) (KEY_F0+(n))"
.LASF3608:
	.string	"power_w"
.LASF174:
	.string	"__DBL_MAX_10_EXP__ 308"
.LASF2790:
	.string	"__NR_newfstatat 262"
.LASF1684:
	.string	"__DECL_SIMD_acosf16 "
.LASF3428:
	.string	"PERF_AUX_FLAG_OVERWRITE 0x02"
.LASF2066:
	.string	"WA_BLINK A_BLINK"
.LASF2392:
	.string	"KEY_SELECT 0601"
.LASF2277:
	.string	"mvwinchnstr(win,y,x,s,n) (wmove((win),(y),(x)) == ERR ? ERR : winchnstr((win),(s),(n)))"
.LASF2961:
	.string	"SYS_fchown __NR_fchown"
.LASF3416:
	.string	"PERF_RECORD_MISC_MMAP_DATA (1 << 13)"
.LASF2816:
	.string	"__NR_accept4 288"
.LASF86:
	.string	"__SIZE_MAX__ 0xffffffffffffffffUL"
.LASF2193:
	.string	"getcurx(win) (NCURSES_OK_ADDR(win) ? (win)->_curx : ERR)"
.LASF3411:
	.string	"PERF_RECORD_MISC_USER (2 << 0)"
.LASF2102:
	.string	"ACS_CKBOARD NCURSES_ACS('a')"
.LASF2697:
	.string	"__NR_reboot 169"
.LASF2936:
	.string	"SYS_dup2 __NR_dup2"
.LASF1076:
	.string	"__S_TYPEISSHM(buf) ((buf)->st_mode - (buf)->st_mode)"
.LASF2457:
	.string	"BUTTON_RELEASE(e,x) ((e) & NCURSES_MOUSE_MASK(x, 001))"
.LASF1467:
	.string	"_SC_BARRIERS _SC_BARRIERS"
.LASF2301:
	.string	"mvinsnstr(y,x,s,n) mvwinsnstr(stdscr,(y),(x),(s),(n))"
.LASF909:
	.string	"_RWLOCK_INTERNAL_H "
.LASF2251:
	.string	"insdelln(n) winsdelln(stdscr,(n))"
.LASF2699:
	.string	"__NR_setdomainname 171"
.LASF1459:
	.string	"_SC_XBS5_ILP32_OFF32 _SC_XBS5_ILP32_OFF32"
.LASF639:
	.string	"__feof_unlocked_body(_fp) (((_fp)->_flags & _IO_EOF_SEEN) != 0)"
.LASF2362:
	.string	"KEY_CANCEL 0543"
.LASF692:
	.string	"__CFLOAT32 _Complex _Float32"
.LASF2847:
	.string	"__NR_memfd_create 319"
.LASF2938:
	.string	"SYS_epoll_create __NR_epoll_create"
.LASF651:
	.string	"SEEK_SET 0"
.LASF2141:
	.string	"_NEWINDEX -1"
.LASF1022:
	.string	"ENETUNREACH 101"
.LASF2957:
	.string	"SYS_fanotify_mark __NR_fanotify_mark"
.LASF307:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 1"
.LASF290:
	.string	"__DEC64_MIN_EXP__ (-382)"
.LASF511:
	.string	"__REDIRECT_NTH_LDBL(name,proto,alias) __REDIRECT_NTH (name, proto, alias)"
.LASF3356:
	.string	"__cpu_to_le32(x) ((__le32)(__u32)(x))"
.LASF239:
	.string	"__FLT128_MAX_10_EXP__ 4932"
.LASF1979:
	.string	"M_1_PI 0.31830988618379067154"
.LASF935:
	.string	"EFAULT 14"
.LASF1254:
	.string	"_POSIX_THREAD_ROBUST_PRIO_PROTECT -1"
.LASF3341:
	.string	"__constant_ntohs(x) ___constant_swab16((__be16)(x))"
.LASF2449:
	.string	"BUTTON5_CLICKED NCURSES_MOUSE_MASK(5, NCURSES_BUTTON_CLICKED)"
.LASF2367:
	.string	"KEY_END 0550"
.LASF2087:
	.string	"NCURSES_ACS(c) (acs_map[NCURSES_CAST(unsigned char,(c))])"
.LASF2047:
	.string	"_VA_LIST_T_H "
.LASF3576:
	.string	"close"
.LASF1913:
	.string	"__MATH_PRECNAME(name,r) __CONCAT(name,r)"
.LASF910:
	.string	"__PTHREAD_RWLOCK_ELISION_EXTRA 0, { 0, 0, 0, 0, 0, 0, 0 }"
.LASF3208:
	.string	"SYS_shutdown __NR_shutdown"
.LASF2836:
	.string	"__NR_setns 308"
.LASF1036:
	.string	"EINPROGRESS 115"
.LASF590:
	.string	"__GID_T_TYPE __U32_TYPE"
.LASF2097:
	.string	"ACS_VLINE NCURSES_ACS('x')"
.LASF2378:
	.string	"KEY_REDO 0563"
.LASF3636:
	.string	"stderr"
.LASF3413:
	.string	"PERF_RECORD_MISC_GUEST_KERNEL (4 << 0)"
.LASF2545:
	.string	"__NR_pread64 17"
.LASF1299:
	.string	"__ILP32_OFFBIG_CFLAGS \"-m32 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64\""
.LASF2239:
	.string	"color_set(c,o) wcolor_set(stdscr,(c),(o))"
.LASF3305:
	.string	"_IO(type,nr) _IOC(_IOC_NONE,(type),(nr),0)"
.LASF926:
	.string	"EIO 5"
.LASF2338:
	.string	"KEY_IL 0511"
.LASF867:
	.string	"__FD_SET(d,s) ((void) (__FDS_BITS (s)[__FD_ELT(d)] |= __FD_MASK(d)))"
.LASF2629:
	.string	"__NR_ptrace 101"
.LASF2461:
	.string	"BUTTON_TRIPLE_CLICK(e,x) ((e) & NCURSES_MOUSE_MASK(x, 020))"
.LASF274:
	.string	"__FLT64X_NORM_MAX__ 1.18973149535723176502126385303097021e+4932F64x"
.LASF1434:
	.string	"_SC_XOPEN_XPG4 _SC_XOPEN_XPG4"
.LASF2459:
	.string	"BUTTON_CLICK(e,x) ((e) & NCURSES_MOUSE_MASK(x, 004))"
.LASF1770:
	.string	"__DECL_SIMD_sinhf128x "
.LASF1108:
	.string	"S_IWUSR __S_IWRITE"
.LASF2292:
	.string	"mvgetch(y,x) mvwgetch(stdscr,(y),(x))"
.LASF167:
	.string	"__FLT_HAS_QUIET_NAN__ 1"
.LASF3189:
	.string	"SYS_sethostname __NR_sethostname"
.LASF1384:
	.string	"_SC_2_SW_DEV _SC_2_SW_DEV"
.LASF3160:
	.string	"SYS_sched_getattr __NR_sched_getattr"
.LASF2246:
	.string	"inch() winch(stdscr)"
.LASF979:
	.string	"EDEADLOCK EDEADLK"
.LASF2749:
	.string	"__NR_fadvise64 221"
.LASF852:
	.string	"_BITS_UINTN_IDENTITY_H 1"
.LASF1205:
	.string	"W_OK 2"
.LASF1181:
	.string	"LOCK_SH 1"
.LASF595:
	.string	"__FSWORD_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF670:
	.string	"__HAVE_FLOAT64X 1"
.LASF1352:
	.string	"_SC_MESSAGE_PASSING _SC_MESSAGE_PASSING"
.LASF2387:
	.string	"KEY_SCOMMAND 0574"
.LASF230:
	.string	"__FLT64_HAS_DENORM__ 1"
.LASF186:
	.string	"__LDBL_DIG__ 18"
.LASF1862:
	.string	"__DECL_SIMD_asinhf "
.LASF1242:
	.string	"_XOPEN_REALTIME 1"
.LASF2914:
	.string	"SYS_brk __NR_brk"
.LASF1648:
	.string	"__DECL_SIMD_sincosf32x "
.LASF1778:
	.string	"__DECL_SIMD_cbrtf32x "
.LASF1306:
	.string	"__useconds_t_defined "
.LASF2714:
	.string	"__NR_gettid 186"
.LASF1486:
	.string	"_SC_NETWORKING _SC_NETWORKING"
.LASF3086:
	.string	"SYS_msync __NR_msync"
.LASF2305:
	.string	"getbkgd(win) (NCURSES_OK_ADDR(win) ? ((win)->_bkgd) : 0)"
.LASF2715:
	.string	"__NR_readahead 187"
.LASF737:
	.string	"UINT_FAST32_MAX (18446744073709551615UL)"
.LASF3433:
	.string	"PERF_AUX_FLAG_CORESIGHT_FORMAT_RAW 0x0100"
.LASF221:
	.string	"__FLT64_MIN_10_EXP__ (-307)"
.LASF801:
	.string	"__W_EXITCODE(ret,sig) ((ret) << 8 | (sig))"
.LASF493:
	.string	"__extern_always_inline extern __always_inline __attribute__ ((__gnu_inline__))"
.LASF170:
	.string	"__DBL_DIG__ 15"
.LASF1234:
	.string	"_POSIX_FSYNC 200809L"
.LASF3570:
	.string	"__int128"
.LASF3253:
	.string	"SYS_utimensat __NR_utimensat"
.LASF2197:
	.string	"getmaxx(win) (NCURSES_OK_ADDR(win) ? ((win)->_maxx + 1) : ERR)"
.LASF721:
	.string	"INT_LEAST32_MAX (2147483647)"
.LASF540:
	.string	"__GLIBC_USE_IEC_60559_FUNCS_EXT_C2X 0"
.LASF1068:
	.string	"__S_IFCHR 0020000"
.LASF2667:
	.string	"__NR_sysfs 139"
.LASF336:
	.string	"__ATOMIC_HLE_ACQUIRE 65536"
.LASF2549:
	.string	"__NR_access 21"
.LASF2856:
	.string	"__NR_pwritev2 328"
.LASF1772:
	.string	"__DECL_SIMD_cbrtf "
.LASF2673:
	.string	"__NR_sched_getscheduler 145"
.LASF824:
	.string	"__nlink_t_defined "
.LASF1497:
	.string	"_SC_SYSTEM_DATABASE_R _SC_SYSTEM_DATABASE_R"
.LASF176:
	.string	"__DBL_MAX__ ((double)1.79769313486231570814527423731704357e+308L)"
.LASF1080:
	.string	"__S_IREAD 0400"
.LASF3382:
	.string	"PERF_BR_ARM64_DEBUG_HALT PERF_BR_NEW_ARCH_2"
.LASF1349:
	.string	"_SC_MEMLOCK _SC_MEMLOCK"
.LASF432:
	.string	"__GLIBC__ 2"
.LASF3166:
	.string	"SYS_sched_setparam __NR_sched_setparam"
.LASF3595:
	.string	"my_power"
.LASF1839:
	.string	"__DECL_SIMD_acoshf64x "
.LASF563:
	.string	"NULL"
.LASF901:
	.string	"__SIZEOF_PTHREAD_RWLOCKATTR_T 8"
.LASF2740:
	.string	"__NR_lookup_dcookie 212"
.LASF1611:
	.string	"_CS_POSIX_V7_LPBIG_OFFBIG_CFLAGS _CS_POSIX_V7_LPBIG_OFFBIG_CFLAGS"
.LASF125:
	.string	"__UINT8_C(c) c"
.LASF1217:
	.string	"_POSIX2_C_BIND __POSIX2_THIS_VERSION"
.LASF2467:
	.string	"TRACE_TIMES 0x0001"
.LASF1045:
	.string	"EMEDIUMTYPE 124"
.LASF899:
	.string	"__SIZEOF_PTHREAD_COND_T 48"
.LASF2755:
	.string	"__NR_clock_settime 227"
.LASF729:
	.string	"INT_FAST32_MIN (-9223372036854775807L-1)"
.LASF3613:
	.string	"lock"
.LASF1063:
	.string	"_STATBUF_ST_BLKSIZE "
.LASF3071:
	.string	"SYS_mount_setattr __NR_mount_setattr"
.LASF97:
	.string	"__INTMAX_C(c) c ## L"
.LASF2313:
	.string	"is_leaveok(win) (NCURSES_OK_ADDR(win) ? (win)->_leaveok : FALSE)"
.LASF591:
	.string	"__INO_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF874:
	.string	"_STRUCT_TIMESPEC 1"
.LASF225:
	.string	"__FLT64_MAX__ 1.79769313486231570814527423731704357e+308F64"
.LASF1864:
	.string	"__DECL_SIMD_asinhf16 "
.LASF358:
	.string	"unix 1"
.LASF405:
	.string	"__USE_ISOC11 1"
.LASF2164:
	.string	"A_BLINK NCURSES_BITS(1U,11)"
.LASF3202:
	.string	"SYS_setuid __NR_setuid"
.LASF2068:
	.string	"WA_BOLD A_BOLD"
.LASF3066:
	.string	"SYS_mlock2 __NR_mlock2"
.LASF3045:
	.string	"SYS_linkat __NR_linkat"
.LASF1056:
	.string	"errno (*__errno_location ())"
.LASF2013:
	.string	"NCURSES_INLINE inline"
.LASF42:
	.string	"__WCHAR_TYPE__ int"
.LASF1127:
	.string	"__O_LARGEFILE 0"
.LASF853:
	.string	"htobe16(x) __bswap_16 (x)"
.LASF131:
	.string	"__UINT64_C(c) c ## UL"
.LASF887:
	.string	"__blksize_t_defined "
.LASF3125:
	.string	"SYS_pwrite64 __NR_pwrite64"
.LASF2327:
	.string	"KEY_SRESET 0530"
.LASF1039:
	.string	"ENOTNAM 118"
.LASF1074:
	.string	"__S_TYPEISMQ(buf) ((buf)->st_mode - (buf)->st_mode)"
.LASF3065:
	.string	"SYS_mlock __NR_mlock"
.LASF1364:
	.string	"_SC_RTSIG_MAX _SC_RTSIG_MAX"
.LASF1443:
	.string	"_SC_NZERO _SC_NZERO"
.LASF3438:
	.string	"PERF_MEM_OP_NA 0x01"
.LASF750:
	.string	"WCHAR_MIN __WCHAR_MIN"
.LASF868:
	.string	"__FD_CLR(d,s) ((void) (__FDS_BITS (s)[__FD_ELT(d)] &= ~__FD_MASK(d)))"
.LASF2701:
	.string	"__NR_ioperm 173"
.LASF2346:
	.string	"KEY_SR 0521"
.LASF900:
	.string	"__SIZEOF_PTHREAD_CONDATTR_T 4"
.LASF587:
	.string	"__SYSCALL_ULONG_TYPE __ULONGWORD_TYPE"
.LASF369:
	.string	"__GLIBC_INTERNAL_STARTING_HEADER_IMPLEMENTATION"
.LASF1261:
	.string	"_LFS64_ASYNCHRONOUS_IO 1"
.LASF1793:
	.string	"__DECL_SIMD_log10l "
.LASF2918:
	.string	"SYS_chmod __NR_chmod"
.LASF1308:
	.string	"L_SET SEEK_SET"
.LASF1668:
	.string	"__DECL_SIMD_expf32x "
.LASF1574:
	.string	"_CS_XBS5_ILP32_OFFBIG_LINTFLAGS _CS_XBS5_ILP32_OFFBIG_LINTFLAGS"
.LASF2568:
	.string	"__NR_sendfile 40"
.LASF1576:
	.string	"_CS_XBS5_LP64_OFF64_LDFLAGS _CS_XBS5_LP64_OFF64_LDFLAGS"
.LASF1090:
	.string	"S_IFIFO __S_IFIFO"
.LASF2949:
	.string	"SYS_execveat __NR_execveat"
.LASF2799:
	.string	"__NR_ppoll 271"
.LASF89:
	.string	"__INT_WIDTH__ 32"
.LASF2108:
	.string	"ACS_DARROW NCURSES_ACS('.')"
.LASF1950:
	.string	"__MATHCALL_NARROW_ARGS_3"
.LASF1061:
	.string	"st_mtime st_mtim.tv_sec"
.LASF828:
	.string	"__daddr_t_defined "
.LASF2318:
	.string	"is_subwin(win) (NCURSES_OK_ADDR(win) ? ((win)->_flags & _SUBWIN) != 0 : FALSE)"
.LASF1274:
	.string	"_POSIX_TIMERS 200809L"
.LASF789:
	.string	"WNOWAIT 0x01000000"
.LASF2543:
	.string	"__NR_rt_sigreturn 15"
.LASF3156:
	.string	"SYS_rt_tgsigqueueinfo __NR_rt_tgsigqueueinfo"
.LASF414:
	.string	"__USE_POSIX2 1"
.LASF182:
	.string	"__DBL_HAS_INFINITY__ 1"
.LASF150:
	.string	"__FLT_EVAL_METHOD_TS_18661_3__ 0"
.LASF1907:
	.string	"__MATHDECLX(type,function,suffix,args,attrib) __MATHDECL_1(type, function,suffix, args) __attribute__ (attrib); __MATHDECL_1(type, __CONCAT(__,function),suffix, args) __attribute__ (attrib)"
.LASF2385:
	.string	"KEY_SBEG 0572"
.LASF3194:
	.string	"SYS_setregid __NR_setregid"
.LASF2286:
	.string	"mvaddchnstr(y,x,str,n) mvwaddchnstr(stdscr,(y),(x),(str),(n))"
.LASF474:
	.string	"__attribute_alloc_align__(param) __attribute__ ((__alloc_align__ param))"
.LASF779:
	.string	"_GCC_WCHAR_T "
.LASF1799:
	.string	"__DECL_SIMD_log10f64x "
.LASF3150:
	.string	"SYS_rt_sigpending __NR_rt_sigpending"
.LASF3242:
	.string	"SYS_tuxcall __NR_tuxcall"
.LASF346:
	.string	"__SSE_MATH__ 1"
.LASF1458:
	.string	"_SC_NL_TEXTMAX _SC_NL_TEXTMAX"
.LASF3630:
	.string	"open_msr"
.LASF1531:
	.string	"_SC_LEVEL4_CACHE_SIZE _SC_LEVEL4_CACHE_SIZE"
.LASF2753:
	.string	"__NR_timer_getoverrun 225"
.LASF101:
	.string	"__SIG_ATOMIC_MAX__ 0x7fffffff"
.LASF1673:
	.string	"__DECL_SIMD_powl "
.LASF1825:
	.string	"__DECL_SIMD_atanhf32 "
.LASF2768:
	.string	"__NR_mq_open 240"
.LASF3296:
	.string	"_IOC_NRSHIFT 0"
.LASF3008:
	.string	"SYS_getsid __NR_getsid"
.LASF2688:
	.string	"__NR_setrlimit 160"
.LASF2481:
	.string	"TRACE_SHIFT 13"
.LASF1705:
	.string	"__DECL_SIMD_asinf32 "
.LASF1734:
	.string	"__DECL_SIMD_exp10f16 "
.LASF2587:
	.string	"__NR_execve 59"
.LASF1479:
	.string	"_SC_PIPE _SC_PIPE"
.LASF3563:
	.string	"pkg_runtime_avg"
.LASF3126:
	.string	"SYS_pwritev __NR_pwritev"
.LASF940:
	.string	"ENODEV 19"
.LASF1495:
	.string	"_SC_THREAD_SPORADIC_SERVER _SC_THREAD_SPORADIC_SERVER"
.LASF1455:
	.string	"_SC_NL_MSGMAX _SC_NL_MSGMAX"
.LASF1062:
	.string	"st_ctime st_ctim.tv_sec"
.LASF2652:
	.string	"__NR_getsid 124"
.LASF1227:
	.string	"_XOPEN_ENH_I18N 1"
.LASF1464:
	.string	"_SC_XOPEN_REALTIME _SC_XOPEN_REALTIME"
.LASF1685:
	.string	"__DECL_SIMD_acosf32 "
.LASF2326:
	.string	"KEY_BREAK 0401"
.LASF2315:
	.string	"is_notimeout(win) (NCURSES_OK_ADDR(win) ? (win)->_notimeout : FALSE)"
.LASF1677:
	.string	"__DECL_SIMD_powf128 "
.LASF1647:
	.string	"__DECL_SIMD_sincosf128 "
.LASF2780:
	.string	"__NR_ioprio_get 252"
.LASF995:
	.string	"EBADMSG 74"
.LASF3143:
	.string	"SYS_renameat __NR_renameat"
.LASF704:
	.string	"INT16_MIN (-32767-1)"
.LASF3574:
	.string	"fopen"
.LASF267:
	.string	"__FLT64X_DIG__ 18"
.LASF675:
	.string	"__HAVE_FLOAT16 0"
.LASF343:
	.string	"__SSE__ 1"
.LASF1425:
	.string	"_SC_XOPEN_UNIX _SC_XOPEN_UNIX"
.LASF1463:
	.string	"_SC_XOPEN_LEGACY _SC_XOPEN_LEGACY"
.LASF2407:
	.string	"KEY_SREDO 0620"
.LASF137:
	.string	"__INT_FAST32_WIDTH__ 64"
.LASF353:
	.string	"__linux 1"
.LASF2818:
	.string	"__NR_eventfd2 290"
.LASF2548:
	.string	"__NR_writev 20"
.LASF1197:
	.string	"POSIX_FADV_NOREUSE __POSIX_FADV_NOREUSE"
.LASF1522:
	.string	"_SC_LEVEL1_DCACHE_SIZE _SC_LEVEL1_DCACHE_SIZE"
.LASF3498:
	.string	"PERF_MEM_HOPS_0 0x01"
.LASF23:
	.string	"__SIZEOF_LONG__ 8"
.LASF1689:
	.string	"__DECL_SIMD_acosf64x "
.LASF2281:
	.string	"mvwinsnstr(win,y,x,s,n) (wmove((win),(y),(x)) == ERR ? ERR : winsnstr((win),(s),(n)))"
.LASF3187:
	.string	"SYS_setgid __NR_setgid"
.LASF420:
	.string	"_ATFILE_SOURCE 1"
.LASF1132:
	.string	"O_RDONLY 00"
.LASF2121:
	.string	"ACS_SSBB ACS_LLCORNER"
.LASF640:
	.string	"_IO_ERR_SEEN 0x0020"
.LASF1750:
	.string	"__DECL_SIMD_coshf128x "
.LASF1344:
	.string	"_SC_ASYNCHRONOUS_IO _SC_ASYNCHRONOUS_IO"
.LASF2172:
	.string	"A_LOW NCURSES_BITS(1U,19)"
.LASF1385:
	.string	"_SC_2_LOCALEDEF _SC_2_LOCALEDEF"
.LASF2394:
	.string	"KEY_SEOL 0603"
.LASF452:
	.string	"__END_DECLS "
.LASF3185:
	.string	"SYS_setfsgid __NR_setfsgid"
.LASF3222:
	.string	"SYS_sync __NR_sync"
.LASF662:
	.string	"stdin stdin"
.LASF2213:
	.string	"winstr(w,s) winnstr(w, s, -1)"
.LASF1863:
	.string	"__DECL_SIMD_asinhl "
.LASF1812:
	.string	"__DECL_SIMD_log1pf "
.LASF2118:
	.string	"ACS_NEQUAL NCURSES_ACS('|')"
.LASF3640:
	.string	"__errno_location"
.LASF2067:
	.string	"WA_DIM A_DIM"
.LASF326:
	.string	"__SIZEOF_INT128__ 16"
.LASF2722:
	.string	"__NR_listxattr 194"
.LASF2082:
	.string	"COLOR_YELLOW 3"
.LASF2956:
	.string	"SYS_fanotify_init __NR_fanotify_init"
.LASF192:
	.string	"__LDBL_DECIMAL_DIG__ 21"
.LASF2258:
	.string	"scrl(n) wscrl(stdscr,(n))"
.LASF2224:
	.string	"addnstr(str,n) waddnstr(stdscr,(str),(n))"
.LASF1513:
	.string	"_SC_V6_LPBIG_OFFBIG _SC_V6_LPBIG_OFFBIG"
.LASF1700:
	.string	"__DECL_SIMD_atanf128x "
.LASF258:
	.string	"__FLT32X_NORM_MAX__ 1.79769313486231570814527423731704357e+308F32x"
.LASF2557:
	.string	"__NR_shmget 29"
.LASF2797:
	.string	"__NR_faccessat 269"
.LASF1817:
	.string	"__DECL_SIMD_log1pf128 "
.LASF1868:
	.string	"__DECL_SIMD_asinhf32x "
.LASF527:
	.string	"__stub_sigreturn "
.LASF3282:
	.string	"__bitwise__ __bitwise"
.LASF342:
	.string	"__MMX__ 1"
.LASF2306:
	.string	"slk_attr_off(a,v) ((v) ? ERR : slk_attroff(a))"
.LASF2503:
	.string	"MSR_CORE_PERF_LIMIT_REASONS 0x64F"
.LASF1782:
	.string	"__DECL_SIMD_atan2f "
.LASF2991:
	.string	"SYS_getegid __NR_getegid"
.LASF73:
	.string	"__INTPTR_TYPE__ long int"
.LASF2364:
	.string	"KEY_COMMAND 0545"
.LASF3184:
	.string	"SYS_setdomainname __NR_setdomainname"
.LASF1920:
	.string	"_Mdouble_ float"
.LASF120:
	.string	"__INT_LEAST32_WIDTH__ 32"
.LASF1744:
	.string	"__DECL_SIMD_coshf16 "
.LASF1397:
	.string	"_SC_PII_OSI_COTS _SC_PII_OSI_COTS"
.LASF2295:
	.string	"mvhline(y,x,c,n) mvwhline(stdscr,(y),(x),(c),(n))"
.LASF3518:
	.string	"_flags"
.LASF1575:
	.string	"_CS_XBS5_LP64_OFF64_CFLAGS _CS_XBS5_LP64_OFF64_CFLAGS"
.LASF1179:
	.string	"F_EXLCK 4"
.LASF2429:
	.string	"BUTTON1_CLICKED NCURSES_MOUSE_MASK(1, NCURSES_BUTTON_CLICKED)"
.LASF1942:
	.string	"__MATHCALL_NARROW_ARGS_1 (_Marg_ __x)"
.LASF1504:
	.string	"_SC_2_PBS_LOCATE _SC_2_PBS_LOCATE"
.LASF2474:
	.string	"TRACE_VIRTPUT 0x0040"
.LASF2650:
	.string	"__NR_setfsuid 122"
.LASF2442:
	.string	"BUTTON4_RELEASED NCURSES_MOUSE_MASK(4, NCURSES_BUTTON_RELEASED)"
.LASF851:
	.ascii	"__bswap_constant_64(x) ((((x) & 0xff00000000000000ull) >> 56"
	.ascii	") | (((x) & 0x00ff000000"
	.string	"000000ull) >> 40) | (((x) & 0x0000ff0000000000ull) >> 24) | (((x) & 0x000000ff00000000ull) >> 8) | (((x) & 0x00000000ff000000ull) << 8) | (((x) & 0x0000000000ff0000ull) << 24) | (((x) & 0x000000000000ff00ull) << 40) | (((x) & 0x00000000000000ffull) << 56))"
.LASF1149:
	.string	"__O_NOATIME 01000000"
.LASF138:
	.string	"__INT_FAST64_MAX__ 0x7fffffffffffffffL"
.LASF2092:
	.string	"ACS_LTEE NCURSES_ACS('t')"
.LASF2990:
	.string	"SYS_getdents64 __NR_getdents64"
.LASF2682:
	.string	"__NR_modify_ldt 154"
.LASF260:
	.string	"__FLT32X_EPSILON__ 2.22044604925031308084726333618164062e-16F32x"
.LASF3033:
	.string	"SYS_ioprio_set __NR_ioprio_set"
.LASF1676:
	.string	"__DECL_SIMD_powf64 "
.LASF3426:
	.string	"PERF_MAX_CONTEXTS_PER_STACK 8"
.LASF2718:
	.string	"__NR_fsetxattr 190"
.LASF1158:
	.string	"O_CLOEXEC __O_CLOEXEC"
.LASF869:
	.string	"__FD_ISSET(d,s) ((__FDS_BITS (s)[__FD_ELT (d)] & __FD_MASK (d)) != 0)"
.LASF2432:
	.string	"BUTTON2_RELEASED NCURSES_MOUSE_MASK(2, NCURSES_BUTTON_RELEASED)"
.LASF3556:
	.string	"double"
.LASF778:
	.string	"__INT_WCHAR_T_H "
.LASF1667:
	.string	"__DECL_SIMD_expf128 "
.LASF599:
	.string	"__RLIM_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF1005:
	.string	"EILSEQ 84"
.LASF2972:
	.string	"SYS_fsetxattr __NR_fsetxattr"
.LASF1523:
	.string	"_SC_LEVEL1_DCACHE_ASSOC _SC_LEVEL1_DCACHE_ASSOC"
.LASF2656:
	.string	"__NR_rt_sigtimedwait 128"
.LASF2872:
	.string	"__NR_fspick 433"
.LASF3058:
	.string	"SYS_memfd_secret __NR_memfd_secret"
.LASF1278:
	.string	"_POSIX_MONOTONIC_CLOCK 0"
.LASF2373:
	.string	"KEY_MOVE 0556"
.LASF435:
	.string	"_SYS_CDEFS_H 1"
.LASF638:
	.string	"_IO_EOF_SEEN 0x0010"
.LASF285:
	.string	"__DEC32_MIN__ 1E-95DF"
.LASF1573:
	.string	"_CS_XBS5_ILP32_OFFBIG_LIBS _CS_XBS5_ILP32_OFFBIG_LIBS"
.LASF942:
	.string	"EISDIR 21"
.LASF1009:
	.string	"ENOTSOCK 88"
.LASF3487:
	.string	"PERF_MEM_TLB_HIT 0x02"
.LASF2928:
	.string	"SYS_close __NR_close"
.LASF3528:
	.string	"_IO_backup_base"
.LASF2382:
	.string	"KEY_RESTART 0567"
.LASF2556:
	.string	"__NR_madvise 28"
.LASF1271:
	.string	"_POSIX_TIMEOUTS 200809L"
.LASF2554:
	.string	"__NR_msync 26"
.LASF61:
	.string	"__UINT_LEAST8_TYPE__ unsigned char"
.LASF683:
	.string	"__HAVE_DISTINCT_FLOAT32X 0"
.LASF558:
	.string	"___int_size_t_h "
.LASF1007:
	.string	"ESTRPIPE 86"
.LASF3334:
	.string	"__swab32(x) (__u32)(__builtin_constant_p(x) ? ___constant_swab32(x) : __fswab32(x))"
.LASF724:
	.string	"UINT_LEAST16_MAX (65535)"
.LASF1396:
	.string	"_SC_PII_INTERNET_DGRAM _SC_PII_INTERNET_DGRAM"
.LASF228:
	.string	"__FLT64_EPSILON__ 2.22044604925031308084726333618164062e-16F64"
.LASF360:
	.string	"__DECIMAL_BID_FORMAT__ 1"
.LASF1016:
	.string	"EOPNOTSUPP 95"
.LASF1714:
	.string	"__DECL_SIMD_hypotf16 "
.LASF1916:
	.string	"_Mdouble_"
.LASF2368:
	.string	"KEY_EXIT 0551"
.LASF2341:
	.string	"KEY_EIC 0514"
.LASF197:
	.string	"__LDBL_DENORM_MIN__ 3.64519953188247460252840593361941982e-4951L"
.LASF3094:
	.string	"SYS_open __NR_open"
.LASF308:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 1"
.LASF2115:
	.string	"ACS_LEQUAL NCURSES_ACS('y')"
.LASF1355:
	.string	"_SC_AIO_LISTIO_MAX _SC_AIO_LISTIO_MAX"
.LASF1665:
	.string	"__DECL_SIMD_expf32 "
.LASF1584:
	.string	"_CS_POSIX_V6_ILP32_OFF32_LDFLAGS _CS_POSIX_V6_ILP32_OFF32_LDFLAGS"
.LASF2951:
	.string	"SYS_exit_group __NR_exit_group"
.LASF3300:
	.string	"_IOC_NONE 0U"
.LASF1556:
	.string	"_CS_POSIX_V5_WIDTH_RESTRICTED_ENVS _CS_V5_WIDTH_RESTRICTED_ENVS"
.LASF3431:
	.string	"PERF_AUX_FLAG_PMU_FORMAT_TYPE_MASK 0xff00"
.LASF863:
	.string	"be64toh(x) __bswap_64 (x)"
.LASF2946:
	.string	"SYS_eventfd __NR_eventfd"
.LASF166:
	.string	"__FLT_HAS_INFINITY__ 1"
.LASF2801:
	.string	"__NR_set_robust_list 273"
.LASF2679:
	.string	"__NR_mlockall 151"
.LASF2222:
	.string	"addchnstr(str,n) waddchnstr(stdscr,(str),(n))"
.LASF932:
	.string	"EAGAIN 11"
.LASF66:
	.string	"__INT_FAST16_TYPE__ long int"
.LASF333:
	.string	"__x86_64__ 1"
.LASF2769:
	.string	"__NR_mq_unlink 241"
.LASF345:
	.string	"__FXSR__ 1"
.LASF2377:
	.string	"KEY_PREVIOUS 0562"
.LASF1865:
	.string	"__DECL_SIMD_asinhf32 "
.LASF81:
	.string	"__WCHAR_MAX__ 0x7fffffff"
.LASF2019:
	.string	"NCURSES_OPAQUE_FORM 0"
.LASF3228:
	.string	"SYS_tee __NR_tee"
.LASF2402:
	.string	"KEY_SMOVE 0613"
.LASF1580:
	.string	"_CS_XBS5_LPBIG_OFFBIG_LDFLAGS _CS_XBS5_LPBIG_OFFBIG_LDFLAGS"
.LASF1730:
	.string	"__DECL_SIMD_exp2f128x "
.LASF1019:
	.string	"EADDRINUSE 98"
.LASF3088:
	.string	"SYS_munlockall __NR_munlockall"
.LASF391:
	.string	"__USE_DYNAMIC_STACK_SIZE"
.LASF2112:
	.string	"ACS_BLOCK NCURSES_ACS('0')"
.LASF2750:
	.string	"__NR_timer_create 222"
.LASF2212:
	.string	"vline(ch,n) wvline(stdscr, ch, (n))"
.LASF1661:
	.string	"__DECL_SIMD_exp "
.LASF3375:
	.string	"__be32_to_cpus(x) __swab32s((x))"
.LASF205:
	.string	"__FLT32_MIN_10_EXP__ (-37)"
.LASF273:
	.string	"__FLT64X_MAX__ 1.18973149535723176502126385303097021e+4932F64x"
.LASF2944:
	.string	"SYS_epoll_wait __NR_epoll_wait"
.LASF1822:
	.string	"__DECL_SIMD_atanhf "
.LASF748:
	.string	"SIG_ATOMIC_MAX (2147483647)"
.LASF1758:
	.string	"__DECL_SIMD_expm1f32x "
.LASF2490:
	.string	"BUFSIZE 64"
.LASF2050:
	.string	"TRUE 1"
.LASF269:
	.string	"__FLT64X_MIN_10_EXP__ (-4931)"
.LASF3016:
	.string	"SYS_inotify_add_watch __NR_inotify_add_watch"
.LASF2219:
	.string	"COLOR_PAIR(n) (NCURSES_BITS((n), 0) & A_COLOR)"
.LASF2177:
	.string	"getyx(win,y,x) (y = getcury(win), x = getcurx(win))"
.LASF3279:
	.string	"__kernel_old_dev_t __kernel_old_dev_t"
.LASF2531:
	.string	"__NR_close 3"
.LASF3164:
	.string	"SYS_sched_setaffinity __NR_sched_setaffinity"
.LASF2416:
	.string	"KEY_MOUSE 0631"
.LASF1150:
	.string	"__O_PATH 010000000"
.LASF1502:
	.string	"_SC_2_PBS _SC_2_PBS"
.LASF1315:
	.string	"_PC_PATH_MAX _PC_PATH_MAX"
.LASF731:
	.string	"INT_FAST8_MAX (127)"
.LASF1937:
	.string	"__MATHDECL_1_IMPL"
.LASF698:
	.string	"__WCHAR_MAX __WCHAR_MAX__"
.LASF154:
	.string	"__FLT_DIG__ 6"
.LASF240:
	.string	"__FLT128_DECIMAL_DIG__ 36"
.LASF2731:
	.string	"__NR_sched_setaffinity 203"
.LASF2869:
	.string	"__NR_fsopen 430"
.LASF641:
	.string	"__ferror_unlocked_body(_fp) (((_fp)->_flags & _IO_ERR_SEEN) != 0)"
.LASF992:
	.string	"EPROTO 71"
.LASF128:
	.string	"__UINT_LEAST32_MAX__ 0xffffffffU"
.LASF481:
	.string	"__attribute_deprecated_msg__(msg) __attribute__ ((__deprecated__ (msg)))"
.LASF3360:
	.string	"__cpu_to_be64(x) ((__be64)__swab64((x)))"
.LASF2580:
	.string	"__NR_getpeername 52"
.LASF3598:
	.string	"time_unit_raw"
.LASF2569:
	.string	"__NR_socket 41"
.LASF1856:
	.string	"__DECL_SIMD_tanhf64 "
.LASF3566:
	.string	"power_unit"
.LASF3520:
	.string	"_IO_read_end"
.LASF2540:
	.string	"__NR_brk 12"
.LASF2192:
	.string	"getattrs(win) NCURSES_CAST(int, NCURSES_OK_ADDR(win) ? (win)->_attrs : A_NORMAL)"
.LASF1243:
	.string	"_XOPEN_REALTIME_THREADS 1"
.LASF1867:
	.string	"__DECL_SIMD_asinhf128 "
.LASF2298:
	.string	"mvinchstr(y,x,s) mvwinchstr(stdscr,(y),(x),(s))"
.LASF3259:
	.string	"SYS_wait4 __NR_wait4"
.LASF2504:
	.string	"PROCHOT 1"
.LASF795:
	.string	"__WSTOPSIG(status) __WEXITSTATUS(status)"
.LASF2439:
	.string	"BUTTON3_CLICKED NCURSES_MOUSE_MASK(3, NCURSES_BUTTON_CLICKED)"
.LASF1527:
	.string	"_SC_LEVEL2_CACHE_LINESIZE _SC_LEVEL2_CACHE_LINESIZE"
.LASF2358:
	.string	"KEY_C1 0537"
.LASF2404:
	.string	"KEY_SOPTIONS 0615"
.LASF1537:
	.string	"_SC_V7_ILP32_OFFBIG _SC_V7_ILP32_OFFBIG"
.LASF1698:
	.string	"__DECL_SIMD_atanf32x "
.LASF2230:
	.string	"attroff(at) wattroff(stdscr,(at))"
.LASF189:
	.string	"__LDBL_MAX_EXP__ 16384"
.LASF1922:
	.string	"__MATH_DECLARING_DOUBLE 0"
.LASF1914:
	.string	"__MATH_DECLARING_DOUBLE 1"
.LASF3432:
	.string	"PERF_AUX_FLAG_CORESIGHT_FORMAT_CORESIGHT 0x0000"
.LASF555:
	.string	"_SIZE_T_DEFINED "
.LASF977:
	.string	"EBADRQC 56"
.LASF2028:
	.string	"NCURSES_SIZE_T short"
.LASF2146:
	.string	"GCC_DEPRECATED"
.LASF2231:
	.string	"attron(at) wattron(stdscr,(at))"
.LASF3527:
	.string	"_IO_save_base"
.LASF3575:
	.string	"printf"
.LASF1718:
	.string	"__DECL_SIMD_hypotf32x "
.LASF1011:
	.string	"EMSGSIZE 90"
.LASF908:
	.string	"__PTHREAD_MUTEX_INITIALIZER(__kind) 0, 0, 0, 0, __kind, 0, 0, { 0, 0 }"
.LASF534:
	.string	"__GLIBC_USE_IEC_60559_BFP_EXT_C2X 0"
.LASF2434:
	.string	"BUTTON2_CLICKED NCURSES_MOUSE_MASK(2, NCURSES_BUTTON_CLICKED)"
.LASF678:
	.string	"__HAVE_FLOAT32X 1"
.LASF2135:
	.string	"_FULLWIN 0x04"
.LASF254:
	.string	"__FLT32X_MAX_EXP__ 1024"
.LASF929:
	.string	"ENOEXEC 8"
.LASF744:
	.string	"UINTMAX_MAX (__UINT64_C(18446744073709551615))"
.LASF1670:
	.string	"__DECL_SIMD_expf128x "
.LASF2400:
	.string	"KEY_SLEFT 0611"
.LASF2472:
	.string	"TRACE_ORDINARY 0x001F"
.LASF116:
	.string	"__INT16_C(c) c"
.LASF1530:
	.string	"_SC_LEVEL3_CACHE_LINESIZE _SC_LEVEL3_CACHE_LINESIZE"
.LASF112:
	.string	"__INT_LEAST8_MAX__ 0x7f"
.LASF849:
	.string	"__bswap_constant_16(x) ((__uint16_t) ((((x) >> 8) & 0xff) | (((x) & 0xff) << 8)))"
.LASF775:
	.string	"_WCHAR_T_DEFINED "
.LASF2609:
	.string	"__NR_fchdir 81"
.LASF2309:
	.string	"is_idcok(win) (NCURSES_OK_ADDR(win) ? (win)->_idcok : FALSE)"
.LASF2501:
	.string	"PKG_CRITICAL_TEMPERATURE_STATUS 16"
.LASF813:
	.string	"__lldiv_t_defined 1"
.LASF581:
	.string	"__ULONG32_TYPE unsigned int"
.LASF2698:
	.string	"__NR_sethostname 170"
.LASF578:
	.string	"__SWORD_TYPE long int"
.LASF371:
	.string	"__USE_ISOC11"
.LASF2150:
	.string	"NCURSES_EXT_FUNCS 20211021"
.LASF1995:
	.string	"NCURSES_VERSION_PATCH 20211021"
.LASF2742:
	.string	"__NR_epoll_ctl_old 214"
.LASF430:
	.string	"__GNU_LIBRARY__"
.LASF1651:
	.string	"__DECL_SIMD_log "
.LASF616:
	.string	"__TIMER_T_TYPE void *"
.LASF3233:
	.string	"SYS_timer_getoverrun __NR_timer_getoverrun"
.LASF2190:
	.string	"nocrmode() nocbreak()"
.LASF2626:
	.string	"__NR_getrusage 98"
.LASF2999:
	.string	"SYS_getpid __NR_getpid"
.LASF2232:
	.string	"attrset(at) wattrset(stdscr,(at))"
.LASF2909:
	.string	"SYS_afs_syscall __NR_afs_syscall"
.LASF1232:
	.string	"_POSIX_PRIORITY_SCHEDULING 200809L"
.LASF1533:
	.string	"_SC_LEVEL4_CACHE_LINESIZE _SC_LEVEL4_CACHE_LINESIZE"
.LASF3524:
	.string	"_IO_write_end"
.LASF1453:
	.string	"_SC_NL_ARGMAX _SC_NL_ARGMAX"
.LASF57:
	.string	"__INT_LEAST8_TYPE__ signed char"
.LASF193:
	.string	"__LDBL_MAX__ 1.18973149535723176502126385303097021e+4932L"
.LASF1382:
	.string	"_SC_2_FORT_DEV _SC_2_FORT_DEV"
.LASF1696:
	.string	"__DECL_SIMD_atanf64 "
.LASF825:
	.string	"__uid_t_defined "
.LASF1671:
	.string	"__DECL_SIMD_pow "
.LASF2180:
	.string	"getparyx(win,y,x) (y = getpary(win), x = getparx(win))"
.LASF1109:
	.string	"S_IXUSR __S_IEXEC"
.LASF526:
	.string	"__stub_setlogin "
.LASF2734:
	.string	"__NR_io_setup 206"
.LASF897:
	.string	"__SIZEOF_PTHREAD_BARRIER_T 32"
.LASF3012:
	.string	"SYS_gettimeofday __NR_gettimeofday"
.LASF226:
	.string	"__FLT64_NORM_MAX__ 1.79769313486231570814527423731704357e+308F64"
.LASF894:
	.string	"__SIZEOF_PTHREAD_MUTEX_T 40"
.LASF3603:
	.string	"package_before"
.LASF2465:
	.string	"_tracech_t2 _tracechtype2"
.LASF3455:
	.string	"PERF_MEM_LVL_REM_CCE2 0x800"
.LASF1183:
	.string	"LOCK_NB 4"
.LASF2264:
	.string	"winsertln(win) winsdelln(win,1)"
.LASF2040:
	.string	"va_start(v,l) __builtin_va_start(v,l)"
.LASF291:
	.string	"__DEC64_MAX_EXP__ 385"
.LASF1478:
	.string	"_SC_FIFO _SC_FIFO"
.LASF3581:
	.string	"sprintf"
.LASF1982:
	.string	"M_SQRT2 1.41421356237309504880"
.LASF2723:
	.string	"__NR_llistxattr 195"
.LASF3062:
	.string	"SYS_mkdirat __NR_mkdirat"
.LASF2566:
	.string	"__NR_setitimer 38"
.LASF2174:
	.string	"A_TOP NCURSES_BITS(1U,21)"
.LASF461:
	.string	"__glibc_fortify(f,__l,__s,__osz,...) (__glibc_safe_or_unknown_len (__l, __s, __osz) ? __ ## f ## _alias (__VA_ARGS__) : (__glibc_unsafe_len (__l, __s, __osz) ? __ ## f ## _chk_warn (__VA_ARGS__, __osz) : __ ## f ## _chk (__VA_ARGS__, __osz)))"
.LASF2639:
	.string	"__NR_getpgrp 111"
.LASF2218:
	.string	"waddchstr(win,str) waddchnstr(win,str,-1)"
.LASF1745:
	.string	"__DECL_SIMD_coshf32 "
.LASF2807:
	.string	"__NR_move_pages 279"
.LASF579:
	.string	"__UWORD_TYPE unsigned long int"
.LASF2537:
	.string	"__NR_mmap 9"
.LASF2446:
	.string	"BUTTON4_TRIPLE_CLICKED NCURSES_MOUSE_MASK(4, NCURSES_TRIPLE_CLICKED)"
.LASF2787:
	.string	"__NR_mknodat 259"
.LASF911:
	.string	"__PTHREAD_RWLOCK_INITIALIZER(__flags) 0, 0, 0, 0, 0, 0, 0, 0, __PTHREAD_RWLOCK_ELISION_EXTRA, 0, __flags"
.LASF256:
	.string	"__FLT32X_DECIMAL_DIG__ 17"
.LASF1483:
	.string	"_SC_MONOTONIC_CLOCK _SC_MONOTONIC_CLOCK"
.LASF3325:
	.string	"_ASM_X86_SWAB_H "
.LASF3525:
	.string	"_IO_buf_base"
.LASF3326:
	.string	"__arch_swab32 __arch_swab32"
.LASF2175:
	.string	"A_VERTICAL NCURSES_BITS(1U,22)"
.LASF2773:
	.string	"__NR_mq_getsetattr 245"
.LASF1757:
	.string	"__DECL_SIMD_expm1f128 "
.LASF1509:
	.string	"_SC_2_PBS_CHECKPOINT _SC_2_PBS_CHECKPOINT"
.LASF78:
	.string	"__INT_MAX__ 0x7fffffff"
.LASF2199:
	.string	"getparx(win) (NCURSES_OK_ADDR(win) ? (win)->_parx : ERR)"
.LASF1029:
	.string	"ESHUTDOWN 108"
.LASF1103:
	.string	"S_TYPEISSHM(buf) __S_TYPEISSHM(buf)"
.LASF1515:
	.string	"_SC_TRACE _SC_TRACE"
.LASF1692:
	.string	"__DECL_SIMD_atanf "
.LASF2515:
	.string	"BIT31 0x8000000"
.LASF3539:
	.string	"_offset"
.LASF740:
	.string	"INTPTR_MAX (9223372036854775807L)"
.LASF524:
	.string	"__stub_gtty "
.LASF3423:
	.string	"PERF_RECORD_MISC_EXT_RESERVED (1 << 15)"
.LASF3084:
	.string	"SYS_msgrcv __NR_msgrcv"
.LASF1406:
	.string	"_SC_TTY_NAME_MAX _SC_TTY_NAME_MAX"
.LASF3474:
	.string	"PERF_MEM_SNOOP_NA 0x01"
.LASF1970:
	.string	"math_errhandling (MATH_ERRNO | MATH_ERREXCEPT)"
.LASF392:
	.string	"__USE_GNU"
.LASF1428:
	.string	"_SC_XOPEN_SHM _SC_XOPEN_SHM"
.LASF1456:
	.string	"_SC_NL_NMAX _SC_NL_NMAX"
.LASF2201:
	.string	"wstandout(win) (wattrset(win,A_STANDOUT))"
.LASF2849:
	.string	"__NR_bpf 321"
.LASF1766:
	.string	"__DECL_SIMD_sinhf64 "
.LASF1432:
	.string	"_SC_XOPEN_XPG2 _SC_XOPEN_XPG2"
.LASF1461:
	.string	"_SC_XBS5_LP64_OFF64 _SC_XBS5_LP64_OFF64"
.LASF1346:
	.string	"_SC_SYNCHRONIZED_IO _SC_SYNCHRONIZED_IO"
.LASF864:
	.string	"le64toh(x) __uint64_identity (x)"
.LASF2851:
	.string	"__NR_userfaultfd 323"
.LASF229:
	.string	"__FLT64_DENORM_MIN__ 4.94065645841246544176568792868221372e-324F64"
.LASF3232:
	.string	"SYS_timer_delete __NR_timer_delete"
.LASF199:
	.string	"__LDBL_HAS_INFINITY__ 1"
.LASF1543:
	.string	"_SC_TRACE_SYS_MAX _SC_TRACE_SYS_MAX"
.LASF3252:
	.string	"SYS_utime __NR_utime"
.LASF25:
	.string	"__SIZEOF_SHORT__ 2"
.LASF645:
	.string	"__ssize_t_defined "
.LASF2530:
	.string	"__NR_open 2"
.LASF736:
	.string	"UINT_FAST16_MAX (18446744073709551615UL)"
.LASF877:
	.string	"__NFDBITS (8 * (int) sizeof (__fd_mask))"
.LASF1823:
	.string	"__DECL_SIMD_atanhl "
.LASF1051:
	.string	"EOWNERDEAD 130"
.LASF3634:
	.string	"/home/jscha/dvp/cpumon/build"
.LASF44:
	.string	"__INTMAX_TYPE__ long int"
.LASF671:
	.string	"__HAVE_FLOAT64X_LONG_DOUBLE 1"
.LASF720:
	.string	"INT_LEAST16_MAX (32767)"
.LASF71:
	.string	"__UINT_FAST32_TYPE__ long unsigned int"
.LASF1263:
	.string	"_LFS64_LARGEFILE 1"
.LASF3010:
	.string	"SYS_getsockopt __NR_getsockopt"
.LASF1390:
	.string	"_SC_PII_OSI _SC_PII_OSI"
.LASF1715:
	.string	"__DECL_SIMD_hypotf32 "
.LASF788:
	.string	"WCONTINUED 8"
.LASF1577:
	.string	"_CS_XBS5_LP64_OFF64_LIBS _CS_XBS5_LP64_OFF64_LIBS"
.LASF1422:
	.string	"_SC_PASS_MAX _SC_PASS_MAX"
.LASF2078:
	.string	"WA_ITALIC A_ITALIC"
.LASF3098:
	.string	"SYS_openat2 __NR_openat2"
.LASF2240:
	.string	"delch() wdelch(stdscr)"
.LASF1357:
	.string	"_SC_AIO_PRIO_DELTA_MAX _SC_AIO_PRIO_DELTA_MAX"
.LASF3352:
	.string	"__constant_cpu_to_be16(x) ((__be16)___constant_swab16((x)))"
.LASF3552:
	.string	"uint64_t"
.LASF3299:
	.string	"_IOC_DIRSHIFT (_IOC_SIZESHIFT+_IOC_SIZEBITS)"
.LASF2558:
	.string	"__NR_shmat 30"
.LASF1717:
	.string	"__DECL_SIMD_hypotf128 "
.LASF3090:
	.string	"SYS_name_to_handle_at __NR_name_to_handle_at"
.LASF1326:
	.string	"_PC_REC_MAX_XFER_SIZE _PC_REC_MAX_XFER_SIZE"
.LASF156:
	.string	"__FLT_MIN_10_EXP__ (-37)"
.LASF49:
	.string	"__INT8_TYPE__ signed char"
.LASF1266:
	.string	"_POSIX_CPUTIME 0"
.LASF1130:
	.string	"F_SETLKW64 7"
.LASF510:
	.string	"__REDIRECT_LDBL(name,proto,alias) __REDIRECT (name, proto, alias)"
.LASF431:
	.string	"__GNU_LIBRARY__ 6"
.LASF473:
	.string	"__attribute_alloc_size__(params) __attribute__ ((__alloc_size__ params))"
.LASF819:
	.string	"__u_char_defined "
.LASF1708:
	.string	"__DECL_SIMD_asinf32x "
.LASF3192:
	.string	"SYS_setpgid __NR_setpgid"
.LASF2929:
	.string	"SYS_close_range __NR_close_range"
.LASF3406:
	.string	"PERF_EVENT_IOC_QUERY_BPF _IOWR('$', 10, struct perf_event_query_bpf *)"
.LASF1161:
	.string	"F_DUPFD 0"
.LASF400:
	.string	"__glibc_clang_prereq(maj,min) 0"
.LASF2603:
	.string	"__NR_fdatasync 75"
.LASF2857:
	.string	"__NR_pkey_mprotect 329"
.LASF2064:
	.string	"WA_UNDERLINE A_UNDERLINE"
.LASF703:
	.string	"INT8_MIN (-128)"
.LASF1987:
	.string	"islessequal(x,y) __builtin_islessequal(x, y)"
.LASF2637:
	.string	"__NR_setpgid 109"
.LASF1347:
	.string	"_SC_FSYNC _SC_FSYNC"
.LASF1641:
	.string	"__DECL_SIMD_sincos "
.LASF2430:
	.string	"BUTTON1_DOUBLE_CLICKED NCURSES_MOUSE_MASK(1, NCURSES_DOUBLE_CLICKED)"
.LASF784:
	.string	"WNOHANG 1"
.LASF746:
	.string	"PTRDIFF_MAX (9223372036854775807L)"
.LASF2273:
	.string	"mvwgetnstr(win,y,x,str,n) (wmove((win),(y),(x)) == ERR ? ERR : wgetnstr((win),(str),(n)))"
.LASF2885:
	.string	"__NR_landlock_restrict_self 446"
.LASF562:
	.string	"__need_size_t"
.LASF85:
	.string	"__PTRDIFF_MAX__ 0x7fffffffffffffffL"
.LASF194:
	.string	"__LDBL_NORM_MAX__ 1.18973149535723176502126385303097021e+4932L"
.LASF362:
	.string	"__STDC_IEC_559__ 1"
.LASF232:
	.string	"__FLT64_HAS_QUIET_NAN__ 1"
.LASF406:
	.string	"__USE_ISOC99 1"
.LASF2154:
	.string	"NCURSES_SP_OUTC NCURSES_SP_NAME(NCURSES_OUTC)"
.LASF3562:
	.string	"pkg_cumulative"
.LASF3548:
	.string	"_IO_marker"
.LASF1739:
	.string	"__DECL_SIMD_exp10f64x "
.LASF1872:
	.string	"__DECL_SIMD_erfcf "
.LASF2325:
	.string	"KEY_MIN 0401"
.LASF1742:
	.string	"__DECL_SIMD_coshf "
.LASF2795:
	.string	"__NR_readlinkat 267"
.LASF2307:
	.string	"slk_attr_on(a,v) ((v) ? ERR : slk_attron(a))"
.LASF811:
	.string	"WIFCONTINUED(status) __WIFCONTINUED (status)"
.LASF1748:
	.string	"__DECL_SIMD_coshf32x "
.LASF1835:
	.string	"__DECL_SIMD_acoshf32 "
.LASF397:
	.string	"__GLIBC_USE_DEPRECATED_SCANF"
.LASF3139:
	.string	"SYS_recvmsg __NR_recvmsg"
.LASF3557:
	.string	"_Bool"
.LASF3596:
	.string	"designer"
.LASF785:
	.string	"WUNTRACED 2"
.LASF43:
	.string	"__WINT_TYPE__ unsigned int"
.LASF334:
	.string	"__SIZEOF_FLOAT80__ 16"
.LASF2482:
	.string	"TRACE_MAXIMUM ((1 << TRACE_SHIFT) - 1)"
.LASF214:
	.string	"__FLT32_HAS_DENORM__ 1"
.LASF129:
	.string	"__UINT32_C(c) c ## U"
.LASF1173:
	.string	"__F_GETOWN_EX 16"
.LASF700:
	.string	"_BITS_STDINT_INTN_H 1"
.LASF2823:
	.string	"__NR_preadv 295"
.LASF328:
	.string	"__SIZEOF_WINT_T__ 4"
.LASF875:
	.string	"__suseconds_t_defined "
.LASF749:
	.string	"SIZE_MAX (18446744073709551615UL)"
.LASF2233:
	.string	"bkgd(ch) wbkgd(stdscr,(ch))"
.LASF70:
	.string	"__UINT_FAST16_TYPE__ long unsigned int"
.LASF3254:
	.string	"SYS_utimes __NR_utimes"
.LASF772:
	.string	"_WCHAR_T_ "
.LASF3136:
	.string	"SYS_reboot __NR_reboot"
.LASF264:
	.string	"__FLT32X_HAS_QUIET_NAN__ 1"
.LASF1133:
	.string	"O_WRONLY 01"
.LASF2059:
	.string	"NCURSES_CAST(type,value) (type)(value)"
.LASF1747:
	.string	"__DECL_SIMD_coshf128 "
.LASF1482:
	.string	"_SC_FILE_SYSTEM _SC_FILE_SYSTEM"
.LASF1735:
	.string	"__DECL_SIMD_exp10f32 "
.LASF2757:
	.string	"__NR_clock_getres 229"
.LASF2746:
	.string	"__NR_set_tid_address 218"
.LASF440:
	.string	"__LEAF , __leaf__"
.LASF628:
	.string	"__TIME64_T_TYPE __TIME_T_TYPE"
.LASF2487:
	.string	"AVG_WINDOW 60"
.LASF364:
	.string	"__STDC_IEC_559_COMPLEX__ 1"
.LASF46:
	.string	"__CHAR16_TYPE__ short unsigned int"
.LASF1387:
	.string	"_SC_PII_XTI _SC_PII_XTI"
.LASF725:
	.string	"UINT_LEAST32_MAX (4294967295U)"
.LASF109:
	.string	"__UINT16_MAX__ 0xffff"
.LASF2848:
	.string	"__NR_kexec_file_load 320"
.LASF1918:
	.string	"__MATH_DECLARING_DOUBLE"
.LASF2920:
	.string	"SYS_chroot __NR_chroot"
.LASF1682:
	.string	"__DECL_SIMD_acosf "
.LASF585:
	.string	"_BITS_TYPESIZES_H 1"
.LASF98:
	.string	"__UINTMAX_MAX__ 0xffffffffffffffffUL"
.LASF270:
	.string	"__FLT64X_MAX_EXP__ 16384"
.LASF278:
	.string	"__FLT64X_HAS_DENORM__ 1"
.LASF2778:
	.string	"__NR_keyctl 250"
.LASF3415:
	.string	"PERF_RECORD_MISC_PROC_MAP_PARSE_TIMEOUT (1 << 12)"
.LASF2677:
	.string	"__NR_mlock 149"
.LASF2814:
	.string	"__NR_timerfd_settime 286"
.LASF2845:
	.string	"__NR_seccomp 317"
.LASF3:
	.string	"__STDC_UTF_32__ 1"
.LASF2089:
	.string	"ACS_LLCORNER NCURSES_ACS('m')"
.LASF3635:
	.string	"_IO_lock_t"
.LASF3123:
	.string	"SYS_ptrace __NR_ptrace"
.LASF489:
	.string	"__always_inline"
.LASF1363:
	.string	"_SC_PAGE_SIZE _SC_PAGESIZE"
.LASF2433:
	.string	"BUTTON2_PRESSED NCURSES_MOUSE_MASK(2, NCURSES_BUTTON_PRESSED)"
.LASF3263:
	.string	"_LINUX_PERF_EVENT_H "
.LASF2748:
	.string	"__NR_semtimedop 220"
.LASF1652:
	.string	"__DECL_SIMD_logf "
.LASF3519:
	.string	"_IO_read_ptr"
.LASF373:
	.string	"__USE_ISOC95"
.LASF2825:
	.string	"__NR_rt_tgsigqueueinfo 297"
.LASF372:
	.string	"__USE_ISOC99"
.LASF2051:
	.string	"FALSE"
.LASF3267:
	.string	"__ASM_X86_BITSPERLONG_H "
.LASF1437:
	.string	"_SC_CHAR_MIN _SC_CHAR_MIN"
.LASF1147:
	.string	"__O_CLOEXEC 02000000"
.LASF820:
	.string	"__ino_t_defined "
.LASF2044:
	.string	"__va_copy(d,s) __builtin_va_copy(d,s)"
.LASF842:
	.string	"__FLOAT_WORD_ORDER __BYTE_ORDER"
.LASF1555:
	.string	"_CS_V5_WIDTH_RESTRICTED_ENVS _CS_V5_WIDTH_RESTRICTED_ENVS"
.LASF2262:
	.string	"timeout(delay) wtimeout(stdscr,(delay))"
.LASF231:
	.string	"__FLT64_HAS_INFINITY__ 1"
.LASF6:
	.string	"__GNUC_MINOR__ 4"
.LASF3380:
	.string	"PERF_SAMPLE_WEIGHT_TYPE (PERF_SAMPLE_WEIGHT | PERF_SAMPLE_WEIGHT_STRUCT)"
.LASF3007:
	.string	"SYS_getrusage __NR_getrusage"
.LASF163:
	.string	"__FLT_EPSILON__ 1.19209289550781250000000000000000000e-7F"
.LASF3600:
	.string	"power_unit_raw"
.LASF2596:
	.string	"__NR_msgget 68"
.LASF1546:
	.string	"_SC_THREAD_ROBUST_PRIO_INHERIT _SC_THREAD_ROBUST_PRIO_INHERIT"
.LASF1898:
	.string	"__FP_LOGBNAN_IS_MIN 1"
.LASF3306:
	.string	"_IOR(type,nr,size) _IOC(_IOC_READ,(type),(nr),(_IOC_TYPECHECK(size)))"
.LASF2605:
	.string	"__NR_ftruncate 77"
.LASF1882:
	.string	"__DECL_SIMD_tanf "
.LASF2994:
	.string	"SYS_getgroups __NR_getgroups"
.LASF330:
	.string	"__amd64 1"
.LASF3533:
	.string	"_flags2"
.LASF2981:
	.string	"SYS_futex_waitv __NR_futex_waitv"
.LASF514:
	.string	"__HAVE_GENERIC_SELECTION 1"
.LASF3599:
	.string	"energy_unit_raw"
.LASF730:
	.string	"INT_FAST64_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF2035:
	.string	"NCURSES_CH_T"
.LASF2056:
	.string	"false 0"
.LASF1707:
	.string	"__DECL_SIMD_asinf128 "
.LASF2159:
	.string	"A_CHARTEXT (NCURSES_BITS(1U,0) - 1U)"
.LASF643:
	.string	"_VA_LIST_DEFINED "
.LASF3482:
	.string	"PERF_MEM_SNOOPX_SHIFT 38"
.LASF471:
	.string	"__ASMNAME2(prefix,cname) __STRING (prefix) cname"
.LASF3429:
	.string	"PERF_AUX_FLAG_PARTIAL 0x04"
.LASF2966:
	.string	"SYS_finit_module __NR_finit_module"
.LASF3240:
	.string	"SYS_tkill __NR_tkill"
.LASF463:
	.string	"__warnattr(msg) __attribute__((__warning__ (msg)))"
.LASF3214:
	.string	"SYS_splice __NR_splice"
.LASF812:
	.string	"__ldiv_t_defined 1"
.LASF1628:
	.string	"__DECL_SIMD_cosf32x "
.LASF3476:
	.string	"PERF_MEM_SNOOP_HIT 0x04"
.LASF2892:
	.string	"__NR_map_shadow_stack 453"
.LASF855:
	.string	"be16toh(x) __bswap_16 (x)"
.LASF3540:
	.string	"_codecvt"
.LASF2452:
	.string	"BUTTON_CTRL NCURSES_MOUSE_MASK(6, 0001L)"
.LASF920:
	.string	"_ASM_GENERIC_ERRNO_H "
.LASF40:
	.string	"__SIZE_TYPE__ long unsigned int"
.LASF3110:
	.string	"SYS_pkey_mprotect __NR_pkey_mprotect"
.LASF423:
	.string	"__SYSCALL_WORDSIZE 64"
.LASF2340:
	.string	"KEY_IC 0513"
.LASF3313:
	.string	"_IOC_TYPE(nr) (((nr) >> _IOC_TYPESHIFT) & _IOC_TYPEMASK)"
.LASF1430:
	.string	"_SC_2_C_VERSION _SC_2_C_VERSION"
.LASF2615:
	.string	"__NR_unlink 87"
.LASF938:
	.string	"EEXIST 17"
.LASF3002:
	.string	"SYS_getpriority __NR_getpriority"
.LASF2207:
	.string	"touchline(win,s,c) wtouchln((win), s, c, 1)"
.LASF1450:
	.string	"_SC_UINT_MAX _SC_UINT_MAX"
.LASF2536:
	.string	"__NR_lseek 8"
.LASF2696:
	.string	"__NR_swapoff 168"
.LASF3523:
	.string	"_IO_write_ptr"
.LASF2895:
	.string	"__NR_futex_requeue 456"
.LASF742:
	.string	"INTMAX_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF2628:
	.string	"__NR_times 100"
.LASF1900:
	.string	"FP_ILOGBNAN (-2147483647 - 1)"
.LASF1253:
	.string	"_POSIX_THREAD_ROBUST_PRIO_INHERIT 200809L"
.LASF806:
	.string	"WTERMSIG(status) __WTERMSIG (status)"
.LASF115:
	.string	"__INT_LEAST16_MAX__ 0x7fff"
.LASF2744:
	.string	"__NR_remap_file_pages 216"
.LASF38:
	.string	"__GNUC_EXECUTION_CHARSET_NAME \"UTF-8\""
.LASF296:
	.string	"__DEC128_MANT_DIG__ 34"
.LASF2450:
	.string	"BUTTON5_DOUBLE_CLICKED NCURSES_MOUSE_MASK(5, NCURSES_DOUBLE_CLICKED)"
.LASF2155:
	.string	"NCURSES_ATTR_SHIFT 8"
.LASF2935:
	.string	"SYS_dup __NR_dup"
.LASF1298:
	.string	"__ILP32_OFF32_LDFLAGS \"-m32\""
.LASF3196:
	.string	"SYS_setresuid __NR_setresuid"
.LASF3188:
	.string	"SYS_setgroups __NR_setgroups"
.LASF1466:
	.string	"_SC_ADVISORY_INFO _SC_ADVISORY_INFO"
.LASF1589:
	.string	"_CS_POSIX_V6_ILP32_OFFBIG_LIBS _CS_POSIX_V6_ILP32_OFFBIG_LIBS"
.LASF3376:
	.string	"__cpu_to_be16s(x) __swab16s((x))"
.LASF164:
	.string	"__FLT_DENORM_MIN__ 1.40129846432481707092372958328991613e-45F"
.LASF1166:
	.string	"__F_SETOWN 8"
.LASF2708:
	.string	"__NR_nfsservctl 180"
.LASF2350:
	.string	"KEY_CTAB 0525"
.LASF2016:
	.string	"NCURSES_PAIRS_T"
.LASF2525:
	.string	"_ASM_X86_UNISTD_H "
.LASF2363:
	.string	"KEY_CLOSE 0544"
.LASF782:
	.string	"__need_wchar_t"
.LASF3262:
	.string	"SYS_writev __NR_writev"
.LASF1006:
	.string	"ERESTART 85"
.LASF2100:
	.string	"ACS_S9 NCURSES_ACS('s')"
.LASF2476:
	.string	"TRACE_BITS 0x0100"
.LASF1806:
	.string	"__DECL_SIMD_log2f64 "
.LASF2117:
	.string	"ACS_PI NCURSES_ACS('{')"
.LASF3617:
	.string	"msr_temperature_c"
.LASF2214:
	.string	"winchstr(w,s) winchnstr(w, s, -1)"
.LASF3468:
	.string	"PERF_MEM_LVLNUM_ANY_CACHE 0x0b"
.LASF2948:
	.string	"SYS_execve __NR_execve"
.LASF781:
	.string	"_BSD_WCHAR_T_"
.LASF3257:
	.string	"SYS_vmsplice __NR_vmsplice"
.LASF1978:
	.string	"M_PI_4 0.78539816339744830962"
.LASF2843:
	.string	"__NR_sched_getattr 315"
.LASF2443:
	.string	"BUTTON4_PRESSED NCURSES_MOUSE_MASK(4, NCURSES_BUTTON_PRESSED)"
.LASF1624:
	.string	"__DECL_SIMD_cosf16 "
.LASF906:
	.string	"_THREAD_MUTEX_INTERNAL_H 1"
.LASF925:
	.string	"EINTR 4"
.LASF1521:
	.string	"_SC_LEVEL1_ICACHE_LINESIZE _SC_LEVEL1_ICACHE_LINESIZE"
.LASF998:
	.string	"EBADFD 77"
.LASF1873:
	.string	"__DECL_SIMD_erfcl "
.LASF1743:
	.string	"__DECL_SIMD_coshl "
.LASF77:
	.string	"__SHRT_MAX__ 0x7fff"
.LASF2821:
	.string	"__NR_pipe2 293"
.LASF808:
	.string	"WIFEXITED(status) __WIFEXITED (status)"
.LASF1333:
	.string	"_SC_CHILD_MAX _SC_CHILD_MAX"
.LASF339:
	.string	"__k8 1"
.LASF537:
	.string	"__GLIBC_USE_IEC_60559_FUNCS_EXT"
.LASF1209:
	.string	"F_LOCK 1"
.LASF3040:
	.string	"SYS_landlock_create_ruleset __NR_landlock_create_ruleset"
.LASF757:
	.string	"INT64_C(c) c ## L"
.LASF3303:
	.string	"_IOC(dir,type,nr,size) (((dir) << _IOC_DIRSHIFT) | ((type) << _IOC_TYPESHIFT) | ((nr) << _IOC_NRSHIFT) | ((size) << _IOC_SIZESHIFT))"
.LASF1318:
	.string	"_PC_NO_TRUNC _PC_NO_TRUNC"
.LASF1403:
	.string	"_SC_GETGR_R_SIZE_MAX _SC_GETGR_R_SIZE_MAX"
.LASF91:
	.string	"__LONG_LONG_WIDTH__ 64"
.LASF2786:
	.string	"__NR_mkdirat 258"
.LASF1511:
	.string	"_SC_V6_ILP32_OFFBIG _SC_V6_ILP32_OFFBIG"
.LASF53:
	.string	"__UINT8_TYPE__ unsigned char"
.LASF2333:
	.string	"KEY_HOME 0406"
.LASF685:
	.string	"__HAVE_DISTINCT_FLOAT128X __HAVE_FLOAT128X"
.LASF113:
	.string	"__INT8_C(c) c"
.LASF74:
	.string	"__UINTPTR_TYPE__ long unsigned int"
.LASF1640:
	.string	"__DECL_SIMD_sinf128x "
.LASF3141:
	.string	"SYS_removexattr __NR_removexattr"
.LASF3099:
	.string	"SYS_pause __NR_pause"
.LASF880:
	.string	"__FDS_BITS(set) ((set)->__fds_bits)"
.LASF110:
	.string	"__UINT32_MAX__ 0xffffffffU"
.LASF315:
	.string	"__GCC_ATOMIC_WCHAR_T_LOCK_FREE 2"
.LASF1999:
	.string	"NCURSES_DLL_H_incl 1"
.LASF1592:
	.string	"_CS_POSIX_V6_LP64_OFF64_LDFLAGS _CS_POSIX_V6_LP64_OFF64_LDFLAGS"
.LASF1229:
	.string	"_BITS_POSIX_OPT_H 1"
.LASF241:
	.string	"__FLT128_MAX__ 1.18973149535723176508575932662800702e+4932F128"
.LASF2573:
	.string	"__NR_recvfrom 45"
.LASF3093:
	.string	"SYS_nfsservctl __NR_nfsservctl"
.LASF83:
	.string	"__WINT_MAX__ 0xffffffffU"
.LASF1064:
	.string	"_STATBUF_ST_RDEV "
.LASF2959:
	.string	"SYS_fchmod __NR_fchmod"
.LASF1809:
	.string	"__DECL_SIMD_log2f64x "
.LASF1807:
	.string	"__DECL_SIMD_log2f128 "
.LASF710:
	.string	"INT64_MAX (__INT64_C(9223372036854775807))"
.LASF2672:
	.string	"__NR_sched_setscheduler 144"
.LASF553:
	.string	"_BSD_SIZE_T_ "
.LASF976:
	.string	"ENOANO 55"
.LASF1288:
	.string	"_POSIX_TRACE_INHERIT -1"
.LASF1600:
	.string	"_CS_POSIX_V7_ILP32_OFF32_LDFLAGS _CS_POSIX_V7_ILP32_OFF32_LDFLAGS"
.LASF1633:
	.string	"__DECL_SIMD_sinl "
.LASF3339:
	.string	"__constant_ntohl(x) ___constant_swab32((__be32)(x))"
.LASF50:
	.string	"__INT16_TYPE__ short int"
.LASF411:
	.string	"_POSIX_C_SOURCE"
.LASF1095:
	.string	"S_ISCHR(mode) __S_ISTYPE((mode), __S_IFCHR)"
.LASF866:
	.string	"__FD_ZERO(s) do { unsigned int __i; fd_set *__arr = (s); for (__i = 0; __i < sizeof (fd_set) / sizeof (__fd_mask); ++__i) __FDS_BITS (__arr)[__i] = 0; } while (0)"
.LASF1781:
	.string	"__DECL_SIMD_atan2 "
.LASF1911:
	.string	"__MATHREDIR(type,function,suffix,args,to) extern type __REDIRECT_NTH (__MATH_PRECNAME (function, suffix), args, to)"
.LASF84:
	.string	"__WINT_MIN__ 0U"
.LASF3441:
	.string	"PERF_MEM_OP_PFETCH 0x08"
.LASF2905:
	.string	"SYS_access __NR_access"
.LASF386:
	.string	"__USE_LARGEFILE"
.LASF1653:
	.string	"__DECL_SIMD_logl "
.LASF1065:
	.string	"_STATBUF_ST_NSEC "
.LASF505:
	.string	"__LDBL_REDIR(name,proto) name proto"
.LASF1372:
	.string	"_SC_BC_STRING_MAX _SC_BC_STRING_MAX"
.LASF1627:
	.string	"__DECL_SIMD_cosf128 "
.LASF695:
	.string	"__CFLOAT64X _Complex _Float64x"
.LASF2879:
	.string	"__NR_process_madvise 440"
.LASF3449:
	.string	"PERF_MEM_LVL_L2 0x20"
.LASF3579:
	.string	"fprintf"
.LASF3218:
	.string	"SYS_swapoff __NR_swapoff"
.LASF1654:
	.string	"__DECL_SIMD_logf16 "
.LASF792:
	.string	"__WCLONE 0x80000000"
.LASF106:
	.string	"__INT32_MAX__ 0x7fffffff"
.LASF82:
	.string	"__WCHAR_MIN__ (-__WCHAR_MAX__ - 1)"
.LASF2202:
	.string	"wstandend(win) (wattrset(win,A_NORMAL))"
.LASF669:
	.string	"__HAVE_DISTINCT_FLOAT128 1"
.LASF3005:
	.string	"SYS_getresuid __NR_getresuid"
.LASF3486:
	.string	"PERF_MEM_TLB_NA 0x01"
.LASF3387:
	.string	"PERF_ATTR_SIZE_VER0 64"
.LASF1342:
	.string	"_SC_PRIORITY_SCHEDULING _SC_PRIORITY_SCHEDULING"
.LASF3460:
	.string	"PERF_MEM_REMOTE_SHIFT 37"
.LASF2514:
	.string	"TURBO_TRANSITION_ATTENUATION_STATUS 8192"
.LASF2260:
	.string	"standend() wstandend(stdscr)"
.LASF1883:
	.string	"__DECL_SIMD_tanl "
.LASF243:
	.string	"__FLT128_MIN__ 3.36210314311209350626267781732175260e-4932F128"
.LASF449:
	.string	"__STRING(x) #x"
.LASF1612:
	.string	"_CS_POSIX_V7_LPBIG_OFFBIG_LDFLAGS _CS_POSIX_V7_LPBIG_OFFBIG_LDFLAGS"
.LASF2922:
	.string	"SYS_clock_getres __NR_clock_getres"
.LASF160:
	.string	"__FLT_MAX__ 3.40282346638528859811704183484516925e+38F"
.LASF3100:
	.string	"SYS_perf_event_open __NR_perf_event_open"
.LASF117:
	.string	"__INT_LEAST16_WIDTH__ 16"
.LASF207:
	.string	"__FLT32_MAX_10_EXP__ 38"
.LASF2200:
	.string	"getpary(win) (NCURSES_OK_ADDR(win) ? (win)->_pary : ERR)"
.LASF1106:
	.string	"S_ISVTX __S_ISVTX"
.LASF3631:
	.string	"msr_filename"
.LASF3400:
	.string	"PERF_EVENT_IOC_PERIOD _IOW('$', 4, __u64)"
.LASF2282:
	.string	"mvwinsstr(win,y,x,s) (wmove((win),(y),(x)) == ERR ? ERR : winsstr((win),(s)))"
.LASF2894:
	.string	"__NR_futex_wait 455"
.LASF1659:
	.string	"__DECL_SIMD_logf64x "
.LASF2412:
	.string	"KEY_SSUSPEND 0625"
.LASF1311:
	.string	"_PC_LINK_MAX _PC_LINK_MAX"
.LASF135:
	.string	"__INT_FAST16_WIDTH__ 64"
.LASF2745:
	.string	"__NR_getdents64 217"
.LASF3258:
	.string	"SYS_vserver __NR_vserver"
.LASF667:
	.string	"_BITS_FLOATN_H "
.LASF1401:
	.string	"_SC_THREADS _SC_THREADS"
.LASF3616:
	.string	"pkg_tw1"
.LASF2257:
	.string	"refresh() wrefresh(stdscr)"
.LASF2441:
	.string	"BUTTON3_TRIPLE_CLICKED NCURSES_MOUSE_MASK(3, NCURSES_TRIPLE_CLICKED)"
.LASF1760:
	.string	"__DECL_SIMD_expm1f128x "
.LASF944:
	.string	"ENFILE 23"
.LASF522:
	.string	"__stub_chflags "
.LASF1325:
	.string	"_PC_REC_INCR_XFER_SIZE _PC_REC_INCR_XFER_SIZE"
.LASF2374:
	.string	"KEY_NEXT 0557"
.LASF556:
	.string	"_BSD_SIZE_T_DEFINED_ "
.LASF2635:
	.string	"__NR_geteuid 107"
.LASF1601:
	.string	"_CS_POSIX_V7_ILP32_OFF32_LIBS _CS_POSIX_V7_ILP32_OFF32_LIBS"
.LASF2535:
	.string	"__NR_poll 7"
.LASF1286:
	.string	"_POSIX_TRACE -1"
.LASF2027:
	.string	"NCURSES_SIZE_T"
.LASF2020:
	.string	"NCURSES_OPAQUE_MENU 0"
.LASF1989:
	.string	"isunordered(x,y) __builtin_isunordered(x, y)"
.LASF3050:
	.string	"SYS_lremovexattr __NR_lremovexattr"
.LASF928:
	.string	"E2BIG 7"
.LASF1545:
	.string	"_SC_XOPEN_STREAMS _SC_XOPEN_STREAMS"
.LASF2758:
	.string	"__NR_clock_nanosleep 230"
.LASF2328:
	.string	"KEY_RESET 0531"
.LASF348:
	.string	"__MMX_WITH_SSE__ 1"
.LASF1934:
	.string	"__MATH_PRECNAME(name,r) name ##f32x ##r"
.LASF1585:
	.string	"_CS_POSIX_V6_ILP32_OFF32_LIBS _CS_POSIX_V6_ILP32_OFF32_LIBS"
.LASF2415:
	.string	"KEY_UNDO 0630"
.LASF1702:
	.string	"__DECL_SIMD_asinf "
.LASF924:
	.string	"ESRCH 3"
.LASF1644:
	.string	"__DECL_SIMD_sincosf16 "
.LASF3495:
	.string	"PERF_MEM_BLK_DATA 0x02"
.LASF2423:
	.string	"NCURSES_BUTTON_CLICKED 004L"
.LASF568:
	.string	"__GNUC_VA_LIST "
.LASF1113:
	.string	"S_IEXEC S_IXUSR"
.LASF1285:
	.string	"_POSIX_THREAD_SPORADIC_SERVER -1"
.LASF1972:
	.string	"M_LOG2E 1.4426950408889634074"
.LASF1564:
	.string	"_CS_LFS64_LDFLAGS _CS_LFS64_LDFLAGS"
.LASF1881:
	.string	"__DECL_SIMD_tan "
.LASF892:
	.string	"_THREAD_SHARED_TYPES_H 1"
.LASF876:
	.string	"__NFDBITS"
.LASF3538:
	.string	"_lock"
.LASF104:
	.string	"__INT8_MAX__ 0x7f"
.LASF963:
	.string	"ENOMSG 42"
.LASF3447:
	.string	"PERF_MEM_LVL_L1 0x08"
.LASF1525:
	.string	"_SC_LEVEL2_CACHE_SIZE _SC_LEVEL2_CACHE_SIZE"
.LASF644:
	.string	"__off_t_defined "
.LASF103:
	.string	"__SIG_ATOMIC_WIDTH__ 32"
.LASF417:
	.string	"__USE_XOPEN2K 1"
.LASF3391:
	.string	"PERF_ATTR_SIZE_VER4 104"
.LASF3075:
	.string	"SYS_mq_getsetattr __NR_mq_getsetattr"
.LASF3322:
	.string	"_LINUX_BYTEORDER_LITTLE_ENDIAN_H "
.LASF1532:
	.string	"_SC_LEVEL4_CACHE_ASSOC _SC_LEVEL4_CACHE_ASSOC"
.LASF1148:
	.string	"__O_DIRECT 040000"
.LASF539:
	.string	"__GLIBC_USE_IEC_60559_FUNCS_EXT_C2X"
.LASF2781:
	.string	"__NR_inotify_init 253"
.LASF1593:
	.string	"_CS_POSIX_V6_LP64_OFF64_LIBS _CS_POSIX_V6_LP64_OFF64_LIBS"
.LASF2332:
	.string	"KEY_RIGHT 0405"
.LASF3000:
	.string	"SYS_getpmsg __NR_getpmsg"
.LASF3229:
	.string	"SYS_tgkill __NR_tgkill"
.LASF3332:
	.string	"___constant_swahb32(x) ((__u32)( (((__u32)(x) & (__u32)0x00ff00ffUL) << 8) | (((__u32)(x) & (__u32)0xff00ff00UL) >> 8)))"
.LASF3219:
	.string	"SYS_swapon __NR_swapon"
.LASF249:
	.string	"__FLT128_IS_IEC_60559__ 2"
.LASF2713:
	.string	"__NR_security 185"
.LASF142:
	.string	"__UINT_FAST32_MAX__ 0xffffffffffffffffUL"
.LASF3238:
	.string	"SYS_timerfd_settime __NR_timerfd_settime"
.LASF915:
	.string	"alloca"
.LASF2729:
	.string	"__NR_time 201"
.LASF62:
	.string	"__UINT_LEAST16_TYPE__ short unsigned int"
.LASF1876:
	.string	"__DECL_SIMD_erfcf64 "
.LASF3302:
	.string	"_IOC_READ 2U"
.LASF2940:
	.string	"SYS_epoll_ctl __NR_epoll_ctl"
.LASF200:
	.string	"__LDBL_HAS_QUIET_NAN__ 1"
.LASF99:
	.string	"__UINTMAX_C(c) c ## UL"
.LASF2912:
	.string	"SYS_bind __NR_bind"
.LASF2269:
	.string	"mvwaddstr(win,y,x,str) (wmove((win),(y),(x)) == ERR ? ERR : waddnstr((win),(str),-1))"
.LASF3120:
	.string	"SYS_process_vm_readv __NR_process_vm_readv"
.LASF3480:
	.string	"PERF_MEM_SNOOPX_FWD 0x01"
.LASF2152:
	.string	"NCURSES_SP_FUNCS 20211021"
.LASF3276:
	.string	"__FD_SETSIZE"
.LASF840:
	.string	"_BITS_ENDIANNESS_H 1"
.LASF664:
	.string	"stderr stderr"
.LASF2004:
	.string	"NCURSES_EXPORT_VAR(type) NCURSES_IMPEXP type"
.LASF2882:
	.string	"__NR_quotactl_fd 443"
.LASF657:
	.string	"TMP_MAX 238328"
.LASF2124:
	.string	"ACS_SBSS ACS_RTEE"
.LASF1679:
	.string	"__DECL_SIMD_powf64x "
.LASF1649:
	.string	"__DECL_SIMD_sincosf64x "
.LASF1962:
	.string	"fpclassify(x) __builtin_fpclassify (FP_NAN, FP_INFINITE, FP_NORMAL, FP_SUBNORMAL, FP_ZERO, x)"
.LASF1281:
	.string	"_POSIX_IPV6 200809L"
.LASF501:
	.string	"__attribute_copy__"
.LASF1570:
	.string	"_CS_XBS5_ILP32_OFF32_LINTFLAGS _CS_XBS5_ILP32_OFF32_LINTFLAGS"
.LASF1619:
	.string	"_MATH_H 1"
.LASF668:
	.string	"__HAVE_FLOAT128 1"
.LASF2645:
	.string	"__NR_setresuid 117"
.LASF2039:
	.string	"_ANSI_STDARG_H_ "
.LASF1861:
	.string	"__DECL_SIMD_asinh "
.LASF1041:
	.string	"EISNAM 120"
.LASF2463:
	.string	"mouse_trafo(y,x,to_screen) wmouse_trafo(stdscr,y,x,to_screen)"
.LASF2403:
	.string	"KEY_SNEXT 0614"
.LASF3463:
	.string	"PERF_MEM_LVLNUM_L3 0x03"
.LASF2547:
	.string	"__NR_readv 19"
.LASF1541:
	.string	"_SC_TRACE_EVENT_NAME_MAX _SC_TRACE_EVENT_NAME_MAX"
.LASF416:
	.string	"__USE_POSIX199506 1"
.LASF2280:
	.string	"mvwinsch(win,y,x,c) (wmove((win),(y),(x)) == ERR ? ERR : winsch((win),(c)))"
.LASF1284:
	.string	"_POSIX_SPORADIC_SERVER -1"
.LASF2592:
	.string	"__NR_semget 64"
.LASF3526:
	.string	"_IO_buf_end"
.LASF1337:
	.string	"_SC_STREAM_MAX _SC_STREAM_MAX"
.LASF211:
	.string	"__FLT32_MIN__ 1.17549435082228750796873653722224568e-38F32"
.LASF3070:
	.string	"SYS_mount __NR_mount"
.LASF1926:
	.string	"_Mdouble_ _Float32"
.LASF2147:
	.string	"GCC_DEPRECATED(msg) __attribute__((deprecated))"
.LASF3508:
	.string	"short unsigned int"
.LASF637:
	.string	"__putc_unlocked_body(_ch,_fp) (__glibc_unlikely ((_fp)->_IO_write_ptr >= (_fp)->_IO_write_end) ? __overflow (_fp, (unsigned char) (_ch)) : (unsigned char) (*(_fp)->_IO_write_ptr++ = (_ch)))"
.LASF2644:
	.string	"__NR_setgroups 116"
.LASF3588:
	.string	"vr_therm_design_current"
.LASF3036:
	.string	"SYS_kexec_load __NR_kexec_load"
.LASF2037:
	.string	"NCURSES_WIDECHAR 0"
.LASF316:
	.string	"__GCC_ATOMIC_SHORT_LOCK_FREE 2"
.LASF3221:
	.string	"SYS_symlinkat __NR_symlinkat"
.LASF2334:
	.string	"KEY_BACKSPACE 0407"
.LASF2584:
	.string	"__NR_clone 56"
.LASF3611:
	.string	"power_domains"
.LASF1993:
	.string	"NCURSES_VERSION_MAJOR 6"
.LASF597:
	.string	"__OFF64_T_TYPE __SQUAD_TYPE"
.LASF1720:
	.string	"__DECL_SIMD_hypotf128x "
.LASF3573:
	.string	"fclose"
.LASF3320:
	.string	"IOCSIZE_SHIFT (_IOC_SIZESHIFT)"
.LASF656:
	.string	"L_tmpnam 20"
.LASF2903:
	.string	"SYS_accept __NR_accept"
.LASF1828:
	.string	"__DECL_SIMD_atanhf32x "
.LASF2581:
	.string	"__NR_socketpair 53"
.LASF2521:
	.string	"AMD_TIME_UNIT_MASK 0xF0000"
.LASF1023:
	.string	"ENETRESET 102"
.LASF1798:
	.string	"__DECL_SIMD_log10f32x "
.LASF323:
	.string	"__GCC_HAVE_DWARF2_CFI_ASM 1"
.LASF697:
	.string	"_BITS_WCHAR_H 1"
.LASF2676:
	.string	"__NR_sched_rr_get_interval 148"
.LASF2772:
	.string	"__NR_mq_notify 244"
.LASF2096:
	.string	"ACS_HLINE NCURSES_ACS('q')"
.LASF1185:
	.string	"FAPPEND O_APPEND"
.LASF2689:
	.string	"__NR_chroot 161"
.LASF1112:
	.string	"S_IWRITE S_IWUSR"
.LASF2210:
	.string	"border(ls,rs,ts,bs,tl,tr,bl,br) wborder(stdscr, ls, rs, ts, bs, tl, tr, bl, br)"
.LASF1421:
	.string	"_SC_ATEXIT_MAX _SC_ATEXIT_MAX"
.LASF2796:
	.string	"__NR_fchmodat 268"
.LASF502:
	.string	"__attribute_copy__(arg) __attribute__ ((__copy__ (arg)))"
.LASF2203:
	.string	"wattron(win,at) wattr_on(win, NCURSES_CAST(attr_t, at), NULL)"
.LASF442:
	.string	"__THROW __attribute__ ((__nothrow__ __LEAF))"
.LASF500:
	.string	"__attribute_nonstring__ __attribute__ ((__nonstring__))"
.LASF2170:
	.string	"A_HORIZONTAL NCURSES_BITS(1U,17)"
.LASF3549:
	.string	"_IO_codecvt"
.LASF1598:
	.string	"_CS_POSIX_V6_LPBIG_OFFBIG_LINTFLAGS _CS_POSIX_V6_LPBIG_OFFBIG_LINTFLAGS"
.LASF1059:
	.string	"_BITS_STRUCT_STAT_H 1"
.LASF3101:
	.string	"SYS_personality __NR_personality"
.LASF39:
	.string	"__GNUC_WIDE_EXECUTION_CHARSET_NAME \"UTF-32LE\""
.LASF3333:
	.string	"__swab16(x) (__u16)(__builtin_constant_p(x) ? ___constant_swab16(x) : __fswab16(x))"
.LASF1944:
	.string	"__MATHCALL_NARROW_ARGS_3 (_Marg_ __x, _Marg_ __y, _Marg_ __z)"
.LASF3200:
	.string	"SYS_setsockopt __NR_setsockopt"
.LASF153:
	.string	"__FLT_MANT_DIG__ 24"
.LASF340:
	.string	"__k8__ 1"
.LASF2704:
	.string	"__NR_delete_module 176"
.LASF648:
	.string	"_IONBF 2"
.LASF3270:
	.string	"__BITS_PER_LONG_LONG 64"
.LASF2324:
	.string	"KEY_CODE_YES 0400"
.LASF3601:
	.string	"get_msr_core_units"
.LASF2111:
	.string	"ACS_LANTERN NCURSES_ACS('i')"
.LASF2167:
	.string	"A_ALTCHARSET NCURSES_BITS(1U,14)"
.LASF1000:
	.string	"ELIBACC 79"
.LASF2622:
	.string	"__NR_lchown 94"
.LASF453:
	.string	"__bos(ptr) __builtin_object_size (ptr, __USE_FORTIFY_LEVEL > 1)"
.LASF388:
	.string	"__USE_FILE_OFFSET64"
.LASF1811:
	.string	"__DECL_SIMD_log1p "
.LASF803:
	.string	"__W_CONTINUED 0xffff"
.LASF604:
	.string	"__FSBLKCNT64_T_TYPE __UQUAD_TYPE"
.LASF861:
	.string	"htobe64(x) __bswap_64 (x)"
.LASF2663:
	.string	"__NR_personality 135"
.LASF713:
	.string	"UINT32_MAX (4294967295U)"
.LASF3145:
	.string	"SYS_request_key __NR_request_key"
.LASF830:
	.string	"__clock_t_defined 1"
.LASF1669:
	.string	"__DECL_SIMD_expf64x "
.LASF2690:
	.string	"__NR_sync 162"
.LASF1549:
	.string	"_SC_SIGSTKSZ _SC_SIGSTKSZ"
.LASF2614:
	.string	"__NR_link 86"
.LASF618:
	.string	"__FSID_T_TYPE struct { int __val[2]; }"
.LASF2006:
	.string	"NCURSES_EXPORT_GENERAL_EXPORT "
.LASF3171:
	.string	"SYS_select __NR_select"
.LASF1312:
	.string	"_PC_MAX_CANON _PC_MAX_CANON"
.LASF980:
	.string	"EBFONT 59"
.LASF1958:
	.string	"FP_INFINITE 1"
.LASF2351:
	.string	"KEY_CATAB 0526"
.LASF3135:
	.string	"SYS_readv __NR_readv"
.LASF1255:
	.string	"_POSIX_SEMAPHORES 200809L"
.LASF1159:
	.string	"O_DSYNC __O_DSYNC"
.LASF2571:
	.string	"__NR_accept 43"
.LASF2937:
	.string	"SYS_dup3 __NR_dup3"
.LASF2279:
	.string	"mvwinnstr(win,y,x,s,n) (wmove((win),(y),(x)) == ERR ? ERR : winnstr((win),(s),(n)))"
.LASF2681:
	.string	"__NR_vhangup 153"
.LASF634:
	.string	"__FILE_defined 1"
.LASF3585:
	.string	"residency_state"
.LASF1516:
	.string	"_SC_TRACE_EVENT_FILTER _SC_TRACE_EVENT_FILTER"
.LASF1547:
	.string	"_SC_THREAD_ROBUST_PRIO_PROTECT _SC_THREAD_ROBUST_PRIO_PROTECT"
.LASF2276:
	.string	"mvwinch(win,y,x) (wmove((win),(y),(x)) == ERR ? NCURSES_CAST(chtype, ERR) : winch(win))"
.LASF1367:
	.string	"_SC_SIGQUEUE_MAX _SC_SIGQUEUE_MAX"
.LASF2967:
	.string	"SYS_flistxattr __NR_flistxattr"
.LASF1102:
	.string	"S_TYPEISSEM(buf) __S_TYPEISSEM(buf)"
.LASF1870:
	.string	"__DECL_SIMD_asinhf128x "
.LASF1070:
	.string	"__S_IFREG 0100000"
.LASF884:
	.string	"FD_CLR(fd,fdsetp) __FD_CLR (fd, fdsetp)"
.LASF1929:
	.string	"_Mdouble_ _Float64"
.LASF3144:
	.string	"SYS_renameat2 __NR_renameat2"
.LASF2651:
	.string	"__NR_setfsgid 123"
.LASF2091:
	.string	"ACS_LRCORNER NCURSES_ACS('j')"
.LASF1207:
	.string	"F_OK 0"
.LASF4:
	.string	"__STDC_HOSTED__ 1"
.LASF409:
	.string	"_POSIX_SOURCE"
.LASF1655:
	.string	"__DECL_SIMD_logf32 "
.LASF2105:
	.string	"ACS_BULLET NCURSES_ACS('~')"
.LASF635:
	.string	"__struct_FILE_defined 1"
.LASF374:
	.string	"__USE_ISOCXX11"
.LASF2878:
	.string	"__NR_faccessat2 439"
.LASF1703:
	.string	"__DECL_SIMD_asinl "
.LASF2763:
	.string	"__NR_utimes 235"
.LASF3551:
	.string	"ssize_t"
.LASF3572:
	.string	"printw"
.LASF1536:
	.string	"_SC_V7_ILP32_OFF32 _SC_V7_ILP32_OFF32"
.LASF2837:
	.string	"__NR_getcpu 309"
.LASF1123:
	.string	"ALLPERMS (S_ISUID|S_ISGID|S_ISVTX|S_IRWXU|S_IRWXG|S_IRWXO)"
.LASF281:
	.string	"__FLT64X_IS_IEC_60559__ 2"
.LASF161:
	.string	"__FLT_NORM_MAX__ 3.40282346638528859811704183484516925e+38F"
.LASF3625:
	.string	"voltage_v"
.LASF701:
	.string	"_BITS_STDINT_UINTN_H 1"
.LASF2198:
	.string	"getmaxy(win) (NCURSES_OK_ADDR(win) ? ((win)->_maxy + 1) : ERR)"
.LASF614:
	.string	"__KEY_T_TYPE __S32_TYPE"
.LASF686:
	.string	"__HAVE_FLOAT128_UNLIKE_LDBL (__HAVE_DISTINCT_FLOAT128 && __LDBL_MANT_DIG__ != 113)"
.LASF2998:
	.string	"SYS_getpgrp __NR_getpgrp"
.LASF2898:
	.string	"__NR_lsm_get_self_attr 459"
.LASF1141:
	.string	"O_NDELAY O_NONBLOCK"
.LASF1042:
	.string	"EREMOTEIO 121"
.LASF2986:
	.string	"SYS_get_thread_area __NR_get_thread_area"
.LASF2376:
	.string	"KEY_OPTIONS 0561"
.LASF1258:
	.string	"_POSIX_ASYNC_IO 1"
.LASF2178:
	.string	"getbegyx(win,y,x) (y = getbegy(win), x = getbegx(win))"
.LASF3537:
	.string	"_shortbuf"
.LASF3584:
	.string	"thermal"
.LASF2194:
	.string	"getcury(win) (NCURSES_OK_ADDR(win) ? (win)->_cury : ERR)"
.LASF1057:
	.string	"_SYS_STAT_H 1"
.LASF2858:
	.string	"__NR_pkey_alloc 330"
.LASF376:
	.string	"__USE_POSIX2"
.LASF2026:
	.string	"NCURSES_INTEROP_FUNCS 1"
.LASF2114:
	.string	"ACS_S7 NCURSES_ACS('r')"
.LASF32:
	.string	"__ORDER_LITTLE_ENDIAN__ 1234"
.LASF1441:
	.string	"_SC_WORD_BIT _SC_WORD_BIT"
.LASF3626:
	.string	"voltage"
.LASF2015:
	.string	"NCURSES_COLOR_T short"
.LASF708:
	.string	"INT16_MAX (32767)"
.LASF375:
	.string	"__USE_POSIX"
.LASF180:
	.string	"__DBL_DENORM_MIN__ ((double)4.94065645841246544176568792868221372e-324L)"
.LASF2680:
	.string	"__NR_munlockall 152"
.LASF2820:
	.string	"__NR_dup3 292"
.LASF2225:
	.string	"addstr(str) waddnstr(stdscr,(str),-1)"
.LASF1827:
	.string	"__DECL_SIMD_atanhf128 "
.LASF1885:
	.string	"__DECL_SIMD_tanf32 "
.LASF1645:
	.string	"__DECL_SIMD_sincosf32 "
.LASF3504:
	.string	"PERF_BRANCH_ENTRY_INFO_BITS_MAX 33"
.LASF1175:
	.string	"FD_CLOEXEC 1"
.LASF1884:
	.string	"__DECL_SIMD_tanf16 "
.LASF791:
	.string	"__WALL 0x40000000"
.LASF2456:
	.string	"ALL_MOUSE_EVENTS (REPORT_MOUSE_POSITION - 1)"
.LASF1206:
	.string	"X_OK 1"
.LASF1471:
	.string	"_SC_CLOCK_SELECTION _SC_CLOCK_SELECTION"
.LASF3555:
	.string	"float"
.LASF991:
	.string	"ECOMM 70"
.LASF3292:
	.string	"_IOC_NRMASK ((1 << _IOC_NRBITS)-1)"
.LASF2095:
	.string	"ACS_TTEE NCURSES_ACS('w')"
.LASF2003:
	.string	"NCURSES_EXPORT(type) NCURSES_IMPEXP type NCURSES_API"
.LASF1540:
	.string	"_SC_SS_REPL_MAX _SC_SS_REPL_MAX"
.LASF584:
	.string	"__STD_TYPE typedef"
.LASF1462:
	.string	"_SC_XBS5_LPBIG_OFFBIG _SC_XBS5_LPBIG_OFFBIG"
.LASF3507:
	.string	"unsigned char"
.LASF1416:
	.string	"_SC_THREAD_PROCESS_SHARED _SC_THREAD_PROCESS_SHARED"
.LASF246:
	.string	"__FLT128_HAS_DENORM__ 1"
.LASF2254:
	.string	"insstr(s) winsstr(stdscr,(s))"
.LASF2512:
	.string	"PKG_PL2_STATUS 2048"
.LASF1608:
	.string	"_CS_POSIX_V7_LP64_OFF64_LDFLAGS _CS_POSIX_V7_LP64_OFF64_LDFLAGS"
.LASF891:
	.string	"_BITS_PTHREADTYPES_COMMON_H 1"
.LASF382:
	.string	"__USE_XOPEN2K"
.LASF1751:
	.string	"__DECL_SIMD_expm1 "
.LASF850:
	.string	"__bswap_constant_32(x) ((((x) & 0xff000000u) >> 24) | (((x) & 0x00ff0000u) >> 8) | (((x) & 0x0000ff00u) << 8) | (((x) & 0x000000ffu) << 24))"
.LASF3069:
	.string	"SYS_modify_ldt __NR_modify_ldt"
.LASF331:
	.string	"__amd64__ 1"
.LASF3338:
	.string	"__constant_htonl(x) ((__be32)___constant_swab32((x)))"
.LASF2633:
	.string	"__NR_setuid 105"
.LASF1358:
	.string	"_SC_DELAYTIMER_MAX _SC_DELAYTIMER_MAX"
.LASF3294:
	.string	"_IOC_SIZEMASK ((1 << _IOC_SIZEBITS)-1)"
.LASF1414:
	.string	"_SC_THREAD_PRIO_INHERIT _SC_THREAD_PRIO_INHERIT"
.LASF1424:
	.string	"_SC_XOPEN_XCU_VERSION _SC_XOPEN_XCU_VERSION"
.LASF2343:
	.string	"KEY_EOS 0516"
.LASF1060:
	.string	"st_atime st_atim.tv_sec"
.LASF1940:
	.string	"__MATHDECL"
.LASF370:
	.string	"_FEATURES_H 1"
.LASF931:
	.string	"ECHILD 10"
.LASF429:
	.string	"__GLIBC_USE_DEPRECATED_SCANF 0"
.LASF1260:
	.string	"_POSIX_PRIORITIZED_IO 200809L"
.LASF2695:
	.string	"__NR_swapon 167"
.LASF829:
	.string	"__key_t_defined "
.LASF1830:
	.string	"__DECL_SIMD_atanhf128x "
.LASF124:
	.string	"__UINT_LEAST8_MAX__ 0xff"
.LASF130:
	.string	"__UINT_LEAST64_MAX__ 0xffffffffffffffffUL"
.LASF508:
	.string	"__LDBL_REDIR2_DECL(name) "
.LASF3085:
	.string	"SYS_msgsnd __NR_msgsnd"
.LASF3379:
	.string	"PERF_HW_EVENT_MASK 0xffffffff"
.LASF1:
	.string	"__STDC_VERSION__ 201710L"
.LASF3154:
	.string	"SYS_rt_sigsuspend __NR_rt_sigsuspend"
.LASF451:
	.string	"__BEGIN_DECLS "
.LASF2693:
	.string	"__NR_mount 165"
.LASF16:
	.string	"__PIC__ 2"
.LASF3157:
	.string	"SYS_sched_get_priority_max __NR_sched_get_priority_max"
.LASF1111:
	.string	"S_IREAD S_IRUSR"
.LASF953:
	.string	"EPIPE 32"
.LASF3249:
	.string	"SYS_uselib __NR_uselib"
.LASF2719:
	.string	"__NR_getxattr 191"
.LASF530:
	.string	"__GLIBC_USE_LIB_EXT2 0"
.LASF1726:
	.string	"__DECL_SIMD_exp2f64 "
.LASF1902:
	.string	"__MATHCALL_VEC(function,suffix,args) __SIMD_DECL (__MATH_PRECNAME (function, suffix)) __MATHCALL (function, suffix, args)"
.LASF552:
	.string	"_SIZE_T_ "
.LASF395:
	.string	"__GLIBC_USE_ISOC2X"
.LASF543:
	.string	"__need_size_t "
.LASF521:
	.string	"__stub___compat_bdflush "
.LASF934:
	.string	"EACCES 13"
.LASF2038:
	.string	"_STDARG_H "
.LASF973:
	.string	"EBADE 52"
.LASF63:
	.string	"__UINT_LEAST32_TYPE__ unsigned int"
.LASF542:
	.string	"__GLIBC_USE_IEC_60559_TYPES_EXT 0"
.LASF536:
	.string	"__GLIBC_USE_IEC_60559_EXT 0"
.LASF355:
	.string	"linux 1"
.LASF3273:
	.string	"__struct_group(TAG,NAME,ATTRS,MEMBERS...) union { struct { MEMBERS } ATTRS; struct TAG { MEMBERS } ATTRS NAME; } ATTRS"
.LASF1638:
	.string	"__DECL_SIMD_sinf32x "
.LASF3419:
	.string	"PERF_RECORD_MISC_SWITCH_OUT (1 << 13)"
.LASF603:
	.string	"__FSBLKCNT_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF3361:
	.string	"__be64_to_cpu(x) __swab64((__u64)(__be64)(x))"
.LASF1040:
	.string	"ENAVAIL 119"
.LASF3124:
	.string	"SYS_putpmsg __NR_putpmsg"
.LASF3291:
	.string	"_IOC_DIRBITS 2"
.LASF2253:
	.string	"insnstr(s,n) winsnstr(stdscr,(s),(n))"
.LASF2756:
	.string	"__NR_clock_gettime 228"
.LASF165:
	.string	"__FLT_HAS_DENORM__ 1"
.LASF2625:
	.string	"__NR_getrlimit 97"
.LASF2473:
	.string	"TRACE_CALLS 0x0020"
.LASF271:
	.string	"__FLT64X_MAX_10_EXP__ 4932"
.LASF3181:
	.string	"SYS_set_robust_list __NR_set_robust_list"
.LASF1501:
	.string	"_SC_USER_GROUPS_R _SC_USER_GROUPS_R"
.LASF2485:
	.string	"UTILS "
.LASF984:
	.string	"ENOSR 63"
.LASF1107:
	.string	"S_IRUSR __S_IREAD"
.LASF2969:
	.string	"SYS_fork __NR_fork"
.LASF756:
	.string	"INT32_C(c) c"
.LASF780:
	.string	"_WCHAR_T_DECLARED "
.LASF2523:
	.string	"AMD_POWER_UNIT_MASK 0xF"
.LASF412:
	.string	"_POSIX_C_SOURCE 200809L"
.LASF2428:
	.string	"BUTTON1_PRESSED NCURSES_MOUSE_MASK(1, NCURSES_BUTTON_PRESSED)"
.LASF1096:
	.string	"S_ISBLK(mode) __S_ISTYPE((mode), __S_IFBLK)"
.LASF2234:
	.string	"bkgdset(ch) wbkgdset(stdscr,(ch))"
.LASF486:
	.string	"__returns_nonnull __attribute__ ((__returns_nonnull__))"
.LASF2793:
	.string	"__NR_linkat 265"
.LASF1224:
	.string	"_XOPEN_XPG3 1"
.LASF2660:
	.string	"__NR_utime 132"
.LASF2140:
	.string	"_NOCHANGE -1"
.LASF3503:
	.string	"PERF_MEM_S(a,s) (((__u64)PERF_MEM_ ##a ##_ ##s) << PERF_MEM_ ##a ##_SHIFT)"
.LASF1485:
	.string	"_SC_SINGLE_PROCESS _SC_SINGLE_PROCESS"
.LASF178:
	.string	"__DBL_MIN__ ((double)2.22507385850720138309023271733240406e-308L)"
.LASF3340:
	.string	"__constant_htons(x) ((__be16)___constant_swab16((x)))"
.LASF1295:
	.string	"_POSIX_V6_LP64_OFF64 1"
.LASF3001:
	.string	"SYS_getppid __NR_getppid"
.LASF1909:
	.string	"__MATHDECL_1(type,function,suffix,args) __MATHDECL_1_IMPL(type, function, suffix, args)"
.LASF324:
	.string	"__PRAGMA_REDEFINE_EXTNAME 1"
.LASF2889:
	.string	"__NR_set_mempolicy_home_node 450"
.LASF2590:
	.string	"__NR_kill 62"
.LASF1300:
	.string	"__ILP32_OFFBIG_LDFLAGS \"-m32\""
.LASF1484:
	.string	"_SC_MULTI_PROCESS _SC_MULTI_PROCESS"
.LASF1759:
	.string	"__DECL_SIMD_expm1f64x "
.LASF2238:
	.string	"clrtoeol() wclrtoeol(stdscr)"
.LASF3209:
	.string	"SYS_sigaltstack __NR_sigaltstack"
.LASF1398:
	.string	"_SC_PII_OSI_CLTS _SC_PII_OSI_CLTS"
.LASF612:
	.string	"__SUSECONDS64_T_TYPE __SQUAD_TYPE"
.LASF1389:
	.string	"_SC_PII_INTERNET _SC_PII_INTERNET"
.LASF624:
	.string	"__STATFS_MATCHES_STATFS64 1"
.LASF3043:
	.string	"SYS_lgetxattr __NR_lgetxattr"
.LASF2348:
	.string	"KEY_PPAGE 0523"
.LASF1674:
	.string	"__DECL_SIMD_powf16 "
.LASF551:
	.string	"__SIZE_T "
.LASF3477:
	.string	"PERF_MEM_SNOOP_MISS 0x08"
.LASF871:
	.string	"____sigset_t_defined "
.LASF3378:
	.string	"PERF_PMU_TYPE_SHIFT 32"
.LASF3409:
	.string	"PERF_RECORD_MISC_CPUMODE_UNKNOWN (0 << 0)"
.LASF1331:
	.string	"_PC_2_SYMLINKS _PC_2_SYMLINKS"
.LASF958:
	.string	"ENOLCK 37"
.LASF2751:
	.string	"__NR_timer_settime 223"
.LASF3223:
	.string	"SYS_sync_file_range __NR_sync_file_range"
.LASF2431:
	.string	"BUTTON1_TRIPLE_CLICKED NCURSES_MOUSE_MASK(1, NCURSES_TRIPLE_CLICKED)"
.LASF1529:
	.string	"_SC_LEVEL3_CACHE_ASSOC _SC_LEVEL3_CACHE_ASSOC"
.LASF1296:
	.string	"_XBS5_LP64_OFF64 1"
.LASF3514:
	.string	"__off_t"
.LASF2721:
	.string	"__NR_fgetxattr 193"
.LASF523:
	.string	"__stub_fchflags "
.LASF3102:
	.string	"SYS_pidfd_getfd __NR_pidfd_getfd"
.LASF1681:
	.string	"__DECL_SIMD_acos "
.LASF1032:
	.string	"ECONNREFUSED 111"
.LASF3359:
	.string	"__le16_to_cpu(x) ((__u16)(__le16)(x))"
.LASF1259:
	.string	"_LFS_ASYNCHRONOUS_IO 1"
.LASF2666:
	.string	"__NR_fstatfs 138"
.LASF2789:
	.string	"__NR_futimesat 261"
.LASF3247:
	.string	"SYS_unlinkat __NR_unlinkat"
.LASF2083:
	.string	"COLOR_BLUE 4"
.LASF1445:
	.string	"_SC_SCHAR_MAX _SC_SCHAR_MAX"
.LASF3041:
	.string	"SYS_landlock_restrict_self __NR_landlock_restrict_self"
.LASF2043:
	.string	"va_copy(d,s) __builtin_va_copy(d,s)"
.LASF3469:
	.string	"PERF_MEM_LVLNUM_LFB 0x0c"
.LASF3594:
	.string	"core_count"
.LASF3622:
	.string	"total"
.LASF1093:
	.string	"__S_ISTYPE(mode,mask) (((mode) & __S_IFMT) == (mask))"
.LASF3290:
	.string	"_IOC_SIZEBITS 14"
.LASF1699:
	.string	"__DECL_SIMD_atanf64x "
.LASF1457:
	.string	"_SC_NL_SETMAX _SC_NL_SETMAX"
.LASF1420:
	.string	"_SC_AVPHYS_PAGES _SC_AVPHYS_PAGES"
.LASF2876:
	.string	"__NR_openat2 437"
.LASF3392:
	.string	"PERF_ATTR_SIZE_VER5 112"
.LASF3204:
	.string	"SYS_shmat __NR_shmat"
.LASF2408:
	.string	"KEY_SREPLACE 0621"
.LASF609:
	.string	"__TIME_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF28:
	.string	"__SIZEOF_LONG_DOUBLE__ 16"
.LASF203:
	.string	"__FLT32_DIG__ 6"
.LASF1877:
	.string	"__DECL_SIMD_erfcf128 "
.LASF157:
	.string	"__FLT_MAX_EXP__ 128"
.LASF3048:
	.string	"SYS_llistxattr __NR_llistxattr"
.LASF844:
	.string	"LITTLE_ENDIAN __LITTLE_ENDIAN"
.LASF2776:
	.string	"__NR_add_key 248"
.LASF152:
	.string	"__FLT_RADIX__ 2"
.LASF2241:
	.string	"deleteln() winsdelln(stdscr,-1)"
.LASF134:
	.string	"__INT_FAST16_MAX__ 0x7fffffffffffffffL"
.LASF2130:
	.string	"ACS_SSSS ACS_PLUS"
.LASF3186:
	.string	"SYS_setfsuid __NR_setfsuid"
.LASF2924:
	.string	"SYS_clock_nanosleep __NR_clock_nanosleep"
.LASF2211:
	.string	"hline(ch,n) whline(stdscr, ch, (n))"
.LASF2802:
	.string	"__NR_get_robust_list 274"
.LASF3494:
	.string	"PERF_MEM_BLK_NA 0x01"
.LASF3353:
	.string	"__constant_be16_to_cpu(x) ___constant_swab16((__u16)(__be16)(x))"
.LASF2395:
	.string	"KEY_SEXIT 0604"
.LASF490:
	.string	"__always_inline __inline __attribute__ ((__always_inline__))"
.LASF2024:
	.string	"NCURSES_BROKEN_LINKER"
.LASF2932:
	.string	"SYS_creat __NR_creat"
.LASF3327:
	.string	"__arch_swab64 __arch_swab64"
.LASF96:
	.string	"__INTMAX_MAX__ 0x7fffffffffffffffL"
.LASF2042:
	.string	"va_arg(v,l) __builtin_va_arg(v,l)"
.LASF888:
	.string	"__blkcnt_t_defined "
.LASF575:
	.string	"__ULONGWORD_TYPE unsigned long int"
.LASF3278:
	.string	"__kernel_old_uid_t __kernel_old_uid_t"
.LASF3079:
	.string	"SYS_mq_timedsend __NR_mq_timedsend"
.LASF3479:
	.string	"PERF_MEM_SNOOP_SHIFT 19"
.LASF472:
	.string	"__attribute_malloc__ __attribute__ ((__malloc__))"
.LASF14:
	.string	"__ATOMIC_CONSUME 1"
.LASF3146:
	.string	"SYS_restart_syscall __NR_restart_syscall"
.LASF2610:
	.string	"__NR_rename 82"
.LASF3448:
	.string	"PERF_MEM_LVL_LFB 0x10"
.LASF921:
	.string	"_ASM_GENERIC_ERRNO_BASE_H "
.LASF1444:
	.string	"_SC_SSIZE_MAX _SC_SSIZE_MAX"
.LASF1327:
	.string	"_PC_REC_MIN_XFER_SIZE _PC_REC_MIN_XFER_SIZE"
.LASF3030:
	.string	"SYS_ioperm __NR_ioperm"
.LASF1622:
	.string	"__DECL_SIMD_cosf "
.LASF655:
	.string	"_BITS_STDIO_LIM_H 1"
.LASF1756:
	.string	"__DECL_SIMD_expm1f64 "
.LASF2798:
	.string	"__NR_pselect6 270"
.LASF2962:
	.string	"SYS_fchownat __NR_fchownat"
.LASF841:
	.string	"__BYTE_ORDER __LITTLE_ENDIAN"
.LASF1440:
	.string	"_SC_LONG_BIT _SC_LONG_BIT"
.LASF896:
	.string	"__SIZEOF_PTHREAD_RWLOCK_T 56"
.LASF814:
	.string	"RAND_MAX 2147483647"
.LASF1933:
	.string	"_Mdouble_ _Float32x"
.LASF2469:
	.string	"TRACE_UPDATE 0x0004"
.LASF1813:
	.string	"__DECL_SIMD_log1pl "
.LASF2706:
	.string	"__NR_query_module 178"
.LASF1613:
	.string	"_CS_POSIX_V7_LPBIG_OFFBIG_LIBS _CS_POSIX_V7_LPBIG_OFFBIG_LIBS"
.LASF1524:
	.string	"_SC_LEVEL1_DCACHE_LINESIZE _SC_LEVEL1_DCACHE_LINESIZE"
.LASF11:
	.string	"__ATOMIC_ACQUIRE 2"
.LASF3248:
	.string	"SYS_unshare __NR_unshare"
.LASF8:
	.string	"__VERSION__ \"11.4.0\""
.LASF1228:
	.string	"_XOPEN_LEGACY 1"
.LASF3373:
	.string	"__be64_to_cpus(x) __swab64s((x))"
.LASF2513:
	.string	"MAX_TURBO_LIMIT_STATUS 4096"
.LASF1249:
	.string	"_POSIX_THREAD_ATTR_STACKSIZE 200809L"
.LASF188:
	.string	"__LDBL_MIN_10_EXP__ (-4931)"
.LASF525:
	.string	"__stub_revoke "
.LASF1854:
	.string	"__DECL_SIMD_tanhf16 "
.LASF3592:
	.string	"max_turbo_limit"
.LASF1084:
	.string	"UTIME_OMIT ((1l << 30) - 2l)"
.LASF3489:
	.string	"PERF_MEM_TLB_L1 0x08"
.LASF1961:
	.string	"FP_NORMAL 4"
.LASF1195:
	.string	"POSIX_FADV_WILLNEED 3"
.LASF209:
	.string	"__FLT32_MAX__ 3.40282346638528859811704183484516925e+38F32"
.LASF2559:
	.string	"__NR_shmctl 31"
.LASF2654:
	.string	"__NR_capset 126"
.LASF1283:
	.string	"_POSIX2_CHAR_TERM 200809L"
.LASF2828:
	.string	"__NR_fanotify_init 300"
.LASF13:
	.string	"__ATOMIC_ACQ_REL 4"
.LASF3295:
	.string	"_IOC_DIRMASK ((1 << _IOC_DIRBITS)-1)"
.LASF2296:
	.string	"mvinch(y,x) mvwinch(stdscr,(y),(x))"
.LASF1924:
	.string	"__MATH_PRECNAME(name,r) name ##l ##r"
.LASF950:
	.string	"ESPIPE 29"
.LASF2145:
	.string	"GCC_UNUSED "
.LASF1994:
	.string	"NCURSES_VERSION_MINOR 3"
.LASF2344:
	.string	"KEY_EOL 0517"
.LASF1917:
	.string	"__MATH_PRECNAME"
.LASF2582:
	.string	"__NR_setsockopt 54"
.LASF1988:
	.string	"islessgreater(x,y) __builtin_islessgreater(x, y)"
.LASF3134:
	.string	"SYS_readlinkat __NR_readlinkat"
.LASF2063:
	.string	"WA_STANDOUT A_STANDOUT"
.LASF394:
	.string	"__KERNEL_STRICT_NAMES"
.LASF952:
	.string	"EMLINK 31"
.LASF255:
	.string	"__FLT32X_MAX_10_EXP__ 308"
.LASF1749:
	.string	"__DECL_SIMD_coshf64x "
.LASF933:
	.string	"ENOMEM 12"
.LASF2169:
	.string	"A_PROTECT NCURSES_BITS(1U,16)"
.LASF1405:
	.string	"_SC_LOGIN_NAME_MAX _SC_LOGIN_NAME_MAX"
.LASF3206:
	.string	"SYS_shmdt __NR_shmdt"
.LASF2915:
	.string	"SYS_capget __NR_capget"
.LASF494:
	.string	"__fortify_function __extern_always_inline __attribute_artificial__"
.LASF2143:
	.string	"GCC_SCANFLIKE(fmt,var) __attribute__((format(scanf,fmt,var)))"
.LASF67:
	.string	"__INT_FAST32_TYPE__ long int"
.LASF1607:
	.string	"_CS_POSIX_V7_LP64_OFF64_CFLAGS _CS_POSIX_V7_LP64_OFF64_CFLAGS"
.LASF2498:
	.string	"MSR_TEMPERATURE_TARGET 0x1A2"
.LASF2897:
	.string	"__NR_listmount 458"
.LASF2517:
	.string	"AMD_CPUID 0x80000007"
.LASF1542:
	.string	"_SC_TRACE_NAME_MAX _SC_TRACE_NAME_MAX"
.LASF3025:
	.string	"SYS_io_submit __NR_io_submit"
.LASF1741:
	.string	"__DECL_SIMD_cosh "
.LASF171:
	.string	"__DBL_MIN_EXP__ (-1021)"
.LASF10:
	.string	"__ATOMIC_SEQ_CST 5"
.LASF2921:
	.string	"SYS_clock_adjtime __NR_clock_adjtime"
.LASF733:
	.string	"INT_FAST32_MAX (9223372036854775807L)"
.LASF3317:
	.string	"IOC_OUT (_IOC_READ << _IOC_DIRSHIFT)"
.LASF1927:
	.string	"__MATH_PRECNAME(name,r) name ##f32 ##r"
.LASF3283:
	.string	"__aligned_u64 __u64 __attribute__((aligned(8)))"
.LASF2551:
	.string	"__NR_select 23"
.LASF1969:
	.string	"MATH_ERREXCEPT 2"
.LASF428:
	.string	"__GLIBC_USE_DEPRECATED_GETS 0"
.LASF1786:
	.string	"__DECL_SIMD_atan2f64 "
.LASF3541:
	.string	"_wide_data"
.LASF1187:
	.string	"FASYNC O_ASYNC"
.LASF496:
	.string	"__va_arg_pack_len() __builtin_va_arg_pack_len ()"
.LASF776:
	.string	"_WCHAR_T_H "
.LASF989:
	.string	"EADV 68"
.LASF3227:
	.string	"SYS_syslog __NR_syslog"
.LASF1252:
	.string	"_POSIX_THREAD_PRIO_PROTECT 200809L"
.LASF90:
	.string	"__LONG_WIDTH__ 64"
.LASF2166:
	.string	"A_BOLD NCURSES_BITS(1U,13)"
.LASF2181:
	.string	"getsyx(y,x) do { if (newscr) { if (is_leaveok(newscr)) (y) = (x) = -1; else getyx(newscr,(y), (x)); } } while(0)"
.LASF248:
	.string	"__FLT128_HAS_QUIET_NAN__ 1"
.LASF807:
	.string	"WSTOPSIG(status) __WSTOPSIG (status)"
.LASF2069:
	.string	"WA_ALTCHARSET A_ALTCHARSET"
.LASF404:
	.string	"__GLIBC_USE_ISOC2X 0"
.LASF627:
	.string	"_BITS_TIME64_H 1"
.LASF1931:
	.string	"_Mdouble_ _Float128"
.LASF1518:
	.string	"_SC_TRACE_LOG _SC_TRACE_LOG"
.LASF1144:
	.string	"O_ASYNC 020000"
.LASF1348:
	.string	"_SC_MAPPED_FILES _SC_MAPPED_FILES"
.LASF550:
	.string	"_T_SIZE "
.LASF402:
	.string	"_DEFAULT_SOURCE"
.LASF886:
	.string	"FD_ZERO(fdsetp) __FD_ZERO (fdsetp)"
.LASF3167:
	.string	"SYS_sched_setscheduler __NR_sched_setscheduler"
.LASF210:
	.string	"__FLT32_NORM_MAX__ 3.40282346638528859811704183484516925e+38F32"
.LASF2906:
	.string	"SYS_acct __NR_acct"
.LASF3372:
	.string	"__cpu_to_be64s(x) __swab64s((x))"
.LASF2250:
	.string	"insch(c) winsch(stdscr,(c))"
.LASF3399:
	.string	"PERF_EVENT_IOC_RESET _IO ('$', 3)"
.LASF1694:
	.string	"__DECL_SIMD_atanf16 "
.LASF92:
	.string	"__WCHAR_WIDTH__ 32"
.LASF457:
	.string	"__glibc_safe_len_cond(__l,__s,__osz) ((__l) <= (__osz) / (__s))"
.LASF743:
	.string	"INTMAX_MAX (__INT64_C(9223372036854775807))"
.LASF3261:
	.string	"SYS_write __NR_write"
.LASF3609:
	.string	"energy_uj_before"
.LASF1558:
	.string	"_CS_POSIX_V7_WIDTH_RESTRICTED_ENVS _CS_V7_WIDTH_RESTRICTED_ENVS"
.LASF1836:
	.string	"__DECL_SIMD_acoshf64 "
.LASF1086:
	.string	"S_IFDIR __S_IFDIR"
.LASF3565:
	.string	"energy_unit"
.LASF2880:
	.string	"__NR_epoll_pwait2 441"
.LASF809:
	.string	"WIFSIGNALED(status) __WIFSIGNALED (status)"
.LASF2911:
	.string	"SYS_arch_prctl __NR_arch_prctl"
.LASF3355:
	.string	"__le64_to_cpu(x) ((__u64)(__le64)(x))"
.LASF1816:
	.string	"__DECL_SIMD_log1pf64 "
.LASF1152:
	.string	"__O_TMPFILE (020000000 | __O_DIRECTORY)"
.LASF529:
	.string	"__GLIBC_USE_LIB_EXT2"
.LASF3089:
	.string	"SYS_munmap __NR_munmap"
.LASF3402:
	.string	"PERF_EVENT_IOC_SET_FILTER _IOW('$', 6, char *)"
.LASF146:
	.string	"__UINTPTR_MAX__ 0xffffffffffffffffUL"
.LASF1203:
	.string	"__OPEN_NEEDS_MODE(oflag) (((oflag) & O_CREAT) != 0 || ((oflag) & __O_TMPFILE) == __O_TMPFILE)"
.LASF1469:
	.string	"_SC_C_LANG_SUPPORT _SC_C_LANG_SUPPORT"
.LASF332:
	.string	"__x86_64 1"
.LASF2691:
	.string	"__NR_acct 163"
.LASF3568:
	.string	"INTEL"
.LASF2256:
	.string	"move(y,x) wmove(stdscr,(y),(x))"
.LASF2653:
	.string	"__NR_capget 125"
.LASF3330:
	.ascii	"___constant_swab64(x) ((__u64)( (((__u64)(x) & (__u64)0x0000"
	.ascii	"0000000000ffULL) << 56) | (((__u64)(x) & (__u64)0x0000000000"
	.ascii	"00ff00ULL) << 40) | (((__u64)(x) & (__u64)0x0000000000ff0000"
	.ascii	"ULL) << 24) | (((__u64)(x"
	.string	") & (__u64)0x00000000ff000000ULL) << 8) | (((__u64)(x) & (__u64)0x000000ff00000000ULL) >> 8) | (((__u64)(x) & (__u64)0x0000ff0000000000ULL) >> 24) | (((__u64)(x) & (__u64)0x00ff000000000000ULL) >> 40) | (((__u64)(x) & (__u64)0xff00000000000000ULL) >> 56)))"
.LASF1481:
	.string	"_SC_FILE_LOCKING _SC_FILE_LOCKING"
.LASF2562:
	.string	"__NR_pause 34"
.LASF245:
	.string	"__FLT128_DENORM_MIN__ 6.47517511943802511092443895822764655e-4966F128"
.LASF3472:
	.string	"PERF_MEM_LVLNUM_NA 0x0f"
.LASF889:
	.string	"__fsblkcnt_t_defined "
.LASF2390:
	.string	"KEY_SDC 0577"
.LASF1335:
	.string	"_SC_NGROUPS_MAX _SC_NGROUPS_MAX"
.LASF709:
	.string	"INT32_MAX (2147483647)"
.LASF3304:
	.string	"_IOC_TYPECHECK(t) (sizeof(t))"
.LASF3370:
	.string	"__cpu_to_le16s(x) do { (void)(x); } while (0)"
.LASF2700:
	.string	"__NR_iopl 172"
.LASF1675:
	.string	"__DECL_SIMD_powf32 "
.LASF557:
	.string	"_SIZE_T_DECLARED "
.LASF3420:
	.string	"PERF_RECORD_MISC_EXACT_IP (1 << 14)"
.LASF3343:
	.string	"__constant_le64_to_cpu(x) ((__u64)(__le64)(x))"
.LASF3534:
	.string	"_old_offset"
.LASF1566:
	.string	"_CS_LFS64_LINTFLAGS _CS_LFS64_LINTFLAGS"
.LASF1238:
	.string	"_POSIX_MEMORY_PROTECTION 200809L"
.LASF1220:
	.string	"_POSIX2_LOCALEDEF __POSIX2_THIS_VERSION"
.LASF2854:
	.string	"__NR_copy_file_range 326"
.LASF2435:
	.string	"BUTTON2_DOUBLE_CLICKED NCURSES_MOUSE_MASK(2, NCURSES_DOUBLE_CLICKED)"
.LASF2497:
	.string	"IA32_PACKAGE_THERM_STATUS 0x1B1"
.LASF1895:
	.string	"NAN (__builtin_nanf (\"\"))"
.LASF2860:
	.string	"__NR_statx 332"
.LASF751:
	.string	"WCHAR_MAX __WCHAR_MAX"
.LASF663:
	.string	"stdout stdout"
.LASF696:
	.string	"_STDINT_H 1"
.LASF847:
	.string	"BYTE_ORDER __BYTE_ORDER"
.LASF2136:
	.string	"_SCROLLWIN 0x08"
.LASF3236:
	.string	"SYS_timerfd_create __NR_timerfd_create"
.LASF2570:
	.string	"__NR_connect 42"
.LASF2552:
	.string	"__NR_sched_yield 24"
.LASF2964:
	.string	"SYS_fdatasync __NR_fdatasync"
.LASF3176:
	.string	"SYS_sendfile __NR_sendfile"
.LASF1788:
	.string	"__DECL_SIMD_atan2f32x "
.LASF2505:
	.string	"THERMAL_STATUS 2"
.LASF1208:
	.string	"F_ULOCK 0"
.LASF1722:
	.string	"__DECL_SIMD_exp2f "
.LASF3408:
	.string	"PERF_RECORD_MISC_CPUMODE_MASK (7 << 0)"
.LASF1085:
	.string	"S_IFMT __S_IFMT"
.LASF3087:
	.string	"SYS_munlock __NR_munlock"
.LASF761:
	.string	"UINT64_C(c) c ## UL"
.LASF168:
	.string	"__FLT_IS_IEC_60559__ 2"
.LASF2516:
	.string	"CPU_TIGERLAKE 140"
.LASF1359:
	.string	"_SC_MQ_OPEN_MAX _SC_MQ_OPEN_MAX"
.LASF3113:
	.string	"SYS_prctl __NR_prctl"
.LASF1092:
	.string	"S_IFSOCK __S_IFSOCK"
.LASF3159:
	.string	"SYS_sched_getaffinity __NR_sched_getaffinity"
.LASF3091:
	.string	"SYS_nanosleep __NR_nanosleep"
.LASF1410:
	.string	"_SC_THREAD_THREADS_MAX _SC_THREAD_THREADS_MAX"
.LASF3019:
	.string	"SYS_inotify_rm_watch __NR_inotify_rm_watch"
.LASF2646:
	.string	"__NR_getresuid 118"
.LASF1623:
	.string	"__DECL_SIMD_cosl "
.LASF2475:
	.string	"TRACE_IEVENT 0x0080"
.LASF993:
	.string	"EMULTIHOP 72"
.LASF2139:
	.string	"_WRAPPED 0x40"
.LASF3063:
	.string	"SYS_mknod __NR_mknod"
.LASF608:
	.string	"__CLOCK_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF2864:
	.string	"__NR_io_uring_setup 425"
.LASF1134:
	.string	"O_RDWR 02"
.LASF2046:
	.string	"_VA_LIST "
.LASF2574:
	.string	"__NR_sendmsg 46"
.LASF1317:
	.string	"_PC_CHOWN_RESTRICTED _PC_CHOWN_RESTRICTED"
.LASF2767:
	.string	"__NR_get_mempolicy 239"
.LASF169:
	.string	"__DBL_MANT_DIG__ 53"
.LASF143:
	.string	"__UINT_FAST64_MAX__ 0xffffffffffffffffUL"
.LASF2235:
	.string	"chgat(n,a,c,o) wchgat(stdscr,(n),(a),(c),(o))"
.LASF2216:
	.string	"redrawwin(win) wredrawln(win, 0, (NCURSES_OK_ADDR(win) ? (win)->_maxy+1 : -1))"
.LASF3285:
	.string	"__aligned_le64 __le64 __attribute__((aligned(8)))"
.LASF2555:
	.string	"__NR_mincore 27"
.LASF1110:
	.string	"S_IRWXU (__S_IREAD|__S_IWRITE|__S_IEXEC)"
.LASF3039:
	.string	"SYS_landlock_add_rule __NR_landlock_add_rule"
.LASF1890:
	.string	"__DECL_SIMD_tanf128x "
.LASF2453:
	.string	"BUTTON_SHIFT NCURSES_MOUSE_MASK(6, 0002L)"
.LASF3559:
	.string	"power"
.LASF2337:
	.string	"KEY_DL 0510"
.LASF2221:
	.string	"addch(ch) waddch(stdscr,(ch))"
.LASF1768:
	.string	"__DECL_SIMD_sinhf32x "
.LASF3422:
	.string	"PERF_RECORD_MISC_MMAP_BUILD_ID (1 << 14)"
.LASF126:
	.string	"__UINT_LEAST16_MAX__ 0xffff"
.LASF2553:
	.string	"__NR_mremap 25"
.LASF3003:
	.string	"SYS_getrandom __NR_getrandom"
.LASF2518:
	.string	"AMD_MSR_PWR_UNIT 0xC0010299"
.LASF1848:
	.string	"__DECL_SIMD_erff32x "
.LASF2425:
	.string	"NCURSES_TRIPLE_CLICKED 020L"
.LASF1996:
	.string	"NCURSES_VERSION"
.LASF2788:
	.string	"__NR_fchownat 260"
.LASF1451:
	.string	"_SC_ULONG_MAX _SC_ULONG_MAX"
.LASF3366:
	.string	"__cpu_to_le64s(x) do { (void)(x); } while (0)"
.LASF936:
	.string	"ENOTBLK 15"
.LASF3529:
	.string	"_IO_save_end"
.LASF3530:
	.string	"_markers"
.LASF484:
	.string	"__attribute_nonnull__(params) __attribute__ ((__nonnull__ params))"
.LASF2968:
	.string	"SYS_flock __NR_flock"
.LASF3605:
	.string	"package_raw"
.LASF1301:
	.string	"__LP64_OFF64_CFLAGS \"-m64\""
.LASF3475:
	.string	"PERF_MEM_SNOOP_NONE 0x02"
.LASF1777:
	.string	"__DECL_SIMD_cbrtf128 "
.LASF2375:
	.string	"KEY_OPEN 0560"
.LASF1189:
	.string	"FNDELAY O_NDELAY"
.LASF2499:
	.string	"IA32_THERM_STATUS 0x19C"
.LASF1378:
	.string	"_SC_CHARCLASS_NAME_MAX _SC_CHARCLASS_NAME_MAX"
.LASF1776:
	.string	"__DECL_SIMD_cbrtf64 "
.LASF2455:
	.string	"REPORT_MOUSE_POSITION NCURSES_MOUSE_MASK(6, 0010L)"
.LASF2297:
	.string	"mvinchnstr(y,x,s,n) mvwinchnstr(stdscr,(y),(x),(s),(n))"
.LASF961:
	.string	"ELOOP 40"
.LASF1984:
	.string	"isgreater(x,y) __builtin_isgreater(x, y)"
.LASF1473:
	.string	"_SC_THREAD_CPUTIME _SC_THREAD_CPUTIME"
.LASF588:
	.string	"__DEV_T_TYPE __UQUAD_TYPE"
.LASF94:
	.string	"__PTRDIFF_WIDTH__ 64"
.LASF1581:
	.string	"_CS_XBS5_LPBIG_OFFBIG_LIBS _CS_XBS5_LPBIG_OFFBIG_LIBS"
.LASF2057:
	.string	"__bool_true_false_are_defined 1"
.LASF687:
	.string	"__HAVE_FLOATN_NOT_TYPEDEF 1"
.LASF702:
	.string	"__intptr_t_defined "
.LASF1596:
	.string	"_CS_POSIX_V6_LPBIG_OFFBIG_LDFLAGS _CS_POSIX_V6_LPBIG_OFFBIG_LDFLAGS"
.LASF3466:
	.string	"PERF_MEM_LVLNUM_CXL 0x09"
.LASF263:
	.string	"__FLT32X_HAS_INFINITY__ 1"
.LASF480:
	.string	"__attribute_deprecated__ __attribute__ ((__deprecated__))"
.LASF1089:
	.string	"S_IFREG __S_IFREG"
.LASF1014:
	.string	"EPROTONOSUPPORT 93"
.LASF1855:
	.string	"__DECL_SIMD_tanhf32 "
.LASF1098:
	.string	"S_ISFIFO(mode) __S_ISTYPE((mode), __S_IFIFO)"
.LASF212:
	.string	"__FLT32_EPSILON__ 1.19209289550781250000000000000000000e-7F32"
.LASF2709:
	.string	"__NR_getpmsg 181"
.LASF1973:
	.string	"M_LOG10E 0.43429448190325182765"
.LASF465:
	.string	"__flexarr []"
.LASF2636:
	.string	"__NR_getegid 108"
.LASF2299:
	.string	"mvinnstr(y,x,s,n) mvwinnstr(stdscr,(y),(x),(s),(n))"
.LASF51:
	.string	"__INT32_TYPE__ int"
.LASF1204:
	.string	"R_OK 4"
.LASF1721:
	.string	"__DECL_SIMD_exp2 "
.LASF2613:
	.string	"__NR_creat 85"
.LASF2371:
	.string	"KEY_MARK 0554"
.LASF2533:
	.string	"__NR_fstat 5"
.LASF1356:
	.string	"_SC_AIO_MAX _SC_AIO_MAX"
.LASF913:
	.string	"__have_pthread_attr_t 1"
.LASF250:
	.string	"__FLT32X_MANT_DIG__ 53"
.LASF1629:
	.string	"__DECL_SIMD_cosf64x "
.LASF1752:
	.string	"__DECL_SIMD_expm1f "
.LASF1939:
	.string	"__MATHDECL_ALIAS"
.LASF313:
	.string	"__GCC_ATOMIC_CHAR16_T_LOCK_FREE 2"
.LASF1664:
	.string	"__DECL_SIMD_expf16 "
.LASF3060:
	.string	"SYS_mincore __NR_mincore"
.LASF1731:
	.string	"__DECL_SIMD_exp10 "
.LASF3386:
	.string	"PERF_SAMPLE_BRANCH_PLM_ALL (PERF_SAMPLE_BRANCH_USER| PERF_SAMPLE_BRANCH_KERNEL| PERF_SAMPLE_BRANCH_HV)"
.LASF1977:
	.string	"M_PI_2 1.57079632679489661923"
.LASF2826:
	.string	"__NR_perf_event_open 298"
.LASF108:
	.string	"__UINT8_MAX__ 0xff"
.LASF9:
	.string	"__ATOMIC_RELAXED 0"
.LASF2014:
	.string	"NCURSES_COLOR_T"
.LASF2062:
	.string	"WA_NORMAL A_NORMAL"
.LASF3112:
	.string	"SYS_ppoll __NR_ppoll"
.LASF1526:
	.string	"_SC_LEVEL2_CACHE_ASSOC _SC_LEVEL2_CACHE_ASSOC"
.LASF1079:
	.string	"__S_ISVTX 01000"
.LASF593:
	.string	"__MODE_T_TYPE __U32_TYPE"
.LASF3072:
	.string	"SYS_move_mount __NR_move_mount"
.LASF247:
	.string	"__FLT128_HAS_INFINITY__ 1"
.LASF2478:
	.string	"TRACE_CCALLS 0x0400"
.LASF1360:
	.string	"_SC_MQ_PRIO_MAX _SC_MQ_PRIO_MAX"
.LASF895:
	.string	"__SIZEOF_PTHREAD_ATTR_T 56"
.LASF1245:
	.string	"_POSIX_THREADS 200809L"
.LASF1170:
	.string	"__F_SETSIG 10"
.LASF19:
	.string	"__FINITE_MATH_ONLY__ 0"
.LASF2077:
	.string	"WA_VERTICAL A_VERTICAL"
.LASF3465:
	.string	"PERF_MEM_LVLNUM_UNC 0x08"
.LASF1586:
	.string	"_CS_POSIX_V6_ILP32_OFF32_LINTFLAGS _CS_POSIX_V6_ILP32_OFF32_LINTFLAGS"
.LASF646:
	.string	"_IOFBF 0"
.LASF2162:
	.string	"A_UNDERLINE NCURSES_BITS(1U,9)"
.LASF2353:
	.string	"KEY_PRINT 0532"
.LASF632:
	.string	"_____fpos64_t_defined 1"
.LASF773:
	.string	"_BSD_WCHAR_T_ "
.LASF747:
	.string	"SIG_ATOMIC_MIN (-2147483647-1)"
.LASF276:
	.string	"__FLT64X_EPSILON__ 1.08420217248550443400745280086994171e-19F64x"
.LASF2335:
	.string	"KEY_F0 0410"
.LASF224:
	.string	"__FLT64_DECIMAL_DIG__ 17"
.LASF3403:
	.string	"PERF_EVENT_IOC_ID _IOR('$', 7, __u64 *)"
.LASF162:
	.string	"__FLT_MIN__ 1.17549435082228750796873653722224568e-38F"
.LASF1380:
	.string	"_SC_2_C_BIND _SC_2_C_BIND"
.LASF2761:
	.string	"__NR_epoll_ctl 233"
.LASF3201:
	.string	"SYS_settimeofday __NR_settimeofday"
.LASF1787:
	.string	"__DECL_SIMD_atan2f128 "
.LASF2410:
	.string	"KEY_SRSUME 0623"
.LASF1921:
	.string	"__MATH_PRECNAME(name,r) name ##f ##r"
.LASF629:
	.string	"__STD_TYPE"
.LASF2618:
	.string	"__NR_chmod 90"
.LASF2079:
	.string	"COLOR_BLACK 0"
.LASF1590:
	.string	"_CS_POSIX_V6_ILP32_OFFBIG_LINTFLAGS _CS_POSIX_V6_ILP32_OFFBIG_LINTFLAGS"
.LASF3450:
	.string	"PERF_MEM_LVL_L3 0x40"
.LASF1377:
	.string	"_SC_RE_DUP_MAX _SC_RE_DUP_MAX"
.LASF1990:
	.string	"__NCURSES_H "
.LASF3288:
	.string	"_IOC_NRBITS 8"
.LASF1214:
	.string	"__POSIX2_THIS_VERSION 200809L"
.LASF2735:
	.string	"__NR_io_destroy 207"
.LASF2980:
	.string	"SYS_futex __NR_futex"
.LASF3632:
	.string	"GNU C17 11.4.0 -masm=intel -mtune=generic -march=x86-64 -g -g -ggdb3 -gdwarf-2 -O0 -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection"
.LASF2054:
	.string	"bool _Bool"
.LASF65:
	.string	"__INT_FAST8_TYPE__ signed char"
.LASF1695:
	.string	"__DECL_SIMD_atanf32 "
.LASF1553:
	.string	"_CS_GNU_LIBC_VERSION _CS_GNU_LIBC_VERSION"
.LASF2792:
	.string	"__NR_renameat 264"
.LASF1305:
	.string	"STDERR_FILENO 2"
.LASF1066:
	.string	"__S_IFMT 0170000"
.LASF2779:
	.string	"__NR_ioprio_set 251"
.LASF996:
	.string	"EOVERFLOW 75"
.LASF3521:
	.string	"_IO_read_base"
.LASF1606:
	.string	"_CS_POSIX_V7_ILP32_OFFBIG_LINTFLAGS _CS_POSIX_V7_ILP32_OFFBIG_LINTFLAGS"
.LASF1282:
	.string	"_POSIX_RAW_SOCKETS 200809L"
.LASF1974:
	.string	"M_LN2 0.69314718055994530942"
.LASF1374:
	.string	"_SC_EQUIV_CLASS_MAX _SC_EQUIV_CLASS_MAX"
.LASF55:
	.string	"__UINT32_TYPE__ unsigned int"
.LASF3035:
	.string	"SYS_kexec_file_load __NR_kexec_file_load"
.LASF3452:
	.string	"PERF_MEM_LVL_REM_RAM1 0x100"
.LASF102:
	.string	"__SIG_ATOMIC_MIN__ (-__SIG_ATOMIC_MAX__ - 1)"
.LASF1723:
	.string	"__DECL_SIMD_exp2l "
.LASF1780:
	.string	"__DECL_SIMD_cbrtf128x "
.LASF1767:
	.string	"__DECL_SIMD_sinhf128 "
.LASF3105:
	.string	"SYS_pipe __NR_pipe"
.LASF711:
	.string	"UINT8_MAX (255)"
.LASF541:
	.string	"__GLIBC_USE_IEC_60559_TYPES_EXT"
.LASF1847:
	.string	"__DECL_SIMD_erff128 "
.LASF2770:
	.string	"__NR_mq_timedsend 242"
.LASF1052:
	.string	"ENOTRECOVERABLE 131"
.LASF3293:
	.string	"_IOC_TYPEMASK ((1 << _IOC_TYPEBITS)-1)"
.LASF1567:
	.string	"_CS_XBS5_ILP32_OFF32_CFLAGS _CS_XBS5_ILP32_OFF32_CFLAGS"
.LASF774:
	.string	"_WCHAR_T_DEFINED_ "
.LASF1491:
	.string	"_SC_SHELL _SC_SHELL"
.LASF1957:
	.string	"FP_NAN 0"
.LASF2149:
	.string	"NCURSES_EXT_FUNCS"
.LASF2052:
	.string	"FALSE 0"
.LASF1247:
	.string	"_POSIX_THREAD_SAFE_FUNCTIONS 200809L"
.LASF2550:
	.string	"__NR_pipe 22"
.LASF1436:
	.string	"_SC_CHAR_MAX _SC_CHAR_MAX"
.LASF201:
	.string	"__LDBL_IS_IEC_60559__ 2"
.LASF1582:
	.string	"_CS_XBS5_LPBIG_OFFBIG_LINTFLAGS _CS_XBS5_LPBIG_OFFBIG_LINTFLAGS"
.LASF1954:
	.string	"__MATH_TG_F32(FUNC,ARGS) _Float32: FUNC ## f ARGS,"
.LASF2739:
	.string	"__NR_get_thread_area 211"
.LASF2716:
	.string	"__NR_setxattr 188"
.LASF385:
	.string	"__USE_XOPEN2K8XSI"
.LASF2686:
	.string	"__NR_arch_prctl 158"
.LASF2399:
	.string	"KEY_SIC 0610"
.LASF2539:
	.string	"__NR_munmap 11"
.LASF2612:
	.string	"__NR_rmdir 84"
.LASF1369:
	.string	"_SC_BC_BASE_MAX _SC_BC_BASE_MAX"
.LASF2526:
	.string	"__X32_SYSCALL_BIT 0x40000000"
.LASF1413:
	.string	"_SC_THREAD_PRIORITY_SCHEDULING _SC_THREAD_PRIORITY_SCHEDULING"
.LASF288:
	.string	"__DEC32_SUBNORMAL_MIN__ 0.000001E-95DF"
.LASF1241:
	.string	"_POSIX_NO_TRUNC 1"
.LASF1190:
	.string	"__POSIX_FADV_DONTNEED 4"
.LASF2493:
	.string	"POWER_DOMAIN_COUNT 3"
.LASF2509:
	.string	"VR_THERM_DESIGN_CURRENT_STATUS 128"
.LASF504:
	.string	"__LDBL_REDIR1(name,proto,alias) name proto"
.LASF299:
	.string	"__DEC128_MIN__ 1E-6143DL"
.LASF1334:
	.string	"_SC_CLK_TCK _SC_CLK_TCK"
.LASF1480:
	.string	"_SC_FILE_ATTRIBUTES _SC_FILE_ATTRIBUTES"
.LASF3336:
	.string	"__swahw32(x) (__builtin_constant_p((__u32)(x)) ? ___constant_swahw32(x) : __fswahw32(x))"
.LASF1765:
	.string	"__DECL_SIMD_sinhf32 "
.LASF3328:
	.string	"___constant_swab16(x) ((__u16)( (((__u16)(x) & (__u16)0x00ffU) << 8) | (((__u16)(x) & (__u16)0xff00U) >> 8)))"
.LASF2958:
	.string	"SYS_fchdir __NR_fchdir"
.LASF3571:
	.string	"__int128 unsigned"
.LASF2220:
	.string	"PAIR_NUMBER(a) (NCURSES_CAST(int,((NCURSES_CAST(unsigned long,(a)) & A_COLOR) >> NCURSES_ATTR_SHIFT)))"
.LASF87:
	.string	"__SCHAR_WIDTH__ 8"
.LASF2899:
	.string	"__NR_lsm_set_self_attr 460"
.LASF2855:
	.string	"__NR_preadv2 327"
.LASF2330:
	.string	"KEY_UP 0403"
.LASF2008:
	.string	"NCURSES_ENABLE_STDBOOL_H 1"
.LASF3244:
	.string	"SYS_umount2 __NR_umount2"
.LASF3369:
	.string	"__le32_to_cpus(x) do { (void)(x); } while (0)"
.LASF36:
	.string	"__FLOAT_WORD_ORDER__ __ORDER_LITTLE_ENDIAN__"
.LASF2649:
	.string	"__NR_getpgid 121"
.LASF1804:
	.string	"__DECL_SIMD_log2f16 "
.LASF735:
	.string	"UINT_FAST8_MAX (255)"
.LASF1332:
	.string	"_SC_ARG_MAX _SC_ARG_MAX"
.LASF2090:
	.string	"ACS_URCORNER NCURSES_ACS('k')"
.LASF1294:
	.string	"_POSIX_V7_LP64_OFF64 1"
.LASF3311:
	.string	"_IOWR_BAD(type,nr,size) _IOC(_IOC_READ|_IOC_WRITE,(type),(nr),sizeof(size))"
.LASF3510:
	.string	"short int"
.LASF1212:
	.string	"_UNISTD_H 1"
.LASF1941:
	.string	"__MATHCALL"
.LASF745:
	.string	"PTRDIFF_MIN (-9223372036854775807L-1)"
.LASF3182:
	.string	"SYS_set_thread_area __NR_set_thread_area"
.LASF843:
	.string	"__LONG_LONG_PAIR(HI,LO) LO, HI"
.LASF2529:
	.string	"__NR_write 1"
.LASF872:
	.string	"_SIGSET_NWORDS (1024 / (8 * sizeof (unsigned long int)))"
.LASF1792:
	.string	"__DECL_SIMD_log10f "
.LASF1256:
	.string	"_POSIX_REALTIME_SIGNALS 200809L"
.LASF1499:
	.string	"_SC_TYPED_MEMORY_OBJECTS _SC_TYPED_MEMORY_OBJECTS"
.LASF642:
	.string	"_IO_USER_LOCK 0x8000"
.LASF204:
	.string	"__FLT32_MIN_EXP__ (-125)"
.LASF650:
	.string	"EOF (-1)"
.LASF1304:
	.string	"STDOUT_FILENO 1"
.LASF2125:
	.string	"ACS_SSSB ACS_LTEE"
.LASF2229:
	.string	"attr_set(a,c,o) wattr_set(stdscr,(a),(c),(o))"
.LASF546:
	.string	"__SIZE_T__ "
.LASF769:
	.string	"_T_WCHAR_ "
.LASF2133:
	.string	"_SUBWIN 0x01"
.LASF1736:
	.string	"__DECL_SIMD_exp10f64 "
.LASF2775:
	.string	"__NR_waitid 247"
.LASF545:
	.string	"__size_t__ "
.LASF1392:
	.string	"_SC_SELECT _SC_SELECT"
.LASF3604:
	.string	"package_after"
.LASF1163:
	.string	"F_SETFD 2"
.LASF717:
	.string	"INT_LEAST32_MIN (-2147483647-1)"
.LASF145:
	.string	"__INTPTR_WIDTH__ 64"
.LASF1343:
	.string	"_SC_TIMERS _SC_TIMERS"
.LASF1339:
	.string	"_SC_JOB_CONTROL _SC_JOB_CONTROL"
.LASF2893:
	.string	"__NR_futex_wake 454"
.LASF3272:
	.string	"_LINUX_STDDEF_H "
.LASF2460:
	.string	"BUTTON_DOUBLE_CLICK(e,x) ((e) & NCURSES_MOUSE_MASK(x, 010))"
.LASF3421:
	.string	"PERF_RECORD_MISC_SWITCH_OUT_PREEMPT (1 << 14)"
.LASF2291:
	.string	"mvdelch(y,x) mvwdelch(stdscr,(y),(x))"
.LASF1753:
	.string	"__DECL_SIMD_expm1l "
.LASF1267:
	.string	"_POSIX_THREAD_CPUTIME 0"
.LASF3151:
	.string	"SYS_rt_sigprocmask __NR_rt_sigprocmask"
.LASF2727:
	.string	"__NR_fremovexattr 199"
.LASF3314:
	.string	"_IOC_NR(nr) (((nr) >> _IOC_NRSHIFT) & _IOC_NRMASK)"
.LASF2462:
	.string	"BUTTON_RESERVED_EVENT(e,x) ((e) & NCURSES_MOUSE_MASK(x, 040))"
.LASF2811:
	.string	"__NR_timerfd_create 283"
.LASF734:
	.string	"INT_FAST64_MAX (__INT64_C(9223372036854775807))"
.LASF141:
	.string	"__UINT_FAST16_MAX__ 0xffffffffffffffffUL"
.LASF3162:
	.string	"SYS_sched_getscheduler __NR_sched_getscheduler"
.LASF802:
	.string	"__W_STOPCODE(sig) ((sig) << 8 | 0x7f)"
.LASF882:
	.string	"NFDBITS __NFDBITS"
.LASF985:
	.string	"ENONET 64"
.LASF1976:
	.string	"M_PI 3.14159265358979323846"
.LASF960:
	.string	"ENOTEMPTY 39"
.LASF398:
	.string	"__KERNEL_STRICT_NAMES "
.LASF2640:
	.string	"__NR_setsid 112"
.LASF2620:
	.string	"__NR_chown 92"
.LASF1851:
	.string	"__DECL_SIMD_tanh "
.LASF2839:
	.string	"__NR_process_vm_writev 311"
.LASF3488:
	.string	"PERF_MEM_TLB_MISS 0x04"
.LASF3471:
	.string	"PERF_MEM_LVLNUM_PMEM 0x0e"
.LASF3246:
	.string	"SYS_unlink __NR_unlink"
.LASF839:
	.string	"__PDP_ENDIAN 3412"
.LASF1219:
	.string	"_POSIX2_SW_DEV __POSIX2_THIS_VERSION"
.LASF3067:
	.string	"SYS_mlockall __NR_mlockall"
.LASF2865:
	.string	"__NR_io_uring_enter 426"
.LASF2317:
	.string	"is_scrollok(win) (NCURSES_OK_ADDR(win) ? (win)->_scroll : FALSE)"
.LASF1840:
	.string	"__DECL_SIMD_acoshf128x "
.LASF1514:
	.string	"_SC_HOST_NAME_MAX _SC_HOST_NAME_MAX"
.LASF859:
	.string	"be32toh(x) __bswap_32 (x)"
.LASF1557:
	.string	"_CS_V7_WIDTH_RESTRICTED_ENVS _CS_V7_WIDTH_RESTRICTED_ENVS"
.LASF2616:
	.string	"__NR_symlink 88"
.LASF282:
	.string	"__DEC32_MANT_DIG__ 7"
.LASF3190:
	.string	"SYS_setitimer __NR_setitimer"
.LASF1094:
	.string	"S_ISDIR(mode) __S_ISTYPE((mode), __S_IFDIR)"
.LASF2187:
	.string	"resetterm() reset_shell_mode()"
.LASF367:
	.string	"_STDIO_H 1"
.LASF2454:
	.string	"BUTTON_ALT NCURSES_MOUSE_MASK(6, 0004L)"
.LASF3532:
	.string	"_fileno"
.LASF2886:
	.string	"__NR_memfd_secret 447"
.LASF723:
	.string	"UINT_LEAST8_MAX (255)"
.LASF2599:
	.string	"__NR_msgctl 71"
.LASF947:
	.string	"ETXTBSY 26"
.LASF2804:
	.string	"__NR_tee 276"
.LASF1711:
	.string	"__DECL_SIMD_hypot "
.LASF1210:
	.string	"F_TLOCK 2"
.LASF1279:
	.string	"_POSIX_CLOCK_SELECTION 200809L"
.LASF3344:
	.string	"__constant_cpu_to_le32(x) ((__le32)(__u32)(x))"
.LASF694:
	.string	"__CFLOAT32X _Complex _Float32x"
.LASF1662:
	.string	"__DECL_SIMD_expf "
.LASF322:
	.string	"__HAVE_SPECULATION_SAFE_VALUE 1"
.LASF622:
	.string	"__INO_T_MATCHES_INO64_T 1"
.LASF2357:
	.string	"KEY_B2 0536"
.LASF2747:
	.string	"__NR_restart_syscall 219"
.LASF2726:
	.string	"__NR_lremovexattr 198"
.LASF208:
	.string	"__FLT32_DECIMAL_DIG__ 9"
.LASF1192:
	.string	"POSIX_FADV_NORMAL 0"
.LASF2743:
	.string	"__NR_epoll_wait_old 215"
.LASF1388:
	.string	"_SC_PII_SOCKET _SC_PII_SOCKET"
.LASF981:
	.string	"ENOSTR 60"
.LASF3172:
	.string	"SYS_semctl __NR_semctl"
.LASF1634:
	.string	"__DECL_SIMD_sinf16 "
.LASF706:
	.string	"INT64_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF15:
	.string	"__pic__ 2"
.LASF2285:
	.string	"mvaddch(y,x,ch) mvwaddch(stdscr,(y),(x),(ch))"
.LASF366:
	.string	"__STDC_ISO_10646__ 201706L"
.LASF598:
	.string	"__PID_T_TYPE __S32_TYPE"
.LASF177:
	.string	"__DBL_NORM_MAX__ ((double)1.79769313486231570814527423731704357e+308L)"
.LASF2270:
	.string	"mvwchgat(win,y,x,n,a,c,o) (wmove((win),(y),(x)) == ERR ? ERR : wchgat((win),(n),(a),(c),(o)))"
.LASF617:
	.string	"__BLKSIZE_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF233:
	.string	"__FLT64_IS_IEC_60559__ 2"
.LASF227:
	.string	"__FLT64_MIN__ 2.22507385850720138309023271733240406e-308F64"
.LASF573:
	.string	"__U32_TYPE unsigned int"
.LASF805:
	.string	"WEXITSTATUS(status) __WEXITSTATUS (status)"
.LASF3312:
	.string	"_IOC_DIR(nr) (((nr) >> _IOC_DIRSHIFT) & _IOC_DIRMASK)"
.LASF3195:
	.string	"SYS_setresgid __NR_setresgid"
.LASF244:
	.string	"__FLT128_EPSILON__ 1.92592994438723585305597794258492732e-34F128"
.LASF2113:
	.string	"ACS_S3 NCURSES_ACS('p')"
.LASF1616:
	.string	"_CS_V7_ENV _CS_V7_ENV"
.LASF2217:
	.string	"waddstr(win,str) waddnstr(win,str,-1)"
.LASF3178:
	.string	"SYS_sendmsg __NR_sendmsg"
.LASF2730:
	.string	"__NR_futex 202"
.LASF1474:
	.string	"_SC_DEVICE_IO _SC_DEVICE_IO"
.LASF1030:
	.string	"ETOOMANYREFS 109"
.LASF691:
	.string	"__f64x(x) x ##f64x"
.LASF857:
	.string	"htobe32(x) __bswap_32 (x)"
.LASF3464:
	.string	"PERF_MEM_LVLNUM_L4 0x04"
.LASF854:
	.string	"htole16(x) __uint16_identity (x)"
.LASF3077:
	.string	"SYS_mq_open __NR_mq_open"
.LASF1519:
	.string	"_SC_LEVEL1_ICACHE_SIZE _SC_LEVEL1_ICACHE_SIZE"
.LASF946:
	.string	"ENOTTY 25"
.LASF870:
	.string	"__sigset_t_defined 1"
.LASF198:
	.string	"__LDBL_HAS_DENORM__ 1"
.LASF771:
	.string	"__WCHAR_T "
.LASF2791:
	.string	"__NR_unlinkat 263"
.LASF3516:
	.string	"__ssize_t"
.LASF1136:
	.string	"O_EXCL 0200"
.LASF1454:
	.string	"_SC_NL_LANGMAX _SC_NL_LANGMAX"
.LASF2803:
	.string	"__NR_splice 275"
.LASF576:
	.string	"__SQUAD_TYPE long int"
.LASF2634:
	.string	"__NR_setgid 106"
.LASF1156:
	.string	"O_DIRECTORY __O_DIRECTORY"
.LASF815:
	.string	"EXIT_FAILURE 1"
.LASF2033:
	.string	"NCURSES_WCWIDTH_GRAPHICS"
.LASF1162:
	.string	"F_GETFD 1"
.LASF297:
	.string	"__DEC128_MIN_EXP__ (-6142)"
.LASF2841:
	.string	"__NR_finit_module 313"
.LASF1012:
	.string	"EPROTOTYPE 91"
.LASF2005:
	.string	"NCURSES_EXPORT_GENERAL_IMPORT "
.LASF2034:
	.string	"NCURSES_WCWIDTH_GRAPHICS 1"
.LASF277:
	.string	"__FLT64X_DENORM_MIN__ 3.64519953188247460252840593361941982e-4951F64x"
.LASF822:
	.string	"__gid_t_defined "
.LASF3511:
	.string	"long int"
.LASF681:
	.string	"__HAVE_DISTINCT_FLOAT32 0"
.LASF1906:
	.string	"__MATHCALLX(function,suffix,args,attrib) __MATHDECLX (_Mdouble_,function,suffix, args, attrib)"
.LASF2163:
	.string	"A_REVERSE NCURSES_BITS(1U,10)"
.LASF1510:
	.string	"_SC_V6_ILP32_OFF32 _SC_V6_ILP32_OFF32"
.LASF912:
	.string	"__ONCE_FLAG_INIT { 0 }"
.LASF1447:
	.string	"_SC_SHRT_MAX _SC_SHRT_MAX"
.LASF1701:
	.string	"__DECL_SIMD_asin "
.LASF583:
	.string	"__U64_TYPE unsigned long int"
.LASF2284:
	.string	"mvwvline(win,y,x,c,n) (wmove((win),(y),(x)) == ERR ? ERR : wvline((win),(c),(n)))"
.LASF352:
	.string	"__gnu_linux__ 1"
.LASF123:
	.string	"__INT_LEAST64_WIDTH__ 64"
.LASF1202:
	.string	"AT_EACCESS 0x200"
.LASF1235:
	.string	"_POSIX_MAPPED_FILES 200809L"
.LASF3251:
	.string	"SYS_ustat __NR_ustat"
.LASF1829:
	.string	"__DECL_SIMD_atanhf64x "
.LASF2720:
	.string	"__NR_lgetxattr 192"
.LASF1087:
	.string	"S_IFCHR __S_IFCHR"
.LASF295:
	.string	"__DEC64_SUBNORMAL_MIN__ 0.000000000000001E-383DD"
.LASF1165:
	.string	"F_SETFL 4"
.LASF1043:
	.string	"EDQUOT 122"
.LASF213:
	.string	"__FLT32_DENORM_MIN__ 1.40129846432481707092372958328991613e-45F32"
.LASF2600:
	.string	"__NR_fcntl 72"
.LASF758:
	.string	"UINT8_C(c) c"
.LASF862:
	.string	"htole64(x) __uint64_identity (x)"
.LASF3347:
	.string	"__constant_le16_to_cpu(x) ((__u16)(__le16)(x))"
.LASF674:
	.string	"_BITS_FLOATN_COMMON_H "
.LASF3107:
	.string	"SYS_pivot_root __NR_pivot_root"
.LASF2591:
	.string	"__NR_uname 63"
.LASF2604:
	.string	"__NR_truncate 76"
.LASF1986:
	.string	"isless(x,y) __builtin_isless(x, y)"
.LASF1583:
	.string	"_CS_POSIX_V6_ILP32_OFF32_CFLAGS _CS_POSIX_V6_ILP32_OFF32_CFLAGS"
.LASF3061:
	.string	"SYS_mkdir __NR_mkdir"
.LASF1904:
	.string	"__MATHCALL(function,suffix,args) __MATHDECL (_Mdouble_,function,suffix, args)"
.LASF3383:
	.string	"PERF_BR_ARM64_DEBUG_EXIT PERF_BR_NEW_ARCH_3"
.LASF1967:
	.string	"isinf(x) __builtin_isinf_sign (x)"
.LASF1955:
	.string	"__MATH_TG_F64X(FUNC,ARGS) _Float64x: FUNC ## l ARGS,"
.LASF1174:
	.string	"F_DUPFD_CLOEXEC 1030"
.LASF948:
	.string	"EFBIG 27"
.LASF3612:
	.string	"core_power_units"
.LASF396:
	.string	"__GLIBC_USE_DEPRECATED_GETS"
.LASF1832:
	.string	"__DECL_SIMD_acoshf "
.LASF2987:
	.string	"SYS_getcpu __NR_getcpu"
.LASF1507:
	.string	"_SC_SYMLOOP_MAX _SC_SYMLOOP_MAX"
.LASF1350:
	.string	"_SC_MEMLOCK_RANGE _SC_MEMLOCK_RANGE"
.LASF767:
	.string	"__WCHAR_T__ "
.LASF2852:
	.string	"__NR_membarrier 324"
.LASF1874:
	.string	"__DECL_SIMD_erfcf16 "
.LASF1048:
	.string	"EKEYEXPIRED 127"
.LASF2259:
	.string	"setscrreg(t,b) wsetscrreg(stdscr,(t),(b))"
.LASF219:
	.string	"__FLT64_DIG__ 15"
.LASF2952:
	.string	"SYS_faccessat __NR_faccessat"
.LASF1131:
	.string	"O_ACCMODE 0003"
.LASF3081:
	.string	"SYS_mremap __NR_mremap"
.LASF1842:
	.string	"__DECL_SIMD_erff "
.LASF653:
	.string	"SEEK_END 2"
.LASF1938:
	.string	"__MATHDECL_1"
.LASF1366:
	.string	"_SC_SEM_VALUE_MAX _SC_SEM_VALUE_MAX"
.LASF1465:
	.string	"_SC_XOPEN_REALTIME_THREADS _SC_XOPEN_REALTIME_THREADS"
.LASF2850:
	.string	"__NR_execveat 322"
.LASF1476:
	.string	"_SC_DEVICE_SPECIFIC_R _SC_DEVICE_SPECIFIC_R"
.LASF799:
	.string	"__WIFCONTINUED(status) ((status) == __W_CONTINUED)"
.LASF2148:
	.string	"vid_attr(a,pair,opts) vidattr(a)"
.LASF459:
	.string	"__glibc_safe_or_unknown_len(__l,__s,__osz) (__glibc_unsigned_or_positive (__l) && __builtin_constant_p (__glibc_safe_len_cond ((__SIZE_TYPE__) (__l), __s, __osz)) && __glibc_safe_len_cond ((__SIZE_TYPE__) (__l), __s, __osz))"
.LASF535:
	.string	"__GLIBC_USE_IEC_60559_EXT"
.LASF2153:
	.string	"NCURSES_SP_NAME(name) name ##_sp"
.LASF2085:
	.string	"COLOR_CYAN 6"
.LASF2544:
	.string	"__NR_ioctl 16"
.LASF181:
	.string	"__DBL_HAS_DENORM__ 1"
.LASF1489:
	.string	"_SC_REGEXP _SC_REGEXP"
.LASF387:
	.string	"__USE_LARGEFILE64"
.LASF341:
	.string	"__code_model_small__ 1"
.LASF1919:
	.string	"__MATH_DECLARING_FLOATN"
.LASF377:
	.string	"__USE_POSIX199309"
.LASF450:
	.string	"__ptr_t void *"
.LASF1887:
	.string	"__DECL_SIMD_tanf128 "
.LASF253:
	.string	"__FLT32X_MIN_10_EXP__ (-307)"
.LASF1330:
	.string	"_PC_SYMLINK_MAX _PC_SYMLINK_MAX"
.LASF2294:
	.string	"mvgetstr(y,x,str) mvwgetstr(stdscr,(y),(x),(str))"
.LASF3522:
	.string	"_IO_write_base"
.LASF2329:
	.string	"KEY_DOWN 0402"
.LASF2247:
	.string	"inchnstr(s,n) winchnstr(stdscr,(s),(n))"
.LASF2495:
	.string	"MSR_RAPL_POWER_UNIT 0x606"
.LASF1477:
	.string	"_SC_FD_MGMT _SC_FD_MGMT"
.LASF3309:
	.string	"_IOR_BAD(type,nr,size) _IOC(_IOC_READ,(type),(nr),sizeof(size))"
.LASF2685:
	.string	"__NR_prctl 157"
.LASF3097:
	.string	"SYS_openat __NR_openat"
.LASF3501:
	.string	"PERF_MEM_HOPS_3 0x04"
.LASF2084:
	.string	"COLOR_MAGENTA 5"
.LASF1805:
	.string	"__DECL_SIMD_log2f32 "
.LASF3436:
	.string	"PERF_FLAG_PID_CGROUP (1UL << 2)"
.LASF2055:
	.string	"true 1"
.LASF2589:
	.string	"__NR_wait4 61"
.LASF1361:
	.string	"_SC_VERSION _SC_VERSION"
.LASF2248:
	.string	"inchstr(s) winchstr(stdscr,(s))"
.LASF2524:
	.string	"_SYSCALL_H 1"
.LASF2288:
	.string	"mvaddnstr(y,x,str,n) mvwaddnstr(stdscr,(y),(x),(str),(n))"
.LASF1783:
	.string	"__DECL_SIMD_atan2l "
.LASF1262:
	.string	"_LFS_LARGEFILE 1"
.LASF3271:
	.string	"_LINUX_POSIX_TYPES_H "
.LASF677:
	.string	"__HAVE_FLOAT64 1"
.LASF1280:
	.string	"_POSIX_ADVISORY_INFO 200809L"
.LASF2074:
	.string	"WA_LOW A_LOW"
.LASF1965:
	.string	"isnormal(x) __builtin_isnormal (x)"
.LASF3351:
	.string	"__constant_be32_to_cpu(x) ___constant_swab32((__u32)(__be32)(x))"
.LASF1960:
	.string	"FP_SUBNORMAL 3"
.LASF300:
	.string	"__DEC128_MAX__ 9.999999999999999999999999999999999E6144DL"
.LASF826:
	.string	"__pid_t_defined "
.LASF1412:
	.string	"_SC_THREAD_ATTR_STACKSIZE _SC_THREAD_ATTR_STACKSIZE"
.LASF858:
	.string	"htole32(x) __uint32_identity (x)"
.LASF1964:
	.string	"isfinite(x) __builtin_isfinite (x)"
.LASF693:
	.string	"__CFLOAT64 _Complex _Float64"
.LASF1508:
	.string	"_SC_STREAMS _SC_STREAMS"
.LASF2725:
	.string	"__NR_removexattr 197"
.LASF3241:
	.string	"SYS_truncate __NR_truncate"
.LASF554:
	.string	"_SIZE_T_DEFINED_ "
.LASF1044:
	.string	"ENOMEDIUM 123"
.LASF1620:
	.string	"_BITS_LIBM_SIMD_DECL_STUBS_H 1"
.LASF2103:
	.string	"ACS_DEGREE NCURSES_ACS('f')"
.LASF1104:
	.string	"S_ISUID __S_ISUID"
.LASF1991:
	.string	"CURSES 1"
.LASF1663:
	.string	"__DECL_SIMD_expl "
.LASF275:
	.string	"__FLT64X_MIN__ 3.36210314311209350626267781732175260e-4932F64x"
.LASF1047:
	.string	"ENOKEY 126"
.LASF107:
	.string	"__INT64_MAX__ 0x7fffffffffffffffL"
.LASF3437:
	.string	"PERF_FLAG_FD_CLOEXEC (1UL << 3)"
.LASF3191:
	.string	"SYS_setns __NR_setns"
.LASF1028:
	.string	"ENOTCONN 107"
.LASF491:
	.string	"__attribute_artificial__ __attribute__ ((__artificial__))"
.LASF325:
	.string	"__SSP_STRONG__ 3"
.LASF2926:
	.string	"SYS_clone __NR_clone"
.LASF1690:
	.string	"__DECL_SIMD_acosf128x "
.LASF659:
	.string	"L_ctermid 9"
.LASF3056:
	.string	"SYS_membarrier __NR_membarrier"
.LASF762:
	.string	"INTMAX_C(c) c ## L"
.LASF3014:
	.string	"SYS_getxattr __NR_getxattr"
.LASF1418:
	.string	"_SC_NPROCESSORS_ONLN _SC_NPROCESSORS_ONLN"
.LASF2447:
	.string	"BUTTON5_RELEASED NCURSES_MOUSE_MASK(5, NCURSES_BUTTON_RELEASED)"
.LASF1636:
	.string	"__DECL_SIMD_sinf64 "
.LASF2381:
	.string	"KEY_REPLACE 0566"
.LASF718:
	.string	"INT_LEAST64_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF937:
	.string	"EBUSY 16"
.LASF2692:
	.string	"__NR_settimeofday 164"
.LASF2923:
	.string	"SYS_clock_gettime __NR_clock_gettime"
.LASF2492:
	.string	"MACHINE_SPECIFIC_REGISTERS "
.LASF883:
	.string	"FD_SET(fd,fdsetp) __FD_SET (fd, fdsetp)"
.LASF434:
	.string	"__GLIBC_PREREQ(maj,min) ((__GLIBC__ << 16) + __GLIBC_MINOR__ >= ((maj) << 16) + (min))"
.LASF753:
	.string	"WINT_MAX (4294967295u)"
.LASF2871:
	.string	"__NR_fsmount 432"
.LASF3027:
	.string	"SYS_io_uring_register __NR_io_uring_register"
.LASF798:
	.string	"__WIFSTOPPED(status) (((status) & 0xff) == 0x7f)"
.LASF425:
	.string	"__USE_MISC 1"
.LASF582:
	.string	"__S64_TYPE long int"
.LASF865:
	.string	"_SYS_SELECT_H 1"
.LASF1587:
	.string	"_CS_POSIX_V6_ILP32_OFFBIG_CFLAGS _CS_POSIX_V6_ILP32_OFFBIG_CFLAGS"
.LASF3435:
	.string	"PERF_FLAG_FD_OUTPUT (1UL << 1)"
.LASF1135:
	.string	"O_CREAT 0100"
.LASF1171:
	.string	"__F_GETSIG 11"
.LASF284:
	.string	"__DEC32_MAX_EXP__ 97"
.LASF2534:
	.string	"__NR_lstat 6"
.LASF401:
	.string	"__GLIBC_USE(F) __GLIBC_USE_ ## F"
.LASF1878:
	.string	"__DECL_SIMD_erfcf32x "
.LASF1672:
	.string	"__DECL_SIMD_powf "
.LASF2930:
	.string	"SYS_connect __NR_connect"
.LASF22:
	.string	"__SIZEOF_INT__ 4"
.LASF1395:
	.string	"_SC_PII_INTERNET_STREAM _SC_PII_INTERNET_STREAM"
.LASF34:
	.string	"__ORDER_PDP_ENDIAN__ 3412"
.LASF159:
	.string	"__FLT_DECIMAL_DIG__ 9"
.LASF2032:
	.string	"NCURSES_TPARM_ARG intptr_t"
.LASF955:
	.string	"ERANGE 34"
.LASF80:
	.string	"__LONG_LONG_MAX__ 0x7fffffffffffffffLL"
.LASF964:
	.string	"EIDRM 43"
.LASF1383:
	.string	"_SC_2_FORT_RUN _SC_2_FORT_RUN"
.LASF421:
	.string	"__WORDSIZE 64"
.LASF1626:
	.string	"__DECL_SIMD_cosf64 "
.LASF982:
	.string	"ENODATA 61"
.LASF1289:
	.string	"_POSIX_TRACE_LOG -1"
.LASF1928:
	.string	"__MATH_DECLARING_FLOATN 1"
.LASF1869:
	.string	"__DECL_SIMD_asinhf64x "
.LASF2542:
	.string	"__NR_rt_sigprocmask 14"
.LASF3215:
	.string	"SYS_stat __NR_stat"
.LASF2522:
	.string	"AMD_ENERGY_UNIT_MASK 0x1F00"
.LASF3111:
	.string	"SYS_poll __NR_poll"
.LASF2437:
	.string	"BUTTON3_RELEASED NCURSES_MOUSE_MASK(3, NCURSES_BUTTON_RELEASED)"
.LASF1773:
	.string	"__DECL_SIMD_cbrtl "
.LASF2331:
	.string	"KEY_LEFT 0404"
.LASF3461:
	.string	"PERF_MEM_LVLNUM_L1 0x01"
.LASF1932:
	.string	"__MATH_PRECNAME(name,r) name ##f128 ##r"
.LASF3443:
	.string	"PERF_MEM_OP_SHIFT 0"
.LASF2632:
	.string	"__NR_getgid 104"
.LASF1879:
	.string	"__DECL_SIMD_erfcf64x "
.LASF1248:
	.string	"_POSIX_THREAD_PRIORITY_SCHEDULING 200809L"
.LASF3138:
	.string	"SYS_recvmmsg __NR_recvmmsg"
.LASF881:
	.string	"FD_SETSIZE __FD_SETSIZE"
.LASF2617:
	.string	"__NR_readlink 89"
.LASF1276:
	.string	"_POSIX_MESSAGE_PASSING 200809L"
.LASF544:
	.string	"__need_NULL "
.LASF2427:
	.string	"BUTTON1_RELEASED NCURSES_MOUSE_MASK(1, NCURSES_BUTTON_RELEASED)"
.LASF971:
	.string	"ENOCSI 50"
.LASF689:
	.string	"__f64(x) x ##f64"
.LASF577:
	.string	"__UQUAD_TYPE unsigned long int"
.LASF621:
	.string	"__OFF_T_MATCHES_OFF64_T 1"
.LASF2271:
	.string	"mvwdelch(win,y,x) (wmove((win),(y),(x)) == ERR ? ERR : wdelch(win))"
.LASF456:
	.string	"__glibc_objsize(__o) __bos (__o)"
.LASF611:
	.string	"__SUSECONDS_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF2594:
	.string	"__NR_semctl 66"
.LASF2086:
	.string	"COLOR_WHITE 7"
.LASF633:
	.string	"____FILE_defined 1"
.LASF2345:
	.string	"KEY_SF 0520"
.LASF1178:
	.string	"F_UNLCK 2"
.LASF3484:
	.string	"PERF_MEM_LOCK_LOCKED 0x02"
.LASF3393:
	.string	"PERF_ATTR_SIZE_VER6 120"
.LASF3265:
	.string	"_ASM_GENERIC_TYPES_H "
.LASF1637:
	.string	"__DECL_SIMD_sinf128 "
.LASF3535:
	.string	"_cur_column"
.LASF1154:
	.string	"F_SETLK 6"
.LASF2868:
	.string	"__NR_move_mount 429"
.LASF1230:
	.string	"_POSIX_JOB_CONTROL 1"
.LASF1143:
	.string	"O_FSYNC O_SYNC"
.LASF2975:
	.string	"SYS_fspick __NR_fspick"
.LASF3183:
	.string	"SYS_set_tid_address __NR_set_tid_address"
.LASF533:
	.string	"__GLIBC_USE_IEC_60559_BFP_EXT_C2X"
.LASF2575:
	.string	"__NR_recvmsg 47"
.LASF943:
	.string	"EINVAL 22"
.LASF3142:
	.string	"SYS_rename __NR_rename"
.LASF1833:
	.string	"__DECL_SIMD_acoshl "
.LASF969:
	.string	"ELNRNG 48"
.LASF1291:
	.string	"_POSIX_V7_LPBIG_OFFBIG -1"
.LASF3280:
	.string	"__ASM_GENERIC_POSIX_TYPES_H "
.LASF3147:
	.string	"SYS_rmdir __NR_rmdir"
.LASF3405:
	.string	"PERF_EVENT_IOC_PAUSE_OUTPUT _IOW('$', 9, __u32)"
.LASF3152:
	.string	"SYS_rt_sigqueueinfo __NR_rt_sigqueueinfo"
.LASF3335:
	.string	"__swab64(x) (__u64)(__builtin_constant_p(x) ? ___constant_swab64(x) : __fswab64(x))"
.LASF2070:
	.string	"WA_INVIS A_INVIS"
.LASF2048:
	.string	"__va_list__ "
.LASF2405:
	.string	"KEY_SPREVIOUS 0616"
.LASF445:
	.string	"__NTHNL(fct) __attribute__ ((__nothrow__)) fct"
.LASF2861:
	.string	"__NR_io_pgetevents 333"
.LASF2347:
	.string	"KEY_NPAGE 0522"
.LASF3064:
	.string	"SYS_mknodat __NR_mknodat"
.LASF41:
	.string	"__PTRDIFF_TYPE__ long int"
.LASF966:
	.string	"EL2NSYNC 45"
.LASF468:
	.string	"__REDIRECT_NTH(name,proto,alias) name proto __asm__ (__ASMNAME (#alias)) __THROW"
.LASF218:
	.string	"__FLT64_MANT_DIG__ 53"
.LASF2289:
	.string	"mvaddstr(y,x,str) mvwaddstr(stdscr,(y),(x),(str))"
.LASF1338:
	.string	"_SC_TZNAME_MAX _SC_TZNAME_MAX"
.LASF3623:
	.string	"temperature_digital_readout"
.LASF2397:
	.string	"KEY_SHELP 0606"
.LASF2215:
	.string	"winsstr(w,s) winsnstr(w, s, -1)"
.LASF3057:
	.string	"SYS_memfd_create __NR_memfd_create"
.LASF2766:
	.string	"__NR_set_mempolicy 238"
.LASF3213:
	.string	"SYS_socketpair __NR_socketpair"
.LASF33:
	.string	"__ORDER_BIG_ENDIAN__ 4321"
.LASF29:
	.string	"__SIZEOF_SIZE_T__ 8"
.LASF903:
	.string	"__LOCK_ALIGNMENT "
.LASF251:
	.string	"__FLT32X_DIG__ 15"
.LASF268:
	.string	"__FLT64X_MIN_EXP__ (-16381)"
.LASF286:
	.string	"__DEC32_MAX__ 9.999999E96DF"
.LASF2060:
	.string	"NCURSES_OK_ADDR(p) (0 != NCURSES_CAST(const void *, (p)))"
.LASF1375:
	.string	"_SC_EXPR_NEST_MAX _SC_EXPR_NEST_MAX"
.LASF2468:
	.string	"TRACE_TPUTS 0x0002"
.LASF3052:
	.string	"SYS_lsetxattr __NR_lsetxattr"
.LASF714:
	.string	"UINT64_MAX (__UINT64_C(18446744073709551615))"
.LASF1771:
	.string	"__DECL_SIMD_cbrt "
.LASF1563:
	.string	"_CS_LFS64_CFLAGS _CS_LFS64_CFLAGS"
.LASF3047:
	.string	"SYS_listxattr __NR_listxattr"
.LASF3055:
	.string	"SYS_mbind __NR_mbind"
.LASF2132:
	.string	"OK (0)"
.LASF1959:
	.string	"FP_ZERO 2"
.LASF2561:
	.string	"__NR_dup2 33"
.LASF1875:
	.string	"__DECL_SIMD_erfcf32 "
.LASF3628:
	.string	"offset"
.LASF183:
	.string	"__DBL_HAS_QUIET_NAN__ 1"
.LASF475:
	.string	"__attribute_pure__ __attribute__ ((__pure__))"
.LASF3329:
	.string	"___constant_swab32(x) ((__u32)( (((__u32)(x) & (__u32)0x000000ffUL) << 24) | (((__u32)(x) & (__u32)0x0000ff00UL) << 8) | (((__u32)(x) & (__u32)0x00ff0000UL) >> 8) | (((__u32)(x) & (__u32)0xff000000UL) >> 24)))"
.LASF2782:
	.string	"__NR_inotify_add_watch 254"
.LASF1211:
	.string	"F_TEST 3"
.LASF1604:
	.string	"_CS_POSIX_V7_ILP32_OFFBIG_LDFLAGS _CS_POSIX_V7_ILP32_OFFBIG_LDFLAGS"
.LASF1438:
	.string	"_SC_INT_MAX _SC_INT_MAX"
.LASF2204:
	.string	"wattroff(win,at) wattr_off(win, NCURSES_CAST(attr_t, at), NULL)"
.LASF234:
	.string	"__FLT128_MANT_DIG__ 113"
.LASF2266:
	.string	"mvwaddchnstr(win,y,x,str,n) (wmove((win),(y),(x)) == ERR ? ERR : waddchnstr((win),(str),(n)))"
.LASF3180:
	.string	"SYS_set_mempolicy __NR_set_mempolicy"
.LASF495:
	.string	"__va_arg_pack() __builtin_va_arg_pack ()"
.LASF3211:
	.string	"SYS_signalfd4 __NR_signalfd4"
.LASF223:
	.string	"__FLT64_MAX_10_EXP__ 308"
.LASF1548:
	.string	"_SC_MINSIGSTKSZ _SC_MINSIGSTKSZ"
.LASF2081:
	.string	"COLOR_GREEN 2"
.LASF136:
	.string	"__INT_FAST32_MAX__ 0x7fffffffffffffffL"
.LASF3199:
	.string	"SYS_setsid __NR_setsid"
.LASF607:
	.string	"__ID_T_TYPE __U32_TYPE"
.LASF647:
	.string	"_IOLBF 1"
.LASF2486:
	.string	"CPUMONLIB "
.LASF415:
	.string	"__USE_POSIX199309 1"
.LASF133:
	.string	"__INT_FAST8_WIDTH__ 8"
.LASF1724:
	.string	"__DECL_SIMD_exp2f16 "
.LASF1452:
	.string	"_SC_USHRT_MAX _SC_USHRT_MAX"
.LASF831:
	.string	"__clockid_t_defined 1"
.LASF1046:
	.string	"ECANCELED 125"
.LASF2694:
	.string	"__NR_umount2 166"
.LASF532:
	.string	"__GLIBC_USE_IEC_60559_BFP_EXT 0"
.LASF739:
	.string	"INTPTR_MIN (-9223372036854775807L-1)"
.LASF2261:
	.string	"standout() wstandout(stdscr)"
.LASF3430:
	.string	"PERF_AUX_FLAG_COLLISION 0x08"
.LASF2671:
	.string	"__NR_sched_getparam 143"
.LASF237:
	.string	"__FLT128_MIN_10_EXP__ (-4931)"
.LASF1429:
	.string	"_SC_2_CHAR_TERM _SC_2_CHAR_TERM"
.LASF2896:
	.string	"__NR_statmount 457"
.LASF2641:
	.string	"__NR_setreuid 113"
.LASF2041:
	.string	"va_end(v) __builtin_va_end(v)"
.LASF3153:
	.string	"SYS_rt_sigreturn __NR_rt_sigreturn"
.LASF3627:
	.string	"read_msr"
.LASF3385:
	.string	"PERF_BR_ARM64_DEBUG_DATA PERF_BR_NEW_ARCH_5"
.LASF3515:
	.string	"__off64_t"
.LASF1892:
	.string	"HUGE_VALF (__builtin_huge_valf ())"
.LASF2436:
	.string	"BUTTON2_TRIPLE_CLICKED NCURSES_MOUSE_MASK(2, NCURSES_TRIPLE_CLICKED)"
.LASF3004:
	.string	"SYS_getresgid __NR_getresgid"
.LASF3491:
	.string	"PERF_MEM_TLB_WK 0x20"
.LASF1844:
	.string	"__DECL_SIMD_erff16 "
.LASF660:
	.string	"FOPEN_MAX"
.LASF728:
	.string	"INT_FAST16_MIN (-9223372036854775807L-1)"
.LASF3053:
	.string	"SYS_lstat __NR_lstat"
.LASF2157:
	.string	"A_NORMAL (1U - 1U)"
.LASF2312:
	.string	"is_keypad(win) (NCURSES_OK_ADDR(win) ? (win)->_use_keypad : FALSE)"
.LASF2099:
	.string	"ACS_S1 NCURSES_ACS('o')"
.LASF283:
	.string	"__DEC32_MIN_EXP__ (-94)"
.LASF2484:
	.string	"unctrl"
.LASF3365:
	.string	"__be16_to_cpu(x) __swab16((__u16)(__be16)(x))"
.LASF1168:
	.string	"F_SETOWN __F_SETOWN"
.LASF1535:
	.string	"_SC_RAW_SOCKETS _SC_RAW_SOCKETS"
.LASF3618:
	.string	"temperature"
.LASF1314:
	.string	"_PC_NAME_MAX _PC_NAME_MAX"
.LASF3509:
	.string	"signed char"
.LASF172:
	.string	"__DBL_MIN_10_EXP__ (-307)"
.LASF2036:
	.string	"NCURSES_CH_T cchar_t"
.LASF580:
	.string	"__SLONG32_TYPE int"
.LASF1020:
	.string	"EADDRNOTAVAIL 99"
.LASF833:
	.string	"__timer_t_defined 1"
.LASF918:
	.string	"_ERRNO_H 1"
.LASF3310:
	.string	"_IOW_BAD(type,nr,size) _IOC(_IOC_WRITE,(type),(nr),sizeof(size))"
.LASF1534:
	.string	"_SC_IPV6 _SC_IPV6"
.LASF752:
	.string	"WINT_MIN (0u)"
.LASF3245:
	.string	"SYS_uname __NR_uname"
.LASF1943:
	.string	"__MATHCALL_NARROW_ARGS_2 (_Marg_ __x, _Marg_ __y)"
.LASF2979:
	.string	"SYS_ftruncate __NR_ftruncate"
.LASF2627:
	.string	"__NR_sysinfo 99"
.LASF2444:
	.string	"BUTTON4_CLICKED NCURSES_MOUSE_MASK(4, NCURSES_BUTTON_CLICKED)"
.LASF965:
	.string	"ECHRNG 44"
.LASF3554:
	.string	"long long unsigned int"
.LASF1888:
	.string	"__DECL_SIMD_tanf32x "
.LASF2576:
	.string	"__NR_shutdown 48"
.LASF242:
	.string	"__FLT128_NORM_MAX__ 1.18973149535723176508575932662800702e+4932F128"
.LASF2339:
	.string	"KEY_DC 0512"
.LASF732:
	.string	"INT_FAST16_MAX (9223372036854775807L)"
.LASF1316:
	.string	"_PC_PIPE_BUF _PC_PIPE_BUF"
.LASF3424:
	.string	"PERF_RECORD_KSYMBOL_FLAGS_UNREGISTER (1 << 0)"
.LASF3445:
	.string	"PERF_MEM_LVL_HIT 0x02"
.LASF1071:
	.string	"__S_IFIFO 0010000"
.LASF1820:
	.string	"__DECL_SIMD_log1pf128x "
.LASF2386:
	.string	"KEY_SCANCEL 0573"
.LASF487:
	.string	"__attribute_warn_unused_result__ __attribute__ ((__warn_unused_result__))"
.LASF1218:
	.string	"_POSIX2_C_DEV __POSIX2_THIS_VERSION"
.LASF1936:
	.string	"__MATH_PRECNAME(name,r) name ##f64x ##r"
.LASF1058:
	.string	"_BITS_STAT_H 1"
.LASF2168:
	.string	"A_INVIS NCURSES_BITS(1U,15)"
.LASF3364:
	.string	"__cpu_to_be16(x) ((__be16)__swab16((x)))"
.LASF1399:
	.string	"_SC_PII_OSI_M _SC_PII_OSI_M"
.LASF2809:
	.string	"__NR_epoll_pwait 281"
.LASF441:
	.string	"__LEAF_ATTR __attribute__ ((__leaf__))"
.LASF3633:
	.string	"/home/jscha/dvp/cpumon/src/machine_specific_registers.c"
.LASF356:
	.string	"__unix 1"
.LASF923:
	.string	"ENOENT 2"
.LASF3013:
	.string	"SYS_getuid __NR_getuid"
.LASF1407:
	.string	"_SC_THREAD_DESTRUCTOR_ITERATIONS _SC_THREAD_DESTRUCTOR_ITERATIONS"
.LASF389:
	.string	"__USE_MISC"
.LASF755:
	.string	"INT16_C(c) c"
.LASF3096:
	.string	"SYS_open_tree __NR_open_tree"
.LASF2119:
	.string	"ACS_STERLING NCURSES_ACS('}')"
.LASF1025:
	.string	"ECONNRESET 104"
.LASF3116:
	.string	"SYS_preadv2 __NR_preadv2"
.LASF2422:
	.string	"NCURSES_BUTTON_PRESSED 002L"
.LASF2205:
	.string	"scroll(win) wscrl(win,1)"
.LASF1506:
	.string	"_SC_2_PBS_TRACK _SC_2_PBS_TRACK"
.LASF1213:
	.string	"_POSIX_VERSION 200809L"
.LASF817:
	.string	"MB_CUR_MAX (__ctype_get_mb_cur_max ())"
.LASF1688:
	.string	"__DECL_SIMD_acosf32x "
.LASF1449:
	.string	"_SC_UCHAR_MAX _SC_UCHAR_MAX"
.LASF3446:
	.string	"PERF_MEM_LVL_MISS 0x04"
.LASF3017:
	.string	"SYS_inotify_init __NR_inotify_init"
.LASF2342:
	.string	"KEY_CLEAR 0515"
.LASF393:
	.string	"__USE_FORTIFY_LEVEL"
.LASF1599:
	.string	"_CS_POSIX_V7_ILP32_OFF32_CFLAGS _CS_POSIX_V7_ILP32_OFF32_CFLAGS"
.LASF941:
	.string	"ENOTDIR 20"
.LASF1069:
	.string	"__S_IFBLK 0060000"
.LASF3287:
	.string	"_ASM_GENERIC_IOCTL_H "
.LASF1273:
	.string	"_POSIX_SPAWN 200809L"
.LASF216:
	.string	"__FLT32_HAS_QUIET_NAN__ 1"
.LASF2904:
	.string	"SYS_accept4 __NR_accept4"
.LASF438:
	.string	"__glibc_has_builtin(name) __has_builtin (name)"
.LASF690:
	.string	"__f32x(x) x ##f32x"
.LASF2675:
	.string	"__NR_sched_get_priority_min 147"
.LASF716:
	.string	"INT_LEAST16_MIN (-32767-1)"
.LASF3513:
	.string	"__uint64_t"
.LASF2287:
	.string	"mvaddchstr(y,x,str) mvwaddchstr(stdscr,(y),(x),(str))"
.LASF1930:
	.string	"__MATH_PRECNAME(name,r) name ##f64 ##r"
.LASF18:
	.string	"__PIE__ 2"
.LASF3459:
	.string	"PERF_MEM_REMOTE_REMOTE 0x01"
.LASF2595:
	.string	"__NR_shmdt 67"
.LASF1591:
	.string	"_CS_POSIX_V6_LP64_OFF64_CFLAGS _CS_POSIX_V6_LP64_OFF64_CFLAGS"
.LASF1353:
	.string	"_SC_SEMAPHORES _SC_SEMAPHORES"
.LASF140:
	.string	"__UINT_FAST8_MAX__ 0xff"
.LASF1002:
	.string	"ELIBSCN 81"
.LASF516:
	.string	"__fortified_attr_access(a,o,s) __attr_access ((a, o, s))"
.LASF309:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 1"
.LASF3260:
	.string	"SYS_waitid __NR_waitid"
.LASF1858:
	.string	"__DECL_SIMD_tanhf32x "
.LASF122:
	.string	"__INT64_C(c) c ## L"
.LASF2532:
	.string	"__NR_stat 4"
.LASF2541:
	.string	"__NR_rt_sigaction 13"
.LASF1762:
	.string	"__DECL_SIMD_sinhf "
.LASF515:
	.string	"__attr_access(x) __attribute__ ((__access__ x))"
.LASF1155:
	.string	"F_SETLKW 7"
.LASF303:
	.string	"__REGISTER_PREFIX__ "
.LASF26:
	.string	"__SIZEOF_FLOAT__ 4"
.LASF1614:
	.string	"_CS_POSIX_V7_LPBIG_OFFBIG_LINTFLAGS _CS_POSIX_V7_LPBIG_OFFBIG_LINTFLAGS"
.LASF1796:
	.string	"__DECL_SIMD_log10f64 "
.LASF3414:
	.string	"PERF_RECORD_MISC_GUEST_USER (5 << 0)"
.LASF2867:
	.string	"__NR_open_tree 428"
.LASF2674:
	.string	"__NR_sched_get_priority_max 146"
.LASF1915:
	.string	"__MATH_DECLARING_FLOATN 0"
.LASF3590:
	.string	"pkg_pl1"
.LASF506:
	.string	"__LDBL_REDIR1_NTH(name,proto,alias) name proto __THROW"
.LASF3015:
	.string	"SYS_init_module __NR_init_module"
.LASF1244:
	.string	"_XOPEN_SHM 1"
.LASF2643:
	.string	"__NR_getgroups 115"
.LASF1951:
	.string	"__MATHCALL_NARROW_NORMAL"
.LASF1386:
	.string	"_SC_PII _SC_PII"
.LASF1003:
	.string	"ELIBMAX 82"
.LASF2160:
	.string	"A_COLOR NCURSES_BITS(((1U) << 8) - 1U,0)"
.LASF3149:
	.string	"SYS_rt_sigaction __NR_rt_sigaction"
.LASF1528:
	.string	"_SC_LEVEL3_CACHE_SIZE _SC_LEVEL3_CACHE_SIZE"
.LASF2002:
	.string	"NCURSES_WRAPPED_VAR(type,name) extern NCURSES_IMPEXP type NCURSES_PUBLIC_VAR(name)(void)"
.LASF1433:
	.string	"_SC_XOPEN_XPG3 _SC_XOPEN_XPG3"
.LASF3350:
	.string	"__constant_cpu_to_be32(x) ((__be32)___constant_swab32((x)))"
.LASF1017:
	.string	"EPFNOSUPPORT 96"
.LASF3589:
	.string	"other"
.LASF378:
	.string	"__USE_POSIX199506"
.LASF1779:
	.string	"__DECL_SIMD_cbrtf64x "
.LASF988:
	.string	"ENOLINK 67"
.LASF3173:
	.string	"SYS_semget __NR_semget"
.LASF2830:
	.string	"__NR_prlimit64 302"
.LASF3610:
	.string	"energy_uj_after"
.LASF1908:
	.string	"__MATHDECL_1_IMPL(type,function,suffix,args) extern type __MATH_PRECNAME(function,suffix) args __THROW"
.LASF148:
	.string	"__GCC_IEC_559_COMPLEX 2"
.LASF2025:
	.string	"NCURSES_INTEROP_FUNCS"
.LASF215:
	.string	"__FLT32_HAS_INFINITY__ 1"
.LASF1846:
	.string	"__DECL_SIMD_erff64 "
.LASF1754:
	.string	"__DECL_SIMD_expm1f16 "
.LASF3121:
	.string	"SYS_process_vm_writev __NR_process_vm_writev"
.LASF3407:
	.string	"PERF_EVENT_IOC_MODIFY_ATTRIBUTES _IOW('$', 11, struct perf_event_attr *)"
.LASF2853:
	.string	"__NR_mlock2 325"
.LASF350:
	.string	"__SEG_GS 1"
.LASF3586:
	.string	"running_average_thermal"
.LASF2919:
	.string	"SYS_chown __NR_chown"
.LASF30:
	.string	"__CHAR_BIT__ 8"
.LASF252:
	.string	"__FLT32X_MIN_EXP__ (-1021)"
.LASF2393:
	.string	"KEY_SEND 0602"
.LASF2137:
	.string	"_ISPAD 0x10"
.LASF144:
	.string	"__INTPTR_MAX__ 0x7fffffffffffffffL"
.LASF2223:
	.string	"addchstr(str) waddchstr(stdscr,(str))"
.LASF722:
	.string	"INT_LEAST64_MAX (__INT64_C(9223372036854775807))"
.LASF2953:
	.string	"SYS_faccessat2 __NR_faccessat2"
.LASF625:
	.string	"__KERNEL_OLD_TIMEVAL_MATCHES_TIMEVAL64 1"
.LASF680:
	.string	"__HAVE_DISTINCT_FLOAT16 __HAVE_FLOAT16"
.LASF2409:
	.string	"KEY_SRIGHT 0622"
.LASF2661:
	.string	"__NR_mknod 133"
.LASF1980:
	.string	"M_2_PI 0.63661977236758134308"
.LASF513:
	.string	"__glibc_macro_warning(message) __glibc_macro_warning1 (GCC warning message)"
.LASF464:
	.string	"__errordecl(name,msg) extern void name (void) __attribute__((__error__ (msg)))"
.LASF2812:
	.string	"__NR_eventfd 284"
.LASF2752:
	.string	"__NR_timer_gettime 224"
.LASF1126:
	.string	"_FCNTL_H 1"
.LASF1446:
	.string	"_SC_SCHAR_MIN _SC_SCHAR_MIN"
.LASF2184:
	.string	"getnstr(s,n) wgetnstr(stdscr, s, (n))"
.LASF2300:
	.string	"mvinsch(y,x,c) mvwinsch(stdscr,(y),(x),(c))"
.LASF512:
	.string	"__glibc_macro_warning1(message) _Pragma (#message)"
.LASF2029:
	.string	"NCURSES_TPARM_VARARGS"
.LASF498:
	.string	"__glibc_unlikely(cond) __builtin_expect ((cond), 0)"
.LASF462:
	.ascii	"__glibc_"
	.string	"fortify_n(f,__l,__s,__osz,...) (__glibc_safe_or_unknown_len (__l, __s, __osz) ? __ ## f ## _alias (__VA_ARGS__) : (__glibc_unsafe_len (__l, __s, __osz) ? __ ## f ## _chk_warn (__VA_ARGS__, (__osz) / (__s)) : __ ## f ## _chk (__VA_ARGS__, (__osz) / (__s))))"
.LASF2401:
	.string	"KEY_SMESSAGE 0612"
.LASF2116:
	.string	"ACS_GEQUAL NCURSES_ACS('z')"
.LASF2907:
	.string	"SYS_add_key __NR_add_key"
.LASF24:
	.string	"__SIZEOF_LONG_LONG__ 8"
.LASF3165:
	.string	"SYS_sched_setattr __NR_sched_setattr"
.LASF100:
	.string	"__INTMAX_WIDTH__ 64"
.LASF1177:
	.string	"F_WRLCK 1"
.LASF1997:
	.string	"NCURSES_VERSION \"6.3\""
.LASF311:
	.string	"__GCC_ATOMIC_BOOL_LOCK_FREE 2"
.LASF1588:
	.string	"_CS_POSIX_V6_ILP32_OFFBIG_LDFLAGS _CS_POSIX_V6_ILP32_OFFBIG_LDFLAGS"
.LASF3500:
	.string	"PERF_MEM_HOPS_2 0x03"
.LASF2833:
	.string	"__NR_clock_adjtime 305"
.LASF185:
	.string	"__LDBL_MANT_DIG__ 64"
.LASF2577:
	.string	"__NR_bind 49"
.LASF2631:
	.string	"__NR_syslog 103"
.LASF520:
	.string	"__attribute_returns_twice__ __attribute__ ((__returns_twice__))"
.LASF2489:
	.string	"POWER_LIMIT_COUNT 2"
.LASF2648:
	.string	"__NR_getresgid 120"
.LASF3638:
	.string	"__isoc99_fscanf"
.LASF2314:
	.string	"is_nodelay(win) (NCURSES_OK_ADDR(win) ? ((win)->_delay == 0) : FALSE)"
.LASF2874:
	.string	"__NR_clone3 435"
.LASF507:
	.string	"__LDBL_REDIR_NTH(name,proto) name proto __THROW"
.LASF317:
	.string	"__GCC_ATOMIC_INT_LOCK_FREE 2"
.LASF2510:
	.string	"OTHER_STATUS 256"
.LASF1027:
	.string	"EISCONN 106"
.LASF3301:
	.string	"_IOC_WRITE 1U"
.LASF2954:
	.string	"SYS_fadvise64 __NR_fadvise64"
.LASF2237:
	.string	"clrtobot() wclrtobot(stdscr)"
.LASF347:
	.string	"__SSE2_MATH__ 1"
.LASF3606:
	.string	"get_msr_power_limits_w"
.LASF413:
	.string	"__USE_POSIX 1"
.LASF3381:
	.string	"PERF_BR_ARM64_FIQ PERF_BR_NEW_ARCH_1"
.LASF3289:
	.string	"_IOC_TYPEBITS 8"
.LASF2655:
	.string	"__NR_rt_sigpending 127"
.LASF2418:
	.string	"KEY_MAX 0777"
.LASF959:
	.string	"ENOSYS 38"
.LASF1409:
	.string	"_SC_THREAD_STACK_MIN _SC_THREAD_STACK_MIN"
.LASF359:
	.string	"__ELF__ 1"
.LASF2754:
	.string	"__NR_timer_delete 226"
.LASF236:
	.string	"__FLT128_MIN_EXP__ (-16381)"
.LASF3163:
	.string	"SYS_sched_rr_get_interval __NR_sched_rr_get_interval"
.LASF1725:
	.string	"__DECL_SIMD_exp2f32 "
.LASF1153:
	.string	"F_GETLK 5"
.LASF1784:
	.string	"__DECL_SIMD_atan2f16 "
.LASF52:
	.string	"__INT64_TYPE__ long int"
.LASF2071:
	.string	"WA_PROTECT A_PROTECT"
.LASF1789:
	.string	"__DECL_SIMD_atan2f64x "
.LASF1821:
	.string	"__DECL_SIMD_atanh "
.LASF476:
	.string	"__attribute_const__ __attribute__ ((__const__))"
.LASF3133:
	.string	"SYS_readlink __NR_readlink"
.LASF443:
	.string	"__THROWNL __attribute__ ((__nothrow__))"
.LASF3029:
	.string	"SYS_ioctl __NR_ioctl"
.LASF1097:
	.string	"S_ISREG(mode) __S_ISTYPE((mode), __S_IFREG)"
.LASF3132:
	.string	"SYS_readahead __NR_readahead"
.LASF1948:
	.string	"__MATHCALL_NARROW_ARGS_1"
.LASF1949:
	.string	"__MATHCALL_NARROW_ARGS_2"
.LASF3597:
	.string	"core_energy_units"
.LASF2887:
	.string	"__NR_process_mrelease 448"
.LASF3412:
	.string	"PERF_RECORD_MISC_HYPERVISOR (3 << 0)"
.LASF509:
	.string	"__LDBL_REDIR_DECL(name) "
.LASF1845:
	.string	"__DECL_SIMD_erff32 "
.LASF3082:
	.string	"SYS_msgctl __NR_msgctl"
.LASF974:
	.string	"EBADR 53"
.LASF2989:
	.string	"SYS_getdents __NR_getdents"
.LASF2741:
	.string	"__NR_epoll_create 213"
.LASF2733:
	.string	"__NR_set_thread_area 205"
.LASF827:
	.string	"__id_t_defined "
.LASF1571:
	.string	"_CS_XBS5_ILP32_OFFBIG_CFLAGS _CS_XBS5_ILP32_OFFBIG_CFLAGS"
.LASF1129:
	.string	"F_SETLK64 6"
.LASF2109:
	.string	"ACS_UARROW NCURSES_ACS('-')"
.LASF337:
	.string	"__ATOMIC_HLE_RELEASE 131072"
.LASF1562:
	.string	"_CS_LFS_LINTFLAGS _CS_LFS_LINTFLAGS"
.LASF1004:
	.string	"ELIBEXEC 83"
.LASF2451:
	.string	"BUTTON5_TRIPLE_CLICKED NCURSES_MOUSE_MASK(5, NCURSES_TRIPLE_CLICKED)"
.LASF1850:
	.string	"__DECL_SIMD_erff128x "
.LASF1642:
	.string	"__DECL_SIMD_sincosf "
.LASF444:
	.string	"__NTH(fct) __attribute__ ((__nothrow__ __LEAF)) fct"
.LASF2785:
	.string	"__NR_openat 257"
.LASF2045:
	.string	"_VA_LIST_ "
.LASF2805:
	.string	"__NR_sync_file_range 277"
.LASF3315:
	.string	"_IOC_SIZE(nr) (((nr) >> _IOC_SIZESHIFT) & _IOC_SIZEMASK)"
.LASF2546:
	.string	"__NR_pwrite64 18"
.LASF3624:
	.string	"core"
.LASF1857:
	.string	"__DECL_SIMD_tanhf128 "
.LASF479:
	.string	"__attribute_noinline__ __attribute__ ((__noinline__))"
.LASF1834:
	.string	"__DECL_SIMD_acoshf16 "
.LASF2242:
	.string	"echochar(c) wechochar(stdscr,(c))"
.LASF2440:
	.string	"BUTTON3_DOUBLE_CLICKED NCURSES_MOUSE_MASK(3, NCURSES_DOUBLE_CLICKED)"
.LASF1487:
	.string	"_SC_READER_WRITER_LOCKS _SC_READER_WRITER_LOCKS"
.LASF665:
	.string	"__attr_dealloc_fclose"
.LASF566:
	.string	"__need___va_list "
.LASF983:
	.string	"ETIME 62"
.LASF821:
	.string	"__dev_t_defined "
.LASF1769:
	.string	"__DECL_SIMD_sinhf64x "
.LASF1894:
	.string	"INFINITY (__builtin_inff ())"
.LASF21:
	.string	"__LP64__ 1"
.LASF3324:
	.string	"_LINUX_SWAB_H "
.LASF1272:
	.string	"_POSIX_SPIN_LOCKS 200809L"
.LASF3607:
	.string	"get_intel_msr_power_w"
.LASF1849:
	.string	"__DECL_SIMD_erff64x "
.LASF2098:
	.string	"ACS_PLUS NCURSES_ACS('n')"
.LASF1905:
	.string	"__MATHDECL(type,function,suffix,args) __MATHDECL_1(type, function,suffix, args); __MATHDECL_1(type, __CONCAT(__,function),suffix, args)"
.LASF179:
	.string	"__DBL_EPSILON__ ((double)2.22044604925031308084726333618164062e-16L)"
.LASF2491:
	.string	"POLL_INTERVAL_S 1"
.LASF1194:
	.string	"POSIX_FADV_SEQUENTIAL 2"
.LASF719:
	.string	"INT_LEAST8_MAX (127)"
.LASF1125:
	.string	"S_BLKSIZE 512"
.LASF3577:
	.string	"pread"
.LASF1475:
	.string	"_SC_DEVICE_SPECIFIC _SC_DEVICE_SPECIFIC"
.LASF2471:
	.string	"TRACE_CHARPUT 0x0010"
.LASF885:
	.string	"FD_ISSET(fd,fdsetp) __FD_ISSET (fd, fdsetp)"
.LASF673:
	.string	"__CFLOAT128 _Complex _Float128"
.LASF3560:
	.string	"cores"
.LASF1697:
	.string	"__DECL_SIMD_atanf128 "
.LASF793:
	.string	"__WEXITSTATUS(status) (((status) & 0xff00) >> 8)"
.LASF2567:
	.string	"__NR_getpid 39"
.LASF818:
	.string	"_SYS_TYPES_H 1"
.LASF1871:
	.string	"__DECL_SIMD_erfc "
.LASF763:
	.string	"UINTMAX_C(c) c ## UL"
.LASF2138:
	.string	"_HASMOVED 0x20"
.LASF2268:
	.string	"mvwaddnstr(win,y,x,str,n) (wmove((win),(y),(x)) == ERR ? ERR : waddnstr((win),(str),(n)))"
.LASF2611:
	.string	"__NR_mkdir 83"
.LASF3168:
	.string	"SYS_sched_yield __NR_sched_yield"
.LASF1142:
	.string	"O_SYNC 04010000"
.LASF3389:
	.string	"PERF_ATTR_SIZE_VER2 80"
.LASF832:
	.string	"__time_t_defined 1"
.LASF497:
	.string	"__restrict_arr __restrict"
.LASF2236:
	.string	"clear() wclear(stdscr)"
.LASF2664:
	.string	"__NR_ustat 136"
.LASF2669:
	.string	"__NR_setpriority 141"
.LASF951:
	.string	"EROFS 30"
.LASF2290:
	.string	"mvchgat(y,x,n,a,c,o) mvwchgat(stdscr,(y),(x),(n),(a),(c),(o))"
.LASF3275:
	.string	"__counted_by(m) "
.LASF2665:
	.string	"__NR_statfs 137"
.LASF2093:
	.string	"ACS_RTEE NCURSES_ACS('u')"
.LASF2104:
	.string	"ACS_PLMINUS NCURSES_ACS('g')"
.LASF2384:
	.string	"KEY_SAVE 0571"
.LASF3078:
	.string	"SYS_mq_timedreceive __NR_mq_timedreceive"
.LASF3117:
	.string	"SYS_prlimit64 __NR_prlimit64"
.LASF380:
	.string	"__USE_XOPEN_EXTENDED"
.LASF1712:
	.string	"__DECL_SIMD_hypotf "
.LASF2477:
	.string	"TRACE_ICALLS 0x0200"
.LASF2859:
	.string	"__NR_pkey_free 331"
.LASF1340:
	.string	"_SC_SAVED_IDS _SC_SAVED_IDS"
.LASF2156:
	.string	"NCURSES_BITS(mask,shift) (NCURSES_CAST(chtype,(mask)) << ((shift) + NCURSES_ATTR_SHIFT))"
.LASF760:
	.string	"UINT32_C(c) c ## U"
.LASF2502:
	.string	"PKG_POWER_LIMITATION_STATUS 1024"
.LASF1336:
	.string	"_SC_OPEN_MAX _SC_OPEN_MAX"
.LASF2870:
	.string	"__NR_fsconfig 431"
.LASF3547:
	.string	"FILE"
.LASF3483:
	.string	"PERF_MEM_LOCK_NA 0x01"
.LASF139:
	.string	"__INT_FAST64_WIDTH__ 64"
.LASF1151:
	.string	"__O_DSYNC 010000"
.LASF2438:
	.string	"BUTTON3_PRESSED NCURSES_MOUSE_MASK(3, NCURSES_BUTTON_PRESSED)"
.LASF59:
	.string	"__INT_LEAST32_TYPE__ int"
.LASF1188:
	.string	"FNONBLOCK O_NONBLOCK"
.LASF3028:
	.string	"SYS_io_uring_setup __NR_io_uring_setup"
.LASF2891:
	.string	"__NR_fchmodat2 452"
.LASF1602:
	.string	"_CS_POSIX_V7_ILP32_OFF32_LINTFLAGS _CS_POSIX_V7_ILP32_OFF32_LINTFLAGS"
.LASF954:
	.string	"EDOM 33"
.LASF3497:
	.string	"PERF_MEM_BLK_SHIFT 40"
.LASF2939:
	.string	"SYS_epoll_create1 __NR_epoll_create1"
.LASF2411:
	.string	"KEY_SSAVE 0624"
.LASF3363:
	.string	"__be32_to_cpu(x) __swab32((__u32)(__be32)(x))"
.LASF2249:
	.string	"innstr(s,n) winnstr(stdscr,(s),(n))"
.LASF777:
	.string	"___int_wchar_t_h "
.LASF2122:
	.string	"ACS_BBSS ACS_URCORNER"
.LASF596:
	.string	"__OFF_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF1559:
	.string	"_CS_LFS_CFLAGS _CS_LFS_CFLAGS"
.LASF2995:
	.string	"SYS_getitimer __NR_getitimer"
.LASF2274:
	.string	"mvwgetstr(win,y,x,str) (wmove((win),(y),(x)) == ERR ? ERR : wgetstr((win),(str)))"
.LASF1706:
	.string	"__DECL_SIMD_asinf64 "
.LASF1169:
	.string	"F_GETOWN __F_GETOWN"
.LASF3197:
	.string	"SYS_setreuid __NR_setreuid"
.LASF1226:
	.string	"_XOPEN_UNIX 1"
.LASF2638:
	.string	"__NR_getppid 110"
.LASF765:
	.string	"__need_wchar_t "
.LASF3203:
	.string	"SYS_setxattr __NR_setxattr"
.LASF1287:
	.string	"_POSIX_TRACE_EVENT_FILTER -1"
.LASF3536:
	.string	"_vtable_offset"
.LASF1221:
	.string	"_XOPEN_VERSION 700"
.LASF1693:
	.string	"__DECL_SIMD_atanl "
.LASF1322:
	.string	"_PC_PRIO_IO _PC_PRIO_IO"
.LASF3517:
	.string	"char"
.LASF3148:
	.string	"SYS_rseq __NR_rseq"
.LASF2943:
	.string	"SYS_epoll_pwait2 __NR_epoll_pwait2"
.LASF3367:
	.string	"__le64_to_cpus(x) do { (void)(x); } while (0)"
.LASF2508:
	.string	"VR_THERM_ALERT_STATUS 64"
.LASF1603:
	.string	"_CS_POSIX_V7_ILP32_OFFBIG_CFLAGS _CS_POSIX_V7_ILP32_OFFBIG_CFLAGS"
.LASF2565:
	.string	"__NR_alarm 37"
.LASF636:
	.string	"__getc_unlocked_body(_fp) (__glibc_unlikely ((_fp)->_IO_read_ptr >= (_fp)->_IO_read_end) ? __uflow (_fp) : *(unsigned char *) (_fp)->_IO_read_ptr++)"
.LASF834:
	.string	"__BIT_TYPES_DEFINED__ 1"
.LASF1826:
	.string	"__DECL_SIMD_atanhf64 "
.LASF1910:
	.string	"__MATHDECL_ALIAS(type,function,suffix,args,alias) __MATHDECL_1(type, function, suffix, args)"
.LASF261:
	.string	"__FLT32X_DENORM_MIN__ 4.94065645841246544176568792868221372e-324F32x"
.LASF3345:
	.string	"__constant_le32_to_cpu(x) ((__u32)(__le32)(x))"
.LASF1494:
	.string	"_SC_SPORADIC_SERVER _SC_SPORADIC_SERVER"
.LASF741:
	.string	"UINTPTR_MAX (18446744073709551615UL)"
.LASF768:
	.string	"_WCHAR_T "
.LASF571:
	.string	"__U16_TYPE unsigned short int"
.LASF2391:
	.string	"KEY_SDL 0600"
.LASF1362:
	.string	"_SC_PAGESIZE _SC_PAGESIZE"
.LASF1923:
	.string	"_Mdouble_ long double"
.LASF2593:
	.string	"__NR_semop 65"
.LASF1435:
	.string	"_SC_CHAR_BIT _SC_CHAR_BIT"
.LASF2840:
	.string	"__NR_kcmp 312"
.LASF272:
	.string	"__FLT64X_DECIMAL_DIG__ 21"
.LASF3038:
	.string	"SYS_kill __NR_kill"
.LASF1686:
	.string	"__DECL_SIMD_acosf64 "
.LASF1713:
	.string	"__DECL_SIMD_hypotl "
.LASF3308:
	.string	"_IOWR(type,nr,size) _IOC(_IOC_READ|_IOC_WRITE,(type),(nr),(_IOC_TYPECHECK(size)))"
.LASF2900:
	.string	"__NR_lsm_list_modules 461"
.LASF1055:
	.string	"ENOTSUP EOPNOTSUPP"
.LASF1880:
	.string	"__DECL_SIMD_erfcf128x "
.LASF606:
	.string	"__FSFILCNT64_T_TYPE __UQUAD_TYPE"
.LASF652:
	.string	"SEEK_CUR 1"
.LASF1240:
	.string	"_POSIX_VDISABLE '\\0'"
.LASF1341:
	.string	"_SC_REALTIME_SIGNALS _SC_REALTIME_SIGNALS"
.LASF1137:
	.string	"O_NOCTTY 0400"
.LASF712:
	.string	"UINT16_MAX (65535)"
.LASF1774:
	.string	"__DECL_SIMD_cbrtf16 "
.LASF1963:
	.string	"signbit(x) __builtin_signbit (x)"
.LASF1925:
	.string	"__MATH_DECLARE_LDOUBLE 1"
.LASF786:
	.string	"WSTOPPED 2"
.LASF1650:
	.string	"__DECL_SIMD_sincosf128x "
.LASF68:
	.string	"__INT_FAST64_TYPE__ long int"
.LASF3567:
	.string	"per_core"
.LASF2931:
	.string	"SYS_copy_file_range __NR_copy_file_range"
.LASF383:
	.string	"__USE_XOPEN2KXSI"
.LASF1146:
	.string	"__O_NOFOLLOW 0400000"
.LASF1852:
	.string	"__DECL_SIMD_tanhf "
.LASF3130:
	.string	"SYS_quotactl_fd __NR_quotactl_fd"
.LASF1368:
	.string	"_SC_TIMER_MAX _SC_TIMER_MAX"
.LASF2683:
	.string	"__NR_pivot_root 155"
.LASF3243:
	.string	"SYS_umask __NR_umask"
.LASF437:
	.string	"__glibc_has_attribute(attr) __has_attribute (attr)"
.LASF707:
	.string	"INT8_MAX (127)"
.LASF2762:
	.string	"__NR_tgkill 234"
.LASF195:
	.string	"__LDBL_MIN__ 3.36210314311209350626267781732175260e-4932L"
.LASF3451:
	.string	"PERF_MEM_LVL_LOC_RAM 0x80"
.LASF3404:
	.string	"PERF_EVENT_IOC_SET_BPF _IOW('$', 8, __u32)"
.LASF1176:
	.string	"F_RDLCK 0"
.LASF2824:
	.string	"__NR_pwritev 296"
.LASF547:
	.string	"_SIZE_T "
.LASF319:
	.string	"__GCC_ATOMIC_LLONG_LOCK_FREE 2"
.LASF3127:
	.string	"SYS_pwritev2 __NR_pwritev2"
.LASF3051:
	.string	"SYS_lseek __NR_lseek"
.LASF559:
	.string	"_GCC_SIZE_T "
.LASF3377:
	.string	"__be16_to_cpus(x) __swab16s((x))"
.LASF2684:
	.string	"__NR__sysctl 156"
.LASF2479:
	.string	"TRACE_DATABASE 0x0800"
.LASF2519:
	.string	"AMD_MSR_CORE_ENERGY 0xC001029A"
.LASF2349:
	.string	"KEY_STAB 0524"
.LASF3114:
	.string	"SYS_pread64 __NR_pread64"
.LASF754:
	.string	"INT8_C(c) c"
.LASF1841:
	.string	"__DECL_SIMD_erf "
.LASF111:
	.string	"__UINT64_MAX__ 0xffffffffffffffffUL"
.LASF3496:
	.string	"PERF_MEM_BLK_ADDR 0x04"
.LASF147:
	.string	"__GCC_IEC_559 2"
.LASF3394:
	.string	"PERF_ATTR_SIZE_VER7 128"
.LASF202:
	.string	"__FLT32_MANT_DIG__ 24"
.LASF3046:
	.string	"SYS_listen __NR_listen"
.LASF3034:
	.string	"SYS_kcmp __NR_kcmp"
.LASF2265:
	.string	"mvwaddch(win,y,x,ch) (wmove((win),(y),(x)) == ERR ? ERR : waddch((win),(ch)))"
.LASF1196:
	.string	"POSIX_FADV_DONTNEED __POSIX_FADV_DONTNEED"
.LASF1568:
	.string	"_CS_XBS5_ILP32_OFF32_LDFLAGS _CS_XBS5_ILP32_OFF32_LDFLAGS"
.LASF1643:
	.string	"__DECL_SIMD_sincosl "
.LASF572:
	.string	"__S32_TYPE int"
.LASF3277:
	.string	"_ASM_X86_POSIX_TYPES_64_H "
.LASF184:
	.string	"__DBL_IS_IEC_60559__ 2"
.LASF1172:
	.string	"__F_SETOWN_EX 15"
.LASF2185:
	.string	"setterm(term) setupterm(term, 1, (int *)0)"
.LASF548:
	.string	"_SYS_SIZE_T_H "
.LASF88:
	.string	"__SHRT_WIDTH__ 16"
.LASF2933:
	.string	"SYS_create_module __NR_create_module"
.LASF3454:
	.string	"PERF_MEM_LVL_REM_CCE1 0x400"
.LASF1468:
	.string	"_SC_BASE _SC_BASE"
.LASF344:
	.string	"__SSE2__ 1"
.LASF970:
	.string	"EUNATCH 49"
.LASF620:
	.string	"__CPU_MASK_TYPE __SYSCALL_ULONG_TYPE"
.LASF1100:
	.string	"S_ISSOCK(mode) __S_ISTYPE((mode), __S_IFSOCK)"
.LASF939:
	.string	"EXDEV 18"
.LASF1402:
	.string	"_SC_THREAD_SAFE_FUNCTIONS _SC_THREAD_SAFE_FUNCTIONS"
.LASF75:
	.string	"__GXX_ABI_VERSION 1016"
.LASF836:
	.string	"_BITS_ENDIAN_H 1"
.LASF1321:
	.string	"_PC_ASYNC_IO _PC_ASYNC_IO"
.LASF2838:
	.string	"__NR_process_vm_readv 310"
.LASF1376:
	.string	"_SC_LINE_MAX _SC_LINE_MAX"
.LASF2835:
	.string	"__NR_sendmmsg 307"
.LASF1785:
	.string	"__DECL_SIMD_atan2f32 "
.LASF2448:
	.string	"BUTTON5_PRESSED NCURSES_MOUSE_MASK(5, NCURSES_BUTTON_PRESSED)"
.LASF1215:
	.string	"_POSIX2_VERSION __POSIX2_THIS_VERSION"
.LASF175:
	.string	"__DBL_DECIMAL_DIG__ 17"
.LASF312:
	.string	"__GCC_ATOMIC_CHAR_LOCK_FREE 2"
.LASF45:
	.string	"__UINTMAX_TYPE__ long unsigned int"
.LASF3274:
	.string	"__DECLARE_FLEX_ARRAY(TYPE,NAME) struct { struct { } __empty_ ## NAME; TYPE NAME[]; }"
.LASF3490:
	.string	"PERF_MEM_TLB_L2 0x10"
.LASF2777:
	.string	"__NR_request_key 249"
.LASF2030:
	.string	"NCURSES_TPARM_VARARGS 1"
.LASF3444:
	.string	"PERF_MEM_LVL_NA 0x01"
.LASF1293:
	.string	"_XBS5_LPBIG_OFFBIG -1"
.LASF2601:
	.string	"__NR_flock 73"
.LASF280:
	.string	"__FLT64X_HAS_QUIET_NAN__ 1"
.LASF1184:
	.string	"LOCK_UN 8"
.LASF2359:
	.string	"KEY_C3 0540"
.LASF2883:
	.string	"__NR_landlock_create_ruleset 444"
.LASF2173:
	.string	"A_RIGHT NCURSES_BITS(1U,20)"
.LASF2176:
	.string	"A_ITALIC NCURSES_BITS(1U,23)"
.LASF2971:
	.string	"SYS_fsconfig __NR_fsconfig"
.LASF1370:
	.string	"_SC_BC_DIM_MAX _SC_BC_DIM_MAX"
.LASF2890:
	.string	"__NR_cachestat 451"
.LASF1309:
	.string	"L_INCR SEEK_CUR"
.LASF436:
	.string	"__PMT"
.LASF1800:
	.string	"__DECL_SIMD_log10f128x "
.LASF2183:
	.string	"wgetstr(w,s) wgetnstr(w, s, -1)"
.LASF1373:
	.string	"_SC_COLL_WEIGHTS_MAX _SC_COLL_WEIGHTS_MAX"
.LASF3044:
	.string	"SYS_link __NR_link"
.LASF796:
	.string	"__WIFEXITED(status) (__WTERMSIG(status) == 0)"
.LASF1764:
	.string	"__DECL_SIMD_sinhf16 "
.LASF1552:
	.string	"_CS_POSIX_V6_WIDTH_RESTRICTED_ENVS _CS_V6_WIDTH_RESTRICTED_ENVS"
.LASF2578:
	.string	"__NR_listen 50"
.LASF2985:
	.string	"SYS_get_robust_list __NR_get_robust_list"
.LASF1426:
	.string	"_SC_XOPEN_CRYPT _SC_XOPEN_CRYPT"
.LASF448:
	.string	"__CONCAT(x,y) x ## y"
.LASF1225:
	.string	"_XOPEN_XPG4 1"
.LASF2563:
	.string	"__NR_nanosleep 35"
.LASF1078:
	.string	"__S_ISGID 02000"
.LASF1755:
	.string	"__DECL_SIMD_expm1f32 "
.LASF1250:
	.string	"_POSIX_THREAD_ATTR_STACKADDR 200809L"
.LASF2272:
	.string	"mvwgetch(win,y,x) (wmove((win),(y),(x)) == ERR ? ERR : wgetch(win))"
.LASF2001:
	.string	"NCURSES_IMPEXP NCURSES_EXPORT_GENERAL_IMPORT"
.LASF460:
	.string	"__glibc_unsafe_len(__l,__s,__osz) (__glibc_unsigned_or_positive (__l) && __builtin_constant_p (__glibc_safe_len_cond ((__SIZE_TYPE__) (__l), __s, __osz)) && !__glibc_safe_len_cond ((__SIZE_TYPE__) (__l), __s, __osz))"
.LASF2470:
	.string	"TRACE_MOVE 0x0008"
.LASF2226:
	.string	"attr_get(ap,cp,o) wattr_get(stdscr,(ap),(cp),(o))"
.LASF2186:
	.string	"fixterm() reset_prog_mode()"
.LASF1324:
	.string	"_PC_FILESIZEBITS _PC_FILESIZEBITS"
.LASF549:
	.string	"_T_SIZE_ "
.LASF3580:
	.string	"open"
.LASF3417:
	.string	"PERF_RECORD_MISC_COMM_EXEC (1 << 13)"
.LASF1666:
	.string	"__DECL_SIMD_expf64 "
.LASF2:
	.string	"__STDC_UTF_16__ 1"
.LASF1500:
	.string	"_SC_USER_GROUPS _SC_USER_GROUPS"
.LASF3531:
	.string	"_chain"
.LASF3074:
	.string	"SYS_mprotect __NR_mprotect"
.LASF1621:
	.string	"__DECL_SIMD_cos "
.LASF3115:
	.string	"SYS_preadv __NR_preadv"
.LASF2728:
	.string	"__NR_tkill 200"
.LASF469:
	.string	"__REDIRECT_NTHNL(name,proto,alias) name proto __asm__ (__ASMNAME (#alias)) __THROWNL"
.LASF519:
	.string	"__attr_dealloc_free __attr_dealloc (__builtin_free, 1)"
.LASF1050:
	.string	"EKEYREJECTED 129"
.LASF2583:
	.string	"__NR_getsockopt 55"
.LASF1544:
	.string	"_SC_TRACE_USER_EVENT_MAX _SC_TRACE_USER_EVENT_MAX"
.LASF2764:
	.string	"__NR_vserver 236"
.LASF2413:
	.string	"KEY_SUNDO 0626"
.LASF1866:
	.string	"__DECL_SIMD_asinhf64 "
.LASF1049:
	.string	"EKEYREVOKED 128"
.LASF1088:
	.string	"S_IFBLK __S_IFBLK"
.LASF2365:
	.string	"KEY_COPY 0546"
.LASF2227:
	.string	"attr_off(a,o) wattr_off(stdscr,(a),(o))"
.LASF266:
	.string	"__FLT64X_MANT_DIG__ 64"
.LASF3298:
	.string	"_IOC_SIZESHIFT (_IOC_TYPESHIFT+_IOC_TYPEBITS)"
.LASF631:
	.string	"____mbstate_t_defined 1"
.LASF517:
	.string	"__attr_access_none(argno) __attribute__ ((__access__ (__none__, argno)))"
.LASF1802:
	.string	"__DECL_SIMD_log2f "
.LASF3458:
	.string	"PERF_MEM_LVL_SHIFT 5"
.LASF2901:
	.string	"__GLIBC_LINUX_VERSION_CODE 331776"
.LASF3307:
	.string	"_IOW(type,nr,size) _IOC(_IOC_WRITE,(type),(nr),(_IOC_TYPECHECK(size)))"
.LASF2598:
	.string	"__NR_msgrcv 70"
.LASF1448:
	.string	"_SC_SHRT_MIN _SC_SHRT_MIN"
.LASF699:
	.string	"__WCHAR_MIN __WCHAR_MIN__"
.LASF1417:
	.string	"_SC_NPROCESSORS_CONF _SC_NPROCESSORS_CONF"
.LASF1081:
	.string	"__S_IWRITE 0200"
.LASF3284:
	.string	"__aligned_be64 __be64 __attribute__((aligned(8)))"
.LASF238:
	.string	"__FLT128_MAX_EXP__ 16384"
.LASF1889:
	.string	"__DECL_SIMD_tanf64x "
.LASF2255:
	.string	"instr(s) winstr(stdscr,(s))"
.LASF1801:
	.string	"__DECL_SIMD_log2 "
.LASF1231:
	.string	"_POSIX_SAVED_IDS 1"
.LASF1021:
	.string	"ENETDOWN 100"
.LASF2996:
	.string	"SYS_getpeername __NR_getpeername"
.LASF418:
	.string	"__USE_XOPEN2K8 1"
.LASF2195:
	.string	"getbegx(win) (NCURSES_OK_ADDR(win) ? (win)->_begx : ERR)"
.LASF927:
	.string	"ENXIO 6"
.LASF570:
	.string	"__S16_TYPE short int"
.LASF917:
	.string	"__COMPAR_FN_T "
.LASF1605:
	.string	"_CS_POSIX_V7_ILP32_OFFBIG_LIBS _CS_POSIX_V7_ILP32_OFFBIG_LIBS"
.LASF2774:
	.string	"__NR_kexec_load 246"
.LASF173:
	.string	"__DBL_MAX_EXP__ 1024"
.LASF2094:
	.string	"ACS_BTEE NCURSES_ACS('v')"
.LASF2031:
	.string	"NCURSES_TPARM_ARG"
.LASF2151:
	.string	"NCURSES_SP_FUNCS"
.LASF1843:
	.string	"__DECL_SIMD_erfl "
.LASF2245:
	.string	"getstr(str) wgetstr(stdscr,(str))"
.LASF1365:
	.string	"_SC_SEM_NSEMS_MAX _SC_SEM_NSEMS_MAX"
.LASF3396:
	.string	"PERF_EVENT_IOC_ENABLE _IO ('$', 0)"
.LASF1814:
	.string	"__DECL_SIMD_log1pf16 "
.LASF1216:
	.string	"_POSIX2_C_VERSION __POSIX2_THIS_VERSION"
.LASF2011:
	.string	"NCURSES_CONST const"
.LASF1371:
	.string	"_SC_BC_SCALE_MAX _SC_BC_SCALE_MAX"
.LASF2049:
	.string	"TRUE"
.LASF3068:
	.string	"SYS_mmap __NR_mmap"
.LASF3318:
	.string	"IOC_INOUT ((_IOC_WRITE|_IOC_READ) << _IOC_DIRSHIFT)"
.LASF2597:
	.string	"__NR_msgsnd 69"
.LASF363:
	.string	"__STDC_IEC_60559_BFP__ 201404L"
.LASF2875:
	.string	"__NR_close_range 436"
.LASF403:
	.string	"_DEFAULT_SOURCE 1"
.LASF321:
	.string	"__GCC_ATOMIC_POINTER_LOCK_FREE 2"
.LASF589:
	.string	"__UID_T_TYPE __U32_TYPE"
.LASF3155:
	.string	"SYS_rt_sigtimedwait __NR_rt_sigtimedwait"
.LASF3358:
	.string	"__cpu_to_le16(x) ((__le16)(__u16)(x))"
.LASF2058:
	.string	"NCURSES_BOOL bool"
.LASF2564:
	.string	"__NR_getitimer 36"
.LASF2354:
	.string	"KEY_LL 0533"
.LASF3169:
	.string	"SYS_seccomp __NR_seccomp"
.LASF1411:
	.string	"_SC_THREAD_ATTR_STACKADDR _SC_THREAD_ATTR_STACKADDR"
.LASF2101:
	.string	"ACS_DIAMOND NCURSES_ACS('`')"
.LASF447:
	.string	"__PMT(args) args"
.LASF3225:
	.string	"SYS_sysfs __NR_sysfs"
.LASF433:
	.string	"__GLIBC_MINOR__ 35"
.LASF1013:
	.string	"ENOPROTOOPT 92"
.LASF1053:
	.string	"ERFKILL 132"
.LASF95:
	.string	"__SIZE_WIDTH__ 64"
.LASF2902:
	.string	"SYS__sysctl __NR__sysctl"
.LASF2507:
	.string	"RUNNING_AVERAGE_THERMAL_LIMIT_STATUS 32"
.LASF12:
	.string	"__ATOMIC_RELEASE 3"
.LASF76:
	.string	"__SCHAR_MAX__ 0x7f"
.LASF357:
	.string	"__unix__ 1"
.LASF1838:
	.string	"__DECL_SIMD_acoshf32x "
.LASF2992:
	.string	"SYS_geteuid __NR_geteuid"
.LASF914:
	.string	"_ALLOCA_H 1"
.LASF3083:
	.string	"SYS_msgget __NR_msgget"
.LASF2406:
	.string	"KEY_SPRINT 0617"
.LASF1818:
	.string	"__DECL_SIMD_log1pf32x "
.LASF79:
	.string	"__LONG_MAX__ 0x7fffffffffffffffL"
.LASF1899:
	.string	"FP_ILOGB0 (-2147483647 - 1)"
.LASF3108:
	.string	"SYS_pkey_alloc __NR_pkey_alloc"
.LASF2579:
	.string	"__NR_getsockname 51"
.LASF1678:
	.string	"__DECL_SIMD_powf32x "
.LASF3368:
	.string	"__cpu_to_le32s(x) do { (void)(x); } while (0)"
.LASF265:
	.string	"__FLT32X_IS_IEC_60559__ 2"
.LASF2831:
	.string	"__NR_name_to_handle_at 303"
.LASF1193:
	.string	"POSIX_FADV_RANDOM 1"
.LASF2942:
	.string	"SYS_epoll_pwait __NR_epoll_pwait"
.LASF1391:
	.string	"_SC_POLL _SC_POLL"
.LASF682:
	.string	"__HAVE_DISTINCT_FLOAT64 0"
.LASF3346:
	.string	"__constant_cpu_to_le16(x) ((__le16)(__u16)(x))"
.LASF3032:
	.string	"SYS_ioprio_get __NR_ioprio_get"
.LASF1732:
	.string	"__DECL_SIMD_exp10f "
.LASF151:
	.string	"__DEC_EVAL_METHOD__ 2"
.LASF3542:
	.string	"_freeres_list"
.LASF613:
	.string	"__DADDR_T_TYPE __S32_TYPE"
.LASF1763:
	.string	"__DECL_SIMD_sinhl "
.LASF222:
	.string	"__FLT64_MAX_EXP__ 1024"
.LASF1775:
	.string	"__DECL_SIMD_cbrtf32 "
.LASF191:
	.string	"__DECIMAL_DIG__ 21"
.LASF2881:
	.string	"__NR_mount_setattr 442"
.LASF2993:
	.string	"SYS_getgid __NR_getgid"
.LASF2321:
	.string	"wgetparent(win) (NCURSES_OK_ADDR(win) ? (win)->_parent : 0)"
.LASF2480:
	.string	"TRACE_ATTRS 0x1000"
.LASF1517:
	.string	"_SC_TRACE_INHERIT _SC_TRACE_INHERIT"
.LASF726:
	.string	"UINT_LEAST64_MAX (__UINT64_C(18446744073709551615))"
.LASF2171:
	.string	"A_LEFT NCURSES_BITS(1U,18)"
.LASF787:
	.string	"WEXITED 4"
.LASF3174:
	.string	"SYS_semop __NR_semop"
.LASF294:
	.string	"__DEC64_EPSILON__ 1E-15DD"
.LASF1945:
	.string	"__MATHCALL_NARROW_NORMAL(func,nargs) extern _Mret_ func __MATHCALL_NARROW_ARGS_ ## nargs __THROW"
.LASF483:
	.string	"__attribute_format_strfmon__(a,b) __attribute__ ((__format__ (__strfmon__, a, b)))"
.LASF2608:
	.string	"__NR_chdir 80"
.LASF2808:
	.string	"__NR_utimensat 280"
.LASF3558:
	.string	"_IO_FILE"
.LASF482:
	.string	"__attribute_format_arg__(x) __attribute__ ((__format_arg__ (x)))"
.LASF3217:
	.string	"SYS_statx __NR_statx"
.LASF2021:
	.string	"NCURSES_OPAQUE_PANEL 0"
.LASF5:
	.string	"__GNUC__ 11"
.LASF1114:
	.string	"S_IRGRP (S_IRUSR >> 3)"
.LASF600:
	.string	"__RLIM64_T_TYPE __UQUAD_TYPE"
.LASF427:
	.string	"__USE_FORTIFY_LEVEL 0"
.LASF2319:
	.string	"is_syncok(win) (NCURSES_OK_ADDR(win) ? (win)->_sync : FALSE)"
.LASF1490:
	.string	"_SC_REGEX_VERSION _SC_REGEX_VERSION"
.LASF3049:
	.string	"SYS_lookup_dcookie __NR_lookup_dcookie"
.LASF1632:
	.string	"__DECL_SIMD_sinf "
.LASF1024:
	.string	"ECONNABORTED 103"
.LASF1400:
	.string	"_SC_T_IOV_MAX _SC_T_IOV_MAX"
.LASF2380:
	.string	"KEY_REFRESH 0565"
.LASF905:
	.string	"_BITS_ATOMIC_WIDE_COUNTER_H "
.LASF1791:
	.string	"__DECL_SIMD_log10 "
.LASF105:
	.string	"__INT16_MAX__ 0x7fff"
.LASF3621:
	.string	"temperature_target"
.LASF904:
	.string	"__ONCE_ALIGNMENT "
.LASF1423:
	.string	"_SC_XOPEN_VERSION _SC_XOPEN_VERSION"
.LASF3095:
	.string	"SYS_open_by_handle_at __NR_open_by_handle_at"
.LASF3231:
	.string	"SYS_timer_create __NR_timer_create"
.LASF2076:
	.string	"WA_TOP A_TOP"
.LASF3319:
	.string	"IOCSIZE_MASK (_IOC_SIZEMASK << _IOC_SIZESHIFT)"
.LASF1128:
	.string	"F_GETLK64 5"
.LASF2724:
	.string	"__NR_flistxattr 196"
.LASF1265:
	.string	"_POSIX_SHARED_MEMORY_OBJECTS 200809L"
.LASF3390:
	.string	"PERF_ATTR_SIZE_VER3 96"
.LASF2158:
	.string	"A_ATTRIBUTES NCURSES_BITS(~(1U - 1U),0)"
.LASF3170:
	.string	"SYS_security __NR_security"
.LASF770:
	.string	"_T_WCHAR "
.LASF1746:
	.string	"__DECL_SIMD_coshf64 "
.LASF561:
	.string	"__size_t "
.LASF615:
	.string	"__CLOCKID_T_TYPE __S32_TYPE"
.LASF2619:
	.string	"__NR_fchmod 91"
.LASF949:
	.string	"ENOSPC 28"
.LASF419:
	.string	"_ATFILE_SOURCE"
.LASF1639:
	.string	"__DECL_SIMD_sinf64x "
.LASF2188:
	.string	"saveterm() def_prog_mode()"
.LASF439:
	.string	"__glibc_has_extension(ext) 0"
.LASF975:
	.string	"EXFULL 54"
.LASF679:
	.string	"__HAVE_FLOAT128X 0"
.LASF3401:
	.string	"PERF_EVENT_IOC_SET_OUTPUT _IO ('$', 5)"
.LASF1498:
	.string	"_SC_TIMEOUTS _SC_TIMEOUTS"
.LASF1157:
	.string	"O_NOFOLLOW __O_NOFOLLOW"
.LASF1223:
	.string	"_XOPEN_XPG2 1"
.LASF2228:
	.string	"attr_on(a,o) wattr_on(stdscr,(a),(o))"
.LASF848:
	.string	"_BITS_BYTESWAP_H 1"
.LASF3297:
	.string	"_IOC_TYPESHIFT (_IOC_NRSHIFT+_IOC_NRBITS)"
.LASF3337:
	.string	"__swahb32(x) (__builtin_constant_p((__u32)(x)) ? ___constant_swahb32(x) : __fswahb32(x))"
.LASF2560:
	.string	"__NR_dup 32"
.LASF1439:
	.string	"_SC_INT_MIN _SC_INT_MIN"
.LASF1985:
	.string	"isgreaterequal(x,y) __builtin_isgreaterequal(x, y)"
.LASF127:
	.string	"__UINT16_C(c) c"
.LASF2941:
	.string	"SYS_epoll_ctl_old __NR_epoll_ctl_old"
.LASF2283:
	.string	"mvwinstr(win,y,x,s) (wmove((win),(y),(x)) == ERR ? ERR : winstr((win),(s)))"
.LASF794:
	.string	"__WTERMSIG(status) ((status) & 0x7f)"
.LASF2110:
	.string	"ACS_BOARD NCURSES_ACS('h')"
.LASF2947:
	.string	"SYS_eventfd2 __NR_eventfd2"
.LASF492:
	.string	"__extern_inline extern __inline __attribute__ ((__gnu_inline__))"
.LASF3569:
	.string	"cpu_designer_e"
.LASF3427:
	.string	"PERF_AUX_FLAG_TRUNCATED 0x01"
.LASF314:
	.string	"__GCC_ATOMIC_CHAR32_T_LOCK_FREE 2"
.LASF3492:
	.string	"PERF_MEM_TLB_OS 0x40"
.LASF3264:
	.string	"_LINUX_TYPES_H "
.LASF1761:
	.string	"__DECL_SIMD_sinh "
.LASF262:
	.string	"__FLT32X_HAS_DENORM__ 1"
.LASF1803:
	.string	"__DECL_SIMD_log2l "
.LASF1054:
	.string	"EHWPOISON 133"
.LASF1328:
	.string	"_PC_REC_XFER_ALIGN _PC_REC_XFER_ALIGN"
.LASF1404:
	.string	"_SC_GETPW_R_SIZE_MAX _SC_GETPW_R_SIZE_MAX"
.LASF2873:
	.string	"__NR_pidfd_open 434"
.LASF361:
	.string	"_STDC_PREDEF_H 1"
.LASF649:
	.string	"BUFSIZ 8192"
.LASF408:
	.string	"__USE_POSIX_IMPLICITLY 1"
.LASF1419:
	.string	"_SC_PHYS_PAGES _SC_PHYS_PAGES"
.LASF738:
	.string	"UINT_FAST64_MAX (__UINT64_C(18446744073709551615))"
.LASF3473:
	.string	"PERF_MEM_LVLNUM_SHIFT 33"
.LASF1968:
	.string	"MATH_ERRNO 1"
.LASF919:
	.string	"_BITS_ERRNO_H 1"
.LASF2209:
	.string	"box(win,v,h) wborder(win, v, v, h, h, 0, 0, 0, 0)"
.LASF2917:
	.string	"SYS_chdir __NR_chdir"
.LASF206:
	.string	"__FLT32_MAX_EXP__ 128"
.LASF3478:
	.string	"PERF_MEM_SNOOP_HITM 0x10"
.LASF1550:
	.string	"_CS_PATH _CS_PATH"
.LASF2810:
	.string	"__NR_signalfd 282"
.LASF2827:
	.string	"__NR_recvmmsg 299"
.LASF2642:
	.string	"__NR_setregid 114"
.LASF1237:
	.string	"_POSIX_MEMLOCK_RANGE 200809L"
.LASF967:
	.string	"EL3HLT 46"
.LASF351:
	.string	"__CET__ 3"
.LASF3106:
	.string	"SYS_pipe2 __NR_pipe2"
.LASF1716:
	.string	"__DECL_SIMD_hypotf64 "
.LASF2075:
	.string	"WA_RIGHT A_RIGHT"
.LASF1246:
	.string	"_POSIX_REENTRANT_FUNCTIONS 1"
.LASF1191:
	.string	"__POSIX_FADV_NOREUSE 5"
.LASF2252:
	.string	"insertln() winsdelln(stdscr,1)"
.LASF1393:
	.string	"_SC_UIO_MAXIOV _SC_UIO_MAXIOV"
.LASF2304:
	.string	"mvvline(y,x,c,n) mvwvline(stdscr,(y),(x),(c),(n))"
.LASF1837:
	.string	"__DECL_SIMD_acoshf128 "
.LASF1897:
	.string	"__FP_LOGB0_IS_MIN 1"
.LASF3434:
	.string	"PERF_FLAG_FD_NO_GROUP (1UL << 0)"
.LASF2822:
	.string	"__NR_inotify_init1 294"
.LASF3018:
	.string	"SYS_inotify_init1 __NR_inotify_init1"
.LASF1561:
	.string	"_CS_LFS_LIBS _CS_LFS_LIBS"
.LASF2421:
	.string	"NCURSES_BUTTON_RELEASED 001L"
.LASF2602:
	.string	"__NR_fsync 74"
.LASF2316:
	.string	"is_pad(win) (NCURSES_OK_ADDR(win) ? ((win)->_flags & _ISPAD) != 0 : FALSE)"
.LASF2420:
	.string	"NCURSES_MOUSE_MASK(b,m) ((m) << (((b) - 1) * 5))"
.LASF292:
	.string	"__DEC64_MIN__ 1E-383DD"
.LASF2806:
	.string	"__NR_vmsplice 278"
.LASF878:
	.string	"__FD_ELT(d) ((d) / __NFDBITS)"
.LASF3023:
	.string	"SYS_io_pgetevents __NR_io_pgetevents"
.LASF569:
	.string	"_BITS_TYPES_H 1"
.LASF654:
	.string	"P_tmpdir \"/tmp\""
.LASF623:
	.string	"__RLIM_T_MATCHES_RLIM64_T 1"
.LASF1277:
	.string	"_POSIX_THREAD_PROCESS_SHARED 200809L"
.LASF2360:
	.string	"KEY_BTAB 0541"
.LASF3022:
	.string	"SYS_io_getevents __NR_io_getevents"
.LASF3237:
	.string	"SYS_timerfd_gettime __NR_timerfd_gettime"
.LASF293:
	.string	"__DEC64_MAX__ 9.999999999999999E384DD"
.LASF1198:
	.string	"AT_FDCWD -100"
.LASF2352:
	.string	"KEY_ENTER 0527"
.LASF531:
	.string	"__GLIBC_USE_IEC_60559_BFP_EXT"
.LASF3543:
	.string	"_freeres_buf"
.LASF235:
	.string	"__FLT128_DIG__ 33"
.LASF2819:
	.string	"__NR_epoll_create1 291"
.LASF2738:
	.string	"__NR_io_cancel 210"
.LASF17:
	.string	"__pie__ 2"
.LASF2527:
	.string	"_ASM_UNISTD_64_H "
.LASF2607:
	.string	"__NR_getcwd 79"
.LASF893:
	.string	"_BITS_PTHREADTYPES_ARCH_H 1"
.LASF3137:
	.string	"SYS_recvfrom __NR_recvfrom"
.LASF3506:
	.string	"unsigned int"
.LASF3457:
	.string	"PERF_MEM_LVL_UNC 0x2000"
.LASF2771:
	.string	"__NR_mq_timedreceive 243"
.LASF759:
	.string	"UINT16_C(c) c"
.LASF2832:
	.string	"__NR_open_by_handle_at 304"
.LASF3255:
	.string	"SYS_vfork __NR_vfork"
.LASF2976:
	.string	"SYS_fstat __NR_fstat"
.LASF2794:
	.string	"__NR_symlinkat 266"
.LASF1912:
	.string	"_Mdouble_ double"
.LASF2398:
	.string	"KEY_SHOME 0607"
.LASF390:
	.string	"__USE_ATFILE"
.LASF2965:
	.string	"SYS_fgetxattr __NR_fgetxattr"
.LASF2884:
	.string	"__NR_landlock_add_rule 445"
.LASF2009:
	.string	"NCURSES_ATTR_T int"
.LASF1597:
	.string	"_CS_POSIX_V6_LPBIG_OFFBIG_LIBS _CS_POSIX_V6_LPBIG_OFFBIG_LIBS"
.LASF3103:
	.string	"SYS_pidfd_open __NR_pidfd_open"
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
