	.file	"utils.c"
	.intel_syntax noprefix
# GNU C17 (Ubuntu 11.4.0-1ubuntu1~22.04) version 11.4.0 (x86_64-linux-gnu)
#	compiled by GNU C version 11.4.0, GMP version 6.2.1, MPFR version 4.1.0, MPC version 1.2.1, isl version isl-0.24-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -masm=intel -mtune=generic -march=x86-64 -g -g -ggdb3 -gdwarf-2 -O0 -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection
	.text
.Ltext0:
	.section	.rodata
.LC0:
	.string	"r"
.LC1:
	.string	"Error opening file\n"
	.text
	.globl	read_string
	.type	read_string, @function
read_string:
.LFB0:
	.file 1 "/home/jscha/dvp/cpumon/src/utils.c"
	.loc 1 7 1
	.cfi_startproc
	endbr64	
	push	rbp	#
.LCFI0:
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
.LCFI1:
	.cfi_def_cfa_register 6
	sub	rsp, 32	#,
	mov	QWORD PTR -24[rbp], rdi	# filepath, filepath
# /home/jscha/dvp/cpumon/src/utils.c:11:     FILE *fp = fopen(filepath, "r");
	.loc 1 11 16
	mov	rax, QWORD PTR -24[rbp]	# tmp85, filepath
	lea	rdx, .LC0[rip]	# tmp86,
	mov	rsi, rdx	#, tmp86
	mov	rdi, rax	#, tmp85
	call	fopen@PLT	#
	mov	QWORD PTR -8[rbp], rax	# fp, tmp87
# /home/jscha/dvp/cpumon/src/utils.c:13:     int i = 0;
	.loc 1 13 9
	mov	DWORD PTR -16[rbp], 0	# i,
# /home/jscha/dvp/cpumon/src/utils.c:16:     if(fp == NULL) {
	.loc 1 16 7
	cmp	QWORD PTR -8[rbp], 0	# fp,
	jne	.L4	#,
# /home/jscha/dvp/cpumon/src/utils.c:17:         perror("Error opening file\n");
	.loc 1 17 9
	lea	rax, .LC1[rip]	# tmp88,
	mov	rdi, rax	#, tmp88
	call	perror@PLT	#
# /home/jscha/dvp/cpumon/src/utils.c:18:         return NULL;
	.loc 1 18 15
	mov	eax, 0	# _3,
	jmp	.L3	#
.L7:
# /home/jscha/dvp/cpumon/src/utils.c:22:         if(single_character == '\n') {
	.loc 1 22 11
	cmp	DWORD PTR -12[rbp], 10	# single_character,
	jne	.L5	#,
# /home/jscha/dvp/cpumon/src/utils.c:23:             continue;           // skip newline characters
	.loc 1 23 13 discriminator 1
	jmp	.L4	#
.L5:
# /home/jscha/dvp/cpumon/src/utils.c:25:             file_buf[i] = single_character;
	.loc 1 25 25
	mov	eax, DWORD PTR -12[rbp]	# tmp89, single_character
	mov	ecx, eax	# _1, tmp89
	mov	eax, DWORD PTR -16[rbp]	# tmp91, i
	cdqe
	lea	rdx, file_buf.0[rip]	# tmp92,
	mov	BYTE PTR [rax+rdx], cl	# file_buf[i_2], _1
# /home/jscha/dvp/cpumon/src/utils.c:27:     i++;
	.loc 1 27 6
	add	DWORD PTR -16[rbp], 1	# i,
.L4:
# /home/jscha/dvp/cpumon/src/utils.c:21:     while ((single_character = fgetc(fp)) != EOF && i < BUFSIZE -1 ){
	.loc 1 21 32
	mov	rax, QWORD PTR -8[rbp]	# tmp93, fp
	mov	rdi, rax	#, tmp93
	call	fgetc@PLT	#
	mov	DWORD PTR -12[rbp], eax	# single_character, tmp94
# /home/jscha/dvp/cpumon/src/utils.c:21:     while ((single_character = fgetc(fp)) != EOF && i < BUFSIZE -1 ){
	.loc 1 21 49
	cmp	DWORD PTR -12[rbp], -1	# single_character,
	je	.L6	#,
# /home/jscha/dvp/cpumon/src/utils.c:21:     while ((single_character = fgetc(fp)) != EOF && i < BUFSIZE -1 ){
	.loc 1 21 49 is_stmt 0 discriminator 1
	cmp	DWORD PTR -16[rbp], 62	# i,
	jle	.L7	#,
.L6:
# /home/jscha/dvp/cpumon/src/utils.c:30:     file_buf[i] = '\0';                 // terminate string
	.loc 1 30 17 is_stmt 1
	mov	eax, DWORD PTR -16[rbp]	# tmp96, i
	cdqe
	lea	rdx, file_buf.0[rip]	# tmp97,
	mov	BYTE PTR [rax+rdx], 0	# file_buf[i_2],
# /home/jscha/dvp/cpumon/src/utils.c:31:     fclose(fp);
	.loc 1 31 5
	mov	rax, QWORD PTR -8[rbp]	# tmp98, fp
	mov	rdi, rax	#, tmp98
	call	fclose@PLT	#
# /home/jscha/dvp/cpumon/src/utils.c:33:     return file_buf;                    // return address to file
	.loc 1 33 12
	lea	rax, file_buf.0[rip]	# _3,
.L3:
# /home/jscha/dvp/cpumon/src/utils.c:34: }
	.loc 1 34 1
	leave	
.LCFI2:
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE0:
	.size	read_string, .-read_string
	.section	.rodata
.LC2:
	.string	"%s"
	.text
	.globl	read_line
	.type	read_line, @function
read_line:
.LFB1:
	.loc 1 37 1
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
	mov	QWORD PTR -24[rbp], rdi	# return_string, return_string
	mov	QWORD PTR -32[rbp], rsi	# filepath, filepath
# /home/jscha/dvp/cpumon/src/utils.c:41:     FILE *fp = fopen(filepath, "r");
	.loc 1 41 16
	mov	rax, QWORD PTR -32[rbp]	# tmp86, filepath
	lea	rdx, .LC0[rip]	# tmp87,
	mov	rsi, rdx	#, tmp87
	mov	rdi, rax	#, tmp86
	call	fopen@PLT	#
	mov	QWORD PTR -8[rbp], rax	# fp, tmp88
# /home/jscha/dvp/cpumon/src/utils.c:43:     if(fp == NULL) {
	.loc 1 43 7
	cmp	QWORD PTR -8[rbp], 0	# fp,
	jne	.L9	#,
# /home/jscha/dvp/cpumon/src/utils.c:44:         perror("Error opening file\n");
	.loc 1 44 9
	lea	rax, .LC1[rip]	# tmp89,
	mov	rdi, rax	#, tmp89
	call	perror@PLT	#
# /home/jscha/dvp/cpumon/src/utils.c:45:         return -1;
	.loc 1 45 16
	mov	eax, -1	# _3,
	jmp	.L10	#
.L9:
# /home/jscha/dvp/cpumon/src/utils.c:47:     if (fscanf(fp, "%s", return_string) == 1)
	.loc 1 47 9
	mov	rdx, QWORD PTR -24[rbp]	# tmp90, return_string
	mov	rax, QWORD PTR -8[rbp]	# tmp91, fp
	lea	rcx, .LC2[rip]	# tmp92,
	mov	rsi, rcx	#, tmp92
	mov	rdi, rax	#, tmp91
	mov	eax, 0	#,
	call	__isoc99_fscanf@PLT	#
# /home/jscha/dvp/cpumon/src/utils.c:47:     if (fscanf(fp, "%s", return_string) == 1)
	.loc 1 47 8
	cmp	eax, 1	# _1,
	jne	.L11	#,
# /home/jscha/dvp/cpumon/src/utils.c:49:         fclose(fp);
	.loc 1 49 9
	mov	rax, QWORD PTR -8[rbp]	# tmp93, fp
	mov	rdi, rax	#, tmp93
	call	fclose@PLT	#
# /home/jscha/dvp/cpumon/src/utils.c:50:         return 0;
	.loc 1 50 16
	mov	eax, 0	# _3,
	jmp	.L10	#
.L11:
# /home/jscha/dvp/cpumon/src/utils.c:52:     if (fscanf(fp, "%s", return_string) == EOF)
	.loc 1 52 9
	mov	rdx, QWORD PTR -24[rbp]	# tmp94, return_string
	mov	rax, QWORD PTR -8[rbp]	# tmp95, fp
	lea	rcx, .LC2[rip]	# tmp96,
	mov	rsi, rcx	#, tmp96
	mov	rdi, rax	#, tmp95
	mov	eax, 0	#,
	call	__isoc99_fscanf@PLT	#
# /home/jscha/dvp/cpumon/src/utils.c:52:     if (fscanf(fp, "%s", return_string) == EOF)
	.loc 1 52 8
	cmp	eax, -1	# _2,
	jne	.L12	#,
# /home/jscha/dvp/cpumon/src/utils.c:55:         fclose(fp);
	.loc 1 55 9
	mov	rax, QWORD PTR -8[rbp]	# tmp97, fp
	mov	rdi, rax	#, tmp97
	call	fclose@PLT	#
# /home/jscha/dvp/cpumon/src/utils.c:56:         return -1;
	.loc 1 56 16
	mov	eax, -1	# _3,
	jmp	.L10	#
.L12:
# /home/jscha/dvp/cpumon/src/utils.c:59:     fclose(fp);
	.loc 1 59 5
	mov	rax, QWORD PTR -8[rbp]	# tmp98, fp
	mov	rdi, rax	#, tmp98
	call	fclose@PLT	#
# /home/jscha/dvp/cpumon/src/utils.c:60:     return -1;
	.loc 1 60 12
	mov	eax, -1	# _3,
.L10:
# /home/jscha/dvp/cpumon/src/utils.c:62: }
	.loc 1 62 1
	leave	
.LCFI5:
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE1:
	.size	read_line, .-read_line
	.section	.rodata
.LC3:
	.string	"cmd = %s\n"
.LC4:
	.string	"Error opening pipe"
.LC5:
	.string	" %s"
	.align 8
.LC6:
	.string	"Command not found or exited with error status"
	.text
	.globl	acc_cmdln
	.type	acc_cmdln, @function
acc_cmdln:
.LFB2:
	.loc 1 66 25
	.cfi_startproc
	endbr64	
	push	rbp	#
.LCFI6:
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
.LCFI7:
	.cfi_def_cfa_register 6
	sub	rsp, 112	#,
	mov	QWORD PTR -104[rbp], rdi	# cmd, cmd
# /home/jscha/dvp/cpumon/src/utils.c:66: int acc_cmdln(char *cmd){
	.loc 1 66 25
	mov	rax, QWORD PTR fs:40	# tmp99, MEM[(<address-space-1> long unsigned int *)40B]
	mov	QWORD PTR -8[rbp], rax	# D.2507, tmp99
	xor	eax, eax	# tmp99
# /home/jscha/dvp/cpumon/src/utils.c:70:     if ((fp = popen(cmd, "r")) == NULL) {
	.loc 1 70 15
	mov	rax, QWORD PTR -104[rbp]	# tmp86, cmd
	lea	rdx, .LC0[rip]	# tmp87,
	mov	rsi, rdx	#, tmp87
	mov	rdi, rax	#, tmp86
	call	popen@PLT	#
	mov	QWORD PTR -88[rbp], rax	# fp, tmp88
# /home/jscha/dvp/cpumon/src/utils.c:70:     if ((fp = popen(cmd, "r")) == NULL) {
	.loc 1 70 8
	cmp	QWORD PTR -88[rbp], 0	# fp,
	jne	.L16	#,
# /home/jscha/dvp/cpumon/src/utils.c:71:         printf("cmd = %s\n", cmd);
	.loc 1 71 9
	mov	rax, QWORD PTR -104[rbp]	# tmp89, cmd
	mov	rsi, rax	#, tmp89
	lea	rax, .LC3[rip]	# tmp90,
	mov	rdi, rax	#, tmp90
	mov	eax, 0	#,
	call	printf@PLT	#
# /home/jscha/dvp/cpumon/src/utils.c:72:         printf("Error opening pipe\n");
	.loc 1 72 9
	lea	rax, .LC4[rip]	# tmp91,
	mov	rdi, rax	#, tmp91
	call	puts@PLT	#
# /home/jscha/dvp/cpumon/src/utils.c:73:         return -1;
	.loc 1 73 16
	mov	eax, -1	# _3,
	jmp	.L19	#
.L17:
# /home/jscha/dvp/cpumon/src/utils.c:77:         printf(" %s", buf);  // print response to console
	.loc 1 77 9
	lea	rax, -80[rbp]	# tmp92,
	mov	rsi, rax	#, tmp92
	lea	rax, .LC5[rip]	# tmp93,
	mov	rdi, rax	#, tmp93
	mov	eax, 0	#,
	call	printf@PLT	#
.L16:
# /home/jscha/dvp/cpumon/src/utils.c:76:     while (fgets(buf, BUFSIZE, fp) != NULL) {
	.loc 1 76 12
	mov	rdx, QWORD PTR -88[rbp]	# tmp94, fp
	lea	rax, -80[rbp]	# tmp95,
	mov	esi, 64	#,
	mov	rdi, rax	#, tmp95
	call	fgets@PLT	#
# /home/jscha/dvp/cpumon/src/utils.c:76:     while (fgets(buf, BUFSIZE, fp) != NULL) {
	.loc 1 76 31
	test	rax, rax	# _1
	jne	.L17	#,
# /home/jscha/dvp/cpumon/src/utils.c:80:     if (pclose(fp) == -1) {
	.loc 1 80 9
	mov	rax, QWORD PTR -88[rbp]	# tmp96, fp
	mov	rdi, rax	#, tmp96
	call	pclose@PLT	#
# /home/jscha/dvp/cpumon/src/utils.c:80:     if (pclose(fp) == -1) {
	.loc 1 80 8
	cmp	eax, -1	# _2,
	jne	.L18	#,
# /home/jscha/dvp/cpumon/src/utils.c:81:         printf("Command not found or exited with error status\n");
	.loc 1 81 9
	lea	rax, .LC6[rip]	# tmp97,
	mov	rdi, rax	#, tmp97
	call	puts@PLT	#
# /home/jscha/dvp/cpumon/src/utils.c:82:         return -1;
	.loc 1 82 16
	mov	eax, -1	# _3,
	jmp	.L19	#
.L18:
# /home/jscha/dvp/cpumon/src/utils.c:85:     return 0;
	.loc 1 85 12
	mov	eax, 0	# _3,
.L19:
# /home/jscha/dvp/cpumon/src/utils.c:86: }
	.loc 1 86 1 discriminator 1
	mov	rdx, QWORD PTR -8[rbp]	# tmp100, D.2507
	sub	rdx, QWORD PTR fs:40	# tmp100, MEM[(<address-space-1> long unsigned int *)40B]
	je	.L20	#,
# /home/jscha/dvp/cpumon/src/utils.c:86: }
	.loc 1 86 1 is_stmt 0
	call	__stack_chk_fail@PLT	#
.L20:
	leave	
.LCFI8:
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE2:
	.size	acc_cmdln, .-acc_cmdln
	.section	.rodata
	.align 8
.LC8:
	.string	"CPU\t%.1f\t%ld\t%ld\t%.2f\tlast minute avg\n"
.LC9:
	.string	"Avg Pwr %.2f W\n"
	.text
	.globl	moving_average
	.type	moving_average, @function
