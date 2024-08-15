	.file	"sysfs.c"
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
	.string	"/proc/cpuinfo"
	.align 8
.LC2:
	.string	"Error opening file /proc/cpuinfo"
.LC3:
	.string	"model name"
.LC4:
	.string	"%*s%*s%*s%*s%*s%*s%*s%s"
	.text
	.globl	identifiy_cpu
	.type	identifiy_cpu, @function
identifiy_cpu:
.LFB6:
	.file 1 "/home/jscha/dvp/cpumon/src/sysfs.c"
	.loc 1 14 1
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
# /home/jscha/dvp/cpumon/src/sysfs.c:14: {
	.loc 1 14 1
	mov	rax, QWORD PTR fs:40	# tmp100, MEM[(<address-space-1> long unsigned int *)40B]
	mov	QWORD PTR -8[rbp], rax	# D.4786, tmp100
	xor	eax, eax	# tmp100
# /home/jscha/dvp/cpumon/src/sysfs.c:15:     FILE *fp = fopen("/proc/cpuinfo", "r");
	.loc 1 15 16
	lea	rax, .LC0[rip]	# tmp85,
	mov	rsi, rax	#, tmp85
	lea	rax, .LC1[rip]	# tmp86,
	mov	rdi, rax	#, tmp86
	call	fopen@PLT	#
	mov	QWORD PTR -8232[rbp], rax	# fp, tmp87
# /home/jscha/dvp/cpumon/src/sysfs.c:16:     if (fp == NULL) {
	.loc 1 16 8
	cmp	QWORD PTR -8232[rbp], 0	# fp,
	jne	.L2	#,
# /home/jscha/dvp/cpumon/src/sysfs.c:17:         perror("Error opening file /proc/cpuinfo");
	.loc 1 17 9
	lea	rax, .LC2[rip]	# tmp88,
	mov	rdi, rax	#, tmp88
	call	perror@PLT	#
# /home/jscha/dvp/cpumon/src/sysfs.c:18:         return (NULL);
	.loc 1 18 16
	mov	eax, 0	# _2,
	jmp	.L8	#
.L2:
# /home/jscha/dvp/cpumon/src/sysfs.c:22:     char *model = malloc ((sizeof *model) * 15);
	.loc 1 22 19
	mov	edi, 15	#,
	call	malloc@PLT	#
	mov	QWORD PTR -8224[rbp], rax	# model, tmp89
.L7:
# /home/jscha/dvp/cpumon/src/sysfs.c:27:         line = fgets(file_buf, BUFSIZ, fp);
	.loc 1 27 16
	mov	rdx, QWORD PTR -8232[rbp]	# tmp90, fp
	lea	rax, -8208[rbp]	# tmp91,
	mov	esi, 8192	#,
	mov	rdi, rax	#, tmp91
	call	fgets@PLT	#
	mov	QWORD PTR -8216[rbp], rax	# line, tmp92
# /home/jscha/dvp/cpumon/src/sysfs.c:28:         if (line == NULL) break;
	.loc 1 28 12
	cmp	QWORD PTR -8216[rbp], 0	# line,
	je	.L10	#,
# /home/jscha/dvp/cpumon/src/sysfs.c:30:         if(!strncmp(line, "model name", 10)) {
	.loc 1 30 13
	mov	rax, QWORD PTR -8216[rbp]	# tmp93, line
	mov	edx, 10	#,
	lea	rcx, .LC3[rip]	# tmp94,
	mov	rsi, rcx	#, tmp94
	mov	rdi, rax	#, tmp93
	call	strncmp@PLT	#
# /home/jscha/dvp/cpumon/src/sysfs.c:30:         if(!strncmp(line, "model name", 10)) {
	.loc 1 30 11
	test	eax, eax	# _1
	jne	.L7	#,
# /home/jscha/dvp/cpumon/src/sysfs.c:31:             sscanf(line,"%*s%*s%*s%*s%*s%*s%*s%s", model);         // every whitespace starts a new string, asterisk = ignore
	.loc 1 31 13
	mov	rdx, QWORD PTR -8224[rbp]	# tmp95, model
	mov	rax, QWORD PTR -8216[rbp]	# tmp96, line
	lea	rcx, .LC4[rip]	# tmp97,
	mov	rsi, rcx	#, tmp97
	mov	rdi, rax	#, tmp96
	mov	eax, 0	#,
	call	__isoc99_sscanf@PLT	#
# /home/jscha/dvp/cpumon/src/sysfs.c:32:             break;
	.loc 1 32 13
	jmp	.L5	#
.L10:
# /home/jscha/dvp/cpumon/src/sysfs.c:28:         if (line == NULL) break;
	.loc 1 28 26
	nop	
.L5:
# /home/jscha/dvp/cpumon/src/sysfs.c:38:     fclose(fp);
	.loc 1 38 5
	mov	rax, QWORD PTR -8232[rbp]	# tmp98, fp
	mov	rdi, rax	#, tmp98
	call	fclose@PLT	#
# /home/jscha/dvp/cpumon/src/sysfs.c:39:     return model;
	.loc 1 39 12
	mov	rax, QWORD PTR -8224[rbp]	# _2, model
.L8:
# /home/jscha/dvp/cpumon/src/sysfs.c:40: }
	.loc 1 40 1 discriminator 1
	mov	rdx, QWORD PTR -8[rbp]	# tmp101, D.4786
	sub	rdx, QWORD PTR fs:40	# tmp101, MEM[(<address-space-1> long unsigned int *)40B]
	je	.L9	#,
# /home/jscha/dvp/cpumon/src/sysfs.c:40: }
	.loc 1 40 1 is_stmt 0
	call	__stack_chk_fail@PLT	#
.L9:
	leave	
.LCFI2:
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE6:
	.size	identifiy_cpu, .-identifiy_cpu
	.section	.rodata
	.align 8
.LC5:
	.string	"/sys/class/powercap/intel-rapl:0/constraint_%d_power_limit_uw"
	.align 8
.LC6:
	.string	"get_sysfs_power_limits filepath %s\n"
.LC7:
	.string	"Error opening file\n"
.LC8:
	.string	"Couldn't read power from %s"
.LC9:
	.string	"%ld"
	.text
	.globl	get_sysfs_power_limits_w
	.type	get_sysfs_power_limits_w, @function
get_sysfs_power_limits_w:
.LFB7:
	.loc 1 43 1 is_stmt 1
	.cfi_startproc
	endbr64	
	push	rbp	#
.LCFI3:
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
.LCFI4:
	.cfi_def_cfa_register 6
	sub	rsp, 368	#,
# /home/jscha/dvp/cpumon/src/sysfs.c:43: {
	.loc 1 43 1
	mov	rax, QWORD PTR fs:40	# tmp120, MEM[(<address-space-1> long unsigned int *)40B]
	mov	QWORD PTR -8[rbp], rax	# D.4793, tmp120
	xor	eax, eax	# tmp120
.LBB2:
# /home/jscha/dvp/cpumon/src/sysfs.c:50:     for ( int i = 0; i < POWER_LIMIT_COUNT; i++) {
	.loc 1 50 15
	mov	DWORD PTR -368[rbp], 0	# i,
# /home/jscha/dvp/cpumon/src/sysfs.c:50:     for ( int i = 0; i < POWER_LIMIT_COUNT; i++) {
	.loc 1 50 5
	jmp	.L12	#
.L15:
# /home/jscha/dvp/cpumon/src/sysfs.c:51:         sprintf(path,"/sys/class/powercap/intel-rapl:0/constraint_%d_power_limit_uw",i);
	.loc 1 51 9
	mov	edx, DWORD PTR -368[rbp]	# tmp89, i
	lea	rax, -272[rbp]	# tmp90,
	lea	rcx, .LC5[rip]	# tmp91,
	mov	rsi, rcx	#, tmp91
	mov	rdi, rax	#, tmp90
	mov	eax, 0	#,
	call	sprintf@PLT	#
# /home/jscha/dvp/cpumon/src/sysfs.c:52:         fp = fopen(path, "r");
	.loc 1 52 14
	lea	rax, -272[rbp]	# tmp92,
	lea	rdx, .LC0[rip]	# tmp93,
	mov	rsi, rdx	#, tmp93
	mov	rdi, rax	#, tmp92
	call	fopen@PLT	#
	mov	QWORD PTR -360[rbp], rax	# fp, tmp94
# /home/jscha/dvp/cpumon/src/sysfs.c:53:         if (fp == NULL) {
	.loc 1 53 12
	cmp	QWORD PTR -360[rbp], 0	# fp,
	jne	.L13	#,
# /home/jscha/dvp/cpumon/src/sysfs.c:55:             printf("get_sysfs_power_limits filepath %s\n", path);
	.loc 1 55 13
	lea	rax, -272[rbp]	# tmp95,
	mov	rsi, rax	#, tmp95
	lea	rax, .LC6[rip]	# tmp96,
	mov	rdi, rax	#, tmp96
	mov	eax, 0	#,
	call	printf@PLT	#
# /home/jscha/dvp/cpumon/src/sysfs.c:57:             perror("Error opening file\n");
	.loc 1 57 13
	lea	rax, .LC7[rip]	# tmp97,
	mov	rdi, rax	#, tmp97
	call	perror@PLT	#
.L13:
# /home/jscha/dvp/cpumon/src/sysfs.c:59:         if (fgets(results,BUFSIZE, fp) == NULL)
	.loc 1 59 13
	mov	rdx, QWORD PTR -360[rbp]	# tmp98, fp
	lea	rax, -336[rbp]	# tmp99,
	mov	esi, 64	#,
	mov	rdi, rax	#, tmp99
	call	fgets@PLT	#
# /home/jscha/dvp/cpumon/src/sysfs.c:59:         if (fgets(results,BUFSIZE, fp) == NULL)
	.loc 1 59 12
	test	rax, rax	# _1
	jne	.L14	#,
# /home/jscha/dvp/cpumon/src/sysfs.c:61:             printf("Couldn't read power from %s", path);
	.loc 1 61 13
	lea	rax, -272[rbp]	# tmp100,
	mov	rsi, rax	#, tmp100
	lea	rax, .LC8[rip]	# tmp101,
	mov	rdi, rax	#, tmp101
	mov	eax, 0	#,
	call	printf@PLT	#
.L14:
# /home/jscha/dvp/cpumon/src/sysfs.c:63:         sscanf(results, "%ld", &power_uw[i]);
	.loc 1 63 9 discriminator 2
	lea	rdx, -352[rbp]	# tmp102,
	mov	eax, DWORD PTR -368[rbp]	# tmp104, i
	cdqe
	sal	rax, 3	# tmp105,
	add	rdx, rax	# _2, tmp105
	lea	rax, -336[rbp]	# tmp106,
	lea	rcx, .LC9[rip]	# tmp107,
	mov	rsi, rcx	#, tmp107
	mov	rdi, rax	#, tmp106
	mov	eax, 0	#,
	call	__isoc99_sscanf@PLT	#
# /home/jscha/dvp/cpumon/src/sysfs.c:64:         fclose(fp);
	.loc 1 64 9 discriminator 2
	mov	rax, QWORD PTR -360[rbp]	# tmp108, fp
	mov	rdi, rax	#, tmp108
	call	fclose@PLT	#
# /home/jscha/dvp/cpumon/src/sysfs.c:50:     for ( int i = 0; i < POWER_LIMIT_COUNT; i++) {
	.loc 1 50 30 discriminator 2
	add	DWORD PTR -368[rbp], 1	# i,
.L12:
# /home/jscha/dvp/cpumon/src/sysfs.c:50:     for ( int i = 0; i < POWER_LIMIT_COUNT; i++) {
	.loc 1 50 24 discriminator 1
	cmp	DWORD PTR -368[rbp], 1	# i,
	jle	.L15	#,
.LBE2:
.LBB3:
# /home/jscha/dvp/cpumon/src/sysfs.c:67:     for (int i = 0; i < POWER_LIMIT_COUNT; i++) {
	.loc 1 67 14
	mov	DWORD PTR -364[rbp], 0	# i,
# /home/jscha/dvp/cpumon/src/sysfs.c:67:     for (int i = 0; i < POWER_LIMIT_COUNT; i++) {
	.loc 1 67 5
	jmp	.L16	#
.L17:
# /home/jscha/dvp/cpumon/src/sysfs.c:68:         power_limits[i] = (int)(power_uw[i]/1000000);
	.loc 1 68 41 discriminator 3
	mov	eax, DWORD PTR -364[rbp]	# tmp110, i
	cdqe
	mov	rcx, QWORD PTR -352[rbp+rax*8]	# _3, power_uw[i_7]
# /home/jscha/dvp/cpumon/src/sysfs.c:68:         power_limits[i] = (int)(power_uw[i]/1000000);
	.loc 1 68 44 discriminator 3
	movabs	rdx, 4835703278458516699	# tmp112,
	mov	rax, rcx	# tmp121, _3
	imul	rdx	# tmp112
	mov	rax, rdx	# tmp111, tmp111
	sar	rax, 18	# tmp111,
	sar	rcx, 63	# _3,
	mov	rdx, rcx	# tmp114, _3
	sub	rax, rdx	# _4, tmp114
# /home/jscha/dvp/cpumon/src/sysfs.c:68:         power_limits[i] = (int)(power_uw[i]/1000000);
	.loc 1 68 27 discriminator 3
	mov	ecx, eax	# _5, _4
# /home/jscha/dvp/cpumon/src/sysfs.c:68:         power_limits[i] = (int)(power_uw[i]/1000000);
	.loc 1 68 25 discriminator 3
	mov	eax, DWORD PTR -364[rbp]	# tmp116, i
	cdqe
	lea	rdx, 0[0+rax*4]	# tmp117,
	lea	rax, power_limits.0[rip]	# tmp118,
	mov	DWORD PTR [rdx+rax], ecx	# power_limits[i_7], _5
# /home/jscha/dvp/cpumon/src/sysfs.c:67:     for (int i = 0; i < POWER_LIMIT_COUNT; i++) {
	.loc 1 67 29 discriminator 3
	add	DWORD PTR -364[rbp], 1	# i,
.L16:
# /home/jscha/dvp/cpumon/src/sysfs.c:67:     for (int i = 0; i < POWER_LIMIT_COUNT; i++) {
	.loc 1 67 23 discriminator 1
	cmp	DWORD PTR -364[rbp], 1	# i,
	jle	.L17	#,
.LBE3:
# /home/jscha/dvp/cpumon/src/sysfs.c:70:     return power_limits;
	.loc 1 70 12
	lea	rax, power_limits.0[rip]	# _15,
# /home/jscha/dvp/cpumon/src/sysfs.c:71: }
	.loc 1 71 1
	mov	rdx, QWORD PTR -8[rbp]	# tmp122, D.4793
	sub	rdx, QWORD PTR fs:40	# tmp122, MEM[(<address-space-1> long unsigned int *)40B]
	je	.L19	#,
	call	__stack_chk_fail@PLT	#
.L19:
	leave	
.LCFI5:
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE7:
	.size	get_sysfs_power_limits_w, .-get_sysfs_power_limits_w
	.section	.rodata
	.align 8
.LC10:
	.string	"Power Limits: \t\tPL1 = %d W, PL2 = %d\n"
	.align 8
.LC11:
	.string	"/sys/devices/system/cpu/intel_pstate/no_turbo"
	.align 8
.LC12:
	.string	"/sys/devices/system/cpu/cpu0/cpufreq/energy_performance_preference"
	.align 8
.LC13:
	.string	"Energy-Performance-Preference: \t%s \n"
	.align 8
.LC14:
	.string	"/sys/devices/system/cpu/cpufreq/policy0/scaling_driver"
.LC15:
	.string	"Scaling Driver: \t\t%s \n"
	.align 8
.LC16:
	.string	"/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor"
	.align 8
.LC17:
	.string	"CPU Frequency Scaling Governor: %s \n"
	.align 8
.LC18:
	.string	"/sys/devices/system/cpu/amd_pstate/prefcore"
.LC19:
	.string	"AMD Preferential Core: \t\t%s \n"
	.text
	.globl	power_config
	.type	power_config, @function
power_config:
.LFB8:
	.loc 1 74 1
	.cfi_startproc
	endbr64	
	push	rbp	#
.LCFI6:
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
.LCFI7:
	.cfi_def_cfa_register 6
	sub	rsp, 32	#,
	mov	eax, edi	# tmp85, running_with_privileges
	mov	DWORD PTR -24[rbp], esi	# designer, designer
	mov	BYTE PTR -20[rbp], al	# running_with_privileges, tmp86
# /home/jscha/dvp/cpumon/src/sysfs.c:75:     if (running_with_privileges == TRUE && designer == INTEL)
	.loc 1 75 8
	cmp	BYTE PTR -20[rbp], 0	# running_with_privileges,
	je	.L21	#,
# /home/jscha/dvp/cpumon/src/sysfs.c:75:     if (running_with_privileges == TRUE && designer == INTEL)
	.loc 1 75 40 discriminator 1
	cmp	DWORD PTR -24[rbp], 0	# designer,
	jne	.L21	#,
.LBB4:
# /home/jscha/dvp/cpumon/src/sysfs.c:77:         int *power_limits = get_sysfs_power_limits_w();
	.loc 1 77 29
	call	get_sysfs_power_limits_w	#
	mov	QWORD PTR -16[rbp], rax	# power_limits, tmp87
# /home/jscha/dvp/cpumon/src/sysfs.c:78:         printw("Power Limits: \t\tPL1 = %d W, PL2 = %d\n", power_limits[0], power_limits[1]);
	.loc 1 78 89
	mov	rax, QWORD PTR -16[rbp]	# tmp88, power_limits
	add	rax, 4	# _1,
# /home/jscha/dvp/cpumon/src/sysfs.c:78:         printw("Power Limits: \t\tPL1 = %d W, PL2 = %d\n", power_limits[0], power_limits[1]);
	.loc 1 78 9
	mov	edx, DWORD PTR [rax]	# _2, *_1
	mov	rax, QWORD PTR -16[rbp]	# tmp89, power_limits
	mov	eax, DWORD PTR [rax]	# _3, *power_limits_10
	mov	esi, eax	#, _3
	lea	rax, .LC10[rip]	# tmp90,
	mov	rdi, rax	#, tmp90
	mov	eax, 0	#,
	call	printw@PLT	#
.L21:
.LBE4:
# /home/jscha/dvp/cpumon/src/sysfs.c:82:     char *file = read_string("/sys/devices/system/cpu/intel_pstate/no_turbo");
	.loc 1 82 18
	lea	rax, .LC11[rip]	# tmp91,
	mov	rdi, rax	#, tmp91
	call	read_string@PLT	#
	mov	QWORD PTR -8[rbp], rax	# file, tmp92
# /home/jscha/dvp/cpumon/src/sysfs.c:90:     file = read_string("/sys/devices/system/cpu/cpu0/cpufreq/energy_performance_preference");
	.loc 1 90 12
	lea	rax, .LC12[rip]	# tmp93,
	mov	rdi, rax	#, tmp93
	call	read_string@PLT	#
	mov	QWORD PTR -8[rbp], rax	# file, tmp94
# /home/jscha/dvp/cpumon/src/sysfs.c:91:     printw("Energy-Performance-Preference: \t%s \n", file);
	.loc 1 91 5
	mov	rax, QWORD PTR -8[rbp]	# tmp95, file
	mov	rsi, rax	#, tmp95
	lea	rax, .LC13[rip]	# tmp96,
	mov	rdi, rax	#, tmp96
	mov	eax, 0	#,
	call	printw@PLT	#
# /home/jscha/dvp/cpumon/src/sysfs.c:93:     file = read_string("/sys/devices/system/cpu/cpufreq/policy0/scaling_driver");
	.loc 1 93 12
	lea	rax, .LC14[rip]	# tmp97,
	mov	rdi, rax	#, tmp97
	call	read_string@PLT	#
	mov	QWORD PTR -8[rbp], rax	# file, tmp98
# /home/jscha/dvp/cpumon/src/sysfs.c:94:     printw("Scaling Driver: \t\t%s \n",file);
	.loc 1 94 5
	mov	rax, QWORD PTR -8[rbp]	# tmp99, file
	mov	rsi, rax	#, tmp99
	lea	rax, .LC15[rip]	# tmp100,
	mov	rdi, rax	#, tmp100
	mov	eax, 0	#,
	call	printw@PLT	#
# /home/jscha/dvp/cpumon/src/sysfs.c:96:     file = read_string("/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor");
	.loc 1 96 12
	lea	rax, .LC16[rip]	# tmp101,
	mov	rdi, rax	#, tmp101
	call	read_string@PLT	#
	mov	QWORD PTR -8[rbp], rax	# file, tmp102
# /home/jscha/dvp/cpumon/src/sysfs.c:97:     printw("CPU Frequency Scaling Governor: %s \n", file);   
	.loc 1 97 5
	mov	rax, QWORD PTR -8[rbp]	# tmp103, file
	mov	rsi, rax	#, tmp103
	lea	rax, .LC17[rip]	# tmp104,
	mov	rdi, rax	#, tmp104
	mov	eax, 0	#,
	call	printw@PLT	#
# /home/jscha/dvp/cpumon/src/sysfs.c:99:     if (designer == AMD)
	.loc 1 99 8
	cmp	DWORD PTR -24[rbp], 1	# designer,
	jne	.L23	#,
# /home/jscha/dvp/cpumon/src/sysfs.c:101:         file = read_string("/sys/devices/system/cpu/amd_pstate/prefcore");
	.loc 1 101 16
	lea	rax, .LC18[rip]	# tmp105,
	mov	rdi, rax	#, tmp105
	call	read_string@PLT	#
	mov	QWORD PTR -8[rbp], rax	# file, tmp106
# /home/jscha/dvp/cpumon/src/sysfs.c:102:         printw("AMD Preferential Core: \t\t%s \n", file);
	.loc 1 102 9
	mov	rax, QWORD PTR -8[rbp]	# tmp107, file
	mov	rsi, rax	#, tmp107
	lea	rax, .LC19[rip]	# tmp108,
	mov	rdi, rax	#, tmp108
	mov	eax, 0	#,
	call	printw@PLT	#
.L23:
# /home/jscha/dvp/cpumon/src/sysfs.c:105: }
	.loc 1 105 1
	nop	
	leave	
.LCFI8:
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE8:
	.size	power_config, .-power_config
	.section	.rodata
	.align 8
.LC20:
	.string	"/sys/class/power_supply/BAT0/power_now"
	.align 8
.LC22:
	.string	"/sys/class/power_supply/BAT1/voltage_now"
	.align 8
.LC23:
	.string	"/sys/class/power_supply/BAT1/current_now"
	.text
	.globl	get_sysfs_power_battery_w
	.type	get_sysfs_power_battery_w, @function
get_sysfs_power_battery_w:
.LFB9:
	.loc 1 108 1
	.cfi_startproc
	endbr64	
	push	rbp	#
.LCFI9:
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
.LCFI10:
	.cfi_def_cfa_register 6
	sub	rsp, 64	#,
	mov	QWORD PTR -56[rbp], rdi	# battery_power, battery_power
# /home/jscha/dvp/cpumon/src/sysfs.c:108: {
	.loc 1 108 1
	mov	rax, QWORD PTR fs:40	# tmp118, MEM[(<address-space-1> long unsigned int *)40B]
	mov	QWORD PTR -8[rbp], rax	# D.4810, tmp118
	xor	eax, eax	# tmp118
# /home/jscha/dvp/cpumon/src/sysfs.c:112:     if (read_line(read_value, "/sys/class/power_supply/BAT0/power_now") == 0)
	.loc 1 112 9
	lea	rax, -32[rbp]	# tmp98,
	lea	rdx, .LC20[rip]	# tmp99,
	mov	rsi, rdx	#, tmp99
	mov	rdi, rax	#, tmp98
	call	read_line@PLT	#
# /home/jscha/dvp/cpumon/src/sysfs.c:112:     if (read_line(read_value, "/sys/class/power_supply/BAT0/power_now") == 0)
	.loc 1 112 8
	test	eax, eax	# _1
	jne	.L25	#,
.LBB5:
# /home/jscha/dvp/cpumon/src/sysfs.c:114:         long power_uw = 0;
	.loc 1 114 14
	mov	QWORD PTR -40[rbp], 0	# MEM[(long int *)_40],
# /home/jscha/dvp/cpumon/src/sysfs.c:115:         sscanf(read_value, "%ld", &power_uw);
	.loc 1 115 9
	lea	rdx, -40[rbp]	# tmp100,
	lea	rax, -32[rbp]	# tmp101,
	lea	rcx, .LC9[rip]	# tmp102,
	mov	rsi, rcx	#, tmp102
	mov	rdi, rax	#, tmp101
	mov	eax, 0	#,
	call	__isoc99_sscanf@PLT	#
# /home/jscha/dvp/cpumon/src/sysfs.c:116:         *battery_power = (float)power_uw * 1e-6;
	.loc 1 116 26
	mov	rax, QWORD PTR -40[rbp]	# power_uw.0_2, MEM[(long int *)_40]
	pxor	xmm0, xmm0	# _3
	cvtsi2ss	xmm0, rax	# _3, power_uw.0_2
	pxor	xmm1, xmm1	# _4
	cvtss2sd	xmm1, xmm0	# _4, _3
# /home/jscha/dvp/cpumon/src/sysfs.c:116:         *battery_power = (float)power_uw * 1e-6;
	.loc 1 116 42
	movsd	xmm0, QWORD PTR .LC21[rip]	# tmp103,
	mulsd	xmm0, xmm1	# _5, _4
	cvtsd2ss	xmm0, xmm0	# _6, _5
# /home/jscha/dvp/cpumon/src/sysfs.c:116:         *battery_power = (float)power_uw * 1e-6;
	.loc 1 116 24
	mov	rax, QWORD PTR -56[rbp]	# tmp104, battery_power
	movss	DWORD PTR [rax], xmm0	# *battery_power_26(D), _6
# /home/jscha/dvp/cpumon/src/sysfs.c:117:         return 0;
	.loc 1 117 16
	mov	eax, 0	# _15,
	jmp	.L28	#
.L25:
.LBE5:
# /home/jscha/dvp/cpumon/src/sysfs.c:119:     if ((read_line(read_value,"/sys/class/power_supply/BAT1/voltage_now") == 0)  && (read_line(read_value2,"/sys/class/power_supply/BAT1/current_now") == 0))
	.loc 1 119 10
	lea	rax, -32[rbp]	# tmp105,
	lea	rdx, .LC22[rip]	# tmp106,
	mov	rsi, rdx	#, tmp106
	mov	rdi, rax	#, tmp105
	call	read_line@PLT	#
# /home/jscha/dvp/cpumon/src/sysfs.c:119:     if ((read_line(read_value,"/sys/class/power_supply/BAT1/voltage_now") == 0)  && (read_line(read_value2,"/sys/class/power_supply/BAT1/current_now") == 0))
	.loc 1 119 8
	test	eax, eax	# _7
	jne	.L27	#,
# /home/jscha/dvp/cpumon/src/sysfs.c:119:     if ((read_line(read_value,"/sys/class/power_supply/BAT1/voltage_now") == 0)  && (read_line(read_value2,"/sys/class/power_supply/BAT1/current_now") == 0))
	.loc 1 119 85 discriminator 1
	lea	rax, -20[rbp]	# tmp107,
	lea	rdx, .LC23[rip]	# tmp108,
	mov	rsi, rdx	#, tmp108
	mov	rdi, rax	#, tmp107
	call	read_line@PLT	#
# /home/jscha/dvp/cpumon/src/sysfs.c:119:     if ((read_line(read_value,"/sys/class/power_supply/BAT1/voltage_now") == 0)  && (read_line(read_value2,"/sys/class/power_supply/BAT1/current_now") == 0))
	.loc 1 119 81 discriminator 1
	test	eax, eax	# _8
	jne	.L27	#,
.LBB6:
# /home/jscha/dvp/cpumon/src/sysfs.c:121:         long voltage_uv = 0;
	.loc 1 121 14
	mov	QWORD PTR -48[rbp], 0	# voltage_uv,
# /home/jscha/dvp/cpumon/src/sysfs.c:122:         sscanf(read_value, "%ld", &voltage_uv);
	.loc 1 122 9
	lea	rdx, -48[rbp]	# tmp109,
	lea	rax, -32[rbp]	# tmp110,
	lea	rcx, .LC9[rip]	# tmp111,
	mov	rsi, rcx	#, tmp111
	mov	rdi, rax	#, tmp110
	mov	eax, 0	#,
	call	__isoc99_sscanf@PLT	#
# /home/jscha/dvp/cpumon/src/sysfs.c:123:         long current_ua = 0;
	.loc 1 123 14
	mov	QWORD PTR -40[rbp], 0	# MEM[(long int *)_40],
# /home/jscha/dvp/cpumon/src/sysfs.c:124:         sscanf(read_value2, "%ld", &current_ua);
	.loc 1 124 9
	lea	rdx, -40[rbp]	# tmp112,
	lea	rax, -20[rbp]	# tmp113,
	lea	rcx, .LC9[rip]	# tmp114,
	mov	rsi, rcx	#, tmp114
	mov	rdi, rax	#, tmp113
	mov	eax, 0	#,
	call	__isoc99_sscanf@PLT	#
# /home/jscha/dvp/cpumon/src/sysfs.c:125:         *battery_power = (float)(voltage_uv * current_ua * 1e-12);
	.loc 1 125 45
	mov	rdx, QWORD PTR -48[rbp]	# voltage_uv.1_9, voltage_uv
	mov	rax, QWORD PTR -40[rbp]	# current_ua.2_10, MEM[(long int *)_40]
	imul	rax, rdx	# _11, voltage_uv.1_9
# /home/jscha/dvp/cpumon/src/sysfs.c:125:         *battery_power = (float)(voltage_uv * current_ua * 1e-12);
	.loc 1 125 58
	pxor	xmm1, xmm1	# _12
	cvtsi2sd	xmm1, rax	# _12, _11
	movsd	xmm0, QWORD PTR .LC24[rip]	# tmp115,
	mulsd	xmm0, xmm1	# _13, _12
# /home/jscha/dvp/cpumon/src/sysfs.c:125:         *battery_power = (float)(voltage_uv * current_ua * 1e-12);
	.loc 1 125 26
	cvtsd2ss	xmm0, xmm0	# _14, _13
# /home/jscha/dvp/cpumon/src/sysfs.c:125:         *battery_power = (float)(voltage_uv * current_ua * 1e-12);
	.loc 1 125 24
	mov	rax, QWORD PTR -56[rbp]	# tmp116, battery_power
	movss	DWORD PTR [rax], xmm0	# *battery_power_26(D), _14
# /home/jscha/dvp/cpumon/src/sysfs.c:126:         return 0;
	.loc 1 126 16
	mov	eax, 0	# _15,
	jmp	.L28	#
.L27:
.LBE6:
# /home/jscha/dvp/cpumon/src/sysfs.c:129:     return -1;
	.loc 1 129 12
	mov	eax, -1	# _15,
.L28:
# /home/jscha/dvp/cpumon/src/sysfs.c:130: }
	.loc 1 130 1 discriminator 3
	mov	rdx, QWORD PTR -8[rbp]	# tmp119, D.4810
	sub	rdx, QWORD PTR fs:40	# tmp119, MEM[(<address-space-1> long unsigned int *)40B]
	je	.L29	#,
# /home/jscha/dvp/cpumon/src/sysfs.c:130: }
	.loc 1 130 1 is_stmt 0
	call	__stack_chk_fail@PLT	#
.L29:
	leave	
.LCFI11:
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE9:
	.size	get_sysfs_power_battery_w, .-get_sysfs_power_battery_w
	.section	.rodata
	.align 8
.LC25:
	.string	"/sys/class/power_supply/BAT0/status"
	.align 8
.LC26:
	.string	"/sys/class/power_supply/BAT1/status"
	.text
	.globl	get_battery_status
	.type	get_battery_status, @function
get_battery_status:
.LFB10:
	.loc 1 133 1 is_stmt 1
	.cfi_startproc
	endbr64	
	push	rbp	#
.LCFI12:
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
.LCFI13:
	.cfi_def_cfa_register 6
	sub	rsp, 16	#,
	mov	QWORD PTR -8[rbp], rdi	# status, status
# /home/jscha/dvp/cpumon/src/sysfs.c:135:     if (read_line(status, "/sys/class/power_supply/BAT0/status") == 0)
	.loc 1 135 9
	mov	rax, QWORD PTR -8[rbp]	# tmp86, status
	lea	rdx, .LC25[rip]	# tmp87,
	mov	rsi, rdx	#, tmp87
	mov	rdi, rax	#, tmp86
	call	read_line@PLT	#
# /home/jscha/dvp/cpumon/src/sysfs.c:135:     if (read_line(status, "/sys/class/power_supply/BAT0/status") == 0)
	.loc 1 135 8
	test	eax, eax	# _1
	jne	.L31	#,
# /home/jscha/dvp/cpumon/src/sysfs.c:137:         return 0;
	.loc 1 137 16
	mov	eax, 0	# _3,
	jmp	.L32	#
.L31:
# /home/jscha/dvp/cpumon/src/sysfs.c:139:     if  (read_line(status, "/sys/class/power_supply/BAT1/status") == 0)
	.loc 1 139 9
	mov	rax, QWORD PTR -8[rbp]	# tmp88, status
	lea	rdx, .LC26[rip]	# tmp89,
	mov	rsi, rdx	#, tmp89
	mov	rdi, rax	#, tmp88
	call	read_line@PLT	#
# /home/jscha/dvp/cpumon/src/sysfs.c:139:     if  (read_line(status, "/sys/class/power_supply/BAT1/status") == 0)
	.loc 1 139 8
	test	eax, eax	# _2
	jne	.L33	#,
# /home/jscha/dvp/cpumon/src/sysfs.c:141:         return 0;
	.loc 1 141 16
	mov	eax, 0	# _3,
	jmp	.L32	#
.L33:
# /home/jscha/dvp/cpumon/src/sysfs.c:144:     strcpy(status, "Status unknown");
	.loc 1 144 5
	mov	rax, QWORD PTR -8[rbp]	# tmp90, status
	movabs	rcx, 8439872649993221203	# tmp93,
	mov	QWORD PTR [rax], rcx	# MEM <char[1:15]> [(void *)status_6(D)], tmp93
	mov	DWORD PTR 8[rax], 1869507438	# MEM <char[1:15]> [(void *)status_6(D)],
	mov	WORD PTR 12[rax], 28279	# MEM <char[1:15]> [(void *)status_6(D)],
	mov	BYTE PTR 14[rax], 0	# MEM <char[1:15]> [(void *)status_6(D)],
# /home/jscha/dvp/cpumon/src/sysfs.c:145:     return -1;
	.loc 1 145 12
	mov	eax, -1	# _3,
.L32:
# /home/jscha/dvp/cpumon/src/sysfs.c:146: }
	.loc 1 146 1
	leave	
.LCFI14:
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE10:
	.size	get_battery_status, .-get_battery_status
	.globl	reset_if_status_change
	.type	reset_if_status_change, @function
reset_if_status_change:
.LFB11:
	.loc 1 149 1
	.cfi_startproc
	endbr64	
	push	rbp	#
.LCFI15:
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
.LCFI16:
	.cfi_def_cfa_register 6
	sub	rsp, 32	#,
	mov	QWORD PTR -8[rbp], rdi	# cumulative, cumulative
	mov	QWORD PTR -16[rbp], rsi	# status, status
	mov	QWORD PTR -24[rbp], rdx	# status_before, status_before
# /home/jscha/dvp/cpumon/src/sysfs.c:150:     if (strcmp(status, status_before) != 0)
	.loc 1 150 9
	mov	rdx, QWORD PTR -24[rbp]	# tmp83, status_before
	mov	rax, QWORD PTR -16[rbp]	# tmp84, status
	mov	rsi, rdx	#, tmp83
	mov	rdi, rax	#, tmp84
	call	strcmp@PLT	#
# /home/jscha/dvp/cpumon/src/sysfs.c:150:     if (strcmp(status, status_before) != 0)
	.loc 1 150 8
	test	eax, eax	# _1
	je	.L36	#,
# /home/jscha/dvp/cpumon/src/sysfs.c:152:         *cumulative = 0;
	.loc 1 152 21
	mov	rax, QWORD PTR -8[rbp]	# tmp85, cumulative
	pxor	xmm0, xmm0	# tmp86
	movss	DWORD PTR [rax], xmm0	# *cumulative_6(D), tmp86
# /home/jscha/dvp/cpumon/src/sysfs.c:153:         strcpy(status_before, status);
	.loc 1 153 9
	mov	rdx, QWORD PTR -16[rbp]	# tmp87, status
	mov	rax, QWORD PTR -24[rbp]	# tmp88, status_before
	mov	rsi, rdx	#, tmp87
	mov	rdi, rax	#, tmp88
	call	strcpy@PLT	#
.L36:
# /home/jscha/dvp/cpumon/src/sysfs.c:155: }
	.loc 1 155 1
	nop	
	leave	
.LCFI17:
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE11:
	.size	reset_if_status_change, .-reset_if_status_change
	.section	.rodata
	.align 8
.LC28:
	.string	"/sys/devices/system/cpu/cpufreq/policy%d/scaling_cur_freq"
	.text
	.globl	sysfs_freq_ghz
	.type	sysfs_freq_ghz, @function
sysfs_freq_ghz:
.LFB12:
	.loc 1 160 1
	.cfi_startproc
	endbr64	
	push	rbp	#
.LCFI18:
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
.LCFI19:
	.cfi_def_cfa_register 6
	sub	rsp, 192	#,
	mov	QWORD PTR -168[rbp], rdi	# freq_ghz, freq_ghz
	mov	QWORD PTR -176[rbp], rsi	# average, average
	mov	DWORD PTR -180[rbp], edx	# core_count, core_count
# /home/jscha/dvp/cpumon/src/sysfs.c:160: {
	.loc 1 160 1
	mov	rax, QWORD PTR fs:40	# tmp118, MEM[(<address-space-1> long unsigned int *)40B]
	mov	QWORD PTR -8[rbp], rax	# D.4816, tmp118
	xor	eax, eax	# tmp118
# /home/jscha/dvp/cpumon/src/sysfs.c:164:     float total = 0;
	.loc 1 164 11
	pxor	xmm0, xmm0	# tmp98
	movss	DWORD PTR -152[rbp], xmm0	# total, tmp98
.LBB7:
# /home/jscha/dvp/cpumon/src/sysfs.c:166:     for (int i = 0; i < core_count; i++){
	.loc 1 166 14
	mov	DWORD PTR -148[rbp], 0	# i,
# /home/jscha/dvp/cpumon/src/sysfs.c:166:     for (int i = 0; i < core_count; i++){
	.loc 1 166 5
	jmp	.L38	#
.L41:
# /home/jscha/dvp/cpumon/src/sysfs.c:167:         sprintf(path, "/sys/devices/system/cpu/cpufreq/policy%d/scaling_cur_freq", i);
	.loc 1 167 9
	mov	edx, DWORD PTR -148[rbp]	# tmp99, i
	lea	rax, -80[rbp]	# tmp100,
	lea	rcx, .LC28[rip]	# tmp101,
	mov	rsi, rcx	#, tmp101
	mov	rdi, rax	#, tmp100
	mov	eax, 0	#,
	call	sprintf@PLT	#