moving_average:
.LFB3:
	.loc 1 89 97 is_stmt 1
	.cfi_startproc
	endbr64	
	push	rbp	#
.LCFI9:
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
.LCFI10:
	.cfi_def_cfa_register 6
	sub	rsp, 96	#,
	mov	DWORD PTR -52[rbp], edi	# i, i
	mov	QWORD PTR -64[rbp], rsi	# freq, freq
	mov	QWORD PTR -72[rbp], rdx	# load, load
	mov	QWORD PTR -80[rbp], rcx	# temp, temp
	mov	QWORD PTR -88[rbp], r8	# voltage, voltage
	mov	QWORD PTR -96[rbp], r9	# power, power
# /home/jscha/dvp/cpumon/src/utils.c:91:     i += 1;
	.loc 1 91 7
	add	DWORD PTR -52[rbp], 1	# i,
# /home/jscha/dvp/cpumon/src/utils.c:92:     double freq_total = 0;
	.loc 1 92 12
	pxor	xmm0, xmm0	# tmp117
	movsd	QWORD PTR -40[rbp], xmm0	# freq_total, tmp117
# /home/jscha/dvp/cpumon/src/utils.c:93:     long load_total = 0;
	.loc 1 93 10
	mov	QWORD PTR -32[rbp], 0	# load_total,
# /home/jscha/dvp/cpumon/src/utils.c:94:     long temp_total = 0;
	.loc 1 94 10
	mov	QWORD PTR -24[rbp], 0	# temp_total,
# /home/jscha/dvp/cpumon/src/utils.c:95:     double voltage_total = 0;
	.loc 1 95 12
	pxor	xmm0, xmm0	# tmp118
	movsd	QWORD PTR -16[rbp], xmm0	# voltage_total, tmp118
# /home/jscha/dvp/cpumon/src/utils.c:96:     double power_total = 0;
	.loc 1 96 12
	pxor	xmm0, xmm0	# tmp119
	movsd	QWORD PTR -8[rbp], xmm0	# power_total, tmp119
.LBB2:
# /home/jscha/dvp/cpumon/src/utils.c:99:     for (int j = 0; j < i; j++){
	.loc 1 99 14
	mov	DWORD PTR -44[rbp], 0	# j,
# /home/jscha/dvp/cpumon/src/utils.c:99:     for (int j = 0; j < i; j++){
	.loc 1 99 5
	jmp	.L22	#
.L23:
# /home/jscha/dvp/cpumon/src/utils.c:100:         freq_total += (double)freq[j];
	.loc 1 100 35 discriminator 3
	mov	eax, DWORD PTR -44[rbp]	# tmp120, j
	cdqe
	lea	rdx, 0[0+rax*4]	# _2,
	mov	rax, QWORD PTR -64[rbp]	# tmp121, freq
	add	rax, rdx	# _3, _2
	movss	xmm0, DWORD PTR [rax]	# _4, *_3
# /home/jscha/dvp/cpumon/src/utils.c:100:         freq_total += (double)freq[j];
	.loc 1 100 23 discriminator 3
	cvtss2sd	xmm0, xmm0	# _5, _4
# /home/jscha/dvp/cpumon/src/utils.c:100:         freq_total += (double)freq[j];
	.loc 1 100 20 discriminator 3
	movsd	xmm1, QWORD PTR -40[rbp]	# tmp123, freq_total
	addsd	xmm0, xmm1	# tmp122, tmp123
	movsd	QWORD PTR -40[rbp], xmm0	# freq_total, tmp122
# /home/jscha/dvp/cpumon/src/utils.c:101:         load_total += (long)load[j];
	.loc 1 101 33 discriminator 3
	mov	eax, DWORD PTR -44[rbp]	# tmp124, j
	cdqe
	lea	rdx, 0[0+rax*4]	# _7,
	mov	rax, QWORD PTR -72[rbp]	# tmp125, load
	add	rax, rdx	# _8, _7
	movss	xmm0, DWORD PTR [rax]	# _9, *_8
# /home/jscha/dvp/cpumon/src/utils.c:101:         load_total += (long)load[j];
	.loc 1 101 23 discriminator 3
	cvttss2si	rax, xmm0	# _10, _9
# /home/jscha/dvp/cpumon/src/utils.c:101:         load_total += (long)load[j];
	.loc 1 101 20 discriminator 3
	add	QWORD PTR -32[rbp], rax	# load_total, _10
# /home/jscha/dvp/cpumon/src/utils.c:102:         temp_total += (long)temp[j];
	.loc 1 102 33 discriminator 3
	mov	eax, DWORD PTR -44[rbp]	# tmp126, j
	cdqe
	lea	rdx, 0[0+rax*4]	# _12,
	mov	rax, QWORD PTR -80[rbp]	# tmp127, temp
	add	rax, rdx	# _13, _12
	movss	xmm0, DWORD PTR [rax]	# _14, *_13
# /home/jscha/dvp/cpumon/src/utils.c:102:         temp_total += (long)temp[j];
	.loc 1 102 23 discriminator 3
	cvttss2si	rax, xmm0	# _15, _14
# /home/jscha/dvp/cpumon/src/utils.c:102:         temp_total += (long)temp[j];
	.loc 1 102 20 discriminator 3
	add	QWORD PTR -24[rbp], rax	# temp_total, _15
# /home/jscha/dvp/cpumon/src/utils.c:103:         voltage_total += (double)voltage[j];
	.loc 1 103 41 discriminator 3
	mov	eax, DWORD PTR -44[rbp]	# tmp128, j
	cdqe
	lea	rdx, 0[0+rax*4]	# _17,
	mov	rax, QWORD PTR -88[rbp]	# tmp129, voltage
	add	rax, rdx	# _18, _17
	movss	xmm0, DWORD PTR [rax]	# _19, *_18
# /home/jscha/dvp/cpumon/src/utils.c:103:         voltage_total += (double)voltage[j];
	.loc 1 103 26 discriminator 3
	cvtss2sd	xmm0, xmm0	# _20, _19
# /home/jscha/dvp/cpumon/src/utils.c:103:         voltage_total += (double)voltage[j];
	.loc 1 103 23 discriminator 3
	movsd	xmm1, QWORD PTR -16[rbp]	# tmp131, voltage_total
	addsd	xmm0, xmm1	# tmp130, tmp131
	movsd	QWORD PTR -16[rbp], xmm0	# voltage_total, tmp130
# /home/jscha/dvp/cpumon/src/utils.c:104:         power_total += (double)power[j];
	.loc 1 104 37 discriminator 3
	mov	eax, DWORD PTR -44[rbp]	# tmp132, j
	cdqe
	lea	rdx, 0[0+rax*4]	# _22,
	mov	rax, QWORD PTR -96[rbp]	# tmp133, power
	add	rax, rdx	# _23, _22
	movss	xmm0, DWORD PTR [rax]	# _24, *_23
# /home/jscha/dvp/cpumon/src/utils.c:104:         power_total += (double)power[j];
	.loc 1 104 24 discriminator 3
	cvtss2sd	xmm0, xmm0	# _25, _24
# /home/jscha/dvp/cpumon/src/utils.c:104:         power_total += (double)power[j];
	.loc 1 104 21 discriminator 3
	movsd	xmm1, QWORD PTR -8[rbp]	# tmp135, power_total
	addsd	xmm0, xmm1	# tmp134, tmp135
	movsd	QWORD PTR -8[rbp], xmm0	# power_total, tmp134
# /home/jscha/dvp/cpumon/src/utils.c:99:     for (int j = 0; j < i; j++){
	.loc 1 99 29 discriminator 3
	add	DWORD PTR -44[rbp], 1	# j,
.L22:
# /home/jscha/dvp/cpumon/src/utils.c:99:     for (int j = 0; j < i; j++){
	.loc 1 99 23 discriminator 1
	mov	eax, DWORD PTR -44[rbp]	# tmp136, j
	cmp	eax, DWORD PTR -52[rbp]	# tmp136, i
	jl	.L23	#,
.LBE2:
# /home/jscha/dvp/cpumon/src/utils.c:107:     if (i != 0){        // only divide is divisor is non zero
	.loc 1 107 8
	cmp	DWORD PTR -52[rbp], 0	# i,
	je	.L25	#,
# /home/jscha/dvp/cpumon/src/utils.c:108:         printf("CPU\t%.1f\t%ld\t%ld\t%.2f\tlast minute avg\n", freq_total/i, load_total/i, temp_total/i, voltage_total/i );
	.loc 1 108 9
	pxor	xmm1, xmm1	# _26
	cvtsi2sd	xmm1, DWORD PTR -52[rbp]	# _26, i
	movsd	xmm0, QWORD PTR -16[rbp]	# tmp137, voltage_total
	movapd	xmm2, xmm0	# tmp137, tmp137
	divsd	xmm2, xmm1	# tmp137, _26
	mov	eax, DWORD PTR -52[rbp]	# tmp138, i
	movsx	rcx, eax	# _28, tmp138
	mov	rax, QWORD PTR -24[rbp]	# tmp141, temp_total
	cqo
	idiv	rcx	# _28
	mov	rsi, rax	# _29, tmp139
	mov	eax, DWORD PTR -52[rbp]	# tmp142, i
	movsx	rdi, eax	# _30, tmp142
	mov	rax, QWORD PTR -32[rbp]	# tmp145, load_total
	cqo
	idiv	rdi	# _30
	mov	rcx, rax	# _31, tmp143
	pxor	xmm1, xmm1	# _32
	cvtsi2sd	xmm1, DWORD PTR -52[rbp]	# _32, i
	movsd	xmm0, QWORD PTR -40[rbp]	# tmp146, freq_total
	divsd	xmm0, xmm1	# tmp146, _32
	movq	rax, xmm0	# _33, tmp146
	movapd	xmm1, xmm2	#, _27
	mov	rdx, rsi	#, _29
	mov	rsi, rcx	#, _31
	movq	xmm0, rax	#, _33
	lea	rax, .LC8[rip]	# tmp147,
	mov	rdi, rax	#, tmp147
	mov	eax, 2	#,
	call	printf@PLT	#
# /home/jscha/dvp/cpumon/src/utils.c:109:         printf("Avg Pwr %.2f W\n", power_total/i);
	.loc 1 109 9
	pxor	xmm1, xmm1	# _34
	cvtsi2sd	xmm1, DWORD PTR -52[rbp]	# _34, i
	movsd	xmm0, QWORD PTR -8[rbp]	# tmp148, power_total
	divsd	xmm0, xmm1	# tmp148, _34
	movq	rax, xmm0	# _35, tmp148
	movq	xmm0, rax	#, _35
	lea	rax, .LC9[rip]	# tmp149,
	mov	rdi, rax	#, tmp149
	mov	eax, 1	#,
	call	printf@PLT	#
.L25:
# /home/jscha/dvp/cpumon/src/utils.c:111: }
	.loc 1 111 1
	nop	
	leave	
.LCFI11:
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE3:
	.size	moving_average, .-moving_average
	.globl	runtime_avg
	.type	runtime_avg, @function
runtime_avg:
.LFB4:
	.loc 1 113 90
	.cfi_startproc
	endbr64	
	push	rbp	#
.LCFI12:
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
.LCFI13:
	.cfi_def_cfa_register 6
	mov	QWORD PTR -24[rbp], rdi	# poll_cycle_counter, poll_cycle_counter
	mov	QWORD PTR -32[rbp], rsi	# samples_cumulative, samples_cumulative
	mov	QWORD PTR -40[rbp], rdx	# sample_next, sample_next
# /home/jscha/dvp/cpumon/src/utils.c:115:     float avg = 0;
	.loc 1 115 11
	pxor	xmm0, xmm0	# tmp89
	movss	DWORD PTR -4[rbp], xmm0	# avg, tmp89
# /home/jscha/dvp/cpumon/src/utils.c:116:     *samples_cumulative += *sample_next;
	.loc 1 116 25
	mov	rax, QWORD PTR -32[rbp]	# tmp90, samples_cumulative
	movss	xmm1, DWORD PTR [rax]	# _1, *samples_cumulative_9(D)
# /home/jscha/dvp/cpumon/src/utils.c:116:     *samples_cumulative += *sample_next;
	.loc 1 116 28
	mov	rax, QWORD PTR -40[rbp]	# tmp91, sample_next
	movss	xmm0, DWORD PTR [rax]	# _2, *sample_next_10(D)
# /home/jscha/dvp/cpumon/src/utils.c:116:     *samples_cumulative += *sample_next;
	.loc 1 116 25
	addss	xmm0, xmm1	# _3, _1
	mov	rax, QWORD PTR -32[rbp]	# tmp92, samples_cumulative
	movss	DWORD PTR [rax], xmm0	# *samples_cumulative_9(D), _3
# /home/jscha/dvp/cpumon/src/utils.c:117:     if (poll_cycle_counter != 0) 
	.loc 1 117 8
	cmp	QWORD PTR -24[rbp], 0	# poll_cycle_counter,
	je	.L27	#,
# /home/jscha/dvp/cpumon/src/utils.c:119:         avg = *samples_cumulative / (float) poll_cycle_counter;
	.loc 1 119 15
	mov	rax, QWORD PTR -32[rbp]	# tmp93, samples_cumulative
	movss	xmm0, DWORD PTR [rax]	# _4, *samples_cumulative_9(D)
# /home/jscha/dvp/cpumon/src/utils.c:119:         avg = *samples_cumulative / (float) poll_cycle_counter;
	.loc 1 119 37
	pxor	xmm1, xmm1	# _5
	cvtsi2ss	xmm1, QWORD PTR -24[rbp]	# _5, poll_cycle_counter
# /home/jscha/dvp/cpumon/src/utils.c:119:         avg = *samples_cumulative / (float) poll_cycle_counter;
	.loc 1 119 13
	divss	xmm0, xmm1	# tmp94, _5
	movss	DWORD PTR -4[rbp], xmm0	# avg, tmp94
.L27:
# /home/jscha/dvp/cpumon/src/utils.c:122:     return avg;
	.loc 1 122 12
	movss	xmm0, DWORD PTR -4[rbp]	# _14, avg
# /home/jscha/dvp/cpumon/src/utils.c:123: }
	.loc 1 123 1
	pop	rbp	#
.LCFI14:
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE4:
	.size	runtime_avg, .-runtime_avg
	.globl	get_min_value
	.type	get_min_value, @function
get_min_value:
.LFB5:
	.loc 1 127 1
	.cfi_startproc
	endbr64	
	push	rbp	#
.LCFI15:
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
.LCFI16:
	.cfi_def_cfa_register 6
	movss	DWORD PTR -20[rbp], xmm0	# previous_min_value, previous_min_value
	mov	QWORD PTR -32[rbp], rdi	# sample_next, sample_next
	mov	DWORD PTR -24[rbp], esi	# sample_count, sample_count
.LBB3:
# /home/jscha/dvp/cpumon/src/utils.c:128:     for (int i = 0; i < sample_count; i++)
	.loc 1 128 14
	mov	DWORD PTR -4[rbp], 0	# i,
# /home/jscha/dvp/cpumon/src/utils.c:128:     for (int i = 0; i < sample_count; i++)
	.loc 1 128 5
	jmp	.L30	#
.L33:
# /home/jscha/dvp/cpumon/src/utils.c:130:         if (sample_next[i] < previous_min_value) 
	.loc 1 130 24
	mov	eax, DWORD PTR -4[rbp]	# tmp91, i
	cdqe
	lea	rdx, 0[0+rax*4]	# _2,
	mov	rax, QWORD PTR -32[rbp]	# tmp92, sample_next
	add	rax, rdx	# _3, _2
	movss	xmm1, DWORD PTR [rax]	# _4, *_3
# /home/jscha/dvp/cpumon/src/utils.c:130:         if (sample_next[i] < previous_min_value) 
	.loc 1 130 12
	movss	xmm0, DWORD PTR -20[rbp]	# tmp93, previous_min_value
	comiss	xmm0, xmm1	# tmp93, _4
	jbe	.L31	#,
# /home/jscha/dvp/cpumon/src/utils.c:132:             previous_min_value = sample_next[i];
	.loc 1 132 45
	mov	eax, DWORD PTR -4[rbp]	# tmp94, i
	cdqe
	lea	rdx, 0[0+rax*4]	# _6,
	mov	rax, QWORD PTR -32[rbp]	# tmp95, sample_next
	add	rax, rdx	# _7, _6
# /home/jscha/dvp/cpumon/src/utils.c:132:             previous_min_value = sample_next[i];
	.loc 1 132 32
	movss	xmm0, DWORD PTR [rax]	# tmp96, *_7
	movss	DWORD PTR -20[rbp], xmm0	# previous_min_value, tmp96
.L31:
# /home/jscha/dvp/cpumon/src/utils.c:128:     for (int i = 0; i < sample_count; i++)
	.loc 1 128 40 discriminator 2
	add	DWORD PTR -4[rbp], 1	# i,
.L30:
# /home/jscha/dvp/cpumon/src/utils.c:128:     for (int i = 0; i < sample_count; i++)
	.loc 1 128 23 discriminator 1
	mov	eax, DWORD PTR -4[rbp]	# tmp97, i
	cmp	eax, DWORD PTR -24[rbp]	# tmp97, sample_count
	jl	.L33	#,
.LBE3:
# /home/jscha/dvp/cpumon/src/utils.c:135:     return previous_min_value;
	.loc 1 135 12
	movss	xmm0, DWORD PTR -20[rbp]	# _14, previous_min_value
# /home/jscha/dvp/cpumon/src/utils.c:136: }
	.loc 1 136 1
	pop	rbp	#
.LCFI17:
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE5:
	.size	get_min_value, .-get_min_value
	.globl	get_max_value
	.type	get_max_value, @function
get_max_value:
.LFB6:
	.loc 1 139 1
	.cfi_startproc
	endbr64	
	push	rbp	#
.LCFI18:
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
.LCFI19:
	.cfi_def_cfa_register 6
	movss	DWORD PTR -20[rbp], xmm0	# previous_max_value, previous_max_value
	mov	QWORD PTR -32[rbp], rdi	# sample_next, sample_next
	mov	DWORD PTR -24[rbp], esi	# sample_count, sample_count
.LBB4:
# /home/jscha/dvp/cpumon/src/utils.c:140:     for (int i = 0; i < sample_count; i++)
	.loc 1 140 14
	mov	DWORD PTR -4[rbp], 0	# i,
# /home/jscha/dvp/cpumon/src/utils.c:140:     for (int i = 0; i < sample_count; i++)
	.loc 1 140 5
	jmp	.L37	#
.L40:
# /home/jscha/dvp/cpumon/src/utils.c:142:         if (sample_next[i] > previous_max_value) 
	.loc 1 142 24
	mov	eax, DWORD PTR -4[rbp]	# tmp91, i
	cdqe
	lea	rdx, 0[0+rax*4]	# _2,
	mov	rax, QWORD PTR -32[rbp]	# tmp92, sample_next
	add	rax, rdx	# _3, _2
	movss	xmm0, DWORD PTR [rax]	# _4, *_3
# /home/jscha/dvp/cpumon/src/utils.c:142:         if (sample_next[i] > previous_max_value) 
	.loc 1 142 12
	comiss	xmm0, DWORD PTR -20[rbp]	# _4, previous_max_value
	jbe	.L38	#,
# /home/jscha/dvp/cpumon/src/utils.c:144:             previous_max_value = sample_next[i];
	.loc 1 144 45
	mov	eax, DWORD PTR -4[rbp]	# tmp93, i
	cdqe
	lea	rdx, 0[0+rax*4]	# _6,
	mov	rax, QWORD PTR -32[rbp]	# tmp94, sample_next
	add	rax, rdx	# _7, _6
# /home/jscha/dvp/cpumon/src/utils.c:144:             previous_max_value = sample_next[i];
	.loc 1 144 32
	movss	xmm0, DWORD PTR [rax]	# tmp95, *_7
	movss	DWORD PTR -20[rbp], xmm0	# previous_max_value, tmp95
.L38:
# /home/jscha/dvp/cpumon/src/utils.c:140:     for (int i = 0; i < sample_count; i++)
	.loc 1 140 40 discriminator 2
	add	DWORD PTR -4[rbp], 1	# i,
.L37:
# /home/jscha/dvp/cpumon/src/utils.c:140:     for (int i = 0; i < sample_count; i++)
	.loc 1 140 23 discriminator 1
	mov	eax, DWORD PTR -4[rbp]	# tmp96, i
	cmp	eax, DWORD PTR -24[rbp]	# tmp96, sample_count
	jl	.L40	#,
.LBE4:
# /home/jscha/dvp/cpumon/src/utils.c:147:     return previous_max_value;
	.loc 1 147 12
	movss	xmm0, DWORD PTR -20[rbp]	# _14, previous_max_value
# /home/jscha/dvp/cpumon/src/utils.c:148: }
	.loc 1 148 1
	pop	rbp	#
.LCFI20:
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE6:
	.size	get_max_value, .-get_max_value
	.local	file_buf.0
	.comm	file_buf.0,64,32
.Letext0:
	.file 2 "/usr/lib/gcc/x86_64-linux-gnu/11/include/stddef.h"
	.file 3 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 4 "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h"
	.file 5 "/usr/include/x86_64-linux-gnu/bits/types/FILE.h"
	.file 6 "/usr/include/stdio.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x759
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF782
	.byte	0xc
	.long	.LASF783
	.long	.LASF784
	.quad	.Ltext0
	.quad	.Letext0
	.long	.Ldebug_line0
	.long	.Ldebug_macro0
	.uleb128 0x2
	.long	.LASF709
	.byte	0x2
	.byte	0xd1
	.byte	0x1b
	.long	0x3d
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF702
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF703
	.uleb128 0x4
	.byte	0x8
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF704
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF705
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF706
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF707
	.uleb128 0x5
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF708
	.uleb128 0x2
	.long	.LASF710
	.byte	0x3
	.byte	0x98
	.byte	0x12
	.long	0x70
	.uleb128 0x2
	.long	.LASF711
	.byte	0x3
	.byte	0x99
	.byte	0x12
	.long	0x70
	.uleb128 0x6
	.byte	0x8
	.long	0x95
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF712
	.uleb128 0x7
	.long	0x95
	.uleb128 0x8
	.long	.LASF785
	.byte	0xd8
	.byte	0x4
	.byte	0x31
	.byte	0x8
	.long	0x26e
	.uleb128 0x9
	.long	.LASF713
	.byte	0x4
	.byte	0x33
	.byte	0x7
	.long	0x69
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x9
	.long	.LASF714
	.byte	0x4
	.byte	0x36
	.byte	0x9
	.long	0x8f
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x9
	.long	.LASF715
	.byte	0x4
	.byte	0x37
	.byte	0x9
	.long	0x8f
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x9
	.long	.LASF716
	.byte	0x4
	.byte	0x38
	.byte	0x9
	.long	0x8f
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x9
	.long	.LASF717
	.byte	0x4
	.byte	0x39
	.byte	0x9
	.long	0x8f
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x9
	.long	.LASF718
	.byte	0x4
	.byte	0x3a
	.byte	0x9
	.long	0x8f
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x9
	.long	.LASF719
	.byte	0x4
	.byte	0x3b
	.byte	0x9
	.long	0x8f
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0x9
	.long	.LASF720
	.byte	0x4
	.byte	0x3c
	.byte	0x9
	.long	0x8f
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.uleb128 0x9
	.long	.LASF721
	.byte	0x4
	.byte	0x3d
	.byte	0x9
	.long	0x8f
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0x9
	.long	.LASF722
	.byte	0x4
	.byte	0x40
	.byte	0x9
	.long	0x8f
	.byte	0x2
	.byte	0x23
	.uleb128 0x48
	.uleb128 0x9
	.long	.LASF723
	.byte	0x4
	.byte	0x41
	.byte	0x9
	.long	0x8f
	.byte	0x2
	.byte	0x23
	.uleb128 0x50
	.uleb128 0x9
	.long	.LASF724
	.byte	0x4
	.byte	0x42
	.byte	0x9
	.long	0x8f
	.byte	0x2
	.byte	0x23
	.uleb128 0x58
	.uleb128 0x9
	.long	.LASF725
	.byte	0x4
	.byte	0x44
	.byte	0x16
	.long	0x288
	.byte	0x2
	.byte	0x23
	.uleb128 0x60
	.uleb128 0x9
	.long	.LASF726
	.byte	0x4
	.byte	0x46
	.byte	0x14
	.long	0x28e
	.byte	0x2
	.byte	0x23
	.uleb128 0x68
	.uleb128 0x9
	.long	.LASF727
	.byte	0x4
	.byte	0x48
	.byte	0x7
	.long	0x69
	.byte	0x2
	.byte	0x23
	.uleb128 0x70
	.uleb128 0x9
	.long	.LASF728
	.byte	0x4
	.byte	0x49
	.byte	0x7
	.long	0x69
	.byte	0x2
	.byte	0x23
	.uleb128 0x74
	.uleb128 0x9
	.long	.LASF729
	.byte	0x4
	.byte	0x4a
	.byte	0xb
	.long	0x77
	.byte	0x2
	.byte	0x23
	.uleb128 0x78
	.uleb128 0x9
	.long	.LASF730
	.byte	0x4
	.byte	0x4d
	.byte	0x12
	.long	0x54
	.byte	0x3
	.byte	0x23
	.uleb128 0x80
	.uleb128 0x9
	.long	.LASF731
	.byte	0x4
	.byte	0x4e
	.byte	0xf
	.long	0x5b
	.byte	0x3
	.byte	0x23
	.uleb128 0x82
	.uleb128 0x9
	.long	.LASF732
	.byte	0x4
	.byte	0x4f
	.byte	0x8
	.long	0x294
	.byte	0x3
	.byte	0x23
	.uleb128 0x83
	.uleb128 0x9
	.long	.LASF733
	.byte	0x4
	.byte	0x51
	.byte	0xf
	.long	0x2a4
	.byte	0x3
	.byte	0x23
	.uleb128 0x88
	.uleb128 0x9
	.long	.LASF734
	.byte	0x4
	.byte	0x59
	.byte	0xd
	.long	0x83
	.byte	0x3
	.byte	0x23
	.uleb128 0x90
	.uleb128 0x9
	.long	.LASF735
	.byte	0x4
	.byte	0x5b
	.byte	0x17
	.long	0x2b0
	.byte	0x3
	.byte	0x23
	.uleb128 0x98
	.uleb128 0x9
	.long	.LASF736
	.byte	0x4
	.byte	0x5c
	.byte	0x19
	.long	0x2bc
	.byte	0x3
	.byte	0x23
	.uleb128 0xa0
	.uleb128 0x9
	.long	.LASF737
	.byte	0x4
	.byte	0x5d
	.byte	0x14
	.long	0x28e
	.byte	0x3
	.byte	0x23
	.uleb128 0xa8
	.uleb128 0x9
	.long	.LASF738
	.byte	0x4
	.byte	0x5e
	.byte	0x9
	.long	0x4b
	.byte	0x3
	.byte	0x23
	.uleb128 0xb0
	.uleb128 0x9
	.long	.LASF739
	.byte	0x4
	.byte	0x5f
	.byte	0xa
	.long	0x31
	.byte	0x3
	.byte	0x23
	.uleb128 0xb8
	.uleb128 0x9
	.long	.LASF740
	.byte	0x4
	.byte	0x60
	.byte	0x7
	.long	0x69
	.byte	0x3
	.byte	0x23
	.uleb128 0xc0
	.uleb128 0x9
	.long	.LASF741
	.byte	0x4
	.byte	0x62
	.byte	0x8
	.long	0x2c2
	.byte	0x3
	.byte	0x23
	.uleb128 0xc4
	.byte	0
	.uleb128 0x2
	.long	.LASF742
	.byte	0x5
	.byte	0x7
	.byte	0x19
	.long	0xa1
	.uleb128 0xa
	.long	.LASF786
	.byte	0x4
	.byte	0x2b
	.byte	0xe
	.uleb128 0xb
	.long	.LASF743
	.byte	0x1
	.uleb128 0x6
	.byte	0x8
	.long	0x282
	.uleb128 0x6
	.byte	0x8
	.long	0xa1
	.uleb128 0xc
	.long	0x95
	.long	0x2a4
	.uleb128 0xd
	.long	0x3d
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x27a
	.uleb128 0xb
	.long	.LASF744
	.byte	0x1
	.uleb128 0x6
	.byte	0x8
	.long	0x2aa
	.uleb128 0xb
	.long	.LASF745
	.byte	0x1
	.uleb128 0x6
	.byte	0x8
	.long	0x2b6
	.uleb128 0xc
	.long	0x95
	.long	0x2d2
	.uleb128 0xd
	.long	0x3d
	.byte	0x13
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x26e
	.uleb128 0x3
	.byte	0x4
	.byte	0x4
	.long	.LASF746
	.uleb128 0xe
	.byte	0x1
	.long	.LASF747
	.byte	0x6
	.value	0x337
	.byte	0xc
	.byte	0x1
	.long	0x69
	.byte	0x1
	.long	0x2f9
	.uleb128 0xf
	.long	0x2d2
	.byte	0
	.uleb128 0xe
	.byte	0x1
	.long	.LASF748
	.byte	0x6
	.value	0x250
	.byte	0xe
	.byte	0x1
	.long	0x8f
	.byte	0x1
	.long	0x31d
	.uleb128 0xf
	.long	0x8f
	.uleb128 0xf
	.long	0x69
	.uleb128 0xf
	.long	0x2d2
	.byte	0
	.uleb128 0xe
	.byte	0x1
	.long	.LASF749
	.byte	0x6
	.value	0x164
	.byte	0xc
	.byte	0x1
	.long	0x69
	.byte	0x1
	.long	0x338
	.uleb128 0xf
	.long	0x338
	.uleb128 0x10
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x9c
	.uleb128 0xe
	.byte	0x1
	.long	.LASF750
	.byte	0x6
	.value	0x33d
	.byte	0xe
	.byte	0x1
	.long	0x2d2
	.byte	0x1
	.long	0x35d
	.uleb128 0xf
	.long	0x338
	.uleb128 0xf
	.long	0x338
	.byte	0
	.uleb128 0x11
	.byte	0x1
	.long	.LASF787
	.byte	0x6
	.value	0x1b2
	.byte	0xc
	.long	.LASF788
	.byte	0x1
	.long	0x69
	.byte	0x1
	.long	0x381
	.uleb128 0xf
	.long	0x2d2
	.uleb128 0xf
	.long	0x338
	.uleb128 0x10
	.byte	0
	.uleb128 0x12
	.byte	0x1
	.long	.LASF751
	.byte	0x6
	.byte	0xb2
	.byte	0xc
	.byte	0x1
	.long	0x69
	.byte	0x1
	.long	0x39a
	.uleb128 0xf
	.long	0x2d2
	.byte	0
	.uleb128 0xe
	.byte	0x1
	.long	.LASF752
	.byte	0x6
	.value	0x201
	.byte	0xc
	.byte	0x1
	.long	0x69
	.byte	0x1
	.long	0x3b4
	.uleb128 0xf
	.long	0x2d2
	.byte	0
	.uleb128 0x13
	.byte	0x1
	.long	.LASF789
	.byte	0x6
	.value	0x324
	.byte	0xd
	.byte	0x1
	.byte	0x1
	.long	0x3ca
	.uleb128 0xf
	.long	0x338
	.byte	0
	.uleb128 0xe
	.byte	0x1
	.long	.LASF753
	.byte	0x6
	.value	0x102
	.byte	0xe
	.byte	0x1
	.long	0x2d2
	.byte	0x1
	.long	0x3e9
	.uleb128 0xf
	.long	0x338
	.uleb128 0xf
	.long	0x338
	.byte	0
	.uleb128 0x14
	.byte	0x1
	.long	.LASF757
	.byte	0x1
	.byte	0x8a
	.byte	0x7
	.byte	0x1
	.long	0x2d8
	.quad	.LFB6
	.quad	.LFE6
	.long	.LLST6
	.byte	0x1
	.long	0x45d
	.uleb128 0x15
	.long	.LASF754
	.byte	0x1
	.byte	0x8a
	.byte	0x1b
	.long	0x2d8
	.byte	0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x15
	.long	.LASF755
	.byte	0x1
	.byte	0x8a
	.byte	0x36
	.long	0x45d
	.byte	0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x15
	.long	.LASF756
	.byte	0x1
	.byte	0x8a
	.byte	0x47
	.long	0x69
	.byte	0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x16
	.quad	.LBB4
	.quad	.LBE4
	.uleb128 0x17
	.string	"i"
	.byte	0x1
	.byte	0x8c
	.byte	0xe
	.long	0x69
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x2d8
	.uleb128 0x14
	.byte	0x1
	.long	.LASF758
	.byte	0x1
	.byte	0x7e
	.byte	0x7
	.byte	0x1
	.long	0x2d8
	.quad	.LFB5
	.quad	.LFE5
	.long	.LLST5
	.byte	0x1
	.long	0x4d7
	.uleb128 0x15
	.long	.LASF759
	.byte	0x1
	.byte	0x7e
	.byte	0x1b
	.long	0x2d8
	.byte	0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x15
	.long	.LASF755
	.byte	0x1
	.byte	0x7e
	.byte	0x36
	.long	0x45d
	.byte	0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x15
	.long	.LASF756
	.byte	0x1
	.byte	0x7e
	.byte	0x47
	.long	0x69
	.byte	0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x16
	.quad	.LBB3
	.quad	.LBE3
	.uleb128 0x17
	.string	"i"
	.byte	0x1
	.byte	0x80
	.byte	0xe
	.long	0x69
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0x14
	.byte	0x1
	.long	.LASF760
	.byte	0x1
	.byte	0x71
	.byte	0x7
	.byte	0x1
	.long	0x2d8
	.quad	.LFB4
	.quad	.LFE4
	.long	.LLST4
	.byte	0x1
	.long	0x53b
	.uleb128 0x15
	.long	.LASF761
	.byte	0x1
	.byte	0x71
	.byte	0x18
	.long	0x70
	.byte	0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x15
	.long	.LASF762
	.byte	0x1
	.byte	0x71
	.byte	0x33
	.long	0x45d
	.byte	0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x15
	.long	.LASF755
	.byte	0x1
	.byte	0x71
	.byte	0x4e
	.long	0x45d
	.byte	0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x17
	.string	"avg"
	.byte	0x1
	.byte	0x73
	.byte	0xb
	.long	0x2d8
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x18
	.byte	0x1
	.long	.LASF778
	.byte	0x1
	.byte	0x59
	.byte	0x6
	.byte	0x1
	.quad	.LFB3
	.quad	.LFE3
	.long	.LLST3
	.byte	0x1
	.long	0x627
	.uleb128 0x19
	.string	"i"
	.byte	0x1
	.byte	0x59
	.byte	0x19
	.long	0x69
	.byte	0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x15
	.long	.LASF763
	.byte	0x1
	.byte	0x59
	.byte	0x24
	.long	0x45d
	.byte	0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x15
	.long	.LASF764
	.byte	0x1
	.byte	0x59
	.byte	0x31
	.long	0x45d
	.byte	0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x15
	.long	.LASF765
	.byte	0x1
	.byte	0x59
	.byte	0x3e
	.long	0x45d
	.byte	0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x15
	.long	.LASF766
	.byte	0x1
	.byte	0x59
	.byte	0x4b
	.long	0x45d
	.byte	0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0x15
	.long	.LASF767
	.byte	0x1
	.byte	0x59
	.byte	0x5b
	.long	0x45d
	.byte	0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x1a
	.long	.LASF768
	.byte	0x1
	.byte	0x5c
	.byte	0xc
	.long	0x627
	.byte	0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1a
	.long	.LASF769
	.byte	0x1
	.byte	0x5d
	.byte	0xa
	.long	0x70
	.byte	0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1a
	.long	.LASF770
	.byte	0x1
	.byte	0x5e
	.byte	0xa
	.long	0x70
	.byte	0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1a
	.long	.LASF771
	.byte	0x1
	.byte	0x5f
	.byte	0xc
	.long	0x627
	.byte	0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1a
	.long	.LASF772
	.byte	0x1
	.byte	0x60
	.byte	0xc
	.long	0x627
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x16
	.quad	.LBB2
	.quad	.LBE2
	.uleb128 0x17
	.string	"j"
	.byte	0x1
	.byte	0x63
	.byte	0xe
	.long	0x69
	.byte	0x2
	.byte	0x91
	.sleb128 -60
	.byte	0
	.byte	0
	.uleb128 0x3
	.byte	0x8
	.byte	0x4
	.long	.LASF773
	.uleb128 0x1b
	.byte	0x1
	.long	.LASF774
	.byte	0x1
	.byte	0x42
	.byte	0x5
	.byte	0x1
	.long	0x69
	.quad	.LFB2
	.quad	.LFE2
	.long	.LLST2
	.byte	0x1
	.long	0x685
	.uleb128 0x19
	.string	"cmd"
	.byte	0x1
	.byte	0x42
	.byte	0x15
	.long	0x8f
	.byte	0x3
	.byte	0x91
	.sleb128 -120
	.uleb128 0x17
	.string	"buf"
	.byte	0x1
	.byte	0x43
	.byte	0xa
	.long	0x685
	.byte	0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x17
	.string	"fp"
	.byte	0x1
	.byte	0x44
	.byte	0xb
	.long	0x2d2
	.byte	0x3
	.byte	0x91
	.sleb128 -104
	.byte	0
	.uleb128 0xc
	.long	0x95
	.long	0x695
	.uleb128 0xd
	.long	0x3d
	.byte	0x3f
	.byte	0
	.uleb128 0x1b
	.byte	0x1
	.long	.LASF775
	.byte	0x1
	.byte	0x24
	.byte	0x5
	.byte	0x1
	.long	0x69
	.quad	.LFB1
	.quad	.LFE1
	.long	.LLST1
	.byte	0x1
	.long	0x6e9
	.uleb128 0x15
	.long	.LASF776
	.byte	0x1
	.byte	0x24
	.byte	0x15
	.long	0x8f
	.byte	0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x15
	.long	.LASF777
	.byte	0x1
	.byte	0x24
	.byte	0x30
	.long	0x338
	.byte	0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x17
	.string	"fp"
	.byte	0x1
	.byte	0x29
	.byte	0xb
	.long	0x2d2
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x1c
	.byte	0x1
	.long	.LASF779
	.byte	0x1
	.byte	0x6
	.byte	0x7
	.byte	0x1
	.long	0x8f
	.quad	.LFB0
	.quad	.LFE0
	.long	.LLST0
	.byte	0x1
	.uleb128 0x15
	.long	.LASF777
	.byte	0x1
	.byte	0x6
	.byte	0x1f
	.long	0x338
	.byte	0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x17
	.string	"fp"
	.byte	0x1
	.byte	0xb
	.byte	0xb
	.long	0x2d2
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1a
	.long	.LASF780
	.byte	0x1
	.byte	0xc
	.byte	0x11
	.long	0x685
	.byte	0x9
	.byte	0x3
	.quad	file_buf.0
	.uleb128 0x17
	.string	"i"
	.byte	0x1
	.byte	0xd
	.byte	0x9
	.long	0x69
	.byte	0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1a
	.long	.LASF781
	.byte	0x1
	.byte	0xe
	.byte	0x9
	.long	0x69
	.byte	0x2
	.byte	0x91
	.sleb128 -28
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
	.uleb128 0xf
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x11
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
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
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
	.uleb128 0x16
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x17
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
	.uleb128 0x19
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
	.uleb128 0x1a
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
	.uleb128 0x1c
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
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST6:
	.quad	.LFB6-.Ltext0
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
	.quad	.LFE6-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	0
	.quad	0