# /home/jscha/dvp/cpumon/src/sysfs.c:168:         if (read_line(file_buf, path) == 0)
	.loc 1 168 13
	lea	rdx, -80[rbp]	# tmp102,
	lea	rax, -144[rbp]	# tmp103,
	mov	rsi, rdx	#, tmp102
	mov	rdi, rax	#, tmp103
	call	read_line@PLT	#
# /home/jscha/dvp/cpumon/src/sysfs.c:168:         if (read_line(file_buf, path) == 0)
	.loc 1 168 12
	test	eax, eax	# _1
	jne	.L39	#,
# /home/jscha/dvp/cpumon/src/sysfs.c:170:             freq_ghz[i] = (float)strtol(file_buf, NULL, 10) / 1000000;
	.loc 1 170 34
	lea	rax, -144[rbp]	# tmp104,
	mov	edx, 10	#,
	mov	esi, 0	#,
	mov	rdi, rax	#, tmp104
	call	strtol@PLT	#
# /home/jscha/dvp/cpumon/src/sysfs.c:170:             freq_ghz[i] = (float)strtol(file_buf, NULL, 10) / 1000000;
	.loc 1 170 27
	pxor	xmm0, xmm0	# _3
	cvtsi2ss	xmm0, rax	# _3, _2
# /home/jscha/dvp/cpumon/src/sysfs.c:170:             freq_ghz[i] = (float)strtol(file_buf, NULL, 10) / 1000000;
	.loc 1 170 21
	mov	eax, DWORD PTR -148[rbp]	# tmp105, i
	cdqe
	lea	rdx, 0[0+rax*4]	# _5,
	mov	rax, QWORD PTR -168[rbp]	# tmp106, freq_ghz
	add	rax, rdx	# _6, _5
# /home/jscha/dvp/cpumon/src/sysfs.c:170:             freq_ghz[i] = (float)strtol(file_buf, NULL, 10) / 1000000;
	.loc 1 170 60
	movss	xmm1, DWORD PTR .LC29[rip]	# tmp107,
	divss	xmm0, xmm1	# _7, tmp107
# /home/jscha/dvp/cpumon/src/sysfs.c:170:             freq_ghz[i] = (float)strtol(file_buf, NULL, 10) / 1000000;
	.loc 1 170 25
	movss	DWORD PTR [rax], xmm0	# *_6, _7
# /home/jscha/dvp/cpumon/src/sysfs.c:171:             total += freq_ghz[i];
	.loc 1 171 30
	mov	eax, DWORD PTR -148[rbp]	# tmp108, i
	cdqe
	lea	rdx, 0[0+rax*4]	# _9,
	mov	rax, QWORD PTR -168[rbp]	# tmp109, freq_ghz
	add	rax, rdx	# _10, _9
	movss	xmm0, DWORD PTR [rax]	# _11, *_10
# /home/jscha/dvp/cpumon/src/sysfs.c:171:             total += freq_ghz[i];
	.loc 1 171 19
	movss	xmm1, DWORD PTR -152[rbp]	# tmp111, total
	addss	xmm0, xmm1	# tmp110, tmp111
	movss	DWORD PTR -152[rbp], xmm0	# total, tmp110
	jmp	.L40	#
.L39:
# /home/jscha/dvp/cpumon/src/sysfs.c:175:             freq_ghz[i] = -1;
	.loc 1 175 21
	mov	eax, DWORD PTR -148[rbp]	# tmp112, i
	cdqe
	lea	rdx, 0[0+rax*4]	# _13,
	mov	rax, QWORD PTR -168[rbp]	# tmp113, freq_ghz
	add	rax, rdx	# _14, _13
# /home/jscha/dvp/cpumon/src/sysfs.c:175:             freq_ghz[i] = -1;
	.loc 1 175 25
	movss	xmm0, DWORD PTR .LC30[rip]	# tmp114,
	movss	DWORD PTR [rax], xmm0	# *_14, tmp114
.L40:
# /home/jscha/dvp/cpumon/src/sysfs.c:166:     for (int i = 0; i < core_count; i++){
	.loc 1 166 38 discriminator 2
	add	DWORD PTR -148[rbp], 1	# i,
.L38:
# /home/jscha/dvp/cpumon/src/sysfs.c:166:     for (int i = 0; i < core_count; i++){
	.loc 1 166 23 discriminator 1
	mov	eax, DWORD PTR -148[rbp]	# tmp115, i
	cmp	eax, DWORD PTR -180[rbp]	# tmp115, core_count
	jl	.L41	#,
.LBE7:
# /home/jscha/dvp/cpumon/src/sysfs.c:179:     *average = total / core_count;
	.loc 1 179 22
	pxor	xmm1, xmm1	# _15
	cvtsi2ss	xmm1, DWORD PTR -180[rbp]	# _15, core_count
	movss	xmm0, DWORD PTR -152[rbp]	# tmp116, total
	divss	xmm0, xmm1	# _16, _15
# /home/jscha/dvp/cpumon/src/sysfs.c:179:     *average = total / core_count;
	.loc 1 179 14
	mov	rax, QWORD PTR -176[rbp]	# tmp117, average
	movss	DWORD PTR [rax], xmm0	# *average_26(D), _16
# /home/jscha/dvp/cpumon/src/sysfs.c:180: }
	.loc 1 180 1
	nop	
	mov	rax, QWORD PTR -8[rbp]	# tmp119, D.4816
	sub	rax, QWORD PTR fs:40	# tmp119, MEM[(<address-space-1> long unsigned int *)40B]
	je	.L42	#,
	call	__stack_chk_fail@PLT	#
.L42:
	leave	
.LCFI20:
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE12:
	.size	sysfs_freq_ghz, .-sysfs_freq_ghz
	.section	.rodata
.LC31:
	.string	"/proc/stat"
.LC32:
	.string	"Error opening file /proc/stat"
.LC33:
	.string	"Error %s\n"
.LC34:
	.string	"cpu%d "
	.align 8
.LC35:
	.string	"%*s %lld %lld %lld %lld %lld %lld %lld"
	.text
	.globl	cpucore_load
	.type	cpucore_load, @function
cpucore_load:
.LFB13:
	.loc 1 183 130
	.cfi_startproc
	endbr64	
	push	rbp	#
.LCFI21:
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
.LCFI22:
	.cfi_def_cfa_register 6
	push	r15	#
	push	r14	#
	push	r13	#
	push	r12	#
	push	rbx	#
	sub	rsp, 4096	#,
	or	QWORD PTR [rsp], 0	#,
	sub	rsp, 4096	#,
	or	QWORD PTR [rsp], 0	#,
	sub	rsp, 248	#,
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	mov	QWORD PTR -8408[rbp], rdi	# load, load
	mov	QWORD PTR -8416[rbp], rsi	# average, average
	mov	QWORD PTR -8424[rbp], rdx	# work_jiffies_before, work_jiffies_before
	mov	QWORD PTR -8432[rbp], rcx	# total_jiffies_before, total_jiffies_before
	mov	DWORD PTR -8436[rbp], r8d	# core_count, core_count
# /home/jscha/dvp/cpumon/src/sysfs.c:183: void cpucore_load(float *load, float * average, long long *work_jiffies_before, long long *total_jiffies_before, int core_count) {
	.loc 1 183 130
	mov	rax, QWORD PTR fs:40	# tmp299, MEM[(<address-space-1> long unsigned int *)40B]
	mov	QWORD PTR -56[rbp], rax	# D.4818, tmp299
	xor	eax, eax	# tmp299
	mov	rax, rsp	# tmp179,
	mov	rbx, rax	# saved_stack.17_109, tmp179
# /home/jscha/dvp/cpumon/src/sysfs.c:185:     FILE *fp = fopen("/proc/stat", "r");
	.loc 1 185 16
	lea	rax, .LC0[rip]	# tmp180,
	mov	rsi, rax	#, tmp180
	lea	rax, .LC31[rip]	# tmp181,
	mov	rdi, rax	#, tmp181
	call	fopen@PLT	#
	mov	QWORD PTR -8320[rbp], rax	# fp, tmp182
# /home/jscha/dvp/cpumon/src/sysfs.c:186:     if (fp == NULL) {
	.loc 1 186 8
	cmp	QWORD PTR -8320[rbp], 0	# fp,
	jne	.L44	#,
# /home/jscha/dvp/cpumon/src/sysfs.c:187:         perror("Error opening file /proc/stat");
	.loc 1 187 9
	lea	rax, .LC32[rip]	# tmp183,
	mov	rdi, rax	#, tmp183
	call	perror@PLT	#
.L44:
# /home/jscha/dvp/cpumon/src/sysfs.c:193:     long long work_jiffies_after[core_count];
	.loc 1 193 5
	mov	eax, DWORD PTR -8436[rbp]	# core_count.3_114, core_count
# /home/jscha/dvp/cpumon/src/sysfs.c:193:     long long work_jiffies_after[core_count];
	.loc 1 193 15
	movsx	rdx, eax	# _1, core_count.3_114
	sub	rdx, 1	# _2,
	mov	QWORD PTR -8312[rbp], rdx	# D.4749, _3
	movsx	rdx, eax	# _4, core_count.3_114
	mov	QWORD PTR -8464[rbp], rdx	# %sfp, _4
	mov	QWORD PTR -8456[rbp], 0	# %sfp,
	movsx	rdx, eax	# _9, core_count.3_114
	mov	QWORD PTR -8480[rbp], rdx	# %sfp, _9
	mov	QWORD PTR -8472[rbp], 0	# %sfp,
	cdqe
	lea	rdx, 0[0+rax*8]	# _13,
	mov	eax, 16	# tmp295,
	sub	rax, 1	# tmp184,
	add	rax, rdx	# tmp185, _13
	mov	edi, 16	# tmp296,
	mov	edx, 0	# tmp188,
	div	rdi	# tmp296
	imul	rax, rax, 16	# tmp189, tmp187,
	mov	rcx, rax	# tmp191, tmp189
	and	rcx, -4096	# tmp191,
	mov	rdx, rsp	# tmp192,
	sub	rdx, rcx	# tmp192, tmp191
.L45:
	cmp	rsp, rdx	#, tmp192
	je	.L46	#,
	sub	rsp, 4096	#,
	or	QWORD PTR 4088[rsp], 0	#,
	jmp	.L45	#
.L46:
	mov	rdx, rax	# tmp193, tmp189
	and	edx, 4095	# tmp193,
	sub	rsp, rdx	#, tmp193
	mov	rdx, rax	# tmp194, tmp189
	and	edx, 4095	# tmp194,
	test	rdx, rdx	# tmp194
	je	.L47	#,
	and	eax, 4095	# tmp195,
	sub	rax, 8	# tmp195,
	add	rax, rsp	# tmp196,
	or	QWORD PTR [rax], 0	#,
.L47:
	mov	rax, rsp	# tmp190,
	add	rax, 7	# tmp197,
	shr	rax, 3	# tmp198,
	sal	rax, 3	# tmp199,
	mov	QWORD PTR -8304[rbp], rax	# work_jiffies_after.4, tmp199
# /home/jscha/dvp/cpumon/src/sysfs.c:194:     long long total_jiffies_after[core_count];
	.loc 1 194 5
	mov	eax, DWORD PTR -8436[rbp]	# core_count.5_122, core_count
# /home/jscha/dvp/cpumon/src/sysfs.c:194:     long long total_jiffies_after[core_count];
	.loc 1 194 15
	movsx	rdx, eax	# _14, core_count.5_122
	sub	rdx, 1	# _15,
	mov	QWORD PTR -8296[rbp], rdx	# D.4756, _16
	movsx	rdx, eax	# _17, core_count.5_122
	mov	r14, rdx	# _18, _17
	mov	r15d, 0	# _18,
	movsx	rdx, eax	# _22, core_count.5_122
	mov	r12, rdx	# _23, _22
	mov	r13d, 0	# _23,
	cdqe
	lea	rdx, 0[0+rax*8]	# _26,
	mov	eax, 16	# tmp297,
	sub	rax, 1	# tmp200,
	add	rax, rdx	# tmp201, _26
	mov	edi, 16	# tmp298,
	mov	edx, 0	# tmp204,
	div	rdi	# tmp298
	imul	rax, rax, 16	# tmp205, tmp203,
	mov	rcx, rax	# tmp207, tmp205
	and	rcx, -4096	# tmp207,
	mov	rdx, rsp	# tmp208,
	sub	rdx, rcx	# tmp208, tmp207
.L48:
	cmp	rsp, rdx	#, tmp208
	je	.L49	#,
	sub	rsp, 4096	#,
	or	QWORD PTR 4088[rsp], 0	#,
	jmp	.L48	#
.L49:
	mov	rdx, rax	# tmp209, tmp205
	and	edx, 4095	# tmp209,
	sub	rsp, rdx	#, tmp209
	mov	rdx, rax	# tmp210, tmp205
	and	edx, 4095	# tmp210,
	test	rdx, rdx	# tmp210
	je	.L50	#,
	and	eax, 4095	# tmp211,
	sub	rax, 8	# tmp211,
	add	rax, rsp	# tmp212,
	or	QWORD PTR [rax], 0	#,
.L50:
	mov	rax, rsp	# tmp206,
	add	rax, 7	# tmp213,
	shr	rax, 3	# tmp214,
	sal	rax, 3	# tmp215,
	mov	QWORD PTR -8288[rbp], rax	# total_jiffies_after.6, tmp215
# /home/jscha/dvp/cpumon/src/sysfs.c:196:     float total = 0;
	.loc 1 196 11
	pxor	xmm0, xmm0	# tmp216
	movss	DWORD PTR -8392[rbp], xmm0	# total, tmp216
# /home/jscha/dvp/cpumon/src/sysfs.c:198:         line = fgets(file_buf, BUFSIZ, fp);
	.loc 1 198 16
	mov	rdx, QWORD PTR -8320[rbp]	# tmp217, fp
	lea	rax, -8256[rbp]	# tmp218,
	mov	esi, 8192	#,
	mov	rdi, rax	#, tmp218
	call	fgets@PLT	#
	mov	QWORD PTR -8280[rbp], rax	# line, tmp219
# /home/jscha/dvp/cpumon/src/sysfs.c:199:         if (line == NULL) {
	.loc 1 199 12
	cmp	QWORD PTR -8280[rbp], 0	# line,
	jne	.L51	#,
# /home/jscha/dvp/cpumon/src/sysfs.c:200:             printf("Error %s\n", file_buf);
	.loc 1 200 13
	lea	rax, -8256[rbp]	# tmp220,
	mov	rsi, rax	#, tmp220
	lea	rax, .LC33[rip]	# tmp221,
	mov	rdi, rax	#, tmp221
	mov	eax, 0	#,
	call	printf@PLT	#
.L51:
.LBB8:
# /home/jscha/dvp/cpumon/src/sysfs.c:203:         for (int core = 0; core < core_count; core++) {
	.loc 1 203 18
	mov	DWORD PTR -8388[rbp], 0	# core,
# /home/jscha/dvp/cpumon/src/sysfs.c:203:         for (int core = 0; core < core_count; core++) {
	.loc 1 203 9
	jmp	.L52	#
.L56:
# /home/jscha/dvp/cpumon/src/sysfs.c:204:             line = fgets(file_buf, BUFSIZ, fp);
	.loc 1 204 20
	mov	rdx, QWORD PTR -8320[rbp]	# tmp222, fp
	lea	rax, -8256[rbp]	# tmp223,
	mov	esi, 8192	#,
	mov	rdi, rax	#, tmp223
	call	fgets@PLT	#
	mov	QWORD PTR -8280[rbp], rax	# line, tmp224
# /home/jscha/dvp/cpumon/src/sysfs.c:205:             if (line == NULL) {
	.loc 1 205 16
	cmp	QWORD PTR -8280[rbp], 0	# line,
	je	.L64	#,
# /home/jscha/dvp/cpumon/src/sysfs.c:209:             sprintf(comparator,"cpu%d ", core);
	.loc 1 209 13
	mov	edx, DWORD PTR -8388[rbp]	# tmp225, core
	lea	rax, -8272[rbp]	# tmp226,
	lea	rcx, .LC34[rip]	# tmp227,
	mov	rsi, rcx	#, tmp227
	mov	rdi, rax	#, tmp226
	mov	eax, 0	#,
	call	sprintf@PLT	#
# /home/jscha/dvp/cpumon/src/sysfs.c:211:             if (!strncmp(line, comparator, 5)) {
	.loc 1 211 18
	lea	rcx, -8272[rbp]	# tmp228,
	mov	rax, QWORD PTR -8280[rbp]	# tmp229, line
	mov	edx, 5	#,
	mov	rsi, rcx	#, tmp228
	mov	rdi, rax	#, tmp229
	call	strncmp@PLT	#
# /home/jscha/dvp/cpumon/src/sysfs.c:211:             if (!strncmp(line, comparator, 5)) {
	.loc 1 211 16
	test	eax, eax	# _27
	jne	.L55	#,
# /home/jscha/dvp/cpumon/src/sysfs.c:213:                 sscanf(line, "%*s %lld %lld %lld %lld %lld %lld %lld", &user, &nice, &system, &idle, &iowait, &irq, &softirq);
	.loc 1 213 17
	lea	r8, -8352[rbp]	# tmp230,
	lea	rdi, -8360[rbp]	# tmp231,
	lea	rcx, -8368[rbp]	# tmp232,
	lea	rdx, -8376[rbp]	# tmp233,
	mov	rax, QWORD PTR -8280[rbp]	# tmp234, line
	sub	rsp, 8	#,
	lea	rsi, -8328[rbp]	# tmp235,
	push	rsi	# tmp235
	lea	rsi, -8336[rbp]	# tmp236,
	push	rsi	# tmp236
	lea	rsi, -8344[rbp]	# tmp237,
	push	rsi	# tmp237
	mov	r9, r8	#, tmp230
	mov	r8, rdi	#, tmp231
	lea	rsi, .LC35[rip]	# tmp238,
	mov	rdi, rax	#, tmp234
	mov	eax, 0	#,
	call	__isoc99_sscanf@PLT	#
	add	rsp, 32	#,
# /home/jscha/dvp/cpumon/src/sysfs.c:215:                 work_jiffies_after[core] = user + nice + system;
	.loc 1 215 49
	mov	rdx, QWORD PTR -8376[rbp]	# user.7_28, user
	mov	rax, QWORD PTR -8368[rbp]	# nice.8_29, nice
	add	rdx, rax	# _30, nice.8_29
# /home/jscha/dvp/cpumon/src/sysfs.c:215:                 work_jiffies_after[core] = user + nice + system;
	.loc 1 215 56
	mov	rax, QWORD PTR -8360[rbp]	# system.9_31, system
	lea	rcx, [rdx+rax]	# _32,
# /home/jscha/dvp/cpumon/src/sysfs.c:215:                 work_jiffies_after[core] = user + nice + system;
	.loc 1 215 42
	mov	rax, QWORD PTR -8304[rbp]	# tmp239, work_jiffies_after.4
	mov	edx, DWORD PTR -8388[rbp]	# tmp241, core
	movsx	rdx, edx	# tmp240, tmp241
	mov	QWORD PTR [rax+rdx*8], rcx	# (*work_jiffies_after.4_121)[core_96], _32
# /home/jscha/dvp/cpumon/src/sysfs.c:216:                 total_jiffies_after[core] = user + nice + system + idle + iowait + irq + softirq;
	.loc 1 216 50
	mov	rdx, QWORD PTR -8376[rbp]	# user.10_33, user
	mov	rax, QWORD PTR -8368[rbp]	# nice.11_34, nice
	add	rdx, rax	# _35, nice.11_34
# /home/jscha/dvp/cpumon/src/sysfs.c:216:                 total_jiffies_after[core] = user + nice + system + idle + iowait + irq + softirq;
	.loc 1 216 57
	mov	rax, QWORD PTR -8360[rbp]	# system.12_36, system
	add	rdx, rax	# _37, system.12_36
# /home/jscha/dvp/cpumon/src/sysfs.c:216:                 total_jiffies_after[core] = user + nice + system + idle + iowait + irq + softirq;
	.loc 1 216 66
	mov	rax, QWORD PTR -8352[rbp]	# idle.13_38, idle
	add	rdx, rax	# _39, idle.13_38
# /home/jscha/dvp/cpumon/src/sysfs.c:216:                 total_jiffies_after[core] = user + nice + system + idle + iowait + irq + softirq;
	.loc 1 216 73
	mov	rax, QWORD PTR -8344[rbp]	# iowait.14_40, iowait
	add	rdx, rax	# _41, iowait.14_40
# /home/jscha/dvp/cpumon/src/sysfs.c:216:                 total_jiffies_after[core] = user + nice + system + idle + iowait + irq + softirq;
	.loc 1 216 82
	mov	rax, QWORD PTR -8336[rbp]	# irq.15_42, irq
	add	rdx, rax	# _43, irq.15_42
# /home/jscha/dvp/cpumon/src/sysfs.c:216:                 total_jiffies_after[core] = user + nice + system + idle + iowait + irq + softirq;
	.loc 1 216 88
	mov	rax, QWORD PTR -8328[rbp]	# softirq.16_44, softirq
	lea	rcx, [rdx+rax]	# _45,
# /home/jscha/dvp/cpumon/src/sysfs.c:216:                 total_jiffies_after[core] = user + nice + system + idle + iowait + irq + softirq;
	.loc 1 216 43
	mov	rax, QWORD PTR -8288[rbp]	# tmp242, total_jiffies_after.6
	mov	edx, DWORD PTR -8388[rbp]	# tmp244, core
	movsx	rdx, edx	# tmp243, tmp244
	mov	QWORD PTR [rax+rdx*8], rcx	# (*total_jiffies_after.6_129)[core_96], _45
.L55:
# /home/jscha/dvp/cpumon/src/sysfs.c:203:         for (int core = 0; core < core_count; core++) {
	.loc 1 203 51 discriminator 2
	add	DWORD PTR -8388[rbp], 1	# core,
.L52:
# /home/jscha/dvp/cpumon/src/sysfs.c:203:         for (int core = 0; core < core_count; core++) {
	.loc 1 203 33 discriminator 1
	mov	eax, DWORD PTR -8388[rbp]	# tmp245, core
	cmp	eax, DWORD PTR -8436[rbp]	# tmp245, core_count
	jl	.L56	#,
	jmp	.L54	#
.L64:
# /home/jscha/dvp/cpumon/src/sysfs.c:206:                 break;
	.loc 1 206 17
	nop	
.L54:
.LBE8:
# /home/jscha/dvp/cpumon/src/sysfs.c:219:     fclose(fp);
	.loc 1 219 5
	mov	rax, QWORD PTR -8320[rbp]	# tmp246, fp
	mov	rdi, rax	#, tmp246
	call	fclose@PLT	#
.LBB9:
# /home/jscha/dvp/cpumon/src/sysfs.c:222:     for (int core = 0; core < (core_count); core++){
	.loc 1 222 14
	mov	DWORD PTR -8384[rbp], 0	# core,
# /home/jscha/dvp/cpumon/src/sysfs.c:222:     for (int core = 0; core < (core_count); core++){
	.loc 1 222 5
	jmp	.L57	#
.L60:
# /home/jscha/dvp/cpumon/src/sysfs.c:223:         if (total_jiffies_after[core] - total_jiffies_before[core] != 0) {        // only divide if we sure divisor is non zero
	.loc 1 223 32
	mov	rax, QWORD PTR -8288[rbp]	# tmp247, total_jiffies_after.6
	mov	edx, DWORD PTR -8384[rbp]	# tmp249, core
	movsx	rdx, edx	# tmp248, tmp249
	mov	rdx, QWORD PTR [rax+rdx*8]	# _46, (*total_jiffies_after.6_129)[core_97]
# /home/jscha/dvp/cpumon/src/sysfs.c:223:         if (total_jiffies_after[core] - total_jiffies_before[core] != 0) {        // only divide if we sure divisor is non zero
	.loc 1 223 61
	mov	eax, DWORD PTR -8384[rbp]	# tmp250, core
	cdqe
	lea	rcx, 0[0+rax*8]	# _48,
	mov	rax, QWORD PTR -8432[rbp]	# tmp251, total_jiffies_before
	add	rax, rcx	# _49, _48
	mov	rax, QWORD PTR [rax]	# _50, *_49
# /home/jscha/dvp/cpumon/src/sysfs.c:223:         if (total_jiffies_after[core] - total_jiffies_before[core] != 0) {        // only divide if we sure divisor is non zero
	.loc 1 223 12
	cmp	rdx, rax	# _46, _50
	je	.L58	#,
# /home/jscha/dvp/cpumon/src/sysfs.c:224:         load[core] = (float)(100 * (work_jiffies_after[core] - work_jiffies_before[core])) / (float)(total_jiffies_after[core] - total_jiffies_before[core]);
	.loc 1 224 55
	mov	rax, QWORD PTR -8304[rbp]	# tmp252, work_jiffies_after.4
	mov	edx, DWORD PTR -8384[rbp]	# tmp254, core
	movsx	rdx, edx	# tmp253, tmp254
	mov	rax, QWORD PTR [rax+rdx*8]	# _51, (*work_jiffies_after.4_121)[core_97]
# /home/jscha/dvp/cpumon/src/sysfs.c:224:         load[core] = (float)(100 * (work_jiffies_after[core] - work_jiffies_before[core])) / (float)(total_jiffies_after[core] - total_jiffies_before[core]);
	.loc 1 224 83
	mov	edx, DWORD PTR -8384[rbp]	# tmp255, core
	movsx	rdx, edx	# _52, tmp255
	lea	rcx, 0[0+rdx*8]	# _53,
	mov	rdx, QWORD PTR -8424[rbp]	# tmp256, work_jiffies_before
	add	rdx, rcx	# _54, _53
	mov	rcx, QWORD PTR [rdx]	# _55, *_54
# /home/jscha/dvp/cpumon/src/sysfs.c:224:         load[core] = (float)(100 * (work_jiffies_after[core] - work_jiffies_before[core])) / (float)(total_jiffies_after[core] - total_jiffies_before[core]);
	.loc 1 224 62
	sub	rax, rcx	# _51, _55
	mov	rdx, rax	# _56, _51
# /home/jscha/dvp/cpumon/src/sysfs.c:224:         load[core] = (float)(100 * (work_jiffies_after[core] - work_jiffies_before[core])) / (float)(total_jiffies_after[core] - total_jiffies_before[core]);
	.loc 1 224 34
	mov	rax, rdx	# tmp257, _56
	sal	rax, 2	# tmp257,
	add	rax, rdx	# tmp257, _56
	lea	rdx, 0[0+rax*4]	# tmp258,
	add	rax, rdx	# tmp257, tmp258
	sal	rax, 2	# tmp259,
# /home/jscha/dvp/cpumon/src/sysfs.c:224:         load[core] = (float)(100 * (work_jiffies_after[core] - work_jiffies_before[core])) / (float)(total_jiffies_after[core] - total_jiffies_before[core]);
	.loc 1 224 22
	pxor	xmm0, xmm0	# _58
	cvtsi2ss	xmm0, rax	# _58, _57
# /home/jscha/dvp/cpumon/src/sysfs.c:224:         load[core] = (float)(100 * (work_jiffies_after[core] - work_jiffies_before[core])) / (float)(total_jiffies_after[core] - total_jiffies_before[core]);
	.loc 1 224 121
	mov	rax, QWORD PTR -8288[rbp]	# tmp260, total_jiffies_after.6
	mov	edx, DWORD PTR -8384[rbp]	# tmp262, core
	movsx	rdx, edx	# tmp261, tmp262
	mov	rax, QWORD PTR [rax+rdx*8]	# _59, (*total_jiffies_after.6_129)[core_97]
# /home/jscha/dvp/cpumon/src/sysfs.c:224:         load[core] = (float)(100 * (work_jiffies_after[core] - work_jiffies_before[core])) / (float)(total_jiffies_after[core] - total_jiffies_before[core]);
	.loc 1 224 150
	mov	edx, DWORD PTR -8384[rbp]	# tmp263, core
	movsx	rdx, edx	# _60, tmp263
	lea	rcx, 0[0+rdx*8]	# _61,
	mov	rdx, QWORD PTR -8432[rbp]	# tmp264, total_jiffies_before
	add	rdx, rcx	# _62, _61
	mov	rdx, QWORD PTR [rdx]	# _63, *_62
# /home/jscha/dvp/cpumon/src/sysfs.c:224:         load[core] = (float)(100 * (work_jiffies_after[core] - work_jiffies_before[core])) / (float)(total_jiffies_after[core] - total_jiffies_before[core]);
	.loc 1 224 128
	sub	rax, rdx	# _64, _63
# /home/jscha/dvp/cpumon/src/sysfs.c:224:         load[core] = (float)(100 * (work_jiffies_after[core] - work_jiffies_before[core])) / (float)(total_jiffies_after[core] - total_jiffies_before[core]);
	.loc 1 224 94
	pxor	xmm1, xmm1	# _65
	cvtsi2ss	xmm1, rax	# _65, _64
# /home/jscha/dvp/cpumon/src/sysfs.c:224:         load[core] = (float)(100 * (work_jiffies_after[core] - work_jiffies_before[core])) / (float)(total_jiffies_after[core] - total_jiffies_before[core]);
	.loc 1 224 13
	mov	eax, DWORD PTR -8384[rbp]	# tmp265, core
	cdqe
	lea	rdx, 0[0+rax*4]	# _67,
	mov	rax, QWORD PTR -8408[rbp]	# tmp266, load
	add	rax, rdx	# _68, _67
# /home/jscha/dvp/cpumon/src/sysfs.c:224:         load[core] = (float)(100 * (work_jiffies_after[core] - work_jiffies_before[core])) / (float)(total_jiffies_after[core] - total_jiffies_before[core]);
	.loc 1 224 92
	divss	xmm0, xmm1	# _69, _65
# /home/jscha/dvp/cpumon/src/sysfs.c:224:         load[core] = (float)(100 * (work_jiffies_after[core] - work_jiffies_before[core])) / (float)(total_jiffies_after[core] - total_jiffies_before[core]);
	.loc 1 224 20
	movss	DWORD PTR [rax], xmm0	# *_68, _69
	jmp	.L59	#
.L58:
# /home/jscha/dvp/cpumon/src/sysfs.c:226:             load[core] = (100 * (work_jiffies_after[core] - work_jiffies_before[core])) / 1;     // pick the next closest difference to zero
	.loc 1 226 52
	mov	rax, QWORD PTR -8304[rbp]	# tmp267, work_jiffies_after.4
	mov	edx, DWORD PTR -8384[rbp]	# tmp269, core
	movsx	rdx, edx	# tmp268, tmp269
	mov	rax, QWORD PTR [rax+rdx*8]	# _70, (*work_jiffies_after.4_121)[core_97]
# /home/jscha/dvp/cpumon/src/sysfs.c:226:             load[core] = (100 * (work_jiffies_after[core] - work_jiffies_before[core])) / 1;     // pick the next closest difference to zero
	.loc 1 226 80
	mov	edx, DWORD PTR -8384[rbp]	# tmp270, core
	movsx	rdx, edx	# _71, tmp270
	lea	rcx, 0[0+rdx*8]	# _72,
	mov	rdx, QWORD PTR -8424[rbp]	# tmp271, work_jiffies_before
	add	rdx, rcx	# _73, _72
	mov	rcx, QWORD PTR [rdx]	# _74, *_73
# /home/jscha/dvp/cpumon/src/sysfs.c:226:             load[core] = (100 * (work_jiffies_after[core] - work_jiffies_before[core])) / 1;     // pick the next closest difference to zero
	.loc 1 226 59
	sub	rax, rcx	# _70, _74
	mov	rdx, rax	# _75, _70
# /home/jscha/dvp/cpumon/src/sysfs.c:226:             load[core] = (100 * (work_jiffies_after[core] - work_jiffies_before[core])) / 1;     // pick the next closest difference to zero
	.loc 1 226 89
	mov	rax, rdx	# tmp272, _75
	sal	rax, 2	# tmp272,
	add	rax, rdx	# tmp272, _75
	lea	rdx, 0[0+rax*4]	# tmp273,
	add	rax, rdx	# tmp272, tmp273
	sal	rax, 2	# tmp274,
	mov	rcx, rax	# _76, tmp272
# /home/jscha/dvp/cpumon/src/sysfs.c:226:             load[core] = (100 * (work_jiffies_after[core] - work_jiffies_before[core])) / 1;     // pick the next closest difference to zero
	.loc 1 226 17
	mov	eax, DWORD PTR -8384[rbp]	# tmp275, core
	cdqe
	lea	rdx, 0[0+rax*4]	# _78,
	mov	rax, QWORD PTR -8408[rbp]	# tmp276, load
	add	rax, rdx	# _79, _78
# /home/jscha/dvp/cpumon/src/sysfs.c:226:             load[core] = (100 * (work_jiffies_after[core] - work_jiffies_before[core])) / 1;     // pick the next closest difference to zero
	.loc 1 226 24
	pxor	xmm0, xmm0	# _80
	cvtsi2ss	xmm0, rcx	# _80, _76
	movss	DWORD PTR [rax], xmm0	# *_79, _80
.L59:
# /home/jscha/dvp/cpumon/src/sysfs.c:228:         total += load[core];
	.loc 1 228 22 discriminator 2
	mov	eax, DWORD PTR -8384[rbp]	# tmp277, core
	cdqe
	lea	rdx, 0[0+rax*4]	# _82,
	mov	rax, QWORD PTR -8408[rbp]	# tmp278, load
	add	rax, rdx	# _83, _82
	movss	xmm0, DWORD PTR [rax]	# _84, *_83
# /home/jscha/dvp/cpumon/src/sysfs.c:228:         total += load[core];
	.loc 1 228 15 discriminator 2
	movss	xmm1, DWORD PTR -8392[rbp]	# tmp280, total
	addss	xmm0, xmm1	# tmp279, tmp280
	movss	DWORD PTR -8392[rbp], xmm0	# total, tmp279
# /home/jscha/dvp/cpumon/src/sysfs.c:222:     for (int core = 0; core < (core_count); core++){
	.loc 1 222 49 discriminator 2
	add	DWORD PTR -8384[rbp], 1	# core,
.L57:
# /home/jscha/dvp/cpumon/src/sysfs.c:222:     for (int core = 0; core < (core_count); core++){
	.loc 1 222 29 discriminator 1
	mov	eax, DWORD PTR -8384[rbp]	# tmp281, core
	cmp	eax, DWORD PTR -8436[rbp]	# tmp281, core_count
	jl	.L60	#,
.LBE9:
# /home/jscha/dvp/cpumon/src/sysfs.c:231:     *average = total / core_count;
	.loc 1 231 22
	pxor	xmm1, xmm1	# _85
	cvtsi2ss	xmm1, DWORD PTR -8436[rbp]	# _85, core_count
	movss	xmm0, DWORD PTR -8392[rbp]	# tmp282, total
	divss	xmm0, xmm1	# _86, _85
# /home/jscha/dvp/cpumon/src/sysfs.c:231:     *average = total / core_count;
	.loc 1 231 14
	mov	rax, QWORD PTR -8416[rbp]	# tmp283, average
	movss	DWORD PTR [rax], xmm0	# *average_144(D), _86
.LBB10:
# /home/jscha/dvp/cpumon/src/sysfs.c:234:     for (int i = 0; i < (core_count); i++){
	.loc 1 234 14
	mov	DWORD PTR -8380[rbp], 0	# i,
# /home/jscha/dvp/cpumon/src/sysfs.c:234:     for (int i = 0; i < (core_count); i++){
	.loc 1 234 5
	jmp	.L61	#
.L62:
# /home/jscha/dvp/cpumon/src/sysfs.c:235:         work_jiffies_before[i] = work_jiffies_after[i];
	.loc 1 235 28 discriminator 3
	mov	eax, DWORD PTR -8380[rbp]	# tmp284, i
	cdqe
	lea	rdx, 0[0+rax*8]	# _88,
	mov	rax, QWORD PTR -8424[rbp]	# tmp285, work_jiffies_before
	lea	rcx, [rdx+rax]	# _89,
# /home/jscha/dvp/cpumon/src/sysfs.c:235:         work_jiffies_before[i] = work_jiffies_after[i];
	.loc 1 235 52 discriminator 3
	mov	rax, QWORD PTR -8304[rbp]	# tmp286, work_jiffies_after.4
	mov	edx, DWORD PTR -8380[rbp]	# tmp288, i
	movsx	rdx, edx	# tmp287, tmp288
	mov	rax, QWORD PTR [rax+rdx*8]	# _90, (*work_jiffies_after.4_121)[i_98]
# /home/jscha/dvp/cpumon/src/sysfs.c:235:         work_jiffies_before[i] = work_jiffies_after[i];
	.loc 1 235 32 discriminator 3
	mov	QWORD PTR [rcx], rax	# *_89, _90
# /home/jscha/dvp/cpumon/src/sysfs.c:236:         total_jiffies_before[i] = total_jiffies_after[i];
	.loc 1 236 29 discriminator 3
	mov	eax, DWORD PTR -8380[rbp]	# tmp289, i
	cdqe
	lea	rdx, 0[0+rax*8]	# _92,
	mov	rax, QWORD PTR -8432[rbp]	# tmp290, total_jiffies_before
	lea	rcx, [rdx+rax]	# _93,
# /home/jscha/dvp/cpumon/src/sysfs.c:236:         total_jiffies_before[i] = total_jiffies_after[i];
	.loc 1 236 54 discriminator 3
	mov	rax, QWORD PTR -8288[rbp]	# tmp291, total_jiffies_after.6
	mov	edx, DWORD PTR -8380[rbp]	# tmp293, i
	movsx	rdx, edx	# tmp292, tmp293
	mov	rax, QWORD PTR [rax+rdx*8]	# _94, (*total_jiffies_after.6_129)[i_98]
# /home/jscha/dvp/cpumon/src/sysfs.c:236:         total_jiffies_before[i] = total_jiffies_after[i];
	.loc 1 236 33 discriminator 3
	mov	QWORD PTR [rcx], rax	# *_93, _94
# /home/jscha/dvp/cpumon/src/sysfs.c:234:     for (int i = 0; i < (core_count); i++){
	.loc 1 234 40 discriminator 3
	add	DWORD PTR -8380[rbp], 1	# i,
.L61:
# /home/jscha/dvp/cpumon/src/sysfs.c:234:     for (int i = 0; i < (core_count); i++){
	.loc 1 234 23 discriminator 1
	mov	eax, DWORD PTR -8380[rbp]	# tmp294, i
	cmp	eax, DWORD PTR -8436[rbp]	# tmp294, core_count
	jl	.L62	#,
.LBE10:
	mov	rsp, rbx	#, saved_stack.17_109
# /home/jscha/dvp/cpumon/src/sysfs.c:238: }
	.loc 1 238 1
	nop	
	mov	rax, QWORD PTR -56[rbp]	# tmp300, D.4818
	sub	rax, QWORD PTR fs:40	# tmp300, MEM[(<address-space-1> long unsigned int *)40B]
	je	.L63	#,
	call	__stack_chk_fail@PLT	#
.L63:
	lea	rsp, -40[rbp]	#,
	pop	rbx	#
	pop	r12	#
	pop	r13	#
	pop	r14	#
	pop	r15	#
	pop	rbp	#