.LLST5:
	.quad	.LFB5-.Ltext0
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
	.quad	.LFE5-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	0
	.quad	0
.LLST4:
	.quad	.LFB4-.Ltext0
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
	.quad	.LFE4-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	0
	.quad	0
.LLST3:
	.quad	.LFB3-.Ltext0
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
	.quad	.LFE3-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	0
	.quad	0
.LLST2:
	.quad	.LFB2-.Ltext0
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
	.quad	.LFE2-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	0
	.quad	0
.LLST1:
	.quad	.LFB1-.Ltext0
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
	.quad	.LFE1-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	0
	.quad	0
.LLST0:
	.quad	.LFB0-.Ltext0
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
	.quad	.LFE0-.Ltext0
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
	.file 7 "/usr/include/stdc-predef.h"
	.byte	0x3
	.uleb128 0
	.uleb128 0x7
	.byte	0x7
	.long	.Ldebug_macro2
	.byte	0x4
	.byte	0x3
	.uleb128 0x1
	.uleb128 0x6
	.byte	0x7
	.long	.Ldebug_macro3
	.file 8 "/usr/include/x86_64-linux-gnu/bits/libc-header-start.h"
	.byte	0x3
	.uleb128 0x1b
	.uleb128 0x8
	.byte	0x6
	.uleb128 0x1f
	.long	.LASF369
	.file 9 "/usr/include/features.h"
	.byte	0x3
	.uleb128 0x21
	.uleb128 0x9
	.byte	0x7
	.long	.Ldebug_macro4
	.file 10 "/usr/include/features-time64.h"
	.byte	0x3
	.uleb128 0x188
	.uleb128 0xa
	.file 11 "/usr/include/x86_64-linux-gnu/bits/wordsize.h"
	.byte	0x3
	.uleb128 0x14
	.uleb128 0xb
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.file 12 "/usr/include/x86_64-linux-gnu/bits/timesize.h"
	.byte	0x3
	.uleb128 0x15
	.uleb128 0xc
	.byte	0x3
	.uleb128 0x13
	.uleb128 0xb
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
	.file 13 "/usr/include/x86_64-linux-gnu/sys/cdefs.h"
	.byte	0x3
	.uleb128 0x1e6
	.uleb128 0xd
	.byte	0x7
	.long	.Ldebug_macro7
	.byte	0x3
	.uleb128 0x22f
	.uleb128 0xb
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.file 14 "/usr/include/x86_64-linux-gnu/bits/long-double.h"
	.byte	0x3
	.uleb128 0x230
	.uleb128 0xe
	.byte	0x5
	.uleb128 0x15
	.long	.LASF503
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro8
	.byte	0x4
	.file 15 "/usr/include/x86_64-linux-gnu/gnu/stubs.h"
	.byte	0x3
	.uleb128 0x1fe
	.uleb128 0xf
	.file 16 "/usr/include/x86_64-linux-gnu/gnu/stubs-64.h"
	.byte	0x3
	.uleb128 0xa
	.uleb128 0x10
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
	.file 17 "/usr/lib/gcc/x86_64-linux-gnu/11/include/stdarg.h"
	.byte	0x3
	.uleb128 0x24
	.uleb128 0x11
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
	.uleb128 0xb
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.byte	0x3
	.uleb128 0x1c
	.uleb128 0xc
	.byte	0x3
	.uleb128 0x13
	.uleb128 0xb
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF424
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro14
	.file 18 "/usr/include/x86_64-linux-gnu/bits/typesizes.h"
	.byte	0x3
	.uleb128 0x8d
	.uleb128 0x12
	.byte	0x7
	.long	.Ldebug_macro15
	.byte	0x4
	.file 19 "/usr/include/x86_64-linux-gnu/bits/time64.h"
	.byte	0x3
	.uleb128 0x8e
	.uleb128 0x13
	.byte	0x7
	.long	.Ldebug_macro16
	.byte	0x4
	.byte	0x6
	.uleb128 0xe2
	.long	.LASF629
	.byte	0x4
	.file 20 "/usr/include/x86_64-linux-gnu/bits/types/__fpos_t.h"
	.byte	0x3
	.uleb128 0x27
	.uleb128 0x14
	.byte	0x5
	.uleb128 0x2
	.long	.LASF630
	.file 21 "/usr/include/x86_64-linux-gnu/bits/types/__mbstate_t.h"
	.byte	0x3
	.uleb128 0x5
	.uleb128 0x15
	.byte	0x5
	.uleb128 0x2
	.long	.LASF631
	.byte	0x4
	.byte	0x4
	.file 22 "/usr/include/x86_64-linux-gnu/bits/types/__fpos64_t.h"
	.byte	0x3
	.uleb128 0x28
	.uleb128 0x16
	.byte	0x5
	.uleb128 0x2
	.long	.LASF632
	.byte	0x4
	.file 23 "/usr/include/x86_64-linux-gnu/bits/types/__FILE.h"
	.byte	0x3
	.uleb128 0x29
	.uleb128 0x17
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
	.file 24 "/usr/include/x86_64-linux-gnu/bits/stdio_lim.h"
	.byte	0x3
	.uleb128 0x85
	.uleb128 0x18
	.byte	0x7
	.long	.Ldebug_macro19
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro20
	.file 25 "/usr/include/x86_64-linux-gnu/bits/floatn.h"
	.byte	0x3
	.uleb128 0x1ae
	.uleb128 0x19
	.byte	0x7
	.long	.Ldebug_macro21
	.file 26 "/usr/include/x86_64-linux-gnu/bits/floatn-common.h"
	.byte	0x3
	.uleb128 0x77
	.uleb128 0x1a
	.byte	0x5
	.uleb128 0x15
	.long	.LASF674
	.byte	0x3
	.uleb128 0x18
	.uleb128 0xe
	.byte	0x5
	.uleb128 0x15
	.long	.LASF503
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro22
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.file 27 "/home/jscha/dvp/cpumon/src/../include/cpumonlib.h"
	.byte	0x3
	.uleb128 0x2
	.uleb128 0x1b
	.byte	0x7
	.long	.Ldebug_macro23
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
	.section	.debug_macro,"G",@progbits,wm4.cpumonlib.h.3.02eaf6afe85a1ee5acd07b0e880f112e,comdat
.Ldebug_macro23:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x3
	.long	.LASF696
	.byte	0x5
	.uleb128 0x6
	.long	.LASF697
	.byte	0x5
	.uleb128 0x7
	.long	.LASF698
	.byte	0x5
	.uleb128 0x8
	.long	.LASF699
	.byte	0x5
	.uleb128 0x9
	.long	.LASF700
	.byte	0x5
	.uleb128 0xa
	.long	.LASF701
	.byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF646:
	.string	"_IOFBF 0"
.LASF784:
	.string	"/home/jscha/dvp/cpumon/build"
.LASF584:
	.string	"__STD_TYPE typedef"
.LASF752:
	.string	"fgetc"
.LASF422:
	.string	"__WORDSIZE_TIME64_COMPAT32 1"
.LASF237:
	.string	"__FLT128_MIN_10_EXP__ (-4931)"
.LASF301:
	.string	"__DEC128_EPSILON__ 1E-33DL"
.LASF761:
	.string	"poll_cycle_counter"
.LASF669:
	.string	"__HAVE_DISTINCT_FLOAT128 1"
.LASF55:
	.string	"__UINT32_TYPE__ unsigned int"
.LASF315:
	.string	"__GCC_ATOMIC_WCHAR_T_LOCK_FREE 2"
.LASF110:
	.string	"__UINT32_MAX__ 0xffffffffU"
.LASF709:
	.string	"size_t"
.LASF64:
	.string	"__UINT_LEAST64_TYPE__ long unsigned int"
.LASF748:
	.string	"fgets"
.LASF662:
	.string	"stdin stdin"
.LASF231:
	.string	"__FLT64_HAS_INFINITY__ 1"
.LASF689:
	.string	"__f64(x) x ##f64"
.LASF95:
	.string	"__SIZE_WIDTH__ 64"
.LASF300:
	.string	"__DEC128_MAX__ 9.999999999999999999999999999999999E6144DL"
.LASF21:
	.string	"__LP64__ 1"
.LASF527:
	.string	"__stub_sigreturn "
.LASF385:
	.string	"__USE_XOPEN2K8XSI"
.LASF651:
	.string	"SEEK_SET 0"
.LASF224:
	.string	"__FLT64_DECIMAL_DIG__ 17"
.LASF490:
	.string	"__always_inline __inline __attribute__ ((__always_inline__))"
.LASF14:
	.string	"__ATOMIC_CONSUME 1"
.LASF744:
	.string	"_IO_codecvt"
.LASF397:
	.string	"__GLIBC_USE_DEPRECATED_SCANF"
.LASF465:
	.string	"__flexarr []"
.LASF249:
	.string	"__FLT128_IS_IEC_60559__ 2"
.LASF430:
	.string	"__GNU_LIBRARY__"
.LASF141:
	.string	"__UINT_FAST16_MAX__ 0xffffffffffffffffUL"
.LASF174:
	.string	"__DBL_MAX_10_EXP__ 308"
.LASF475:
	.string	"__attribute_pure__ __attribute__ ((__pure__))"
.LASF724:
	.string	"_IO_save_end"
.LASF138:
	.string	"__INT_FAST64_MAX__ 0x7fffffffffffffffL"
.LASF34:
	.string	"__ORDER_PDP_ENDIAN__ 3412"
.LASF291:
	.string	"__DEC64_MAX_EXP__ 385"
.LASF165:
	.string	"__FLT_HAS_DENORM__ 1"
.LASF49:
	.string	"__INT8_TYPE__ signed char"
.LASF208:
	.string	"__FLT32_DECIMAL_DIG__ 9"
.LASF460:
	.string	"__glibc_unsafe_len(__l,__s,__osz) (__glibc_unsigned_or_positive (__l) && __builtin_constant_p (__glibc_safe_len_cond ((__SIZE_TYPE__) (__l), __s, __osz)) && !__glibc_safe_len_cond ((__SIZE_TYPE__) (__l), __s, __osz))"
.LASF2:
	.string	"__STDC_UTF_16__ 1"
.LASF40:
	.string	"__SIZE_TYPE__ long unsigned int"
.LASF125:
	.string	"__UINT8_C(c) c"
.LASF50:
	.string	"__INT16_TYPE__ short int"
.LASF355:
	.string	"linux 1"
.LASF8:
	.string	"__VERSION__ \"11.4.0\""
.LASF775:
	.string	"read_line"
.LASF717:
	.string	"_IO_write_base"
.LASF479:
	.string	"__attribute_noinline__ __attribute__ ((__noinline__))"
.LASF307:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 1"
.LASF776:
	.string	"return_string"
.LASF4:
	.string	"__STDC_HOSTED__ 1"
.LASF629:
	.string	"__STD_TYPE"
.LASF332:
	.string	"__x86_64 1"
.LASF446:
	.string	"__P(args) args"
.LASF733:
	.string	"_lock"
.LASF546:
	.string	"__SIZE_T__ "
.LASF211:
	.string	"__FLT32_MIN__ 1.17549435082228750796873653722224568e-38F32"
.LASF785:
	.string	"_IO_FILE"
.LASF566:
	.string	"__need___va_list "
.LASF107:
	.string	"__INT64_MAX__ 0x7fffffffffffffffL"
.LASF597:
	.string	"__OFF64_T_TYPE __SQUAD_TYPE"
.LASF161:
	.string	"__FLT_NORM_MAX__ 3.40282346638528859811704183484516925e+38F"
.LASF352:
	.string	"__gnu_linux__ 1"
.LASF204:
	.string	"__FLT32_MIN_EXP__ (-125)"
.LASF185:
	.string	"__LDBL_MANT_DIG__ 64"
.LASF691:
	.string	"__f64x(x) x ##f64x"
.LASF668:
	.string	"__HAVE_FLOAT128 1"
.LASF676:
	.string	"__HAVE_FLOAT32 1"
.LASF722:
	.string	"_IO_save_base"
.LASF391:
	.string	"__USE_DYNAMIC_STACK_SIZE"
.LASF221:
	.string	"__FLT64_MIN_10_EXP__ (-307)"
.LASF561:
	.string	"__size_t "
.LASF139:
	.string	"__INT_FAST64_WIDTH__ 64"
.LASF207:
	.string	"__FLT32_MAX_10_EXP__ 38"
.LASF581:
	.string	"__ULONG32_TYPE unsigned int"
.LASF780:
	.string	"file_buf"
.LASF434:
	.string	"__GLIBC_PREREQ(maj,min) ((__GLIBC__ << 16) + __GLIBC_MINOR__ >= ((maj) << 16) + (min))"
.LASF283:
	.string	"__DEC32_MIN_EXP__ (-94)"
.LASF467:
	.string	"__REDIRECT(name,proto,alias) name proto __asm__ (__ASMNAME (#alias))"
.LASF550:
	.string	"_T_SIZE "
.LASF33:
	.string	"__ORDER_BIG_ENDIAN__ 4321"
.LASF206:
	.string	"__FLT32_MAX_EXP__ 128"
.LASF299:
	.string	"__DEC128_MIN__ 1E-6143DL"
.LASF306:
	.string	"__NO_INLINE__ 1"
.LASF726:
	.string	"_chain"
.LASF351:
	.string	"__CET__ 3"
.LASF248:
	.string	"__FLT128_HAS_QUIET_NAN__ 1"
.LASF372:
	.string	"__USE_ISOC99"
.LASF388:
	.string	"__USE_FILE_OFFSET64"
.LASF220:
	.string	"__FLT64_MIN_EXP__ (-1021)"
.LASF730:
	.string	"_cur_column"
.LASF375:
	.string	"__USE_POSIX"
.LASF31:
	.string	"__BIGGEST_ALIGNMENT__ 16"
.LASF287:
	.string	"__DEC32_EPSILON__ 1E-6DF"
.LASF563:
	.string	"NULL"
.LASF627:
	.string	"_BITS_TIME64_H 1"
.LASF271:
	.string	"__FLT64X_MAX_10_EXP__ 4932"
.LASF87:
	.string	"__SCHAR_WIDTH__ 8"
.LASF523:
	.string	"__stub_fchflags "
.LASF321:
	.string	"__GCC_ATOMIC_POINTER_LOCK_FREE 2"
.LASF44:
	.string	"__INTMAX_TYPE__ long int"
.LASF606:
	.string	"__FSFILCNT64_T_TYPE __UQUAD_TYPE"
.LASF680:
	.string	"__HAVE_DISTINCT_FLOAT16 __HAVE_FLOAT16"
.LASF242:
	.string	"__FLT128_NORM_MAX__ 1.18973149535723176508575932662800702e+4932F128"
.LASF193:
	.string	"__LDBL_MAX__ 1.18973149535723176502126385303097021e+4932L"
.LASF399:
	.string	"__GNUC_PREREQ(maj,min) ((__GNUC__ << 16) + __GNUC_MINOR__ >= ((maj) << 16) + (min))"
.LASF379:
	.string	"__USE_XOPEN"
.LASF140:
	.string	"__UINT_FAST8_MAX__ 0xff"
.LASF384:
	.string	"__USE_XOPEN2K8"
.LASF263:
	.string	"__FLT32X_HAS_INFINITY__ 1"
.LASF489:
	.string	"__always_inline"
.LASF548:
	.string	"_SYS_SIZE_T_H "
.LASF61:
	.string	"__UINT_LEAST8_TYPE__ unsigned char"
.LASF395:
	.string	"__GLIBC_USE_ISOC2X"
.LASF336:
	.string	"__ATOMIC_HLE_ACQUIRE 65536"
.LASF432:
	.string	"__GLIBC__ 2"
.LASF683:
	.string	"__HAVE_DISTINCT_FLOAT32X 0"
.LASF708:
	.string	"long int"
.LASF424:
	.string	"__TIMESIZE __WORDSIZE"
.LASF541:
	.string	"__GLIBC_USE_IEC_60559_TYPES_EXT"
.LASF758:
	.string	"get_min_value"
.LASF256:
	.string	"__FLT32X_DECIMAL_DIG__ 17"
.LASF264:
	.string	"__FLT32X_HAS_QUIET_NAN__ 1"
.LASF400:
	.string	"__glibc_clang_prereq(maj,min) 0"
.LASF418:
	.string	"__USE_XOPEN2K8 1"
.LASF615:
	.string	"__CLOCKID_T_TYPE __S32_TYPE"
.LASF297:
	.string	"__DEC128_MIN_EXP__ (-6142)"
.LASF396:
	.string	"__GLIBC_USE_DEPRECATED_GETS"
.LASF236:
	.string	"__FLT128_MIN_EXP__ (-16381)"
.LASF630:
	.string	"_____fpos_t_defined 1"
.LASF72:
	.string	"__UINT_FAST64_TYPE__ long unsigned int"
.LASF356:
	.string	"__unix 1"
.LASF57:
	.string	"__INT_LEAST8_TYPE__ signed char"
.LASF37:
	.string	"__SIZEOF_POINTER__ 8"
.LASF311:
	.string	"__GCC_ATOMIC_BOOL_LOCK_FREE 2"
.LASF626:
	.string	"__FD_SETSIZE 1024"
.LASF278:
	.string	"__FLT64X_HAS_DENORM__ 1"
.LASF743:
	.string	"_IO_marker"
.LASF611:
	.string	"__SUSECONDS_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF269:
	.string	"__FLT64X_MIN_10_EXP__ (-4931)"
.LASF661:
	.string	"FOPEN_MAX 16"
.LASF71:
	.string	"__UINT_FAST32_TYPE__ long unsigned int"
.LASF605:
	.string	"__FSFILCNT_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF39:
	.string	"__GNUC_WIDE_EXECUTION_CHARSET_NAME \"UTF-32LE\""
.LASF486:
	.string	"__returns_nonnull __attribute__ ((__returns_nonnull__))"
.LASF253:
	.string	"__FLT32X_MIN_10_EXP__ (-307)"
.LASF557:
	.string	"_SIZE_T_DECLARED "
.LASF448:
	.string	"__CONCAT(x,y) x ## y"
.LASF345:
	.string	"__FXSR__ 1"
.LASF143:
	.string	"__UINT_FAST64_MAX__ 0xffffffffffffffffUL"
.LASF244:
	.string	"__FLT128_EPSILON__ 1.92592994438723585305597794258492732e-34F128"
.LASF184:
	.string	"__DBL_IS_IEC_60559__ 2"
.LASF157:
	.string	"__FLT_MAX_EXP__ 128"
.LASF362:
	.string	"__STDC_IEC_559__ 1"
.LASF23:
	.string	"__SIZEOF_LONG__ 8"
.LASF652:
	.string	"SEEK_CUR 1"
.LASF27:
	.string	"__SIZEOF_DOUBLE__ 8"
.LASF120:
	.string	"__INT_LEAST32_WIDTH__ 32"
.LASF190:
	.string	"__LDBL_MAX_10_EXP__ 4932"
.LASF687:
	.string	"__HAVE_FLOATN_NOT_TYPEDEF 1"
.LASF368:
	.string	"__GLIBC_INTERNAL_STARTING_HEADER_IMPLEMENTATION "
.LASF361:
	.string	"_STDC_PREDEF_H 1"
.LASF18:
	.string	"__PIE__ 2"
.LASF229:
	.string	"__FLT64_DENORM_MIN__ 4.94065645841246544176568792868221372e-324F64"
.LASF293:
	.string	"__DEC64_MAX__ 9.999999999999999E384DD"
.LASF468:
	.string	"__REDIRECT_NTH(name,proto,alias) name proto __asm__ (__ASMNAME (#alias)) __THROW"
.LASF608:
	.string	"__CLOCK_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF591:
	.string	"__INO_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF156:
	.string	"__FLT_MIN_10_EXP__ (-37)"
.LASF226:
	.string	"__FLT64_NORM_MAX__ 1.79769313486231570814527423731704357e+308F64"
.LASF429:
	.string	"__GLIBC_USE_DEPRECATED_SCANF 0"
.LASF159:
	.string	"__FLT_DECIMAL_DIG__ 9"
.LASF439:
	.string	"__glibc_has_extension(ext) 0"
.LASF706:
	.string	"signed char"
.LASF545:
	.string	"__size_t__ "
.LASF571:
	.string	"__U16_TYPE unsigned short int"
.LASF213:
	.string	"__FLT32_DENORM_MIN__ 1.40129846432481707092372958328991613e-45F32"
.LASF450:
	.string	"__ptr_t void *"
.LASF305:
	.string	"__GNUC_STDC_INLINE__ 1"
.LASF167:
	.string	"__FLT_HAS_QUIET_NAN__ 1"
.LASF7:
	.string	"__GNUC_PATCHLEVEL__ 0"
.LASF586:
	.string	"__SYSCALL_SLONG_TYPE __SLONGWORD_TYPE"
.LASF503:
	.string	"__LDOUBLE_REDIRECTS_TO_FLOAT128_ABI 0"
.LASF94:
	.string	"__PTRDIFF_WIDTH__ 64"
.LASF126:
	.string	"__UINT_LEAST16_MAX__ 0xffff"
.LASF440:
	.string	"__LEAF , __leaf__"
.LASF216:
	.string	"__FLT32_HAS_QUIET_NAN__ 1"
.LASF764:
	.string	"load"
.LASF1:
	.string	"__STDC_VERSION__ 201710L"
.LASF602:
	.string	"__BLKCNT64_T_TYPE __SQUAD_TYPE"
.LASF261:
	.string	"__FLT32X_DENORM_MIN__ 4.94065645841246544176568792868221372e-324F32x"
.LASF223:
	.string	"__FLT64_MAX_10_EXP__ 308"
.LASF787:
	.string	"fscanf"
.LASF774:
	.string	"acc_cmdln"
.LASF135:
	.string	"__INT_FAST16_WIDTH__ 64"
.LASF604:
	.string	"__FSBLKCNT64_T_TYPE __UQUAD_TYPE"
.LASF750:
	.string	"popen"
.LASF558:
	.string	"___int_size_t_h "
.LASF3:
	.string	"__STDC_UTF_32__ 1"
.LASF406:
	.string	"__USE_ISOC99 1"