.LCFI23:
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE13:
	.size	cpucore_load, .-cpucore_load
	.section	.rodata
	.align 8
.LC36:
	.string	"/sys/class/drm/card0/gt_cur_freq_mhz"
	.text
	.globl	gpu
	.type	gpu, @function
gpu:
.LFB14:
	.loc 1 242 14
	.cfi_startproc
	endbr64	
	push	rbp	#
.LCFI24:
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
.LCFI25:
	.cfi_def_cfa_register 6
	sub	rsp, 96	#,
# /home/jscha/dvp/cpumon/src/sysfs.c:242: int gpu(void){
	.loc 1 242 14
	mov	rax, QWORD PTR fs:40	# tmp90, MEM[(<address-space-1> long unsigned int *)40B]
	mov	QWORD PTR -8[rbp], rax	# D.4826, tmp90
	xor	eax, eax	# tmp90
# /home/jscha/dvp/cpumon/src/sysfs.c:245:     int freq_mhz = 0;
	.loc 1 245 9
	mov	DWORD PTR -88[rbp], 0	# freq_mhz,
# /home/jscha/dvp/cpumon/src/sysfs.c:247:     int return_val = read_line(file_buf, "/sys/class/drm/card0/gt_cur_freq_mhz");
	.loc 1 247 22
	lea	rax, -80[rbp]	# tmp84,
	lea	rdx, .LC36[rip]	# tmp85,
	mov	rsi, rdx	#, tmp85
	mov	rdi, rax	#, tmp84
	call	read_line@PLT	#
	mov	DWORD PTR -84[rbp], eax	# return_val, tmp86
# /home/jscha/dvp/cpumon/src/sysfs.c:249:     if (return_val == 0)
	.loc 1 249 8
	cmp	DWORD PTR -84[rbp], 0	# return_val,
	jne	.L66	#,
# /home/jscha/dvp/cpumon/src/sysfs.c:251:         return freq_mhz = atoi(file_buf);
	.loc 1 251 27
	lea	rax, -80[rbp]	# tmp87,
	mov	rdi, rax	#, tmp87
	call	atoi@PLT	#
	mov	DWORD PTR -88[rbp], eax	# freq_mhz, tmp88
# /home/jscha/dvp/cpumon/src/sysfs.c:251:         return freq_mhz = atoi(file_buf);
	.loc 1 251 25
	mov	eax, DWORD PTR -88[rbp]	# _1, freq_mhz
	jmp	.L68	#
.L66:
# /home/jscha/dvp/cpumon/src/sysfs.c:255:         return return_val;
	.loc 1 255 16
	mov	eax, DWORD PTR -84[rbp]	# _1, return_val
.L68:
# /home/jscha/dvp/cpumon/src/sysfs.c:270: }
	.loc 1 270 1 discriminator 1
	mov	rdx, QWORD PTR -8[rbp]	# tmp91, D.4826
	sub	rdx, QWORD PTR fs:40	# tmp91, MEM[(<address-space-1> long unsigned int *)40B]
	je	.L69	#,
# /home/jscha/dvp/cpumon/src/sysfs.c:270: }
	.loc 1 270 1 is_stmt 0
	call	__stack_chk_fail@PLT	#
.L69:
	leave	
.LCFI26:
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE14:
	.size	gpu, .-gpu
	.local	power_limits.0
	.comm	power_limits.0,8,8
	.section	.rodata
	.align 8
.LC21:
	.long	-1598689907
	.long	1051772663
	.align 8
.LC24:
	.long	-2127697391
	.long	1030854553
	.align 4
.LC29:
	.long	1232348160
	.align 4
.LC30:
	.long	-1082130432
	.text
.Letext0:
	.file 2 "/usr/lib/gcc/x86_64-linux-gnu/11/include/stddef.h"
	.file 3 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 4 "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h"
	.file 5 "/usr/include/x86_64-linux-gnu/bits/types/FILE.h"
	.file 6 "/home/jscha/dvp/cpumon/src/../include/cpumonlib.h"
	.file 7 "/usr/include/stdlib.h"
	.file 8 "/usr/include/string.h"
	.file 9 "/usr/include/curses.h"
	.file 10 "/usr/include/stdio.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xb59
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF1534
	.byte	0xc
	.long	.LASF1535
	.long	.LASF1536
	.quad	.Ltext0
	.quad	.Letext0
	.long	.Ldebug_line0
	.long	.Ldebug_macro0
	.uleb128 0x2
	.long	.LASF1432
	.byte	0x2
	.byte	0xd1
	.byte	0x1b
	.long	0x3d
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF1425
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF1426
	.uleb128 0x4
	.byte	0x8
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF1427
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF1428
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF1429
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF1430
	.uleb128 0x5
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF1431
	.uleb128 0x2
	.long	.LASF1433
	.byte	0x3
	.byte	0x98
	.byte	0x12
	.long	0x70
	.uleb128 0x2
	.long	.LASF1434
	.byte	0x3
	.byte	0x99
	.byte	0x12
	.long	0x70
	.uleb128 0x6
	.long	0x69
	.long	0x9f
	.uleb128 0x7
	.long	0x3d
	.byte	0x1
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0xa5
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF1435
	.uleb128 0x9
	.long	0xa5
	.uleb128 0xa
	.long	.LASF1537
	.byte	0xd8
	.byte	0x4
	.byte	0x31
	.byte	0x8
	.long	0x27e
	.uleb128 0xb
	.long	.LASF1436
	.byte	0x4
	.byte	0x33
	.byte	0x7
	.long	0x69
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0xb
	.long	.LASF1437
	.byte	0x4
	.byte	0x36
	.byte	0x9
	.long	0x9f
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xb
	.long	.LASF1438
	.byte	0x4
	.byte	0x37
	.byte	0x9
	.long	0x9f
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xb
	.long	.LASF1439
	.byte	0x4
	.byte	0x38
	.byte	0x9
	.long	0x9f
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xb
	.long	.LASF1440
	.byte	0x4
	.byte	0x39
	.byte	0x9
	.long	0x9f
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0xb
	.long	.LASF1441
	.byte	0x4
	.byte	0x3a
	.byte	0x9
	.long	0x9f
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0xb
	.long	.LASF1442
	.byte	0x4
	.byte	0x3b
	.byte	0x9
	.long	0x9f
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0xb
	.long	.LASF1443
	.byte	0x4
	.byte	0x3c
	.byte	0x9
	.long	0x9f
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.uleb128 0xb
	.long	.LASF1444
	.byte	0x4
	.byte	0x3d
	.byte	0x9
	.long	0x9f
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0xb
	.long	.LASF1445
	.byte	0x4
	.byte	0x40
	.byte	0x9
	.long	0x9f
	.byte	0x2
	.byte	0x23
	.uleb128 0x48
	.uleb128 0xb
	.long	.LASF1446
	.byte	0x4
	.byte	0x41
	.byte	0x9
	.long	0x9f
	.byte	0x2
	.byte	0x23
	.uleb128 0x50
	.uleb128 0xb
	.long	.LASF1447
	.byte	0x4
	.byte	0x42
	.byte	0x9
	.long	0x9f
	.byte	0x2
	.byte	0x23
	.uleb128 0x58
	.uleb128 0xb
	.long	.LASF1448
	.byte	0x4
	.byte	0x44
	.byte	0x16
	.long	0x298
	.byte	0x2
	.byte	0x23
	.uleb128 0x60
	.uleb128 0xb
	.long	.LASF1449
	.byte	0x4
	.byte	0x46
	.byte	0x14
	.long	0x29e
	.byte	0x2
	.byte	0x23
	.uleb128 0x68
	.uleb128 0xb
	.long	.LASF1450
	.byte	0x4
	.byte	0x48
	.byte	0x7
	.long	0x69
	.byte	0x2
	.byte	0x23
	.uleb128 0x70
	.uleb128 0xb
	.long	.LASF1451
	.byte	0x4
	.byte	0x49
	.byte	0x7
	.long	0x69
	.byte	0x2
	.byte	0x23
	.uleb128 0x74
	.uleb128 0xb
	.long	.LASF1452
	.byte	0x4
	.byte	0x4a
	.byte	0xb
	.long	0x77
	.byte	0x2
	.byte	0x23
	.uleb128 0x78
	.uleb128 0xb
	.long	.LASF1453
	.byte	0x4
	.byte	0x4d
	.byte	0x12
	.long	0x54
	.byte	0x3
	.byte	0x23
	.uleb128 0x80
	.uleb128 0xb
	.long	.LASF1454
	.byte	0x4
	.byte	0x4e
	.byte	0xf
	.long	0x5b
	.byte	0x3
	.byte	0x23
	.uleb128 0x82
	.uleb128 0xb
	.long	.LASF1455
	.byte	0x4
	.byte	0x4f
	.byte	0x8
	.long	0x2a4
	.byte	0x3
	.byte	0x23
	.uleb128 0x83
	.uleb128 0xb
	.long	.LASF1456
	.byte	0x4
	.byte	0x51
	.byte	0xf
	.long	0x2b4
	.byte	0x3
	.byte	0x23
	.uleb128 0x88
	.uleb128 0xb
	.long	.LASF1457
	.byte	0x4
	.byte	0x59
	.byte	0xd
	.long	0x83
	.byte	0x3
	.byte	0x23
	.uleb128 0x90
	.uleb128 0xb
	.long	.LASF1458
	.byte	0x4
	.byte	0x5b
	.byte	0x17
	.long	0x2c0
	.byte	0x3
	.byte	0x23
	.uleb128 0x98
	.uleb128 0xb
	.long	.LASF1459
	.byte	0x4
	.byte	0x5c
	.byte	0x19
	.long	0x2cc
	.byte	0x3
	.byte	0x23
	.uleb128 0xa0
	.uleb128 0xb
	.long	.LASF1460
	.byte	0x4
	.byte	0x5d
	.byte	0x14
	.long	0x29e
	.byte	0x3
	.byte	0x23
	.uleb128 0xa8
	.uleb128 0xb
	.long	.LASF1461
	.byte	0x4
	.byte	0x5e
	.byte	0x9
	.long	0x4b
	.byte	0x3
	.byte	0x23
	.uleb128 0xb0
	.uleb128 0xb
	.long	.LASF1462
	.byte	0x4
	.byte	0x5f
	.byte	0xa
	.long	0x31
	.byte	0x3
	.byte	0x23
	.uleb128 0xb8
	.uleb128 0xb
	.long	.LASF1463
	.byte	0x4
	.byte	0x60
	.byte	0x7
	.long	0x69
	.byte	0x3
	.byte	0x23
	.uleb128 0xc0
	.uleb128 0xb
	.long	.LASF1464
	.byte	0x4
	.byte	0x62
	.byte	0x8
	.long	0x2d2
	.byte	0x3
	.byte	0x23
	.uleb128 0xc4
	.byte	0
	.uleb128 0x2
	.long	.LASF1465
	.byte	0x5
	.byte	0x7
	.byte	0x19
	.long	0xb1
	.uleb128 0xc
	.long	.LASF1538
	.byte	0x4
	.byte	0x2b
	.byte	0xe
	.uleb128 0xd
	.long	.LASF1466
	.byte	0x1
	.uleb128 0x8
	.byte	0x8
	.long	0x292
	.uleb128 0x8
	.byte	0x8
	.long	0xb1
	.uleb128 0x6
	.long	0xa5
	.long	0x2b4
	.uleb128 0x7
	.long	0x3d
	.byte	0
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0x28a
	.uleb128 0xd
	.long	.LASF1467
	.byte	0x1
	.uleb128 0x8
	.byte	0x8
	.long	0x2ba
	.uleb128 0xd
	.long	.LASF1468
	.byte	0x1
	.uleb128 0x8
	.byte	0x8
	.long	0x2c6
	.uleb128 0x6
	.long	0xa5
	.long	0x2e2
	.uleb128 0x7
	.long	0x3d
	.byte	0x13
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0x27e
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF1469
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF1470
	.uleb128 0x8
	.byte	0x8
	.long	0xac
	.uleb128 0x3
	.byte	0x1
	.byte	0x2
	.long	.LASF1471
	.uleb128 0x3
	.byte	0x4
	.byte	0x4
	.long	.LASF1472
	.uleb128 0xe
	.byte	0x7
	.byte	0x4
	.long	0x44
	.byte	0x6
	.byte	0x32
	.byte	0xe
	.long	0x325
	.uleb128 0xf
	.long	.LASF1473
	.byte	0
	.uleb128 0x10
	.string	"AMD"
	.byte	0x1
	.byte	0
	.uleb128 0x2
	.long	.LASF1474
	.byte	0x6
	.byte	0x32
	.byte	0x1d
	.long	0x30a
	.uleb128 0x11
	.byte	0x1
	.long	.LASF1475
	.byte	0x7
	.byte	0x69
	.byte	0xc
	.byte	0x1
	.long	0x69
	.byte	0x1
	.long	0x34a
	.uleb128 0x12
	.long	0x2f6
	.byte	0
	.uleb128 0x11
	.byte	0x1
	.long	.LASF1476
	.byte	0x7
	.byte	0xb1
	.byte	0x11
	.byte	0x1
	.long	0x70
	.byte	0x1
	.long	0x36d
	.uleb128 0x12
	.long	0x2f6
	.uleb128 0x12
	.long	0x36d
	.uleb128 0x12
	.long	0x69
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0x9f
	.uleb128 0x11
	.byte	0x1
	.long	.LASF1477
	.byte	0x8
	.byte	0x8d
	.byte	0xe
	.byte	0x1
	.long	0x9f
	.byte	0x1
	.long	0x391
	.uleb128 0x12
	.long	0x9f
	.uleb128 0x12
	.long	0x2f6
	.byte	0
	.uleb128 0x11
	.byte	0x1
	.long	.LASF1478
	.byte	0x8
	.byte	0x9c
	.byte	0xc
	.byte	0x1
	.long	0x69
	.byte	0x1
	.long	0x3af
	.uleb128 0x12
	.long	0x2f6
	.uleb128 0x12
	.long	0x2f6
	.byte	0
	.uleb128 0x11
	.byte	0x1
	.long	.LASF1479
	.byte	0x6
	.byte	0x37
	.byte	0x5
	.byte	0x1
	.long	0x69
	.byte	0x1
	.long	0x3cd
	.uleb128 0x12
	.long	0x9f
	.uleb128 0x12
	.long	0x2f6
	.byte	0
	.uleb128 0x11
	.byte	0x1
	.long	.LASF1480
	.byte	0x6
	.byte	0x36
	.byte	0x7
	.byte	0x1
	.long	0x9f
	.byte	0x1
	.long	0x3e6
	.uleb128 0x12
	.long	0x2f6
	.byte	0
	.uleb128 0x13
	.byte	0x1
	.long	.LASF1481
	.byte	0x9
	.value	0x2f9
	.byte	0xc
	.byte	0x1
	.long	0x69
	.byte	0x1
	.long	0x401
	.uleb128 0x12
	.long	0x2f6
	.uleb128 0x14
	.byte	0
	.uleb128 0x13
	.byte	0x1
	.long	.LASF1482
	.byte	0xa
	.value	0x164
	.byte	0xc
	.byte	0x1
	.long	0x69
	.byte	0x1
	.long	0x41c
	.uleb128 0x12
	.long	0x2f6
	.uleb128 0x14
	.byte	0
	.uleb128 0x13
	.byte	0x1
	.long	.LASF1483
	.byte	0xa
	.value	0x166
	.byte	0xc
	.byte	0x1
	.long	0x69
	.byte	0x1
	.long	0x43c
	.uleb128 0x12
	.long	0x9f
	.uleb128 0x12
	.long	0x2f6
	.uleb128 0x14
	.byte	0
	.uleb128 0x11
	.byte	0x1
	.long	.LASF1484
	.byte	0xa
	.byte	0xb2
	.byte	0xc
	.byte	0x1
	.long	0x69
	.byte	0x1
	.long	0x455
	.uleb128 0x12
	.long	0x2e2
	.byte	0
	.uleb128 0x15
	.byte	0x1
	.long	.LASF1539
	.byte	0xa
	.value	0x1b7
	.byte	0xc
	.long	.LASF1540
	.byte	0x1
	.long	0x69
	.byte	0x1
	.long	0x479
	.uleb128 0x12
	.long	0x2f6
	.uleb128 0x12
	.long	0x2f6
	.uleb128 0x14
	.byte	0
	.uleb128 0x11
	.byte	0x1
	.long	.LASF1485
	.byte	0x8
	.byte	0x9f
	.byte	0xc
	.byte	0x1
	.long	0x69
	.byte	0x1
	.long	0x49c
	.uleb128 0x12
	.long	0x2f6
	.uleb128 0x12
	.long	0x2f6
	.uleb128 0x12
	.long	0x31
	.byte	0
	.uleb128 0x13
	.byte	0x1
	.long	.LASF1486
	.byte	0xa
	.value	0x250
	.byte	0xe
	.byte	0x1
	.long	0x9f
	.byte	0x1
	.long	0x4c0
	.uleb128 0x12
	.long	0x9f
	.uleb128 0x12
	.long	0x69
	.uleb128 0x12
	.long	0x2e2
	.byte	0
	.uleb128 0x13
	.byte	0x1
	.long	.LASF1487
	.byte	0x7
	.value	0x21c
	.byte	0xe
	.byte	0x1
	.long	0x4b
	.byte	0x1
	.long	0x4da
	.uleb128 0x12
	.long	0x31
	.byte	0
	.uleb128 0x16
	.byte	0x1
	.long	.LASF1541
	.byte	0xa
	.value	0x324
	.byte	0xd
	.byte	0x1
	.byte	0x1
	.long	0x4f0
	.uleb128 0x12
	.long	0x2f6
	.byte	0
	.uleb128 0x13
	.byte	0x1
	.long	.LASF1488
	.byte	0xa
	.value	0x102
	.byte	0xe
	.byte	0x1
	.long	0x2e2
	.byte	0x1
	.long	0x50f
	.uleb128 0x12
	.long	0x2f6
	.uleb128 0x12
	.long	0x2f6
	.byte	0
	.uleb128 0x17
	.byte	0x1
	.string	"gpu"
	.byte	0x1
	.byte	0xf2
	.byte	0x5
	.byte	0x1
	.long	0x69
	.quad	.LFB14
	.quad	.LFE14
	.long	.LLST8
	.byte	0x1
	.long	0x567
	.uleb128 0x18
	.long	.LASF1489
	.byte	0x1
	.byte	0xf4
	.byte	0xa
	.long	0x567
	.byte	0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x18
	.long	.LASF1490
	.byte	0x1
	.byte	0xf5
	.byte	0x9
	.long	0x69
	.byte	0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0x18
	.long	.LASF1491
	.byte	0x1
	.byte	0xf7
	.byte	0x9
	.long	0x69
	.byte	0x3
	.byte	0x91
	.sleb128 -100
	.byte	0
	.uleb128 0x6
	.long	0xa5
	.long	0x577
	.uleb128 0x7
	.long	0x3d
	.byte	0x3f
	.byte	0
	.uleb128 0x19
	.byte	0x1
	.long	.LASF1509
	.byte	0x1
	.byte	0xb7
	.byte	0x6
	.byte	0x1
	.quad	.LFB13
	.quad	.LFE13
	.long	.LLST7
	.byte	0x1
	.long	0x74e
	.uleb128 0x1a
	.long	.LASF1492
	.byte	0x1
	.byte	0xb7
	.byte	0x1a
	.long	0x74e
	.byte	0x4
	.byte	0x91
	.sleb128 -8424
	.uleb128 0x1a
	.long	.LASF1493
	.byte	0x1
	.byte	0xb7
	.byte	0x28
	.long	0x74e
	.byte	0x4
	.byte	0x91
	.sleb128 -8432
	.uleb128 0x1a
	.long	.LASF1494
	.byte	0x1
	.byte	0xb7
	.byte	0x3c
	.long	0x754
	.byte	0x4
	.byte	0x91
	.sleb128 -8440
	.uleb128 0x1a
	.long	.LASF1495
	.byte	0x1
	.byte	0xb7
	.byte	0x5c
	.long	0x754
	.byte	0x4
	.byte	0x91
	.sleb128 -8448
	.uleb128 0x1a
	.long	.LASF1496
	.byte	0x1
	.byte	0xb7
	.byte	0x76
	.long	0x69
	.byte	0x4
	.byte	0x91
	.sleb128 -8452
	.uleb128 0x1b
	.string	"fp"
	.byte	0x1
	.byte	0xb9
	.byte	0xb
	.long	0x2e2
	.byte	0x4
	.byte	0x91
	.sleb128 -8336
	.uleb128 0x18
	.long	.LASF1489
	.byte	0x1
	.byte	0xbe
	.byte	0xa
	.long	0x75a
	.byte	0x4
	.byte	0x91
	.sleb128 -8272
	.uleb128 0x18
	.long	.LASF1497
	.byte	0x1
	.byte	0xbf
	.byte	0xb
	.long	0x9f
	.byte	0x4
	.byte	0x91
	.sleb128 -8296
	.uleb128 0x18
	.long	.LASF1498
	.byte	0x1
	.byte	0xc0
	.byte	0xf
	.long	0x2e8
	.byte	0x4
	.byte	0x91
	.sleb128 -8392
	.uleb128 0x18
	.long	.LASF1499
	.byte	0x1
	.byte	0xc0
	.byte	0x15
	.long	0x2e8
	.byte	0x4
	.byte	0x91
	.sleb128 -8384
	.uleb128 0x18
	.long	.LASF1500
	.byte	0x1
	.byte	0xc0
	.byte	0x1b
	.long	0x2e8
	.byte	0x4
	.byte	0x91
	.sleb128 -8376
	.uleb128 0x18
	.long	.LASF1501
	.byte	0x1
	.byte	0xc0
	.byte	0x23
	.long	0x2e8
	.byte	0x4
	.byte	0x91
	.sleb128 -8368
	.uleb128 0x18
	.long	.LASF1502
	.byte	0x1
	.byte	0xc0
	.byte	0x29
	.long	0x2e8
	.byte	0x4
	.byte	0x91
	.sleb128 -8360
	.uleb128 0x1b
	.string	"irq"
	.byte	0x1
	.byte	0xc0
	.byte	0x31
	.long	0x2e8
	.byte	0x4
	.byte	0x91
	.sleb128 -8352
	.uleb128 0x18
	.long	.LASF1503
	.byte	0x1
	.byte	0xc0
	.byte	0x36
	.long	0x2e8
	.byte	0x4
	.byte	0x91
	.sleb128 -8344
	.uleb128 0x18
	.long	.LASF1504
	.byte	0x1
	.byte	0xc1
	.byte	0xf
	.long	0x76b
	.byte	0x5
	.byte	0x91
	.sleb128 -8320
	.byte	0x6
	.uleb128 0x18
	.long	.LASF1505
	.byte	0x1
	.byte	0xc2
	.byte	0xf
	.long	0x780
	.byte	0x5
	.byte	0x91
	.sleb128 -8304
	.byte	0x6
	.uleb128 0x18
	.long	.LASF1506
	.byte	0x1
	.byte	0xc3
	.byte	0xa
	.long	0x795
	.byte	0x4
	.byte	0x91
	.sleb128 -8288
	.uleb128 0x18
	.long	.LASF1507
	.byte	0x1
	.byte	0xc4
	.byte	0xb
	.long	0x303
	.byte	0x4
	.byte	0x91
	.sleb128 -8408
	.uleb128 0x1c
	.quad	.LBB8
	.quad	.LBE8
	.long	0x705
	.uleb128 0x18
	.long	.LASF1508
	.byte	0x1
	.byte	0xcb
	.byte	0x12
	.long	0x69
	.byte	0x4
	.byte	0x91
	.sleb128 -8404
	.byte	0
	.uleb128 0x1c
	.quad	.LBB9
	.quad	.LBE9
	.long	0x72c
	.uleb128 0x18
	.long	.LASF1508
	.byte	0x1
	.byte	0xde
	.byte	0xe
	.long	0x69
	.byte	0x4
	.byte	0x91
	.sleb128 -8400
	.byte	0
	.uleb128 0x1d
	.quad	.LBB10
	.quad	.LBE10
	.uleb128 0x1b
	.string	"i"
	.byte	0x1
	.byte	0xea
	.byte	0xe
	.long	0x69
	.byte	0x4
	.byte	0x91
	.sleb128 -8396
	.byte	0
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0x303
	.uleb128 0x8
	.byte	0x8
	.long	0x2e8
	.uleb128 0x6
	.long	0xa5
	.long	0x76b
	.uleb128 0x1e
	.long	0x3d
	.value	0x1fff
	.byte	0
	.uleb128 0x6
	.long	0x2e8
	.long	0x780
	.uleb128 0x1f
	.long	0x3d
	.byte	0x5
	.byte	0x91
	.sleb128 -8328
	.byte	0x6
	.byte	0
	.uleb128 0x6
	.long	0x2e8
	.long	0x795
	.uleb128 0x1f
	.long	0x3d
	.byte	0x5
	.byte	0x91
	.sleb128 -8312
	.byte	0x6
	.byte	0
	.uleb128 0x6
	.long	0xa5
	.long	0x7a5
	.uleb128 0x7
	.long	0x3d
	.byte	0xf
	.byte	0
	.uleb128 0x19
	.byte	0x1
	.long	.LASF1510
	.byte	0x1
	.byte	0x9f
	.byte	0x6
	.byte	0x1
	.quad	.LFB12
	.quad	.LFE12
	.long	.LLST6
	.byte	0x1
	.long	0x849
	.uleb128 0x1a
	.long	.LASF1511
	.byte	0x1
	.byte	0x9f
	.byte	0x1c
	.long	0x74e
	.byte	0x3
	.byte	0x91
	.sleb128 -184
	.uleb128 0x1a
	.long	.LASF1493
	.byte	0x1
	.byte	0x9f
	.byte	0x2d
	.long	0x74e
	.byte	0x3
	.byte	0x91
	.sleb128 -192
	.uleb128 0x1a
	.long	.LASF1496
	.byte	0x1
	.byte	0x9f
	.byte	0x3a
	.long	0x69
	.byte	0x3
	.byte	0x91
	.sleb128 -196
	.uleb128 0x18
	.long	.LASF1489
	.byte	0x1
	.byte	0xa2
	.byte	0xa
	.long	0x567
	.byte	0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0x18
	.long	.LASF1512
	.byte	0x1
	.byte	0xa3
	.byte	0xa
	.long	0x849
	.byte	0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x18
	.long	.LASF1507
	.byte	0x1
	.byte	0xa4
	.byte	0xb
	.long	0x303
	.byte	0x3
	.byte	0x91
	.sleb128 -168
	.uleb128 0x1d
	.quad	.LBB7
	.quad	.LBE7
	.uleb128 0x1b
	.string	"i"
	.byte	0x1
	.byte	0xa6
	.byte	0xe
	.long	0x69
	.byte	0x3
	.byte	0x91
	.sleb128 -164
	.byte	0
	.byte	0
	.uleb128 0x6
	.long	0xa5
	.long	0x859
	.uleb128 0x7
	.long	0x3d
	.byte	0x45
	.byte	0
	.uleb128 0x19
	.byte	0x1
	.long	.LASF1513
	.byte	0x1
	.byte	0x94
	.byte	0x6
	.byte	0x1
	.quad	.LFB11
	.quad	.LFE11
	.long	.LLST5
	.byte	0x1
	.long	0x8aa
	.uleb128 0x1a
	.long	.LASF1514
	.byte	0x1
	.byte	0x94
	.byte	0x24
	.long	0x74e
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1a
	.long	.LASF1515
	.byte	0x1
	.byte	0x94
	.byte	0x36
	.long	0x9f
	.byte	0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1a
	.long	.LASF1516
	.byte	0x1
	.byte	0x94
	.byte	0x44
	.long	0x9f
	.byte	0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.uleb128 0x20
	.byte	0x1
	.long	.LASF1517
	.byte	0x1
	.byte	0x84
	.byte	0x5
	.byte	0x1
	.long	0x69
	.quad	.LFB10
	.quad	.LFE10
	.long	.LLST4
	.byte	0x1
	.long	0x8e1
	.uleb128 0x1a
	.long	.LASF1515
	.byte	0x1
	.byte	0x84
	.byte	0x1e
	.long	0x9f
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x20
	.byte	0x1
	.long	.LASF1518
	.byte	0x1
	.byte	0x6b
	.byte	0x5
	.byte	0x1
	.long	0x69
	.quad	.LFB9
	.quad	.LFE9
	.long	.LLST3
	.byte	0x1
	.long	0x98c
	.uleb128 0x1a
	.long	.LASF1519
	.byte	0x1
	.byte	0x6b
	.byte	0x26
	.long	0x74e
	.byte	0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x18
	.long	.LASF1520
	.byte	0x1
	.byte	0x6d
	.byte	0xa
	.long	0x98c
	.byte	0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x18
	.long	.LASF1521
	.byte	0x1
	.byte	0x6e
	.byte	0xa
	.long	0x98c
	.byte	0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1c
	.quad	.LBB5
	.quad	.LBE5
	.long	0x95b
	.uleb128 0x18
	.long	.LASF1522
	.byte	0x1
	.byte	0x72
	.byte	0xe
	.long	0x70
	.byte	0x2
	.byte	0x91
	.sleb128 -56
	.byte	0
	.uleb128 0x1d
	.quad	.LBB6
	.quad	.LBE6
	.uleb128 0x18
	.long	.LASF1523
	.byte	0x1
	.byte	0x79
	.byte	0xe
	.long	0x70
	.byte	0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x18
	.long	.LASF1524
	.byte	0x1
	.byte	0x7b
	.byte	0xe
	.long	0x70
	.byte	0x2
	.byte	0x91
	.sleb128 -56
	.byte	0
	.byte	0
	.uleb128 0x6
	.long	0xa5
	.long	0x99c
	.uleb128 0x7
	.long	0x3d
	.byte	0xb
	.byte	0
	.uleb128 0x19
	.byte	0x1
	.long	.LASF1525
	.byte	0x1
	.byte	0x49
	.byte	0x6
	.byte	0x1
	.quad	.LFB8
	.quad	.LFE8
	.long	.LLST2
	.byte	0x1
	.long	0xa0e
	.uleb128 0x1a
	.long	.LASF1526
	.byte	0x1
	.byte	0x49
	.byte	0x17
	.long	0x2fc
	.byte	0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1a
	.long	.LASF1527
	.byte	0x1
	.byte	0x49
	.byte	0x3f
	.long	0x325
	.byte	0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x18
	.long	.LASF1528
	.byte	0x1
	.byte	0x52
	.byte	0xb
	.long	0x9f
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1d
	.quad	.LBB4
	.quad	.LBE4
	.uleb128 0x18
	.long	.LASF1529
	.byte	0x1
	.byte	0x4d
	.byte	0xe
	.long	0xa0e
	.byte	0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.long	0x69
	.uleb128 0x20
	.byte	0x1
	.long	.LASF1530
	.byte	0x1
	.byte	0x2a
	.byte	0x7
	.byte	0x1
	.long	0xa0e
	.quad	.LFB7
	.quad	.LFE7
	.long	.LLST1
	.byte	0x1
	.long	0xad5
	.uleb128 0x1b
	.string	"fp"
	.byte	0x1
	.byte	0x2c
	.byte	0xb
	.long	0x2e2
	.byte	0x3
	.byte	0x91
	.sleb128 -376
	.uleb128 0x18
	.long	.LASF1531
	.byte	0x1
	.byte	0x2d
	.byte	0xa
	.long	0x567
	.byte	0x3
	.byte	0x91
	.sleb128 -352
	.uleb128 0x18
	.long	.LASF1522
	.byte	0x1
	.byte	0x2e
	.byte	0xa
	.long	0xad5
	.byte	0x3
	.byte	0x91
	.sleb128 -368
	.uleb128 0x18
	.long	.LASF1529
	.byte	0x1
	.byte	0x2f
	.byte	0x10
	.long	0x8f
	.byte	0x9
	.byte	0x3
	.quad	power_limits.0
	.uleb128 0x18
	.long	.LASF1512
	.byte	0x1
	.byte	0x30
	.byte	0xa
	.long	0xae5
	.byte	0x3
	.byte	0x91
	.sleb128 -288
	.uleb128 0x1c
	.quad	.LBB2
	.quad	.LBE2
	.long	0xab4
	.uleb128 0x1b
	.string	"i"
	.byte	0x1
	.byte	0x32
	.byte	0xf
	.long	0x69
	.byte	0x3
	.byte	0x91
	.sleb128 -384
	.byte	0
	.uleb128 0x1d
	.quad	.LBB3
	.quad	.LBE3
	.uleb128 0x1b
	.string	"i"
	.byte	0x1
	.byte	0x43
	.byte	0xe
	.long	0x69
	.byte	0x3
	.byte	0x91
	.sleb128 -380
	.byte	0
	.byte	0
	.uleb128 0x6
	.long	0x70
	.long	0xae5
	.uleb128 0x7
	.long	0x3d
	.byte	0x1
	.byte	0
	.uleb128 0x6
	.long	0xa5
	.long	0xaf5
	.uleb128 0x7
	.long	0x3d
	.byte	0xff
	.byte	0
	.uleb128 0x21
	.byte	0x1
	.long	.LASF1532
	.byte	0x1
	.byte	0xd
	.byte	0x7
	.byte	0x1
	.long	0x9f
	.quad	.LFB6
	.quad	.LFE6
	.long	.LLST0
	.byte	0x1
	.uleb128 0x1b
	.string	"fp"
	.byte	0x1
	.byte	0xf
	.byte	0xb
	.long	0x2e2
	.byte	0x4
	.byte	0x91
	.sleb128 -8248
	.uleb128 0x18
	.long	.LASF1489
	.byte	0x1
	.byte	0x15
	.byte	0xa
	.long	0x75a
	.byte	0x4
	.byte	0x91
	.sleb128 -8224
	.uleb128 0x18
	.long	.LASF1533
	.byte	0x1
	.byte	0x16
	.byte	0xb
	.long	0x9f
	.byte	0x4
	.byte	0x91
	.sleb128 -8240
	.uleb128 0x18
	.long	.LASF1497
	.byte	0x1
	.byte	0x17
	.byte	0xb
	.long	0x9f
	.byte	0x4
	.byte	0x91
	.sleb128 -8232
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
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
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
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0xd
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.uleb128 0xf
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1c
	.uleb128 0xb
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
	.uleb128 0x12
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x15
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
	.uleb128 0x16
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
	.uleb128 0x17
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
	.uleb128 0x18
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
	.uleb128 0x19
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
	.uleb128 0x1a
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
	.uleb128 0x1b
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
	.uleb128 0x1c
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
	.uleb128 0x1d
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x20
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
	.uleb128 0x21
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
.LLST8:
	.quad	.LFB14-.Ltext0
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
	.quad	.LFE14-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	0
	.quad	0
.LLST7:
	.quad	.LFB13-.Ltext0
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
	.quad	.LFE13-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	0
	.quad	0
.LLST6:
	.quad	.LFB12-.Ltext0
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
	.quad	.LFE12-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	0
	.quad	0
.LLST5:
	.quad	.LFB11-.Ltext0
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
	.quad	.LFE11-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	0
	.quad	0
.LLST4:
	.quad	.LFB10-.Ltext0
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
	.quad	.LFE10-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	0
	.quad	0
.LLST3:
	.quad	.LFB9-.Ltext0
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
	.quad	.LFE9-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	0
	.quad	0
.LLST2:
	.quad	.LFB8-.Ltext0
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
	.quad	.LFE8-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	0
	.quad	0
.LLST1:
	.quad	.LFB7-.Ltext0
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
	.quad	.LFE7-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	0
	.quad	0