.LASF212:
	.string	"__FLT32_EPSILON__ 1.19209289550781250000000000000000000e-7F32"
.LASF158:
	.string	"__FLT_MAX_10_EXP__ 38"
.LASF447:
	.string	"__PMT(args) args"
.LASF298:
	.string	"__DEC128_MAX_EXP__ 6145"
.LASF751:
	.string	"fclose"
.LASF268:
	.string	"__FLT64X_MIN_EXP__ (-16381)"
.LASF10:
	.string	"__ATOMIC_SEQ_CST 5"
.LASF173:
	.string	"__DBL_MAX_EXP__ 1024"
.LASF129:
	.string	"__UINT32_C(c) c ## U"
.LASF347:
	.string	"__SSE2_MATH__ 1"
.LASF97:
	.string	"__INTMAX_C(c) c ## L"
.LASF189:
	.string	"__LDBL_MAX_EXP__ 16384"
.LASF25:
	.string	"__SIZEOF_SHORT__ 2"
.LASF122:
	.string	"__INT64_C(c) c ## L"
.LASF497:
	.string	"__restrict_arr __restrict"
.LASF521:
	.string	"__stub___compat_bdflush "
.LASF554:
	.string	"_SIZE_T_DEFINED_ "
.LASF99:
	.string	"__UINTMAX_C(c) c ## UL"
.LASF613:
	.string	"__DADDR_T_TYPE __S32_TYPE"
.LASF243:
	.string	"__FLT128_MIN__ 3.36210314311209350626267781732175260e-4932F128"
.LASF428:
	.string	"__GLIBC_USE_DEPRECATED_GETS 0"
.LASF324:
	.string	"__PRAGMA_REDEFINE_EXTNAME 1"
.LASF476:
	.string	"__attribute_const__ __attribute__ ((__const__))"
.LASF203:
	.string	"__FLT32_DIG__ 6"
.LASF308:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 1"
.LASF673:
	.string	"__CFLOAT128 _Complex _Float128"
.LASF68:
	.string	"__INT_FAST64_TYPE__ long int"
.LASF191:
	.string	"__DECIMAL_DIG__ 21"
.LASF532:
	.string	"__GLIBC_USE_IEC_60559_BFP_EXT 0"
.LASF458:
	.string	"__glibc_unsigned_or_positive(__l) ((__typeof (__l)) 0 < (__typeof (__l)) -1 || (__builtin_constant_p (__l) && (__l) > 0))"
.LASF526:
	.string	"__stub_setlogin "
.LASF543:
	.string	"__need_size_t "
.LASF574:
	.string	"__SLONGWORD_TYPE long int"
.LASF509:
	.string	"__LDBL_REDIR_DECL(name) "
.LASF217:
	.string	"__FLT32_IS_IEC_60559__ 2"
.LASF494:
	.string	"__fortify_function __extern_always_inline __attribute_artificial__"
.LASF408:
	.string	"__USE_POSIX_IMPLICITLY 1"
.LASF333:
	.string	"__x86_64__ 1"
.LASF786:
	.string	"_IO_lock_t"
.LASF382:
	.string	"__USE_XOPEN2K"
.LASF456:
	.string	"__glibc_objsize(__o) __bos (__o)"
.LASF628:
	.string	"__TIME64_T_TYPE __TIME_T_TYPE"
.LASF383:
	.string	"__USE_XOPEN2KXSI"
.LASF108:
	.string	"__UINT8_MAX__ 0xff"
.LASF163:
	.string	"__FLT_EPSILON__ 1.19209289550781250000000000000000000e-7F"
.LASF365:
	.string	"__STDC_IEC_60559_COMPLEX__ 201404L"
.LASF492:
	.string	"__extern_inline extern __inline __attribute__ ((__gnu_inline__))"
.LASF537:
	.string	"__GLIBC_USE_IEC_60559_FUNCS_EXT"
.LASF181:
	.string	"__DBL_HAS_DENORM__ 1"
.LASF38:
	.string	"__GNUC_EXECUTION_CHARSET_NAME \"UTF-8\""
.LASF757:
	.string	"get_max_value"
.LASF349:
	.string	"__SEG_FS 1"
.LASF75:
	.string	"__GXX_ABI_VERSION 1016"
.LASF115:
	.string	"__INT_LEAST16_MAX__ 0x7fff"
.LASF714:
	.string	"_IO_read_ptr"
.LASF238:
	.string	"__FLT128_MAX_EXP__ 16384"
.LASF377:
	.string	"__USE_POSIX199309"
.LASF678:
	.string	"__HAVE_FLOAT32X 1"
.LASF366:
	.string	"__STDC_ISO_10646__ 201706L"
.LASF103:
	.string	"__SIG_ATOMIC_WIDTH__ 32"
.LASF693:
	.string	"__CFLOAT64 _Complex _Float64"
.LASF692:
	.string	"__CFLOAT32 _Complex _Float32"
.LASF664:
	.string	"stderr stderr"
.LASF634:
	.string	"__FILE_defined 1"
.LASF637:
	.string	"__putc_unlocked_body(_ch,_fp) (__glibc_unlikely ((_fp)->_IO_write_ptr >= (_fp)->_IO_write_end) ? __overflow (_fp, (unsigned char) (_ch)) : (unsigned char) (*(_fp)->_IO_write_ptr++ = (_ch)))"
.LASF433:
	.string	"__GLIBC_MINOR__ 35"
.LASF640:
	.string	"_IO_ERR_SEEN 0x0020"
.LASF316:
	.string	"__GCC_ATOMIC_SHORT_LOCK_FREE 2"
.LASF381:
	.string	"__USE_UNIX98"
.LASF65:
	.string	"__INT_FAST8_TYPE__ signed char"
.LASF398:
	.string	"__KERNEL_STRICT_NAMES "
.LASF696:
	.string	"CPUMONLIB "
.LASF590:
	.string	"__GID_T_TYPE __U32_TYPE"
.LASF642:
	.string	"_IO_USER_LOCK 0x8000"
.LASF123:
	.string	"__INT_LEAST64_WIDTH__ 64"
.LASF52:
	.string	"__INT64_TYPE__ long int"
.LASF575:
	.string	"__ULONGWORD_TYPE unsigned long int"
.LASF320:
	.string	"__GCC_ATOMIC_TEST_AND_SET_TRUEVAL 1"
.LASF725:
	.string	"_markers"
.LASF620:
	.string	"__CPU_MASK_TYPE __SYSCALL_ULONG_TYPE"
.LASF359:
	.string	"__ELF__ 1"
.LASF643:
	.string	"_VA_LIST_DEFINED "
.LASF82:
	.string	"__WCHAR_MIN__ (-__WCHAR_MAX__ - 1)"
.LASF98:
	.string	"__UINTMAX_MAX__ 0xffffffffffffffffUL"
.LASF658:
	.string	"FILENAME_MAX 4096"
.LASF199:
	.string	"__LDBL_HAS_INFINITY__ 1"
.LASF455:
	.string	"__glibc_objsize0(__o) __bos0 (__o)"
.LASF286:
	.string	"__DEC32_MAX__ 9.999999E96DF"
.LASF622:
	.string	"__INO_T_MATCHES_INO64_T 1"
.LASF255:
	.string	"__FLT32X_MAX_10_EXP__ 308"
.LASF540:
	.string	"__GLIBC_USE_IEC_60559_FUNCS_EXT_C2X 0"
.LASF568:
	.string	"__GNUC_VA_LIST "
.LASF459:
	.string	"__glibc_safe_or_unknown_len(__l,__s,__osz) (__glibc_unsigned_or_positive (__l) && __builtin_constant_p (__glibc_safe_len_cond ((__SIZE_TYPE__) (__l), __s, __osz)) && __glibc_safe_len_cond ((__SIZE_TYPE__) (__l), __s, __osz))"
.LASF749:
	.string	"printf"
.LASF102:
	.string	"__SIG_ATOMIC_MIN__ (-__SIG_ATOMIC_MAX__ - 1)"
.LASF124:
	.string	"__UINT_LEAST8_MAX__ 0xff"
.LASF623:
	.string	"__RLIM_T_MATCHES_RLIM64_T 1"
.LASF279:
	.string	"__FLT64X_HAS_INFINITY__ 1"
.LASF655:
	.string	"_BITS_STDIO_LIM_H 1"
.LASF747:
	.string	"pclose"
.LASF176:
	.string	"__DBL_MAX__ ((double)1.79769313486231570814527423731704357e+308L)"
.LASF533:
	.string	"__GLIBC_USE_IEC_60559_BFP_EXT_C2X"
.LASF474:
	.string	"__attribute_alloc_align__(param) __attribute__ ((__alloc_align__ param))"
.LASF656:
	.string	"L_tmpnam 20"
.LASF631:
	.string	"____mbstate_t_defined 1"
.LASF117:
	.string	"__INT_LEAST16_WIDTH__ 16"
.LASF151:
	.string	"__DEC_EVAL_METHOD__ 2"
.LASF710:
	.string	"__off_t"
.LASF295:
	.string	"__DEC64_SUBNORMAL_MIN__ 0.000000000000001E-383DD"
.LASF534:
	.string	"__GLIBC_USE_IEC_60559_BFP_EXT_C2X 0"
.LASF564:
	.string	"NULL ((void *)0)"
.LASF457:
	.string	"__glibc_safe_len_cond(__l,__s,__osz) ((__l) <= (__osz) / (__s))"
.LASF484:
	.string	"__attribute_nonnull__(params) __attribute__ ((__nonnull__ params))"
.LASF734:
	.string	"_offset"
.LASF149:
	.string	"__FLT_EVAL_METHOD__ 0"
.LASF416:
	.string	"__USE_POSIX199506 1"
.LASF60:
	.string	"__INT_LEAST64_TYPE__ long int"
.LASF419:
	.string	"_ATFILE_SOURCE"
.LASF580:
	.string	"__SLONG32_TYPE int"
.LASF675:
	.string	"__HAVE_FLOAT16 0"
.LASF112:
	.string	"__INT_LEAST8_MAX__ 0x7f"
.LASF601:
	.string	"__BLKCNT_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF681:
	.string	"__HAVE_DISTINCT_FLOAT32 0"
.LASF11:
	.string	"__ATOMIC_ACQUIRE 2"
.LASF369:
	.string	"__GLIBC_INTERNAL_STARTING_HEADER_IMPLEMENTATION"
.LASF371:
	.string	"__USE_ISOC11"
.LASF423:
	.string	"__SYSCALL_WORDSIZE 64"
.LASF254:
	.string	"__FLT32X_MAX_EXP__ 1024"
.LASF531:
	.string	"__GLIBC_USE_IEC_60559_BFP_EXT"
.LASF348:
	.string	"__MMX_WITH_SSE__ 1"
.LASF166:
	.string	"__FLT_HAS_INFINITY__ 1"
.LASF364:
	.string	"__STDC_IEC_559_COMPLEX__ 1"
.LASF104:
	.string	"__INT8_MAX__ 0x7f"
.LASF603:
	.string	"__FSBLKCNT_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF323:
	.string	"__GCC_HAVE_DWARF2_CFI_ASM 1"
.LASF569:
	.string	"_BITS_TYPES_H 1"
.LASF441:
	.string	"__LEAF_ATTR __attribute__ ((__leaf__))"
.LASF148:
	.string	"__GCC_IEC_559_COMPLEX 2"
.LASF17:
	.string	"__pie__ 2"
.LASF54:
	.string	"__UINT16_TYPE__ short unsigned int"
.LASF409:
	.string	"_POSIX_SOURCE"
.LASF407:
	.string	"__USE_ISOC95 1"
.LASF513:
	.string	"__glibc_macro_warning(message) __glibc_macro_warning1 (GCC warning message)"
.LASF196:
	.string	"__LDBL_EPSILON__ 1.08420217248550443400745280086994171e-19L"
.LASF728:
	.string	"_flags2"
.LASF549:
	.string	"_T_SIZE_ "
.LASF150:
	.string	"__FLT_EVAL_METHOD_TS_18661_3__ 0"
.LASF461:
	.string	"__glibc_fortify(f,__l,__s,__osz,...) (__glibc_safe_or_unknown_len (__l, __s, __osz) ? __ ## f ## _alias (__VA_ARGS__) : (__glibc_unsafe_len (__l, __s, __osz) ? __ ## f ## _chk_warn (__VA_ARGS__, __osz) : __ ## f ## _chk (__VA_ARGS__, __osz)))"
.LASF766:
	.string	"voltage"
.LASF466:
	.string	"__glibc_c99_flexarr_available 1"
.LASF716:
	.string	"_IO_read_base"
.LASF340:
	.string	"__k8__ 1"
.LASF20:
	.string	"_LP64 1"
.LASF133:
	.string	"__INT_FAST8_WIDTH__ 8"
.LASF240:
	.string	"__FLT128_DECIMAL_DIG__ 36"
.LASF442:
	.string	"__THROW __attribute__ ((__nothrow__ __LEAF))"
.LASF544:
	.string	"__need_NULL "
.LASF370:
	.string	"_FEATURES_H 1"
.LASF403:
	.string	"_DEFAULT_SOURCE 1"
.LASF741:
	.string	"_unused2"
.LASF202:
	.string	"__FLT32_MANT_DIG__ 24"
.LASF504:
	.string	"__LDBL_REDIR1(name,proto,alias) name proto"
.LASF386:
	.string	"__USE_LARGEFILE"
.LASF478:
	.string	"__attribute_used__ __attribute__ ((__used__))"
.LASF313:
	.string	"__GCC_ATOMIC_CHAR16_T_LOCK_FREE 2"
.LASF686:
	.string	"__HAVE_FLOAT128_UNLIKE_LDBL (__HAVE_DISTINCT_FLOAT128 && __LDBL_MANT_DIG__ != 113)"
.LASF585:
	.string	"_BITS_TYPESIZES_H 1"
.LASF777:
	.string	"filepath"
.LASF262:
	.string	"__FLT32X_HAS_DENORM__ 1"
.LASF153:
	.string	"__FLT_MANT_DIG__ 24"
.LASF694:
	.string	"__CFLOAT32X _Complex _Float32x"
.LASF438:
	.string	"__glibc_has_builtin(name) __has_builtin (name)"
.LASF96:
	.string	"__INTMAX_MAX__ 0x7fffffffffffffffL"
.LASF770:
	.string	"temp_total"
.LASF227:
	.string	"__FLT64_MIN__ 2.22507385850720138309023271733240406e-308F64"
.LASF729:
	.string	"_old_offset"
.LASF390:
	.string	"__USE_ATFILE"
.LASF343:
	.string	"__SSE__ 1"
.LASF100:
	.string	"__INTMAX_WIDTH__ 64"
.LASF192:
	.string	"__LDBL_DECIMAL_DIG__ 21"
.LASF5:
	.string	"__GNUC__ 11"
.LASF310:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 1"
.LASF621:
	.string	"__OFF_T_MATCHES_OFF64_T 1"
.LASF246:
	.string	"__FLT128_HAS_DENORM__ 1"
.LASF118:
	.string	"__INT_LEAST32_MAX__ 0x7fffffff"
.LASF506:
	.string	"__LDBL_REDIR1_NTH(name,proto,alias) name proto __THROW"
.LASF376:
	.string	"__USE_POSIX2"
.LASF318:
	.string	"__GCC_ATOMIC_LONG_LOCK_FREE 2"
.LASF265:
	.string	"__FLT32X_IS_IEC_60559__ 2"
.LASF756:
	.string	"sample_count"