.LLST0:
	.quad	.LFB6-.Ltext0
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
	.quad	.LFE6-.Ltext0
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
	.file 11 "/usr/include/stdc-predef.h"
	.byte	0x3
	.uleb128 0
	.uleb128 0xb
	.byte	0x7
	.long	.Ldebug_macro2
	.byte	0x4
	.byte	0x3
	.uleb128 0x4
	.uleb128 0xa
	.byte	0x7
	.long	.Ldebug_macro3
	.file 12 "/usr/include/x86_64-linux-gnu/bits/libc-header-start.h"
	.byte	0x3
	.uleb128 0x1b
	.uleb128 0xc
	.byte	0x6
	.uleb128 0x1f
	.long	.LASF369
	.file 13 "/usr/include/features.h"
	.byte	0x3
	.uleb128 0x21
	.uleb128 0xd
	.byte	0x7
	.long	.Ldebug_macro4
	.file 14 "/usr/include/features-time64.h"
	.byte	0x3
	.uleb128 0x188
	.uleb128 0xe
	.file 15 "/usr/include/x86_64-linux-gnu/bits/wordsize.h"
	.byte	0x3
	.uleb128 0x14
	.uleb128 0xf
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.file 16 "/usr/include/x86_64-linux-gnu/bits/timesize.h"
	.byte	0x3
	.uleb128 0x15
	.uleb128 0x10
	.byte	0x3
	.uleb128 0x13
	.uleb128 0xf
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
	.file 17 "/usr/include/x86_64-linux-gnu/sys/cdefs.h"
	.byte	0x3
	.uleb128 0x1e6
	.uleb128 0x11
	.byte	0x7
	.long	.Ldebug_macro7
	.byte	0x3
	.uleb128 0x22f
	.uleb128 0xf
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.file 18 "/usr/include/x86_64-linux-gnu/bits/long-double.h"
	.byte	0x3
	.uleb128 0x230
	.uleb128 0x12
	.byte	0x5
	.uleb128 0x15
	.long	.LASF503
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro8
	.byte	0x4
	.file 19 "/usr/include/x86_64-linux-gnu/gnu/stubs.h"
	.byte	0x3
	.uleb128 0x1fe
	.uleb128 0x13
	.file 20 "/usr/include/x86_64-linux-gnu/gnu/stubs-64.h"
	.byte	0x3
	.uleb128 0xa
	.uleb128 0x14
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
	.file 21 "/usr/lib/gcc/x86_64-linux-gnu/11/include/stdarg.h"
	.byte	0x3
	.uleb128 0x24
	.uleb128 0x15
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
	.uleb128 0xf
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.byte	0x3
	.uleb128 0x1c
	.uleb128 0x10
	.byte	0x3
	.uleb128 0x13
	.uleb128 0xf
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF424
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro14
	.file 22 "/usr/include/x86_64-linux-gnu/bits/typesizes.h"
	.byte	0x3
	.uleb128 0x8d
	.uleb128 0x16
	.byte	0x7
	.long	.Ldebug_macro15
	.byte	0x4
	.file 23 "/usr/include/x86_64-linux-gnu/bits/time64.h"
	.byte	0x3
	.uleb128 0x8e
	.uleb128 0x17
	.byte	0x7
	.long	.Ldebug_macro16
	.byte	0x4
	.byte	0x6
	.uleb128 0xe2
	.long	.LASF629
	.byte	0x4
	.file 24 "/usr/include/x86_64-linux-gnu/bits/types/__fpos_t.h"
	.byte	0x3
	.uleb128 0x27
	.uleb128 0x18
	.byte	0x5
	.uleb128 0x2
	.long	.LASF630
	.file 25 "/usr/include/x86_64-linux-gnu/bits/types/__mbstate_t.h"
	.byte	0x3
	.uleb128 0x5
	.uleb128 0x19
	.byte	0x5
	.uleb128 0x2
	.long	.LASF631
	.byte	0x4
	.byte	0x4
	.file 26 "/usr/include/x86_64-linux-gnu/bits/types/__fpos64_t.h"
	.byte	0x3
	.uleb128 0x28
	.uleb128 0x1a
	.byte	0x5
	.uleb128 0x2
	.long	.LASF632
	.byte	0x4
	.file 27 "/usr/include/x86_64-linux-gnu/bits/types/__FILE.h"
	.byte	0x3
	.uleb128 0x29
	.uleb128 0x1b
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
	.file 28 "/usr/include/x86_64-linux-gnu/bits/stdio_lim.h"
	.byte	0x3
	.uleb128 0x85
	.uleb128 0x1c
	.byte	0x7
	.long	.Ldebug_macro19
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro20
	.file 29 "/usr/include/x86_64-linux-gnu/bits/floatn.h"
	.byte	0x3
	.uleb128 0x1ae
	.uleb128 0x1d
	.byte	0x7
	.long	.Ldebug_macro21
	.file 30 "/usr/include/x86_64-linux-gnu/bits/floatn-common.h"
	.byte	0x3
	.uleb128 0x77
	.uleb128 0x1e
	.byte	0x5
	.uleb128 0x15
	.long	.LASF674
	.byte	0x3
	.uleb128 0x18
	.uleb128 0x12
	.byte	0x5
	.uleb128 0x15
	.long	.LASF503
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro22
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.byte	0x3
	.uleb128 0x5
	.uleb128 0x7
	.byte	0x5
	.uleb128 0x19
	.long	.LASF368
	.byte	0x3
	.uleb128 0x1a
	.uleb128 0xc
	.byte	0x7
	.long	.Ldebug_macro23
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro24
	.byte	0x3
	.uleb128 0x20
	.uleb128 0x2
	.byte	0x7
	.long	.Ldebug_macro25
	.byte	0x4
	.byte	0x5
	.uleb128 0x24
	.long	.LASF714
	.file 31 "/usr/include/x86_64-linux-gnu/bits/waitflags.h"
	.byte	0x3
	.uleb128 0x28
	.uleb128 0x1f
	.byte	0x7
	.long	.Ldebug_macro26
	.byte	0x4
	.file 32 "/usr/include/x86_64-linux-gnu/bits/waitstatus.h"
	.byte	0x3
	.uleb128 0x29
	.uleb128 0x20
	.byte	0x7
	.long	.Ldebug_macro27
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro28
	.file 33 "/usr/include/x86_64-linux-gnu/sys/types.h"
	.byte	0x3
	.uleb128 0x18b
	.uleb128 0x21
	.byte	0x7
	.long	.Ldebug_macro29
	.file 34 "/usr/include/x86_64-linux-gnu/bits/types/clock_t.h"
	.byte	0x3
	.uleb128 0x7e
	.uleb128 0x22
	.byte	0x5
	.uleb128 0x2
	.long	.LASF761
	.byte	0x4
	.file 35 "/usr/include/x86_64-linux-gnu/bits/types/clockid_t.h"
	.byte	0x3
	.uleb128 0x80
	.uleb128 0x23
	.byte	0x5
	.uleb128 0x2
	.long	.LASF762
	.byte	0x4
	.file 36 "/usr/include/x86_64-linux-gnu/bits/types/time_t.h"
	.byte	0x3
	.uleb128 0x81
	.uleb128 0x24
	.byte	0x5
	.uleb128 0x2
	.long	.LASF763
	.byte	0x4
	.file 37 "/usr/include/x86_64-linux-gnu/bits/types/timer_t.h"
	.byte	0x3
	.uleb128 0x82
	.uleb128 0x25
	.byte	0x5
	.uleb128 0x2
	.long	.LASF764
	.byte	0x4
	.byte	0x5
	.uleb128 0x8f
	.long	.LASF543
	.byte	0x3
	.uleb128 0x90
	.uleb128 0x2
	.byte	0x7
	.long	.Ldebug_macro30
	.byte	0x4
	.file 38 "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h"
	.byte	0x3
	.uleb128 0x9b
	.uleb128 0x26
	.byte	0x5
	.uleb128 0x14
	.long	.LASF765
	.byte	0x4
	.byte	0x5
	.uleb128 0xab
	.long	.LASF766
	.file 39 "/usr/include/endian.h"
	.byte	0x3
	.uleb128 0xb0
	.uleb128 0x27
	.byte	0x5
	.uleb128 0x13
	.long	.LASF767
	.file 40 "/usr/include/x86_64-linux-gnu/bits/endian.h"
	.byte	0x3
	.uleb128 0x18
	.uleb128 0x28
	.byte	0x7
	.long	.Ldebug_macro31
	.file 41 "/usr/include/x86_64-linux-gnu/bits/endianness.h"
	.byte	0x3
	.uleb128 0x23
	.uleb128 0x29
	.byte	0x7
	.long	.Ldebug_macro32
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro33
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro34
	.file 42 "/usr/include/x86_64-linux-gnu/bits/byteswap.h"
	.byte	0x3
	.uleb128 0x23
	.uleb128 0x2a
	.byte	0x7
	.long	.Ldebug_macro35
	.byte	0x4
	.file 43 "/usr/include/x86_64-linux-gnu/bits/uintn-identity.h"
	.byte	0x3
	.uleb128 0x24
	.uleb128 0x2b
	.byte	0x5
	.uleb128 0x18
	.long	.LASF784
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro36
	.byte	0x4
	.file 44 "/usr/include/x86_64-linux-gnu/sys/select.h"
	.byte	0x3
	.uleb128 0xb3
	.uleb128 0x2c
	.byte	0x5
	.uleb128 0x16
	.long	.LASF797
	.file 45 "/usr/include/x86_64-linux-gnu/bits/select.h"
	.byte	0x3
	.uleb128 0x1e
	.uleb128 0x2d
	.byte	0x7
	.long	.Ldebug_macro37
	.byte	0x4
	.file 46 "/usr/include/x86_64-linux-gnu/bits/types/sigset_t.h"
	.byte	0x3
	.uleb128 0x21
	.uleb128 0x2e
	.byte	0x5
	.uleb128 0x2
	.long	.LASF802
	.file 47 "/usr/include/x86_64-linux-gnu/bits/types/__sigset_t.h"
	.byte	0x3
	.uleb128 0x4
	.uleb128 0x2f
	.byte	0x7
	.long	.Ldebug_macro38
	.byte	0x4
	.byte	0x4
	.file 48 "/usr/include/x86_64-linux-gnu/bits/types/struct_timeval.h"
	.byte	0x3
	.uleb128 0x25
	.uleb128 0x30
	.byte	0x5
	.uleb128 0x2
	.long	.LASF805
	.byte	0x4
	.file 49 "/usr/include/x86_64-linux-gnu/bits/types/struct_timespec.h"
	.byte	0x3
	.uleb128 0x27
	.uleb128 0x31
	.byte	0x5
	.uleb128 0x3
	.long	.LASF806
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro39
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro40
	.file 50 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h"
	.byte	0x3
	.uleb128 0xe3
	.uleb128 0x32
	.byte	0x5
	.uleb128 0x14
	.long	.LASF823
	.file 51 "/usr/include/x86_64-linux-gnu/bits/thread-shared-types.h"
	.byte	0x3
	.uleb128 0x17
	.uleb128 0x33
	.byte	0x5
	.uleb128 0x14
	.long	.LASF824
	.file 52 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes-arch.h"
	.byte	0x3
	.uleb128 0x2c
	.uleb128 0x34
	.byte	0x5
	.uleb128 0x13
	.long	.LASF825
	.byte	0x3
	.uleb128 0x15
	.uleb128 0xf
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro41
	.byte	0x4
	.file 53 "/usr/include/x86_64-linux-gnu/bits/atomic_wide_counter.h"
	.byte	0x3
	.uleb128 0x2e
	.uleb128 0x35
	.byte	0x5
	.uleb128 0x14
	.long	.LASF837
	.byte	0x4
	.file 54 "/usr/include/x86_64-linux-gnu/bits/struct_mutex.h"
	.byte	0x3
	.uleb128 0x4c
	.uleb128 0x36
	.byte	0x7
	.long	.Ldebug_macro42
	.byte	0x4
	.file 55 "/usr/include/x86_64-linux-gnu/bits/struct_rwlock.h"
	.byte	0x3
	.uleb128 0x59
	.uleb128 0x37
	.byte	0x7
	.long	.Ldebug_macro43
	.byte	0x4
	.byte	0x5
	.uleb128 0x71
	.long	.LASF844
	.byte	0x4
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF845
	.byte	0x4
	.byte	0x4
	.file 56 "/usr/include/alloca.h"
	.byte	0x3
	.uleb128 0x23e
	.uleb128 0x38
	.byte	0x7
	.long	.Ldebug_macro44
	.byte	0x3
	.uleb128 0x18
	.uleb128 0x2
	.byte	0x7
	.long	.Ldebug_macro30
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro45
	.byte	0x4
	.byte	0x5
	.uleb128 0x32f
	.long	.LASF849
	.file 57 "/usr/include/x86_64-linux-gnu/bits/stdlib-float.h"
	.byte	0x3
	.uleb128 0x3ff
	.uleb128 0x39
	.byte	0x4
	.byte	0x4
	.byte	0x3
	.uleb128 0x6
	.uleb128 0x8
	.byte	0x7
	.long	.Ldebug_macro46
	.byte	0x3
	.uleb128 0x1a
	.uleb128 0xc
	.byte	0x7
	.long	.Ldebug_macro23
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro47
	.byte	0x3
	.uleb128 0x21
	.uleb128 0x2
	.byte	0x7
	.long	.Ldebug_macro48
	.byte	0x4
	.file 58 "/usr/include/x86_64-linux-gnu/bits/types/locale_t.h"
	.byte	0x3
	.uleb128 0xac
	.uleb128 0x3a
	.byte	0x5
	.uleb128 0x14
	.long	.LASF851
	.file 59 "/usr/include/x86_64-linux-gnu/bits/types/__locale_t.h"
	.byte	0x3
	.uleb128 0x16
	.uleb128 0x3b
	.byte	0x5
	.uleb128 0x14
	.long	.LASF852
	.byte	0x4
	.byte	0x4
	.file 60 "/usr/include/strings.h"
	.byte	0x3
	.uleb128 0x1ce
	.uleb128 0x3c
	.byte	0x7
	.long	.Ldebug_macro49
	.byte	0x3
	.uleb128 0x17
	.uleb128 0x2
	.byte	0x7
	.long	.Ldebug_macro30
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.byte	0x3
	.uleb128 0x7
	.uleb128 0x9
	.byte	0x7
	.long	.Ldebug_macro50
	.file 61 "/usr/include/ncurses_dll.h"
	.byte	0x3
	.uleb128 0x59
	.uleb128 0x3d
	.byte	0x7
	.long	.Ldebug_macro51
	.byte	0x4
	.file 62 "/usr/lib/gcc/x86_64-linux-gnu/11/include/stdint.h"
	.byte	0x3
	.uleb128 0x5f
	.uleb128 0x3e
	.file 63 "/usr/include/stdint.h"
	.byte	0x3
	.uleb128 0x9
	.uleb128 0x3f
	.byte	0x7
	.long	.Ldebug_macro52
	.byte	0x3
	.uleb128 0x1a
	.uleb128 0xc
	.byte	0x7
	.long	.Ldebug_macro23
	.byte	0x4
	.file 64 "/usr/include/x86_64-linux-gnu/bits/wchar.h"
	.byte	0x3
	.uleb128 0x1c
	.uleb128 0x40
	.byte	0x7
	.long	.Ldebug_macro53
	.byte	0x4
	.byte	0x3
	.uleb128 0x1d
	.uleb128 0xf
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.file 65 "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h"
	.byte	0x3
	.uleb128 0x25
	.uleb128 0x41
	.byte	0x5
	.uleb128 0x14
	.long	.LASF876
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro54
	.byte	0x4
	.byte	0x5
	.uleb128 0xd
	.long	.LASF939
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro55
	.byte	0x3
	.uleb128 0xf9
	.uleb128 0x15
	.byte	0x7
	.long	.Ldebug_macro56
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro57
	.file 66 "/usr/lib/gcc/x86_64-linux-gnu/11/include/stdbool.h"
	.byte	0x3
	.uleb128 0x11a
	.uleb128 0x42
	.byte	0x7
	.long	.Ldebug_macro58
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro59
	.file 67 "/usr/include/unctrl.h"
	.byte	0x3
	.uleb128 0x830
	.uleb128 0x43
	.byte	0x7
	.long	.Ldebug_macro60
	.byte	0x3
	.uleb128 0x37
	.uleb128 0x9
	.byte	0x4
	.byte	0x6
	.uleb128 0x39
	.long	.LASF1416
	.byte	0x4
	.byte	0x4
	.byte	0x3
	.uleb128 0x8
	.uleb128 0x6
	.byte	0x7
	.long	.Ldebug_macro61
	.byte	0x4
	.file 68 "/home/jscha/dvp/cpumon/src/../include/sysfs.h"
	.byte	0x3
	.uleb128 0x9
	.uleb128 0x44
	.byte	0x5
	.uleb128 0x2
	.long	.LASF1424
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
	.section	.debug_macro,"G",@progbits,wm4.libcheaderstart.h.31.045646cfd09d1c615866e08d91c4f364,comdat
.Ldebug_macro23:
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
	.section	.debug_macro,"G",@progbits,wm4.stdlib.h.29.dde59e751a3b6c4506ba901b60a85c87,comdat
.Ldebug_macro24:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF543
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF696
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF544
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stddef.h.231.ac1e89356001c54fbeb8aaa0d15e8b3c,comdat
.Ldebug_macro25:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0xe7
	.long	.LASF562
	.byte	0x5
	.uleb128 0x104
	.long	.LASF697
	.byte	0x5
	.uleb128 0x105
	.long	.LASF698
	.byte	0x5
	.uleb128 0x106
	.long	.LASF699
	.byte	0x5
	.uleb128 0x107
	.long	.LASF700
	.byte	0x5
	.uleb128 0x108
	.long	.LASF701
	.byte	0x5
	.uleb128 0x109
	.long	.LASF702
	.byte	0x5
	.uleb128 0x10a
	.long	.LASF703
	.byte	0x5
	.uleb128 0x10b
	.long	.LASF704
	.byte	0x5
	.uleb128 0x10c
	.long	.LASF705
	.byte	0x5
	.uleb128 0x10d
	.long	.LASF706
	.byte	0x5
	.uleb128 0x10e
	.long	.LASF707
	.byte	0x5
	.uleb128 0x10f
	.long	.LASF708
	.byte	0x5
	.uleb128 0x110
	.long	.LASF709
	.byte	0x5
	.uleb128 0x111
	.long	.LASF710
	.byte	0x5
	.uleb128 0x112
	.long	.LASF711
	.byte	0x6
	.uleb128 0x11f
	.long	.LASF712
	.byte	0x6
	.uleb128 0x154
	.long	.LASF713
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
.Ldebug_macro26:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x19
	.long	.LASF715
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF716
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF717
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF718
	.byte	0x5
	.uleb128 0x20
	.long	.LASF719
	.byte	0x5
	.uleb128 0x21
	.long	.LASF720
	.byte	0x5
	.uleb128 0x24
	.long	.LASF721
	.byte	0x5
	.uleb128 0x26
	.long	.LASF722
	.byte	0x5
	.uleb128 0x27
	.long	.LASF723
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.waitstatus.h.28.93f167f49d64e2b9b99f98d1162a93bf,comdat
.Ldebug_macro27:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF724
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF725
	.byte	0x5
	.uleb128 0x22
	.long	.LASF726
	.byte	0x5
	.uleb128 0x25
	.long	.LASF727
	.byte	0x5
	.uleb128 0x28
	.long	.LASF728
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF729
	.byte	0x5
	.uleb128 0x31
	.long	.LASF730
	.byte	0x5
	.uleb128 0x35
	.long	.LASF731
	.byte	0x5
	.uleb128 0x38
	.long	.LASF732
	.byte	0x5
	.uleb128 0x39
	.long	.LASF733
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF734
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF735
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdlib.h.44.fc9d051d38577d71bf2818359e56065c,comdat
.Ldebug_macro28:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF736
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF737
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF738
	.byte	0x5
	.uleb128 0x2f
	.long	.LASF739
	.byte	0x5
	.uleb128 0x30
	.long	.LASF740
	.byte	0x5
	.uleb128 0x31
	.long	.LASF741
	.byte	0x5
	.uleb128 0x33
	.long	.LASF742
	.byte	0x5
	.uleb128 0x48
	.long	.LASF743
	.byte	0x5
	.uleb128 0x52
	.long	.LASF744
	.byte	0x5
	.uleb128 0x57
	.long	.LASF745
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF746
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF747
	.byte	0x5
	.uleb128 0x61
	.long	.LASF748
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.types.h.23.882ecbf54662e1f16e101552381a65da,comdat
.Ldebug_macro29:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x17
	.long	.LASF749
	.byte	0x5
	.uleb128 0x28
	.long	.LASF750
	.byte	0x5
	.uleb128 0x33
	.long	.LASF751
	.byte	0x5
	.uleb128 0x3c
	.long	.LASF752
	.byte	0x5
	.uleb128 0x41
	.long	.LASF753
	.byte	0x5
	.uleb128 0x46
	.long	.LASF754
	.byte	0x5
	.uleb128 0x4b
	.long	.LASF755
	.byte	0x5
	.uleb128 0x50
	.long	.LASF756
	.byte	0x5
	.uleb128 0x62
	.long	.LASF757
	.byte	0x5
	.uleb128 0x68
	.long	.LASF758
	.byte	0x5
	.uleb128 0x74
	.long	.LASF759
	.byte	0x5
	.uleb128 0x7a
	.long	.LASF760
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stddef.h.231.0adce5c8c1fd8096aaff50981b3d1f0f,comdat
.Ldebug_macro30:
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
.Ldebug_macro31:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.long	.LASF768
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF769
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF770
	.byte	0x5
	.uleb128 0x20
	.long	.LASF771
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.endianness.h.2.2c6a211f7909f3af5e9e9cfa3b6b63c8,comdat
.Ldebug_macro32:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x2
	.long	.LASF772
	.byte	0x5
	.uleb128 0x9
	.long	.LASF773
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.endian.h.40.9e5d395adda2f4eb53ae69b69b664084,comdat
.Ldebug_macro33:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x28
	.long	.LASF774
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF775
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.endian.h.27.4c4f94262c4eaee2982fe00ed1b4f173,comdat
.Ldebug_macro34:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF776
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF777
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF778
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF779
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.byteswap.h.24.5363c019348146aada5aeadf51456576,comdat
.Ldebug_macro35:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x18
	.long	.LASF780
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF781
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF782
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF783
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.endian.h.39.30a606dbd99b6c3df61c1f06dbdabd4e,comdat
.Ldebug_macro36:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x27
	.long	.LASF785
	.byte	0x5
	.uleb128 0x28
	.long	.LASF786
	.byte	0x5
	.uleb128 0x29
	.long	.LASF787
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF788
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF789
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF790
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF791
	.byte	0x5
	.uleb128 0x2f
	.long	.LASF792
	.byte	0x5
	.uleb128 0x31
	.long	.LASF793
	.byte	0x5
	.uleb128 0x32
	.long	.LASF794
	.byte	0x5
	.uleb128 0x33
	.long	.LASF795
	.byte	0x5
	.uleb128 0x34
	.long	.LASF796
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.select.h.25.df647f04fce2d846f134ede6a14ddf91,comdat
.Ldebug_macro37:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x19
	.long	.LASF798
	.byte	0x5
	.uleb128 0x20
	.long	.LASF799
	.byte	0x5
	.uleb128 0x22
	.long	.LASF800
	.byte	0x5
	.uleb128 0x24
	.long	.LASF801
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.__sigset_t.h.2.6b1ab6ff3d7b8fd9c0c42b0d80afbd80,comdat
.Ldebug_macro38:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x2
	.long	.LASF803
	.byte	0x5
	.uleb128 0x4
	.long	.LASF804
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.select.h.44.887a4ff60aa97fcd9c1be017735e1675,comdat
.Ldebug_macro39:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF807
	.byte	0x6
	.uleb128 0x34
	.long	.LASF808
	.byte	0x5
	.uleb128 0x36
	.long	.LASF809
	.byte	0x5
	.uleb128 0x37
	.long	.LASF810
	.byte	0x5
	.uleb128 0x38
	.long	.LASF811
	.byte	0x5
	.uleb128 0x44
	.long	.LASF812
	.byte	0x5
	.uleb128 0x49
	.long	.LASF813
	.byte	0x5
	.uleb128 0x50
	.long	.LASF814
	.byte	0x5
	.uleb128 0x55
	.long	.LASF815
	.byte	0x5
	.uleb128 0x56
	.long	.LASF816
	.byte	0x5
	.uleb128 0x57
	.long	.LASF817
	.byte	0x5
	.uleb128 0x58
	.long	.LASF818
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.types.h.186.489a4ed8f2d29cd358843490f54ddea5,comdat
.Ldebug_macro40:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xba
	.long	.LASF819
	.byte	0x5
	.uleb128 0xc1
	.long	.LASF820
	.byte	0x5
	.uleb128 0xc5
	.long	.LASF821
	.byte	0x5
	.uleb128 0xc9
	.long	.LASF822
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.pthreadtypesarch.h.25.6063cba99664c916e22d3a912bcc348a,comdat
.Ldebug_macro41:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x19
	.long	.LASF826
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF827
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF828
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF829
	.byte	0x5
	.uleb128 0x29
	.long	.LASF830
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF831
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF832
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF833
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF834
	.byte	0x5
	.uleb128 0x2f
	.long	.LASF835
	.byte	0x5
	.uleb128 0x30
	.long	.LASF836
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.struct_mutex.h.20.ed51f515172b9be99e450ba83eb5dd99,comdat
.Ldebug_macro42:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.long	.LASF838
	.byte	0x5
	.uleb128 0x25
	.long	.LASF839
	.byte	0x5
	.uleb128 0x38
	.long	.LASF840
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.struct_rwlock.h.21.0254880f2904e3833fb8ae683e0f0330,comdat
.Ldebug_macro43:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x15
	.long	.LASF841
	.byte	0x5
	.uleb128 0x28
	.long	.LASF842
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF843
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.alloca.h.19.edefa922a76c1cbaaf1e416903ba2d1c,comdat
.Ldebug_macro44:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x13
	.long	.LASF846
	.byte	0x5
	.uleb128 0x17
	.long	.LASF543
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.alloca.h.29.156e12058824cc23d961c4d3b13031f6,comdat
.Ldebug_macro45:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x1d
	.long	.LASF847
	.byte	0x5
	.uleb128 0x23
	.long	.LASF848
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.string.h.23.93403f89af7dba8212345449bb14b09d,comdat
.Ldebug_macro46:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x17
	.long	.LASF850
	.byte	0x5
	.uleb128 0x19
	.long	.LASF368
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.string.h.31.e39a94e203ad4e1d978c0fc68ce016ee,comdat
.Ldebug_macro47:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF543
	.byte	0x5
	.uleb128 0x20
	.long	.LASF544
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stddef.h.231.8136eebbab3406dbf57a7ec475dd5d83,comdat
.Ldebug_macro48:
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
	.section	.debug_macro,"G",@progbits,wm4.strings.h.19.a259f126920b1bb5ef76bc62b3984a3c,comdat
.Ldebug_macro49:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x13
	.long	.LASF853
	.byte	0x5
	.uleb128 0x16
	.long	.LASF543
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.curses.h.39.3b102e3630033b221c3e41b51ca3db05,comdat
.Ldebug_macro50:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x27
	.long	.LASF854
	.byte	0x5
	.uleb128 0x45
	.long	.LASF855
	.byte	0x5
	.uleb128 0x46
	.long	.LASF856
	.byte	0x5
	.uleb128 0x49
	.long	.LASF857
	.byte	0x5
	.uleb128 0x4a
	.long	.LASF858
	.byte	0x5
	.uleb128 0x4b
	.long	.LASF859
	.byte	0x6
	.uleb128 0x4e
	.long	.LASF860
	.byte	0x5
	.uleb128 0x4f
	.long	.LASF861
	.byte	0x5
	.uleb128 0x54
	.long	.LASF862
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.ncurses_dll.h.32.4f7d5f75878767130cff27603ec5ce98,comdat
.Ldebug_macro51:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x20
	.long	.LASF863
	.byte	0x5
	.uleb128 0x44
	.long	.LASF864
	.byte	0x5
	.uleb128 0x49
	.long	.LASF865
	.byte	0x5
	.uleb128 0x4c
	.long	.LASF866
	.byte	0x5
	.uleb128 0x4e
	.long	.LASF867
	.byte	0x5
	.uleb128 0x4f
	.long	.LASF868
	.byte	0x5
	.uleb128 0x5e
	.long	.LASF869
	.byte	0x5
	.uleb128 0x5f
	.long	.LASF870
	.byte	0x5
	.uleb128 0x60
	.long	.LASF871
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdint.h.23.022efde71688fcb285fe42cc87d41ee3,comdat
.Ldebug_macro52:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x17
	.long	.LASF872
	.byte	0x5
	.uleb128 0x19
	.long	.LASF368
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.wchar.h.20.510818a05484290d697a517509bf4b2d,comdat
.Ldebug_macro53:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.long	.LASF873
	.byte	0x5
	.uleb128 0x22
	.long	.LASF874
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF875
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdint.h.88.7e8071bbba3b822ff5b29420f80324ec,comdat
.Ldebug_macro54:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x58
	.long	.LASF877
	.byte	0x5
	.uleb128 0x6a
	.long	.LASF122
	.byte	0x5
	.uleb128 0x6b
	.long	.LASF131
	.byte	0x5
	.uleb128 0x74
	.long	.LASF878
	.byte	0x5
	.uleb128 0x75
	.long	.LASF879
	.byte	0x5
	.uleb128 0x76
	.long	.LASF880
	.byte	0x5
	.uleb128 0x77
	.long	.LASF881
	.byte	0x5
	.uleb128 0x79
	.long	.LASF882
	.byte	0x5
	.uleb128 0x7a
	.long	.LASF883
	.byte	0x5
	.uleb128 0x7b
	.long	.LASF884
	.byte	0x5
	.uleb128 0x7c
	.long	.LASF885
	.byte	0x5
	.uleb128 0x7f
	.long	.LASF886
	.byte	0x5
	.uleb128 0x80
	.long	.LASF887
	.byte	0x5
	.uleb128 0x81
	.long	.LASF888
	.byte	0x5
	.uleb128 0x82
	.long	.LASF889
	.byte	0x5
	.uleb128 0x86
	.long	.LASF890
	.byte	0x5
	.uleb128 0x87
	.long	.LASF891
	.byte	0x5
	.uleb128 0x88
	.long	.LASF892
	.byte	0x5
	.uleb128 0x89
	.long	.LASF893
	.byte	0x5
	.uleb128 0x8b
	.long	.LASF894
	.byte	0x5
	.uleb128 0x8c
	.long	.LASF895
	.byte	0x5
	.uleb128 0x8d
	.long	.LASF896
	.byte	0x5
	.uleb128 0x8e
	.long	.LASF897
	.byte	0x5
	.uleb128 0x91
	.long	.LASF898
	.byte	0x5
	.uleb128 0x92
	.long	.LASF899
	.byte	0x5
	.uleb128 0x93
	.long	.LASF900
	.byte	0x5
	.uleb128 0x94
	.long	.LASF901
	.byte	0x5
	.uleb128 0x98
	.long	.LASF902
	.byte	0x5
	.uleb128 0x9a
	.long	.LASF903
	.byte	0x5
	.uleb128 0x9b
	.long	.LASF904
	.byte	0x5
	.uleb128 0xa0
	.long	.LASF905
	.byte	0x5
	.uleb128 0xa2
	.long	.LASF906
	.byte	0x5
	.uleb128 0xa4
	.long	.LASF907
	.byte	0x5
	.uleb128 0xa5
	.long	.LASF908
	.byte	0x5
	.uleb128 0xaa
	.long	.LASF909
	.byte	0x5
	.uleb128 0xad
	.long	.LASF910
	.byte	0x5
	.uleb128 0xaf
	.long	.LASF911
	.byte	0x5
	.uleb128 0xb0
	.long	.LASF912
	.byte	0x5
	.uleb128 0xb5
	.long	.LASF913
	.byte	0x5
	.uleb128 0xba
	.long	.LASF914
	.byte	0x5
	.uleb128 0xbb
	.long	.LASF915
	.byte	0x5
	.uleb128 0xbc
	.long	.LASF916
	.byte	0x5
	.uleb128 0xc5
	.long	.LASF917
	.byte	0x5
	.uleb128 0xc7
	.long	.LASF918
	.byte	0x5
	.uleb128 0xca
	.long	.LASF919
	.byte	0x5
	.uleb128 0xd1
	.long	.LASF920
	.byte	0x5
	.uleb128 0xd2
	.long	.LASF921
	.byte	0x5
	.uleb128 0xde
	.long	.LASF922
	.byte	0x5
	.uleb128 0xdf
	.long	.LASF923
	.byte	0x5
	.uleb128 0xe3
	.long	.LASF924
	.byte	0x5
	.uleb128 0xef
	.long	.LASF925
	.byte	0x5
	.uleb128 0xf0
	.long	.LASF926
	.byte	0x5
	.uleb128 0xf4
	.long	.LASF927
	.byte	0x5
	.uleb128 0xf5
	.long	.LASF928
	.byte	0x5
	.uleb128 0xf8
	.long	.LASF929
	.byte	0x5
	.uleb128 0xf9
	.long	.LASF930
	.byte	0x5
	.uleb128 0xfa
	.long	.LASF931
	.byte	0x5
	.uleb128 0xfc
	.long	.LASF932
	.byte	0x5
	.uleb128 0x102
	.long	.LASF933
	.byte	0x5
	.uleb128 0x103
	.long	.LASF934
	.byte	0x5
	.uleb128 0x104
	.long	.LASF935
	.byte	0x5
	.uleb128 0x106
	.long	.LASF936
	.byte	0x5
	.uleb128 0x10d
	.long	.LASF937
	.byte	0x5
	.uleb128 0x10e
	.long	.LASF938
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.curses.h.111.996a0c5f11e7351daad14d76d85bb96b,comdat
.Ldebug_macro55:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x6f
	.long	.LASF940
	.byte	0x5
	.uleb128 0x77
	.long	.LASF941
	.byte	0x6
	.uleb128 0x7e
	.long	.LASF942
	.byte	0x5
	.uleb128 0x7f
	.long	.LASF943
	.byte	0x6
	.uleb128 0x81
	.long	.LASF944
	.byte	0x5
	.uleb128 0x82
	.long	.LASF945
	.byte	0x6
	.uleb128 0x8d
	.long	.LASF946
	.byte	0x5
	.uleb128 0x8e
	.long	.LASF947
	.byte	0x6
	.uleb128 0x90
	.long	.LASF948
	.byte	0x5
	.uleb128 0x91
	.long	.LASF949
	.byte	0x5
	.uleb128 0x97
	.long	.LASF950
	.byte	0x5
	.uleb128 0x98
	.long	.LASF951
	.byte	0x5
	.uleb128 0x99
	.long	.LASF952
	.byte	0x5
	.uleb128 0x9a
	.long	.LASF953
	.byte	0x5
	.uleb128 0xa3
	.long	.LASF954
	.byte	0x5
	.uleb128 0xaa
	.long	.LASF955
	.byte	0x6
	.uleb128 0xb0
	.long	.LASF956
	.byte	0x6
	.uleb128 0xb8
	.long	.LASF957
	.byte	0x5
	.uleb128 0xb9
	.long	.LASF958
	.byte	0x6
	.uleb128 0xbe
	.long	.LASF959
	.byte	0x5
	.uleb128 0xbf
	.long	.LASF960
	.byte	0x6
	.uleb128 0xc4
	.long	.LASF961
	.byte	0x5
	.uleb128 0xc5
	.long	.LASF962
	.byte	0x6
	.uleb128 0xcb
	.long	.LASF963
	.byte	0x5
	.uleb128 0xcc
	.long	.LASF964
	.byte	0x6
	.uleb128 0xd2
	.long	.LASF965
	.byte	0x5
	.uleb128 0xd3
	.long	.LASF966
	.byte	0x6
	.uleb128 0xda
	.long	.LASF967
	.byte	0x5
	.uleb128 0xdb
	.long	.LASF968
	.byte	0x5
	.uleb128 0xf5
	.long	.LASF969
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdarg.h.31.3fa7b8f6daaa31edd1696c08c77f2a73,comdat
.Ldebug_macro56:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF970
	.byte	0x5
	.uleb128 0x20
	.long	.LASF971
	.byte	0x6
	.uleb128 0x22
	.long	.LASF567
	.byte	0x5
	.uleb128 0x2f
	.long	.LASF972
	.byte	0x5
	.uleb128 0x30
	.long	.LASF973
	.byte	0x5
	.uleb128 0x31
	.long	.LASF974
	.byte	0x5
	.uleb128 0x34
	.long	.LASF975
	.byte	0x5
	.uleb128 0x36
	.long	.LASF976
	.byte	0x5
	.uleb128 0x69
	.long	.LASF977
	.byte	0x5
	.uleb128 0x6c
	.long	.LASF978
	.byte	0x5
	.uleb128 0x72
	.long	.LASF979
	.byte	0x5
	.uleb128 0x75
	.long	.LASF980
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.curses.h.266.a6aa4f23550a6272814a993111e6627b,comdat
.Ldebug_macro57:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x10a
	.long	.LASF981
	.byte	0x5
	.uleb128 0x10b
	.long	.LASF982
	.byte	0x6
	.uleb128 0x10d
	.long	.LASF983
	.byte	0x5
	.uleb128 0x10e
	.long	.LASF984
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdbool.h.29.4a1c88fe569adb8d03217dd16982ca34,comdat
.Ldebug_macro58:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF985
	.byte	0x5
	.uleb128 0x21
	.long	.LASF986
	.byte	0x5
	.uleb128 0x26
	.long	.LASF987
	.byte	0x5
	.uleb128 0x27
	.long	.LASF988
	.byte	0x5
	.uleb128 0x32
	.long	.LASF989
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.curses.h.284.b5c88a40caf804363b8dba931290ab8a,comdat
.Ldebug_macro59:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x11c
	.long	.LASF990
	.byte	0x5
	.uleb128 0x129
	.long	.LASF991
	.byte	0x5
	.uleb128 0x12c
	.long	.LASF992
	.byte	0x5
	.uleb128 0x132
	.long	.LASF993
	.byte	0x5
	.uleb128 0x133
	.long	.LASF994
	.byte	0x5
	.uleb128 0x134
	.long	.LASF995
	.byte	0x5
	.uleb128 0x135
	.long	.LASF996
	.byte	0x5
	.uleb128 0x136
	.long	.LASF997
	.byte	0x5
	.uleb128 0x137
	.long	.LASF998
	.byte	0x5
	.uleb128 0x138
	.long	.LASF999
	.byte	0x5
	.uleb128 0x139
	.long	.LASF1000
	.byte	0x5
	.uleb128 0x13a
	.long	.LASF1001
	.byte	0x5
	.uleb128 0x13b
	.long	.LASF1002
	.byte	0x5
	.uleb128 0x13c
	.long	.LASF1003
	.byte	0x5
	.uleb128 0x13d
	.long	.LASF1004
	.byte	0x5
	.uleb128 0x13e
	.long	.LASF1005
	.byte	0x5
	.uleb128 0x13f
	.long	.LASF1006
	.byte	0x5
	.uleb128 0x140
	.long	.LASF1007
	.byte	0x5
	.uleb128 0x141
	.long	.LASF1008
	.byte	0x5
	.uleb128 0x142
	.long	.LASF1009
	.byte	0x5
	.uleb128 0x145
	.long	.LASF1010
	.byte	0x5
	.uleb128 0x149
	.long	.LASF1011
	.byte	0x5
	.uleb128 0x14a
	.long	.LASF1012
	.byte	0x5
	.uleb128 0x14b
	.long	.LASF1013
	.byte	0x5
	.uleb128 0x14c
	.long	.LASF1014
	.byte	0x5
	.uleb128 0x14d
	.long	.LASF1015
	.byte	0x5
	.uleb128 0x14e
	.long	.LASF1016
	.byte	0x5
	.uleb128 0x14f
	.long	.LASF1017
	.byte	0x5
	.uleb128 0x150
	.long	.LASF1018
	.byte	0x5
	.uleb128 0x15b
	.long	.LASF1019
	.byte	0x5
	.uleb128 0x15e
	.long	.LASF1020
	.byte	0x5
	.uleb128 0x15f
	.long	.LASF1021
	.byte	0x5
	.uleb128 0x160
	.long	.LASF1022
	.byte	0x5
	.uleb128 0x161
	.long	.LASF1023
	.byte	0x5
	.uleb128 0x162
	.long	.LASF1024
	.byte	0x5
	.uleb128 0x163
	.long	.LASF1025
	.byte	0x5
	.uleb128 0x164
	.long	.LASF1026
	.byte	0x5
	.uleb128 0x165
	.long	.LASF1027
	.byte	0x5
	.uleb128 0x166
	.long	.LASF1028
	.byte	0x5
	.uleb128 0x167
	.long	.LASF1029
	.byte	0x5
	.uleb128 0x168
	.long	.LASF1030
	.byte	0x5
	.uleb128 0x169
	.long	.LASF1031
	.byte	0x5
	.uleb128 0x16a
	.long	.LASF1032
	.byte	0x5
	.uleb128 0x16b
	.long	.LASF1033
	.byte	0x5
	.uleb128 0x16c
	.long	.LASF1034
	.byte	0x5
	.uleb128 0x16d
	.long	.LASF1035
	.byte	0x5
	.uleb128 0x16e
	.long	.LASF1036
	.byte	0x5
	.uleb128 0x16f
	.long	.LASF1037
	.byte	0x5
	.uleb128 0x171
	.long	.LASF1038
	.byte	0x5
	.uleb128 0x172
	.long	.LASF1039
	.byte	0x5
	.uleb128 0x173
	.long	.LASF1040
	.byte	0x5
	.uleb128 0x174
	.long	.LASF1041
	.byte	0x5
	.uleb128 0x175
	.long	.LASF1042
	.byte	0x5
	.uleb128 0x176
	.long	.LASF1043
	.byte	0x5
	.uleb128 0x177
	.long	.LASF1044
	.byte	0x5
	.uleb128 0x17d
	.long	.LASF1045
	.byte	0x5
	.uleb128 0x17e
	.long	.LASF1046
	.byte	0x5
	.uleb128 0x17f
	.long	.LASF1047
	.byte	0x5
	.uleb128 0x180
	.long	.LASF1048
	.byte	0x5
	.uleb128 0x181
	.long	.LASF1049
	.byte	0x5
	.uleb128 0x182
	.long	.LASF1050
	.byte	0x5
	.uleb128 0x183
	.long	.LASF1051
	.byte	0x5
	.uleb128 0x18b
	.long	.LASF1052
	.byte	0x5
	.uleb128 0x18c
	.long	.LASF1053
	.byte	0x5
	.uleb128 0x18d
	.long	.LASF1054
	.byte	0x5
	.uleb128 0x18e
	.long	.LASF1055
	.byte	0x5
	.uleb128 0x18f
	.long	.LASF1056
	.byte	0x5
	.uleb128 0x190
	.long	.LASF1057
	.byte	0x5
	.uleb128 0x191
	.long	.LASF1058
	.byte	0x5
	.uleb128 0x192
	.long	.LASF1059
	.byte	0x5
	.uleb128 0x193
	.long	.LASF1060
	.byte	0x5
	.uleb128 0x194
	.long	.LASF1061
	.byte	0x5
	.uleb128 0x195
	.long	.LASF1062
	.byte	0x2
	.uleb128 0x197
	.string	"ERR"
	.byte	0x5
	.uleb128 0x198
	.long	.LASF1063
	.byte	0x2
	.uleb128 0x19a
	.string	"OK"
	.byte	0x5
	.uleb128 0x19b
	.long	.LASF1064
	.byte	0x5
	.uleb128 0x19e
	.long	.LASF1065
	.byte	0x5
	.uleb128 0x19f
	.long	.LASF1066
	.byte	0x5
	.uleb128 0x1a0
	.long	.LASF1067
	.byte	0x5
	.uleb128 0x1a1
	.long	.LASF1068
	.byte	0x5
	.uleb128 0x1a2
	.long	.LASF1069
	.byte	0x5
	.uleb128 0x1a3
	.long	.LASF1070
	.byte	0x5
	.uleb128 0x1a4
	.long	.LASF1071
	.byte	0x5
	.uleb128 0x1aa
	.long	.LASF1072
	.byte	0x5
	.uleb128 0x1b0
	.long	.LASF1073
	.byte	0x5
	.uleb128 0x234
	.long	.LASF1074
	.byte	0x5
	.uleb128 0x23c
	.long	.LASF1075
	.byte	0x5
	.uleb128 0x243
	.long	.LASF1076
	.byte	0x5
	.uleb128 0x247
	.long	.LASF1077
	.byte	0x6
	.uleb128 0x24a
	.long	.LASF1078
	.byte	0x5
	.uleb128 0x24c
	.long	.LASF1079
	.byte	0x5
	.uleb128 0x395
	.long	.LASF1080
	.byte	0x6
	.uleb128 0x39c
	.long	.LASF1081
	.byte	0x5
	.uleb128 0x39d
	.long	.LASF1082
	.byte	0x6
	.uleb128 0x3da
	.long	.LASF1083
	.byte	0x5
	.uleb128 0x3db
	.long	.LASF1084
	.byte	0x5
	.uleb128 0x3dc
	.long	.LASF1085
	.byte	0x5
	.uleb128 0x3df
	.long	.LASF1086
	.byte	0x5
	.uleb128 0x44f
	.long	.LASF1087
	.byte	0x5
	.uleb128 0x450
	.long	.LASF1088
	.byte	0x5
	.uleb128 0x452
	.long	.LASF1089
	.byte	0x5
	.uleb128 0x453
	.long	.LASF1090
	.byte	0x5
	.uleb128 0x454
	.long	.LASF1091
	.byte	0x5
	.uleb128 0x455
	.long	.LASF1092
	.byte	0x5
	.uleb128 0x456
	.long	.LASF1093
	.byte	0x5
	.uleb128 0x457
	.long	.LASF1094
	.byte	0x5
	.uleb128 0x458
	.long	.LASF1095
	.byte	0x5
	.uleb128 0x459
	.long	.LASF1096
	.byte	0x5
	.uleb128 0x45a
	.long	.LASF1097
	.byte	0x5
	.uleb128 0x45b
	.long	.LASF1098
	.byte	0x5
	.uleb128 0x45c
	.long	.LASF1099
	.byte	0x5
	.uleb128 0x45d
	.long	.LASF1100
	.byte	0x5
	.uleb128 0x45e
	.long	.LASF1101
	.byte	0x5
	.uleb128 0x45f
	.long	.LASF1102
	.byte	0x5
	.uleb128 0x460
	.long	.LASF1103
	.byte	0x5
	.uleb128 0x461
	.long	.LASF1104
	.byte	0x5
	.uleb128 0x462
	.long	.LASF1105
	.byte	0x5
	.uleb128 0x463
	.long	.LASF1106
	.byte	0x5
	.uleb128 0x464
	.long	.LASF1107
	.byte	0x5
	.uleb128 0x467
	.long	.LASF1108
	.byte	0x5
	.uleb128 0x474
	.long	.LASF1109
	.byte	0x5
	.uleb128 0x475
	.long	.LASF1110
	.byte	0x5
	.uleb128 0x476
	.long	.LASF1111
	.byte	0x5
	.uleb128 0x477
	.long	.LASF1112
	.byte	0x5
	.uleb128 0x479
	.long	.LASF1113
	.byte	0x5
	.uleb128 0x481
	.long	.LASF1114
	.byte	0x5
	.uleb128 0x491
	.long	.LASF1115
	.byte	0x5
	.uleb128 0x492
	.long	.LASF1116
	.byte	0x5
	.uleb128 0x494
	.long	.LASF1117
	.byte	0x5
	.uleb128 0x496
	.long	.LASF1118
	.byte	0x5
	.uleb128 0x497
	.long	.LASF1119
	.byte	0x5
	.uleb128 0x498
	.long	.LASF1120
	.byte	0x5
	.uleb128 0x499
	.long	.LASF1121
	.byte	0x5
	.uleb128 0x49a
	.long	.LASF1122
	.byte	0x5
	.uleb128 0x49b
	.long	.LASF1123
	.byte	0x5
	.uleb128 0x49f
	.long	.LASF1124
	.byte	0x5
	.uleb128 0x4a0
	.long	.LASF1125
	.byte	0x5
	.uleb128 0x4a1
	.long	.LASF1126
	.byte	0x5
	.uleb128 0x4a2
	.long	.LASF1127
	.byte	0x5
	.uleb128 0x4a3
	.long	.LASF1128
	.byte	0x5
	.uleb128 0x4a4
	.long	.LASF1129
	.byte	0x5
	.uleb128 0x4a5
	.long	.LASF1130
	.byte	0x5
	.uleb128 0x4a6
	.long	.LASF1131
	.byte	0x5
	.uleb128 0x4a7
	.long	.LASF1132
	.byte	0x5
	.uleb128 0x4aa
	.long	.LASF1133
	.byte	0x5
	.uleb128 0x4ab
	.long	.LASF1134
	.byte	0x5
	.uleb128 0x4ad
	.long	.LASF1135
	.byte	0x5
	.uleb128 0x4ae
	.long	.LASF1136
	.byte	0x5
	.uleb128 0x4c3
	.long	.LASF1137
	.byte	0x5
	.uleb128 0x4c5
	.long	.LASF1138
	.byte	0x5
	.uleb128 0x4c6
	.long	.LASF1139
	.byte	0x5
	.uleb128 0x4c7
	.long	.LASF1140
	.byte	0x5
	.uleb128 0x4c9
	.long	.LASF1141
	.byte	0x5
	.uleb128 0x4ca
	.long	.LASF1142
	.byte	0x5
	.uleb128 0x4cb
	.long	.LASF1143
	.byte	0x5
	.uleb128 0x4cc
	.long	.LASF1144
	.byte	0x5
	.uleb128 0x4ce
	.long	.LASF1145
	.byte	0x5
	.uleb128 0x4cf
	.long	.LASF1146
	.byte	0x5
	.uleb128 0x4d0
	.long	.LASF1147
	.byte	0x5
	.uleb128 0x4d3
	.long	.LASF1148
	.byte	0x5
	.uleb128 0x4d6
	.long	.LASF1149
	.byte	0x5
	.uleb128 0x4d7
	.long	.LASF1150
	.byte	0x5
	.uleb128 0x4dc
	.long	.LASF1151
	.byte	0x5
	.uleb128 0x4dd
	.long	.LASF1152
	.byte	0x5
	.uleb128 0x4e3
	.long	.LASF1153
	.byte	0x5
	.uleb128 0x4e4
	.long	.LASF1154
	.byte	0x5
	.uleb128 0x4e5
	.long	.LASF1155
	.byte	0x5
	.uleb128 0x4e6
	.long	.LASF1156
	.byte	0x5
	.uleb128 0x4e7
	.long	.LASF1157
	.byte	0x5
	.uleb128 0x4e8
	.long	.LASF1158
	.byte	0x5
	.uleb128 0x4e9
	.long	.LASF1159
	.byte	0x5
	.uleb128 0x4ea
	.long	.LASF1160
	.byte	0x5
	.uleb128 0x4eb
	.long	.LASF1161
	.byte	0x5
	.uleb128 0x4ec
	.long	.LASF1162
	.byte	0x5
	.uleb128 0x4ed
	.long	.LASF1163
	.byte	0x5
	.uleb128 0x4ee
	.long	.LASF1164
	.byte	0x5
	.uleb128 0x4ef
	.long	.LASF1165
	.byte	0x5
	.uleb128 0x4f0
	.long	.LASF1166
	.byte	0x5
	.uleb128 0x4f1
	.long	.LASF1167
	.byte	0x5
	.uleb128 0x4f2
	.long	.LASF1168
	.byte	0x5
	.uleb128 0x4f3
	.long	.LASF1169
	.byte	0x5
	.uleb128 0x4f4
	.long	.LASF1170
	.byte	0x5
	.uleb128 0x4f5
	.long	.LASF1171
	.byte	0x5
	.uleb128 0x4f6
	.long	.LASF1172
	.byte	0x5
	.uleb128 0x4f7
	.long	.LASF1173
	.byte	0x5
	.uleb128 0x4f8
	.long	.LASF1174
	.byte	0x5
	.uleb128 0x4f9
	.long	.LASF1175
	.byte	0x5
	.uleb128 0x4fa
	.long	.LASF1176
	.byte	0x5
	.uleb128 0x4fb
	.long	.LASF1177
	.byte	0x5
	.uleb128 0x4fc
	.long	.LASF1178
	.byte	0x5
	.uleb128 0x4fd
	.long	.LASF1179
	.byte	0x5
	.uleb128 0x4fe
	.long	.LASF1180
	.byte	0x5
	.uleb128 0x4ff
	.long	.LASF1181
	.byte	0x5
	.uleb128 0x500
	.long	.LASF1182
	.byte	0x5
	.uleb128 0x501
	.long	.LASF1183
	.byte	0x5
	.uleb128 0x502
	.long	.LASF1184
	.byte	0x5
	.uleb128 0x503
	.long	.LASF1185
	.byte	0x5
	.uleb128 0x504
	.long	.LASF1186
	.byte	0x5
	.uleb128 0x505
	.long	.LASF1187
	.byte	0x5
	.uleb128 0x506
	.long	.LASF1188
	.byte	0x5
	.uleb128 0x507
	.long	.LASF1189
	.byte	0x5
	.uleb128 0x508
	.long	.LASF1190
	.byte	0x5
	.uleb128 0x509
	.long	.LASF1191
	.byte	0x5
	.uleb128 0x50a
	.long	.LASF1192
	.byte	0x5
	.uleb128 0x50b
	.long	.LASF1193
	.byte	0x5
	.uleb128 0x50c
	.long	.LASF1194
	.byte	0x5
	.uleb128 0x50d
	.long	.LASF1195
	.byte	0x5
	.uleb128 0x50e
	.long	.LASF1196
	.byte	0x5
	.uleb128 0x514
	.long	.LASF1197
	.byte	0x5
	.uleb128 0x515
	.long	.LASF1198
	.byte	0x5
	.uleb128 0x516
	.long	.LASF1199
	.byte	0x5
	.uleb128 0x517
	.long	.LASF1200
	.byte	0x5
	.uleb128 0x518
	.long	.LASF1201
	.byte	0x5
	.uleb128 0x519
	.long	.LASF1202
	.byte	0x5
	.uleb128 0x51a
	.long	.LASF1203
	.byte	0x5
	.uleb128 0x51b
	.long	.LASF1204
	.byte	0x5
	.uleb128 0x51c
	.long	.LASF1205
	.byte	0x5
	.uleb128 0x51d
	.long	.LASF1206
	.byte	0x5
	.uleb128 0x51e
	.long	.LASF1207
	.byte	0x5
	.uleb128 0x51f
	.long	.LASF1208
	.byte	0x5
	.uleb128 0x520
	.long	.LASF1209
	.byte	0x5
	.uleb128 0x521
	.long	.LASF1210
	.byte	0x5
	.uleb128 0x522
	.long	.LASF1211
	.byte	0x5
	.uleb128 0x523
	.long	.LASF1212
	.byte	0x5
	.uleb128 0x524
	.long	.LASF1213
	.byte	0x5
	.uleb128 0x525
	.long	.LASF1214
	.byte	0x5
	.uleb128 0x526
	.long	.LASF1215
	.byte	0x5
	.uleb128 0x527
	.long	.LASF1216
	.byte	0x5
	.uleb128 0x529
	.long	.LASF1217
	.byte	0x5
	.uleb128 0x52a
	.long	.LASF1218
	.byte	0x5
	.uleb128 0x52b
	.long	.LASF1219
	.byte	0x5
	.uleb128 0x52c
	.long	.LASF1220
	.byte	0x5
	.uleb128 0x52d
	.long	.LASF1221
	.byte	0x5
	.uleb128 0x52e
	.long	.LASF1222
	.byte	0x5
	.uleb128 0x52f
	.long	.LASF1223
	.byte	0x5
	.uleb128 0x530
	.long	.LASF1224
	.byte	0x5
	.uleb128 0x531
	.long	.LASF1225
	.byte	0x5
	.uleb128 0x532
	.long	.LASF1226
	.byte	0x5
	.uleb128 0x533
	.long	.LASF1227
	.byte	0x5
	.uleb128 0x534
	.long	.LASF1228
	.byte	0x5
	.uleb128 0x535
	.long	.LASF1229
	.byte	0x5
	.uleb128 0x536
	.long	.LASF1230
	.byte	0x5
	.uleb128 0x537
	.long	.LASF1231
	.byte	0x5
	.uleb128 0x538
	.long	.LASF1232
	.byte	0x5
	.uleb128 0x539
	.long	.LASF1233
	.byte	0x5
	.uleb128 0x53a
	.long	.LASF1234
	.byte	0x5
	.uleb128 0x53b
	.long	.LASF1235
	.byte	0x5
	.uleb128 0x53c
	.long	.LASF1236
	.byte	0x5
	.uleb128 0x542
	.long	.LASF1237
	.byte	0x5
	.uleb128 0x545
	.long	.LASF1238
	.byte	0x5
	.uleb128 0x546
	.long	.LASF1239
	.byte	0x5
	.uleb128 0x589
	.long	.LASF1240
	.byte	0x5
	.uleb128 0x58a
	.long	.LASF1241
	.byte	0x5
	.uleb128 0x58b
	.long	.LASF1242
	.byte	0x5
	.uleb128 0x58c
	.long	.LASF1243
	.byte	0x5
	.uleb128 0x58d
	.long	.LASF1244
	.byte	0x5
	.uleb128 0x58e
	.long	.LASF1245
	.byte	0x5
	.uleb128 0x58f
	.long	.LASF1246
	.byte	0x5
	.uleb128 0x590
	.long	.LASF1247
	.byte	0x5
	.uleb128 0x591
	.long	.LASF1248
	.byte	0x5
	.uleb128 0x592
	.long	.LASF1249
	.byte	0x5
	.uleb128 0x593
	.long	.LASF1250
	.byte	0x5
	.uleb128 0x594
	.long	.LASF1251
	.byte	0x5
	.uleb128 0x595
	.long	.LASF1252
	.byte	0x5
	.uleb128 0x596
	.long	.LASF1253
	.byte	0x5
	.uleb128 0x597
	.long	.LASF1254
	.byte	0x5
	.uleb128 0x59f
	.long	.LASF1255
	.byte	0x5
	.uleb128 0x5de
	.long	.LASF1256
	.byte	0x5
	.uleb128 0x5df
	.long	.LASF1257
	.byte	0x5
	.uleb128 0x5e0
	.long	.LASF1258
	.byte	0x5
	.uleb128 0x5e1
	.long	.LASF1259
	.byte	0x5
	.uleb128 0x5e2
	.long	.LASF1260
	.byte	0x5
	.uleb128 0x5e6
	.long	.LASF1261
	.byte	0x5
	.uleb128 0x5e7
	.long	.LASF1262
	.byte	0x5
	.uleb128 0x5e8
	.long	.LASF1263
	.byte	0x5
	.uleb128 0x5e9
	.long	.LASF1264
	.byte	0x5
	.uleb128 0x5ea
	.long	.LASF1265
	.byte	0x5
	.uleb128 0x5eb
	.long	.LASF1266
	.byte	0x5
	.uleb128 0x5ec
	.long	.LASF1267
	.byte	0x5
	.uleb128 0x5ed
	.long	.LASF1268
	.byte	0x5
	.uleb128 0x5ee
	.long	.LASF1269
	.byte	0x5
	.uleb128 0x5ef
	.long	.LASF1270
	.byte	0x5
	.uleb128 0x5f0
	.long	.LASF1271
	.byte	0x5
	.uleb128 0x5f1
	.long	.LASF1272
	.byte	0x5
	.uleb128 0x5f2
	.long	.LASF1273
	.byte	0x5
	.uleb128 0x5f3
	.long	.LASF1274
	.byte	0x5
	.uleb128 0x5f4
	.long	.LASF1275
	.byte	0x5
	.uleb128 0x5f5
	.long	.LASF1276
	.byte	0x5
	.uleb128 0x5f6
	.long	.LASF1277
	.byte	0x5
	.uleb128 0x5f7
	.long	.LASF1278
	.byte	0x5
	.uleb128 0x5f8
	.long	.LASF1279
	.byte	0x5
	.uleb128 0x5f9
	.long	.LASF1280
	.byte	0x5
	.uleb128 0x5fa
	.long	.LASF1281
	.byte	0x5
	.uleb128 0x5fb
	.long	.LASF1282
	.byte	0x5
	.uleb128 0x5fc
	.long	.LASF1283
	.byte	0x5
	.uleb128 0x5fd
	.long	.LASF1284
	.byte	0x5
	.uleb128 0x5fe
	.long	.LASF1285
	.byte	0x5
	.uleb128 0x5ff
	.long	.LASF1286
	.byte	0x5
	.uleb128 0x600
	.long	.LASF1287
	.byte	0x5
	.uleb128 0x601
	.long	.LASF1288
	.byte	0x5
	.uleb128 0x602
	.long	.LASF1289
	.byte	0x5
	.uleb128 0x603
	.long	.LASF1290
	.byte	0x5
	.uleb128 0x604
	.long	.LASF1291
	.byte	0x5
	.uleb128 0x605
	.long	.LASF1292
	.byte	0x5
	.uleb128 0x606
	.long	.LASF1293
	.byte	0x5
	.uleb128 0x607
	.long	.LASF1294
	.byte	0x5
	.uleb128 0x608
	.long	.LASF1295
	.byte	0x5
	.uleb128 0x609
	.long	.LASF1296
	.byte	0x5
	.uleb128 0x60a
	.long	.LASF1297
	.byte	0x5
	.uleb128 0x60b
	.long	.LASF1298
	.byte	0x5
	.uleb128 0x60c
	.long	.LASF1299
	.byte	0x5
	.uleb128 0x60d
	.long	.LASF1300
	.byte	0x5
	.uleb128 0x60e
	.long	.LASF1301
	.byte	0x5
	.uleb128 0x60f
	.long	.LASF1302
	.byte	0x5
	.uleb128 0x610
	.long	.LASF1303
	.byte	0x5
	.uleb128 0x611
	.long	.LASF1304
	.byte	0x5
	.uleb128 0x612
	.long	.LASF1305
	.byte	0x5
	.uleb128 0x613
	.long	.LASF1306
	.byte	0x5
	.uleb128 0x614
	.long	.LASF1307
	.byte	0x5
	.uleb128 0x615
	.long	.LASF1308
	.byte	0x5
	.uleb128 0x616
	.long	.LASF1309
	.byte	0x5
	.uleb128 0x617
	.long	.LASF1310
	.byte	0x5
	.uleb128 0x618
	.long	.LASF1311
	.byte	0x5
	.uleb128 0x619
	.long	.LASF1312
	.byte	0x5
	.uleb128 0x61a
	.long	.LASF1313
	.byte	0x5
	.uleb128 0x61b
	.long	.LASF1314
	.byte	0x5
	.uleb128 0x61c
	.long	.LASF1315
	.byte	0x5
	.uleb128 0x61d
	.long	.LASF1316
	.byte	0x5
	.uleb128 0x61e
	.long	.LASF1317
	.byte	0x5
	.uleb128 0x61f
	.long	.LASF1318
	.byte	0x5
	.uleb128 0x620
	.long	.LASF1319
	.byte	0x5
	.uleb128 0x621
	.long	.LASF1320
	.byte	0x5
	.uleb128 0x622
	.long	.LASF1321
	.byte	0x5
	.uleb128 0x623
	.long	.LASF1322
	.byte	0x5
	.uleb128 0x624
	.long	.LASF1323
	.byte	0x5
	.uleb128 0x625
	.long	.LASF1324
	.byte	0x5
	.uleb128 0x626
	.long	.LASF1325
	.byte	0x5
	.uleb128 0x627
	.long	.LASF1326
	.byte	0x5
	.uleb128 0x628
	.long	.LASF1327
	.byte	0x5
	.uleb128 0x629
	.long	.LASF1328
	.byte	0x5
	.uleb128 0x62a
	.long	.LASF1329
	.byte	0x5
	.uleb128 0x62b
	.long	.LASF1330
	.byte	0x5
	.uleb128 0x62c
	.long	.LASF1331
	.byte	0x5
	.uleb128 0x62d
	.long	.LASF1332
	.byte	0x5
	.uleb128 0x62e
	.long	.LASF1333
	.byte	0x5
	.uleb128 0x62f
	.long	.LASF1334
	.byte	0x5
	.uleb128 0x630
	.long	.LASF1335
	.byte	0x5
	.uleb128 0x631
	.long	.LASF1336
	.byte	0x5
	.uleb128 0x632
	.long	.LASF1337
	.byte	0x5
	.uleb128 0x633
	.long	.LASF1338
	.byte	0x5
	.uleb128 0x634
	.long	.LASF1339
	.byte	0x5
	.uleb128 0x635
	.long	.LASF1340
	.byte	0x5
	.uleb128 0x636
	.long	.LASF1341
	.byte	0x5
	.uleb128 0x637
	.long	.LASF1342
	.byte	0x5
	.uleb128 0x638
	.long	.LASF1343
	.byte	0x5
	.uleb128 0x639
	.long	.LASF1344
	.byte	0x5
	.uleb128 0x63a
	.long	.LASF1345
	.byte	0x5
	.uleb128 0x63b
	.long	.LASF1346
	.byte	0x5
	.uleb128 0x63c
	.long	.LASF1347
	.byte	0x5
	.uleb128 0x63d
	.long	.LASF1348
	.byte	0x5
	.uleb128 0x640
	.long	.LASF1349
	.byte	0x5
	.uleb128 0x643
	.long	.LASF1350
	.byte	0x5
	.uleb128 0x64a
	.long	.LASF1351
	.byte	0x5
	.uleb128 0x788
	.long	.LASF1352
	.byte	0x5
	.uleb128 0x78d
	.long	.LASF1353
	.byte	0x5
	.uleb128 0x78e
	.long	.LASF1354
	.byte	0x5
	.uleb128 0x78f
	.long	.LASF1355
	.byte	0x5
	.uleb128 0x790
	.long	.LASF1356
	.byte	0x5
	.uleb128 0x791
	.long	.LASF1357
	.byte	0x5
	.uleb128 0x792
	.long	.LASF1358
	.byte	0x5
	.uleb128 0x795
	.long	.LASF1359
	.byte	0x5
	.uleb128 0x796
	.long	.LASF1360
	.byte	0x5
	.uleb128 0x797
	.long	.LASF1361
	.byte	0x5
	.uleb128 0x798
	.long	.LASF1362
	.byte	0x5
	.uleb128 0x799
	.long	.LASF1363
	.byte	0x5
	.uleb128 0x79b
	.long	.LASF1364
	.byte	0x5
	.uleb128 0x79c
	.long	.LASF1365
	.byte	0x5
	.uleb128 0x79d
	.long	.LASF1366
	.byte	0x5
	.uleb128 0x79e
	.long	.LASF1367
	.byte	0x5
	.uleb128 0x79f
	.long	.LASF1368
	.byte	0x5
	.uleb128 0x7a1
	.long	.LASF1369
	.byte	0x5
	.uleb128 0x7a2
	.long	.LASF1370
	.byte	0x5
	.uleb128 0x7a3
	.long	.LASF1371
	.byte	0x5
	.uleb128 0x7a4
	.long	.LASF1372
	.byte	0x5
	.uleb128 0x7a5
	.long	.LASF1373
	.byte	0x5
	.uleb128 0x7a7
	.long	.LASF1374
	.byte	0x5
	.uleb128 0x7a8
	.long	.LASF1375
	.byte	0x5
	.uleb128 0x7a9
	.long	.LASF1376
	.byte	0x5
	.uleb128 0x7aa
	.long	.LASF1377
	.byte	0x5
	.uleb128 0x7ab
	.long	.LASF1378
	.byte	0x5
	.uleb128 0x7b3
	.long	.LASF1379
	.byte	0x5
	.uleb128 0x7b4
	.long	.LASF1380
	.byte	0x5
	.uleb128 0x7b5
	.long	.LASF1381
	.byte	0x5
	.uleb128 0x7b6
	.long	.LASF1382
	.byte	0x5
	.uleb128 0x7b7
	.long	.LASF1383
	.byte	0x5
	.uleb128 0x7b9
	.long	.LASF1384
	.byte	0x5
	.uleb128 0x7ba
	.long	.LASF1385
	.byte	0x5
	.uleb128 0x7bb
	.long	.LASF1386
	.byte	0x5
	.uleb128 0x7bc
	.long	.LASF1387
	.byte	0x5
	.uleb128 0x7cc
	.long	.LASF1388
	.byte	0x5
	.uleb128 0x7cf
	.long	.LASF1389
	.byte	0x5
	.uleb128 0x7d0
	.long	.LASF1390
	.byte	0x5
	.uleb128 0x7d1
	.long	.LASF1391
	.byte	0x5
	.uleb128 0x7d2
	.long	.LASF1392
	.byte	0x5
	.uleb128 0x7d3
	.long	.LASF1393
	.byte	0x5
	.uleb128 0x7d4
	.long	.LASF1394
	.byte	0x5
	.uleb128 0x7f0
	.long	.LASF1395
	.byte	0x5
	.uleb128 0x80b
	.long	.LASF1396
	.byte	0x5
	.uleb128 0x80c
	.long	.LASF1397
	.byte	0x5
	.uleb128 0x812
	.long	.LASF1398
	.byte	0x5
	.uleb128 0x813
	.long	.LASF1399
	.byte	0x5
	.uleb128 0x814
	.long	.LASF1400
	.byte	0x5
	.uleb128 0x815
	.long	.LASF1401
	.byte	0x5
	.uleb128 0x816
	.long	.LASF1402
	.byte	0x5
	.uleb128 0x817
	.long	.LASF1403
	.byte	0x5
	.uleb128 0x818
	.long	.LASF1404
	.byte	0x5
	.uleb128 0x819
	.long	.LASF1405
	.byte	0x5
	.uleb128 0x81a
	.long	.LASF1406
	.byte	0x5
	.uleb128 0x81b
	.long	.LASF1407
	.byte	0x5
	.uleb128 0x81c
	.long	.LASF1408
	.byte	0x5
	.uleb128 0x81d
	.long	.LASF1409
	.byte	0x5
	.uleb128 0x81e
	.long	.LASF1410
	.byte	0x5
	.uleb128 0x81f
	.long	.LASF1411
	.byte	0x5
	.uleb128 0x820
	.long	.LASF1412
	.byte	0x5
	.uleb128 0x822
	.long	.LASF1413
	.byte	0x5
	.uleb128 0x823
	.long	.LASF1414
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.unctrl.h.46.c707778f5afc46808288a843c83a4633,comdat
.Ldebug_macro60:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF1415
	.byte	0x6
	.uleb128 0x30
	.long	.LASF860
	.byte	0x5
	.uleb128 0x31
	.long	.LASF861
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.cpumonlib.h.3.53a80dcb972256ad710bb0611da875ed,comdat
.Ldebug_macro61:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x3
	.long	.LASF1417
	.byte	0x5
	.uleb128 0x6
	.long	.LASF1418
	.byte	0x5
	.uleb128 0x7
	.long	.LASF1419
	.byte	0x5
	.uleb128 0x8
	.long	.LASF1420
	.byte	0x5
	.uleb128 0x9
	.long	.LASF1421
	.byte	0x5
	.uleb128 0xa
	.long	.LASF1422
	.byte	0x5
	.uleb128 0xc
	.long	.LASF1423
	.byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF1337:
	.string	"KEY_SPREVIOUS 0616"
.LASF743:
	.string	"__ldiv_t_defined 1"
.LASF1507:
	.string	"total"
.LASF1418:
	.string	"AVG_WINDOW 60"
.LASF998:
	.string	"WA_BLINK A_BLINK"
.LASF36:
	.string	"__FLOAT_WORD_ORDER__ __ORDER_LITTLE_ENDIAN__"
.LASF109:
	.string	"__UINT16_MAX__ 0xffff"
.LASF847:
	.string	"alloca"
.LASF1364:
	.string	"BUTTON2_RELEASED NCURSES_MOUSE_MASK(2, NCURSES_BUTTON_RELEASED)"
.LASF832:
	.string	"__SIZEOF_PTHREAD_CONDATTR_T 4"
.LASF984:
	.string	"FALSE 0"
.LASF1464:
	.string	"_unused2"
.LASF203:
	.string	"__FLT32_DIG__ 6"
.LASF706:
	.string	"_WCHAR_T_DEFINED "
.LASF1450:
	.string	"_fileno"
.LASF945:
	.string	"NCURSES_INLINE inline"
.LASF142:
	.string	"__UINT_FAST32_MAX__ 0xffffffffffffffffUL"
.LASF437:
	.string	"__glibc_has_attribute(attr) __has_attribute (attr)"
.LASF775:
	.string	"__LONG_LONG_PAIR(HI,LO) LO, HI"
.LASF1137:
	.string	"scroll(win) wscrl(win,1)"
.LASF470:
	.string	"__ASMNAME(cname) __ASMNAME2 (__USER_LABEL_PREFIX__, cname)"
.LASF25:
	.string	"__SIZEOF_SHORT__ 2"
.LASF1200:
	.string	"mvwaddnstr(win,y,x,str,n) (wmove((win),(y),(x)) == ERR ? ERR : waddnstr((win),(str),(n)))"
.LASF218:
	.string	"__FLT64_MANT_DIG__ 53"
.LASF861:
	.string	"NCURSES_VERSION \"6.3\""
.LASF368:
	.string	"__GLIBC_INTERNAL_STARTING_HEADER_IMPLEMENTATION "
.LASF158:
	.string	"__FLT_MAX_10_EXP__ 38"
.LASF576:
	.string	"__SQUAD_TYPE long int"
.LASF1061:
	.string	"ACS_SBSB ACS_VLINE"
.LASF1201:
	.string	"mvwaddstr(win,y,x,str) (wmove((win),(y),(x)) == ERR ? ERR : waddnstr((win),(str),-1))"
.LASF425:
	.string	"__USE_MISC 1"
.LASF769:
	.string	"__LITTLE_ENDIAN 1234"
.LASF1226:
	.string	"mvgetstr(y,x,str) mvwgetstr(stdscr,(y),(x),(str))"
.LASF215:
	.string	"__FLT32_HAS_INFINITY__ 1"
.LASF123:
	.string	"__INT_LEAST64_WIDTH__ 64"
.LASF1155:
	.string	"addchstr(str) waddchstr(stdscr,(str))"
.LASF1372:
	.string	"BUTTON3_DOUBLE_CLICKED NCURSES_MOUSE_MASK(3, NCURSES_DOUBLE_CLICKED)"
.LASF757:
	.string	"__pid_t_defined "
.LASF768:
	.string	"_BITS_ENDIAN_H 1"
.LASF1477:
	.string	"strcpy"
.LASF870:
	.string	"NCURSES_EXPORT_GENERAL_EXPORT "
.LASF1101:
	.string	"A_PROTECT NCURSES_BITS(1U,16)"
.LASF494:
	.string	"__fortify_function __extern_always_inline __attribute_artificial__"
.LASF1347:
	.string	"KEY_UNDO 0630"
.LASF221:
	.string	"__FLT64_MIN_10_EXP__ (-307)"
.LASF720:
	.string	"WNOWAIT 0x01000000"
.LASF337:
	.string	"__ATOMIC_HLE_RELEASE 131072"
.LASF85:
	.string	"__PTRDIFF_MAX__ 0x7fffffffffffffffL"
.LASF873:
	.string	"_BITS_WCHAR_H 1"
.LASF42:
	.string	"__WCHAR_TYPE__ int"
.LASF1321:
	.string	"KEY_SCREATE 0576"
.LASF0:
	.string	"__STDC__ 1"
.LASF1358:
	.string	"NCURSES_RESERVED_EVENT 040L"
.LASF1471:
	.string	"_Bool"
.LASF505:
	.string	"__LDBL_REDIR(name,proto) name proto"
.LASF141:
	.string	"__UINT_FAST16_MAX__ 0xffffffffffffffffUL"
.LASF297:
	.string	"__DEC128_MIN_EXP__ (-6142)"
.LASF441:
	.string	"__LEAF_ATTR __attribute__ ((__leaf__))"
.LASF1185:
	.string	"insnstr(s,n) winsnstr(stdscr,(s),(n))"
.LASF174:
	.string	"__DBL_MAX_10_EXP__ 308"
.LASF487:
	.string	"__attribute_warn_unused_result__ __attribute__ ((__warn_unused_result__))"
.LASF1525:
	.string	"power_config"
.LASF1182:
	.string	"insch(c) winsch(stdscr,(c))"
.LASF458:
	.string	"__glibc_unsigned_or_positive(__l) ((__typeof (__l)) 0 < (__typeof (__l)) -1 || (__builtin_constant_p (__l) && (__l) > 0))"
.LASF1053:
	.string	"ACS_SSBB ACS_LLCORNER"
.LASF1386:
	.string	"BUTTON_ALT NCURSES_MOUSE_MASK(6, 0004L)"
.LASF636:
	.string	"__getc_unlocked_body(_fp) (__glibc_unlikely ((_fp)->_IO_read_ptr >= (_fp)->_IO_read_end) ? __uflow (_fp) : *(unsigned char *) (_fp)->_IO_read_ptr++)"
.LASF428:
	.string	"__GLIBC_USE_DEPRECATED_GETS 0"
.LASF1455:
	.string	"_shortbuf"
.LASF1350:
	.string	"KEY_MAX 0777"
.LASF359:
	.string	"__ELF__ 1"
.LASF186:
	.string	"__LDBL_DIG__ 18"
.LASF1256:
	.string	"KEY_CODE_YES 0400"
.LASF391:
	.string	"__USE_DYNAMIC_STACK_SIZE"
.LASF1217:
	.string	"mvaddch(y,x,ch) mvwaddch(stdscr,(y),(x),(ch))"
.LASF1392:
	.string	"BUTTON_DOUBLE_CLICK(e,x) ((e) & NCURSES_MOUSE_MASK(x, 010))"
.LASF1278:
	.string	"KEY_SR 0521"
.LASF1339:
	.string	"KEY_SREDO 0620"
.LASF1378:
	.string	"BUTTON4_TRIPLE_CLICKED NCURSES_MOUSE_MASK(4, NCURSES_TRIPLE_CLICKED)"
.LASF698:
	.string	"__WCHAR_T__ "
.LASF714:
	.string	"_STDLIB_H 1"
.LASF1534:
	.string	"GNU C17 11.4.0 -masm=intel -mtune=generic -march=x86-64 -g -g -ggdb3 -gdwarf-2 -O0 -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection"
.LASF567:
	.string	"__need___va_list"
.LASF1212:
	.string	"mvwinsch(win,y,x,c) (wmove((win),(y),(x)) == ERR ? ERR : winsch((win),(c)))"
.LASF1267:
	.string	"KEY_F0 0410"
.LASF1362:
	.string	"BUTTON1_DOUBLE_CLICKED NCURSES_MOUSE_MASK(1, NCURSES_DOUBLE_CLICKED)"
.LASF985:
	.string	"_STDBOOL_H "
.LASF1516:
	.string	"status_before"
.LASF88:
	.string	"__SHRT_WIDTH__ 16"
.LASF1523:
	.string	"voltage_uv"
.LASF637:
	.string	"__putc_unlocked_body(_ch,_fp) (__glibc_unlikely ((_fp)->_IO_write_ptr >= (_fp)->_IO_write_end) ? __overflow (_fp, (unsigned char) (_ch)) : (unsigned char) (*(_fp)->_IO_write_ptr++ = (_ch)))"
.LASF182:
	.string	"__DBL_HAS_INFINITY__ 1"
.LASF1001:
	.string	"WA_ALTCHARSET A_ALTCHARSET"
.LASF1103:
	.string	"A_LEFT NCURSES_BITS(1U,18)"
.LASF1403:
	.string	"TRACE_CHARPUT 0x0010"
.LASF237:
	.string	"__FLT128_MIN_10_EXP__ (-4931)"
.LASF780:
	.string	"_BITS_BYTESWAP_H 1"
.LASF355:
	.string	"linux 1"
.LASF290:
	.string	"__DEC64_MIN_EXP__ (-382)"
.LASF626:
	.string	"__FD_SETSIZE 1024"
.LASF584:
	.string	"__STD_TYPE typedef"
.LASF1161:
	.string	"attr_set(a,c,o) wattr_set(stdscr,(a),(c),(o))"
.LASF1343:
	.string	"KEY_SSAVE 0624"
.LASF443:
	.string	"__THROWNL __attribute__ ((__nothrow__))"
.LASF1305:
	.string	"KEY_MOVE 0556"
.LASF1436:
	.string	"_flags"
.LASF1213:
	.string	"mvwinsnstr(win,y,x,s,n) (wmove((win),(y),(x)) == ERR ? ERR : winsnstr((win),(s),(n)))"
.LASF1506:
	.string	"comparator"
.LASF1148:
	.string	"redrawwin(win) wredrawln(win, 0, (NCURSES_OK_ADDR(win) ? (win)->_maxy+1 : -1))"
.LASF655:
	.string	"_BITS_STDIO_LIM_H 1"
.LASF1271:
	.string	"KEY_DC 0512"
.LASF854:
	.string	"__NCURSES_H "
.LASF1288:
	.string	"KEY_A3 0535"
.LASF1433:
	.string	"__off_t"
.LASF906:
	.string	"INT_FAST8_MAX (127)"