.LASF562:
	.string	"__need_size_t"
.LASF552:
	.string	"_SIZE_T_ "
.LASF152:
	.string	"__FLT_RADIX__ 2"
.LASF47:
	.string	"__CHAR32_TYPE__ unsigned int"
.LASF515:
	.string	"__attr_access(x) __attribute__ ((__access__ x))"
.LASF520:
	.string	"__attribute_returns_twice__ __attribute__ ((__returns_twice__))"
.LASF197:
	.string	"__LDBL_DENORM_MIN__ 3.64519953188247460252840593361941982e-4951L"
.LASF331:
	.string	"__amd64__ 1"
.LASF91:
	.string	"__LONG_LONG_WIDTH__ 64"
.LASF16:
	.string	"__PIC__ 2"
.LASF666:
	.string	"__attr_dealloc_fclose __attr_dealloc (fclose, 1)"
.LASF134:
	.string	"__INT_FAST16_MAX__ 0x7fffffffffffffffL"
.LASF737:
	.string	"_freeres_list"
.LASF319:
	.string	"__GCC_ATOMIC_LLONG_LOCK_FREE 2"
.LASF462:
	.ascii	"__glibc_"
	.string	"fortify_n(f,__l,__s,__osz,...) (__glibc_safe_or_unknown_len (__l, __s, __osz) ? __ ## f ## _alias (__VA_ARGS__) : (__glibc_unsafe_len (__l, __s, __osz) ? __ ## f ## _chk_warn (__VA_ARGS__, (__osz) / (__s)) : __ ## f ## _chk (__VA_ARGS__, (__osz) / (__s))))"
.LASF501:
	.string	"__attribute_copy__"
.LASF222:
	.string	"__FLT64_MAX_EXP__ 1024"
.LASF773:
	.string	"double"
.LASF136:
	.string	"__INT_FAST32_MAX__ 0x7fffffffffffffffL"
.LASF89:
	.string	"__INT_WIDTH__ 32"
.LASF445:
	.string	"__NTHNL(fct) __attribute__ ((__nothrow__)) fct"
.LASF45:
	.string	"__UINTMAX_TYPE__ long unsigned int"
.LASF719:
	.string	"_IO_write_end"
.LASF30:
	.string	"__CHAR_BIT__ 8"
.LASF482:
	.string	"__attribute_format_arg__(x) __attribute__ ((__format_arg__ (x)))"
.LASF327:
	.string	"__SIZEOF_WCHAR_T__ 4"
.LASF132:
	.string	"__INT_FAST8_MAX__ 0x7f"
.LASF500:
	.string	"__attribute_nonstring__ __attribute__ ((__nonstring__))"
.LASF436:
	.string	"__PMT"
.LASF325:
	.string	"__SSP_STRONG__ 3"
.LASF672:
	.string	"__f128(x) x ##f128"
.LASF142:
	.string	"__UINT_FAST32_MAX__ 0xffffffffffffffffUL"
.LASF607:
	.string	"__ID_T_TYPE __U32_TYPE"
.LASF420:
	.string	"_ATFILE_SOURCE 1"
.LASF576:
	.string	"__SQUAD_TYPE long int"
.LASF659:
	.string	"L_ctermid 9"
.LASF35:
	.string	"__BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__"
.LASF119:
	.string	"__INT32_C(c) c"
.LASF258:
	.string	"__FLT32X_NORM_MAX__ 1.79769313486231570814527423731704357e+308F32x"
.LASF42:
	.string	"__WCHAR_TYPE__ int"
.LASF74:
	.string	"__UINTPTR_TYPE__ long unsigned int"
.LASF393:
	.string	"__USE_FORTIFY_LEVEL"
.LASF517:
	.string	"__attr_access_none(argno) __attribute__ ((__access__ (__none__, argno)))"
.LASF650:
	.string	"EOF (-1)"
.LASF304:
	.string	"__USER_LABEL_PREFIX__ "
.LASF12:
	.string	"__ATOMIC_RELEASE 3"
.LASF277:
	.string	"__FLT64X_DENORM_MIN__ 3.64519953188247460252840593361941982e-4951F64x"
.LASF339:
	.string	"__k8 1"
.LASF641:
	.string	"__ferror_unlocked_body(_fp) (((_fp)->_flags & _IO_ERR_SEEN) != 0)"
.LASF512:
	.string	"__glibc_macro_warning1(message) _Pragma (#message)"
.LASF720:
	.string	"_IO_buf_base"
.LASF788:
	.string	"__isoc99_fscanf"
.LASF24:
	.string	"__SIZEOF_LONG_LONG__ 8"
.LASF63:
	.string	"__UINT_LEAST32_TYPE__ unsigned int"
.LASF703:
	.string	"unsigned int"
.LASF67:
	.string	"__INT_FAST32_TYPE__ long int"
.LASF155:
	.string	"__FLT_MIN_EXP__ (-125)"
.LASF232:
	.string	"__FLT64_HAS_QUIET_NAN__ 1"
.LASF437:
	.string	"__glibc_has_attribute(attr) __has_attribute (attr)"
.LASF43:
	.string	"__WINT_TYPE__ unsigned int"
.LASF389:
	.string	"__USE_MISC"
.LASF257:
	.string	"__FLT32X_MAX__ 1.79769313486231570814527423731704357e+308F32x"
.LASF230:
	.string	"__FLT64_HAS_DENORM__ 1"
.LASF154:
	.string	"__FLT_DIG__ 6"
.LASF363:
	.string	"__STDC_IEC_60559_BFP__ 201404L"
.LASF417:
	.string	"__USE_XOPEN2K 1"
.LASF405:
	.string	"__USE_ISOC11 1"
.LASF614:
	.string	"__KEY_T_TYPE __S32_TYPE"
.LASF160:
	.string	"__FLT_MAX__ 3.40282346638528859811704183484516925e+38F"
.LASF76:
	.string	"__SCHAR_MAX__ 0x7f"
.LASF739:
	.string	"__pad5"
.LASF573:
	.string	"__U32_TYPE unsigned int"
.LASF90:
	.string	"__LONG_WIDTH__ 64"
.LASF473:
	.string	"__attribute_alloc_size__(params) __attribute__ ((__alloc_size__ params))"
.LASF239:
	.string	"__FLT128_MAX_10_EXP__ 4932"
.LASF251:
	.string	"__FLT32X_DIG__ 15"
.LASF147:
	.string	"__GCC_IEC_559 2"
.LASF477:
	.string	"__attribute_maybe_unused__ __attribute__ ((__unused__))"
.LASF499:
	.string	"__glibc_likely(cond) __builtin_expect ((cond), 1)"
.LASF524:
	.string	"__stub_gtty "
.LASF0:
	.string	"__STDC__ 1"
.LASF329:
	.string	"__SIZEOF_PTRDIFF_T__ 8"
.LASF610:
	.string	"__USECONDS_T_TYPE __U32_TYPE"
.LASF36:
	.string	"__FLOAT_WORD_ORDER__ __ORDER_LITTLE_ENDIAN__"
.LASF53:
	.string	"__UINT8_TYPE__ unsigned char"
.LASF587:
	.string	"__SYSCALL_ULONG_TYPE __ULONGWORD_TYPE"
.LASF488:
	.string	"__wur "
.LASF48:
	.string	"__SIG_ATOMIC_TYPE__ int"
.LASF88:
	.string	"__SHRT_WIDTH__ 16"
.LASF296:
	.string	"__DEC128_MANT_DIG__ 34"
.LASF713:
	.string	"_flags"
.LASF579:
	.string	"__UWORD_TYPE unsigned long int"
.LASF341:
	.string	"__code_model_small__ 1"
.LASF625:
	.string	"__KERNEL_OLD_TIMEVAL_MATCHES_TIMEVAL64 1"
.LASF431:
	.string	"__GNU_LIBRARY__ 6"
.LASF589:
	.string	"__UID_T_TYPE __U32_TYPE"
.LASF252:
	.string	"__FLT32X_MIN_EXP__ (-1021)"
.LASF312:
	.string	"__GCC_ATOMIC_CHAR_LOCK_FREE 2"
.LASF740:
	.string	"_mode"
.LASF596:
	.string	"__OFF_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF443:
	.string	"__THROWNL __attribute__ ((__nothrow__))"
.LASF505:
	.string	"__LDBL_REDIR(name,proto) name proto"
.LASF106:
	.string	"__INT32_MAX__ 0x7fffffff"
.LASF449:
	.string	"__STRING(x) #x"
.LASF704:
	.string	"unsigned char"
.LASF502:
	.string	"__attribute_copy__(arg) __attribute__ ((__copy__ (arg)))"
.LASF685:
	.string	"__HAVE_DISTINCT_FLOAT128X __HAVE_FLOAT128X"
.LASF735:
	.string	"_codecvt"
.LASF565:
	.string	"__need_NULL"
.LASF205:
	.string	"__FLT32_MIN_10_EXP__ (-37)"
.LASF415:
	.string	"__USE_POSIX199309 1"
.LASF759:
	.string	"previous_min_value"
.LASF679:
	.string	"__HAVE_FLOAT128X 0"
.LASF164:
	.string	"__FLT_DENORM_MIN__ 1.40129846432481707092372958328991613e-45F"
.LASF282:
	.string	"__DEC32_MANT_DIG__ 7"
.LASF525:
	.string	"__stub_revoke "
.LASF712:
	.string	"char"
.LASF444:
	.string	"__NTH(fct) __attribute__ ((__nothrow__ __LEAF)) fct"
.LASF511:
	.string	"__REDIRECT_NTH_LDBL(name,proto,alias) __REDIRECT_NTH (name, proto, alias)"
.LASF547:
	.string	"_SIZE_T "
.LASF284:
	.string	"__DEC32_MAX_EXP__ 97"
.LASF767:
	.string	"power"
.LASF633:
	.string	"____FILE_defined 1"
.LASF80:
	.string	"__LONG_LONG_MAX__ 0x7fffffffffffffffLL"
.LASF93:
	.string	"__WINT_WIDTH__ 32"
.LASF470:
	.string	"__ASMNAME(cname) __ASMNAME2 (__USER_LABEL_PREFIX__, cname)"
.LASF598:
	.string	"__PID_T_TYPE __S32_TYPE"
.LASF280:
	.string	"__FLT64X_HAS_QUIET_NAN__ 1"
.LASF235:
	.string	"__FLT128_DIG__ 33"
.LASF113:
	.string	"__INT8_C(c) c"
.LASF209:
	.string	"__FLT32_MAX__ 3.40282346638528859811704183484516925e+38F32"
.LASF705:
	.string	"short unsigned int"
.LASF171:
	.string	"__DBL_MIN_EXP__ (-1021)"
.LASF551:
	.string	"__SIZE_T "
.LASF742:
	.string	"FILE"
.LASF51:
	.string	"__INT32_TYPE__ int"
.LASF700:
	.string	"BUFSIZE 64"
.LASF289:
	.string	"__DEC64_MANT_DIG__ 16"
.LASF314:
	.string	"__GCC_ATOMIC_CHAR32_T_LOCK_FREE 2"
.LASF618:
	.string	"__FSID_T_TYPE struct { int __val[2]; }"
.LASF373:
	.string	"__USE_ISOC95"
.LASF701:
	.string	"POLL_INTERVAL_S 1"
.LASF638:
	.string	"_IO_EOF_SEEN 0x0010"
.LASF779:
	.string	"read_string"
.LASF380:
	.string	"__USE_XOPEN_EXTENDED"
.LASF671:
	.string	"__HAVE_FLOAT64X_LONG_DOUBLE 1"
.LASF198:
	.string	"__LDBL_HAS_DENORM__ 1"
.LASF322:
	.string	"__HAVE_SPECULATION_SAFE_VALUE 1"
.LASF309:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 1"
.LASF259:
	.string	"__FLT32X_MIN__ 2.22507385850720138309023271733240406e-308F32x"
.LASF451:
	.string	"__BEGIN_DECLS "
.LASF367:
	.string	"_STDIO_H 1"
.LASF485:
	.string	"__nonnull(params) __attribute_nonnull__ (params)"
.LASF247:
	.string	"__FLT128_HAS_INFINITY__ 1"
.LASF233:
	.string	"__FLT64_IS_IEC_60559__ 2"
.LASF32:
	.string	"__ORDER_LITTLE_ENDIAN__ 1234"
.LASF617:
	.string	"__BLKSIZE_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF266:
	.string	"__FLT64X_MANT_DIG__ 64"
.LASF684:
	.string	"__HAVE_DISTINCT_FLOAT64X 0"
.LASF77:
	.string	"__SHRT_MAX__ 0x7fff"
.LASF201:
	.string	"__LDBL_IS_IEC_60559__ 2"
.LASF374:
	.string	"__USE_ISOCXX11"
.LASF555:
	.string	"_SIZE_T_DEFINED "
.LASF83:
	.string	"__WINT_MAX__ 0xffffffffU"
.LASF760:
	.string	"runtime_avg"
.LASF645:
	.string	"__ssize_t_defined "
.LASF583:
	.string	"__U64_TYPE unsigned long int"
.LASF273:
	.string	"__FLT64X_MAX__ 1.18973149535723176502126385303097021e+4932F64x"
.LASF73:
	.string	"__INTPTR_TYPE__ long int"
.LASF702:
	.string	"long unsigned int"
.LASF677:
	.string	"__HAVE_FLOAT64 1"
.LASF412:
	.string	"_POSIX_C_SOURCE 200809L"
.LASF62:
	.string	"__UINT_LEAST16_TYPE__ short unsigned int"
.LASF46:
	.string	"__CHAR16_TYPE__ short unsigned int"
.LASF281:
	.string	"__FLT64X_IS_IEC_60559__ 2"
.LASF754:
	.string	"previous_max_value"
.LASF481:
	.string	"__attribute_deprecated_msg__(msg) __attribute__ ((__deprecated__ (msg)))"
.LASF378:
	.string	"__USE_POSIX199506"
.LASF682:
	.string	"__HAVE_DISTINCT_FLOAT64 0"
.LASF144:
	.string	"__INTPTR_MAX__ 0x7fffffffffffffffL"
.LASF19:
	.string	"__FINITE_MATH_ONLY__ 0"
.LASF738:
	.string	"_freeres_buf"
.LASF653:
	.string	"SEEK_END 2"
.LASF69:
	.string	"__UINT_FAST8_TYPE__ unsigned char"
.LASF421:
	.string	"__WORDSIZE 64"
.LASF326:
	.string	"__SIZEOF_INT128__ 16"
.LASF15:
	.string	"__pic__ 2"
.LASF528:
	.string	"__stub_stty "
.LASF41:
	.string	"__PTRDIFF_TYPE__ long int"
.LASF288:
	.string	"__DEC32_SUBNORMAL_MIN__ 0.000001E-95DF"
.LASF463:
	.string	"__warnattr(msg) __attribute__((__warning__ (msg)))"
.LASF762:
	.string	"samples_cumulative"
.LASF121:
	.string	"__INT_LEAST64_MAX__ 0x7fffffffffffffffL"
.LASF582:
	.string	"__S64_TYPE long int"
.LASF516:
	.string	"__fortified_attr_access(a,o,s) __attr_access ((a, o, s))"
.LASF553:
	.string	"_BSD_SIZE_T_ "
.LASF454:
	.string	"__bos0(ptr) __builtin_object_size (ptr, 0)"
.LASF342:
	.string	"__MMX__ 1"
.LASF778:
	.string	"moving_average"
.LASF572:
	.string	"__S32_TYPE int"