.LASF573:
	.string	"__U32_TYPE unsigned int"
.LASF635:
	.string	"__struct_FILE_defined 1"
.LASF642:
	.string	"_IO_USER_LOCK 0x8000"
.LASF1368:
	.string	"BUTTON2_TRIPLE_CLICKED NCURSES_MOUSE_MASK(2, NCURSES_TRIPLE_CLICKED)"
.LASF1518:
	.string	"get_sysfs_power_battery_w"
.LASF117:
	.string	"__INT_LEAST16_WIDTH__ 16"
.LASF1297:
	.string	"KEY_COPY 0546"
.LASF651:
	.string	"SEEK_SET 0"
.LASF1309:
	.string	"KEY_PREVIOUS 0562"
.LASF143:
	.string	"__UINT_FAST64_MAX__ 0xffffffffffffffffUL"
.LASF1082:
	.string	"NCURSES_EXT_FUNCS 20211021"
.LASF949:
	.string	"NCURSES_PAIRS_T short"
.LASF643:
	.string	"_VA_LIST_DEFINED "
.LASF296:
	.string	"__DEC128_MANT_DIG__ 34"
.LASF755:
	.string	"__nlink_t_defined "
.LASF77:
	.string	"__SHRT_MAX__ 0x7fff"
.LASF1079:
	.string	"GCC_DEPRECATED(msg) __attribute__((deprecated))"
.LASF73:
	.string	"__INTPTR_TYPE__ long int"
.LASF697:
	.string	"__wchar_t__ "
.LASF213:
	.string	"__FLT32_DENORM_MIN__ 1.40129846432481707092372958328991613e-45F32"
.LASF1456:
	.string	"_lock"
.LASF1018:
	.string	"COLOR_WHITE 7"
.LASF933:
	.string	"UINT8_C(c) c"
.LASF868:
	.string	"NCURSES_EXPORT_VAR(type) NCURSES_IMPEXP type"
.LASF883:
	.string	"INT16_MAX (32767)"
.LASF506:
	.string	"__LDBL_REDIR1_NTH(name,proto,alias) name proto __THROW"
.LASF656:
	.string	"L_tmpnam 20"
.LASF1097:
	.string	"A_DIM NCURSES_BITS(1U,12)"
.LASF691:
	.string	"__f64x(x) x ##f64x"
.LASF60:
	.string	"__INT_LEAST64_TYPE__ long int"
.LASF106:
	.string	"__INT32_MAX__ 0x7fffffff"
.LASF243:
	.string	"__FLT128_MIN__ 3.36210314311209350626267781732175260e-4932F128"
.LASF1180:
	.string	"inchstr(s) winchstr(stdscr,(s))"
.LASF966:
	.string	"NCURSES_WCWIDTH_GRAPHICS 1"
.LASF961:
	.string	"NCURSES_TPARM_VARARGS"
.LASF312:
	.string	"__GCC_ATOMIC_CHAR_LOCK_FREE 2"
.LASF71:
	.string	"__UINT_FAST32_TYPE__ long unsigned int"
.LASF1475:
	.string	"atoi"
.LASF622:
	.string	"__INO_T_MATCHES_INO64_T 1"
.LASF22:
	.string	"__SIZEOF_INT__ 4"
.LASF466:
	.string	"__glibc_c99_flexarr_available 1"
.LASF1287:
	.string	"KEY_A1 0534"
.LASF255:
	.string	"__FLT32X_MAX_10_EXP__ 308"
.LASF462:
	.ascii	"__glibc_"
	.string	"fortify_n(f,__l,__s,__osz,...) (__glibc_safe_or_unknown_len (__l, __s, __osz) ? __ ## f ## _alias (__VA_ARGS__) : (__glibc_unsafe_len (__l, __s, __osz) ? __ ## f ## _chk_warn (__VA_ARGS__, (__osz) / (__s)) : __ ## f ## _chk (__VA_ARGS__, (__osz) / (__s))))"
.LASF48:
	.string	"__SIG_ATOMIC_TYPE__ int"
.LASF556:
	.string	"_BSD_SIZE_T_DEFINED_ "
.LASF31:
	.string	"__BIGGEST_ALIGNMENT__ 16"
.LASF981:
	.string	"TRUE"
.LASF135:
	.string	"__INT_FAST16_WIDTH__ 64"
.LASF1376:
	.string	"BUTTON4_CLICKED NCURSES_MOUSE_MASK(4, NCURSES_BUTTON_CLICKED)"
.LASF1499:
	.string	"nice"
.LASF1513:
	.string	"reset_if_status_change"
.LASF1527:
	.string	"designer"
.LASF1465:
	.string	"FILE"
.LASF127:
	.string	"__UINT16_C(c) c"
.LASF1348:
	.string	"KEY_MOUSE 0631"
.LASF324:
	.string	"__PRAGMA_REDEFINE_EXTNAME 1"
.LASF797:
	.string	"_SYS_SELECT_H 1"
.LASF669:
	.string	"__HAVE_DISTINCT_FLOAT128 1"
.LASF1225:
	.string	"mvgetnstr(y,x,str,n) mvwgetnstr(stdscr,(y),(x),(str),(n))"
.LASF15:
	.string	"__pic__ 2"
.LASF439:
	.string	"__glibc_has_extension(ext) 0"
.LASF809:
	.string	"__NFDBITS (8 * (int) sizeof (__fd_mask))"
.LASF1028:
	.string	"ACS_HLINE NCURSES_ACS('q')"
.LASF1329:
	.string	"KEY_SHELP 0606"
.LASF18:
	.string	"__PIE__ 2"
.LASF960:
	.string	"NCURSES_SIZE_T short"
.LASF852:
	.string	"_BITS_TYPES___LOCALE_T_H 1"
.LASF974:
	.string	"va_arg(v,l) __builtin_va_arg(v,l)"
.LASF1285:
	.string	"KEY_PRINT 0532"
.LASF322:
	.string	"__HAVE_SPECULATION_SAFE_VALUE 1"
.LASF451:
	.string	"__BEGIN_DECLS "
.LASF371:
	.string	"__USE_ISOC11"
.LASF1004:
	.string	"WA_HORIZONTAL A_HORIZONTAL"
.LASF781:
	.string	"__bswap_constant_16(x) ((__uint16_t) ((((x) >> 8) & 0xff) | (((x) & 0xff) << 8)))"
.LASF74:
	.string	"__UINTPTR_TYPE__ long unsigned int"
.LASF179:
	.string	"__DBL_EPSILON__ ((double)2.22044604925031308084726333618164062e-16L)"
.LASF782:
	.string	"__bswap_constant_32(x) ((((x) & 0xff000000u) >> 24) | (((x) & 0x00ff0000u) >> 8) | (((x) & 0x0000ff00u) << 8) | (((x) & 0x000000ffu) << 24))"
.LASF516:
	.string	"__fortified_attr_access(a,o,s) __attr_access ((a, o, s))"
.LASF86:
	.string	"__SIZE_MAX__ 0xffffffffffffffffUL"
.LASF1205:
	.string	"mvwgetnstr(win,y,x,str,n) (wmove((win),(y),(x)) == ERR ? ERR : wgetnstr((win),(str),(n)))"
.LASF980:
	.string	"__va_list__ "
.LASF1154:
	.string	"addchnstr(str,n) waddchnstr(stdscr,(str),(n))"
.LASF257:
	.string	"__FLT32X_MAX__ 1.79769313486231570814527423731704357e+308F32x"
.LASF489:
	.string	"__always_inline"
.LASF53:
	.string	"__UINT8_TYPE__ unsigned char"
.LASF675:
	.string	"__HAVE_FLOAT16 0"
.LASF924:
	.string	"SIZE_MAX (18446744073709551615UL)"
.LASF205:
	.string	"__FLT32_MIN_10_EXP__ (-37)"
.LASF880:
	.string	"INT32_MIN (-2147483647-1)"
.LASF770:
	.string	"__BIG_ENDIAN 4321"
.LASF1494:
	.string	"work_jiffies_before"
.LASF236:
	.string	"__FLT128_MIN_EXP__ (-16381)"
.LASF3:
	.string	"__STDC_UTF_32__ 1"
.LASF115:
	.string	"__INT_LEAST16_MAX__ 0x7fff"
.LASF730:
	.string	"__WIFCONTINUED(status) ((status) == __W_CONTINUED)"
.LASF874:
	.string	"__WCHAR_MAX __WCHAR_MAX__"
.LASF1272:
	.string	"KEY_IC 0513"
.LASF192:
	.string	"__LDBL_DECIMAL_DIG__ 21"
.LASF692:
	.string	"__CFLOAT32 _Complex _Float32"
.LASF953:
	.string	"NCURSES_OPAQUE_PANEL 0"
.LASF1442:
	.string	"_IO_write_end"
.LASF132:
	.string	"__INT_FAST8_MAX__ 0x7f"
.LASF1385:
	.string	"BUTTON_SHIFT NCURSES_MOUSE_MASK(6, 0002L)"
.LASF54:
	.string	"__UINT16_TYPE__ short unsigned int"
.LASF1073:
	.string	"_NEWINDEX -1"
.LASF902:
	.string	"INT_FAST8_MIN (-128)"
.LASF995:
	.string	"WA_STANDOUT A_STANDOUT"
.LASF603:
	.string	"__FSBLKCNT_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF784:
	.string	"_BITS_UINTN_IDENTITY_H 1"
.LASF472:
	.string	"__attribute_malloc__ __attribute__ ((__malloc__))"
.LASF1248:
	.string	"is_pad(win) (NCURSES_OK_ADDR(win) ? ((win)->_flags & _ISPAD) != 0 : FALSE)"
.LASF1374:
	.string	"BUTTON4_RELEASED NCURSES_MOUSE_MASK(4, NCURSES_BUTTON_RELEASED)"
.LASF793:
	.string	"htobe64(x) __bswap_64 (x)"
.LASF263:
	.string	"__FLT32X_HAS_INFINITY__ 1"
.LASF801:
	.string	"__FD_ISSET(d,s) ((__FDS_BITS (s)[__FD_ELT (d)] & __FD_MASK (d)) != 0)"
.LASF456:
	.string	"__glibc_objsize(__o) __bos (__o)"
.LASF954:
	.string	"NCURSES_WATTR_MACROS 0"
.LASF1122:
	.string	"nocrmode() nocbreak()"
.LASF111:
	.string	"__UINT64_MAX__ 0xffffffffffffffffUL"
.LASF113:
	.string	"__INT8_C(c) c"
.LASF522:
	.string	"__stub_chflags "
.LASF1379:
	.string	"BUTTON5_RELEASED NCURSES_MOUSE_MASK(5, NCURSES_BUTTON_RELEASED)"
.LASF631:
	.string	"____mbstate_t_defined 1"
.LASF1365:
	.string	"BUTTON2_PRESSED NCURSES_MOUSE_MASK(2, NCURSES_BUTTON_PRESSED)"
.LASF988:
	.string	"false 0"
.LASF157:
	.string	"__FLT_MAX_EXP__ 128"
.LASF929:
	.string	"INT8_C(c) c"
.LASF1249:
	.string	"is_scrollok(win) (NCURSES_OK_ADDR(win) ? (win)->_scroll : FALSE)"
.LASF10:
	.string	"__ATOMIC_SEQ_CST 5"
.LASF559:
	.string	"_GCC_SIZE_T "
.LASF526:
	.string	"__stub_setlogin "
.LASF942:
	.string	"NCURSES_CONST"
.LASF1141:
	.string	"box(win,v,h) wborder(win, v, v, h, h, 0, 0, 0, 0)"
.LASF1438:
	.string	"_IO_read_end"
.LASF274:
	.string	"__FLT64X_NORM_MAX__ 1.18973149535723176502126385303097021e+4932F64x"
.LASF202:
	.string	"__FLT32_MANT_DIG__ 24"
.LASF528:
	.string	"__stub_stty "
.LASF1517:
	.string	"get_battery_status"
.LASF1411:
	.string	"TRACE_DATABASE 0x0800"
.LASF515:
	.string	"__attr_access(x) __attribute__ ((__access__ x))"
.LASF281:
	.string	"__FLT64X_IS_IEC_60559__ 2"
.LASF1234:
	.string	"mvinsstr(y,x,s) mvwinsstr(stdscr,(y),(x),(s))"
.LASF931:
	.string	"INT32_C(c) c"
.LASF1023:
	.string	"ACS_LRCORNER NCURSES_ACS('j')"
.LASF756:
	.string	"__uid_t_defined "
.LASF1257:
	.string	"KEY_MIN 0401"
.LASF1157:
	.string	"addstr(str) waddnstr(stdscr,(str),-1)"
.LASF1530:
	.string	"get_sysfs_power_limits_w"
.LASF1015:
	.string	"COLOR_BLUE 4"
.LASF148:
	.string	"__GCC_IEC_559_COMPLEX 2"
.LASF1183:
	.string	"insdelln(n) winsdelln(stdscr,(n))"
.LASF139:
	.string	"__INT_FAST64_WIDTH__ 64"
.LASF946:
	.string	"NCURSES_COLOR_T"
.LASF412:
	.string	"_POSIX_C_SOURCE 200809L"
.LASF1258:
	.string	"KEY_BREAK 0401"
.LASF1204:
	.string	"mvwgetch(win,y,x) (wmove((win),(y),(x)) == ERR ? ERR : wgetch(win))"
.LASF1042:
	.string	"ACS_BOARD NCURSES_ACS('h')"
.LASF1016:
	.string	"COLOR_MAGENTA 5"
.LASF671:
	.string	"__HAVE_FLOAT64X_LONG_DOUBLE 1"
.LASF304:
	.string	"__USER_LABEL_PREFIX__ "
.LASF1486:
	.string	"fgets"
.LASF501:
	.string	"__attribute_copy__"
.LASF557:
	.string	"_SIZE_T_DECLARED "
.LASF427:
	.string	"__USE_FORTIFY_LEVEL 0"
.LASF1346:
	.string	"KEY_SUSPEND 0627"
.LASF191:
	.string	"__DECIMAL_DIG__ 21"
.LASF530:
	.string	"__GLIBC_USE_LIB_EXT2 0"
.LASF128:
	.string	"__UINT_LEAST32_MAX__ 0xffffffffU"
.LASF879:
	.string	"INT16_MIN (-32767-1)"
.LASF1417:
	.string	"CPUMONLIB "
.LASF1153:
	.string	"addch(ch) waddch(stdscr,(ch))"
.LASF1510:
	.string	"sysfs_freq_ghz"
.LASF654:
	.string	"P_tmpdir \"/tmp\""
.LASF482:
	.string	"__attribute_format_arg__(x) __attribute__ ((__format_arg__ (x)))"
.LASF952:
	.string	"NCURSES_OPAQUE_MENU 0"
.LASF1389:
	.string	"BUTTON_RELEASE(e,x) ((e) & NCURSES_MOUSE_MASK(x, 001))"
.LASF1505:
	.string	"total_jiffies_after"
.LASF779:
	.string	"BYTE_ORDER __BYTE_ORDER"
.LASF1171:
	.string	"color_set(c,o) wcolor_set(stdscr,(c),(o))"
.LASF1435:
	.string	"char"
.LASF151:
	.string	"__DEC_EVAL_METHOD__ 2"
.LASF951:
	.string	"NCURSES_OPAQUE_FORM 0"
.LASF541:
	.string	"__GLIBC_USE_IEC_60559_TYPES_EXT"
.LASF342:
	.string	"__MMX__ 1"
.LASF1308:
	.string	"KEY_OPTIONS 0561"
.LASF204:
	.string	"__FLT32_MIN_EXP__ (-125)"
.LASF1415:
	.string	"NCURSES_UNCTRL_H_incl 1"
.LASF772:
	.string	"_BITS_ENDIANNESS_H 1"
.LASF1203:
	.string	"mvwdelch(win,y,x) (wmove((win),(y),(x)) == ERR ? ERR : wdelch(win))"
.LASF940:
	.string	"NCURSES_ENABLE_STDBOOL_H 1"
.LASF172:
	.string	"__DBL_MIN_10_EXP__ (-307)"
.LASF748:
	.string	"MB_CUR_MAX (__ctype_get_mb_cur_max ())"
.LASF1253:
	.string	"wgetparent(win) (NCURSES_OK_ADDR(win) ? (win)->_parent : 0)"
.LASF805:
	.string	"__timeval_defined 1"
.LASF261:
	.string	"__FLT32X_DENORM_MIN__ 4.94065645841246544176568792868221372e-324F32x"
.LASF911:
	.string	"UINT_FAST16_MAX (18446744073709551615UL)"
.LASF549:
	.string	"_T_SIZE_ "
.LASF156:
	.string	"__FLT_MIN_10_EXP__ (-37)"
.LASF928:
	.string	"WINT_MAX (4294967295u)"
.LASF694:
	.string	"__CFLOAT32X _Complex _Float32x"
.LASF1114:
	.string	"setsyx(y,x) do { if (newscr) { if ((y) == -1 && (x) == -1) leaveok(newscr, TRUE); else { leaveok(newscr, FALSE); wmove(newscr, (y), (x)); } } } while(0)"
.LASF1210:
	.string	"mvwinchstr(win,y,x,s) (wmove((win),(y),(x)) == ERR ? ERR : winchstr((win),(s)))"
.LASF138:
	.string	"__INT_FAST64_MAX__ 0x7fffffffffffffffL"
.LASF169:
	.string	"__DBL_MANT_DIG__ 53"
.LASF1164:
	.string	"attrset(at) wattrset(stdscr,(at))"
.LASF82:
	.string	"__WCHAR_MIN__ (-__WCHAR_MAX__ - 1)"
.LASF1216:
	.string	"mvwvline(win,y,x,c,n) (wmove((win),(y),(x)) == ERR ? ERR : wvline((win),(c),(n)))"
.LASF339:
	.string	"__k8 1"
.LASF413:
	.string	"__USE_POSIX 1"
.LASF375:
	.string	"__USE_POSIX"
.LASF709:
	.string	"__INT_WCHAR_T_H "
.LASF1189:
	.string	"refresh() wrefresh(stdscr)"
.LASF753:
	.string	"__gid_t_defined "
.LASF194:
	.string	"__LDBL_NORM_MAX__ 1.18973149535723176502126385303097021e+4932L"
.LASF1096:
	.string	"A_BLINK NCURSES_BITS(1U,11)"
.LASF287:
	.string	"__DEC32_EPSILON__ 1E-6DF"
.LASF1402:
	.string	"TRACE_MOVE 0x0008"
.LASF1051:
	.string	"ACS_STERLING NCURSES_ACS('}')"
.LASF862:
	.string	"NCURSES_MOUSE_VERSION 2"
.LASF513:
	.string	"__glibc_macro_warning(message) __glibc_macro_warning1 (GCC warning message)"
.LASF406:
	.string	"__USE_ISOC99 1"
.LASF798:
	.string	"__FD_ZERO(s) do { unsigned int __i; fd_set *__arr = (s); for (__i = 0; __i < sizeof (fd_set) / sizeof (__fd_mask); ++__i) __FDS_BITS (__arr)[__i] = 0; } while (0)"
.LASF409:
	.string	"_POSIX_SOURCE"
.LASF561:
	.string	"__size_t "
.LASF1334:
	.string	"KEY_SMOVE 0613"
.LASF909:
	.string	"INT_FAST64_MAX (__INT64_C(9223372036854775807))"
.LASF1351:
	.string	"_XOPEN_CURSES 1"
.LASF163:
	.string	"__FLT_EPSILON__ 1.19209289550781250000000000000000000e-7F"
.LASF792:
	.string	"le32toh(x) __uint32_identity (x)"
.LASF1199:
	.string	"mvwaddchstr(win,y,x,str) (wmove((win),(y),(x)) == ERR ? ERR : waddchnstr((win),(str),-1))"
.LASF89:
	.string	"__INT_WIDTH__ 32"
.LASF1377:
	.string	"BUTTON4_DOUBLE_CLICKED NCURSES_MOUSE_MASK(4, NCURSES_DOUBLE_CLICKED)"
.LASF991:
	.string	"NCURSES_CAST(type,value) (type)(value)"
.LASF859:
	.string	"NCURSES_VERSION_PATCH 20211021"
.LASF741:
	.string	"WIFSTOPPED(status) __WIFSTOPPED (status)"
.LASF320:
	.string	"__GCC_ATOMIC_TEST_AND_SET_TRUEVAL 1"
.LASF351:
	.string	"__CET__ 3"
.LASF959:
	.string	"NCURSES_SIZE_T"
.LASF130:
	.string	"__UINT_LEAST64_MAX__ 0xffffffffffffffffUL"
.LASF531:
	.string	"__GLIBC_USE_IEC_60559_BFP_EXT"
.LASF1080:
	.string	"vid_attr(a,pair,opts) vidattr(a)"
.LASF1173:
	.string	"deleteln() winsdelln(stdscr,-1)"
.LASF1105:
	.string	"A_RIGHT NCURSES_BITS(1U,20)"
.LASF1449:
	.string	"_chain"
.LASF499:
	.string	"__glibc_likely(cond) __builtin_expect ((cond), 1)"
.LASF125:
	.string	"__UINT8_C(c) c"
.LASF1168:
	.string	"clear() wclear(stdscr)"
.LASF754:
	.string	"__mode_t_defined "
.LASF1149:
	.string	"waddstr(win,str) waddnstr(win,str,-1)"
.LASF1195:
	.string	"wdeleteln(win) winsdelln(win,-1)"
.LASF1012:
	.string	"COLOR_RED 1"
.LASF1307:
	.string	"KEY_OPEN 0560"
.LASF982:
	.string	"TRUE 1"
.LASF1298:
	.string	"KEY_CREATE 0547"
.LASF537:
	.string	"__GLIBC_USE_IEC_60559_FUNCS_EXT"
.LASF1227:
	.string	"mvhline(y,x,c,n) mvwhline(stdscr,(y),(x),(c),(n))"
.LASF1165:
	.string	"bkgd(ch) wbkgd(stdscr,(ch))"
.LASF1282:
	.string	"KEY_CTAB 0525"
.LASF468:
	.string	"__REDIRECT_NTH(name,proto,alias) name proto __asm__ (__ASMNAME (#alias)) __THROW"
.LASF893:
	.string	"INT_LEAST64_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF330:
	.string	"__amd64 1"
.LASF1487:
	.string	"malloc"
.LASF1228:
	.string	"mvinch(y,x) mvwinch(stdscr,(y),(x))"
.LASF1480:
	.string	"read_string"
.LASF1427:
	.string	"unsigned char"
.LASF876:
	.string	"_BITS_STDINT_UINTN_H 1"
.LASF1147:
	.string	"winsstr(w,s) winsnstr(w, s, -1)"
.LASF1123:
	.string	"gettmode() "
.LASF903:
	.string	"INT_FAST16_MIN (-9223372036854775807L-1)"
.LASF1332:
	.string	"KEY_SLEFT 0611"
.LASF1328:
	.string	"KEY_SFIND 0605"
.LASF32:
	.string	"__ORDER_LITTLE_ENDIAN__ 1234"
.LASF1539:
	.string	"sscanf"
.LASF1220:
	.string	"mvaddnstr(y,x,str,n) mvwaddnstr(stdscr,(y),(x),(str),(n))"
.LASF1007:
	.string	"WA_RIGHT A_RIGHT"
.LASF1538:
	.string	"_IO_lock_t"
.LASF1357:
	.string	"NCURSES_TRIPLE_CLICKED 020L"
.LASF154:
	.string	"__FLT_DIG__ 6"
.LASF461:
	.string	"__glibc_fortify(f,__l,__s,__osz,...) (__glibc_safe_or_unknown_len (__l, __s, __osz) ? __ ## f ## _alias (__VA_ARGS__) : (__glibc_unsafe_len (__l, __s, __osz) ? __ ## f ## _chk_warn (__VA_ARGS__, __osz) : __ ## f ## _chk (__VA_ARGS__, __osz)))"
.LASF1036:
	.string	"ACS_PLMINUS NCURSES_ACS('g')"
.LASF1031:
	.string	"ACS_S1 NCURSES_ACS('o')"
.LASF1472:
	.string	"float"
.LASF1163:
	.string	"attron(at) wattron(stdscr,(at))"
.LASF173:
	.string	"__DBL_MAX_EXP__ 1024"
.LASF373:
	.string	"__USE_ISOC95"
.LASF1269:
	.string	"KEY_DL 0510"
.LASF372:
	.string	"__USE_ISOC99"
.LASF126:
	.string	"__UINT_LEAST16_MAX__ 0xffff"
.LASF930:
	.string	"INT16_C(c) c"
.LASF708:
	.string	"___int_wchar_t_h "
.LASF1262:
	.string	"KEY_UP 0403"
.LASF1367:
	.string	"BUTTON2_DOUBLE_CLICKED NCURSES_MOUSE_MASK(2, NCURSES_DOUBLE_CLICKED)"
.LASF254:
	.string	"__FLT32X_MAX_EXP__ 1024"
.LASF1333:
	.string	"KEY_SMESSAGE 0612"
.LASF101:
	.string	"__SIG_ATOMIC_MAX__ 0x7fffffff"
.LASF1261:
	.string	"KEY_DOWN 0402"
.LASF209:
	.string	"__FLT32_MAX__ 3.40282346638528859811704183484516925e+38F32"
.LASF300:
	.string	"__DEC128_MAX__ 9.999999999999999999999999999999999E6144DL"
.LASF1503:
	.string	"softirq"
.LASF765:
	.string	"_BITS_STDINT_INTN_H 1"
.LASF333:
	.string	"__x86_64__ 1"
.LASF483:
	.string	"__attribute_format_strfmon__(a,b) __attribute__ ((__format__ (__strfmon__, a, b)))"
.LASF1268:
	.string	"KEY_F(n) (KEY_F0+(n))"
.LASF1231:
	.string	"mvinnstr(y,x,s,n) mvwinnstr(stdscr,(y),(x),(s),(n))"
.LASF94:
	.string	"__PTRDIFF_WIDTH__ 64"
.LASF1024:
	.string	"ACS_LTEE NCURSES_ACS('t')"
.LASF777:
	.string	"BIG_ENDIAN __BIG_ENDIAN"
.LASF382:
	.string	"__USE_XOPEN2K"
.LASF378:
	.string	"__USE_POSIX199506"
.LASF1292:
	.string	"KEY_BTAB 0541"
.LASF444:
	.string	"__NTH(fct) __attribute__ ((__nothrow__ __LEAF)) fct"
.LASF357:
	.string	"__unix__ 1"
.LASF1040:
	.string	"ACS_DARROW NCURSES_ACS('.')"
.LASF402:
	.string	"_DEFAULT_SOURCE"
.LASF1115:
	.string	"wgetstr(w,s) wgetnstr(w, s, -1)"
.LASF1340:
	.string	"KEY_SREPLACE 0621"
.LASF1419:
	.string	"BATTERY_STATUS_BUF_SIZE 20"
.LASF1443:
	.string	"_IO_buf_base"
.LASF64:
	.string	"__UINT_LEAST64_TYPE__ long unsigned int"
.LASF1100:
	.string	"A_INVIS NCURSES_BITS(1U,15)"
.LASF488:
	.string	"__wur "
.LASF845:
	.string	"__have_pthread_attr_t 1"
.LASF175:
	.string	"__DBL_DECIMAL_DIG__ 17"
.LASF24:
	.string	"__SIZEOF_LONG_LONG__ 8"
.LASF445:
	.string	"__NTHNL(fct) __attribute__ ((__nothrow__)) fct"
.LASF993:
	.string	"WA_ATTRIBUTES A_ATTRIBUTES"
.LASF1281:
	.string	"KEY_STAB 0524"
.LASF271:
	.string	"__FLT64X_MAX_10_EXP__ 4932"
.LASF208:
	.string	"__FLT32_DECIMAL_DIG__ 9"
.LASF761:
	.string	"__clock_t_defined 1"
.LASF403:
	.string	"_DEFAULT_SOURCE 1"
.LASF705:
	.string	"_WCHAR_T_DEFINED_ "
.LASF1301:
	.string	"KEY_FIND 0552"
.LASF1414:
	.string	"TRACE_MAXIMUM ((1 << TRACE_SHIFT) - 1)"
.LASF869:
	.string	"NCURSES_EXPORT_GENERAL_IMPORT "
.LASF239:
	.string	"__FLT128_MAX_10_EXP__ 4932"
.LASF808:
	.string	"__NFDBITS"
.LASF442:
	.string	"__THROW __attribute__ ((__nothrow__ __LEAF))"
.LASF877:
	.string	"__intptr_t_defined "
.LASF1129:
	.string	"getmaxx(win) (NCURSES_OK_ADDR(win) ? ((win)->_maxx + 1) : ERR)"
.LASF1223:
	.string	"mvdelch(y,x) mvwdelch(stdscr,(y),(x))"
.LASF885:
	.string	"INT64_MAX (__INT64_C(9223372036854775807))"
.LASF896:
	.string	"INT_LEAST32_MAX (2147483647)"
.LASF504:
	.string	"__LDBL_REDIR1(name,proto,alias) name proto"
.LASF153:
	.string	"__FLT_MANT_DIG__ 24"
.LASF1026:
	.string	"ACS_BTEE NCURSES_ACS('v')"
.LASF733:
	.string	"__W_STOPCODE(sig) ((sig) << 8 | 0x7f)"
.LASF1145:
	.string	"winstr(w,s) winnstr(w, s, -1)"
.LASF976:
	.string	"__va_copy(d,s) __builtin_va_copy(d,s)"
.LASF232:
	.string	"__FLT64_HAS_QUIET_NAN__ 1"
.LASF577:
	.string	"__UQUAD_TYPE unsigned long int"
.LASF1338:
	.string	"KEY_SPRINT 0617"
.LASF1317:
	.string	"KEY_SBEG 0572"
.LASF1266:
	.string	"KEY_BACKSPACE 0407"
.LASF385:
	.string	"__USE_XOPEN2K8XSI"
.LASF1344:
	.string	"KEY_SSUSPEND 0625"
.LASF764:
	.string	"__timer_t_defined 1"
.LASF1259:
	.string	"KEY_SRESET 0530"
.LASF1289:
	.string	"KEY_B2 0536"
.LASF1490:
	.string	"freq_mhz"
.LASF1322:
	.string	"KEY_SDC 0577"
.LASF913:
	.string	"UINT_FAST64_MAX (__UINT64_C(18446744073709551615))"
.LASF95:
	.string	"__SIZE_WIDTH__ 64"
.LASF566:
	.string	"__need___va_list "
.LASF680:
	.string	"__HAVE_DISTINCT_FLOAT16 __HAVE_FLOAT16"
.LASF1458:
	.string	"_codecvt"
.LASF424:
	.string	"__TIMESIZE __WORDSIZE"
.LASF112:
	.string	"__INT_LEAST8_MAX__ 0x7f"
.LASF1314:
	.string	"KEY_RESTART 0567"
.LASF155:
	.string	"__FLT_MIN_EXP__ (-125)"
.LASF276:
	.string	"__FLT64X_EPSILON__ 1.08420217248550443400745280086994171e-19F64x"
.LASF653:
	.string	"SEEK_END 2"
.LASF35:
	.string	"__BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__"
.LASF1325:
	.string	"KEY_SEND 0602"
.LASF803:
	.string	"____sigset_t_defined "
.LASF767:
	.string	"_ENDIAN_H 1"
.LASF152:
	.string	"__FLT_RADIX__ 2"
.LASF119:
	.string	"__INT32_C(c) c"
.LASF512:
	.string	"__glibc_macro_warning1(message) _Pragma (#message)"
.LASF864:
	.string	"NCURSES_PUBLIC_VAR(name) _nc_ ##name"
.LASF971:
	.string	"_ANSI_STDARG_H_ "
.LASF201:
	.string	"__LDBL_IS_IEC_60559__ 2"
.LASF251:
	.string	"__FLT32X_DIG__ 15"
.LASF1474:
	.string	"cpu_designer_e"
.LASF935:
	.string	"UINT32_C(c) c ## U"
.LASF1045:
	.string	"ACS_S3 NCURSES_ACS('p')"
.LASF889:
	.string	"UINT64_MAX (__UINT64_C(18446744073709551615))"
.LASF150:
	.string	"__FLT_EVAL_METHOD_TS_18661_3__ 0"
.LASF1270:
	.string	"KEY_IL 0511"
.LASF1009:
	.string	"WA_VERTICAL A_VERTICAL"
.LASF794:
	.string	"htole64(x) __uint64_identity (x)"
.LASF977:
	.string	"_VA_LIST_ "
.LASF477:
	.string	"__attribute_maybe_unused__ __attribute__ ((__unused__))"
.LASF298:
	.string	"__DEC128_MAX_EXP__ 6145"
.LASF682:
	.string	"__HAVE_DISTINCT_FLOAT64 0"
.LASF1323:
	.string	"KEY_SDL 0600"
.LASF932:
	.string	"INT64_C(c) c ## L"
.LASF1497:
	.string	"line"
.LASF288:
	.string	"__DEC32_SUBNORMAL_MIN__ 0.000001E-95DF"
.LASF394:
	.string	"__KERNEL_STRICT_NAMES"
.LASF849:
	.string	"__COMPAR_FN_T "
.LASF45:
	.string	"__UINTMAX_TYPE__ long unsigned int"
.LASF583:
	.string	"__U64_TYPE unsigned long int"
.LASF250:
	.string	"__FLT32X_MANT_DIG__ 53"
.LASF627:
	.string	"_BITS_TIME64_H 1"
.LASF836:
	.string	"__ONCE_ALIGNMENT "
.LASF1041:
	.string	"ACS_UARROW NCURSES_ACS('-')"
.LASF908:
	.string	"INT_FAST32_MAX (9223372036854775807L)"
.LASF69:
	.string	"__UINT_FAST8_TYPE__ unsigned char"
.LASF1540:
	.string	"__isoc99_sscanf"
.LASF47:
	.string	"__CHAR32_TYPE__ unsigned int"
.LASF607:
	.string	"__ID_T_TYPE __U32_TYPE"
.LASF1310:
	.string	"KEY_REDO 0563"
.LASF474:
	.string	"__attribute_alloc_align__(param) __attribute__ ((__alloc_align__ param))"
.LASF56:
	.string	"__UINT64_TYPE__ long unsigned int"
.LASF1336:
	.string	"KEY_SOPTIONS 0615"
.LASF1188:
	.string	"move(y,x) wmove(stdscr,(y),(x))"
.LASF1355:
	.string	"NCURSES_BUTTON_CLICKED 004L"
.LASF1296:
	.string	"KEY_COMMAND 0545"
.LASF724:
	.string	"__WEXITSTATUS(status) (((status) & 0xff00) >> 8)"
.LASF99:
	.string	"__UINTMAX_C(c) c ## UL"
.LASF665:
	.string	"__attr_dealloc_fclose"
.LASF387:
	.string	"__USE_LARGEFILE64"
.LASF1246:
	.string	"is_nodelay(win) (NCURSES_OK_ADDR(win) ? ((win)->_delay == 0) : FALSE)"
.LASF819:
	.string	"__blksize_t_defined "
.LASF217:
	.string	"__FLT32_IS_IEC_60559__ 2"
.LASF766:
	.string	"__BIT_TYPES_DEFINED__ 1"
.LASF1413:
	.string	"TRACE_SHIFT 13"
.LASF490:
	.string	"__always_inline __inline __attribute__ ((__always_inline__))"
.LASF21:
	.string	"__LP64__ 1"
.LASF955:
	.string	"NCURSES_REENTRANT 0"
.LASF571:
	.string	"__U16_TYPE unsigned short int"
.LASF1254:
	.string	"wgetscrreg(win,t,b) (NCURSES_OK_ADDR(win) ? (*(t) = (win)->_regtop, *(b) = (win)->_regbottom, OK) : ERR)"
.LASF789:
	.string	"htobe32(x) __bswap_32 (x)"
.LASF485:
	.string	"__nonnull(params) __attribute_nonnull__ (params)"
.LASF1532:
	.string	"identifiy_cpu"
.LASF943:
	.string	"NCURSES_CONST const"
.LASF519:
	.string	"__attr_dealloc_free __attr_dealloc (__builtin_free, 1)"
.LASF197:
	.string	"__LDBL_DENORM_MIN__ 3.64519953188247460252840593361941982e-4951L"
.LASF349:
	.string	"__SEG_FS 1"
.LASF475:
	.string	"__attribute_pure__ __attribute__ ((__pure__))"
.LASF1138:
	.string	"touchwin(win) wtouchln((win), 0, getmaxy(win), 1)"
.LASF256:
	.string	"__FLT32X_DECIMAL_DIG__ 17"
.LASF1098:
	.string	"A_BOLD NCURSES_BITS(1U,13)"
.LASF314:
	.string	"__GCC_ATOMIC_CHAR32_T_LOCK_FREE 2"
.LASF1038:
	.string	"ACS_LARROW NCURSES_ACS(',')"
.LASF50:
	.string	"__INT16_TYPE__ short int"
.LASF235:
	.string	"__FLT128_DIG__ 33"
.LASF398:
	.string	"__KERNEL_STRICT_NAMES "
.LASF989:
	.string	"__bool_true_false_are_defined 1"
.LASF634:
	.string	"__FILE_defined 1"
.LASF677:
	.string	"__HAVE_FLOAT64 1"
.LASF1263:
	.string	"KEY_LEFT 0404"
.LASF558:
	.string	"___int_size_t_h "
.LASF63:
	.string	"__UINT_LEAST32_TYPE__ unsigned int"
.LASF554:
	.string	"_SIZE_T_DEFINED_ "
.LASF1432:
	.string	"size_t"
.LASF318:
	.string	"__GCC_ATOMIC_LONG_LOCK_FREE 2"
.LASF778:
	.string	"PDP_ENDIAN __PDP_ENDIAN"
.LASF1509:
	.string	"cpucore_load"
.LASF609:
	.string	"__TIME_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF84:
	.string	"__WINT_MIN__ 0U"
.LASF1388:
	.string	"ALL_MOUSE_EVENTS (REPORT_MOUSE_POSITION - 1)"
.LASF1197:
	.string	"mvwaddch(win,y,x,ch) (wmove((win),(y),(x)) == ERR ? ERR : waddch((win),(ch)))"
.LASF1057:
	.string	"ACS_SSSB ACS_LTEE"
.LASF523:
	.string	"__stub_fchflags "
.LASF659:
	.string	"L_ctermid 9"
.LASF575:
	.string	"__ULONGWORD_TYPE unsigned long int"
.LASF563:
	.string	"NULL"
.LASF78:
	.string	"__INT_MAX__ 0x7fffffff"
.LASF837:
	.string	"_BITS_ATOMIC_WIDE_COUNTER_H "
.LASF1501:
	.string	"idle"
.LASF1152:
	.string	"PAIR_NUMBER(a) (NCURSES_CAST(int,((NCURSES_CAST(unsigned long,(a)) & A_COLOR) >> NCURSES_ATTR_SHIFT)))"
.LASF379:
	.string	"__USE_XOPEN"
.LASF1244:
	.string	"is_keypad(win) (NCURSES_OK_ADDR(win) ? (win)->_use_keypad : FALSE)"
.LASF331:
	.string	"__amd64__ 1"