.LASF86:
	.string	"__SIZE_MAX__ 0xffffffffffffffffUL"
.LASF723:
	.string	"_IO_backup_base"
.LASF732:
	.string	"_shortbuf"
.LASF131:
	.string	"__UINT64_C(c) c ## UL"
.LASF530:
	.string	"__GLIBC_USE_LIB_EXT2 0"
.LASF168:
	.string	"__FLT_IS_IEC_60559__ 2"
.LASF426:
	.string	"__USE_ATFILE 1"
.LASF178:
	.string	"__DBL_MIN__ ((double)2.22507385850720138309023271733240406e-308L)"
.LASF667:
	.string	"_BITS_FLOATN_H "
.LASF648:
	.string	"_IONBF 2"
.LASF644:
	.string	"__off_t_defined "
.LASF81:
	.string	"__WCHAR_MAX__ 0x7fffffff"
.LASF711:
	.string	"__off64_t"
.LASF59:
	.string	"__INT_LEAST32_TYPE__ int"
.LASF276:
	.string	"__FLT64X_EPSILON__ 1.08420217248550443400745280086994171e-19F64x"
.LASF6:
	.string	"__GNUC_MINOR__ 4"
.LASF188:
	.string	"__LDBL_MIN_10_EXP__ (-4931)"
.LASF200:
	.string	"__LDBL_HAS_QUIET_NAN__ 1"
.LASF317:
	.string	"__GCC_ATOMIC_INT_LOCK_FREE 2"
.LASF753:
	.string	"fopen"
.LASF670:
	.string	"__HAVE_FLOAT64X 1"
.LASF783:
	.string	"/home/jscha/dvp/cpumon/src/utils.c"
.LASF260:
	.string	"__FLT32X_EPSILON__ 2.22044604925031308084726333618164062e-16F32x"
.LASF522:
	.string	"__stub_chflags "
.LASF639:
	.string	"__feof_unlocked_body(_fp) (((_fp)->_flags & _IO_EOF_SEEN) != 0)"
.LASF392:
	.string	"__USE_GNU"
.LASF560:
	.string	"_SIZET_ "
.LASF769:
	.string	"load_total"
.LASF616:
	.string	"__TIMER_T_TYPE void *"
.LASF183:
	.string	"__DBL_HAS_QUIET_NAN__ 1"
.LASF275:
	.string	"__FLT64X_MIN__ 3.36210314311209350626267781732175260e-4932F64x"
.LASF344:
	.string	"__SSE2__ 1"
.LASF245:
	.string	"__FLT128_DENORM_MIN__ 6.47517511943802511092443895822764655e-4966F128"
.LASF721:
	.string	"_IO_buf_end"
.LASF772:
	.string	"power_total"
.LASF609:
	.string	"__TIME_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF510:
	.string	"__REDIRECT_LDBL(name,proto,alias) __REDIRECT (name, proto, alias)"
.LASF674:
	.string	"_BITS_FLOATN_COMMON_H "
.LASF493:
	.string	"__extern_always_inline extern __always_inline __attribute__ ((__gnu_inline__))"
.LASF303:
	.string	"__REGISTER_PREFIX__ "
.LASF302:
	.string	"__DEC128_SUBNORMAL_MIN__ 0.000000000000000000000000000000001E-6143DL"
.LASF170:
	.string	"__DBL_DIG__ 15"
.LASF688:
	.string	"__f32(x) x ##f32"
.LASF483:
	.string	"__attribute_format_strfmon__(a,b) __attribute__ ((__format__ (__strfmon__, a, b)))"
.LASF29:
	.string	"__SIZEOF_SIZE_T__ 8"
.LASF755:
	.string	"sample_next"
.LASF228:
	.string	"__FLT64_EPSILON__ 2.22044604925031308084726333618164062e-16F64"
.LASF452:
	.string	"__END_DECLS "
.LASF350:
	.string	"__SEG_GS 1"
.LASF360:
	.string	"__DECIMAL_BID_FORMAT__ 1"
.LASF660:
	.string	"FOPEN_MAX"
.LASF425:
	.string	"__USE_MISC 1"
.LASF337:
	.string	"__ATOMIC_HLE_RELEASE 131072"
.LASF699:
	.string	"POWER_LIMIT_COUNT 2"
.LASF632:
	.string	"_____fpos64_t_defined 1"
.LASF111:
	.string	"__UINT64_MAX__ 0xffffffffffffffffUL"
.LASF334:
	.string	"__SIZEOF_FLOAT80__ 16"
.LASF346:
	.string	"__SSE_MATH__ 1"
.LASF707:
	.string	"short int"
.LASF435:
	.string	"_SYS_CDEFS_H 1"
.LASF127:
	.string	"__UINT16_C(c) c"
.LASF401:
	.string	"__GLIBC_USE(F) __GLIBC_USE_ ## F"
.LASF496:
	.string	"__va_arg_pack_len() __builtin_va_arg_pack_len ()"
.LASF649:
	.string	"BUFSIZ 8192"
.LASF768:
	.string	"freq_total"
.LASF782:
	.string	"GNU C17 11.4.0 -masm=intel -mtune=generic -march=x86-64 -g -g -ggdb3 -gdwarf-2 -O0 -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection"
.LASF270:
	.string	"__FLT64X_MAX_EXP__ 16384"
.LASF9:
	.string	"__ATOMIC_RELAXED 0"
.LASF471:
	.string	"__ASMNAME2(prefix,cname) __STRING (prefix) cname"
.LASF210:
	.string	"__FLT32_NORM_MAX__ 3.40282346638528859811704183484516925e+38F32"
.LASF182:
	.string	"__DBL_HAS_INFINITY__ 1"
.LASF101:
	.string	"__SIG_ATOMIC_MAX__ 0x7fffffff"
.LASF218:
	.string	"__FLT64_MANT_DIG__ 53"
.LASF70:
	.string	"__UINT_FAST16_TYPE__ long unsigned int"
.LASF66:
	.string	"__INT_FAST16_TYPE__ long int"
.LASF508:
	.string	"__LDBL_REDIR2_DECL(name) "
.LASF698:
	.string	"BATTERY_STATUS_BUF_SIZE 20"
.LASF577:
	.string	"__UQUAD_TYPE unsigned long int"
.LASF26:
	.string	"__SIZEOF_FLOAT__ 4"
.LASF536:
	.string	"__GLIBC_USE_IEC_60559_EXT 0"
.LASF292:
	.string	"__DEC64_MIN__ 1E-383DD"
.LASF731:
	.string	"_vtable_offset"
.LASF175:
	.string	"__DBL_DECIMAL_DIG__ 17"
.LASF519:
	.string	"__attr_dealloc_free __attr_dealloc (__builtin_free, 1)"
.LASF469:
	.string	"__REDIRECT_NTHNL(name,proto,alias) name proto __asm__ (__ASMNAME (#alias)) __THROWNL"
.LASF594:
	.string	"__NLINK_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF177:
	.string	"__DBL_NORM_MAX__ ((double)1.79769313486231570814527423731704357e+308L)"
.LASF105:
	.string	"__INT16_MAX__ 0x7fff"
.LASF472:
	.string	"__attribute_malloc__ __attribute__ ((__malloc__))"
.LASF578:
	.string	"__SWORD_TYPE long int"
.LASF663:
	.string	"stdout stdout"
.LASF480:
	.string	"__attribute_deprecated__ __attribute__ ((__deprecated__))"
.LASF234:
	.string	"__FLT128_MANT_DIG__ 113"
.LASF647:
	.string	"_IOLBF 1"
.LASF413:
	.string	"__USE_POSIX 1"
.LASF789:
	.string	"perror"
.LASF665:
	.string	"__attr_dealloc_fclose"
.LASF518:
	.string	"__attr_dealloc(dealloc,argno) __attribute__ ((__malloc__ (dealloc, argno)))"
.LASF690:
	.string	"__f32x(x) x ##f32x"
.LASF194:
	.string	"__LDBL_NORM_MAX__ 1.18973149535723176502126385303097021e+4932L"
.LASF781:
	.string	"single_character"
.LASF285:
	.string	"__DEC32_MIN__ 1E-95DF"
.LASF570:
	.string	"__S16_TYPE short int"
.LASF328:
	.string	"__SIZEOF_WINT_T__ 4"
.LASF487:
	.string	"__attribute_warn_unused_result__ __attribute__ ((__warn_unused_result__))"
.LASF491:
	.string	"__attribute_artificial__ __attribute__ ((__artificial__))"
.LASF214:
	.string	"__FLT32_HAS_DENORM__ 1"
.LASF745:
	.string	"_IO_wide_data"
.LASF56:
	.string	"__UINT64_TYPE__ long unsigned int"
.LASF274:
	.string	"__FLT64X_NORM_MAX__ 1.18973149535723176502126385303097021e+4932F64x"
.LASF28:
	.string	"__SIZEOF_LONG_DOUBLE__ 16"
.LASF507:
	.string	"__LDBL_REDIR_NTH(name,proto) name proto __THROW"
.LASF771:
	.string	"voltage_total"
.LASF612:
	.string	"__SUSECONDS64_T_TYPE __SQUAD_TYPE"
.LASF495:
	.string	"__va_arg_pack() __builtin_va_arg_pack ()"
.LASF599:
	.string	"__RLIM_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF241:
	.string	"__FLT128_MAX__ 1.18973149535723176508575932662800702e+4932F128"
.LASF715:
	.string	"_IO_read_end"
.LASF402:
	.string	"_DEFAULT_SOURCE"
.LASF225:
	.string	"__FLT64_MAX__ 1.79769313486231570814527423731704357e+308F64"
.LASF559:
	.string	"_GCC_SIZE_T "
.LASF79:
	.string	"__LONG_MAX__ 0x7fffffffffffffffL"
.LASF22:
	.string	"__SIZEOF_INT__ 4"
.LASF404:
	.string	"__GLIBC_USE_ISOC2X 0"
.LASF588:
	.string	"__DEV_T_TYPE __UQUAD_TYPE"
.LASF85:
	.string	"__PTRDIFF_MAX__ 0x7fffffffffffffffL"
.LASF146:
	.string	"__UINTPTR_MAX__ 0xffffffffffffffffUL"
.LASF338:
	.string	"__GCC_ASM_FLAG_OUTPUTS__ 1"
.LASF727:
	.string	"_fileno"
.LASF453:
	.string	"__bos(ptr) __builtin_object_size (ptr, __USE_FORTIFY_LEVEL > 1)"
.LASF330:
	.string	"__amd64 1"
.LASF410:
	.string	"_POSIX_SOURCE 1"
.LASF195:
	.string	"__LDBL_MIN__ 3.36210314311209350626267781732175260e-4932L"
.LASF414:
	.string	"__USE_POSIX2 1"
.LASF357:
	.string	"__unix__ 1"
.LASF600:
	.string	"__RLIM64_T_TYPE __UQUAD_TYPE"
.LASF514:
	.string	"__HAVE_GENERIC_SELECTION 1"
.LASF535:
	.string	"__GLIBC_USE_IEC_60559_EXT"
.LASF736:
	.string	"_wide_data"
.LASF186:
	.string	"__LDBL_DIG__ 18"
.LASF592:
	.string	"__INO64_T_TYPE __UQUAD_TYPE"
.LASF84:
	.string	"__WINT_MIN__ 0U"
.LASF593:
	.string	"__MODE_T_TYPE __U32_TYPE"
.LASF219:
	.string	"__FLT64_DIG__ 15"
.LASF294:
	.string	"__DEC64_EPSILON__ 1E-15DD"
.LASF654:
	.string	"P_tmpdir \"/tmp\""
.LASF162:
	.string	"__FLT_MIN__ 1.17549435082228750796873653722224568e-38F"
.LASF114:
	.string	"__INT_LEAST8_WIDTH__ 8"
.LASF58:
	.string	"__INT_LEAST16_TYPE__ short int"
.LASF556:
	.string	"_BSD_SIZE_T_DEFINED_ "
.LASF358:
	.string	"unix 1"
.LASF763:
	.string	"freq"
.LASF746:
	.string	"float"
.LASF215:
	.string	"__FLT32_HAS_INFINITY__ 1"
.LASF538:
	.string	"__GLIBC_USE_IEC_60559_FUNCS_EXT 0"
.LASF354:
	.string	"__linux__ 1"
.LASF427:
	.string	"__USE_FORTIFY_LEVEL 0"
.LASF187:
	.string	"__LDBL_MIN_EXP__ (-16381)"
.LASF542:
	.string	"__GLIBC_USE_IEC_60559_TYPES_EXT 0"
.LASF539:
	.string	"__GLIBC_USE_IEC_60559_FUNCS_EXT_C2X"
.LASF619:
	.string	"__SSIZE_T_TYPE __SWORD_TYPE"
.LASF179:
	.string	"__DBL_EPSILON__ ((double)2.22044604925031308084726333618164062e-16L)"
.LASF567:
	.string	"__need___va_list"
.LASF718:
	.string	"_IO_write_ptr"
.LASF335:
	.string	"__SIZEOF_FLOAT128__ 16"
.LASF128:
	.string	"__UINT_LEAST32_MAX__ 0xffffffffU"
.LASF635:
	.string	"__struct_FILE_defined 1"
.LASF464:
	.string	"__errordecl(name,msg) extern void name (void) __attribute__((__error__ (msg)))"
.LASF695:
	.string	"__CFLOAT64X _Complex _Float64x"
.LASF595:
	.string	"__FSWORD_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF394:
	.string	"__KERNEL_STRICT_NAMES"
.LASF250:
	.string	"__FLT32X_MANT_DIG__ 53"
.LASF92:
	.string	"__WCHAR_WIDTH__ 32"
.LASF765:
	.string	"temp"
.LASF387:
	.string	"__USE_LARGEFILE64"
.LASF636:
	.string	"__getc_unlocked_body(_fp) (__glibc_unlikely ((_fp)->_IO_read_ptr >= (_fp)->_IO_read_end) ? __uflow (_fp) : *(unsigned char *) (_fp)->_IO_read_ptr++)"
.LASF116:
	.string	"__INT16_C(c) c"
.LASF267:
	.string	"__FLT64X_DIG__ 18"
.LASF290:
	.string	"__DEC64_MIN_EXP__ (-382)"
.LASF13:
	.string	"__ATOMIC_ACQ_REL 4"
.LASF145:
	.string	"__INTPTR_WIDTH__ 64"
.LASF353:
	.string	"__linux 1"
.LASF172:
	.string	"__DBL_MIN_10_EXP__ (-307)"
.LASF137:
	.string	"__INT_FAST32_WIDTH__ 64"
.LASF180:
	.string	"__DBL_DENORM_MIN__ ((double)4.94065645841246544176568792868221372e-324L)"
.LASF272:
	.string	"__FLT64X_DECIMAL_DIG__ 21"
.LASF529:
	.string	"__GLIBC_USE_LIB_EXT2"
.LASF624:
	.string	"__STATFS_MATCHES_STATFS64 1"
.LASF411:
	.string	"_POSIX_C_SOURCE"
.LASF169:
	.string	"__DBL_MANT_DIG__ 53"
.LASF697:
	.string	"AVG_WINDOW 60"
.LASF498:
	.string	"__glibc_unlikely(cond) __builtin_expect ((cond), 0)"
.LASF78:
	.string	"__INT_MAX__ 0x7fffffff"
.LASF130:
	.string	"__UINT_LEAST64_MAX__ 0xffffffffffffffffUL"
.LASF109:
	.string	"__UINT16_MAX__ 0xffff"
.LASF657:
	.string	"TMP_MAX 238328"
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