.LASF1056:
	.string	"ACS_SBSS ACS_RTEE"
.LASF1541:
	.string	"perror"
.LASF401:
	.string	"__GLIBC_USE(F) __GLIBC_USE_ ## F"
.LASF1224:
	.string	"mvgetch(y,x) mvwgetch(stdscr,(y),(x))"
.LASF1208:
	.string	"mvwinch(win,y,x) (wmove((win),(y),(x)) == ERR ? NCURSES_CAST(chtype, ERR) : winch(win))"
.LASF752:
	.string	"__dev_t_defined "
.LASF422:
	.string	"__WORDSIZE_TIME64_COMPAT32 1"
.LASF1243:
	.string	"is_immedok(win) (NCURSES_OK_ADDR(win) ? (win)->_immed : FALSE)"
.LASF1483:
	.string	"sprintf"
.LASF517:
	.string	"__attr_access_none(argno) __attribute__ ((__access__ (__none__, argno)))"
.LASF710:
	.string	"_GCC_WCHAR_T "
.LASF502:
	.string	"__attribute_copy__(arg) __attribute__ ((__copy__ (arg)))"
.LASF1181:
	.string	"innstr(s,n) winnstr(stdscr,(s),(n))"
.LASF1349:
	.string	"KEY_RESIZE 0632"
.LASF588:
	.string	"__DEV_T_TYPE __UQUAD_TYPE"
.LASF735:
	.string	"__WCOREFLAG 0x80"
.LASF925:
	.string	"WCHAR_MIN __WCHAR_MIN"
.LASF1111:
	.string	"getmaxyx(win,y,x) (y = getmaxy(win), x = getmaxx(win))"
.LASF1445:
	.string	"_IO_save_base"
.LASF509:
	.string	"__LDBL_REDIR_DECL(name) "
.LASF1178:
	.string	"inch() winch(stdscr)"
.LASF1221:
	.string	"mvaddstr(y,x,str) mvwaddstr(stdscr,(y),(x),(str))"
.LASF543:
	.string	"__need_size_t "
.LASF972:
	.string	"va_start(v,l) __builtin_va_start(v,l)"
.LASF272:
	.string	"__FLT64X_DECIMAL_DIG__ 21"
.LASF838:
	.string	"_THREAD_MUTEX_INTERNAL_H 1"
.LASF1044:
	.string	"ACS_BLOCK NCURSES_ACS('0')"
.LASF187:
	.string	"__LDBL_MIN_EXP__ (-16381)"
.LASF762:
	.string	"__clockid_t_defined 1"
.LASF712:
	.string	"_BSD_WCHAR_T_"
.LASF76:
	.string	"__SCHAR_MAX__ 0x7f"
.LASF323:
	.string	"__GCC_HAVE_DWARF2_CFI_ASM 1"
.LASF673:
	.string	"__CFLOAT128 _Complex _Float128"
.LASF508:
	.string	"__LDBL_REDIR2_DECL(name) "
.LASF552:
	.string	"_SIZE_T_ "
.LASF815:
	.string	"FD_SET(fd,fdsetp) __FD_SET (fd, fdsetp)"
.LASF562:
	.string	"__need_size_t"
.LASF1441:
	.string	"_IO_write_ptr"
.LASF1037:
	.string	"ACS_BULLET NCURSES_ACS('~')"
.LASF1050:
	.string	"ACS_NEQUAL NCURSES_ACS('|')"
.LASF105:
	.string	"__INT16_MAX__ 0x7fff"
.LASF1502:
	.string	"iowait"
.LASF299:
	.string	"__DEC128_MIN__ 1E-6143DL"
.LASF1094:
	.string	"A_UNDERLINE NCURSES_BITS(1U,9)"
.LASF923:
	.string	"SIG_ATOMIC_MAX (2147483647)"
.LASF52:
	.string	"__INT64_TYPE__ long int"
.LASF1089:
	.string	"A_NORMAL (1U - 1U)"
.LASF289:
	.string	"__DEC64_MANT_DIG__ 16"
.LASF1409:
	.string	"TRACE_ICALLS 0x0200"
.LASF167:
	.string	"__FLT_HAS_QUIET_NAN__ 1"
.LASF1528:
	.string	"file"
.LASF939:
	.string	"_GCC_WRAP_STDINT_H "
.LASF1062:
	.string	"ACS_SSSS ACS_PLUS"
.LASF938:
	.string	"UINTMAX_C(c) c ## UL"
.LASF381:
	.string	"__USE_UNIX98"
.LASF1462:
	.string	"__pad5"
.LASF1459:
	.string	"_wide_data"
.LASF448:
	.string	"__CONCAT(x,y) x ## y"
.LASF1424:
	.string	"SYSFS "
.LASF593:
	.string	"__MODE_T_TYPE __U32_TYPE"
.LASF738:
	.string	"WSTOPSIG(status) __WSTOPSIG (status)"
.LASF1072:
	.string	"_NOCHANGE -1"
.LASF87:
	.string	"__SCHAR_WIDTH__ 8"
.LASF524:
	.string	"__stub_gtty "
.LASF34:
	.string	"__ORDER_PDP_ENDIAN__ 3412"
.LASF621:
	.string	"__OFF_T_MATCHES_OFF64_T 1"
.LASF800:
	.string	"__FD_CLR(d,s) ((void) (__FDS_BITS (s)[__FD_ELT(d)] &= ~__FD_MASK(d)))"
.LASF1237:
	.string	"getbkgd(win) (NCURSES_OK_ADDR(win) ? ((win)->_bkgd) : 0)"
.LASF80:
	.string	"__LONG_LONG_MAX__ 0x7fffffffffffffffLL"
.LASF674:
	.string	"_BITS_FLOATN_COMMON_H "
.LASF1524:
	.string	"current_ua"
.LASF1302:
	.string	"KEY_HELP 0553"
.LASF1381:
	.string	"BUTTON5_CLICKED NCURSES_MOUSE_MASK(5, NCURSES_BUTTON_CLICKED)"
.LASF344:
	.string	"__SSE2__ 1"
.LASF1087:
	.string	"NCURSES_ATTR_SHIFT 8"
.LASF890:
	.string	"INT_LEAST8_MIN (-128)"
.LASF1245:
	.string	"is_leaveok(win) (NCURSES_OK_ADDR(win) ? (win)->_leaveok : FALSE)"
.LASF623:
	.string	"__RLIM_T_MATCHES_RLIM64_T 1"
.LASF936:
	.string	"UINT64_C(c) c ## UL"
.LASF672:
	.string	"__f128(x) x ##f128"
.LASF858:
	.string	"NCURSES_VERSION_MINOR 3"
.LASF821:
	.string	"__fsblkcnt_t_defined "
.LASF228:
	.string	"__FLT64_EPSILON__ 2.22044604925031308084726333618164062e-16F64"
.LASF891:
	.string	"INT_LEAST16_MIN (-32767-1)"
.LASF1091:
	.string	"A_CHARTEXT (NCURSES_BITS(1U,0) - 1U)"
.LASF100:
	.string	"__INTMAX_WIDTH__ 64"
.LASF776:
	.string	"LITTLE_ENDIAN __LITTLE_ENDIAN"
.LASF568:
	.string	"__GNUC_VA_LIST "
.LASF1222:
	.string	"mvchgat(y,x,n,a,c,o) mvwchgat(stdscr,(y),(x),(n),(a),(c),(o))"
.LASF269:
	.string	"__FLT64X_MIN_10_EXP__ (-4931)"
.LASF1207:
	.string	"mvwhline(win,y,x,c,n) (wmove((win),(y),(x)) == ERR ? ERR : whline((win),(c),(n)))"
.LASF822:
	.string	"__fsfilcnt_t_defined "
.LASF715:
	.string	"WNOHANG 1"
.LASF867:
	.string	"NCURSES_EXPORT(type) NCURSES_IMPEXP type NCURSES_API"
.LASF1299:
	.string	"KEY_END 0550"
.LASF831:
	.string	"__SIZEOF_PTHREAD_COND_T 48"
.LASF9:
	.string	"__ATOMIC_RELAXED 0"
.LASF1011:
	.string	"COLOR_BLACK 0"
.LASF98:
	.string	"__UINTMAX_MAX__ 0xffffffffffffffffUL"
.LASF1359:
	.string	"BUTTON1_RELEASED NCURSES_MOUSE_MASK(1, NCURSES_BUTTON_RELEASED)"
.LASF1482:
	.string	"printf"
.LASF365:
	.string	"__STDC_IEC_60559_COMPLEX__ 201404L"
.LASF1059:
	.string	"ACS_BSSS ACS_TTEE"
.LASF430:
	.string	"__GNU_LIBRARY__"
.LASF585:
	.string	"_BITS_TYPESIZES_H 1"
.LASF648:
	.string	"_IONBF 2"
.LASF1078:
	.string	"GCC_DEPRECATED"
.LASF180:
	.string	"__DBL_DENORM_MIN__ ((double)4.94065645841246544176568792868221372e-324L)"
.LASF948:
	.string	"NCURSES_PAIRS_T"
.LASF1046:
	.string	"ACS_S7 NCURSES_ACS('r')"
.LASF147:
	.string	"__GCC_IEC_559 2"
.LASF900:
	.string	"UINT_LEAST32_MAX (4294967295U)"
.LASF469:
	.string	"__REDIRECT_NTHNL(name,proto,alias) name proto __asm__ (__ASMNAME (#alias)) __THROWNL"
.LASF1421:
	.string	"BUFSIZE 64"
.LASF1086:
	.string	"NCURSES_SP_OUTC NCURSES_SP_NAME(NCURSES_OUTC)"
.LASF657:
	.string	"TMP_MAX 238328"
.LASF369:
	.string	"__GLIBC_INTERNAL_STARTING_HEADER_IMPLEMENTATION"
.LASF717:
	.string	"WSTOPPED 2"
.LASF1300:
	.string	"KEY_EXIT 0551"
.LASF1238:
	.string	"slk_attr_off(a,v) ((v) ? ERR : slk_attroff(a))"
.LASF1175:
	.string	"erase() werase(stdscr)"
.LASF1387:
	.string	"REPORT_MOUSE_POSITION NCURSES_MOUSE_MASK(6, 0010L)"
.LASF1484:
	.string	"fclose"
.LASF1010:
	.string	"WA_ITALIC A_ITALIC"
.LASF718:
	.string	"WEXITED 4"
.LASF134:
	.string	"__INT_FAST16_MAX__ 0x7fffffffffffffffL"
.LASF1395:
	.string	"mouse_trafo(y,x,to_screen) wmouse_trafo(stdscr,y,x,to_screen)"
.LASF436:
	.string	"__PMT"
.LASF828:
	.string	"__SIZEOF_PTHREAD_RWLOCK_T 56"
.LASF711:
	.string	"_WCHAR_T_DECLARED "
.LASF731:
	.string	"__WCOREDUMP(status) ((status) & __WCOREFLAG)"
.LASF12:
	.string	"__ATOMIC_RELEASE 3"
.LASF107:
	.string	"__INT64_MAX__ 0x7fffffffffffffffL"
.LASF835:
	.string	"__LOCK_ALIGNMENT "
.LASF346:
	.string	"__SSE_MATH__ 1"
.LASF5:
	.string	"__GNUC__ 11"
.LASF1017:
	.string	"COLOR_CYAN 6"
.LASF137:
	.string	"__INT_FAST32_WIDTH__ 64"
.LASF273:
	.string	"__FLT64X_MAX__ 1.18973149535723176502126385303097021e+4932F64x"
.LASF727:
	.string	"__WIFEXITED(status) (__WTERMSIG(status) == 0)"
.LASF361:
	.string	"_STDC_PREDEF_H 1"
.LASF1233:
	.string	"mvinsnstr(y,x,s,n) mvwinsnstr(stdscr,(y),(x),(s),(n))"
.LASF812:
	.string	"__FDS_BITS(set) ((set)->__fds_bits)"
.LASF120:
	.string	"__INT_LEAST32_WIDTH__ 32"
.LASF1370:
	.string	"BUTTON3_PRESSED NCURSES_MOUSE_MASK(3, NCURSES_BUTTON_PRESSED)"
.LASF258:
	.string	"__FLT32X_NORM_MAX__ 1.79769313486231570814527423731704357e+308F32x"
.LASF937:
	.string	"INTMAX_C(c) c ## L"
.LASF1526:
	.string	"running_with_privileges"
.LASF184:
	.string	"__DBL_IS_IEC_60559__ 2"
.LASF1067:
	.string	"_FULLWIN 0x04"
.LASF328:
	.string	"__SIZEOF_WINT_T__ 4"
.LASF246:
	.string	"__FLT128_HAS_DENORM__ 1"
.LASF670:
	.string	"__HAVE_FLOAT64X 1"
.LASF1412:
	.string	"TRACE_ATTRS 0x1000"
.LASF275:
	.string	"__FLT64X_MIN__ 3.36210314311209350626267781732175260e-4932F64x"
.LASF644:
	.string	"__off_t_defined "
.LASF1294:
	.string	"KEY_CANCEL 0543"
.LASF495:
	.string	"__va_arg_pack() __builtin_va_arg_pack ()"
.LASF962:
	.string	"NCURSES_TPARM_VARARGS 1"
.LASF788:
	.string	"le16toh(x) __uint16_identity (x)"
.LASF75:
	.string	"__GXX_ABI_VERSION 1016"
.LASF719:
	.string	"WCONTINUED 8"
.LASF83:
	.string	"__WINT_MAX__ 0xffffffffU"
.LASF699:
	.string	"_WCHAR_T "
.LASF574:
	.string	"__SLONGWORD_TYPE long int"
.LASF1236:
	.string	"mvvline(y,x,c,n) mvwvline(stdscr,(y),(x),(c),(n))"
.LASF457:
	.string	"__glibc_safe_len_cond(__l,__s,__osz) ((__l) <= (__osz) / (__s))"
.LASF233:
	.string	"__FLT64_IS_IEC_60559__ 2"
.LASF195:
	.string	"__LDBL_MIN__ 3.36210314311209350626267781732175260e-4932L"
.LASF327:
	.string	"__SIZEOF_WCHAR_T__ 4"
.LASF149:
	.string	"__FLT_EVAL_METHOD__ 0"
.LASF1071:
	.string	"_WRAPPED 0x40"
.LASF432:
	.string	"__GLIBC__ 2"
.LASF904:
	.string	"INT_FAST32_MIN (-9223372036854775807L-1)"
.LASF104:
	.string	"__INT8_MAX__ 0x7f"
.LASF884:
	.string	"INT32_MAX (2147483647)"
.LASF857:
	.string	"NCURSES_VERSION_MAJOR 6"
.LASF703:
	.string	"_WCHAR_T_ "
.LASF11:
	.string	"__ATOMIC_ACQUIRE 2"
.LASF1140:
	.string	"untouchwin(win) wtouchln((win), 0, getmaxy(win), 0)"
.LASF830:
	.string	"__SIZEOF_PTHREAD_MUTEXATTR_T 4"
.LASF941:
	.string	"NCURSES_ATTR_T int"
.LASF728:
	.string	"__WIFSIGNALED(status) (((signed char) (((status) & 0x7f) + 1) >> 1) > 0)"
.LASF446:
	.string	"__P(args) args"
.LASF686:
	.string	"__HAVE_FLOAT128_UNLIKE_LDBL (__HAVE_DISTINCT_FLOAT128 && __LDBL_MANT_DIG__ != 113)"
.LASF16:
	.string	"__PIC__ 2"
.LASF916:
	.string	"UINTPTR_MAX (18446744073709551615UL)"
.LASF894:
	.string	"INT_LEAST8_MAX (127)"
.LASF548:
	.string	"_SYS_SIZE_T_H "
.LASF599:
	.string	"__RLIM_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF990:
	.string	"NCURSES_BOOL bool"
.LASF225:
	.string	"__FLT64_MAX__ 1.79769313486231570814527423731704357e+308F64"
.LASF638:
	.string	"_IO_EOF_SEEN 0x0010"
.LASF332:
	.string	"__x86_64 1"
.LASF975:
	.string	"va_copy(d,s) __builtin_va_copy(d,s)"
.LASF1139:
	.string	"touchline(win,s,c) wtouchln((win), s, c, 1)"
.LASF1366:
	.string	"BUTTON2_CLICKED NCURSES_MOUSE_MASK(2, NCURSES_BUTTON_CLICKED)"
.LASF834:
	.string	"__SIZEOF_PTHREAD_BARRIERATTR_T 4"
.LASF393:
	.string	"__USE_FORTIFY_LEVEL"
.LASF1019:
	.string	"NCURSES_ACS(c) (acs_map[NCURSES_CAST(unsigned char,(c))])"
.LASF1447:
	.string	"_IO_save_end"
.LASF807:
	.string	"__suseconds_t_defined "
.LASF29:
	.string	"__SIZEOF_SIZE_T__ 8"
.LASF610:
	.string	"__USECONDS_T_TYPE __U32_TYPE"
.LASF882:
	.string	"INT8_MAX (127)"
.LASF824:
	.string	"_THREAD_SHARED_TYPES_H 1"
.LASF816:
	.string	"FD_CLR(fd,fdsetp) __FD_CLR (fd, fdsetp)"
.LASF1032:
	.string	"ACS_S9 NCURSES_ACS('s')"
.LASF905:
	.string	"INT_FAST64_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF384:
	.string	"__USE_XOPEN2K8"
.LASF367:
	.string	"_STDIO_H 1"
.LASF1125:
	.string	"getcurx(win) (NCURSES_OK_ADDR(win) ? (win)->_curx : ERR)"
.LASF799:
	.string	"__FD_SET(d,s) ((void) (__FDS_BITS (s)[__FD_ELT(d)] |= __FD_MASK(d)))"
.LASF611:
	.string	"__SUSECONDS_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF565:
	.string	"__need_NULL"
.LASF397:
	.string	"__GLIBC_USE_DEPRECATED_SCANF"
.LASF423:
	.string	"__SYSCALL_WORDSIZE 64"
.LASF386:
	.string	"__USE_LARGEFILE"
.LASF1110:
	.string	"getbegyx(win,y,x) (y = getbegy(win), x = getbegx(win))"
.LASF283:
	.string	"__DEC32_MIN_EXP__ (-94)"
.LASF307:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 1"
.LASF1273:
	.string	"KEY_EIC 0514"
.LASF453:
	.string	"__bos(ptr) __builtin_object_size (ptr, __USE_FORTIFY_LEVEL > 1)"
.LASF415:
	.string	"__USE_POSIX199309 1"
.LASF55:
	.string	"__UINT32_TYPE__ unsigned int"
.LASF1133:
	.string	"wstandout(win) (wattrset(win,A_STANDOUT))"
.LASF1335:
	.string	"KEY_SNEXT 0614"
.LASF267:
	.string	"__FLT64X_DIG__ 18"
.LASF79:
	.string	"__LONG_MAX__ 0x7fffffffffffffffL"
.LASF964:
	.string	"NCURSES_TPARM_ARG intptr_t"
.LASF1068:
	.string	"_SCROLLWIN 0x08"
.LASF481:
	.string	"__attribute_deprecated_msg__(msg) __attribute__ ((__deprecated__ (msg)))"
.LASF632:
	.string	"_____fpos64_t_defined 1"
.LASF1354:
	.string	"NCURSES_BUTTON_PRESSED 002L"
.LASF910:
	.string	"UINT_FAST8_MAX (255)"
.LASF190:
	.string	"__LDBL_MAX_10_EXP__ 4932"
.LASF452:
	.string	"__END_DECLS "
.LASF1293:
	.string	"KEY_BEG 0542"
.LASF1493:
	.string	"average"
.LASF1117:
	.string	"setterm(term) setupterm(term, 1, (int *)0)"
.LASF1352:
	.string	"NCURSES_MOUSE_MASK(b,m) ((m) << (((b) - 1) * 5))"
.LASF1290:
	.string	"KEY_C1 0537"
.LASF850:
	.string	"_STRING_H 1"
.LASF284:
	.string	"__DEC32_MAX_EXP__ 97"
.LASF596:
	.string	"__OFF_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF1504:
	.string	"work_jiffies_after"
.LASF265:
	.string	"__FLT32X_IS_IEC_60559__ 2"
.LASF1121:
	.string	"crmode() cbreak()"
.LASF1500:
	.string	"system"
.LASF625:
	.string	"__KERNEL_OLD_TIMEVAL_MATCHES_TIMEVAL64 1"
.LASF1405:
	.string	"TRACE_CALLS 0x0020"
.LASF244:
	.string	"__FLT128_EPSILON__ 1.92592994438723585305597794258492732e-34F128"
.LASF326:
	.string	"__SIZEOF_INT128__ 16"
.LASF1428:
	.string	"short unsigned int"
.LASF249:
	.string	"__FLT128_IS_IEC_60559__ 2"
.LASF1429:
	.string	"signed char"
.LASF687:
	.string	"__HAVE_FLOATN_NOT_TYPEDEF 1"
.LASF1176:
	.string	"getch() wgetch(stdscr)"
.LASF177:
	.string	"__DBL_NORM_MAX__ ((double)1.79769313486231570814527423731704357e+308L)"
.LASF335:
	.string	"__SIZEOF_FLOAT128__ 16"
.LASF545:
	.string	"__size_t__ "
.LASF417:
	.string	"__USE_XOPEN2K 1"
.LASF1489:
	.string	"file_buf"
.LASF1132:
	.string	"getpary(win) (NCURSES_OK_ADDR(win) ? (win)->_pary : ERR)"
.LASF1167:
	.string	"chgat(n,a,c,o) wchgat(stdscr,(n),(a),(c),(o))"
.LASF1240:
	.string	"is_cleared(win) (NCURSES_OK_ADDR(win) ? (win)->_clear : FALSE)"
.LASF707:
	.string	"_WCHAR_T_H "
.LASF1134:
	.string	"wstandend(win) (wattrset(win,A_NORMAL))"
.LASF279:
	.string	"__FLT64X_HAS_INFINITY__ 1"
.LASF478:
	.string	"__attribute_used__ __attribute__ ((__used__))"
.LASF30:
	.string	"__CHAR_BIT__ 8"
.LASF763:
	.string	"__time_t_defined 1"
.LASF791:
	.string	"be32toh(x) __bswap_32 (x)"
.LASF783:
	.ascii	"__bswap_constant_64(x) ((((x) & 0xff00000000000000ull) >> 56"
	.ascii	") | (((x) & 0x00ff000000"
	.string	"000000ull) >> 40) | (((x) & 0x0000ff0000000000ull) >> 24) | (((x) & 0x000000ff00000000ull) >> 8) | (((x) & 0x00000000ff000000ull) << 8) | (((x) & 0x0000000000ff0000ull) << 24) | (((x) & 0x000000000000ff00ull) << 40) | (((x) & 0x00000000000000ffull) << 56))"
.LASF650:
	.string	"EOF (-1)"
.LASF542:
	.string	"__GLIBC_USE_IEC_60559_TYPES_EXT 0"
.LASF1515:
	.string	"status"
.LASF918:
	.string	"INTMAX_MAX (__INT64_C(9223372036854775807))"
.LASF521:
	.string	"__stub___compat_bdflush "
.LASF1039:
	.string	"ACS_RARROW NCURSES_ACS('+')"
.LASF1109:
	.string	"getyx(win,y,x) (y = getcury(win), x = getcurx(win))"
.LASF967:
	.string	"NCURSES_CH_T"
.LASF1211:
	.string	"mvwinnstr(win,y,x,s,n) (wmove((win),(y),(x)) == ERR ? ERR : winnstr((win),(s),(n)))"
.LASF844:
	.string	"__ONCE_FLAG_INIT { 0 }"
.LASF370:
	.string	"_FEATURES_H 1"
.LASF689:
	.string	"__f64(x) x ##f64"
.LASF277:
	.string	"__FLT64X_DENORM_MIN__ 3.64519953188247460252840593361941982e-4951F64x"
.LASF553:
	.string	"_BSD_SIZE_T_ "
.LASF496:
	.string	"__va_arg_pack_len() __builtin_va_arg_pack_len ()"
.LASF480:
	.string	"__attribute_deprecated__ __attribute__ ((__deprecated__))"
.LASF1186:
	.string	"insstr(s) winsstr(stdscr,(s))"
.LASF1135:
	.string	"wattron(win,at) wattr_on(win, NCURSES_CAST(attr_t, at), NULL)"
.LASF51:
	.string	"__INT32_TYPE__ int"
.LASF823:
	.string	"_BITS_PTHREADTYPES_COMMON_H 1"
.LASF723:
	.string	"__WCLONE 0x80000000"
.LASF560:
	.string	"_SIZET_ "
.LASF321:
	.string	"__GCC_ATOMIC_POINTER_LOCK_FREE 2"
.LASF818:
	.string	"FD_ZERO(fdsetp) __FD_ZERO (fdsetp)"
.LASF286:
	.string	"__DEC32_MAX__ 9.999999E96DF"
.LASF1439:
	.string	"_IO_read_base"
.LASF739:
	.string	"WIFEXITED(status) __WIFEXITED (status)"
.LASF597:
	.string	"__OFF64_T_TYPE __SQUAD_TYPE"
.LASF678:
	.string	"__HAVE_FLOAT32X 1"
.LASF1457:
	.string	"_offset"
.LASF207:
	.string	"__FLT32_MAX_10_EXP__ 38"
.LASF8:
	.string	"__VERSION__ \"11.4.0\""
.LASF1390:
	.string	"BUTTON_PRESS(e,x) ((e) & NCURSES_MOUSE_MASK(x, 002))"
.LASF1064:
	.string	"OK (0)"
.LASF1084:
	.string	"NCURSES_SP_FUNCS 20211021"
.LASF291:
	.string	"__DEC64_MAX_EXP__ 385"
.LASF1444:
	.string	"_IO_buf_end"
.LASF93:
	.string	"__WINT_WIDTH__ 32"
.LASF589:
	.string	"__UID_T_TYPE __U32_TYPE"
.LASF1247:
	.string	"is_notimeout(win) (NCURSES_OK_ADDR(win) ? (win)->_notimeout : FALSE)"
.LASF144:
	.string	"__INTPTR_MAX__ 0x7fffffffffffffffL"
.LASF198:
	.string	"__LDBL_HAS_DENORM__ 1"
.LASF997:
	.string	"WA_REVERSE A_REVERSE"
.LASF1479:
	.string	"read_line"
.LASF1369:
	.string	"BUTTON3_RELEASED NCURSES_MOUSE_MASK(3, NCURSES_BUTTON_RELEASED)"
.LASF440:
	.string	"__LEAF , __leaf__"
.LASF1512:
	.string	"path"
.LASF317:
	.string	"__GCC_ATOMIC_INT_LOCK_FREE 2"
.LASF129:
	.string	"__UINT32_C(c) c ## U"
.LASF222:
	.string	"__FLT64_MAX_EXP__ 1024"
.LASF1420:
	.string	"POWER_LIMIT_COUNT 2"
.LASF1318:
	.string	"KEY_SCANCEL 0573"
.LASF136:
	.string	"__INT_FAST32_MAX__ 0x7fffffffffffffffL"
.LASF1025:
	.string	"ACS_RTEE NCURSES_ACS('u')"
.LASF303:
	.string	"__REGISTER_PREFIX__ "
.LASF1463:
	.string	"_mode"
.LASF1327:
	.string	"KEY_SEXIT 0604"
.LASF511:
	.string	"__REDIRECT_NTH_LDBL(name,proto,alias) __REDIRECT_NTH (name, proto, alias)"
.LASF1003:
	.string	"WA_PROTECT A_PROTECT"
.LASF1440:
	.string	"_IO_write_base"
.LASF1047:
	.string	"ACS_LEQUAL NCURSES_ACS('y')"
.LASF619:
	.string	"__SSIZE_T_TYPE __SWORD_TYPE"
.LASF464:
	.string	"__errordecl(name,msg) extern void name (void) __attribute__((__error__ (msg)))"
.LASF760:
	.string	"__key_t_defined "
.LASF688:
	.string	"__f32(x) x ##f32"
.LASF591:
	.string	"__INO_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF668:
	.string	"__HAVE_FLOAT128 1"
.LASF786:
	.string	"htole16(x) __uint16_identity (x)"
.LASF1312:
	.string	"KEY_REFRESH 0565"
.LASF590:
	.string	"__GID_T_TYPE __U32_TYPE"
.LASF354:
	.string	"__linux__ 1"
.LASF1496:
	.string	"core_count"
.LASF898:
	.string	"UINT_LEAST8_MAX (255)"
.LASF956:
	.string	"NCURSES_BROKEN_LINKER"
.LASF1202:
	.string	"mvwchgat(win,y,x,n,a,c,o) (wmove((win),(y),(x)) == ERR ? ERR : wchgat((win),(n),(a),(c),(o)))"
.LASF450:
	.string	"__ptr_t void *"
.LASF1000:
	.string	"WA_BOLD A_BOLD"
.LASF661:
	.string	"FOPEN_MAX 16"
.LASF580:
	.string	"__SLONG32_TYPE int"
.LASF4:
	.string	"__STDC_HOSTED__ 1"
.LASF295:
	.string	"__DEC64_SUBNORMAL_MIN__ 0.000000000000001E-383DD"
.LASF67:
	.string	"__INT_FAST32_TYPE__ long int"
.LASF888:
	.string	"UINT32_MAX (4294967295U)"
.LASF340:
	.string	"__k8__ 1"
.LASF334:
	.string	"__SIZEOF_FLOAT80__ 16"
.LASF408:
	.string	"__USE_POSIX_IMPLICITLY 1"
.LASF860:
	.string	"NCURSES_VERSION"
.LASF118:
	.string	"__INT_LEAST32_MAX__ 0x7fffffff"
.LASF206:
	.string	"__FLT32_MAX_EXP__ 128"
.LASF374:
	.string	"__USE_ISOCXX11"
.LASF1136:
	.string	"wattroff(win,at) wattr_off(win, NCURSES_CAST(attr_t, at), NULL)"
.LASF1431:
	.string	"long int"
.LASF1241:
	.string	"is_idcok(win) (NCURSES_OK_ADDR(win) ? (win)->_idcok : FALSE)"
.LASF1143:
	.string	"hline(ch,n) whline(stdscr, ch, (n))"
.LASF640:
	.string	"_IO_ERR_SEEN 0x0020"
.LASF181:
	.string	"__DBL_HAS_DENORM__ 1"
.LASF455:
	.string	"__glibc_objsize0(__o) __bos0 (__o)"
.LASF110:
	.string	"__UINT32_MAX__ 0xffffffffU"
.LASF223:
	.string	"__FLT64_MAX_10_EXP__ 308"
.LASF1283:
	.string	"KEY_CATAB 0526"
.LASF400:
	.string	"__glibc_clang_prereq(maj,min) 0"
.LASF97:
	.string	"__INTMAX_C(c) c ## L"
.LASF1119:
	.string	"resetterm() reset_shell_mode()"
.LASF878:
	.string	"INT8_MIN (-128)"
.LASF313:
	.string	"__GCC_ATOMIC_CHAR16_T_LOCK_FREE 2"
.LASF886:
	.string	"UINT8_MAX (255)"
.LASF1466:
	.string	"_IO_marker"
.LASF17:
	.string	"__pie__ 2"
.LASF1473:
	.string	"INTEL"
.LASF305:
	.string	"__GNUC_STDC_INLINE__ 1"
.LASF662:
	.string	"stdin stdin"
.LASF260:
	.string	"__FLT32X_EPSILON__ 2.22044604925031308084726333618164062e-16F32x"
.LASF1060:
	.string	"ACS_BSBS ACS_HLINE"
.LASF968:
	.string	"NCURSES_CH_T cchar_t"
.LASF447:
	.string	"__PMT(args) args"
.LASF92:
	.string	"__WCHAR_WIDTH__ 32"
.LASF895:
	.string	"INT_LEAST16_MAX (32767)"
.LASF227:
	.string	"__FLT64_MIN__ 2.22507385850720138309023271733240406e-308F64"
.LASF1514:
	.string	"cumulative"
.LASF1277:
	.string	"KEY_SF 0520"
.LASF806:
	.string	"_STRUCT_TIMESPEC 1"
.LASF1361:
	.string	"BUTTON1_CLICKED NCURSES_MOUSE_MASK(1, NCURSES_BUTTON_CLICKED)"
.LASF363:
	.string	"__STDC_IEC_60559_BFP__ 201404L"
.LASF747:
	.string	"EXIT_SUCCESS 0"
.LASF1401:
	.string	"TRACE_UPDATE 0x0004"
.LASF1112:
	.string	"getparyx(win,y,x) (y = getpary(win), x = getparx(win))"
.LASF81:
	.string	"__WCHAR_MAX__ 0x7fffffff"
.LASF613:
	.string	"__DADDR_T_TYPE __S32_TYPE"
.LASF214:
	.string	"__FLT32_HAS_DENORM__ 1"
.LASF866:
	.string	"NCURSES_WRAPPED_VAR(type,name) extern NCURSES_IMPEXP type NCURSES_PUBLIC_VAR(name)(void)"
.LASF435:
	.string	"_SYS_CDEFS_H 1"
.LASF663:
	.string	"stdout stdout"
.LASF1116:
	.string	"getnstr(s,n) wgetnstr(stdscr, s, (n))"
.LASF660:
	.string	"FOPEN_MAX"
.LASF1342:
	.string	"KEY_SRSUME 0623"
.LASF325:
	.string	"__SSP_STRONG__ 3"
.LASF1380:
	.string	"BUTTON5_PRESSED NCURSES_MOUSE_MASK(5, NCURSES_BUTTON_PRESSED)"
.LASF551:
	.string	"__SIZE_T "
.LASF618:
	.string	"__FSID_T_TYPE struct { int __val[2]; }"
.LASF1467:
	.string	"_IO_codecvt"
.LASF1076:
	.string	"GCC_NORETURN "
.LASF1239:
	.string	"slk_attr_on(a,v) ((v) ? ERR : slk_attron(a))"
.LASF316:
	.string	"__GCC_ATOMIC_SHORT_LOCK_FREE 2"
.LASF166:
	.string	"__FLT_HAS_INFINITY__ 1"
.LASF1187:
	.string	"instr(s) winstr(stdscr,(s))"
.LASF963:
	.string	"NCURSES_TPARM_ARG"
.LASF1519:
	.string	"battery_power"
.LASF1304:
	.string	"KEY_MESSAGE 0555"
.LASF601:
	.string	"__BLKCNT_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF338:
	.string	"__GCC_ASM_FLAG_OUTPUTS__ 1"
.LASF617:
	.string	"__BLKSIZE_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF37:
	.string	"__SIZEOF_POINTER__ 8"
.LASF1476:
	.string	"strtol"
.LASF969:
	.string	"NCURSES_WIDECHAR 0"
.LASF1113:
	.string	"getsyx(y,x) do { if (newscr) { if (is_leaveok(newscr)) (y) = (x) = -1; else getyx(newscr,(y), (x)); } } while(0)"
.LASF242:
	.string	"__FLT128_NORM_MAX__ 1.18973149535723176508575932662800702e+4932F128"
.LASF1070:
	.string	"_HASMOVED 0x20"
.LASF550:
	.string	"_T_SIZE "
.LASF266:
	.string	"__FLT64X_MANT_DIG__ 64"
.LASF1491:
	.string	"return_val"
.LASF693:
	.string	"__CFLOAT64 _Complex _Float64"
.LASF810:
	.string	"__FD_ELT(d) ((d) / __NFDBITS)"
.LASF790:
	.string	"htole32(x) __uint32_identity (x)"
.LASF414:
	.string	"__USE_POSIX2 1"
.LASF465:
	.string	"__flexarr []"
.LASF695:
	.string	"__CFLOAT64X _Complex _Float64x"
.LASF399:
	.string	"__GNUC_PREREQ(maj,min) ((__GNUC__ << 16) + __GNUC_MINOR__ >= ((maj) << 16) + (min))"
.LASF471:
	.string	"__ASMNAME2(prefix,cname) __STRING (prefix) cname"
.LASF569:
	.string	"_BITS_TYPES_H 1"
.LASF231:
	.string	"__FLT64_HAS_INFINITY__ 1"
.LASF996:
	.string	"WA_UNDERLINE A_UNDERLINE"
.LASF1384:
	.string	"BUTTON_CTRL NCURSES_MOUSE_MASK(6, 0001L)"
.LASF899:
	.string	"UINT_LEAST16_MAX (65535)"
.LASF1172:
	.string	"delch() wdelch(stdscr)"
.LASF467:
	.string	"__REDIRECT(name,proto,alias) name proto __asm__ (__ASMNAME (#alias))"
.LASF534:
	.string	"__GLIBC_USE_IEC_60559_BFP_EXT_C2X 0"
.LASF804:
	.string	"_SIGSET_NWORDS (1024 / (8 * sizeof (unsigned long int)))"
.LASF270:
	.string	"__FLT64X_MAX_EXP__ 16384"
.LASF700:
	.string	"_T_WCHAR_ "
.LASF39:
	.string	"__GNUC_WIDE_EXECUTION_CHARSET_NAME \"UTF-32LE\""
.LASF1404:
	.string	"TRACE_ORDINARY 0x001F"
.LASF892:
	.string	"INT_LEAST32_MIN (-2147483647-1)"
.LASF1052:
	.string	"ACS_BSSB ACS_ULCORNER"
.LASF411:
	.string	"_POSIX_C_SOURCE"
.LASF1274:
	.string	"KEY_CLEAR 0515"
.LASF745:
	.string	"RAND_MAX 2147483647"
.LASF1391:
	.string	"BUTTON_CLICK(e,x) ((e) & NCURSES_MOUSE_MASK(x, 004))"
.LASF572:
	.string	"__S32_TYPE int"
.LASF1022:
	.string	"ACS_URCORNER NCURSES_ACS('k')"
.LASF146:
	.string	"__UINTPTR_MAX__ 0xffffffffffffffffUL"
.LASF319:
	.string	"__GCC_ATOMIC_LLONG_LOCK_FREE 2"
.LASF1194:
	.string	"timeout(delay) wtimeout(stdscr,(delay))"
.LASF160:
	.string	"__FLT_MAX__ 3.40282346638528859811704183484516925e+38F"
.LASF91:
	.string	"__LONG_LONG_WIDTH__ 64"
.LASF907:
	.string	"INT_FAST16_MAX (9223372036854775807L)"
.LASF1058:
	.string	"ACS_SSBS ACS_BTEE"
.LASF1043:
	.string	"ACS_LANTERN NCURSES_ACS('i')"
.LASF829:
	.string	"__SIZEOF_PTHREAD_BARRIER_T 32"
.LASF1423:
	.string	"DEBUG_ENABLE 1"
.LASF592:
	.string	"__INO64_T_TYPE __UQUAD_TYPE"
.LASF280:
	.string	"__FLT64X_HAS_QUIET_NAN__ 1"
.LASF527:
	.string	"__stub_sigreturn "
.LASF1021:
	.string	"ACS_LLCORNER NCURSES_ACS('m')"
.LASF681:
	.string	"__HAVE_DISTINCT_FLOAT32 0"
.LASF1196:
	.string	"winsertln(win) winsdelln(win,1)"
.LASF535:
	.string	"__GLIBC_USE_IEC_60559_EXT"
.LASF62:
	.string	"__UINT_LEAST16_TYPE__ short unsigned int"
.LASF200:
	.string	"__LDBL_HAS_QUIET_NAN__ 1"
.LASF570:
	.string	"__S16_TYPE short int"
.LASF306:
	.string	"__NO_INLINE__ 1"
.LASF229:
	.string	"__FLT64_DENORM_MIN__ 4.94065645841246544176568792868221372e-324F64"
.LASF614:
	.string	"__KEY_T_TYPE __S32_TYPE"
.LASF716:
	.string	"WUNTRACED 2"
.LASF1313:
	.string	"KEY_REPLACE 0566"
.LASF1255:
	.string	"is_linetouched(w,l) ((!(w) || ((l) > getmaxy(w)) || ((l) < 0)) ? ERR : (is_linetouched)((w),(l)))"
.LASF1485:
	.string	"strncmp"
.LASF484:
	.string	"__attribute_nonnull__(params) __attribute__ ((__nonnull__ params))"
.LASF1492:
	.string	"load"
.LASF875:
	.string	"__WCHAR_MIN __WCHAR_MIN__"
.LASF426:
	.string	"__USE_ATFILE 1"
.LASF1128:
	.string	"getbegy(win) (NCURSES_OK_ADDR(win) ? (win)->_begy : ERR)"
.LASF987:
	.string	"true 1"
.LASF1345:
	.string	"KEY_SUNDO 0626"
.LASF491:
	.string	"__attribute_artificial__ __attribute__ ((__artificial__))"
.LASF1030:
	.string	"ACS_PLUS NCURSES_ACS('n')"
.LASF1198:
	.string	"mvwaddchnstr(win,y,x,str,n) (wmove((win),(y),(x)) == ERR ? ERR : waddchnstr((win),(str),(n)))"
.LASF604:
	.string	"__FSBLKCNT64_T_TYPE __UQUAD_TYPE"
.LASF555:
	.string	"_SIZE_T_DEFINED "
.LASF196:
	.string	"__LDBL_EPSILON__ 1.08420217248550443400745280086994171e-19L"
.LASF1219:
	.string	"mvaddchstr(y,x,str) mvwaddchstr(stdscr,(y),(x),(str))"
.LASF241:
	.string	"__FLT128_MAX__ 1.18973149535723176508575932662800702e+4932F128"
.LASF1156:
	.string	"addnstr(str,n) waddnstr(stdscr,(str),(n))"
.LASF103:
	.string	"__SIG_ATOMIC_WIDTH__ 32"
.LASF629:
	.string	"__STD_TYPE"
.LASF615:
	.string	"__CLOCKID_T_TYPE __S32_TYPE"
.LASF992:
	.string	"NCURSES_OK_ADDR(p) (0 != NCURSES_CAST(const void *, (p)))"
.LASF901:
	.string	"UINT_LEAST64_MAX (__UINT64_C(18446744073709551615))"
.LASF587:
	.string	"__SYSCALL_ULONG_TYPE __ULONGWORD_TYPE"
.LASF1081:
	.string	"NCURSES_EXT_FUNCS"
.LASF581:
	.string	"__ULONG32_TYPE unsigned int"
.LASF676:
	.string	"__HAVE_FLOAT32 1"
.LASF1537:
	.string	"_IO_FILE"
.LASF68:
	.string	"__INT_FAST64_TYPE__ long int"
.LASF544:
	.string	"__need_NULL "
.LASF595:
	.string	"__FSWORD_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF1468:
	.string	"_IO_wide_data"
.LASF23:
	.string	"__SIZEOF_LONG__ 8"
.LASF185:
	.string	"__LDBL_MANT_DIG__ 64"
.LASF72:
	.string	"__UINT_FAST64_TYPE__ long unsigned int"
.LASF564:
	.string	"NULL ((void *)0)"
.LASF1029:
	.string	"ACS_VLINE NCURSES_ACS('x')"
.LASF33:
	.string	"__ORDER_BIG_ENDIAN__ 4321"
.LASF352:
	.string	"__gnu_linux__ 1"
.LASF1536:
	.string	"/home/jscha/dvp/cpumon/build"
.LASF795:
	.string	"be64toh(x) __bswap_64 (x)"
.LASF843:
	.string	"__PTHREAD_RWLOCK_INITIALIZER(__flags) 0, 0, 0, 0, 0, 0, 0, 0, __PTHREAD_RWLOCK_ELISION_EXTRA, 0, __flags"
.LASF855:
	.string	"CURSES 1"
.LASF1326:
	.string	"KEY_SEOL 0603"
.LASF308:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 1"
.LASF278:
	.string	"__FLT64X_HAS_DENORM__ 1"
.LASF881:
	.string	"INT64_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF102:
	.string	"__SIG_ATOMIC_MIN__ (-__SIG_ATOMIC_MAX__ - 1)"
.LASF1511:
	.string	"freq_ghz"
.LASF518:
	.string	"__attr_dealloc(dealloc,argno) __attribute__ ((__malloc__ (dealloc, argno)))"
.LASF364:
	.string	"__STDC_IEC_559_COMPLEX__ 1"
.LASF646:
	.string	"_IOFBF 0"
.LASF926:
	.string	"WCHAR_MAX __WCHAR_MAX"
.LASF802:
	.string	"__sigset_t_defined 1"
.LASF57:
	.string	"__INT_LEAST8_TYPE__ signed char"
.LASF145:
	.string	"__INTPTR_WIDTH__ 64"
.LASF507:
	.string	"__LDBL_REDIR_NTH(name,proto) name proto __THROW"
.LASF492:
	.string	"__extern_inline extern __inline __attribute__ ((__gnu_inline__))"
.LASF1131:
	.string	"getparx(win) (NCURSES_OK_ADDR(win) ? (win)->_parx : ERR)"
.LASF713:
	.string	"__need_wchar_t"
.LASF159:
	.string	"__FLT_DECIMAL_DIG__ 9"
.LASF915:
	.string	"INTPTR_MAX (9223372036854775807L)"
.LASF438:
	.string	"__glibc_has_builtin(name) __has_builtin (name)"
.LASF1250:
	.string	"is_subwin(win) (NCURSES_OK_ADDR(win) ? ((win)->_flags & _SUBWIN) != 0 : FALSE)"
.LASF1065:
	.string	"_SUBWIN 0x01"
.LASF168:
	.string	"__FLT_IS_IEC_60559__ 2"
.LASF532:
	.string	"__GLIBC_USE_IEC_60559_BFP_EXT 0"
.LASF1252:
	.string	"wgetdelay(win) (NCURSES_OK_ADDR(win) ? (win)->_delay : 0)"
.LASF353:
	.string	"__linux 1"
.LASF1206:
	.string	"mvwgetstr(win,y,x,str) (wmove((win),(y),(x)) == ERR ? ERR : wgetstr((win),(str)))"
.LASF434:
	.string	"__GLIBC_PREREQ(maj,min) ((__GLIBC__ << 16) + __GLIBC_MINOR__ >= ((maj) << 16) + (min))"
.LASF245:
	.string	"__FLT128_DENORM_MIN__ 6.47517511943802511092443895822764655e-4966F128"
.LASF19:
	.string	"__FINITE_MATH_ONLY__ 0"
.LASF520:
	.string	"__attribute_returns_twice__ __attribute__ ((__returns_twice__))"
.LASF684:
	.string	"__HAVE_DISTINCT_FLOAT64X 0"
.LASF1106:
	.string	"A_TOP NCURSES_BITS(1U,21)"
.LASF758:
	.string	"__id_t_defined "
.LASF1529:
	.string	"power_limits"
.LASF1:
	.string	"__STDC_VERSION__ 201710L"
.LASF841:
	.string	"_RWLOCK_INTERNAL_H "
.LASF732:
	.string	"__W_EXITCODE(ret,sig) ((ret) << 8 | (sig))"
.LASF1190:
	.string	"scrl(n) wscrl(stdscr,(n))"
.LASF1085:
	.string	"NCURSES_SP_NAME(name) name ##_sp"
.LASF1535:
	.string	"/home/jscha/dvp/cpumon/src/sysfs.c"
.LASF965:
	.string	"NCURSES_WCWIDTH_GRAPHICS"
.LASF121:
	.string	"__INT_LEAST64_MAX__ 0x7fffffffffffffffL"
.LASF1027:
	.string	"ACS_TTEE NCURSES_ACS('w')"
.LASF840:
	.string	"__PTHREAD_MUTEX_INITIALIZER(__kind) 0, 0, 0, 0, __kind, 0, 0, { 0, 0 }"
.LASF405:
	.string	"__USE_ISOC11 1"
.LASF759:
	.string	"__daddr_t_defined "
.LASF493:
	.string	"__extern_always_inline extern __always_inline __attribute__ ((__gnu_inline__))"
.LASF1398:
	.string	"TRACE_DISABLE 0x0000"
.LASF1275:
	.string	"KEY_EOS 0516"
.LASF1108:
	.string	"A_ITALIC NCURSES_BITS(1U,23)"
.LASF1448:
	.string	"_markers"
.LASF722:
	.string	"__WALL 0x40000000"
.LASF454:
	.string	"__bos0(ptr) __builtin_object_size (ptr, 0)"
.LASF1264:
	.string	"KEY_RIGHT 0405"
.LASF1118:
	.string	"fixterm() reset_prog_mode()"
.LASF773:
	.string	"__BYTE_ORDER __LITTLE_ENDIAN"
.LASF787:
	.string	"be16toh(x) __bswap_16 (x)"
.LASF358:
	.string	"unix 1"
.LASF396:
	.string	"__GLIBC_USE_DEPRECATED_GETS"
.LASF219:
	.string	"__FLT64_DIG__ 15"
.LASF1242:
	.string	"is_idlok(win) (NCURSES_OK_ADDR(win) ? (win)->_idlok : FALSE)"
.LASF311:
	.string	"__GCC_ATOMIC_BOOL_LOCK_FREE 2"
.LASF1531:
	.string	"results"
.LASF1508:
	.string	"core"
.LASF293:
	.string	"__DEC64_MAX__ 9.999999999999999E384DD"
.LASF579:
	.string	"__UWORD_TYPE unsigned long int"
.LASF1130:
	.string	"getmaxy(win) (NCURSES_OK_ADDR(win) ? ((win)->_maxy + 1) : ERR)"
.LASF826:
	.string	"__SIZEOF_PTHREAD_MUTEX_T 40"
.LASF388:
	.string	"__USE_FILE_OFFSET64"
.LASF734:
	.string	"__W_CONTINUED 0xffff"
.LASF178:
	.string	"__DBL_MIN__ ((double)2.22507385850720138309023271733240406e-308L)"
.LASF1063:
	.string	"ERR (-1)"
.LASF664:
	.string	"stderr stderr"
.LASF498:
	.string	"__glibc_unlikely(cond) __builtin_expect ((cond), 0)"
.LASF749:
	.string	"_SYS_TYPES_H 1"
.LASF1396:
	.string	"_tracech_t _tracechtype"
.LASF1375:
	.string	"BUTTON4_PRESSED NCURSES_MOUSE_MASK(4, NCURSES_BUTTON_PRESSED)"
.LASF1126:
	.string	"getcury(win) (NCURSES_OK_ADDR(win) ? (win)->_cury : ERR)"
.LASF1520:
	.string	"read_value"
.LASF602:
	.string	"__BLKCNT64_T_TYPE __SQUAD_TYPE"
.LASF771:
	.string	"__PDP_ENDIAN 3412"
.LASF1495:
	.string	"total_jiffies_before"
.LASF27:
	.string	"__SIZEOF_DOUBLE__ 8"
.LASF774:
	.string	"__FLOAT_WORD_ORDER __BYTE_ORDER"
.LASF612:
	.string	"__SUSECONDS64_T_TYPE __SQUAD_TYPE"
.LASF420:
	.string	"_ATFILE_SOURCE 1"
.LASF238:
	.string	"__FLT128_MAX_EXP__ 16384"
.LASF211:
	.string	"__FLT32_MIN__ 1.17549435082228750796873653722224568e-38F32"
.LASF704:
	.string	"_BSD_WCHAR_T_ "
.LASF666:
	.string	"__attr_dealloc_fclose __attr_dealloc (fclose, 1)"
.LASF744:
	.string	"__lldiv_t_defined 1"
.LASF897:
	.string	"INT_LEAST64_MAX (__INT64_C(9223372036854775807))"
.LASF1353:
	.string	"NCURSES_BUTTON_RELEASED 001L"
.LASF479:
	.string	"__attribute_noinline__ __attribute__ ((__noinline__))"
.LASF1014:
	.string	"COLOR_YELLOW 3"
.LASF833:
	.string	"__SIZEOF_PTHREAD_RWLOCKATTR_T 8"
.LASF641:
	.string	"__ferror_unlocked_body(_fp) (((_fp)->_flags & _IO_ERR_SEEN) != 0)"
.LASF1280:
	.string	"KEY_PPAGE 0523"
.LASF392:
	.string	"__USE_GNU"
.LASF1055:
	.string	"ACS_SBBS ACS_LRCORNER"
.LASF729:
	.string	"__WIFSTOPPED(status) (((status) & 0xff) == 0x7f)"
.LASF376:
	.string	"__USE_POSIX2"
.LASF1170:
	.string	"clrtoeol() wclrtoeol(stdscr)"
.LASF1521:
	.string	"read_value2"
.LASF1034:
	.string	"ACS_CKBOARD NCURSES_ACS('a')"
.LASF1481:
	.string	"printw"
.LASF1013:
	.string	"COLOR_GREEN 2"
.LASF1192:
	.string	"standend() wstandend(stdscr)"
.LASF1035:
	.string	"ACS_DEGREE NCURSES_ACS('f')"
.LASF1488:
	.string	"fopen"
.LASF389:
	.string	"__USE_MISC"
.LASF341:
	.string	"__code_model_small__ 1"
.LASF578:
	.string	"__SWORD_TYPE long int"
.LASF696:
	.string	"__need_wchar_t "
.LASF383:
	.string	"__USE_XOPEN2KXSI"
.LASF912:
	.string	"UINT_FAST32_MAX (18446744073709551615UL)"
.LASF1331:
	.string	"KEY_SIC 0610"
.LASF820:
	.string	"__blkcnt_t_defined "
.LASF13:
	.string	"__ATOMIC_ACQ_REL 4"
.LASF1371:
	.string	"BUTTON3_CLICKED NCURSES_MOUSE_MASK(3, NCURSES_BUTTON_CLICKED)"
.LASF721:
	.string	"__WNOTHREAD 0x20000000"
.LASF701:
	.string	"_T_WCHAR "
.LASF1306:
	.string	"KEY_NEXT 0557"
.LASF49:
	.string	"__INT8_TYPE__ signed char"
.LASF887:
	.string	"UINT16_MAX (65535)"
.LASF347:
	.string	"__SSE2_MATH__ 1"
.LASF309:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 1"
.LASF1092:
	.string	"A_COLOR NCURSES_BITS(((1U) << 8) - 1U,0)"
.LASF856:
	.string	"CURSES_H 1"
.LASF620:
	.string	"__CPU_MASK_TYPE __SYSCALL_ULONG_TYPE"
.LASF628:
	.string	"__TIME64_T_TYPE __TIME_T_TYPE"
.LASF957:
	.string	"NCURSES_INTEROP_FUNCS"
.LASF647:
	.string	"_IOLBF 1"
.LASF1394:
	.string	"BUTTON_RESERVED_EVENT(e,x) ((e) & NCURSES_MOUSE_MASK(x, 040))"
.LASF460:
	.string	"__glibc_unsafe_len(__l,__s,__osz) (__glibc_unsigned_or_positive (__l) && __builtin_constant_p (__glibc_safe_len_cond ((__SIZE_TYPE__) (__l), __s, __osz)) && !__glibc_safe_len_cond ((__SIZE_TYPE__) (__l), __s, __osz))"
.LASF220:
	.string	"__FLT64_MIN_EXP__ (-1021)"
.LASF1303:
	.string	"KEY_MARK 0554"
.LASF1383:
	.string	"BUTTON5_TRIPLE_CLICKED NCURSES_MOUSE_MASK(5, NCURSES_TRIPLE_CLICKED)"
.LASF624:
	.string	"__STATFS_MATCHES_STATFS64 1"
.LASF934:
	.string	"UINT16_C(c) c"
.LASF1093:
	.string	"A_STANDOUT NCURSES_BITS(1U,8)"
.LASF827:
	.string	"__SIZEOF_PTHREAD_ATTR_T 56"
.LASF846:
	.string	"_ALLOCA_H 1"
.LASF920:
	.string	"PTRDIFF_MIN (-9223372036854775807L-1)"
.LASF345:
	.string	"__FXSR__ 1"
.LASF65:
	.string	"__INT_FAST8_TYPE__ signed char"
.LASF1159:
	.string	"attr_off(a,o) wattr_off(stdscr,(a),(o))"
.LASF377:
	.string	"__USE_POSIX199309"
.LASF922:
	.string	"SIG_ATOMIC_MIN (-2147483647-1)"
.LASF1218:
	.string	"mvaddchnstr(y,x,str,n) mvwaddchnstr(stdscr,(y),(x),(str),(n))"
.LASF1088:
	.string	"NCURSES_BITS(mask,shift) (NCURSES_CAST(chtype,(mask)) << ((shift) + NCURSES_ATTR_SHIFT))"
.LASF1075:
	.string	"GCC_SCANFLIKE(fmt,var) __attribute__((format(scanf,fmt,var)))"
.LASF350:
	.string	"__SEG_GS 1"
.LASF226:
	.string	"__FLT64_NORM_MAX__ 1.79769313486231570814527423731704357e+308F64"
.LASF252:
	.string	"__FLT32X_MIN_EXP__ (-1021)"
.LASF702:
	.string	"__WCHAR_T "
.LASF750:
	.string	"__u_char_defined "
.LASF362:
	.string	"__STDC_IEC_559__ 1"
.LASF1461:
	.string	"_freeres_buf"
.LASF336:
	.string	"__ATOMIC_HLE_ACQUIRE 65536"
.LASF292:
	.string	"__DEC64_MIN__ 1E-383DD"
.LASF510:
	.string	"__REDIRECT_LDBL(name,proto,alias) __REDIRECT (name, proto, alias)"
.LASF116:
	.string	"__INT16_C(c) c"
.LASF811:
	.string	"__FD_MASK(d) ((__fd_mask) (1UL << ((d) % __NFDBITS)))"
.LASF43:
	.string	"__WINT_TYPE__ unsigned int"
.LASF1006:
	.string	"WA_LOW A_LOW"
.LASF683:
	.string	"__HAVE_DISTINCT_FLOAT32X 0"
.LASF404:
	.string	"__GLIBC_USE_ISOC2X 0"
.LASF514:
	.string	"__HAVE_GENERIC_SELECTION 1"
.LASF247:
	.string	"__FLT128_HAS_INFINITY__ 1"
.LASF1470:
	.string	"long long unsigned int"
.LASF751:
	.string	"__ino_t_defined "
.LASF1107:
	.string	"A_VERTICAL NCURSES_BITS(1U,22)"
.LASF1330:
	.string	"KEY_SHOME 0607"
.LASF70:
	.string	"__UINT_FAST16_TYPE__ long unsigned int"
.LASF1453:
	.string	"_cur_column"
.LASF90:
	.string	"__LONG_WIDTH__ 64"
.LASF917:
	.string	"INTMAX_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF108:
	.string	"__UINT8_MAX__ 0xff"
.LASF1434:
	.string	"__off64_t"
.LASF630:
	.string	"_____fpos_t_defined 1"
.LASF947:
	.string	"NCURSES_COLOR_T short"
.LASF360:
	.string	"__DECIMAL_BID_FORMAT__ 1"
.LASF1373:
	.string	"BUTTON3_TRIPLE_CLICKED NCURSES_MOUSE_MASK(3, NCURSES_TRIPLE_CLICKED)"
.LASF538:
	.string	"__GLIBC_USE_IEC_60559_FUNCS_EXT 0"
.LASF140:
	.string	"__UINT_FAST8_MAX__ 0xff"
.LASF234:
	.string	"__FLT128_MANT_DIG__ 113"
.LASF1160:
	.string	"attr_on(a,o) wattr_on(stdscr,(a),(o))"
.LASF497:
	.string	"__restrict_arr __restrict"
.LASF1324:
	.string	"KEY_SELECT 0601"
.LASF1069:
	.string	"_ISPAD 0x10"
.LASF950:
	.string	"NCURSES_OPAQUE 0"
.LASF872:
	.string	"_STDINT_H 1"
.LASF285:
	.string	"__DEC32_MIN__ 1E-95DF"
.LASF1054:
	.string	"ACS_BBSS ACS_URCORNER"
.LASF667:
	.string	"_BITS_FLOATN_H "
.LASF224:
	.string	"__FLT64_DECIMAL_DIG__ 17"
.LASF1360:
	.string	"BUTTON1_PRESSED NCURSES_MOUSE_MASK(1, NCURSES_BUTTON_PRESSED)"
.LASF1066:
	.string	"_ENDLINE 0x02"
.LASF978:
	.string	"_VA_LIST "
.LASF44:
	.string	"__INTMAX_TYPE__ long int"
.LASF416:
	.string	"__USE_POSIX199506 1"
.LASF1174:
	.string	"echochar(c) wechochar(stdscr,(c))"
.LASF1311:
	.string	"KEY_REFERENCE 0564"
.LASF212:
	.string	"__FLT32_EPSILON__ 1.19209289550781250000000000000000000e-7F32"
.LASF131:
	.string	"__UINT64_C(c) c ## UL"
.LASF14:
	.string	"__ATOMIC_CONSUME 1"
.LASF1408:
	.string	"TRACE_BITS 0x0100"
.LASF525:
	.string	"__stub_revoke "
.LASF58:
	.string	"__INT_LEAST16_TYPE__ short int"
.LASF1356:
	.string	"NCURSES_DOUBLE_CLICKED 010L"
.LASF725:
	.string	"__WTERMSIG(status) ((status) & 0x7f)"
.LASF690:
	.string	"__f32x(x) x ##f32x"
.LASF1146:
	.string	"winchstr(w,s) winchnstr(w, s, -1)"
.LASF983:
	.string	"FALSE"
.LASF1446:
	.string	"_IO_backup_base"
.LASF418:
	.string	"__USE_XOPEN2K8 1"
.LASF600:
	.string	"__RLIM64_T_TYPE __UQUAD_TYPE"
.LASF315:
	.string	"__GCC_ATOMIC_WCHAR_T_LOCK_FREE 2"
.LASF1158:
	.string	"attr_get(ap,cp,o) wattr_get(stdscr,(ap),(cp),(o))"
.LASF1437:
	.string	"_IO_read_ptr"
.LASF59:
	.string	"__INT_LEAST32_TYPE__ int"
.LASF649:
	.string	"BUFSIZ 8192"
.LASF1151:
	.string	"COLOR_PAIR(n) (NCURSES_BITS((n), 0) & A_COLOR)"
.LASF1191:
	.string	"setscrreg(t,b) wsetscrreg(stdscr,(t),(b))"
.LASF329:
	.string	"__SIZEOF_PTRDIFF_T__ 8"
.LASF1150:
	.string	"waddchstr(win,str) waddchnstr(win,str,-1)"
.LASF421:
	.string	"__WORDSIZE 64"
.LASF742:
	.string	"WIFCONTINUED(status) __WIFCONTINUED (status)"
.LASF1095:
	.string	"A_REVERSE NCURSES_BITS(1U,10)"
.LASF853:
	.string	"_STRINGS_H 1"
.LASF1120:
	.string	"saveterm() def_prog_mode()"
.LASF979:
	.string	"_VA_LIST_T_H "
.LASF645:
	.string	"__ssize_t_defined "
.LASF264:
	.string	"__FLT32X_HAS_QUIET_NAN__ 1"
.LASF38:
	.string	"__GNUC_EXECUTION_CHARSET_NAME \"UTF-8\""
.LASF419:
	.string	"_ATFILE_SOURCE"
.LASF1215:
	.string	"mvwinstr(win,y,x,s) (wmove((win),(y),(x)) == ERR ? ERR : winstr((win),(s)))"
.LASF1460:
	.string	"_freeres_list"
.LASF633:
	.string	"____FILE_defined 1"
.LASF1363:
	.string	"BUTTON1_TRIPLE_CLICKED NCURSES_MOUSE_MASK(1, NCURSES_TRIPLE_CLICKED)"
.LASF171:
	.string	"__DBL_MIN_EXP__ (-1021)"
.LASF429:
	.string	"__GLIBC_USE_DEPRECATED_SCANF 0"
.LASF1410:
	.string	"TRACE_CCALLS 0x0400"
.LASF817:
	.string	"FD_ISSET(fd,fdsetp) __FD_ISSET (fd, fdsetp)"
.LASF1229:
	.string	"mvinchnstr(y,x,s,n) mvwinchnstr(stdscr,(y),(x),(s),(n))"
.LASF999:
	.string	"WA_DIM A_DIM"
.LASF539:
	.string	"__GLIBC_USE_IEC_60559_FUNCS_EXT_C2X"
.LASF685:
	.string	"__HAVE_DISTINCT_FLOAT128X __HAVE_FLOAT128X"
.LASF1184:
	.string	"insertln() winsdelln(stdscr,1)"
.LASF863:
	.string	"NCURSES_DLL_H_incl 1"
.LASF310:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 1"
.LASF114:
	.string	"__INT_LEAST8_WIDTH__ 8"
.LASF473:
	.string	"__attribute_alloc_size__(params) __attribute__ ((__alloc_size__ params))"
.LASF1235:
	.string	"mvinstr(y,x,s) mvwinstr(stdscr,(y),(x),(s))"
.LASF1083:
	.string	"NCURSES_SP_FUNCS"
.LASF410:
	.string	"_POSIX_SOURCE 1"
.LASF825:
	.string	"_BITS_PTHREADTYPES_ARCH_H 1"
.LASF848:
	.string	"alloca(size) __builtin_alloca (size)"
.LASF1341:
	.string	"KEY_SRIGHT 0622"
.LASF1102:
	.string	"A_HORIZONTAL NCURSES_BITS(1U,17)"
.LASF1533:
	.string	"model"
.LASF919:
	.string	"UINTMAX_MAX (__UINT64_C(18446744073709551615))"
.LASF1452:
	.string	"_old_offset"
.LASF986:
	.string	"bool _Bool"
.LASF1002:
	.string	"WA_INVIS A_INVIS"
.LASF248:
	.string	"__FLT128_HAS_QUIET_NAN__ 1"
.LASF500:
	.string	"__attribute_nonstring__ __attribute__ ((__nonstring__))"
.LASF616:
	.string	"__TIMER_T_TYPE void *"
.LASF1090:
	.string	"A_ATTRIBUTES NCURSES_BITS(~(1U - 1U),0)"
.LASF1320:
	.string	"KEY_SCOPY 0575"
.LASF1127:
	.string	"getbegx(win) (NCURSES_OK_ADDR(win) ? (win)->_begx : ERR)"
.LASF262:
	.string	"__FLT32X_HAS_DENORM__ 1"
.LASF785:
	.string	"htobe16(x) __bswap_16 (x)"
.LASF1104:
	.string	"A_LOW NCURSES_BITS(1U,19)"
.LASF216:
	.string	"__FLT32_HAS_QUIET_NAN__ 1"
.LASF658:
	.string	"FILENAME_MAX 4096"
.LASF431:
	.string	"__GNU_LIBRARY__ 6"
.LASF814:
	.string	"NFDBITS __NFDBITS"
.LASF1469:
	.string	"long long int"
.LASF606:
	.string	"__FSFILCNT64_T_TYPE __UQUAD_TYPE"
.LASF927:
	.string	"WINT_MIN (0u)"
.LASF1451:
	.string	"_flags2"
.LASF1214:
	.string	"mvwinsstr(win,y,x,s) (wmove((win),(y),(x)) == ERR ? ERR : winsstr((win),(s)))"
.LASF746:
	.string	"EXIT_FAILURE 1"
.LASF973:
	.string	"va_end(v) __builtin_va_end(v)"
.LASF1284:
	.string	"KEY_ENTER 0527"
.LASF1142:
	.string	"border(ls,rs,ts,bs,tl,tr,bl,br) wborder(stdscr, ls, rs, ts, bs, tl, tr, bl, br)"
.LASF302:
	.string	"__DEC128_SUBNORMAL_MIN__ 0.000000000000000000000000000000001E-6143DL"
.LASF210:
	.string	"__FLT32_NORM_MAX__ 3.40282346638528859811704183484516925e+38F32"
.LASF1048:
	.string	"ACS_GEQUAL NCURSES_ACS('z')"
.LASF639:
	.string	"__feof_unlocked_body(_fp) (((_fp)->_flags & _IO_EOF_SEEN) != 0)"
.LASF1422:
	.string	"POLL_INTERVAL_S 1"
.LASF96:
	.string	"__INTMAX_MAX__ 0x7fffffffffffffffL"
.LASF839:
	.string	"__PTHREAD_MUTEX_HAVE_PREV 1"
.LASF1315:
	.string	"KEY_RESUME 0570"
.LASF726:
	.string	"__WSTOPSIG(status) __WEXITSTATUS(status)"
.LASF1193:
	.string	"standout() wstandout(stdscr)"
.LASF1124:
	.string	"getattrs(win) NCURSES_CAST(int, NCURSES_OK_ADDR(win) ? (win)->_attrs : A_NORMAL)"
.LASF176:
	.string	"__DBL_MAX__ ((double)1.79769313486231570814527423731704357e+308L)"
.LASF343:
	.string	"__SSE__ 1"
.LASF183:
	.string	"__DBL_HAS_QUIET_NAN__ 1"
.LASF282:
	.string	"__DEC32_MANT_DIG__ 7"
.LASF390:
	.string	"__USE_ATFILE"
.LASF380:
	.string	"__USE_XOPEN_EXTENDED"
.LASF164:
	.string	"__FLT_DENORM_MIN__ 1.40129846432481707092372958328991613e-45F"
.LASF1498:
	.string	"user"
.LASF1316:
	.string	"KEY_SAVE 0571"
.LASF253:
	.string	"__FLT32X_MIN_10_EXP__ (-307)"
.LASF1397:
	.string	"_tracech_t2 _tracechtype2"
.LASF842:
	.string	"__PTHREAD_RWLOCK_ELISION_EXTRA 0, { 0, 0, 0, 0, 0, 0, 0 }"
.LASF356:
	.string	"__unix 1"
.LASF503:
	.string	"__LDOUBLE_REDIRECTS_TO_FLOAT128_ABI 0"
.LASF533:
	.string	"__GLIBC_USE_IEC_60559_BFP_EXT_C2X"
.LASF199:
	.string	"__LDBL_HAS_INFINITY__ 1"
.LASF737:
	.string	"WTERMSIG(status) __WTERMSIG (status)"
.LASF1209:
	.string	"mvwinchnstr(win,y,x,s,n) (wmove((win),(y),(x)) == ERR ? ERR : winchnstr((win),(s),(n)))"
.LASF1425:
	.string	"long unsigned int"
.LASF1399:
	.string	"TRACE_TIMES 0x0001"
.LASF914:
	.string	"INTPTR_MIN (-9223372036854775807L-1)"
.LASF395:
	.string	"__GLIBC_USE_ISOC2X"
.LASF536:
	.string	"__GLIBC_USE_IEC_60559_EXT 0"
.LASF921:
	.string	"PTRDIFF_MAX (9223372036854775807L)"
.LASF736:
	.string	"WEXITSTATUS(status) __WEXITSTATUS (status)"
.LASF161:
	.string	"__FLT_NORM_MAX__ 3.40282346638528859811704183484516925e+38F"
.LASF1319:
	.string	"KEY_SCOMMAND 0574"
.LASF608:
	.string	"__CLOCK_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF268:
	.string	"__FLT64X_MIN_EXP__ (-16381)"
.LASF459:
	.string	"__glibc_safe_or_unknown_len(__l,__s,__osz) (__glibc_unsigned_or_positive (__l) && __builtin_constant_p (__glibc_safe_len_cond ((__SIZE_TYPE__) (__l), __s, __osz)) && __glibc_safe_len_cond ((__SIZE_TYPE__) (__l), __s, __osz))"
.LASF1033:
	.string	"ACS_DIAMOND NCURSES_ACS('`')"
.LASF1166:
	.string	"bkgdset(ch) wbkgdset(stdscr,(ch))"
.LASF28:
	.string	"__SIZEOF_LONG_DOUBLE__ 16"
.LASF66:
	.string	"__INT_FAST16_TYPE__ long int"
.LASF851:
	.string	"_BITS_TYPES_LOCALE_T_H 1"
.LASF605:
	.string	"__FSFILCNT_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF1400:
	.string	"TRACE_TPUTS 0x0002"
.LASF230:
	.string	"__FLT64_HAS_DENORM__ 1"
.LASF240:
	.string	"__FLT128_DECIMAL_DIG__ 36"
.LASF165:
	.string	"__FLT_HAS_DENORM__ 1"
.LASF1008:
	.string	"WA_TOP A_TOP"
.LASF1005:
	.string	"WA_LEFT A_LEFT"
.LASF598:
	.string	"__PID_T_TYPE __S32_TYPE"
.LASF1074:
	.string	"GCC_PRINTFLIKE(fmt,var) __attribute__((format(printf,fmt,var)))"
.LASF1049:
	.string	"ACS_PI NCURSES_ACS('{')"
.LASF865:
	.string	"NCURSES_IMPEXP NCURSES_EXPORT_GENERAL_IMPORT"
.LASF1393:
	.string	"BUTTON_TRIPLE_CLICK(e,x) ((e) & NCURSES_MOUSE_MASK(x, 020))"
.LASF1522:
	.string	"power_uw"
.LASF1177:
	.string	"getstr(str) wgetstr(stdscr,(str))"
.LASF193:
	.string	"__LDBL_MAX__ 1.18973149535723176502126385303097021e+4932L"
.LASF1291:
	.string	"KEY_C3 0540"
.LASF26:
	.string	"__SIZEOF_FLOAT__ 4"
.LASF301:
	.string	"__DEC128_EPSILON__ 1E-33DL"
.LASF546:
	.string	"__SIZE_T__ "
.LASF1260:
	.string	"KEY_RESET 0531"
.LASF61:
	.string	"__UINT_LEAST8_TYPE__ unsigned char"
.LASF594:
	.string	"__NLINK_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF366:
	.string	"__STDC_ISO_10646__ 201706L"
.LASF188:
	.string	"__LDBL_MIN_10_EXP__ (-4931)"
.LASF1265:
	.string	"KEY_HOME 0406"
.LASF463:
	.string	"__warnattr(msg) __attribute__((__warning__ (msg)))"
.LASF449:
	.string	"__STRING(x) #x"
.LASF652:
	.string	"SEEK_CUR 1"
.LASF46:
	.string	"__CHAR16_TYPE__ short unsigned int"
.LASF1279:
	.string	"KEY_NPAGE 0522"
.LASF1426:
	.string	"unsigned int"
.LASF796:
	.string	"le64toh(x) __uint64_identity (x)"
.LASF1099:
	.string	"A_ALTCHARSET NCURSES_BITS(1U,14)"
.LASF1144:
	.string	"vline(ch,n) wvline(stdscr, ch, (n))"
.LASF476:
	.string	"__attribute_const__ __attribute__ ((__const__))"
.LASF679:
	.string	"__HAVE_FLOAT128X 0"
.LASF540:
	.string	"__GLIBC_USE_IEC_60559_FUNCS_EXT_C2X 0"
.LASF486:
	.string	"__returns_nonnull __attribute__ ((__returns_nonnull__))"
.LASF1232:
	.string	"mvinsch(y,x,c) mvwinsch(stdscr,(y),(x),(c))"
.LASF1478:
	.string	"strcmp"
.LASF162:
	.string	"__FLT_MIN__ 1.17549435082228750796873653722224568e-38F"
.LASF586:
	.string	"__SYSCALL_SLONG_TYPE __SLONGWORD_TYPE"
.LASF40:
	.string	"__SIZE_TYPE__ long unsigned int"
.LASF189:
	.string	"__LDBL_MAX_EXP__ 16384"
.LASF1169:
	.string	"clrtobot() wclrtobot(stdscr)"
.LASF1430:
	.string	"short int"
.LASF348:
	.string	"__MMX_WITH_SSE__ 1"
.LASF1276:
	.string	"KEY_EOL 0517"
.LASF6:
	.string	"__GNUC_MINOR__ 4"
.LASF2:
	.string	"__STDC_UTF_16__ 1"
.LASF1407:
	.string	"TRACE_IEVENT 0x0080"
.LASF1162:
	.string	"attroff(at) wattroff(stdscr,(at))"
.LASF944:
	.string	"NCURSES_INLINE"
.LASF20:
	.string	"_LP64 1"
.LASF1454:
	.string	"_vtable_offset"
.LASF294:
	.string	"__DEC64_EPSILON__ 1E-15DD"
.LASF582:
	.string	"__S64_TYPE long int"
.LASF547:
	.string	"_SIZE_T "
.LASF813:
	.string	"FD_SETSIZE __FD_SETSIZE"
.LASF994:
	.string	"WA_NORMAL A_NORMAL"
.LASF958:
	.string	"NCURSES_INTEROP_FUNCS 1"
.LASF1230:
	.string	"mvinchstr(y,x,s) mvwinchstr(stdscr,(y),(x),(s))"
.LASF1020:
	.string	"ACS_ULCORNER NCURSES_ACS('l')"
.LASF133:
	.string	"__INT_FAST8_WIDTH__ 8"
.LASF1406:
	.string	"TRACE_VIRTPUT 0x0040"
.LASF871:
	.string	"NCURSES_API "
.LASF970:
	.string	"_STDARG_H "
.LASF1286:
	.string	"KEY_LL 0533"
.LASF41:
	.string	"__PTRDIFF_TYPE__ long int"
.LASF1382:
	.string	"BUTTON5_DOUBLE_CLICKED NCURSES_MOUSE_MASK(5, NCURSES_DOUBLE_CLICKED)"
.LASF1416:
	.string	"unctrl"
.LASF124:
	.string	"__UINT_LEAST8_MAX__ 0xff"
.LASF740:
	.string	"WIFSIGNALED(status) __WIFSIGNALED (status)"
.LASF1295:
	.string	"KEY_CLOSE 0544"
.LASF407:
	.string	"__USE_ISOC95 1"
.LASF433:
	.string	"__GLIBC_MINOR__ 35"
.LASF259:
	.string	"__FLT32X_MIN__ 2.22507385850720138309023271733240406e-308F32x"
.LASF1179:
	.string	"inchnstr(s,n) winchnstr(stdscr,(s),(n))"
.LASF122:
	.string	"__INT64_C(c) c ## L"
.LASF1077:
	.string	"GCC_UNUSED "
.LASF529:
	.string	"__GLIBC_USE_LIB_EXT2"
.LASF7:
	.string	"__GNUC_PATCHLEVEL__ 0"
.LASF170:
	.string	"__DBL_DIG__ 15"
.LASF1251:
	.string	"is_syncok(win) (NCURSES_OK_ADDR(win) ? (win)->_sync : FALSE)"
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
