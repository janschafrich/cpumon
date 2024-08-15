	.file	"cpumonlib.c"
	.intel_syntax noprefix
# GNU C17 (Ubuntu 11.4.0-1ubuntu1~22.04) version 11.4.0 (x86_64-linux-gnu)
#	compiled by GNU C version 11.4.0, GMP version 6.2.1, MPFR version 4.1.0, MPC version 1.2.1, isl version isl-0.24-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -masm=intel -mtune=generic -march=x86-64 -g -g -ggdb3 -gdwarf-2 -O0 -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection
	.text
.Ltext0:
	.globl	core_count
	.bss
	.align 4
	.type	core_count, @object
	.size	core_count, 4
core_count:
	.zero	4
	.globl	charging_status_before
	.align 16
	.type	charging_status_before, @object
	.size	charging_status_before, 20
charging_status_before:
	.zero	20
	.globl	running_with_privileges
	.type	running_with_privileges, @object
	.size	running_with_privileges, 1
running_with_privileges:
	.zero	1
	.section	.rodata
.LC0:
	.string	"r"
.LC1:
	.string	"sudo modprobe msr"
.LC2:
	.string	"Error modprobe msr"
.LC3:
	.string	""
	.align 8
.LC4:
	.string	"Could not determine CPU core count from sysconf\n"
	.text
	.globl	init_environment
	.type	init_environment, @function
init_environment:
.LFB6:
	.file 1 "/home/jscha/dvp/cpumon/src/cpumonlib.c"
	.loc 1 36 1
	.cfi_startproc
	endbr64	
	push	rbp	#
.LCFI0:
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
.LCFI1:
	.cfi_def_cfa_register 6
	sub	rsp, 16	#,
# /home/jscha/dvp/cpumon/src/cpumonlib.c:38:     if ((fp = popen("sudo modprobe msr", "r")) == NULL)
	.loc 1 38 15
	lea	rax, .LC0[rip]	# tmp87,
	mov	rsi, rax	#, tmp87
	lea	rax, .LC1[rip]	# tmp88,
	mov	rdi, rax	#, tmp88
	call	popen@PLT	#
	mov	QWORD PTR -8[rbp], rax	# fp, tmp89
# /home/jscha/dvp/cpumon/src/cpumonlib.c:38:     if ((fp = popen("sudo modprobe msr", "r")) == NULL)
	.loc 1 38 8
	cmp	QWORD PTR -8[rbp], 0	# fp,
	jne	.L2	#,
# /home/jscha/dvp/cpumon/src/cpumonlib.c:40:         printf("Error modprobe msr\n");
	.loc 1 40 9
	lea	rax, .LC2[rip]	# tmp90,
	mov	rdi, rax	#, tmp90
	call	puts@PLT	#
.L2:
# /home/jscha/dvp/cpumon/src/cpumonlib.c:43:     setlocale(LC_NUMERIC, "");
	.loc 1 43 5
	lea	rax, .LC3[rip]	# tmp91,
	mov	rsi, rax	#, tmp91
	mov	edi, 1	#,
	call	setlocale@PLT	#
# /home/jscha/dvp/cpumon/src/cpumonlib.c:45:     core_count = sysconf(_SC_NPROCESSORS_ONLN);
	.loc 1 45 18
	mov	edi, 84	#,
	call	sysconf@PLT	#
# /home/jscha/dvp/cpumon/src/cpumonlib.c:45:     core_count = sysconf(_SC_NPROCESSORS_ONLN);
	.loc 1 45 16
	mov	DWORD PTR core_count[rip], eax	# core_count, _2
# /home/jscha/dvp/cpumon/src/cpumonlib.c:46:     if (core_count == -1)
	.loc 1 46 20
	mov	eax, DWORD PTR core_count[rip]	# core_count.0_3, core_count
# /home/jscha/dvp/cpumon/src/cpumonlib.c:46:     if (core_count == -1)
	.loc 1 46 8
	cmp	eax, -1	# core_count.0_3,
	jne	.L3	#,
# /home/jscha/dvp/cpumon/src/cpumonlib.c:48:         fprintf(stderr, "Could not determine CPU core count from sysconf\n");
	.loc 1 48 9
	mov	rax, QWORD PTR stderr[rip]	# stderr.1_4, stderr
	mov	rcx, rax	#, stderr.1_4
	mov	edx, 48	#,
	mov	esi, 1	#,
	lea	rax, .LC4[rip]	# tmp92,
	mov	rdi, rax	#, tmp92
	call	fwrite@PLT	#
.L3:
# /home/jscha/dvp/cpumon/src/cpumonlib.c:51:     running_with_privileges = FALSE;
	.loc 1 51 29
	mov	BYTE PTR running_with_privileges[rip], 0	# running_with_privileges,
# /home/jscha/dvp/cpumon/src/cpumonlib.c:52:     if (geteuid() == 0)
	.loc 1 52 9
	call	geteuid@PLT	#
# /home/jscha/dvp/cpumon/src/cpumonlib.c:52:     if (geteuid() == 0)
	.loc 1 52 8
	test	eax, eax	# _5
	jne	.L5	#,
# /home/jscha/dvp/cpumon/src/cpumonlib.c:54:         running_with_privileges = TRUE; 
	.loc 1 54 33
	mov	BYTE PTR running_with_privileges[rip], 1	# running_with_privileges,
.L5:
# /home/jscha/dvp/cpumon/src/cpumonlib.c:56: }
	.loc 1 56 1
	nop	
	leave	
.LCFI2:
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE6:
	.size	init_environment, .-init_environment
	.globl	init_sensor_power
	.type	init_sensor_power, @function
init_sensor_power:
.LFB7:
	.loc 1 59 1
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
	mov	DWORD PTR -20[rbp], edi	# cpu_designer, cpu_designer
	mov	DWORD PTR -24[rbp], esi	# core_count, core_count
# /home/jscha/dvp/cpumon/src/cpumonlib.c:62:     switch (cpu_designer)
	.loc 1 62 5
	cmp	DWORD PTR -20[rbp], 0	# cpu_designer,
	je	.L7	#,
	cmp	DWORD PTR -20[rbp], 1	# cpu_designer,
	je	.L8	#,
	jmp	.L12	#
.L7:
# /home/jscha/dvp/cpumon/src/cpumonlib.c:65:             my_power = malloc(sizeof(power)); 
	.loc 1 65 24
	mov	edi, 32	#,
	call	malloc@PLT	#
	mov	QWORD PTR -8[rbp], rax	# my_power, tmp87
# /home/jscha/dvp/cpumon/src/cpumonlib.c:66:             break;
	.loc 1 66 13
	jmp	.L10	#
.L8:
# /home/jscha/dvp/cpumon/src/cpumonlib.c:68:             my_power = malloc( sizeof(power) + core_count * sizeof(my_power->per_core[0]) );
	.loc 1 68 46
	mov	eax, DWORD PTR -24[rbp]	# tmp88, core_count
	cdqe
	add	rax, 8	# _2,
# /home/jscha/dvp/cpumon/src/cpumonlib.c:68:             my_power = malloc( sizeof(power) + core_count * sizeof(my_power->per_core[0]) );
	.loc 1 68 24
	sal	rax, 2	# _3,
	mov	rdi, rax	#, _3
	call	malloc@PLT	#
	mov	QWORD PTR -8[rbp], rax	# my_power, tmp89
# /home/jscha/dvp/cpumon/src/cpumonlib.c:69:             break;
	.loc 1 69 13
	jmp	.L10	#
.L12:
# /home/jscha/dvp/cpumon/src/cpumonlib.c:71:             my_power = malloc(sizeof(power)); 
	.loc 1 71 24
	mov	edi, 32	#,
	call	malloc@PLT	#
	mov	QWORD PTR -8[rbp], rax	# my_power, tmp90
# /home/jscha/dvp/cpumon/src/cpumonlib.c:72:             break;
	.loc 1 72 13
	nop	
.L10:
# /home/jscha/dvp/cpumon/src/cpumonlib.c:75:     get_msr_core_units(my_power, cpu_designer);
	.loc 1 75 5
	mov	edx, DWORD PTR -20[rbp]	# tmp91, cpu_designer
	mov	rax, QWORD PTR -8[rbp]	# tmp92, my_power
	mov	esi, edx	#, tmp91
	mov	rdi, rax	#, tmp92
	call	get_msr_core_units@PLT	#
# /home/jscha/dvp/cpumon/src/cpumonlib.c:77:     return my_power;
	.loc 1 77 12
	mov	rax, QWORD PTR -8[rbp]	# _16, my_power
# /home/jscha/dvp/cpumon/src/cpumonlib.c:78: }
	.loc 1 78 1
	leave	
.LCFI5:
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE7:
	.size	init_sensor_power, .-init_sensor_power
	.globl	init_sensor
	.type	init_sensor, @function
init_sensor:
.LFB8:
	.loc 1 81 1
	.cfi_startproc
	endbr64	
	push	rbp	#
.LCFI6:
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
.LCFI7:
	.cfi_def_cfa_register 6
	sub	rsp, 64	#,
	mov	DWORD PTR -52[rbp], edi	# core_count, core_count
# /home/jscha/dvp/cpumon/src/cpumonlib.c:81: {
	.loc 1 81 1
	mov	rax, QWORD PTR fs:40	# tmp93, MEM[(<address-space-1> long unsigned int *)40B]
	mov	QWORD PTR -8[rbp], rax	# D.6425, tmp93
	xor	eax, eax	# tmp93
# /home/jscha/dvp/cpumon/src/cpumonlib.c:82:     sensor *my_sensor = malloc( sizeof(sensor) + core_count * sizeof(my_sensor->per_core[0]) );
	.loc 1 82 48
	mov	eax, DWORD PTR -52[rbp]	# tmp87, core_count
	cdqe
	add	rax, 5	# _2,
# /home/jscha/dvp/cpumon/src/cpumonlib.c:82:     sensor *my_sensor = malloc( sizeof(sensor) + core_count * sizeof(my_sensor->per_core[0]) );
	.loc 1 82 25
	sal	rax, 2	# _3,
	mov	rdi, rax	#, _3
	call	malloc@PLT	#
	mov	QWORD PTR -40[rbp], rax	# my_sensor, tmp88
# /home/jscha/dvp/cpumon/src/cpumonlib.c:83:     *my_sensor = (sensor) {.min = 1000, .max = 0}; 
	.loc 1 83 16
	mov	rax, QWORD PTR -40[rbp]	# tmp89, my_sensor
	mov	QWORD PTR [rax], 0	# *my_sensor_7,
	mov	QWORD PTR 8[rax], 0	# *my_sensor_7,
	mov	DWORD PTR 16[rax], 0	# *my_sensor_7,
	mov	rax, QWORD PTR -40[rbp]	# tmp90, my_sensor
	movss	xmm0, DWORD PTR .LC5[rip]	# tmp91,
	movss	DWORD PTR 12[rax], xmm0	# my_sensor_7->min, tmp91
# /home/jscha/dvp/cpumon/src/cpumonlib.c:85:     return my_sensor;
	.loc 1 85 12
	mov	rax, QWORD PTR -40[rbp]	# _10, my_sensor
# /home/jscha/dvp/cpumon/src/cpumonlib.c:86: }
	.loc 1 86 1
	mov	rdx, QWORD PTR -8[rbp]	# tmp94, D.6425
	sub	rdx, QWORD PTR fs:40	# tmp94, MEM[(<address-space-1> long unsigned int *)40B]
	je	.L15	#,
	call	__stack_chk_fail@PLT	#
.L15:
	leave	
.LCFI8:
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE8:
	.size	init_sensor, .-init_sensor
	.globl	init_sensor_battery
	.type	init_sensor_battery, @function
init_sensor_battery:
.LFB9:
	.loc 1 89 1
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
# /home/jscha/dvp/cpumon/src/cpumonlib.c:89: {
	.loc 1 89 1
	mov	rax, QWORD PTR fs:40	# tmp89, MEM[(<address-space-1> long unsigned int *)40B]
	mov	QWORD PTR -8[rbp], rax	# D.6427, tmp89
	xor	eax, eax	# tmp89
# /home/jscha/dvp/cpumon/src/cpumonlib.c:90:     battery_s *battery = malloc(sizeof(battery));
	.loc 1 90 26
	mov	edi, 8	#,
	call	malloc@PLT	#
	mov	QWORD PTR -56[rbp], rax	# battery, tmp84
# /home/jscha/dvp/cpumon/src/cpumonlib.c:91:     *battery = (battery_s) {.min = 1000, .max = 0};
	.loc 1 91 14
	mov	rax, QWORD PTR -56[rbp]	# tmp85, battery
	mov	QWORD PTR [rax], 0	# *battery_3,
	mov	QWORD PTR 8[rax], 0	# *battery_3,
	mov	QWORD PTR 16[rax], 0	# *battery_3,
	mov	QWORD PTR 24[rax], 0	# *battery_3,
	mov	QWORD PTR 32[rax], 0	# *battery_3,
	mov	rax, QWORD PTR -56[rbp]	# tmp86, battery
	movss	xmm0, DWORD PTR .LC5[rip]	# tmp87,
	movss	DWORD PTR 12[rax], xmm0	# battery_3->min, tmp87
# /home/jscha/dvp/cpumon/src/cpumonlib.c:93:     return battery;
	.loc 1 93 12
	mov	rax, QWORD PTR -56[rbp]	# _6, battery
# /home/jscha/dvp/cpumon/src/cpumonlib.c:94: }
	.loc 1 94 1
	mov	rdx, QWORD PTR -8[rbp]	# tmp90, D.6427
	sub	rdx, QWORD PTR fs:40	# tmp90, MEM[(<address-space-1> long unsigned int *)40B]
	je	.L18	#,
	call	__stack_chk_fail@PLT	#
.L18:
	leave	
.LCFI11:
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE9:
	.size	init_sensor_battery, .-init_sensor_battery
	.globl	update_sensor_data
	.type	update_sensor_data, @function
update_sensor_data:
.LFB10:
	.loc 1 99 1
	.cfi_startproc
	endbr64	
	push	rbp	#
.LCFI12:
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
.LCFI13:
	.cfi_def_cfa_register 6
	sub	rsp, 48	#,
	mov	QWORD PTR -8[rbp], rdi	# freq, freq
	mov	QWORD PTR -16[rbp], rsi	# load, load
	mov	QWORD PTR -24[rbp], rdx	# temperature, temperature
	mov	QWORD PTR -32[rbp], rcx	# voltage, voltage
	mov	QWORD PTR -40[rbp], r8	# power_per_domain, power_per_domain
	mov	QWORD PTR -48[rbp], r9	# my_power, my_power
# /home/jscha/dvp/cpumon/src/cpumonlib.c:101:     sysfs_freq_ghz(freq->per_core, &freq->cpu_avg, core_count);
	.loc 1 101 5
	mov	edx, DWORD PTR core_count[rip]	# core_count.2_1, core_count
	mov	rax, QWORD PTR -8[rbp]	# _2, freq
# /home/jscha/dvp/cpumon/src/cpumonlib.c:101:     sysfs_freq_ghz(freq->per_core, &freq->cpu_avg, core_count);
	.loc 1 101 24
	mov	rcx, QWORD PTR -8[rbp]	# tmp118, freq
	add	rcx, 20	# _3,
# /home/jscha/dvp/cpumon/src/cpumonlib.c:101:     sysfs_freq_ghz(freq->per_core, &freq->cpu_avg, core_count);
	.loc 1 101 5
	mov	rsi, rax	#, _2
	mov	rdi, rcx	#, _3
	call	sysfs_freq_ghz@PLT	#
# /home/jscha/dvp/cpumon/src/cpumonlib.c:102:     freq->min = get_min_value(freq->min, freq->per_core, core_count);
	.loc 1 102 17
	mov	edx, DWORD PTR core_count[rip]	# core_count.3_4, core_count
# /home/jscha/dvp/cpumon/src/cpumonlib.c:102:     freq->min = get_min_value(freq->min, freq->per_core, core_count);
	.loc 1 102 46
	mov	rax, QWORD PTR -8[rbp]	# tmp119, freq
	lea	rcx, 20[rax]	# _5,
# /home/jscha/dvp/cpumon/src/cpumonlib.c:102:     freq->min = get_min_value(freq->min, freq->per_core, core_count);
	.loc 1 102 17
	mov	rax, QWORD PTR -8[rbp]	# tmp120, freq
	mov	eax, DWORD PTR 12[rax]	# _6, freq_39(D)->min
	mov	esi, edx	#, core_count.3_4
	mov	rdi, rcx	#, _5
	movd	xmm0, eax	#, _6
	call	get_min_value@PLT	#
	movd	eax, xmm0	# _7,
# /home/jscha/dvp/cpumon/src/cpumonlib.c:102:     freq->min = get_min_value(freq->min, freq->per_core, core_count);
	.loc 1 102 15
	mov	rdx, QWORD PTR -8[rbp]	# tmp121, freq
	mov	DWORD PTR 12[rdx], eax	# freq_39(D)->min, _7
# /home/jscha/dvp/cpumon/src/cpumonlib.c:103:     freq->max = get_max_value(freq->max, freq->per_core, core_count);
	.loc 1 103 17
	mov	edx, DWORD PTR core_count[rip]	# core_count.4_8, core_count
# /home/jscha/dvp/cpumon/src/cpumonlib.c:103:     freq->max = get_max_value(freq->max, freq->per_core, core_count);
	.loc 1 103 46
	mov	rax, QWORD PTR -8[rbp]	# tmp122, freq
	lea	rcx, 20[rax]	# _9,
# /home/jscha/dvp/cpumon/src/cpumonlib.c:103:     freq->max = get_max_value(freq->max, freq->per_core, core_count);
	.loc 1 103 17
	mov	rax, QWORD PTR -8[rbp]	# tmp123, freq
	mov	eax, DWORD PTR 16[rax]	# _10, freq_39(D)->max
	mov	esi, edx	#, core_count.4_8
	mov	rdi, rcx	#, _9
	movd	xmm0, eax	#, _10
	call	get_max_value@PLT	#
	movd	eax, xmm0	# _11,
# /home/jscha/dvp/cpumon/src/cpumonlib.c:103:     freq->max = get_max_value(freq->max, freq->per_core, core_count);
	.loc 1 103 15
	mov	rdx, QWORD PTR -8[rbp]	# tmp124, freq
	mov	DWORD PTR 16[rdx], eax	# freq_39(D)->max, _11
# /home/jscha/dvp/cpumon/src/cpumonlib.c:104:     freq->runtime_avg = runtime_avg(poll_cycle_counter, &freq->cumulative, &freq->cpu_avg);
	.loc 1 104 25
	mov	rdx, QWORD PTR -8[rbp]	# _12, freq
	mov	rax, QWORD PTR -8[rbp]	# tmp125, freq
	lea	rcx, 8[rax]	# _13,
	mov	rax, QWORD PTR poll_cycle_counter[rip]	# poll_cycle_counter.5_14, poll_cycle_counter
	mov	rsi, rcx	#, _13
	mov	rdi, rax	#, poll_cycle_counter.5_14
	call	runtime_avg@PLT	#
	movd	eax, xmm0	# _15,
# /home/jscha/dvp/cpumon/src/cpumonlib.c:104:     freq->runtime_avg = runtime_avg(poll_cycle_counter, &freq->cumulative, &freq->cpu_avg);
	.loc 1 104 23
	mov	rdx, QWORD PTR -8[rbp]	# tmp126, freq
	mov	DWORD PTR 4[rdx], eax	# freq_39(D)->runtime_avg, _15
# /home/jscha/dvp/cpumon/src/cpumonlib.c:106:     freq_his[period_counter] = freq->cpu_avg;
	.loc 1 106 13
	mov	rdx, QWORD PTR period_counter[rip]	# period_counter.6_16, period_counter
# /home/jscha/dvp/cpumon/src/cpumonlib.c:106:     freq_his[period_counter] = freq->cpu_avg;
	.loc 1 106 36
	mov	rax, QWORD PTR -8[rbp]	# tmp127, freq
	movss	xmm0, DWORD PTR [rax]	# _17, freq_39(D)->cpu_avg
# /home/jscha/dvp/cpumon/src/cpumonlib.c:106:     freq_his[period_counter] = freq->cpu_avg;
	.loc 1 106 30
	sal	rdx, 2	# tmp128,
	lea	rax, freq_his[rip]	# tmp129,
	movss	DWORD PTR [rdx+rax], xmm0	# freq_his[period_counter.6_16], _17
# /home/jscha/dvp/cpumon/src/cpumonlib.c:108:     get_sysfs_power_battery_w(&battery->power_now);
	.loc 1 108 5
	mov	rax, QWORD PTR 16[rbp]	# _18, battery
	mov	rdi, rax	#, _18
	call	get_sysfs_power_battery_w@PLT	#
# /home/jscha/dvp/cpumon/src/cpumonlib.c:109:     get_battery_status(battery->status);
	.loc 1 109 31
	mov	rax, QWORD PTR 16[rbp]	# tmp130, battery
	add	rax, 20	# _19,
# /home/jscha/dvp/cpumon/src/cpumonlib.c:109:     get_battery_status(battery->status);
	.loc 1 109 5
	mov	rdi, rax	#, _19
	call	get_battery_status@PLT	#
# /home/jscha/dvp/cpumon/src/cpumonlib.c:110:     reset_if_status_change(&battery->power_cumulative, battery->status, charging_status_before);
	.loc 1 110 63
	mov	rax, QWORD PTR 16[rbp]	# tmp131, battery
	lea	rcx, 20[rax]	# _20,
# /home/jscha/dvp/cpumon/src/cpumonlib.c:110:     reset_if_status_change(&battery->power_cumulative, battery->status, charging_status_before);
	.loc 1 110 5
	mov	rax, QWORD PTR 16[rbp]	# tmp132, battery
	add	rax, 4	# _21,
	lea	rdx, charging_status_before[rip]	# tmp133,
	mov	rsi, rcx	#, _20
	mov	rdi, rax	#, _21
	call	reset_if_status_change@PLT	#
# /home/jscha/dvp/cpumon/src/cpumonlib.c:111:     battery->power_runtime_avg = runtime_avg(poll_cycle_counter, &battery->power_cumulative, &battery->power_now);
	.loc 1 111 34
	mov	rdx, QWORD PTR 16[rbp]	# _22, battery
	mov	rax, QWORD PTR 16[rbp]	# tmp134, battery
	lea	rcx, 4[rax]	# _23,
	mov	rax, QWORD PTR poll_cycle_counter[rip]	# poll_cycle_counter.7_24, poll_cycle_counter
	mov	rsi, rcx	#, _23
	mov	rdi, rax	#, poll_cycle_counter.7_24
	call	runtime_avg@PLT	#
	movd	eax, xmm0	# _25,
# /home/jscha/dvp/cpumon/src/cpumonlib.c:111:     battery->power_runtime_avg = runtime_avg(poll_cycle_counter, &battery->power_cumulative, &battery->power_now);
	.loc 1 111 32
	mov	rdx, QWORD PTR 16[rbp]	# tmp135, battery
	mov	DWORD PTR 8[rdx], eax	# battery_48(D)->power_runtime_avg, _25
# /home/jscha/dvp/cpumon/src/cpumonlib.c:112:     battery->min = get_min_value(battery->min, &battery->power_now, 1);
	.loc 1 112 20
	mov	rdx, QWORD PTR 16[rbp]	# _26, battery
	mov	rax, QWORD PTR 16[rbp]	# tmp136, battery
	mov	eax, DWORD PTR 12[rax]	# _27, battery_48(D)->min
	mov	esi, 1	#,
	mov	rdi, rdx	#, _26
	movd	xmm0, eax	#, _27
	call	get_min_value@PLT	#
	movd	eax, xmm0	# _28,
# /home/jscha/dvp/cpumon/src/cpumonlib.c:112:     battery->min = get_min_value(battery->min, &battery->power_now, 1);
	.loc 1 112 18
	mov	rdx, QWORD PTR 16[rbp]	# tmp137, battery
	mov	DWORD PTR 12[rdx], eax	# battery_48(D)->min, _28
# /home/jscha/dvp/cpumon/src/cpumonlib.c:113:     battery->max = get_max_value(battery->max, &battery->power_now, 1);
	.loc 1 113 20
	mov	rdx, QWORD PTR 16[rbp]	# _29, battery
	mov	rax, QWORD PTR 16[rbp]	# tmp138, battery
	mov	eax, DWORD PTR 16[rax]	# _30, battery_48(D)->max
	mov	esi, 1	#,
	mov	rdi, rdx	#, _29
	movd	xmm0, eax	#, _30
	call	get_max_value@PLT	#
	movd	eax, xmm0	# _31,
# /home/jscha/dvp/cpumon/src/cpumonlib.c:113:     battery->max = get_max_value(battery->max, &battery->power_now, 1);
	.loc 1 113 18
	mov	rdx, QWORD PTR 16[rbp]	# tmp139, battery
	mov	DWORD PTR 16[rdx], eax	# battery_48(D)->max, _31
# /home/jscha/dvp/cpumon/src/cpumonlib.c:115:     if (running_with_privileges == TRUE)
	.loc 1 115 33
	movzx	eax, BYTE PTR running_with_privileges[rip]	# running_with_privileges.8_32, running_with_privileges
# /home/jscha/dvp/cpumon/src/cpumonlib.c:115:     if (running_with_privileges == TRUE)
	.loc 1 115 8
	test	al, al	# running_with_privileges.8_32
	je	.L21	#,
# /home/jscha/dvp/cpumon/src/cpumonlib.c:136:         get_amd_pkg_power_w(my_power);
	.loc 1 136 9
	mov	rax, QWORD PTR -48[rbp]	# tmp140, my_power
	mov	rdi, rax	#, tmp140
	call	get_amd_pkg_power_w@PLT	#
# /home/jscha/dvp/cpumon/src/cpumonlib.c:138:         power_his[period_counter] = *power_per_domain;
	.loc 1 138 18
	mov	rdx, QWORD PTR period_counter[rip]	# period_counter.9_33, period_counter
# /home/jscha/dvp/cpumon/src/cpumonlib.c:138:         power_his[period_counter] = *power_per_domain;
	.loc 1 138 37
	mov	rax, QWORD PTR -40[rbp]	# tmp141, power_per_domain
	movss	xmm0, DWORD PTR [rax]	# _34, *power_per_domain_60(D)
# /home/jscha/dvp/cpumon/src/cpumonlib.c:138:         power_his[period_counter] = *power_per_domain;
	.loc 1 138 35
	sal	rdx, 2	# tmp142,
	lea	rax, power_his[rip]	# tmp143,
	movss	DWORD PTR [rdx+rax], xmm0	# power_his[period_counter.9_33], _34
# /home/jscha/dvp/cpumon/src/cpumonlib.c:139:         if (period_counter == 1)
	.loc 1 139 28
	mov	rax, QWORD PTR period_counter[rip]	# period_counter.10_35, period_counter
# /home/jscha/dvp/cpumon/src/cpumonlib.c:139:         if (period_counter == 1)
	.loc 1 139 12
	cmp	rax, 1	# period_counter.10_35,
	jne	.L21	#,
# /home/jscha/dvp/cpumon/src/cpumonlib.c:141:             power_his[0] = *power_per_domain;      // over write the first (wrong) power calculation, so that it doesnt affect the avg as much
	.loc 1 141 28
	mov	rax, QWORD PTR -40[rbp]	# tmp144, power_per_domain
	movss	xmm0, DWORD PTR [rax]	# _36, *power_per_domain_60(D)
# /home/jscha/dvp/cpumon/src/cpumonlib.c:141:             power_his[0] = *power_per_domain;      // over write the first (wrong) power calculation, so that it doesnt affect the avg as much
	.loc 1 141 26
	movss	DWORD PTR power_his[rip], xmm0	# power_his[0], _36
.L21:
# /home/jscha/dvp/cpumon/src/cpumonlib.c:148: }
	.loc 1 148 1
	nop	
	leave	
.LCFI14:
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE10:
	.size	update_sensor_data, .-update_sensor_data
	.section	.rodata
.LC6:
	.string	"ectool pwmgetduty 0"
	.align 8
.LC7:
	.string	"Error accessing the ectool. Error opening pipe\n"
.LC8:
	.string	"%*s%*s%*s%d"
.LC9:
	.string	"Fan speed %d %% "
.LC10:
	.string	"ectool pwmgetfanrpm"
.LC11:
	.string	"%*s%*d%*s%d"
.LC12:
	.string	"(%d RPM)\n"
	.text
	.globl	print_fanspeed
	.type	print_fanspeed, @function
print_fanspeed:
.LFB11:
	.loc 1 152 25
	.cfi_startproc
	endbr64	
	push	rbp	#
.LCFI15:
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
.LCFI16:
	.cfi_def_cfa_register 6
	sub	rsp, 96	#,
# /home/jscha/dvp/cpumon/src/cpumonlib.c:152: int print_fanspeed(void){  // based on this example: https://stackoverflow.com/questions/43116/how-can-i-run-an-external-program-from-c-and-parse-its-output
	.loc 1 152 25
	mov	rax, QWORD PTR fs:40	# tmp118, MEM[(<address-space-1> long unsigned int *)40B]
	mov	QWORD PTR -8[rbp], rax	# D.6428, tmp118
	xor	eax, eax	# tmp118
# /home/jscha/dvp/cpumon/src/cpumonlib.c:156:     int duty = 0;
	.loc 1 156 9
	mov	DWORD PTR -96[rbp], 0	# duty,
# /home/jscha/dvp/cpumon/src/cpumonlib.c:157:     if ((fp = popen("ectool pwmgetduty 0", "r")) == NULL) {
	.loc 1 157 15
	lea	rax, .LC0[rip]	# tmp92,
	mov	rsi, rax	#, tmp92
	lea	rax, .LC6[rip]	# tmp93,
	mov	rdi, rax	#, tmp93
	call	popen@PLT	#
	mov	QWORD PTR -88[rbp], rax	# fp, tmp94
# /home/jscha/dvp/cpumon/src/cpumonlib.c:157:     if ((fp = popen("ectool pwmgetduty 0", "r")) == NULL) {
	.loc 1 157 8
	cmp	QWORD PTR -88[rbp], 0	# fp,
	jne	.L25	#,
# /home/jscha/dvp/cpumon/src/cpumonlib.c:158:         printw("Error accessing the ectool. Error opening pipe\n");
	.loc 1 158 9
	lea	rax, .LC7[rip]	# tmp95,
	mov	rdi, rax	#, tmp95
	mov	eax, 0	#,
	call	printw@PLT	#
# /home/jscha/dvp/cpumon/src/cpumonlib.c:159:         return -1;
	.loc 1 159 16
	mov	eax, -1	# _9,
	jmp	.L32	#
.L26:
# /home/jscha/dvp/cpumon/src/cpumonlib.c:162:         sscanf(buf, "%*s%*s%*s%d", &duty);
	.loc 1 162 9
	lea	rdx, -96[rbp]	# tmp96,
	lea	rax, -80[rbp]	# tmp97,
	lea	rcx, .LC8[rip]	# tmp98,
	mov	rsi, rcx	#, tmp98
	mov	rdi, rax	#, tmp97
	mov	eax, 0	#,
	call	__isoc99_sscanf@PLT	#
# /home/jscha/dvp/cpumon/src/cpumonlib.c:163:         printw("Fan speed %d %% ", (100 * duty)/ 65536 );  // print response to console
	.loc 1 163 41
	mov	eax, DWORD PTR -96[rbp]	# duty.11_1, duty
	imul	eax, eax, 100	# _2, duty.11_1,
# /home/jscha/dvp/cpumon/src/cpumonlib.c:163:         printw("Fan speed %d %% ", (100 * duty)/ 65536 );  // print response to console
	.loc 1 163 9
	lea	edx, 65535[rax]	# tmp100,
	test	eax, eax	# tmp99
	cmovs	eax, edx	# tmp100,, tmp99
	sar	eax, 16	# tmp101,
	mov	esi, eax	#, _3
	lea	rax, .LC9[rip]	# tmp102,
	mov	rdi, rax	#, tmp102
	mov	eax, 0	#,
	call	printw@PLT	#
.L25:
# /home/jscha/dvp/cpumon/src/cpumonlib.c:161:     while (fgets(buf, BUFSIZE, fp) != NULL) {
	.loc 1 161 12
	mov	rdx, QWORD PTR -88[rbp]	# tmp103, fp
	lea	rax, -80[rbp]	# tmp104,
	mov	esi, 64	#,
	mov	rdi, rax	#, tmp104
	call	fgets@PLT	#
# /home/jscha/dvp/cpumon/src/cpumonlib.c:161:     while (fgets(buf, BUFSIZE, fp) != NULL) {
	.loc 1 161 31
	test	rax, rax	# _4
	jne	.L26	#,
# /home/jscha/dvp/cpumon/src/cpumonlib.c:165:     if (pclose(fp)) {   // error
	.loc 1 165 9
	mov	rax, QWORD PTR -88[rbp]	# tmp105, fp
	mov	rdi, rax	#, tmp105
	call	pclose@PLT	#
# /home/jscha/dvp/cpumon/src/cpumonlib.c:165:     if (pclose(fp)) {   // error
	.loc 1 165 8
	test	eax, eax	# _5
	je	.L27	#,
# /home/jscha/dvp/cpumon/src/cpumonlib.c:166:         return -1;
	.loc 1 166 16
	mov	eax, -1	# _9,
	jmp	.L32	#
.L27:
# /home/jscha/dvp/cpumon/src/cpumonlib.c:169:     int rpm = 0;
	.loc 1 169 9
	mov	DWORD PTR -92[rbp], 0	# rpm,
# /home/jscha/dvp/cpumon/src/cpumonlib.c:170:     if ((fp = popen("ectool pwmgetfanrpm", "r")) == NULL) {
	.loc 1 170 15
	lea	rax, .LC0[rip]	# tmp106,
	mov	rsi, rax	#, tmp106
	lea	rax, .LC10[rip]	# tmp107,
	mov	rdi, rax	#, tmp107
	call	popen@PLT	#
	mov	QWORD PTR -88[rbp], rax	# fp, tmp108
# /home/jscha/dvp/cpumon/src/cpumonlib.c:170:     if ((fp = popen("ectool pwmgetfanrpm", "r")) == NULL) {
	.loc 1 170 8
	cmp	QWORD PTR -88[rbp], 0	# fp,
	jne	.L29	#,
# /home/jscha/dvp/cpumon/src/cpumonlib.c:171:         printw("Error accessing the ectool. Error opening pipe\n");
	.loc 1 171 9
	lea	rax, .LC7[rip]	# tmp109,
	mov	rdi, rax	#, tmp109
	mov	eax, 0	#,
	call	printw@PLT	#
# /home/jscha/dvp/cpumon/src/cpumonlib.c:172:         return -1;
	.loc 1 172 16
	mov	eax, -1	# _9,
	jmp	.L32	#
.L30:
# /home/jscha/dvp/cpumon/src/cpumonlib.c:175:         sscanf(buf, "%*s%*d%*s%d", &rpm);
	.loc 1 175 9
	lea	rdx, -92[rbp]	# tmp110,
	lea	rax, -80[rbp]	# tmp111,
	lea	rcx, .LC11[rip]	# tmp112,
	mov	rsi, rcx	#, tmp112
	mov	rdi, rax	#, tmp111
	mov	eax, 0	#,
	call	__isoc99_sscanf@PLT	#
# /home/jscha/dvp/cpumon/src/cpumonlib.c:176:         printw("(%d RPM)\n", rpm);  // print response to console
	.loc 1 176 9
	mov	eax, DWORD PTR -92[rbp]	# rpm.12_6, rpm
	mov	esi, eax	#, rpm.12_6
	lea	rax, .LC12[rip]	# tmp113,
	mov	rdi, rax	#, tmp113
	mov	eax, 0	#,
	call	printw@PLT	#
.L29:
# /home/jscha/dvp/cpumon/src/cpumonlib.c:174:     while (fgets(buf, BUFSIZE, fp) != NULL) {
	.loc 1 174 12
	mov	rdx, QWORD PTR -88[rbp]	# tmp114, fp
	lea	rax, -80[rbp]	# tmp115,
	mov	esi, 64	#,
	mov	rdi, rax	#, tmp115
	call	fgets@PLT	#
# /home/jscha/dvp/cpumon/src/cpumonlib.c:174:     while (fgets(buf, BUFSIZE, fp) != NULL) {
	.loc 1 174 31
	test	rax, rax	# _7
	jne	.L30	#,
# /home/jscha/dvp/cpumon/src/cpumonlib.c:178:     if (pclose(fp)) {
	.loc 1 178 9
	mov	rax, QWORD PTR -88[rbp]	# tmp116, fp
	mov	rdi, rax	#, tmp116
	call	pclose@PLT	#
# /home/jscha/dvp/cpumon/src/cpumonlib.c:178:     if (pclose(fp)) {
	.loc 1 178 8
	test	eax, eax	# _8
	je	.L31	#,
# /home/jscha/dvp/cpumon/src/cpumonlib.c:179:         return -1;
	.loc 1 179 16
	mov	eax, -1	# _9,
	jmp	.L32	#
.L31:
# /home/jscha/dvp/cpumon/src/cpumonlib.c:182:     return 0;
	.loc 1 182 12
	mov	eax, 0	# _9,
.L32:
# /home/jscha/dvp/cpumon/src/cpumonlib.c:183: }
	.loc 1 183 1 discriminator 1
	mov	rdx, QWORD PTR -8[rbp]	# tmp119, D.6428
	sub	rdx, QWORD PTR fs:40	# tmp119, MEM[(<address-space-1> long unsigned int *)40B]
	je	.L33	#,
# /home/jscha/dvp/cpumon/src/cpumonlib.c:183: }
	.loc 1 183 1 is_stmt 0
	call	__stack_chk_fail@PLT	#
.L33:
	leave	
.LCFI17:
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE11:
	.size	print_fanspeed, .-print_fanspeed
	.section	.rodata
	.align 4
.LC5:
	.long	1148846080
	.text
.Letext0:
	.file 2 "/usr/lib/gcc/x86_64-linux-gnu/11/include/stddef.h"
	.file 3 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 4 "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h"
	.file 5 "/usr/include/x86_64-linux-gnu/bits/types/FILE.h"
	.file 6 "/home/jscha/dvp/cpumon/src/../include/cpumonlib.h"
	.file 7 "/usr/include/x86_64-linux-gnu/bits/confname.h"
	.file 8 "/usr/include/stdio.h"
	.file 9 "/usr/include/curses.h"
	.file 10 "/home/jscha/dvp/cpumon/src/../include/machine_specific_registers.h"
	.file 11 "/home/jscha/dvp/cpumon/src/../include/sysfs.h"
	.file 12 "/home/jscha/dvp/cpumon/src/../include/utils.h"
	.file 13 "/usr/include/stdlib.h"
	.file 14 "/usr/include/unistd.h"
	.file 15 "/usr/include/locale.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xeb4
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF2613
	.byte	0xc
	.long	.LASF2614
	.long	.LASF2615
	.quad	.Ltext0
	.quad	.Letext0
	.long	.Ldebug_line0
	.long	.Ldebug_macro0
	.uleb128 0x2
	.long	.LASF2292
	.byte	0x2
	.byte	0xd1
	.byte	0x1b
	.long	0x3d
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF2285
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF2286
	.uleb128 0x4
	.byte	0x8
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF2287
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF2288
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF2289
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF2290
	.uleb128 0x5
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF2291
	.uleb128 0x2
	.long	.LASF2293
	.byte	0x3
	.byte	0x92
	.byte	0x16
	.long	0x44
	.uleb128 0x2
	.long	.LASF2294
	.byte	0x3
	.byte	0x98
	.byte	0x12
	.long	0x70
	.uleb128 0x2
	.long	.LASF2295
	.byte	0x3
	.byte	0x99
	.byte	0x12
	.long	0x70
	.uleb128 0x6
	.byte	0x8
	.long	0xa1
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF2296
	.uleb128 0x7
	.long	0xa1
	.uleb128 0x8
	.long	.LASF2552
	.byte	0xd8
	.byte	0x4
	.byte	0x31
	.byte	0x8
	.long	0x27a
	.uleb128 0x9
	.long	.LASF2297
	.byte	0x4
	.byte	0x33
	.byte	0x7
	.long	0x69
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x9
	.long	.LASF2298
	.byte	0x4
	.byte	0x36
	.byte	0x9
	.long	0x9b
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x9
	.long	.LASF2299
	.byte	0x4
	.byte	0x37
	.byte	0x9
	.long	0x9b
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x9
	.long	.LASF2300
	.byte	0x4
	.byte	0x38
	.byte	0x9
	.long	0x9b
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x9
	.long	.LASF2301
	.byte	0x4
	.byte	0x39
	.byte	0x9
	.long	0x9b
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x9
	.long	.LASF2302
	.byte	0x4
	.byte	0x3a
	.byte	0x9
	.long	0x9b
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x9
	.long	.LASF2303
	.byte	0x4
	.byte	0x3b
	.byte	0x9
	.long	0x9b
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0x9
	.long	.LASF2304
	.byte	0x4
	.byte	0x3c
	.byte	0x9
	.long	0x9b
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.uleb128 0x9
	.long	.LASF2305
	.byte	0x4
	.byte	0x3d
	.byte	0x9
	.long	0x9b
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0x9
	.long	.LASF2306
	.byte	0x4
	.byte	0x40
	.byte	0x9
	.long	0x9b
	.byte	0x2
	.byte	0x23
	.uleb128 0x48
	.uleb128 0x9
	.long	.LASF2307
	.byte	0x4
	.byte	0x41
	.byte	0x9
	.long	0x9b
	.byte	0x2
	.byte	0x23
	.uleb128 0x50
	.uleb128 0x9
	.long	.LASF2308
	.byte	0x4
	.byte	0x42
	.byte	0x9
	.long	0x9b
	.byte	0x2
	.byte	0x23
	.uleb128 0x58
	.uleb128 0x9
	.long	.LASF2309
	.byte	0x4
	.byte	0x44
	.byte	0x16
	.long	0x294
	.byte	0x2
	.byte	0x23
	.uleb128 0x60
	.uleb128 0x9
	.long	.LASF2310
	.byte	0x4
	.byte	0x46
	.byte	0x14
	.long	0x29a
	.byte	0x2
	.byte	0x23
	.uleb128 0x68
	.uleb128 0x9
	.long	.LASF2311
	.byte	0x4
	.byte	0x48
	.byte	0x7
	.long	0x69
	.byte	0x2
	.byte	0x23
	.uleb128 0x70
	.uleb128 0x9
	.long	.LASF2312
	.byte	0x4
	.byte	0x49
	.byte	0x7
	.long	0x69
	.byte	0x2
	.byte	0x23
	.uleb128 0x74
	.uleb128 0x9
	.long	.LASF2313
	.byte	0x4
	.byte	0x4a
	.byte	0xb
	.long	0x83
	.byte	0x2
	.byte	0x23
	.uleb128 0x78
	.uleb128 0x9
	.long	.LASF2314
	.byte	0x4
	.byte	0x4d
	.byte	0x12
	.long	0x54
	.byte	0x3
	.byte	0x23
	.uleb128 0x80
	.uleb128 0x9
	.long	.LASF2315
	.byte	0x4
	.byte	0x4e
	.byte	0xf
	.long	0x5b
	.byte	0x3
	.byte	0x23
	.uleb128 0x82
	.uleb128 0x9
	.long	.LASF2316
	.byte	0x4
	.byte	0x4f
	.byte	0x8
	.long	0x2a0
	.byte	0x3
	.byte	0x23
	.uleb128 0x83
	.uleb128 0x9
	.long	.LASF2317
	.byte	0x4
	.byte	0x51
	.byte	0xf
	.long	0x2b0
	.byte	0x3
	.byte	0x23
	.uleb128 0x88
	.uleb128 0x9
	.long	.LASF2318
	.byte	0x4
	.byte	0x59
	.byte	0xd
	.long	0x8f
	.byte	0x3
	.byte	0x23
	.uleb128 0x90
	.uleb128 0x9
	.long	.LASF2319
	.byte	0x4
	.byte	0x5b
	.byte	0x17
	.long	0x2bc
	.byte	0x3
	.byte	0x23
	.uleb128 0x98
	.uleb128 0x9
	.long	.LASF2320
	.byte	0x4
	.byte	0x5c
	.byte	0x19
	.long	0x2c8
	.byte	0x3
	.byte	0x23
	.uleb128 0xa0
	.uleb128 0x9
	.long	.LASF2321
	.byte	0x4
	.byte	0x5d
	.byte	0x14
	.long	0x29a
	.byte	0x3
	.byte	0x23
	.uleb128 0xa8
	.uleb128 0x9
	.long	.LASF2322
	.byte	0x4
	.byte	0x5e
	.byte	0x9
	.long	0x4b
	.byte	0x3
	.byte	0x23
	.uleb128 0xb0
	.uleb128 0x9
	.long	.LASF2323
	.byte	0x4
	.byte	0x5f
	.byte	0xa
	.long	0x31
	.byte	0x3
	.byte	0x23
	.uleb128 0xb8
	.uleb128 0x9
	.long	.LASF2324
	.byte	0x4
	.byte	0x60
	.byte	0x7
	.long	0x69
	.byte	0x3
	.byte	0x23
	.uleb128 0xc0
	.uleb128 0x9
	.long	.LASF2325
	.byte	0x4
	.byte	0x62
	.byte	0x8
	.long	0x2ce
	.byte	0x3
	.byte	0x23
	.uleb128 0xc4
	.byte	0
	.uleb128 0x2
	.long	.LASF2326
	.byte	0x5
	.byte	0x7
	.byte	0x19
	.long	0xad
	.uleb128 0xa
	.long	.LASF2616
	.byte	0x4
	.byte	0x2b
	.byte	0xe
	.uleb128 0xb
	.long	.LASF2327
	.byte	0x1
	.uleb128 0x6
	.byte	0x8
	.long	0x28e
	.uleb128 0x6
	.byte	0x8
	.long	0xad
	.uleb128 0xc
	.long	0xa1
	.long	0x2b0
	.uleb128 0xd
	.long	0x3d
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x286
	.uleb128 0xb
	.long	.LASF2328
	.byte	0x1
	.uleb128 0x6
	.byte	0x8
	.long	0x2b6
	.uleb128 0xb
	.long	.LASF2329
	.byte	0x1
	.uleb128 0x6
	.byte	0x8
	.long	0x2c2
	.uleb128 0xc
	.long	0xa1
	.long	0x2de
	.uleb128 0xd
	.long	0x3d
	.byte	0x13
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x27a
	.uleb128 0xe
	.long	.LASF2573
	.byte	0x8
	.byte	0x91
	.byte	0xe
	.long	0x2de
	.byte	0x1
	.byte	0x1
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF2330
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF2331
	.uleb128 0x6
	.byte	0x8
	.long	0xa8
	.uleb128 0xf
	.byte	0x7
	.byte	0x4
	.long	0x44
	.byte	0x7
	.byte	0x48
	.byte	0x3
	.long	0x82b
	.uleb128 0x10
	.long	.LASF2332
	.byte	0
	.uleb128 0x10
	.long	.LASF2333
	.byte	0x1
	.uleb128 0x10
	.long	.LASF2334
	.byte	0x2
	.uleb128 0x10
	.long	.LASF2335
	.byte	0x3
	.uleb128 0x10
	.long	.LASF2336
	.byte	0x4
	.uleb128 0x10
	.long	.LASF2337
	.byte	0x5
	.uleb128 0x10
	.long	.LASF2338
	.byte	0x6
	.uleb128 0x10
	.long	.LASF2339
	.byte	0x7
	.uleb128 0x10
	.long	.LASF2340
	.byte	0x8
	.uleb128 0x10
	.long	.LASF2341
	.byte	0x9
	.uleb128 0x10
	.long	.LASF2342
	.byte	0xa
	.uleb128 0x10
	.long	.LASF2343
	.byte	0xb
	.uleb128 0x10
	.long	.LASF2344
	.byte	0xc
	.uleb128 0x10
	.long	.LASF2345
	.byte	0xd
	.uleb128 0x10
	.long	.LASF2346
	.byte	0xe
	.uleb128 0x10
	.long	.LASF2347
	.byte	0xf
	.uleb128 0x10
	.long	.LASF2348
	.byte	0x10
	.uleb128 0x10
	.long	.LASF2349
	.byte	0x11
	.uleb128 0x10
	.long	.LASF2350
	.byte	0x12
	.uleb128 0x10
	.long	.LASF2351
	.byte	0x13
	.uleb128 0x10
	.long	.LASF2352
	.byte	0x14
	.uleb128 0x10
	.long	.LASF2353
	.byte	0x15
	.uleb128 0x10
	.long	.LASF2354
	.byte	0x16
	.uleb128 0x10
	.long	.LASF2355
	.byte	0x17
	.uleb128 0x10
	.long	.LASF2356
	.byte	0x18
	.uleb128 0x10
	.long	.LASF2357
	.byte	0x19
	.uleb128 0x10
	.long	.LASF2358
	.byte	0x1a
	.uleb128 0x10
	.long	.LASF2359
	.byte	0x1b
	.uleb128 0x10
	.long	.LASF2360
	.byte	0x1c
	.uleb128 0x10
	.long	.LASF2361
	.byte	0x1d
	.uleb128 0x10
	.long	.LASF2362
	.byte	0x1e
	.uleb128 0x10
	.long	.LASF2363
	.byte	0x1f
	.uleb128 0x10
	.long	.LASF2364
	.byte	0x20
	.uleb128 0x10
	.long	.LASF2365
	.byte	0x21
	.uleb128 0x10
	.long	.LASF2366
	.byte	0x22
	.uleb128 0x10
	.long	.LASF2367
	.byte	0x23
	.uleb128 0x10
	.long	.LASF2368
	.byte	0x24
	.uleb128 0x10
	.long	.LASF2369
	.byte	0x25
	.uleb128 0x10
	.long	.LASF2370
	.byte	0x26
	.uleb128 0x10
	.long	.LASF2371
	.byte	0x27
	.uleb128 0x10
	.long	.LASF2372
	.byte	0x28
	.uleb128 0x10
	.long	.LASF2373
	.byte	0x29
	.uleb128 0x10
	.long	.LASF2374
	.byte	0x2a
	.uleb128 0x10
	.long	.LASF2375
	.byte	0x2b
	.uleb128 0x10
	.long	.LASF2376
	.byte	0x2c
	.uleb128 0x10
	.long	.LASF2377
	.byte	0x2d
	.uleb128 0x10
	.long	.LASF2378
	.byte	0x2e
	.uleb128 0x10
	.long	.LASF2379
	.byte	0x2f
	.uleb128 0x10
	.long	.LASF2380
	.byte	0x30
	.uleb128 0x10
	.long	.LASF2381
	.byte	0x31
	.uleb128 0x10
	.long	.LASF2382
	.byte	0x32
	.uleb128 0x10
	.long	.LASF2383
	.byte	0x33
	.uleb128 0x10
	.long	.LASF2384
	.byte	0x34
	.uleb128 0x10
	.long	.LASF2385
	.byte	0x35
	.uleb128 0x10
	.long	.LASF2386
	.byte	0x36
	.uleb128 0x10
	.long	.LASF2387
	.byte	0x37
	.uleb128 0x10
	.long	.LASF2388
	.byte	0x38
	.uleb128 0x10
	.long	.LASF2389
	.byte	0x39
	.uleb128 0x10
	.long	.LASF2390
	.byte	0x3a
	.uleb128 0x10
	.long	.LASF2391
	.byte	0x3b
	.uleb128 0x10
	.long	.LASF2392
	.byte	0x3c
	.uleb128 0x10
	.long	.LASF2393
	.byte	0x3c
	.uleb128 0x10
	.long	.LASF2394
	.byte	0x3d
	.uleb128 0x10
	.long	.LASF2395
	.byte	0x3e
	.uleb128 0x10
	.long	.LASF2396
	.byte	0x3f
	.uleb128 0x10
	.long	.LASF2397
	.byte	0x40
	.uleb128 0x10
	.long	.LASF2398
	.byte	0x41
	.uleb128 0x10
	.long	.LASF2399
	.byte	0x42
	.uleb128 0x10
	.long	.LASF2400
	.byte	0x43
	.uleb128 0x10
	.long	.LASF2401
	.byte	0x44
	.uleb128 0x10
	.long	.LASF2402
	.byte	0x45
	.uleb128 0x10
	.long	.LASF2403
	.byte	0x46
	.uleb128 0x10
	.long	.LASF2404
	.byte	0x47
	.uleb128 0x10
	.long	.LASF2405
	.byte	0x48
	.uleb128 0x10
	.long	.LASF2406
	.byte	0x49
	.uleb128 0x10
	.long	.LASF2407
	.byte	0x4a
	.uleb128 0x10
	.long	.LASF2408
	.byte	0x4b
	.uleb128 0x10
	.long	.LASF2409
	.byte	0x4c
	.uleb128 0x10
	.long	.LASF2410
	.byte	0x4d
	.uleb128 0x10
	.long	.LASF2411
	.byte	0x4e
	.uleb128 0x10
	.long	.LASF2412
	.byte	0x4f
	.uleb128 0x10
	.long	.LASF2413
	.byte	0x50
	.uleb128 0x10
	.long	.LASF2414
	.byte	0x51
	.uleb128 0x10
	.long	.LASF2415
	.byte	0x52
	.uleb128 0x10
	.long	.LASF2416
	.byte	0x53
	.uleb128 0x10
	.long	.LASF2417
	.byte	0x54
	.uleb128 0x10
	.long	.LASF2418
	.byte	0x55
	.uleb128 0x10
	.long	.LASF2419
	.byte	0x56
	.uleb128 0x10
	.long	.LASF2420
	.byte	0x57
	.uleb128 0x10
	.long	.LASF2421
	.byte	0x58
	.uleb128 0x10
	.long	.LASF2422
	.byte	0x59
	.uleb128 0x10
	.long	.LASF2423
	.byte	0x5a
	.uleb128 0x10
	.long	.LASF2424
	.byte	0x5b
	.uleb128 0x10
	.long	.LASF2425
	.byte	0x5c
	.uleb128 0x10
	.long	.LASF2426
	.byte	0x5d
	.uleb128 0x10
	.long	.LASF2427
	.byte	0x5e
	.uleb128 0x10
	.long	.LASF2428
	.byte	0x5f
	.uleb128 0x10
	.long	.LASF2429
	.byte	0x60
	.uleb128 0x10
	.long	.LASF2430
	.byte	0x61
	.uleb128 0x10
	.long	.LASF2431
	.byte	0x62
	.uleb128 0x10
	.long	.LASF2432
	.byte	0x63
	.uleb128 0x10
	.long	.LASF2433
	.byte	0x64
	.uleb128 0x10
	.long	.LASF2434
	.byte	0x65
	.uleb128 0x10
	.long	.LASF2435
	.byte	0x66
	.uleb128 0x10
	.long	.LASF2436
	.byte	0x67
	.uleb128 0x10
	.long	.LASF2437
	.byte	0x68
	.uleb128 0x10
	.long	.LASF2438
	.byte	0x69
	.uleb128 0x10
	.long	.LASF2439
	.byte	0x6a
	.uleb128 0x10
	.long	.LASF2440
	.byte	0x6b
	.uleb128 0x10
	.long	.LASF2441
	.byte	0x6c
	.uleb128 0x10
	.long	.LASF2442
	.byte	0x6d
	.uleb128 0x10
	.long	.LASF2443
	.byte	0x6e
	.uleb128 0x10
	.long	.LASF2444
	.byte	0x6f
	.uleb128 0x10
	.long	.LASF2445
	.byte	0x70
	.uleb128 0x10
	.long	.LASF2446
	.byte	0x71
	.uleb128 0x10
	.long	.LASF2447
	.byte	0x72
	.uleb128 0x10
	.long	.LASF2448
	.byte	0x73
	.uleb128 0x10
	.long	.LASF2449
	.byte	0x74
	.uleb128 0x10
	.long	.LASF2450
	.byte	0x75
	.uleb128 0x10
	.long	.LASF2451
	.byte	0x76
	.uleb128 0x10
	.long	.LASF2452
	.byte	0x77
	.uleb128 0x10
	.long	.LASF2453
	.byte	0x78
	.uleb128 0x10
	.long	.LASF2454
	.byte	0x79
	.uleb128 0x10
	.long	.LASF2455
	.byte	0x7a
	.uleb128 0x10
	.long	.LASF2456
	.byte	0x7b
	.uleb128 0x10
	.long	.LASF2457
	.byte	0x7c
	.uleb128 0x10
	.long	.LASF2458
	.byte	0x7d
	.uleb128 0x10
	.long	.LASF2459
	.byte	0x7e
	.uleb128 0x10
	.long	.LASF2460
	.byte	0x7f
	.uleb128 0x10
	.long	.LASF2461
	.byte	0x80
	.uleb128 0x10
	.long	.LASF2462
	.byte	0x81
	.uleb128 0x10
	.long	.LASF2463
	.byte	0x82
	.uleb128 0x10
	.long	.LASF2464
	.byte	0x83
	.uleb128 0x10
	.long	.LASF2465
	.byte	0x84
	.uleb128 0x10
	.long	.LASF2466
	.byte	0x85
	.uleb128 0x10
	.long	.LASF2467
	.byte	0x86
	.uleb128 0x10
	.long	.LASF2468
	.byte	0x87
	.uleb128 0x10
	.long	.LASF2469
	.byte	0x88
	.uleb128 0x10
	.long	.LASF2470
	.byte	0x89
	.uleb128 0x10
	.long	.LASF2471
	.byte	0x8a
	.uleb128 0x10
	.long	.LASF2472
	.byte	0x8b
	.uleb128 0x10
	.long	.LASF2473
	.byte	0x8c
	.uleb128 0x10
	.long	.LASF2474
	.byte	0x8d
	.uleb128 0x10
	.long	.LASF2475
	.byte	0x8e
	.uleb128 0x10
	.long	.LASF2476
	.byte	0x8f
	.uleb128 0x10
	.long	.LASF2477
	.byte	0x90
	.uleb128 0x10
	.long	.LASF2478
	.byte	0x91
	.uleb128 0x10
	.long	.LASF2479
	.byte	0x92
	.uleb128 0x10
	.long	.LASF2480
	.byte	0x93
	.uleb128 0x10
	.long	.LASF2481
	.byte	0x94
	.uleb128 0x10
	.long	.LASF2482
	.byte	0x95
	.uleb128 0x10
	.long	.LASF2483
	.byte	0x96
	.uleb128 0x10
	.long	.LASF2484
	.byte	0x97
	.uleb128 0x10
	.long	.LASF2485
	.byte	0x98
	.uleb128 0x10
	.long	.LASF2486
	.byte	0x99
	.uleb128 0x10
	.long	.LASF2487
	.byte	0x9a
	.uleb128 0x10
	.long	.LASF2488
	.byte	0x9b
	.uleb128 0x10
	.long	.LASF2489
	.byte	0x9c
	.uleb128 0x10
	.long	.LASF2490
	.byte	0x9d
	.uleb128 0x10
	.long	.LASF2491
	.byte	0x9e
	.uleb128 0x10
	.long	.LASF2492
	.byte	0x9f
	.uleb128 0x10
	.long	.LASF2493
	.byte	0xa0
	.uleb128 0x10
	.long	.LASF2494
	.byte	0xa1
	.uleb128 0x10
	.long	.LASF2495
	.byte	0xa2
	.uleb128 0x10
	.long	.LASF2496
	.byte	0xa3
	.uleb128 0x10
	.long	.LASF2497
	.byte	0xa4
	.uleb128 0x10
	.long	.LASF2498
	.byte	0xa5
	.uleb128 0x10
	.long	.LASF2499
	.byte	0xa6
	.uleb128 0x10
	.long	.LASF2500
	.byte	0xa7
	.uleb128 0x10
	.long	.LASF2501
	.byte	0xa8
	.uleb128 0x10
	.long	.LASF2502
	.byte	0xa9
	.uleb128 0x10
	.long	.LASF2503
	.byte	0xaa
	.uleb128 0x10
	.long	.LASF2504
	.byte	0xab
	.uleb128 0x10
	.long	.LASF2505
	.byte	0xac
	.uleb128 0x10
	.long	.LASF2506
	.byte	0xad
	.uleb128 0x10
	.long	.LASF2507
	.byte	0xae
	.uleb128 0x10
	.long	.LASF2508
	.byte	0xaf
	.uleb128 0x10
	.long	.LASF2509
	.byte	0xb0
	.uleb128 0x10
	.long	.LASF2510
	.byte	0xb1
	.uleb128 0x10
	.long	.LASF2511
	.byte	0xb2
	.uleb128 0x10
	.long	.LASF2512
	.byte	0xb3
	.uleb128 0x10
	.long	.LASF2513
	.byte	0xb4
	.uleb128 0x10
	.long	.LASF2514
	.byte	0xb5
	.uleb128 0x10
	.long	.LASF2515
	.byte	0xb6
	.uleb128 0x10
	.long	.LASF2516
	.byte	0xb7
	.uleb128 0x10
	.long	.LASF2517
	.byte	0xb8
	.uleb128 0x10
	.long	.LASF2518
	.byte	0xb9
	.uleb128 0x10
	.long	.LASF2519
	.byte	0xba
	.uleb128 0x10
	.long	.LASF2520
	.byte	0xbb
	.uleb128 0x10
	.long	.LASF2521
	.byte	0xbc
	.uleb128 0x10
	.long	.LASF2522
	.byte	0xbd
	.uleb128 0x10
	.long	.LASF2523
	.byte	0xbe
	.uleb128 0x10
	.long	.LASF2524
	.byte	0xbf
	.uleb128 0x10
	.long	.LASF2525
	.byte	0xc0
	.uleb128 0x10
	.long	.LASF2526
	.byte	0xc1
	.uleb128 0x10
	.long	.LASF2527
	.byte	0xc2
	.uleb128 0x10
	.long	.LASF2528
	.byte	0xc3
	.uleb128 0x10
	.long	.LASF2529
	.byte	0xc4
	.uleb128 0x10
	.long	.LASF2530
	.byte	0xc5
	.uleb128 0x10
	.long	.LASF2531
	.byte	0xc6
	.uleb128 0x10
	.long	.LASF2532
	.byte	0xc7
	.uleb128 0x10
	.long	.LASF2533
	.byte	0xeb
	.uleb128 0x10
	.long	.LASF2534
	.byte	0xec
	.uleb128 0x10
	.long	.LASF2535
	.byte	0xed
	.uleb128 0x10
	.long	.LASF2536
	.byte	0xee
	.uleb128 0x10
	.long	.LASF2537
	.byte	0xef
	.uleb128 0x10
	.long	.LASF2538
	.byte	0xf0
	.uleb128 0x10
	.long	.LASF2539
	.byte	0xf1
	.uleb128 0x10
	.long	.LASF2540
	.byte	0xf2
	.uleb128 0x10
	.long	.LASF2541
	.byte	0xf3
	.uleb128 0x10
	.long	.LASF2542
	.byte	0xf4
	.uleb128 0x10
	.long	.LASF2543
	.byte	0xf5
	.uleb128 0x10
	.long	.LASF2544
	.byte	0xf6
	.uleb128 0x10
	.long	.LASF2545
	.byte	0xf7
	.uleb128 0x10
	.long	.LASF2546
	.byte	0xf8
	.uleb128 0x10
	.long	.LASF2547
	.byte	0xf9
	.uleb128 0x10
	.long	.LASF2548
	.byte	0xfa
	.byte	0
	.uleb128 0x3
	.byte	0x4
	.byte	0x4
	.long	.LASF2549
	.uleb128 0x3
	.byte	0x8
	.byte	0x4
	.long	.LASF2550
	.uleb128 0x3
	.byte	0x1
	.byte	0x2
	.long	.LASF2551
	.uleb128 0x8
	.long	.LASF2553
	.byte	0x14
	.byte	0x6
	.byte	0xe
	.byte	0x8
	.long	0x8a8
	.uleb128 0x9
	.long	.LASF2554
	.byte	0x6
	.byte	0x10
	.byte	0xb
	.long	0x82b
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x9
	.long	.LASF2555
	.byte	0x6
	.byte	0x11
	.byte	0xb
	.long	0x82b
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x9
	.long	.LASF2556
	.byte	0x6
	.byte	0x12
	.byte	0xb
	.long	0x82b
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x11
	.string	"min"
	.byte	0x6
	.byte	0x13
	.byte	0xb
	.long	0x82b
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x11
	.string	"max"
	.byte	0x6
	.byte	0x14
	.byte	0xb
	.long	0x82b
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x9
	.long	.LASF2557
	.byte	0x6
	.byte	0x15
	.byte	0xb
	.long	0x8a8
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.byte	0
	.uleb128 0xc
	.long	0x82b
	.long	0x8b7
	.uleb128 0x12
	.long	0x3d
	.byte	0
	.uleb128 0x2
	.long	.LASF2553
	.byte	0x6
	.byte	0x17
	.byte	0x17
	.long	0x840
	.uleb128 0x8
	.long	.LASF2558
	.byte	0x20
	.byte	0x6
	.byte	0x19
	.byte	0x8
	.long	0x958
	.uleb128 0x9
	.long	.LASF2559
	.byte	0x6
	.byte	0x1a
	.byte	0xb
	.long	0x82b
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x11
	.string	"gpu"
	.byte	0x6
	.byte	0x1b
	.byte	0xb
	.long	0x82b
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x9
	.long	.LASF2560
	.byte	0x6
	.byte	0x1c
	.byte	0xb
	.long	0x82b
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x9
	.long	.LASF2561
	.byte	0x6
	.byte	0x1d
	.byte	0xb
	.long	0x82b
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x9
	.long	.LASF2562
	.byte	0x6
	.byte	0x1e
	.byte	0xb
	.long	0x82b
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x9
	.long	.LASF2563
	.byte	0x6
	.byte	0x1f
	.byte	0xb
	.long	0x82b
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x9
	.long	.LASF2564
	.byte	0x6
	.byte	0x1f
	.byte	0x16
	.long	0x82b
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x9
	.long	.LASF2565
	.byte	0x6
	.byte	0x1f
	.byte	0x23
	.long	0x82b
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x9
	.long	.LASF2557
	.byte	0x6
	.byte	0x20
	.byte	0xb
	.long	0x8a8
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.byte	0
	.uleb128 0x2
	.long	.LASF2558
	.byte	0x6
	.byte	0x22
	.byte	0x16
	.long	0x8c3
	.uleb128 0x8
	.long	.LASF2566
	.byte	0x28
	.byte	0x6
	.byte	0x25
	.byte	0x8
	.long	0x9cc
	.uleb128 0x9
	.long	.LASF2567
	.byte	0x6
	.byte	0x26
	.byte	0xb
	.long	0x82b
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x9
	.long	.LASF2568
	.byte	0x6
	.byte	0x27
	.byte	0xb
	.long	0x82b
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x9
	.long	.LASF2569
	.byte	0x6
	.byte	0x28
	.byte	0xb
	.long	0x82b
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x11
	.string	"min"
	.byte	0x6
	.byte	0x29
	.byte	0xb
	.long	0x82b
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x11
	.string	"max"
	.byte	0x6
	.byte	0x2a
	.byte	0xb
	.long	0x82b
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x9
	.long	.LASF2570
	.byte	0x6
	.byte	0x2b
	.byte	0xa
	.long	0x2ce
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.byte	0
	.uleb128 0x2
	.long	.LASF2566
	.byte	0x6
	.byte	0x2d
	.byte	0x1a
	.long	0x964
	.uleb128 0xf
	.byte	0x7
	.byte	0x4
	.long	0x44
	.byte	0x6
	.byte	0x2f
	.byte	0xe
	.long	0x9f3
	.uleb128 0x10
	.long	.LASF2571
	.byte	0
	.uleb128 0x13
	.string	"AMD"
	.byte	0x1
	.byte	0
	.uleb128 0x2
	.long	.LASF2572
	.byte	0x6
	.byte	0x2f
	.byte	0x1d
	.long	0x9d8
	.uleb128 0xe
	.long	.LASF2574
	.byte	0x1
	.byte	0x13
	.byte	0xd
	.long	0x70
	.byte	0x1
	.byte	0x1
	.uleb128 0xe
	.long	.LASF2575
	.byte	0x1
	.byte	0x14
	.byte	0xd
	.long	0x70
	.byte	0x1
	.byte	0x1
	.uleb128 0x14
	.long	.LASF2576
	.byte	0x1
	.byte	0x18
	.byte	0x5
	.long	0x69
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	core_count
	.uleb128 0x14
	.long	.LASF2577
	.byte	0x1
	.byte	0x19
	.byte	0x6
	.long	0x2ce
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	charging_status_before
	.uleb128 0x14
	.long	.LASF2578
	.byte	0x1
	.byte	0x1a
	.byte	0x5
	.long	0x839
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	running_with_privileges
	.uleb128 0xc
	.long	0x82b
	.long	0xa70
	.uleb128 0xd
	.long	0x3d
	.byte	0x3b
	.byte	0
	.uleb128 0xe
	.long	.LASF2579
	.byte	0x1
	.byte	0x1c
	.byte	0xe
	.long	0xa60
	.byte	0x1
	.byte	0x1
	.uleb128 0xe
	.long	.LASF2580
	.byte	0x1
	.byte	0x20
	.byte	0xe
	.long	0xa60
	.byte	0x1
	.byte	0x1
	.uleb128 0x15
	.byte	0x1
	.long	.LASF2581
	.byte	0x8
	.value	0x337
	.byte	0xc
	.byte	0x1
	.long	0x69
	.byte	0x1
	.long	0xaa6
	.uleb128 0x16
	.long	0x2de
	.byte	0
	.uleb128 0x15
	.byte	0x1
	.long	.LASF2582
	.byte	0x8
	.value	0x250
	.byte	0xe
	.byte	0x1
	.long	0x9b
	.byte	0x1
	.long	0xaca
	.uleb128 0x16
	.long	0x9b
	.uleb128 0x16
	.long	0x69
	.uleb128 0x16
	.long	0x2de
	.byte	0
	.uleb128 0x17
	.byte	0x1
	.long	.LASF2611
	.byte	0x8
	.value	0x1b7
	.byte	0xc
	.long	.LASF2617
	.byte	0x1
	.long	0x69
	.byte	0x1
	.long	0xaee
	.uleb128 0x16
	.long	0x300
	.uleb128 0x16
	.long	0x300
	.uleb128 0x18
	.byte	0
	.uleb128 0x15
	.byte	0x1
	.long	.LASF2583
	.byte	0x9
	.value	0x2f9
	.byte	0xc
	.byte	0x1
	.long	0x69
	.byte	0x1
	.long	0xb09
	.uleb128 0x16
	.long	0x300
	.uleb128 0x18
	.byte	0
	.uleb128 0x19
	.byte	0x1
	.long	.LASF2584
	.byte	0xa
	.byte	0x40
	.byte	0x5
	.byte	0x1
	.long	0x69
	.byte	0x1
	.long	0xb22
	.uleb128 0x16
	.long	0xb22
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x958
	.uleb128 0x1a
	.byte	0x1
	.long	.LASF2589
	.byte	0xb
	.byte	0xa
	.byte	0x6
	.byte	0x1
	.byte	0x1
	.long	0xb47
	.uleb128 0x16
	.long	0xb47
	.uleb128 0x16
	.long	0x9b
	.uleb128 0x16
	.long	0x9b
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x82b
	.uleb128 0x19
	.byte	0x1
	.long	.LASF2585
	.byte	0xb
	.byte	0x9
	.byte	0x5
	.byte	0x1
	.long	0x69
	.byte	0x1
	.long	0xb66
	.uleb128 0x16
	.long	0x9b
	.byte	0
	.uleb128 0x19
	.byte	0x1
	.long	.LASF2586
	.byte	0xb
	.byte	0x8
	.byte	0x5
	.byte	0x1
	.long	0x69
	.byte	0x1
	.long	0xb7f
	.uleb128 0x16
	.long	0xb47
	.byte	0
	.uleb128 0x19
	.byte	0x1
	.long	.LASF2555
	.byte	0xc
	.byte	0x9
	.byte	0x7
	.byte	0x1
	.long	0x82b
	.byte	0x1
	.long	0xba2
	.uleb128 0x16
	.long	0x70
	.uleb128 0x16
	.long	0xb47
	.uleb128 0x16
	.long	0xb47
	.byte	0
	.uleb128 0x19
	.byte	0x1
	.long	.LASF2587
	.byte	0xc
	.byte	0xb
	.byte	0x7
	.byte	0x1
	.long	0x82b
	.byte	0x1
	.long	0xbc5
	.uleb128 0x16
	.long	0x82b
	.uleb128 0x16
	.long	0xb47
	.uleb128 0x16
	.long	0x69
	.byte	0
	.uleb128 0x19
	.byte	0x1
	.long	.LASF2588
	.byte	0xc
	.byte	0xa
	.byte	0x7
	.byte	0x1
	.long	0x82b
	.byte	0x1
	.long	0xbe8
	.uleb128 0x16
	.long	0x82b
	.uleb128 0x16
	.long	0xb47
	.uleb128 0x16
	.long	0x69
	.byte	0
	.uleb128 0x1a
	.byte	0x1
	.long	.LASF2590
	.byte	0xb
	.byte	0xc
	.byte	0x6
	.byte	0x1
	.byte	0x1
	.long	0xc07
	.uleb128 0x16
	.long	0xb47
	.uleb128 0x16
	.long	0xb47
	.uleb128 0x16
	.long	0x69
	.byte	0
	.uleb128 0x19
	.byte	0x1
	.long	.LASF2591
	.byte	0xa
	.byte	0x41
	.byte	0x5
	.byte	0x1
	.long	0x69
	.byte	0x1
	.long	0xc25
	.uleb128 0x16
	.long	0xb22
	.uleb128 0x16
	.long	0x9f3
	.byte	0
	.uleb128 0x15
	.byte	0x1
	.long	.LASF2592
	.byte	0xd
	.value	0x21c
	.byte	0xe
	.byte	0x1
	.long	0x4b
	.byte	0x1
	.long	0xc3f
	.uleb128 0x16
	.long	0x31
	.byte	0
	.uleb128 0x1b
	.byte	0x1
	.long	.LASF2618
	.byte	0xe
	.value	0x2bc
	.byte	0x10
	.byte	0x1
	.long	0x77
	.byte	0x1
	.uleb128 0x15
	.byte	0x1
	.long	.LASF2593
	.byte	0xe
	.value	0x280
	.byte	0x11
	.byte	0x1
	.long	0x70
	.byte	0x1
	.long	0xc69
	.uleb128 0x16
	.long	0x69
	.byte	0
	.uleb128 0x19
	.byte	0x1
	.long	.LASF2594
	.byte	0xf
	.byte	0x7a
	.byte	0xe
	.byte	0x1
	.long	0x9b
	.byte	0x1
	.long	0xc87
	.uleb128 0x16
	.long	0x69
	.uleb128 0x16
	.long	0x300
	.byte	0
	.uleb128 0x15
	.byte	0x1
	.long	.LASF2595
	.byte	0x8
	.value	0x33d
	.byte	0xe
	.byte	0x1
	.long	0x2de
	.byte	0x1
	.long	0xca6
	.uleb128 0x16
	.long	0x300
	.uleb128 0x16
	.long	0x300
	.byte	0
	.uleb128 0x1c
	.byte	0x1
	.long	.LASF2606
	.byte	0x1
	.byte	0x98
	.byte	0x5
	.byte	0x1
	.long	0x69
	.quad	.LFB11
	.quad	.LFE11
	.long	.LLST5
	.byte	0x1
	.long	0xd0d
	.uleb128 0x1d
	.string	"buf"
	.byte	0x1
	.byte	0x99
	.byte	0xa
	.long	0xd0d
	.byte	0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x1d
	.string	"fp"
	.byte	0x1
	.byte	0x9a
	.byte	0xb
	.long	0x2de
	.byte	0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0x1e
	.long	.LASF2596
	.byte	0x1
	.byte	0x9c
	.byte	0x9
	.long	0x69
	.byte	0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x1d
	.string	"rpm"
	.byte	0x1
	.byte	0xa9
	.byte	0x9
	.long	0x69
	.byte	0x3
	.byte	0x91
	.sleb128 -108
	.byte	0
	.uleb128 0xc
	.long	0xa1
	.long	0xd1d
	.uleb128 0xd
	.long	0x3d
	.byte	0x3f
	.byte	0
	.uleb128 0x1f
	.byte	0x1
	.long	.LASF2604
	.byte	0x1
	.byte	0x62
	.byte	0x6
	.byte	0x1
	.quad	.LFB10
	.quad	.LFE10
	.long	.LLST4
	.byte	0x1
	.long	0xdaa
	.uleb128 0x20
	.long	.LASF2597
	.byte	0x1
	.byte	0x62
	.byte	0x21
	.long	0xdaa
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x20
	.long	.LASF2598
	.byte	0x1
	.byte	0x62
	.byte	0x2f
	.long	0xdaa
	.byte	0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x20
	.long	.LASF2599
	.byte	0x1
	.byte	0x62
	.byte	0x3d
	.long	0xdaa
	.byte	0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x20
	.long	.LASF2600
	.byte	0x1
	.byte	0x62
	.byte	0x52
	.long	0xdaa
	.byte	0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x20
	.long	.LASF2601
	.byte	0x1
	.byte	0x62
	.byte	0x62
	.long	0xb47
	.byte	0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x20
	.long	.LASF2602
	.byte	0x1
	.byte	0x62
	.byte	0x7b
	.long	0xb22
	.byte	0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x20
	.long	.LASF2603
	.byte	0x1
	.byte	0x62
	.byte	0x90
	.long	0xdb0
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x8b7
	.uleb128 0x6
	.byte	0x8
	.long	0x9cc
	.uleb128 0x21
	.byte	0x1
	.long	.LASF2605
	.byte	0x1
	.byte	0x58
	.byte	0x7
	.long	0x4b
	.quad	.LFB9
	.quad	.LFE9
	.long	.LLST3
	.byte	0x1
	.long	0xded
	.uleb128 0x1e
	.long	.LASF2603
	.byte	0x1
	.byte	0x5a
	.byte	0x10
	.long	0xdb0
	.byte	0x3
	.byte	0x91
	.sleb128 -72
	.byte	0
	.uleb128 0x1c
	.byte	0x1
	.long	.LASF2607
	.byte	0x1
	.byte	0x50
	.byte	0x7
	.byte	0x1
	.long	0x4b
	.quad	.LFB8
	.quad	.LFE8
	.long	.LLST2
	.byte	0x1
	.long	0xe34
	.uleb128 0x20
	.long	.LASF2576
	.byte	0x1
	.byte	0x50
	.byte	0x17
	.long	0x69
	.byte	0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x1e
	.long	.LASF2608
	.byte	0x1
	.byte	0x52
	.byte	0xd
	.long	0xdaa
	.byte	0x2
	.byte	0x91
	.sleb128 -56
	.byte	0
	.uleb128 0x1c
	.byte	0x1
	.long	.LASF2609
	.byte	0x1
	.byte	0x3a
	.byte	0x7
	.byte	0x1
	.long	0x4b
	.quad	.LFB7
	.quad	.LFE7
	.long	.LLST1
	.byte	0x1
	.long	0xe89
	.uleb128 0x20
	.long	.LASF2610
	.byte	0x1
	.byte	0x3a
	.byte	0x28
	.long	0x9f3
	.byte	0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x20
	.long	.LASF2576
	.byte	0x1
	.byte	0x3a
	.byte	0x3a
	.long	0x69
	.byte	0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1e
	.long	.LASF2602
	.byte	0x1
	.byte	0x3d
	.byte	0xc
	.long	0xb22
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x22
	.byte	0x1
	.long	.LASF2612
	.byte	0x1
	.byte	0x23
	.byte	0x6
	.byte	0x1
	.quad	.LFB6
	.quad	.LFE6
	.long	.LLST0
	.byte	0x1
	.uleb128 0x1d
	.string	"fp"
	.byte	0x1
	.byte	0x25
	.byte	0xb
	.long	0x2de
	.byte	0x2
	.byte	0x91
	.sleb128 -24
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
	.uleb128 0x10
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x11
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
	.uleb128 0x12
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x2
	.uleb128 0xa
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
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x18
	.uleb128 0x18
	.byte	0
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
	.uleb128 0xb
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
	.byte	0
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
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
	.uleb128 0x1e
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
	.uleb128 0x1f
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
	.uleb128 0x20
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
	.file 16 "/usr/include/stdc-predef.h"
	.byte	0x3
	.uleb128 0
	.uleb128 0x10
	.byte	0x7
	.long	.Ldebug_macro2
	.byte	0x4
	.byte	0x3
	.uleb128 0x5
	.uleb128 0x8
	.byte	0x7
	.long	.Ldebug_macro3
	.file 17 "/usr/include/x86_64-linux-gnu/bits/libc-header-start.h"
	.byte	0x3
	.uleb128 0x1b
	.uleb128 0x11
	.byte	0x6
	.uleb128 0x1f
	.long	.LASF369
	.file 18 "/usr/include/features.h"
	.byte	0x3
	.uleb128 0x21
	.uleb128 0x12
	.byte	0x7
	.long	.Ldebug_macro4
	.file 19 "/usr/include/features-time64.h"
	.byte	0x3
	.uleb128 0x188
	.uleb128 0x13
	.file 20 "/usr/include/x86_64-linux-gnu/bits/wordsize.h"
	.byte	0x3
	.uleb128 0x14
	.uleb128 0x14
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.file 21 "/usr/include/x86_64-linux-gnu/bits/timesize.h"
	.byte	0x3
	.uleb128 0x15
	.uleb128 0x15
	.byte	0x3
	.uleb128 0x13
	.uleb128 0x14
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
	.file 22 "/usr/include/x86_64-linux-gnu/sys/cdefs.h"
	.byte	0x3
	.uleb128 0x1e6
	.uleb128 0x16
	.byte	0x7
	.long	.Ldebug_macro7
	.byte	0x3
	.uleb128 0x22f
	.uleb128 0x14
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.file 23 "/usr/include/x86_64-linux-gnu/bits/long-double.h"
	.byte	0x3
	.uleb128 0x230
	.uleb128 0x17
	.byte	0x5
	.uleb128 0x15
	.long	.LASF503
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro8
	.byte	0x4
	.file 24 "/usr/include/x86_64-linux-gnu/gnu/stubs.h"
	.byte	0x3
	.uleb128 0x1fe
	.uleb128 0x18
	.file 25 "/usr/include/x86_64-linux-gnu/gnu/stubs-64.h"
	.byte	0x3
	.uleb128 0xa
	.uleb128 0x19
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
	.file 26 "/usr/lib/gcc/x86_64-linux-gnu/11/include/stdarg.h"
	.byte	0x3
	.uleb128 0x24
	.uleb128 0x1a
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
	.uleb128 0x14
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.byte	0x3
	.uleb128 0x1c
	.uleb128 0x15
	.byte	0x3
	.uleb128 0x13
	.uleb128 0x14
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF424
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro14
	.file 27 "/usr/include/x86_64-linux-gnu/bits/typesizes.h"
	.byte	0x3
	.uleb128 0x8d
	.uleb128 0x1b
	.byte	0x7
	.long	.Ldebug_macro15
	.byte	0x4
	.file 28 "/usr/include/x86_64-linux-gnu/bits/time64.h"
	.byte	0x3
	.uleb128 0x8e
	.uleb128 0x1c
	.byte	0x7
	.long	.Ldebug_macro16
	.byte	0x4
	.byte	0x6
	.uleb128 0xe2
	.long	.LASF629
	.byte	0x4
	.file 29 "/usr/include/x86_64-linux-gnu/bits/types/__fpos_t.h"
	.byte	0x3
	.uleb128 0x27
	.uleb128 0x1d
	.byte	0x5
	.uleb128 0x2
	.long	.LASF630
	.file 30 "/usr/include/x86_64-linux-gnu/bits/types/__mbstate_t.h"
	.byte	0x3
	.uleb128 0x5
	.uleb128 0x1e
	.byte	0x5
	.uleb128 0x2
	.long	.LASF631
	.byte	0x4
	.byte	0x4
	.file 31 "/usr/include/x86_64-linux-gnu/bits/types/__fpos64_t.h"
	.byte	0x3
	.uleb128 0x28
	.uleb128 0x1f
	.byte	0x5
	.uleb128 0x2
	.long	.LASF632
	.byte	0x4
	.file 32 "/usr/include/x86_64-linux-gnu/bits/types/__FILE.h"
	.byte	0x3
	.uleb128 0x29
	.uleb128 0x20
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
	.file 33 "/usr/include/x86_64-linux-gnu/bits/stdio_lim.h"
	.byte	0x3
	.uleb128 0x85
	.uleb128 0x21
	.byte	0x7
	.long	.Ldebug_macro19
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro20
	.file 34 "/usr/include/x86_64-linux-gnu/bits/floatn.h"
	.byte	0x3
	.uleb128 0x1ae
	.uleb128 0x22
	.byte	0x7
	.long	.Ldebug_macro21
	.file 35 "/usr/include/x86_64-linux-gnu/bits/floatn-common.h"
	.byte	0x3
	.uleb128 0x77
	.uleb128 0x23
	.byte	0x5
	.uleb128 0x15
	.long	.LASF674
	.byte	0x3
	.uleb128 0x18
	.uleb128 0x17
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
	.uleb128 0x6
	.uleb128 0xd
	.byte	0x5
	.uleb128 0x19
	.long	.LASF368
	.byte	0x3
	.uleb128 0x1a
	.uleb128 0x11
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
	.file 36 "/usr/include/x86_64-linux-gnu/bits/waitflags.h"
	.byte	0x3
	.uleb128 0x28
	.uleb128 0x24
	.byte	0x7
	.long	.Ldebug_macro26
	.byte	0x4
	.file 37 "/usr/include/x86_64-linux-gnu/bits/waitstatus.h"
	.byte	0x3
	.uleb128 0x29
	.uleb128 0x25
	.byte	0x7
	.long	.Ldebug_macro27
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro28
	.file 38 "/usr/include/x86_64-linux-gnu/sys/types.h"
	.byte	0x3
	.uleb128 0x18b
	.uleb128 0x26
	.byte	0x7
	.long	.Ldebug_macro29
	.file 39 "/usr/include/x86_64-linux-gnu/bits/types/clock_t.h"
	.byte	0x3
	.uleb128 0x7e
	.uleb128 0x27
	.byte	0x5
	.uleb128 0x2
	.long	.LASF761
	.byte	0x4
	.file 40 "/usr/include/x86_64-linux-gnu/bits/types/clockid_t.h"
	.byte	0x3
	.uleb128 0x80
	.uleb128 0x28
	.byte	0x5
	.uleb128 0x2
	.long	.LASF762
	.byte	0x4
	.file 41 "/usr/include/x86_64-linux-gnu/bits/types/time_t.h"
	.byte	0x3
	.uleb128 0x81
	.uleb128 0x29
	.byte	0x5
	.uleb128 0x2
	.long	.LASF763
	.byte	0x4
	.file 42 "/usr/include/x86_64-linux-gnu/bits/types/timer_t.h"
	.byte	0x3
	.uleb128 0x82
	.uleb128 0x2a
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
	.file 43 "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h"
	.byte	0x3
	.uleb128 0x9b
	.uleb128 0x2b
	.byte	0x5
	.uleb128 0x14
	.long	.LASF765
	.byte	0x4
	.byte	0x5
	.uleb128 0xab
	.long	.LASF766
	.file 44 "/usr/include/endian.h"
	.byte	0x3
	.uleb128 0xb0
	.uleb128 0x2c
	.byte	0x5
	.uleb128 0x13
	.long	.LASF767
	.file 45 "/usr/include/x86_64-linux-gnu/bits/endian.h"
	.byte	0x3
	.uleb128 0x18
	.uleb128 0x2d
	.byte	0x7
	.long	.Ldebug_macro31
	.file 46 "/usr/include/x86_64-linux-gnu/bits/endianness.h"
	.byte	0x3
	.uleb128 0x23
	.uleb128 0x2e
	.byte	0x7
	.long	.Ldebug_macro32
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro33
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro34
	.file 47 "/usr/include/x86_64-linux-gnu/bits/byteswap.h"
	.byte	0x3
	.uleb128 0x23
	.uleb128 0x2f
	.byte	0x7
	.long	.Ldebug_macro35
	.byte	0x4
	.file 48 "/usr/include/x86_64-linux-gnu/bits/uintn-identity.h"
	.byte	0x3
	.uleb128 0x24
	.uleb128 0x30
	.byte	0x5
	.uleb128 0x18
	.long	.LASF784
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro36
	.byte	0x4
	.file 49 "/usr/include/x86_64-linux-gnu/sys/select.h"
	.byte	0x3
	.uleb128 0xb3
	.uleb128 0x31
	.byte	0x5
	.uleb128 0x16
	.long	.LASF797
	.file 50 "/usr/include/x86_64-linux-gnu/bits/select.h"
	.byte	0x3
	.uleb128 0x1e
	.uleb128 0x32
	.byte	0x7
	.long	.Ldebug_macro37
	.byte	0x4
	.file 51 "/usr/include/x86_64-linux-gnu/bits/types/sigset_t.h"
	.byte	0x3
	.uleb128 0x21
	.uleb128 0x33
	.byte	0x5
	.uleb128 0x2
	.long	.LASF802
	.file 52 "/usr/include/x86_64-linux-gnu/bits/types/__sigset_t.h"
	.byte	0x3
	.uleb128 0x4
	.uleb128 0x34
	.byte	0x7
	.long	.Ldebug_macro38
	.byte	0x4
	.byte	0x4
	.file 53 "/usr/include/x86_64-linux-gnu/bits/types/struct_timeval.h"
	.byte	0x3
	.uleb128 0x25
	.uleb128 0x35
	.byte	0x5
	.uleb128 0x2
	.long	.LASF805
	.byte	0x4
	.file 54 "/usr/include/x86_64-linux-gnu/bits/types/struct_timespec.h"
	.byte	0x3
	.uleb128 0x27
	.uleb128 0x36
	.byte	0x5
	.uleb128 0x3
	.long	.LASF806
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro39
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro40
	.file 55 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h"
	.byte	0x3
	.uleb128 0xe3
	.uleb128 0x37
	.byte	0x5
	.uleb128 0x14
	.long	.LASF823
	.file 56 "/usr/include/x86_64-linux-gnu/bits/thread-shared-types.h"
	.byte	0x3
	.uleb128 0x17
	.uleb128 0x38
	.byte	0x5
	.uleb128 0x14
	.long	.LASF824
	.file 57 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes-arch.h"
	.byte	0x3
	.uleb128 0x2c
	.uleb128 0x39
	.byte	0x5
	.uleb128 0x13
	.long	.LASF825
	.byte	0x3
	.uleb128 0x15
	.uleb128 0x14
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro41
	.byte	0x4
	.file 58 "/usr/include/x86_64-linux-gnu/bits/atomic_wide_counter.h"
	.byte	0x3
	.uleb128 0x2e
	.uleb128 0x3a
	.byte	0x5
	.uleb128 0x14
	.long	.LASF837
	.byte	0x4
	.file 59 "/usr/include/x86_64-linux-gnu/bits/struct_mutex.h"
	.byte	0x3
	.uleb128 0x4c
	.uleb128 0x3b
	.byte	0x7
	.long	.Ldebug_macro42
	.byte	0x4
	.file 60 "/usr/include/x86_64-linux-gnu/bits/struct_rwlock.h"
	.byte	0x3
	.uleb128 0x59
	.uleb128 0x3c
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
	.file 61 "/usr/include/alloca.h"
	.byte	0x3
	.uleb128 0x23e
	.uleb128 0x3d
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
	.file 62 "/usr/include/x86_64-linux-gnu/bits/stdlib-float.h"
	.byte	0x3
	.uleb128 0x3ff
	.uleb128 0x3e
	.byte	0x4
	.byte	0x4
	.file 63 "/usr/include/string.h"
	.byte	0x3
	.uleb128 0x7
	.uleb128 0x3f
	.byte	0x7
	.long	.Ldebug_macro46
	.byte	0x3
	.uleb128 0x1a
	.uleb128 0x11
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
	.file 64 "/usr/include/x86_64-linux-gnu/bits/types/locale_t.h"
	.byte	0x3
	.uleb128 0xac
	.uleb128 0x40
	.byte	0x5
	.uleb128 0x14
	.long	.LASF851
	.file 65 "/usr/include/x86_64-linux-gnu/bits/types/__locale_t.h"
	.byte	0x3
	.uleb128 0x16
	.uleb128 0x41
	.byte	0x5
	.uleb128 0x14
	.long	.LASF852
	.byte	0x4
	.byte	0x4
	.file 66 "/usr/include/strings.h"
	.byte	0x3
	.uleb128 0x1ce
	.uleb128 0x42
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
	.file 67 "/usr/lib/gcc/x86_64-linux-gnu/11/include/stdint.h"
	.byte	0x3
	.uleb128 0x8
	.uleb128 0x43
	.file 68 "/usr/include/stdint.h"
	.byte	0x3
	.uleb128 0x9
	.uleb128 0x44
	.byte	0x7
	.long	.Ldebug_macro50
	.byte	0x3
	.uleb128 0x1a
	.uleb128 0x11
	.byte	0x7
	.long	.Ldebug_macro23
	.byte	0x4
	.file 69 "/usr/include/x86_64-linux-gnu/bits/wchar.h"
	.byte	0x3
	.uleb128 0x1c
	.uleb128 0x45
	.byte	0x7
	.long	.Ldebug_macro51
	.byte	0x4
	.byte	0x3
	.uleb128 0x1d
	.uleb128 0x14
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.file 70 "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h"
	.byte	0x3
	.uleb128 0x25
	.uleb128 0x46
	.byte	0x5
	.uleb128 0x14
	.long	.LASF858
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro52
	.byte	0x4
	.byte	0x5
	.uleb128 0xd
	.long	.LASF921
	.byte	0x4
	.byte	0x3
	.uleb128 0x9
	.uleb128 0xf
	.byte	0x7
	.long	.Ldebug_macro53
	.byte	0x3
	.uleb128 0x1c
	.uleb128 0x2
	.byte	0x7
	.long	.Ldebug_macro54
	.byte	0x4
	.file 71 "/usr/include/x86_64-linux-gnu/bits/locale.h"
	.byte	0x3
	.uleb128 0x1d
	.uleb128 0x47
	.byte	0x7
	.long	.Ldebug_macro55
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro56
	.byte	0x4
	.byte	0x3
	.uleb128 0xa
	.uleb128 0xe
	.byte	0x7
	.long	.Ldebug_macro57
	.file 72 "/usr/include/x86_64-linux-gnu/bits/posix_opt.h"
	.byte	0x3
	.uleb128 0xca
	.uleb128 0x48
	.byte	0x7
	.long	.Ldebug_macro58
	.byte	0x4
	.file 73 "/usr/include/x86_64-linux-gnu/bits/environments.h"
	.byte	0x3
	.uleb128 0xce
	.uleb128 0x49
	.byte	0x3
	.uleb128 0x16
	.uleb128 0x14
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
	.long	.Ldebug_macro48
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro61
	.byte	0x3
	.uleb128 0x276
	.uleb128 0x7
	.byte	0x7
	.long	.Ldebug_macro62
	.byte	0x4
	.file 74 "/usr/include/x86_64-linux-gnu/bits/getopt_posix.h"
	.byte	0x3
	.uleb128 0x387
	.uleb128 0x4a
	.byte	0x5
	.uleb128 0x15
	.long	.LASF1373
	.file 75 "/usr/include/x86_64-linux-gnu/bits/getopt_core.h"
	.byte	0x3
	.uleb128 0x1b
	.uleb128 0x4b
	.byte	0x5
	.uleb128 0x15
	.long	.LASF1374
	.byte	0x4
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro63
	.file 76 "/usr/include/x86_64-linux-gnu/bits/unistd_ext.h"
	.byte	0x3
	.uleb128 0x4c2
	.uleb128 0x4c
	.byte	0x4
	.byte	0x4
	.file 77 "/usr/include/math.h"
	.byte	0x3
	.uleb128 0xb
	.uleb128 0x4d
	.byte	0x7
	.long	.Ldebug_macro64
	.byte	0x3
	.uleb128 0x1b
	.uleb128 0x11
	.byte	0x7
	.long	.Ldebug_macro23
	.byte	0x4
	.file 78 "/usr/include/x86_64-linux-gnu/bits/math-vector.h"
	.byte	0x3
	.uleb128 0x28
	.uleb128 0x4e
	.file 79 "/usr/include/x86_64-linux-gnu/bits/libm-simd-decl-stubs.h"
	.byte	0x3
	.uleb128 0x19
	.uleb128 0x4f
	.byte	0x7
	.long	.Ldebug_macro65
	.byte	0x4
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro66
	.file 80 "/usr/include/x86_64-linux-gnu/bits/flt-eval-method.h"
	.byte	0x3
	.uleb128 0x98
	.uleb128 0x50
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF1656
	.byte	0x4
	.file 81 "/usr/include/x86_64-linux-gnu/bits/fp-logb.h"
	.byte	0x3
	.uleb128 0xcc
	.uleb128 0x51
	.byte	0x7
	.long	.Ldebug_macro67
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro68
	.file 82 "/usr/include/x86_64-linux-gnu/bits/fp-fast.h"
	.byte	0x3
	.uleb128 0xf7
	.uleb128 0x52
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro69
	.file 83 "/usr/include/x86_64-linux-gnu/bits/mathcalls-helper-functions.h"
	.byte	0x3
	.uleb128 0x138
	.uleb128 0x53
	.byte	0x4
	.file 84 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h"
	.byte	0x3
	.uleb128 0x139
	.uleb128 0x54
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro70
	.byte	0x3
	.uleb128 0x149
	.uleb128 0x53
	.byte	0x4
	.byte	0x3
	.uleb128 0x14a
	.uleb128 0x54
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro71
	.byte	0x3
	.uleb128 0x18e
	.uleb128 0x53
	.byte	0x4
	.byte	0x3
	.uleb128 0x18f
	.uleb128 0x54
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro72
	.byte	0x3
	.uleb128 0x1e1
	.uleb128 0x53
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro73
	.byte	0x4
	.byte	0x3
	.uleb128 0xc
	.uleb128 0x9
	.byte	0x7
	.long	.Ldebug_macro74
	.file 85 "/usr/include/ncurses_dll.h"
	.byte	0x3
	.uleb128 0x59
	.uleb128 0x55
	.byte	0x7
	.long	.Ldebug_macro75
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro76
	.byte	0x3
	.uleb128 0xf9
	.uleb128 0x1a
	.byte	0x7
	.long	.Ldebug_macro77
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro78
	.file 86 "/usr/lib/gcc/x86_64-linux-gnu/11/include/stdbool.h"
	.byte	0x3
	.uleb128 0x11a
	.uleb128 0x56
	.byte	0x7
	.long	.Ldebug_macro79
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro80
	.file 87 "/usr/include/unctrl.h"
	.byte	0x3
	.uleb128 0x830
	.uleb128 0x57
	.byte	0x7
	.long	.Ldebug_macro81
	.byte	0x3
	.uleb128 0x37
	.uleb128 0x9
	.byte	0x4
	.byte	0x6
	.uleb128 0x39
	.long	.LASF2244
	.byte	0x4
	.byte	0x4
	.byte	0x3
	.uleb128 0xd
	.uleb128 0xc
	.byte	0x5
	.uleb128 0x2
	.long	.LASF2245
	.byte	0x4
	.byte	0x3
	.uleb128 0xe
	.uleb128 0x6
	.byte	0x7
	.long	.Ldebug_macro82
	.byte	0x4
	.byte	0x3
	.uleb128 0xf
	.uleb128 0xa
	.byte	0x7
	.long	.Ldebug_macro83
	.byte	0x4
	.byte	0x3
	.uleb128 0x10
	.uleb128 0xb
	.byte	0x5
	.uleb128 0x2
	.long	.LASF2284
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
	.section	.debug_macro,"G",@progbits,wm4.stdint.h.23.022efde71688fcb285fe42cc87d41ee3,comdat
.Ldebug_macro50:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x17
	.long	.LASF854
	.byte	0x5
	.uleb128 0x19
	.long	.LASF368
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.wchar.h.20.510818a05484290d697a517509bf4b2d,comdat
.Ldebug_macro51:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.long	.LASF855
	.byte	0x5
	.uleb128 0x22
	.long	.LASF856
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF857
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdint.h.88.7e8071bbba3b822ff5b29420f80324ec,comdat
.Ldebug_macro52:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x58
	.long	.LASF859
	.byte	0x5
	.uleb128 0x6a
	.long	.LASF122
	.byte	0x5
	.uleb128 0x6b
	.long	.LASF131
	.byte	0x5
	.uleb128 0x74
	.long	.LASF860
	.byte	0x5
	.uleb128 0x75
	.long	.LASF861
	.byte	0x5
	.uleb128 0x76
	.long	.LASF862
	.byte	0x5
	.uleb128 0x77
	.long	.LASF863
	.byte	0x5
	.uleb128 0x79
	.long	.LASF864
	.byte	0x5
	.uleb128 0x7a
	.long	.LASF865
	.byte	0x5
	.uleb128 0x7b
	.long	.LASF866
	.byte	0x5
	.uleb128 0x7c
	.long	.LASF867
	.byte	0x5
	.uleb128 0x7f
	.long	.LASF868
	.byte	0x5
	.uleb128 0x80
	.long	.LASF869
	.byte	0x5
	.uleb128 0x81
	.long	.LASF870
	.byte	0x5
	.uleb128 0x82
	.long	.LASF871
	.byte	0x5
	.uleb128 0x86
	.long	.LASF872
	.byte	0x5
	.uleb128 0x87
	.long	.LASF873
	.byte	0x5
	.uleb128 0x88
	.long	.LASF874
	.byte	0x5
	.uleb128 0x89
	.long	.LASF875
	.byte	0x5
	.uleb128 0x8b
	.long	.LASF876
	.byte	0x5
	.uleb128 0x8c
	.long	.LASF877
	.byte	0x5
	.uleb128 0x8d
	.long	.LASF878
	.byte	0x5
	.uleb128 0x8e
	.long	.LASF879
	.byte	0x5
	.uleb128 0x91
	.long	.LASF880
	.byte	0x5
	.uleb128 0x92
	.long	.LASF881
	.byte	0x5
	.uleb128 0x93
	.long	.LASF882
	.byte	0x5
	.uleb128 0x94
	.long	.LASF883
	.byte	0x5
	.uleb128 0x98
	.long	.LASF884
	.byte	0x5
	.uleb128 0x9a
	.long	.LASF885
	.byte	0x5
	.uleb128 0x9b
	.long	.LASF886
	.byte	0x5
	.uleb128 0xa0
	.long	.LASF887
	.byte	0x5
	.uleb128 0xa2
	.long	.LASF888
	.byte	0x5
	.uleb128 0xa4
	.long	.LASF889
	.byte	0x5
	.uleb128 0xa5
	.long	.LASF890
	.byte	0x5
	.uleb128 0xaa
	.long	.LASF891
	.byte	0x5
	.uleb128 0xad
	.long	.LASF892
	.byte	0x5
	.uleb128 0xaf
	.long	.LASF893
	.byte	0x5
	.uleb128 0xb0
	.long	.LASF894
	.byte	0x5
	.uleb128 0xb5
	.long	.LASF895
	.byte	0x5
	.uleb128 0xba
	.long	.LASF896
	.byte	0x5
	.uleb128 0xbb
	.long	.LASF897
	.byte	0x5
	.uleb128 0xbc
	.long	.LASF898
	.byte	0x5
	.uleb128 0xc5
	.long	.LASF899
	.byte	0x5
	.uleb128 0xc7
	.long	.LASF900
	.byte	0x5
	.uleb128 0xca
	.long	.LASF901
	.byte	0x5
	.uleb128 0xd1
	.long	.LASF902
	.byte	0x5
	.uleb128 0xd2
	.long	.LASF903
	.byte	0x5
	.uleb128 0xde
	.long	.LASF904
	.byte	0x5
	.uleb128 0xdf
	.long	.LASF905
	.byte	0x5
	.uleb128 0xe3
	.long	.LASF906
	.byte	0x5
	.uleb128 0xef
	.long	.LASF907
	.byte	0x5
	.uleb128 0xf0
	.long	.LASF908
	.byte	0x5
	.uleb128 0xf4
	.long	.LASF909
	.byte	0x5
	.uleb128 0xf5
	.long	.LASF910
	.byte	0x5
	.uleb128 0xf8
	.long	.LASF911
	.byte	0x5
	.uleb128 0xf9
	.long	.LASF912
	.byte	0x5
	.uleb128 0xfa
	.long	.LASF913
	.byte	0x5
	.uleb128 0xfc
	.long	.LASF914
	.byte	0x5
	.uleb128 0x102
	.long	.LASF915
	.byte	0x5
	.uleb128 0x103
	.long	.LASF916
	.byte	0x5
	.uleb128 0x104
	.long	.LASF917
	.byte	0x5
	.uleb128 0x106
	.long	.LASF918
	.byte	0x5
	.uleb128 0x10d
	.long	.LASF919
	.byte	0x5
	.uleb128 0x10e
	.long	.LASF920
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.locale.h.23.9b5006b0bf779abe978bf85cb308a947,comdat
.Ldebug_macro53:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x17
	.long	.LASF922
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF544
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stddef.h.390.bd136a94777f30e519662a28ea2f4c03,comdat
.Ldebug_macro54:
	.value	0x4
	.byte	0
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
	.section	.debug_macro,"G",@progbits,wm4.locale.h.24.c0c42b9681163ce124f9e0123f9f1018,comdat
.Ldebug_macro55:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x18
	.long	.LASF923
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF924
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF925
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF926
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF927
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF928
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF929
	.byte	0x5
	.uleb128 0x20
	.long	.LASF930
	.byte	0x5
	.uleb128 0x21
	.long	.LASF931
	.byte	0x5
	.uleb128 0x22
	.long	.LASF932
	.byte	0x5
	.uleb128 0x23
	.long	.LASF933
	.byte	0x5
	.uleb128 0x24
	.long	.LASF934
	.byte	0x5
	.uleb128 0x25
	.long	.LASF935
	.byte	0x5
	.uleb128 0x26
	.long	.LASF936
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.locale.h.35.3ee615a657649f1422c6ddf5c47af7af,comdat
.Ldebug_macro56:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x23
	.long	.LASF937
	.byte	0x5
	.uleb128 0x24
	.long	.LASF938
	.byte	0x5
	.uleb128 0x25
	.long	.LASF939
	.byte	0x5
	.uleb128 0x26
	.long	.LASF940
	.byte	0x5
	.uleb128 0x27
	.long	.LASF941
	.byte	0x5
	.uleb128 0x28
	.long	.LASF942
	.byte	0x5
	.uleb128 0x29
	.long	.LASF943
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF944
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF945
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF946
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF947
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF948
	.byte	0x5
	.uleb128 0x2f
	.long	.LASF949
	.byte	0x5
	.uleb128 0x94
	.long	.LASF950
	.byte	0x5
	.uleb128 0x95
	.long	.LASF951
	.byte	0x5
	.uleb128 0x96
	.long	.LASF952
	.byte	0x5
	.uleb128 0x97
	.long	.LASF953
	.byte	0x5
	.uleb128 0x98
	.long	.LASF954
	.byte	0x5
	.uleb128 0x99
	.long	.LASF955
	.byte	0x5
	.uleb128 0x9a
	.long	.LASF956
	.byte	0x5
	.uleb128 0x9b
	.long	.LASF957
	.byte	0x5
	.uleb128 0x9c
	.long	.LASF958
	.byte	0x5
	.uleb128 0x9d
	.long	.LASF959
	.byte	0x5
	.uleb128 0x9e
	.long	.LASF960
	.byte	0x5
	.uleb128 0x9f
	.long	.LASF961
	.byte	0x5
	.uleb128 0xa0
	.long	.LASF962
	.byte	0x5
	.uleb128 0xbf
	.long	.LASF963
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.unistd.h.23.e34f3a5c100123d9385c8b91a86a6783,comdat
.Ldebug_macro57:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x17
	.long	.LASF964
	.byte	0x5
	.uleb128 0x22
	.long	.LASF965
	.byte	0x5
	.uleb128 0x35
	.long	.LASF966
	.byte	0x5
	.uleb128 0x43
	.long	.LASF967
	.byte	0x5
	.uleb128 0x46
	.long	.LASF968
	.byte	0x5
	.uleb128 0x4a
	.long	.LASF969
	.byte	0x5
	.uleb128 0x4e
	.long	.LASF970
	.byte	0x5
	.uleb128 0x52
	.long	.LASF971
	.byte	0x5
	.uleb128 0x56
	.long	.LASF972
	.byte	0x5
	.uleb128 0x5a
	.long	.LASF973
	.byte	0x5
	.uleb128 0x64
	.long	.LASF974
	.byte	0x5
	.uleb128 0x67
	.long	.LASF975
	.byte	0x5
	.uleb128 0x68
	.long	.LASF976
	.byte	0x5
	.uleb128 0x69
	.long	.LASF977
	.byte	0x5
	.uleb128 0x6c
	.long	.LASF978
	.byte	0x5
	.uleb128 0x70
	.long	.LASF979
	.byte	0x5
	.uleb128 0x73
	.long	.LASF980
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.posix_opt.h.20.21a42956ee7763f6aa309b86c7756272,comdat
.Ldebug_macro58:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.long	.LASF981
	.byte	0x5
	.uleb128 0x17
	.long	.LASF982
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF983
	.byte	0x5
	.uleb128 0x20
	.long	.LASF984
	.byte	0x5
	.uleb128 0x23
	.long	.LASF985
	.byte	0x5
	.uleb128 0x26
	.long	.LASF986
	.byte	0x5
	.uleb128 0x29
	.long	.LASF987
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF988
	.byte	0x5
	.uleb128 0x2f
	.long	.LASF989
	.byte	0x5
	.uleb128 0x32
	.long	.LASF990
	.byte	0x5
	.uleb128 0x35
	.long	.LASF991
	.byte	0x5
	.uleb128 0x39
	.long	.LASF992
	.byte	0x5
	.uleb128 0x3c
	.long	.LASF993
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF994
	.byte	0x5
	.uleb128 0x42
	.long	.LASF995
	.byte	0x5
	.uleb128 0x45
	.long	.LASF996
	.byte	0x5
	.uleb128 0x48
	.long	.LASF997
	.byte	0x5
	.uleb128 0x4b
	.long	.LASF998
	.byte	0x5
	.uleb128 0x4c
	.long	.LASF999
	.byte	0x5
	.uleb128 0x4f
	.long	.LASF1000
	.byte	0x5
	.uleb128 0x52
	.long	.LASF1001
	.byte	0x5
	.uleb128 0x55
	.long	.LASF1002
	.byte	0x5
	.uleb128 0x58
	.long	.LASF1003
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF1004
	.byte	0x5
	.uleb128 0x60
	.long	.LASF1005
	.byte	0x5
	.uleb128 0x63
	.long	.LASF1006
	.byte	0x5
	.uleb128 0x67
	.long	.LASF1007
	.byte	0x5
	.uleb128 0x6a
	.long	.LASF1008
	.byte	0x5
	.uleb128 0x6d
	.long	.LASF1009
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF1010
	.byte	0x5
	.uleb128 0x70
	.long	.LASF1011
	.byte	0x5
	.uleb128 0x72
	.long	.LASF1012
	.byte	0x5
	.uleb128 0x75
	.long	.LASF1013
	.byte	0x5
	.uleb128 0x78
	.long	.LASF1014
	.byte	0x5
	.uleb128 0x79
	.long	.LASF1015
	.byte	0x5
	.uleb128 0x7a
	.long	.LASF1016
	.byte	0x5
	.uleb128 0x7d
	.long	.LASF1017
	.byte	0x5
	.uleb128 0x80
	.long	.LASF1018
	.byte	0x5
	.uleb128 0x83
	.long	.LASF1019
	.byte	0x5
	.uleb128 0x86
	.long	.LASF1020
	.byte	0x5
	.uleb128 0x89
	.long	.LASF1021
	.byte	0x5
	.uleb128 0x8c
	.long	.LASF1022
	.byte	0x5
	.uleb128 0x8f
	.long	.LASF1023
	.byte	0x5
	.uleb128 0x92
	.long	.LASF1024
	.byte	0x5
	.uleb128 0x95
	.long	.LASF1025
	.byte	0x5
	.uleb128 0x98
	.long	.LASF1026
	.byte	0x5
	.uleb128 0x9b
	.long	.LASF1027
	.byte	0x5
	.uleb128 0x9e
	.long	.LASF1028
	.byte	0x5
	.uleb128 0xa1
	.long	.LASF1029
	.byte	0x5
	.uleb128 0xa4
	.long	.LASF1030
	.byte	0x5
	.uleb128 0xa7
	.long	.LASF1031
	.byte	0x5
	.uleb128 0xaa
	.long	.LASF1032
	.byte	0x5
	.uleb128 0xad
	.long	.LASF1033
	.byte	0x5
	.uleb128 0xb0
	.long	.LASF1034
	.byte	0x5
	.uleb128 0xb3
	.long	.LASF1035
	.byte	0x5
	.uleb128 0xb6
	.long	.LASF1036
	.byte	0x5
	.uleb128 0xb7
	.long	.LASF1037
	.byte	0x5
	.uleb128 0xba
	.long	.LASF1038
	.byte	0x5
	.uleb128 0xbb
	.long	.LASF1039
	.byte	0x5
	.uleb128 0xbc
	.long	.LASF1040
	.byte	0x5
	.uleb128 0xbd
	.long	.LASF1041
	.byte	0x5
	.uleb128 0xc0
	.long	.LASF1042
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.environments.h.56.c5802092ccc191baeb41f8d355bb878f,comdat
.Ldebug_macro59:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x38
	.long	.LASF1043
	.byte	0x5
	.uleb128 0x39
	.long	.LASF1044
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF1045
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF1046
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF1047
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF1048
	.byte	0x5
	.uleb128 0x5f
	.long	.LASF1049
	.byte	0x5
	.uleb128 0x60
	.long	.LASF1050
	.byte	0x5
	.uleb128 0x65
	.long	.LASF1051
	.byte	0x5
	.uleb128 0x66
	.long	.LASF1052
	.byte	0x5
	.uleb128 0x68
	.long	.LASF1053
	.byte	0x5
	.uleb128 0x69
	.long	.LASF1054
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.unistd.h.210.b40c6c15db1d0b653f8dce03f258da9c,comdat
.Ldebug_macro60:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xd2
	.long	.LASF1055
	.byte	0x5
	.uleb128 0xd3
	.long	.LASF1056
	.byte	0x5
	.uleb128 0xd4
	.long	.LASF1057
	.byte	0x5
	.uleb128 0xe0
	.long	.LASF543
	.byte	0x5
	.uleb128 0xe1
	.long	.LASF544
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.unistd.h.256.25a1178bedb86e5af9165e2b967aab70,comdat
.Ldebug_macro61:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x100
	.long	.LASF1058
	.byte	0x5
	.uleb128 0x113
	.long	.LASF1059
	.byte	0x5
	.uleb128 0x119
	.long	.LASF1060
	.byte	0x5
	.uleb128 0x11a
	.long	.LASF1061
	.byte	0x5
	.uleb128 0x11b
	.long	.LASF1062
	.byte	0x5
	.uleb128 0x11c
	.long	.LASF1063
	.byte	0x5
	.uleb128 0x147
	.long	.LASF1064
	.byte	0x5
	.uleb128 0x148
	.long	.LASF1065
	.byte	0x5
	.uleb128 0x149
	.long	.LASF1066
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.confname.h.27.257966e7e49af2ab4cb41132b3606cbf,comdat
.Ldebug_macro62:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF1067
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF1068
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF1069
	.byte	0x5
	.uleb128 0x21
	.long	.LASF1070
	.byte	0x5
	.uleb128 0x23
	.long	.LASF1071
	.byte	0x5
	.uleb128 0x25
	.long	.LASF1072
	.byte	0x5
	.uleb128 0x27
	.long	.LASF1073
	.byte	0x5
	.uleb128 0x29
	.long	.LASF1074
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF1075
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF1076
	.byte	0x5
	.uleb128 0x2f
	.long	.LASF1077
	.byte	0x5
	.uleb128 0x31
	.long	.LASF1078
	.byte	0x5
	.uleb128 0x33
	.long	.LASF1079
	.byte	0x5
	.uleb128 0x35
	.long	.LASF1080
	.byte	0x5
	.uleb128 0x37
	.long	.LASF1081
	.byte	0x5
	.uleb128 0x39
	.long	.LASF1082
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF1083
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF1084
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF1085
	.byte	0x5
	.uleb128 0x41
	.long	.LASF1086
	.byte	0x5
	.uleb128 0x43
	.long	.LASF1087
	.byte	0x5
	.uleb128 0x4a
	.long	.LASF1088
	.byte	0x5
	.uleb128 0x4c
	.long	.LASF1089
	.byte	0x5
	.uleb128 0x4e
	.long	.LASF1090
	.byte	0x5
	.uleb128 0x50
	.long	.LASF1091
	.byte	0x5
	.uleb128 0x52
	.long	.LASF1092
	.byte	0x5
	.uleb128 0x54
	.long	.LASF1093
	.byte	0x5
	.uleb128 0x56
	.long	.LASF1094
	.byte	0x5
	.uleb128 0x58
	.long	.LASF1095
	.byte	0x5
	.uleb128 0x5a
	.long	.LASF1096
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF1097
	.byte	0x5
	.uleb128 0x5e
	.long	.LASF1098
	.byte	0x5
	.uleb128 0x60
	.long	.LASF1099
	.byte	0x5
	.uleb128 0x62
	.long	.LASF1100
	.byte	0x5
	.uleb128 0x64
	.long	.LASF1101
	.byte	0x5
	.uleb128 0x66
	.long	.LASF1102
	.byte	0x5
	.uleb128 0x68
	.long	.LASF1103
	.byte	0x5
	.uleb128 0x6a
	.long	.LASF1104
	.byte	0x5
	.uleb128 0x6c
	.long	.LASF1105
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF1106
	.byte	0x5
	.uleb128 0x70
	.long	.LASF1107
	.byte	0x5
	.uleb128 0x72
	.long	.LASF1108
	.byte	0x5
	.uleb128 0x74
	.long	.LASF1109
	.byte	0x5
	.uleb128 0x76
	.long	.LASF1110
	.byte	0x5
	.uleb128 0x78
	.long	.LASF1111
	.byte	0x5
	.uleb128 0x7a
	.long	.LASF1112
	.byte	0x5
	.uleb128 0x7c
	.long	.LASF1113
	.byte	0x5
	.uleb128 0x7e
	.long	.LASF1114
	.byte	0x5
	.uleb128 0x80
	.long	.LASF1115
	.byte	0x5
	.uleb128 0x82
	.long	.LASF1116
	.byte	0x5
	.uleb128 0x84
	.long	.LASF1117
	.byte	0x5
	.uleb128 0x86
	.long	.LASF1118
	.byte	0x5
	.uleb128 0x87
	.long	.LASF1119
	.byte	0x5
	.uleb128 0x89
	.long	.LASF1120
	.byte	0x5
	.uleb128 0x8b
	.long	.LASF1121
	.byte	0x5
	.uleb128 0x8d
	.long	.LASF1122
	.byte	0x5
	.uleb128 0x8f
	.long	.LASF1123
	.byte	0x5
	.uleb128 0x91
	.long	.LASF1124
	.byte	0x5
	.uleb128 0x96
	.long	.LASF1125
	.byte	0x5
	.uleb128 0x98
	.long	.LASF1126
	.byte	0x5
	.uleb128 0x9a
	.long	.LASF1127
	.byte	0x5
	.uleb128 0x9c
	.long	.LASF1128
	.byte	0x5
	.uleb128 0x9e
	.long	.LASF1129
	.byte	0x5
	.uleb128 0xa0
	.long	.LASF1130
	.byte	0x5
	.uleb128 0xa2
	.long	.LASF1131
	.byte	0x5
	.uleb128 0xa4
	.long	.LASF1132
	.byte	0x5
	.uleb128 0xa6
	.long	.LASF1133
	.byte	0x5
	.uleb128 0xa8
	.long	.LASF1134
	.byte	0x5
	.uleb128 0xab
	.long	.LASF1135
	.byte	0x5
	.uleb128 0xad
	.long	.LASF1136
	.byte	0x5
	.uleb128 0xaf
	.long	.LASF1137
	.byte	0x5
	.uleb128 0xb1
	.long	.LASF1138
	.byte	0x5
	.uleb128 0xb3
	.long	.LASF1139
	.byte	0x5
	.uleb128 0xb5
	.long	.LASF1140
	.byte	0x5
	.uleb128 0xb7
	.long	.LASF1141
	.byte	0x5
	.uleb128 0xba
	.long	.LASF1142
	.byte	0x5
	.uleb128 0xbc
	.long	.LASF1143
	.byte	0x5
	.uleb128 0xbe
	.long	.LASF1144
	.byte	0x5
	.uleb128 0xc0
	.long	.LASF1145
	.byte	0x5
	.uleb128 0xc2
	.long	.LASF1146
	.byte	0x5
	.uleb128 0xc4
	.long	.LASF1147
	.byte	0x5
	.uleb128 0xc6
	.long	.LASF1148
	.byte	0x5
	.uleb128 0xc8
	.long	.LASF1149
	.byte	0x5
	.uleb128 0xca
	.long	.LASF1150
	.byte	0x5
	.uleb128 0xcc
	.long	.LASF1151
	.byte	0x5
	.uleb128 0xce
	.long	.LASF1152
	.byte	0x5
	.uleb128 0xd0
	.long	.LASF1153
	.byte	0x5
	.uleb128 0xd2
	.long	.LASF1154
	.byte	0x5
	.uleb128 0xd4
	.long	.LASF1155
	.byte	0x5
	.uleb128 0xd6
	.long	.LASF1156
	.byte	0x5
	.uleb128 0xda
	.long	.LASF1157
	.byte	0x5
	.uleb128 0xdc
	.long	.LASF1158
	.byte	0x5
	.uleb128 0xde
	.long	.LASF1159
	.byte	0x5
	.uleb128 0xe0
	.long	.LASF1160
	.byte	0x5
	.uleb128 0xe2
	.long	.LASF1161
	.byte	0x5
	.uleb128 0xe4
	.long	.LASF1162
	.byte	0x5
	.uleb128 0xe6
	.long	.LASF1163
	.byte	0x5
	.uleb128 0xe8
	.long	.LASF1164
	.byte	0x5
	.uleb128 0xea
	.long	.LASF1165
	.byte	0x5
	.uleb128 0xec
	.long	.LASF1166
	.byte	0x5
	.uleb128 0xee
	.long	.LASF1167
	.byte	0x5
	.uleb128 0xf0
	.long	.LASF1168
	.byte	0x5
	.uleb128 0xf2
	.long	.LASF1169
	.byte	0x5
	.uleb128 0xf4
	.long	.LASF1170
	.byte	0x5
	.uleb128 0xf6
	.long	.LASF1171
	.byte	0x5
	.uleb128 0xf8
	.long	.LASF1172
	.byte	0x5
	.uleb128 0xfb
	.long	.LASF1173
	.byte	0x5
	.uleb128 0xfd
	.long	.LASF1174
	.byte	0x5
	.uleb128 0xff
	.long	.LASF1175
	.byte	0x5
	.uleb128 0x101
	.long	.LASF1176
	.byte	0x5
	.uleb128 0x103
	.long	.LASF1177
	.byte	0x5
	.uleb128 0x105
	.long	.LASF1178
	.byte	0x5
	.uleb128 0x108
	.long	.LASF1179
	.byte	0x5
	.uleb128 0x10a
	.long	.LASF1180
	.byte	0x5
	.uleb128 0x10c
	.long	.LASF1181
	.byte	0x5
	.uleb128 0x10e
	.long	.LASF1182
	.byte	0x5
	.uleb128 0x110
	.long	.LASF1183
	.byte	0x5
	.uleb128 0x112
	.long	.LASF1184
	.byte	0x5
	.uleb128 0x115
	.long	.LASF1185
	.byte	0x5
	.uleb128 0x117
	.long	.LASF1186
	.byte	0x5
	.uleb128 0x119
	.long	.LASF1187
	.byte	0x5
	.uleb128 0x11c
	.long	.LASF1188
	.byte	0x5
	.uleb128 0x11e
	.long	.LASF1189
	.byte	0x5
	.uleb128 0x120
	.long	.LASF1190
	.byte	0x5
	.uleb128 0x123
	.long	.LASF1191
	.byte	0x5
	.uleb128 0x125
	.long	.LASF1192
	.byte	0x5
	.uleb128 0x127
	.long	.LASF1193
	.byte	0x5
	.uleb128 0x129
	.long	.LASF1194
	.byte	0x5
	.uleb128 0x12b
	.long	.LASF1195
	.byte	0x5
	.uleb128 0x12d
	.long	.LASF1196
	.byte	0x5
	.uleb128 0x12f
	.long	.LASF1197
	.byte	0x5
	.uleb128 0x131
	.long	.LASF1198
	.byte	0x5
	.uleb128 0x133
	.long	.LASF1199
	.byte	0x5
	.uleb128 0x135
	.long	.LASF1200
	.byte	0x5
	.uleb128 0x137
	.long	.LASF1201
	.byte	0x5
	.uleb128 0x139
	.long	.LASF1202
	.byte	0x5
	.uleb128 0x13b
	.long	.LASF1203
	.byte	0x5
	.uleb128 0x13d
	.long	.LASF1204
	.byte	0x5
	.uleb128 0x13f
	.long	.LASF1205
	.byte	0x5
	.uleb128 0x141
	.long	.LASF1206
	.byte	0x5
	.uleb128 0x143
	.long	.LASF1207
	.byte	0x5
	.uleb128 0x145
	.long	.LASF1208
	.byte	0x5
	.uleb128 0x148
	.long	.LASF1209
	.byte	0x5
	.uleb128 0x14a
	.long	.LASF1210
	.byte	0x5
	.uleb128 0x14c
	.long	.LASF1211
	.byte	0x5
	.uleb128 0x14e
	.long	.LASF1212
	.byte	0x5
	.uleb128 0x150
	.long	.LASF1213
	.byte	0x5
	.uleb128 0x152
	.long	.LASF1214
	.byte	0x5
	.uleb128 0x155
	.long	.LASF1215
	.byte	0x5
	.uleb128 0x157
	.long	.LASF1216
	.byte	0x5
	.uleb128 0x159
	.long	.LASF1217
	.byte	0x5
	.uleb128 0x15b
	.long	.LASF1218
	.byte	0x5
	.uleb128 0x15e
	.long	.LASF1219
	.byte	0x5
	.uleb128 0x160
	.long	.LASF1220
	.byte	0x5
	.uleb128 0x162
	.long	.LASF1221
	.byte	0x5
	.uleb128 0x165
	.long	.LASF1222
	.byte	0x5
	.uleb128 0x167
	.long	.LASF1223
	.byte	0x5
	.uleb128 0x169
	.long	.LASF1224
	.byte	0x5
	.uleb128 0x16b
	.long	.LASF1225
	.byte	0x5
	.uleb128 0x16d
	.long	.LASF1226
	.byte	0x5
	.uleb128 0x16f
	.long	.LASF1227
	.byte	0x5
	.uleb128 0x171
	.long	.LASF1228
	.byte	0x5
	.uleb128 0x173
	.long	.LASF1229
	.byte	0x5
	.uleb128 0x175
	.long	.LASF1230
	.byte	0x5
	.uleb128 0x177
	.long	.LASF1231
	.byte	0x5
	.uleb128 0x179
	.long	.LASF1232
	.byte	0x5
	.uleb128 0x17b
	.long	.LASF1233
	.byte	0x5
	.uleb128 0x17d
	.long	.LASF1234
	.byte	0x5
	.uleb128 0x17f
	.long	.LASF1235
	.byte	0x5
	.uleb128 0x181
	.long	.LASF1236
	.byte	0x5
	.uleb128 0x183
	.long	.LASF1237
	.byte	0x5
	.uleb128 0x185
	.long	.LASF1238
	.byte	0x5
	.uleb128 0x187
	.long	.LASF1239
	.byte	0x5
	.uleb128 0x189
	.long	.LASF1240
	.byte	0x5
	.uleb128 0x18b
	.long	.LASF1241
	.byte	0x5
	.uleb128 0x18d
	.long	.LASF1242
	.byte	0x5
	.uleb128 0x18f
	.long	.LASF1243
	.byte	0x5
	.uleb128 0x191
	.long	.LASF1244
	.byte	0x5
	.uleb128 0x193
	.long	.LASF1245
	.byte	0x5
	.uleb128 0x195
	.long	.LASF1246
	.byte	0x5
	.uleb128 0x197
	.long	.LASF1247
	.byte	0x5
	.uleb128 0x199
	.long	.LASF1248
	.byte	0x5
	.uleb128 0x19b
	.long	.LASF1249
	.byte	0x5
	.uleb128 0x19d
	.long	.LASF1250
	.byte	0x5
	.uleb128 0x19f
	.long	.LASF1251
	.byte	0x5
	.uleb128 0x1a1
	.long	.LASF1252
	.byte	0x5
	.uleb128 0x1a3
	.long	.LASF1253
	.byte	0x5
	.uleb128 0x1a5
	.long	.LASF1254
	.byte	0x5
	.uleb128 0x1a7
	.long	.LASF1255
	.byte	0x5
	.uleb128 0x1a9
	.long	.LASF1256
	.byte	0x5
	.uleb128 0x1ab
	.long	.LASF1257
	.byte	0x5
	.uleb128 0x1ad
	.long	.LASF1258
	.byte	0x5
	.uleb128 0x1af
	.long	.LASF1259
	.byte	0x5
	.uleb128 0x1b1
	.long	.LASF1260
	.byte	0x5
	.uleb128 0x1b3
	.long	.LASF1261
	.byte	0x5
	.uleb128 0x1b5
	.long	.LASF1262
	.byte	0x5
	.uleb128 0x1b7
	.long	.LASF1263
	.byte	0x5
	.uleb128 0x1b9
	.long	.LASF1264
	.byte	0x5
	.uleb128 0x1bb
	.long	.LASF1265
	.byte	0x5
	.uleb128 0x1be
	.long	.LASF1266
	.byte	0x5
	.uleb128 0x1c0
	.long	.LASF1267
	.byte	0x5
	.uleb128 0x1c2
	.long	.LASF1268
	.byte	0x5
	.uleb128 0x1c4
	.long	.LASF1269
	.byte	0x5
	.uleb128 0x1c7
	.long	.LASF1270
	.byte	0x5
	.uleb128 0x1c9
	.long	.LASF1271
	.byte	0x5
	.uleb128 0x1cb
	.long	.LASF1272
	.byte	0x5
	.uleb128 0x1cd
	.long	.LASF1273
	.byte	0x5
	.uleb128 0x1cf
	.long	.LASF1274
	.byte	0x5
	.uleb128 0x1d2
	.long	.LASF1275
	.byte	0x5
	.uleb128 0x1d4
	.long	.LASF1276
	.byte	0x5
	.uleb128 0x1d6
	.long	.LASF1277
	.byte	0x5
	.uleb128 0x1d8
	.long	.LASF1278
	.byte	0x5
	.uleb128 0x1da
	.long	.LASF1279
	.byte	0x5
	.uleb128 0x1dc
	.long	.LASF1280
	.byte	0x5
	.uleb128 0x1de
	.long	.LASF1281
	.byte	0x5
	.uleb128 0x1e0
	.long	.LASF1282
	.byte	0x5
	.uleb128 0x1e2
	.long	.LASF1283
	.byte	0x5
	.uleb128 0x1e4
	.long	.LASF1284
	.byte	0x5
	.uleb128 0x1e6
	.long	.LASF1285
	.byte	0x5
	.uleb128 0x1e8
	.long	.LASF1286
	.byte	0x5
	.uleb128 0x1ea
	.long	.LASF1287
	.byte	0x5
	.uleb128 0x1ec
	.long	.LASF1288
	.byte	0x5
	.uleb128 0x1ee
	.long	.LASF1289
	.byte	0x5
	.uleb128 0x1f2
	.long	.LASF1290
	.byte	0x5
	.uleb128 0x1f4
	.long	.LASF1291
	.byte	0x5
	.uleb128 0x1f7
	.long	.LASF1292
	.byte	0x5
	.uleb128 0x1f9
	.long	.LASF1293
	.byte	0x5
	.uleb128 0x1fb
	.long	.LASF1294
	.byte	0x5
	.uleb128 0x1fd
	.long	.LASF1295
	.byte	0x5
	.uleb128 0x200
	.long	.LASF1296
	.byte	0x5
	.uleb128 0x203
	.long	.LASF1297
	.byte	0x5
	.uleb128 0x205
	.long	.LASF1298
	.byte	0x5
	.uleb128 0x207
	.long	.LASF1299
	.byte	0x5
	.uleb128 0x209
	.long	.LASF1300
	.byte	0x5
	.uleb128 0x20c
	.long	.LASF1301
	.byte	0x5
	.uleb128 0x20f
	.long	.LASF1302
	.byte	0x5
	.uleb128 0x211
	.long	.LASF1303
	.byte	0x5
	.uleb128 0x214
	.long	.LASF1304
	.byte	0x5
	.uleb128 0x217
	.long	.LASF1305
	.byte	0x5
	.uleb128 0x21e
	.long	.LASF1306
	.byte	0x5
	.uleb128 0x221
	.long	.LASF1307
	.byte	0x5
	.uleb128 0x222
	.long	.LASF1308
	.byte	0x5
	.uleb128 0x225
	.long	.LASF1309
	.byte	0x5
	.uleb128 0x227
	.long	.LASF1310
	.byte	0x5
	.uleb128 0x22a
	.long	.LASF1311
	.byte	0x5
	.uleb128 0x22b
	.long	.LASF1312
	.byte	0x5
	.uleb128 0x22e
	.long	.LASF1313
	.byte	0x5
	.uleb128 0x22f
	.long	.LASF1314
	.byte	0x5
	.uleb128 0x232
	.long	.LASF1315
	.byte	0x5
	.uleb128 0x234
	.long	.LASF1316
	.byte	0x5
	.uleb128 0x236
	.long	.LASF1317
	.byte	0x5
	.uleb128 0x238
	.long	.LASF1318
	.byte	0x5
	.uleb128 0x23a
	.long	.LASF1319
	.byte	0x5
	.uleb128 0x23c
	.long	.LASF1320
	.byte	0x5
	.uleb128 0x23e
	.long	.LASF1321
	.byte	0x5
	.uleb128 0x240
	.long	.LASF1322
	.byte	0x5
	.uleb128 0x243
	.long	.LASF1323
	.byte	0x5
	.uleb128 0x245
	.long	.LASF1324
	.byte	0x5
	.uleb128 0x247
	.long	.LASF1325
	.byte	0x5
	.uleb128 0x249
	.long	.LASF1326
	.byte	0x5
	.uleb128 0x24b
	.long	.LASF1327
	.byte	0x5
	.uleb128 0x24d
	.long	.LASF1328
	.byte	0x5
	.uleb128 0x24f
	.long	.LASF1329
	.byte	0x5
	.uleb128 0x251
	.long	.LASF1330
	.byte	0x5
	.uleb128 0x253
	.long	.LASF1331
	.byte	0x5
	.uleb128 0x255
	.long	.LASF1332
	.byte	0x5
	.uleb128 0x257
	.long	.LASF1333
	.byte	0x5
	.uleb128 0x259
	.long	.LASF1334
	.byte	0x5
	.uleb128 0x25b
	.long	.LASF1335
	.byte	0x5
	.uleb128 0x25d
	.long	.LASF1336
	.byte	0x5
	.uleb128 0x25f
	.long	.LASF1337
	.byte	0x5
	.uleb128 0x261
	.long	.LASF1338
	.byte	0x5
	.uleb128 0x264
	.long	.LASF1339
	.byte	0x5
	.uleb128 0x266
	.long	.LASF1340
	.byte	0x5
	.uleb128 0x268
	.long	.LASF1341
	.byte	0x5
	.uleb128 0x26a
	.long	.LASF1342
	.byte	0x5
	.uleb128 0x26c
	.long	.LASF1343
	.byte	0x5
	.uleb128 0x26e
	.long	.LASF1344
	.byte	0x5
	.uleb128 0x270
	.long	.LASF1345
	.byte	0x5
	.uleb128 0x272
	.long	.LASF1346
	.byte	0x5
	.uleb128 0x274
	.long	.LASF1347
	.byte	0x5
	.uleb128 0x276
	.long	.LASF1348
	.byte	0x5
	.uleb128 0x278
	.long	.LASF1349
	.byte	0x5
	.uleb128 0x27a
	.long	.LASF1350
	.byte	0x5
	.uleb128 0x27c
	.long	.LASF1351
	.byte	0x5
	.uleb128 0x27e
	.long	.LASF1352
	.byte	0x5
	.uleb128 0x280
	.long	.LASF1353
	.byte	0x5
	.uleb128 0x282
	.long	.LASF1354
	.byte	0x5
	.uleb128 0x285
	.long	.LASF1355
	.byte	0x5
	.uleb128 0x287
	.long	.LASF1356
	.byte	0x5
	.uleb128 0x289
	.long	.LASF1357
	.byte	0x5
	.uleb128 0x28b
	.long	.LASF1358
	.byte	0x5
	.uleb128 0x28d
	.long	.LASF1359
	.byte	0x5
	.uleb128 0x28f
	.long	.LASF1360
	.byte	0x5
	.uleb128 0x291
	.long	.LASF1361
	.byte	0x5
	.uleb128 0x293
	.long	.LASF1362
	.byte	0x5
	.uleb128 0x295
	.long	.LASF1363
	.byte	0x5
	.uleb128 0x297
	.long	.LASF1364
	.byte	0x5
	.uleb128 0x299
	.long	.LASF1365
	.byte	0x5
	.uleb128 0x29b
	.long	.LASF1366
	.byte	0x5
	.uleb128 0x29d
	.long	.LASF1367
	.byte	0x5
	.uleb128 0x29f
	.long	.LASF1368
	.byte	0x5
	.uleb128 0x2a1
	.long	.LASF1369
	.byte	0x5
	.uleb128 0x2a3
	.long	.LASF1370
	.byte	0x5
	.uleb128 0x2a6
	.long	.LASF1371
	.byte	0x5
	.uleb128 0x2a8
	.long	.LASF1372
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.unistd.h.1108.0d9b49b7dac9f8f76c53696f4c15e077,comdat
.Ldebug_macro63:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x454
	.long	.LASF1375
	.byte	0x5
	.uleb128 0x455
	.long	.LASF1376
	.byte	0x5
	.uleb128 0x456
	.long	.LASF1377
	.byte	0x5
	.uleb128 0x457
	.long	.LASF1378
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.math.h.24.808d6e83a8b3b11b5fa9117392e0d6ca,comdat
.Ldebug_macro64:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x18
	.long	.LASF1379
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
	.long	.LASF1380
	.byte	0x5
	.uleb128 0x24
	.long	.LASF1381
	.byte	0x5
	.uleb128 0x25
	.long	.LASF1382
	.byte	0x5
	.uleb128 0x26
	.long	.LASF1383
	.byte	0x5
	.uleb128 0x27
	.long	.LASF1384
	.byte	0x5
	.uleb128 0x28
	.long	.LASF1385
	.byte	0x5
	.uleb128 0x29
	.long	.LASF1386
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF1387
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF1388
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF1389
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF1390
	.byte	0x5
	.uleb128 0x2f
	.long	.LASF1391
	.byte	0x5
	.uleb128 0x30
	.long	.LASF1392
	.byte	0x5
	.uleb128 0x31
	.long	.LASF1393
	.byte	0x5
	.uleb128 0x32
	.long	.LASF1394
	.byte	0x5
	.uleb128 0x33
	.long	.LASF1395
	.byte	0x5
	.uleb128 0x34
	.long	.LASF1396
	.byte	0x5
	.uleb128 0x35
	.long	.LASF1397
	.byte	0x5
	.uleb128 0x36
	.long	.LASF1398
	.byte	0x5
	.uleb128 0x37
	.long	.LASF1399
	.byte	0x5
	.uleb128 0x38
	.long	.LASF1400
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF1401
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF1402
	.byte	0x5
	.uleb128 0x3c
	.long	.LASF1403
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF1404
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF1405
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF1406
	.byte	0x5
	.uleb128 0x40
	.long	.LASF1407
	.byte	0x5
	.uleb128 0x41
	.long	.LASF1408
	.byte	0x5
	.uleb128 0x42
	.long	.LASF1409
	.byte	0x5
	.uleb128 0x43
	.long	.LASF1410
	.byte	0x5
	.uleb128 0x45
	.long	.LASF1411
	.byte	0x5
	.uleb128 0x46
	.long	.LASF1412
	.byte	0x5
	.uleb128 0x47
	.long	.LASF1413
	.byte	0x5
	.uleb128 0x48
	.long	.LASF1414
	.byte	0x5
	.uleb128 0x49
	.long	.LASF1415
	.byte	0x5
	.uleb128 0x4a
	.long	.LASF1416
	.byte	0x5
	.uleb128 0x4b
	.long	.LASF1417
	.byte	0x5
	.uleb128 0x4c
	.long	.LASF1418
	.byte	0x5
	.uleb128 0x4d
	.long	.LASF1419
	.byte	0x5
	.uleb128 0x4e
	.long	.LASF1420
	.byte	0x5
	.uleb128 0x50
	.long	.LASF1421
	.byte	0x5
	.uleb128 0x51
	.long	.LASF1422
	.byte	0x5
	.uleb128 0x52
	.long	.LASF1423
	.byte	0x5
	.uleb128 0x53
	.long	.LASF1424
	.byte	0x5
	.uleb128 0x54
	.long	.LASF1425
	.byte	0x5
	.uleb128 0x55
	.long	.LASF1426
	.byte	0x5
	.uleb128 0x56
	.long	.LASF1427
	.byte	0x5
	.uleb128 0x57
	.long	.LASF1428
	.byte	0x5
	.uleb128 0x58
	.long	.LASF1429
	.byte	0x5
	.uleb128 0x59
	.long	.LASF1430
	.byte	0x5
	.uleb128 0x5b
	.long	.LASF1431
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF1432
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF1433
	.byte	0x5
	.uleb128 0x5e
	.long	.LASF1434
	.byte	0x5
	.uleb128 0x5f
	.long	.LASF1435
	.byte	0x5
	.uleb128 0x60
	.long	.LASF1436
	.byte	0x5
	.uleb128 0x61
	.long	.LASF1437
	.byte	0x5
	.uleb128 0x62
	.long	.LASF1438
	.byte	0x5
	.uleb128 0x63
	.long	.LASF1439
	.byte	0x5
	.uleb128 0x64
	.long	.LASF1440
	.byte	0x5
	.uleb128 0x66
	.long	.LASF1441
	.byte	0x5
	.uleb128 0x67
	.long	.LASF1442
	.byte	0x5
	.uleb128 0x68
	.long	.LASF1443
	.byte	0x5
	.uleb128 0x69
	.long	.LASF1444
	.byte	0x5
	.uleb128 0x6a
	.long	.LASF1445
	.byte	0x5
	.uleb128 0x6b
	.long	.LASF1446
	.byte	0x5
	.uleb128 0x6c
	.long	.LASF1447
	.byte	0x5
	.uleb128 0x6d
	.long	.LASF1448
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF1449
	.byte	0x5
	.uleb128 0x6f
	.long	.LASF1450
	.byte	0x5
	.uleb128 0x71
	.long	.LASF1451
	.byte	0x5
	.uleb128 0x72
	.long	.LASF1452
	.byte	0x5
	.uleb128 0x73
	.long	.LASF1453
	.byte	0x5
	.uleb128 0x74
	.long	.LASF1454
	.byte	0x5
	.uleb128 0x75
	.long	.LASF1455
	.byte	0x5
	.uleb128 0x76
	.long	.LASF1456
	.byte	0x5
	.uleb128 0x77
	.long	.LASF1457
	.byte	0x5
	.uleb128 0x78
	.long	.LASF1458
	.byte	0x5
	.uleb128 0x79
	.long	.LASF1459
	.byte	0x5
	.uleb128 0x7a
	.long	.LASF1460
	.byte	0x5
	.uleb128 0x7c
	.long	.LASF1461
	.byte	0x5
	.uleb128 0x7d
	.long	.LASF1462
	.byte	0x5
	.uleb128 0x7e
	.long	.LASF1463
	.byte	0x5
	.uleb128 0x7f
	.long	.LASF1464
	.byte	0x5
	.uleb128 0x80
	.long	.LASF1465
	.byte	0x5
	.uleb128 0x81
	.long	.LASF1466
	.byte	0x5
	.uleb128 0x82
	.long	.LASF1467
	.byte	0x5
	.uleb128 0x83
	.long	.LASF1468
	.byte	0x5
	.uleb128 0x84
	.long	.LASF1469
	.byte	0x5
	.uleb128 0x85
	.long	.LASF1470
	.byte	0x5
	.uleb128 0x87
	.long	.LASF1471
	.byte	0x5
	.uleb128 0x88
	.long	.LASF1472
	.byte	0x5
	.uleb128 0x89
	.long	.LASF1473
	.byte	0x5
	.uleb128 0x8a
	.long	.LASF1474
	.byte	0x5
	.uleb128 0x8b
	.long	.LASF1475
	.byte	0x5
	.uleb128 0x8c
	.long	.LASF1476
	.byte	0x5
	.uleb128 0x8d
	.long	.LASF1477
	.byte	0x5
	.uleb128 0x8e
	.long	.LASF1478
	.byte	0x5
	.uleb128 0x8f
	.long	.LASF1479
	.byte	0x5
	.uleb128 0x90
	.long	.LASF1480
	.byte	0x5
	.uleb128 0x92
	.long	.LASF1481
	.byte	0x5
	.uleb128 0x93
	.long	.LASF1482
	.byte	0x5
	.uleb128 0x94
	.long	.LASF1483
	.byte	0x5
	.uleb128 0x95
	.long	.LASF1484
	.byte	0x5
	.uleb128 0x96
	.long	.LASF1485
	.byte	0x5
	.uleb128 0x97
	.long	.LASF1486
	.byte	0x5
	.uleb128 0x98
	.long	.LASF1487
	.byte	0x5
	.uleb128 0x99
	.long	.LASF1488
	.byte	0x5
	.uleb128 0x9a
	.long	.LASF1489
	.byte	0x5
	.uleb128 0x9b
	.long	.LASF1490
	.byte	0x5
	.uleb128 0x9d
	.long	.LASF1491
	.byte	0x5
	.uleb128 0x9e
	.long	.LASF1492
	.byte	0x5
	.uleb128 0x9f
	.long	.LASF1493
	.byte	0x5
	.uleb128 0xa0
	.long	.LASF1494
	.byte	0x5
	.uleb128 0xa1
	.long	.LASF1495
	.byte	0x5
	.uleb128 0xa2
	.long	.LASF1496
	.byte	0x5
	.uleb128 0xa3
	.long	.LASF1497
	.byte	0x5
	.uleb128 0xa4
	.long	.LASF1498
	.byte	0x5
	.uleb128 0xa5
	.long	.LASF1499
	.byte	0x5
	.uleb128 0xa6
	.long	.LASF1500
	.byte	0x5
	.uleb128 0xa8
	.long	.LASF1501
	.byte	0x5
	.uleb128 0xa9
	.long	.LASF1502
	.byte	0x5
	.uleb128 0xaa
	.long	.LASF1503
	.byte	0x5
	.uleb128 0xab
	.long	.LASF1504
	.byte	0x5
	.uleb128 0xac
	.long	.LASF1505
	.byte	0x5
	.uleb128 0xad
	.long	.LASF1506
	.byte	0x5
	.uleb128 0xae
	.long	.LASF1507
	.byte	0x5
	.uleb128 0xaf
	.long	.LASF1508
	.byte	0x5
	.uleb128 0xb0
	.long	.LASF1509
	.byte	0x5
	.uleb128 0xb1
	.long	.LASF1510
	.byte	0x5
	.uleb128 0xb3
	.long	.LASF1511
	.byte	0x5
	.uleb128 0xb4
	.long	.LASF1512
	.byte	0x5
	.uleb128 0xb5
	.long	.LASF1513
	.byte	0x5
	.uleb128 0xb6
	.long	.LASF1514
	.byte	0x5
	.uleb128 0xb7
	.long	.LASF1515
	.byte	0x5
	.uleb128 0xb8
	.long	.LASF1516
	.byte	0x5
	.uleb128 0xb9
	.long	.LASF1517
	.byte	0x5
	.uleb128 0xba
	.long	.LASF1518
	.byte	0x5
	.uleb128 0xbb
	.long	.LASF1519
	.byte	0x5
	.uleb128 0xbc
	.long	.LASF1520
	.byte	0x5
	.uleb128 0xbe
	.long	.LASF1521
	.byte	0x5
	.uleb128 0xbf
	.long	.LASF1522
	.byte	0x5
	.uleb128 0xc0
	.long	.LASF1523
	.byte	0x5
	.uleb128 0xc1
	.long	.LASF1524
	.byte	0x5
	.uleb128 0xc2
	.long	.LASF1525
	.byte	0x5
	.uleb128 0xc3
	.long	.LASF1526
	.byte	0x5
	.uleb128 0xc4
	.long	.LASF1527
	.byte	0x5
	.uleb128 0xc5
	.long	.LASF1528
	.byte	0x5
	.uleb128 0xc6
	.long	.LASF1529
	.byte	0x5
	.uleb128 0xc7
	.long	.LASF1530
	.byte	0x5
	.uleb128 0xc9
	.long	.LASF1531
	.byte	0x5
	.uleb128 0xca
	.long	.LASF1532
	.byte	0x5
	.uleb128 0xcb
	.long	.LASF1533
	.byte	0x5
	.uleb128 0xcc
	.long	.LASF1534
	.byte	0x5
	.uleb128 0xcd
	.long	.LASF1535
	.byte	0x5
	.uleb128 0xce
	.long	.LASF1536
	.byte	0x5
	.uleb128 0xcf
	.long	.LASF1537
	.byte	0x5
	.uleb128 0xd0
	.long	.LASF1538
	.byte	0x5
	.uleb128 0xd1
	.long	.LASF1539
	.byte	0x5
	.uleb128 0xd2
	.long	.LASF1540
	.byte	0x5
	.uleb128 0xd4
	.long	.LASF1541
	.byte	0x5
	.uleb128 0xd5
	.long	.LASF1542
	.byte	0x5
	.uleb128 0xd6
	.long	.LASF1543
	.byte	0x5
	.uleb128 0xd7
	.long	.LASF1544
	.byte	0x5
	.uleb128 0xd8
	.long	.LASF1545
	.byte	0x5
	.uleb128 0xd9
	.long	.LASF1546
	.byte	0x5
	.uleb128 0xda
	.long	.LASF1547
	.byte	0x5
	.uleb128 0xdb
	.long	.LASF1548
	.byte	0x5
	.uleb128 0xdc
	.long	.LASF1549
	.byte	0x5
	.uleb128 0xdd
	.long	.LASF1550
	.byte	0x5
	.uleb128 0xdf
	.long	.LASF1551
	.byte	0x5
	.uleb128 0xe0
	.long	.LASF1552
	.byte	0x5
	.uleb128 0xe1
	.long	.LASF1553
	.byte	0x5
	.uleb128 0xe2
	.long	.LASF1554
	.byte	0x5
	.uleb128 0xe3
	.long	.LASF1555
	.byte	0x5
	.uleb128 0xe4
	.long	.LASF1556
	.byte	0x5
	.uleb128 0xe5
	.long	.LASF1557
	.byte	0x5
	.uleb128 0xe6
	.long	.LASF1558
	.byte	0x5
	.uleb128 0xe7
	.long	.LASF1559
	.byte	0x5
	.uleb128 0xe8
	.long	.LASF1560
	.byte	0x5
	.uleb128 0xea
	.long	.LASF1561
	.byte	0x5
	.uleb128 0xeb
	.long	.LASF1562
	.byte	0x5
	.uleb128 0xec
	.long	.LASF1563
	.byte	0x5
	.uleb128 0xed
	.long	.LASF1564
	.byte	0x5
	.uleb128 0xee
	.long	.LASF1565
	.byte	0x5
	.uleb128 0xef
	.long	.LASF1566
	.byte	0x5
	.uleb128 0xf0
	.long	.LASF1567
	.byte	0x5
	.uleb128 0xf1
	.long	.LASF1568
	.byte	0x5
	.uleb128 0xf2
	.long	.LASF1569
	.byte	0x5
	.uleb128 0xf3
	.long	.LASF1570
	.byte	0x5
	.uleb128 0xf5
	.long	.LASF1571
	.byte	0x5
	.uleb128 0xf6
	.long	.LASF1572
	.byte	0x5
	.uleb128 0xf7
	.long	.LASF1573
	.byte	0x5
	.uleb128 0xf8
	.long	.LASF1574
	.byte	0x5
	.uleb128 0xf9
	.long	.LASF1575
	.byte	0x5
	.uleb128 0xfa
	.long	.LASF1576
	.byte	0x5
	.uleb128 0xfb
	.long	.LASF1577
	.byte	0x5
	.uleb128 0xfc
	.long	.LASF1578
	.byte	0x5
	.uleb128 0xfd
	.long	.LASF1579
	.byte	0x5
	.uleb128 0xfe
	.long	.LASF1580
	.byte	0x5
	.uleb128 0x100
	.long	.LASF1581
	.byte	0x5
	.uleb128 0x101
	.long	.LASF1582
	.byte	0x5
	.uleb128 0x102
	.long	.LASF1583
	.byte	0x5
	.uleb128 0x103
	.long	.LASF1584
	.byte	0x5
	.uleb128 0x104
	.long	.LASF1585
	.byte	0x5
	.uleb128 0x105
	.long	.LASF1586
	.byte	0x5
	.uleb128 0x106
	.long	.LASF1587
	.byte	0x5
	.uleb128 0x107
	.long	.LASF1588
	.byte	0x5
	.uleb128 0x108
	.long	.LASF1589
	.byte	0x5
	.uleb128 0x109
	.long	.LASF1590
	.byte	0x5
	.uleb128 0x10b
	.long	.LASF1591
	.byte	0x5
	.uleb128 0x10c
	.long	.LASF1592
	.byte	0x5
	.uleb128 0x10d
	.long	.LASF1593
	.byte	0x5
	.uleb128 0x10e
	.long	.LASF1594
	.byte	0x5
	.uleb128 0x10f
	.long	.LASF1595
	.byte	0x5
	.uleb128 0x110
	.long	.LASF1596
	.byte	0x5
	.uleb128 0x111
	.long	.LASF1597
	.byte	0x5
	.uleb128 0x112
	.long	.LASF1598
	.byte	0x5
	.uleb128 0x113
	.long	.LASF1599
	.byte	0x5
	.uleb128 0x114
	.long	.LASF1600
	.byte	0x5
	.uleb128 0x116
	.long	.LASF1601
	.byte	0x5
	.uleb128 0x117
	.long	.LASF1602
	.byte	0x5
	.uleb128 0x118
	.long	.LASF1603
	.byte	0x5
	.uleb128 0x119
	.long	.LASF1604
	.byte	0x5
	.uleb128 0x11a
	.long	.LASF1605
	.byte	0x5
	.uleb128 0x11b
	.long	.LASF1606
	.byte	0x5
	.uleb128 0x11c
	.long	.LASF1607
	.byte	0x5
	.uleb128 0x11d
	.long	.LASF1608
	.byte	0x5
	.uleb128 0x11e
	.long	.LASF1609
	.byte	0x5
	.uleb128 0x11f
	.long	.LASF1610
	.byte	0x5
	.uleb128 0x121
	.long	.LASF1611
	.byte	0x5
	.uleb128 0x122
	.long	.LASF1612
	.byte	0x5
	.uleb128 0x123
	.long	.LASF1613
	.byte	0x5
	.uleb128 0x124
	.long	.LASF1614
	.byte	0x5
	.uleb128 0x125
	.long	.LASF1615
	.byte	0x5
	.uleb128 0x126
	.long	.LASF1616
	.byte	0x5
	.uleb128 0x127
	.long	.LASF1617
	.byte	0x5
	.uleb128 0x128
	.long	.LASF1618
	.byte	0x5
	.uleb128 0x129
	.long	.LASF1619
	.byte	0x5
	.uleb128 0x12a
	.long	.LASF1620
	.byte	0x5
	.uleb128 0x12c
	.long	.LASF1621
	.byte	0x5
	.uleb128 0x12d
	.long	.LASF1622
	.byte	0x5
	.uleb128 0x12e
	.long	.LASF1623
	.byte	0x5
	.uleb128 0x12f
	.long	.LASF1624
	.byte	0x5
	.uleb128 0x130
	.long	.LASF1625
	.byte	0x5
	.uleb128 0x131
	.long	.LASF1626
	.byte	0x5
	.uleb128 0x132
	.long	.LASF1627
	.byte	0x5
	.uleb128 0x133
	.long	.LASF1628
	.byte	0x5
	.uleb128 0x134
	.long	.LASF1629
	.byte	0x5
	.uleb128 0x135
	.long	.LASF1630
	.byte	0x5
	.uleb128 0x137
	.long	.LASF1631
	.byte	0x5
	.uleb128 0x138
	.long	.LASF1632
	.byte	0x5
	.uleb128 0x139
	.long	.LASF1633
	.byte	0x5
	.uleb128 0x13a
	.long	.LASF1634
	.byte	0x5
	.uleb128 0x13b
	.long	.LASF1635
	.byte	0x5
	.uleb128 0x13c
	.long	.LASF1636
	.byte	0x5
	.uleb128 0x13d
	.long	.LASF1637
	.byte	0x5
	.uleb128 0x13e
	.long	.LASF1638
	.byte	0x5
	.uleb128 0x13f
	.long	.LASF1639
	.byte	0x5
	.uleb128 0x140
	.long	.LASF1640
	.byte	0x5
	.uleb128 0x142
	.long	.LASF1641
	.byte	0x5
	.uleb128 0x143
	.long	.LASF1642
	.byte	0x5
	.uleb128 0x144
	.long	.LASF1643
	.byte	0x5
	.uleb128 0x145
	.long	.LASF1644
	.byte	0x5
	.uleb128 0x146
	.long	.LASF1645
	.byte	0x5
	.uleb128 0x147
	.long	.LASF1646
	.byte	0x5
	.uleb128 0x148
	.long	.LASF1647
	.byte	0x5
	.uleb128 0x149
	.long	.LASF1648
	.byte	0x5
	.uleb128 0x14a
	.long	.LASF1649
	.byte	0x5
	.uleb128 0x14b
	.long	.LASF1650
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.math.h.48.5dafc6157c80230c0414aa9de5e109ba,comdat
.Ldebug_macro66:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x30
	.long	.LASF1651
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF1652
	.byte	0x5
	.uleb128 0x3c
	.long	.LASF1653
	.byte	0x5
	.uleb128 0x5b
	.long	.LASF1654
	.byte	0x5
	.uleb128 0x62
	.long	.LASF1655
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.fplogb.h.23.f264b61801f4cf347bed2d0fad7232d9,comdat
.Ldebug_macro67:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x17
	.long	.LASF1657
	.byte	0x5
	.uleb128 0x18
	.long	.LASF1658
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.math.h.207.154fc91142a9a5fbf7efb31ec64eb6b5,comdat
.Ldebug_macro68:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xcf
	.long	.LASF1659
	.byte	0x5
	.uleb128 0xd4
	.long	.LASF1660
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.math.h.276.0ce1639e4fd0f75af1ac8728ad903714,comdat
.Ldebug_macro69:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x114
	.long	.LASF1661
	.byte	0x5
	.uleb128 0x116
	.long	.LASF1662
	.byte	0x5
	.uleb128 0x11a
	.long	.LASF1663
	.byte	0x5
	.uleb128 0x11e
	.long	.LASF1664
	.byte	0x5
	.uleb128 0x120
	.long	.LASF1665
	.byte	0x5
	.uleb128 0x123
	.long	.LASF1666
	.byte	0x5
	.uleb128 0x125
	.long	.LASF1667
	.byte	0x5
	.uleb128 0x128
	.long	.LASF1668
	.byte	0x5
	.uleb128 0x12a
	.long	.LASF1669
	.byte	0x5
	.uleb128 0x12e
	.long	.LASF1670
	.byte	0x5
	.uleb128 0x131
	.long	.LASF1671
	.byte	0x5
	.uleb128 0x134
	.long	.LASF1672
	.byte	0x5
	.uleb128 0x135
	.long	.LASF1673
	.byte	0x5
	.uleb128 0x136
	.long	.LASF1674
	.byte	0x5
	.uleb128 0x137
	.long	.LASF1675
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.math.h.314.55d9bc10b03e05989ad6400842f5a189,comdat
.Ldebug_macro70:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x13a
	.long	.LASF1676
	.byte	0x6
	.uleb128 0x13b
	.long	.LASF1677
	.byte	0x6
	.uleb128 0x13c
	.long	.LASF1678
	.byte	0x6
	.uleb128 0x13d
	.long	.LASF1679
	.byte	0x5
	.uleb128 0x145
	.long	.LASF1680
	.byte	0x5
	.uleb128 0x146
	.long	.LASF1681
	.byte	0x5
	.uleb128 0x147
	.long	.LASF1682
	.byte	0x5
	.uleb128 0x148
	.long	.LASF1675
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.math.h.331.a75427efad95ca361cbcd39e72516aa4,comdat
.Ldebug_macro71:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x14b
	.long	.LASF1676
	.byte	0x6
	.uleb128 0x14c
	.long	.LASF1677
	.byte	0x6
	.uleb128 0x14d
	.long	.LASF1678
	.byte	0x6
	.uleb128 0x14e
	.long	.LASF1679
	.byte	0x5
	.uleb128 0x189
	.long	.LASF1683
	.byte	0x5
	.uleb128 0x18a
	.long	.LASF1684
	.byte	0x5
	.uleb128 0x18b
	.long	.LASF1682
	.byte	0x5
	.uleb128 0x18c
	.long	.LASF1675
	.byte	0x5
	.uleb128 0x18d
	.long	.LASF1685
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.math.h.401.6bdb6458b6d78f00f8450a35891b9a64,comdat
.Ldebug_macro72:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x191
	.long	.LASF1676
	.byte	0x6
	.uleb128 0x192
	.long	.LASF1677
	.byte	0x6
	.uleb128 0x193
	.long	.LASF1678
	.byte	0x6
	.uleb128 0x194
	.long	.LASF1679
	.byte	0x5
	.uleb128 0x1ba
	.long	.LASF1686
	.byte	0x5
	.uleb128 0x1bb
	.long	.LASF1687
	.byte	0x5
	.uleb128 0x1bc
	.long	.LASF1682
	.byte	0x5
	.uleb128 0x1bd
	.long	.LASF1688
	.byte	0x6
	.uleb128 0x1c4
	.long	.LASF1676
	.byte	0x6
	.uleb128 0x1c5
	.long	.LASF1677
	.byte	0x6
	.uleb128 0x1c6
	.long	.LASF1678
	.byte	0x6
	.uleb128 0x1c7
	.long	.LASF1679
	.byte	0x5
	.uleb128 0x1cb
	.long	.LASF1689
	.byte	0x5
	.uleb128 0x1cc
	.long	.LASF1690
	.byte	0x5
	.uleb128 0x1cd
	.long	.LASF1682
	.byte	0x5
	.uleb128 0x1ce
	.long	.LASF1688
	.byte	0x6
	.uleb128 0x1d5
	.long	.LASF1676
	.byte	0x6
	.uleb128 0x1d6
	.long	.LASF1677
	.byte	0x6
	.uleb128 0x1d7
	.long	.LASF1678
	.byte	0x6
	.uleb128 0x1d8
	.long	.LASF1679
	.byte	0x5
	.uleb128 0x1dc
	.long	.LASF1691
	.byte	0x5
	.uleb128 0x1dd
	.long	.LASF1692
	.byte	0x5
	.uleb128 0x1de
	.long	.LASF1682
	.byte	0x5
	.uleb128 0x1df
	.long	.LASF1688
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.math.h.486.a7407a4b77ad0f3687700042629bc5bf,comdat
.Ldebug_macro73:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x1e6
	.long	.LASF1676
	.byte	0x6
	.uleb128 0x1e7
	.long	.LASF1677
	.byte	0x6
	.uleb128 0x1e8
	.long	.LASF1678
	.byte	0x6
	.uleb128 0x1e9
	.long	.LASF1679
	.byte	0x5
	.uleb128 0x1ed
	.long	.LASF1693
	.byte	0x5
	.uleb128 0x1ee
	.long	.LASF1694
	.byte	0x5
	.uleb128 0x1ef
	.long	.LASF1682
	.byte	0x5
	.uleb128 0x1f0
	.long	.LASF1688
	.byte	0x6
	.uleb128 0x1f7
	.long	.LASF1676
	.byte	0x6
	.uleb128 0x1f8
	.long	.LASF1677
	.byte	0x6
	.uleb128 0x1f9
	.long	.LASF1678
	.byte	0x6
	.uleb128 0x1fa
	.long	.LASF1679
	.byte	0x5
	.uleb128 0x1fe
	.long	.LASF1695
	.byte	0x5
	.uleb128 0x1ff
	.long	.LASF1696
	.byte	0x5
	.uleb128 0x200
	.long	.LASF1682
	.byte	0x5
	.uleb128 0x201
	.long	.LASF1688
	.byte	0x6
	.uleb128 0x208
	.long	.LASF1676
	.byte	0x6
	.uleb128 0x209
	.long	.LASF1677
	.byte	0x6
	.uleb128 0x20a
	.long	.LASF1678
	.byte	0x6
	.uleb128 0x20b
	.long	.LASF1679
	.byte	0x6
	.uleb128 0x21f
	.long	.LASF1697
	.byte	0x6
	.uleb128 0x220
	.long	.LASF1698
	.byte	0x6
	.uleb128 0x221
	.long	.LASF1699
	.byte	0x6
	.uleb128 0x222
	.long	.LASF1700
	.byte	0x6
	.uleb128 0x223
	.long	.LASF1701
	.byte	0x5
	.uleb128 0x226
	.long	.LASF1702
	.byte	0x5
	.uleb128 0x227
	.long	.LASF1703
	.byte	0x5
	.uleb128 0x228
	.long	.LASF1704
	.byte	0x5
	.uleb128 0x229
	.long	.LASF1705
	.byte	0x5
	.uleb128 0x22b
	.long	.LASF1706
	.byte	0x5
	.uleb128 0x22e
	.long	.LASF1707
	.byte	0x6
	.uleb128 0x34d
	.long	.LASF1708
	.byte	0x6
	.uleb128 0x34e
	.long	.LASF1709
	.byte	0x6
	.uleb128 0x34f
	.long	.LASF1710
	.byte	0x6
	.uleb128 0x350
	.long	.LASF1711
	.byte	0x6
	.uleb128 0x351
	.long	.LASF1712
	.byte	0x6
	.uleb128 0x352
	.long	.LASF1713
	.byte	0x5
	.uleb128 0x374
	.long	.LASF1714
	.byte	0x5
	.uleb128 0x37a
	.long	.LASF1715
	.byte	0x5
	.uleb128 0x381
	.long	.LASF1716
	.byte	0x5
	.uleb128 0x3a9
	.long	.LASF1717
	.byte	0x5
	.uleb128 0x3ac
	.long	.LASF1718
	.byte	0x5
	.uleb128 0x3af
	.long	.LASF1719
	.byte	0x5
	.uleb128 0x3b2
	.long	.LASF1720
	.byte	0x5
	.uleb128 0x3b5
	.long	.LASF1721
	.byte	0x5
	.uleb128 0x3c7
	.long	.LASF1722
	.byte	0x5
	.uleb128 0x3cf
	.long	.LASF1723
	.byte	0x5
	.uleb128 0x3e2
	.long	.LASF1724
	.byte	0x5
	.uleb128 0x3ea
	.long	.LASF1725
	.byte	0x5
	.uleb128 0x3f3
	.long	.LASF1726
	.byte	0x5
	.uleb128 0x405
	.long	.LASF1727
	.byte	0x5
	.uleb128 0x40b
	.long	.LASF1728
	.byte	0x5
	.uleb128 0x40c
	.long	.LASF1729
	.byte	0x5
	.uleb128 0x418
	.long	.LASF1730
	.byte	0x5
	.uleb128 0x47a
	.long	.LASF1731
	.byte	0x5
	.uleb128 0x47b
	.long	.LASF1732
	.byte	0x5
	.uleb128 0x47c
	.long	.LASF1733
	.byte	0x5
	.uleb128 0x47d
	.long	.LASF1734
	.byte	0x5
	.uleb128 0x47e
	.long	.LASF1735
	.byte	0x5
	.uleb128 0x47f
	.long	.LASF1736
	.byte	0x5
	.uleb128 0x480
	.long	.LASF1737
	.byte	0x5
	.uleb128 0x481
	.long	.LASF1738
	.byte	0x5
	.uleb128 0x482
	.long	.LASF1739
	.byte	0x5
	.uleb128 0x483
	.long	.LASF1740
	.byte	0x5
	.uleb128 0x484
	.long	.LASF1741
	.byte	0x5
	.uleb128 0x485
	.long	.LASF1742
	.byte	0x5
	.uleb128 0x486
	.long	.LASF1743
	.byte	0x5
	.uleb128 0x519
	.long	.LASF1744
	.byte	0x5
	.uleb128 0x51a
	.long	.LASF1745
	.byte	0x5
	.uleb128 0x51b
	.long	.LASF1746
	.byte	0x5
	.uleb128 0x51c
	.long	.LASF1747
	.byte	0x5
	.uleb128 0x51d
	.long	.LASF1748
	.byte	0x5
	.uleb128 0x51e
	.long	.LASF1749
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.curses.h.39.3b102e3630033b221c3e41b51ca3db05,comdat
.Ldebug_macro74:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x27
	.long	.LASF1750
	.byte	0x5
	.uleb128 0x45
	.long	.LASF1751
	.byte	0x5
	.uleb128 0x46
	.long	.LASF1752
	.byte	0x5
	.uleb128 0x49
	.long	.LASF1753
	.byte	0x5
	.uleb128 0x4a
	.long	.LASF1754
	.byte	0x5
	.uleb128 0x4b
	.long	.LASF1755
	.byte	0x6
	.uleb128 0x4e
	.long	.LASF1756
	.byte	0x5
	.uleb128 0x4f
	.long	.LASF1757
	.byte	0x5
	.uleb128 0x54
	.long	.LASF1758
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.ncurses_dll.h.32.4f7d5f75878767130cff27603ec5ce98,comdat
.Ldebug_macro75:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x20
	.long	.LASF1759
	.byte	0x5
	.uleb128 0x44
	.long	.LASF1760
	.byte	0x5
	.uleb128 0x49
	.long	.LASF1761
	.byte	0x5
	.uleb128 0x4c
	.long	.LASF1762
	.byte	0x5
	.uleb128 0x4e
	.long	.LASF1763
	.byte	0x5
	.uleb128 0x4f
	.long	.LASF1764
	.byte	0x5
	.uleb128 0x5e
	.long	.LASF1765
	.byte	0x5
	.uleb128 0x5f
	.long	.LASF1766
	.byte	0x5
	.uleb128 0x60
	.long	.LASF1767
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.curses.h.111.996a0c5f11e7351daad14d76d85bb96b,comdat
.Ldebug_macro76:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x6f
	.long	.LASF1768
	.byte	0x5
	.uleb128 0x77
	.long	.LASF1769
	.byte	0x6
	.uleb128 0x7e
	.long	.LASF1770
	.byte	0x5
	.uleb128 0x7f
	.long	.LASF1771
	.byte	0x6
	.uleb128 0x81
	.long	.LASF1772
	.byte	0x5
	.uleb128 0x82
	.long	.LASF1773
	.byte	0x6
	.uleb128 0x8d
	.long	.LASF1774
	.byte	0x5
	.uleb128 0x8e
	.long	.LASF1775
	.byte	0x6
	.uleb128 0x90
	.long	.LASF1776
	.byte	0x5
	.uleb128 0x91
	.long	.LASF1777
	.byte	0x5
	.uleb128 0x97
	.long	.LASF1778
	.byte	0x5
	.uleb128 0x98
	.long	.LASF1779
	.byte	0x5
	.uleb128 0x99
	.long	.LASF1780
	.byte	0x5
	.uleb128 0x9a
	.long	.LASF1781
	.byte	0x5
	.uleb128 0xa3
	.long	.LASF1782
	.byte	0x5
	.uleb128 0xaa
	.long	.LASF1783
	.byte	0x6
	.uleb128 0xb0
	.long	.LASF1784
	.byte	0x6
	.uleb128 0xb8
	.long	.LASF1785
	.byte	0x5
	.uleb128 0xb9
	.long	.LASF1786
	.byte	0x6
	.uleb128 0xbe
	.long	.LASF1787
	.byte	0x5
	.uleb128 0xbf
	.long	.LASF1788
	.byte	0x6
	.uleb128 0xc4
	.long	.LASF1789
	.byte	0x5
	.uleb128 0xc5
	.long	.LASF1790
	.byte	0x6
	.uleb128 0xcb
	.long	.LASF1791
	.byte	0x5
	.uleb128 0xcc
	.long	.LASF1792
	.byte	0x6
	.uleb128 0xd2
	.long	.LASF1793
	.byte	0x5
	.uleb128 0xd3
	.long	.LASF1794
	.byte	0x6
	.uleb128 0xda
	.long	.LASF1795
	.byte	0x5
	.uleb128 0xdb
	.long	.LASF1796
	.byte	0x5
	.uleb128 0xf5
	.long	.LASF1797
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdarg.h.31.3fa7b8f6daaa31edd1696c08c77f2a73,comdat
.Ldebug_macro77:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF1798
	.byte	0x5
	.uleb128 0x20
	.long	.LASF1799
	.byte	0x6
	.uleb128 0x22
	.long	.LASF567
	.byte	0x5
	.uleb128 0x2f
	.long	.LASF1800
	.byte	0x5
	.uleb128 0x30
	.long	.LASF1801
	.byte	0x5
	.uleb128 0x31
	.long	.LASF1802
	.byte	0x5
	.uleb128 0x34
	.long	.LASF1803
	.byte	0x5
	.uleb128 0x36
	.long	.LASF1804
	.byte	0x5
	.uleb128 0x69
	.long	.LASF1805
	.byte	0x5
	.uleb128 0x6c
	.long	.LASF1806
	.byte	0x5
	.uleb128 0x72
	.long	.LASF1807
	.byte	0x5
	.uleb128 0x75
	.long	.LASF1808
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.curses.h.266.a6aa4f23550a6272814a993111e6627b,comdat
.Ldebug_macro78:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x10a
	.long	.LASF1809
	.byte	0x5
	.uleb128 0x10b
	.long	.LASF1810
	.byte	0x6
	.uleb128 0x10d
	.long	.LASF1811
	.byte	0x5
	.uleb128 0x10e
	.long	.LASF1812
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdbool.h.29.4a1c88fe569adb8d03217dd16982ca34,comdat
.Ldebug_macro79:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF1813
	.byte	0x5
	.uleb128 0x21
	.long	.LASF1814
	.byte	0x5
	.uleb128 0x26
	.long	.LASF1815
	.byte	0x5
	.uleb128 0x27
	.long	.LASF1816
	.byte	0x5
	.uleb128 0x32
	.long	.LASF1817
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.curses.h.284.b5c88a40caf804363b8dba931290ab8a,comdat
.Ldebug_macro80:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x11c
	.long	.LASF1818
	.byte	0x5
	.uleb128 0x129
	.long	.LASF1819
	.byte	0x5
	.uleb128 0x12c
	.long	.LASF1820
	.byte	0x5
	.uleb128 0x132
	.long	.LASF1821
	.byte	0x5
	.uleb128 0x133
	.long	.LASF1822
	.byte	0x5
	.uleb128 0x134
	.long	.LASF1823
	.byte	0x5
	.uleb128 0x135
	.long	.LASF1824
	.byte	0x5
	.uleb128 0x136
	.long	.LASF1825
	.byte	0x5
	.uleb128 0x137
	.long	.LASF1826
	.byte	0x5
	.uleb128 0x138
	.long	.LASF1827
	.byte	0x5
	.uleb128 0x139
	.long	.LASF1828
	.byte	0x5
	.uleb128 0x13a
	.long	.LASF1829
	.byte	0x5
	.uleb128 0x13b
	.long	.LASF1830
	.byte	0x5
	.uleb128 0x13c
	.long	.LASF1831
	.byte	0x5
	.uleb128 0x13d
	.long	.LASF1832
	.byte	0x5
	.uleb128 0x13e
	.long	.LASF1833
	.byte	0x5
	.uleb128 0x13f
	.long	.LASF1834
	.byte	0x5
	.uleb128 0x140
	.long	.LASF1835
	.byte	0x5
	.uleb128 0x141
	.long	.LASF1836
	.byte	0x5
	.uleb128 0x142
	.long	.LASF1837
	.byte	0x5
	.uleb128 0x145
	.long	.LASF1838
	.byte	0x5
	.uleb128 0x149
	.long	.LASF1839
	.byte	0x5
	.uleb128 0x14a
	.long	.LASF1840
	.byte	0x5
	.uleb128 0x14b
	.long	.LASF1841
	.byte	0x5
	.uleb128 0x14c
	.long	.LASF1842
	.byte	0x5
	.uleb128 0x14d
	.long	.LASF1843
	.byte	0x5
	.uleb128 0x14e
	.long	.LASF1844
	.byte	0x5
	.uleb128 0x14f
	.long	.LASF1845
	.byte	0x5
	.uleb128 0x150
	.long	.LASF1846
	.byte	0x5
	.uleb128 0x15b
	.long	.LASF1847
	.byte	0x5
	.uleb128 0x15e
	.long	.LASF1848
	.byte	0x5
	.uleb128 0x15f
	.long	.LASF1849
	.byte	0x5
	.uleb128 0x160
	.long	.LASF1850
	.byte	0x5
	.uleb128 0x161
	.long	.LASF1851
	.byte	0x5
	.uleb128 0x162
	.long	.LASF1852
	.byte	0x5
	.uleb128 0x163
	.long	.LASF1853
	.byte	0x5
	.uleb128 0x164
	.long	.LASF1854
	.byte	0x5
	.uleb128 0x165
	.long	.LASF1855
	.byte	0x5
	.uleb128 0x166
	.long	.LASF1856
	.byte	0x5
	.uleb128 0x167
	.long	.LASF1857
	.byte	0x5
	.uleb128 0x168
	.long	.LASF1858
	.byte	0x5
	.uleb128 0x169
	.long	.LASF1859
	.byte	0x5
	.uleb128 0x16a
	.long	.LASF1860
	.byte	0x5
	.uleb128 0x16b
	.long	.LASF1861
	.byte	0x5
	.uleb128 0x16c
	.long	.LASF1862
	.byte	0x5
	.uleb128 0x16d
	.long	.LASF1863
	.byte	0x5
	.uleb128 0x16e
	.long	.LASF1864
	.byte	0x5
	.uleb128 0x16f
	.long	.LASF1865
	.byte	0x5
	.uleb128 0x171
	.long	.LASF1866
	.byte	0x5
	.uleb128 0x172
	.long	.LASF1867
	.byte	0x5
	.uleb128 0x173
	.long	.LASF1868
	.byte	0x5
	.uleb128 0x174
	.long	.LASF1869
	.byte	0x5
	.uleb128 0x175
	.long	.LASF1870
	.byte	0x5
	.uleb128 0x176
	.long	.LASF1871
	.byte	0x5
	.uleb128 0x177
	.long	.LASF1872
	.byte	0x5
	.uleb128 0x17d
	.long	.LASF1873
	.byte	0x5
	.uleb128 0x17e
	.long	.LASF1874
	.byte	0x5
	.uleb128 0x17f
	.long	.LASF1875
	.byte	0x5
	.uleb128 0x180
	.long	.LASF1876
	.byte	0x5
	.uleb128 0x181
	.long	.LASF1877
	.byte	0x5
	.uleb128 0x182
	.long	.LASF1878
	.byte	0x5
	.uleb128 0x183
	.long	.LASF1879
	.byte	0x5
	.uleb128 0x18b
	.long	.LASF1880
	.byte	0x5
	.uleb128 0x18c
	.long	.LASF1881
	.byte	0x5
	.uleb128 0x18d
	.long	.LASF1882
	.byte	0x5
	.uleb128 0x18e
	.long	.LASF1883
	.byte	0x5
	.uleb128 0x18f
	.long	.LASF1884
	.byte	0x5
	.uleb128 0x190
	.long	.LASF1885
	.byte	0x5
	.uleb128 0x191
	.long	.LASF1886
	.byte	0x5
	.uleb128 0x192
	.long	.LASF1887
	.byte	0x5
	.uleb128 0x193
	.long	.LASF1888
	.byte	0x5
	.uleb128 0x194
	.long	.LASF1889
	.byte	0x5
	.uleb128 0x195
	.long	.LASF1890
	.byte	0x2
	.uleb128 0x197
	.string	"ERR"
	.byte	0x5
	.uleb128 0x198
	.long	.LASF1891
	.byte	0x2
	.uleb128 0x19a
	.string	"OK"
	.byte	0x5
	.uleb128 0x19b
	.long	.LASF1892
	.byte	0x5
	.uleb128 0x19e
	.long	.LASF1893
	.byte	0x5
	.uleb128 0x19f
	.long	.LASF1894
	.byte	0x5
	.uleb128 0x1a0
	.long	.LASF1895
	.byte	0x5
	.uleb128 0x1a1
	.long	.LASF1896
	.byte	0x5
	.uleb128 0x1a2
	.long	.LASF1897
	.byte	0x5
	.uleb128 0x1a3
	.long	.LASF1898
	.byte	0x5
	.uleb128 0x1a4
	.long	.LASF1899
	.byte	0x5
	.uleb128 0x1aa
	.long	.LASF1900
	.byte	0x5
	.uleb128 0x1b0
	.long	.LASF1901
	.byte	0x5
	.uleb128 0x234
	.long	.LASF1902
	.byte	0x5
	.uleb128 0x23c
	.long	.LASF1903
	.byte	0x5
	.uleb128 0x243
	.long	.LASF1904
	.byte	0x5
	.uleb128 0x247
	.long	.LASF1905
	.byte	0x6
	.uleb128 0x24a
	.long	.LASF1906
	.byte	0x5
	.uleb128 0x24c
	.long	.LASF1907
	.byte	0x5
	.uleb128 0x395
	.long	.LASF1908
	.byte	0x6
	.uleb128 0x39c
	.long	.LASF1909
	.byte	0x5
	.uleb128 0x39d
	.long	.LASF1910
	.byte	0x6
	.uleb128 0x3da
	.long	.LASF1911
	.byte	0x5
	.uleb128 0x3db
	.long	.LASF1912
	.byte	0x5
	.uleb128 0x3dc
	.long	.LASF1913
	.byte	0x5
	.uleb128 0x3df
	.long	.LASF1914
	.byte	0x5
	.uleb128 0x44f
	.long	.LASF1915
	.byte	0x5
	.uleb128 0x450
	.long	.LASF1916
	.byte	0x5
	.uleb128 0x452
	.long	.LASF1917
	.byte	0x5
	.uleb128 0x453
	.long	.LASF1918
	.byte	0x5
	.uleb128 0x454
	.long	.LASF1919
	.byte	0x5
	.uleb128 0x455
	.long	.LASF1920
	.byte	0x5
	.uleb128 0x456
	.long	.LASF1921
	.byte	0x5
	.uleb128 0x457
	.long	.LASF1922
	.byte	0x5
	.uleb128 0x458
	.long	.LASF1923
	.byte	0x5
	.uleb128 0x459
	.long	.LASF1924
	.byte	0x5
	.uleb128 0x45a
	.long	.LASF1925
	.byte	0x5
	.uleb128 0x45b
	.long	.LASF1926
	.byte	0x5
	.uleb128 0x45c
	.long	.LASF1927
	.byte	0x5
	.uleb128 0x45d
	.long	.LASF1928
	.byte	0x5
	.uleb128 0x45e
	.long	.LASF1929
	.byte	0x5
	.uleb128 0x45f
	.long	.LASF1930
	.byte	0x5
	.uleb128 0x460
	.long	.LASF1931
	.byte	0x5
	.uleb128 0x461
	.long	.LASF1932
	.byte	0x5
	.uleb128 0x462
	.long	.LASF1933
	.byte	0x5
	.uleb128 0x463
	.long	.LASF1934
	.byte	0x5
	.uleb128 0x464
	.long	.LASF1935
	.byte	0x5
	.uleb128 0x467
	.long	.LASF1936
	.byte	0x5
	.uleb128 0x474
	.long	.LASF1937
	.byte	0x5
	.uleb128 0x475
	.long	.LASF1938
	.byte	0x5
	.uleb128 0x476
	.long	.LASF1939
	.byte	0x5
	.uleb128 0x477
	.long	.LASF1940
	.byte	0x5
	.uleb128 0x479
	.long	.LASF1941
	.byte	0x5
	.uleb128 0x481
	.long	.LASF1942
	.byte	0x5
	.uleb128 0x491
	.long	.LASF1943
	.byte	0x5
	.uleb128 0x492
	.long	.LASF1944
	.byte	0x5
	.uleb128 0x494
	.long	.LASF1945
	.byte	0x5
	.uleb128 0x496
	.long	.LASF1946
	.byte	0x5
	.uleb128 0x497
	.long	.LASF1947
	.byte	0x5
	.uleb128 0x498
	.long	.LASF1948
	.byte	0x5
	.uleb128 0x499
	.long	.LASF1949
	.byte	0x5
	.uleb128 0x49a
	.long	.LASF1950
	.byte	0x5
	.uleb128 0x49b
	.long	.LASF1951
	.byte	0x5
	.uleb128 0x49f
	.long	.LASF1952
	.byte	0x5
	.uleb128 0x4a0
	.long	.LASF1953
	.byte	0x5
	.uleb128 0x4a1
	.long	.LASF1954
	.byte	0x5
	.uleb128 0x4a2
	.long	.LASF1955
	.byte	0x5
	.uleb128 0x4a3
	.long	.LASF1956
	.byte	0x5
	.uleb128 0x4a4
	.long	.LASF1957
	.byte	0x5
	.uleb128 0x4a5
	.long	.LASF1958
	.byte	0x5
	.uleb128 0x4a6
	.long	.LASF1959
	.byte	0x5
	.uleb128 0x4a7
	.long	.LASF1960
	.byte	0x5
	.uleb128 0x4aa
	.long	.LASF1961
	.byte	0x5
	.uleb128 0x4ab
	.long	.LASF1962
	.byte	0x5
	.uleb128 0x4ad
	.long	.LASF1963
	.byte	0x5
	.uleb128 0x4ae
	.long	.LASF1964
	.byte	0x5
	.uleb128 0x4c3
	.long	.LASF1965
	.byte	0x5
	.uleb128 0x4c5
	.long	.LASF1966
	.byte	0x5
	.uleb128 0x4c6
	.long	.LASF1967
	.byte	0x5
	.uleb128 0x4c7
	.long	.LASF1968
	.byte	0x5
	.uleb128 0x4c9
	.long	.LASF1969
	.byte	0x5
	.uleb128 0x4ca
	.long	.LASF1970
	.byte	0x5
	.uleb128 0x4cb
	.long	.LASF1971
	.byte	0x5
	.uleb128 0x4cc
	.long	.LASF1972
	.byte	0x5
	.uleb128 0x4ce
	.long	.LASF1973
	.byte	0x5
	.uleb128 0x4cf
	.long	.LASF1974
	.byte	0x5
	.uleb128 0x4d0
	.long	.LASF1975
	.byte	0x5
	.uleb128 0x4d3
	.long	.LASF1976
	.byte	0x5
	.uleb128 0x4d6
	.long	.LASF1977
	.byte	0x5
	.uleb128 0x4d7
	.long	.LASF1978
	.byte	0x5
	.uleb128 0x4dc
	.long	.LASF1979
	.byte	0x5
	.uleb128 0x4dd
	.long	.LASF1980
	.byte	0x5
	.uleb128 0x4e3
	.long	.LASF1981
	.byte	0x5
	.uleb128 0x4e4
	.long	.LASF1982
	.byte	0x5
	.uleb128 0x4e5
	.long	.LASF1983
	.byte	0x5
	.uleb128 0x4e6
	.long	.LASF1984
	.byte	0x5
	.uleb128 0x4e7
	.long	.LASF1985
	.byte	0x5
	.uleb128 0x4e8
	.long	.LASF1986
	.byte	0x5
	.uleb128 0x4e9
	.long	.LASF1987
	.byte	0x5
	.uleb128 0x4ea
	.long	.LASF1988
	.byte	0x5
	.uleb128 0x4eb
	.long	.LASF1989
	.byte	0x5
	.uleb128 0x4ec
	.long	.LASF1990
	.byte	0x5
	.uleb128 0x4ed
	.long	.LASF1991
	.byte	0x5
	.uleb128 0x4ee
	.long	.LASF1992
	.byte	0x5
	.uleb128 0x4ef
	.long	.LASF1993
	.byte	0x5
	.uleb128 0x4f0
	.long	.LASF1994
	.byte	0x5
	.uleb128 0x4f1
	.long	.LASF1995
	.byte	0x5
	.uleb128 0x4f2
	.long	.LASF1996
	.byte	0x5
	.uleb128 0x4f3
	.long	.LASF1997
	.byte	0x5
	.uleb128 0x4f4
	.long	.LASF1998
	.byte	0x5
	.uleb128 0x4f5
	.long	.LASF1999
	.byte	0x5
	.uleb128 0x4f6
	.long	.LASF2000
	.byte	0x5
	.uleb128 0x4f7
	.long	.LASF2001
	.byte	0x5
	.uleb128 0x4f8
	.long	.LASF2002
	.byte	0x5
	.uleb128 0x4f9
	.long	.LASF2003
	.byte	0x5
	.uleb128 0x4fa
	.long	.LASF2004
	.byte	0x5
	.uleb128 0x4fb
	.long	.LASF2005
	.byte	0x5
	.uleb128 0x4fc
	.long	.LASF2006
	.byte	0x5
	.uleb128 0x4fd
	.long	.LASF2007
	.byte	0x5
	.uleb128 0x4fe
	.long	.LASF2008
	.byte	0x5
	.uleb128 0x4ff
	.long	.LASF2009
	.byte	0x5
	.uleb128 0x500
	.long	.LASF2010
	.byte	0x5
	.uleb128 0x501
	.long	.LASF2011
	.byte	0x5
	.uleb128 0x502
	.long	.LASF2012
	.byte	0x5
	.uleb128 0x503
	.long	.LASF2013
	.byte	0x5
	.uleb128 0x504
	.long	.LASF2014
	.byte	0x5
	.uleb128 0x505
	.long	.LASF2015
	.byte	0x5
	.uleb128 0x506
	.long	.LASF2016
	.byte	0x5
	.uleb128 0x507
	.long	.LASF2017
	.byte	0x5
	.uleb128 0x508
	.long	.LASF2018
	.byte	0x5
	.uleb128 0x509
	.long	.LASF2019
	.byte	0x5
	.uleb128 0x50a
	.long	.LASF2020
	.byte	0x5
	.uleb128 0x50b
	.long	.LASF2021
	.byte	0x5
	.uleb128 0x50c
	.long	.LASF2022
	.byte	0x5
	.uleb128 0x50d
	.long	.LASF2023
	.byte	0x5
	.uleb128 0x50e
	.long	.LASF2024
	.byte	0x5
	.uleb128 0x514
	.long	.LASF2025
	.byte	0x5
	.uleb128 0x515
	.long	.LASF2026
	.byte	0x5
	.uleb128 0x516
	.long	.LASF2027
	.byte	0x5
	.uleb128 0x517
	.long	.LASF2028
	.byte	0x5
	.uleb128 0x518
	.long	.LASF2029
	.byte	0x5
	.uleb128 0x519
	.long	.LASF2030
	.byte	0x5
	.uleb128 0x51a
	.long	.LASF2031
	.byte	0x5
	.uleb128 0x51b
	.long	.LASF2032
	.byte	0x5
	.uleb128 0x51c
	.long	.LASF2033
	.byte	0x5
	.uleb128 0x51d
	.long	.LASF2034
	.byte	0x5
	.uleb128 0x51e
	.long	.LASF2035
	.byte	0x5
	.uleb128 0x51f
	.long	.LASF2036
	.byte	0x5
	.uleb128 0x520
	.long	.LASF2037
	.byte	0x5
	.uleb128 0x521
	.long	.LASF2038
	.byte	0x5
	.uleb128 0x522
	.long	.LASF2039
	.byte	0x5
	.uleb128 0x523
	.long	.LASF2040
	.byte	0x5
	.uleb128 0x524
	.long	.LASF2041
	.byte	0x5
	.uleb128 0x525
	.long	.LASF2042
	.byte	0x5
	.uleb128 0x526
	.long	.LASF2043
	.byte	0x5
	.uleb128 0x527
	.long	.LASF2044
	.byte	0x5
	.uleb128 0x529
	.long	.LASF2045
	.byte	0x5
	.uleb128 0x52a
	.long	.LASF2046
	.byte	0x5
	.uleb128 0x52b
	.long	.LASF2047
	.byte	0x5
	.uleb128 0x52c
	.long	.LASF2048
	.byte	0x5
	.uleb128 0x52d
	.long	.LASF2049
	.byte	0x5
	.uleb128 0x52e
	.long	.LASF2050
	.byte	0x5
	.uleb128 0x52f
	.long	.LASF2051
	.byte	0x5
	.uleb128 0x530
	.long	.LASF2052
	.byte	0x5
	.uleb128 0x531
	.long	.LASF2053
	.byte	0x5
	.uleb128 0x532
	.long	.LASF2054
	.byte	0x5
	.uleb128 0x533
	.long	.LASF2055
	.byte	0x5
	.uleb128 0x534
	.long	.LASF2056
	.byte	0x5
	.uleb128 0x535
	.long	.LASF2057
	.byte	0x5
	.uleb128 0x536
	.long	.LASF2058
	.byte	0x5
	.uleb128 0x537
	.long	.LASF2059
	.byte	0x5
	.uleb128 0x538
	.long	.LASF2060
	.byte	0x5
	.uleb128 0x539
	.long	.LASF2061
	.byte	0x5
	.uleb128 0x53a
	.long	.LASF2062
	.byte	0x5
	.uleb128 0x53b
	.long	.LASF2063
	.byte	0x5
	.uleb128 0x53c
	.long	.LASF2064
	.byte	0x5
	.uleb128 0x542
	.long	.LASF2065
	.byte	0x5
	.uleb128 0x545
	.long	.LASF2066
	.byte	0x5
	.uleb128 0x546
	.long	.LASF2067
	.byte	0x5
	.uleb128 0x589
	.long	.LASF2068
	.byte	0x5
	.uleb128 0x58a
	.long	.LASF2069
	.byte	0x5
	.uleb128 0x58b
	.long	.LASF2070
	.byte	0x5
	.uleb128 0x58c
	.long	.LASF2071
	.byte	0x5
	.uleb128 0x58d
	.long	.LASF2072
	.byte	0x5
	.uleb128 0x58e
	.long	.LASF2073
	.byte	0x5
	.uleb128 0x58f
	.long	.LASF2074
	.byte	0x5
	.uleb128 0x590
	.long	.LASF2075
	.byte	0x5
	.uleb128 0x591
	.long	.LASF2076
	.byte	0x5
	.uleb128 0x592
	.long	.LASF2077
	.byte	0x5
	.uleb128 0x593
	.long	.LASF2078
	.byte	0x5
	.uleb128 0x594
	.long	.LASF2079
	.byte	0x5
	.uleb128 0x595
	.long	.LASF2080
	.byte	0x5
	.uleb128 0x596
	.long	.LASF2081
	.byte	0x5
	.uleb128 0x597
	.long	.LASF2082
	.byte	0x5
	.uleb128 0x59f
	.long	.LASF2083
	.byte	0x5
	.uleb128 0x5de
	.long	.LASF2084
	.byte	0x5
	.uleb128 0x5df
	.long	.LASF2085
	.byte	0x5
	.uleb128 0x5e0
	.long	.LASF2086
	.byte	0x5
	.uleb128 0x5e1
	.long	.LASF2087
	.byte	0x5
	.uleb128 0x5e2
	.long	.LASF2088
	.byte	0x5
	.uleb128 0x5e6
	.long	.LASF2089
	.byte	0x5
	.uleb128 0x5e7
	.long	.LASF2090
	.byte	0x5
	.uleb128 0x5e8
	.long	.LASF2091
	.byte	0x5
	.uleb128 0x5e9
	.long	.LASF2092
	.byte	0x5
	.uleb128 0x5ea
	.long	.LASF2093
	.byte	0x5
	.uleb128 0x5eb
	.long	.LASF2094
	.byte	0x5
	.uleb128 0x5ec
	.long	.LASF2095
	.byte	0x5
	.uleb128 0x5ed
	.long	.LASF2096
	.byte	0x5
	.uleb128 0x5ee
	.long	.LASF2097
	.byte	0x5
	.uleb128 0x5ef
	.long	.LASF2098
	.byte	0x5
	.uleb128 0x5f0
	.long	.LASF2099
	.byte	0x5
	.uleb128 0x5f1
	.long	.LASF2100
	.byte	0x5
	.uleb128 0x5f2
	.long	.LASF2101
	.byte	0x5
	.uleb128 0x5f3
	.long	.LASF2102
	.byte	0x5
	.uleb128 0x5f4
	.long	.LASF2103
	.byte	0x5
	.uleb128 0x5f5
	.long	.LASF2104
	.byte	0x5
	.uleb128 0x5f6
	.long	.LASF2105
	.byte	0x5
	.uleb128 0x5f7
	.long	.LASF2106
	.byte	0x5
	.uleb128 0x5f8
	.long	.LASF2107
	.byte	0x5
	.uleb128 0x5f9
	.long	.LASF2108
	.byte	0x5
	.uleb128 0x5fa
	.long	.LASF2109
	.byte	0x5
	.uleb128 0x5fb
	.long	.LASF2110
	.byte	0x5
	.uleb128 0x5fc
	.long	.LASF2111
	.byte	0x5
	.uleb128 0x5fd
	.long	.LASF2112
	.byte	0x5
	.uleb128 0x5fe
	.long	.LASF2113
	.byte	0x5
	.uleb128 0x5ff
	.long	.LASF2114
	.byte	0x5
	.uleb128 0x600
	.long	.LASF2115
	.byte	0x5
	.uleb128 0x601
	.long	.LASF2116
	.byte	0x5
	.uleb128 0x602
	.long	.LASF2117
	.byte	0x5
	.uleb128 0x603
	.long	.LASF2118
	.byte	0x5
	.uleb128 0x604
	.long	.LASF2119
	.byte	0x5
	.uleb128 0x605
	.long	.LASF2120
	.byte	0x5
	.uleb128 0x606
	.long	.LASF2121
	.byte	0x5
	.uleb128 0x607
	.long	.LASF2122
	.byte	0x5
	.uleb128 0x608
	.long	.LASF2123
	.byte	0x5
	.uleb128 0x609
	.long	.LASF2124
	.byte	0x5
	.uleb128 0x60a
	.long	.LASF2125
	.byte	0x5
	.uleb128 0x60b
	.long	.LASF2126
	.byte	0x5
	.uleb128 0x60c
	.long	.LASF2127
	.byte	0x5
	.uleb128 0x60d
	.long	.LASF2128
	.byte	0x5
	.uleb128 0x60e
	.long	.LASF2129
	.byte	0x5
	.uleb128 0x60f
	.long	.LASF2130
	.byte	0x5
	.uleb128 0x610
	.long	.LASF2131
	.byte	0x5
	.uleb128 0x611
	.long	.LASF2132
	.byte	0x5
	.uleb128 0x612
	.long	.LASF2133
	.byte	0x5
	.uleb128 0x613
	.long	.LASF2134
	.byte	0x5
	.uleb128 0x614
	.long	.LASF2135
	.byte	0x5
	.uleb128 0x615
	.long	.LASF2136
	.byte	0x5
	.uleb128 0x616
	.long	.LASF2137
	.byte	0x5
	.uleb128 0x617
	.long	.LASF2138
	.byte	0x5
	.uleb128 0x618
	.long	.LASF2139
	.byte	0x5
	.uleb128 0x619
	.long	.LASF2140
	.byte	0x5
	.uleb128 0x61a
	.long	.LASF2141
	.byte	0x5
	.uleb128 0x61b
	.long	.LASF2142
	.byte	0x5
	.uleb128 0x61c
	.long	.LASF2143
	.byte	0x5
	.uleb128 0x61d
	.long	.LASF2144
	.byte	0x5
	.uleb128 0x61e
	.long	.LASF2145
	.byte	0x5
	.uleb128 0x61f
	.long	.LASF2146
	.byte	0x5
	.uleb128 0x620
	.long	.LASF2147
	.byte	0x5
	.uleb128 0x621
	.long	.LASF2148
	.byte	0x5
	.uleb128 0x622
	.long	.LASF2149
	.byte	0x5
	.uleb128 0x623
	.long	.LASF2150
	.byte	0x5
	.uleb128 0x624
	.long	.LASF2151
	.byte	0x5
	.uleb128 0x625
	.long	.LASF2152
	.byte	0x5
	.uleb128 0x626
	.long	.LASF2153
	.byte	0x5
	.uleb128 0x627
	.long	.LASF2154
	.byte	0x5
	.uleb128 0x628
	.long	.LASF2155
	.byte	0x5
	.uleb128 0x629
	.long	.LASF2156
	.byte	0x5
	.uleb128 0x62a
	.long	.LASF2157
	.byte	0x5
	.uleb128 0x62b
	.long	.LASF2158
	.byte	0x5
	.uleb128 0x62c
	.long	.LASF2159
	.byte	0x5
	.uleb128 0x62d
	.long	.LASF2160
	.byte	0x5
	.uleb128 0x62e
	.long	.LASF2161
	.byte	0x5
	.uleb128 0x62f
	.long	.LASF2162
	.byte	0x5
	.uleb128 0x630
	.long	.LASF2163
	.byte	0x5
	.uleb128 0x631
	.long	.LASF2164
	.byte	0x5
	.uleb128 0x632
	.long	.LASF2165
	.byte	0x5
	.uleb128 0x633
	.long	.LASF2166
	.byte	0x5
	.uleb128 0x634
	.long	.LASF2167
	.byte	0x5
	.uleb128 0x635
	.long	.LASF2168
	.byte	0x5
	.uleb128 0x636
	.long	.LASF2169
	.byte	0x5
	.uleb128 0x637
	.long	.LASF2170
	.byte	0x5
	.uleb128 0x638
	.long	.LASF2171
	.byte	0x5
	.uleb128 0x639
	.long	.LASF2172
	.byte	0x5
	.uleb128 0x63a
	.long	.LASF2173
	.byte	0x5
	.uleb128 0x63b
	.long	.LASF2174
	.byte	0x5
	.uleb128 0x63c
	.long	.LASF2175
	.byte	0x5
	.uleb128 0x63d
	.long	.LASF2176
	.byte	0x5
	.uleb128 0x640
	.long	.LASF2177
	.byte	0x5
	.uleb128 0x643
	.long	.LASF2178
	.byte	0x5
	.uleb128 0x64a
	.long	.LASF2179
	.byte	0x5
	.uleb128 0x788
	.long	.LASF2180
	.byte	0x5
	.uleb128 0x78d
	.long	.LASF2181
	.byte	0x5
	.uleb128 0x78e
	.long	.LASF2182
	.byte	0x5
	.uleb128 0x78f
	.long	.LASF2183
	.byte	0x5
	.uleb128 0x790
	.long	.LASF2184
	.byte	0x5
	.uleb128 0x791
	.long	.LASF2185
	.byte	0x5
	.uleb128 0x792
	.long	.LASF2186
	.byte	0x5
	.uleb128 0x795
	.long	.LASF2187
	.byte	0x5
	.uleb128 0x796
	.long	.LASF2188
	.byte	0x5
	.uleb128 0x797
	.long	.LASF2189
	.byte	0x5
	.uleb128 0x798
	.long	.LASF2190
	.byte	0x5
	.uleb128 0x799
	.long	.LASF2191
	.byte	0x5
	.uleb128 0x79b
	.long	.LASF2192
	.byte	0x5
	.uleb128 0x79c
	.long	.LASF2193
	.byte	0x5
	.uleb128 0x79d
	.long	.LASF2194
	.byte	0x5
	.uleb128 0x79e
	.long	.LASF2195
	.byte	0x5
	.uleb128 0x79f
	.long	.LASF2196
	.byte	0x5
	.uleb128 0x7a1
	.long	.LASF2197
	.byte	0x5
	.uleb128 0x7a2
	.long	.LASF2198
	.byte	0x5
	.uleb128 0x7a3
	.long	.LASF2199
	.byte	0x5
	.uleb128 0x7a4
	.long	.LASF2200
	.byte	0x5
	.uleb128 0x7a5
	.long	.LASF2201
	.byte	0x5
	.uleb128 0x7a7
	.long	.LASF2202
	.byte	0x5
	.uleb128 0x7a8
	.long	.LASF2203
	.byte	0x5
	.uleb128 0x7a9
	.long	.LASF2204
	.byte	0x5
	.uleb128 0x7aa
	.long	.LASF2205
	.byte	0x5
	.uleb128 0x7ab
	.long	.LASF2206
	.byte	0x5
	.uleb128 0x7b3
	.long	.LASF2207
	.byte	0x5
	.uleb128 0x7b4
	.long	.LASF2208
	.byte	0x5
	.uleb128 0x7b5
	.long	.LASF2209
	.byte	0x5
	.uleb128 0x7b6
	.long	.LASF2210
	.byte	0x5
	.uleb128 0x7b7
	.long	.LASF2211
	.byte	0x5
	.uleb128 0x7b9
	.long	.LASF2212
	.byte	0x5
	.uleb128 0x7ba
	.long	.LASF2213
	.byte	0x5
	.uleb128 0x7bb
	.long	.LASF2214
	.byte	0x5
	.uleb128 0x7bc
	.long	.LASF2215
	.byte	0x5
	.uleb128 0x7cc
	.long	.LASF2216
	.byte	0x5
	.uleb128 0x7cf
	.long	.LASF2217
	.byte	0x5
	.uleb128 0x7d0
	.long	.LASF2218
	.byte	0x5
	.uleb128 0x7d1
	.long	.LASF2219
	.byte	0x5
	.uleb128 0x7d2
	.long	.LASF2220
	.byte	0x5
	.uleb128 0x7d3
	.long	.LASF2221
	.byte	0x5
	.uleb128 0x7d4
	.long	.LASF2222
	.byte	0x5
	.uleb128 0x7f0
	.long	.LASF2223
	.byte	0x5
	.uleb128 0x80b
	.long	.LASF2224
	.byte	0x5
	.uleb128 0x80c
	.long	.LASF2225
	.byte	0x5
	.uleb128 0x812
	.long	.LASF2226
	.byte	0x5
	.uleb128 0x813
	.long	.LASF2227
	.byte	0x5
	.uleb128 0x814
	.long	.LASF2228
	.byte	0x5
	.uleb128 0x815
	.long	.LASF2229
	.byte	0x5
	.uleb128 0x816
	.long	.LASF2230
	.byte	0x5
	.uleb128 0x817
	.long	.LASF2231
	.byte	0x5
	.uleb128 0x818
	.long	.LASF2232
	.byte	0x5
	.uleb128 0x819
	.long	.LASF2233
	.byte	0x5
	.uleb128 0x81a
	.long	.LASF2234
	.byte	0x5
	.uleb128 0x81b
	.long	.LASF2235
	.byte	0x5
	.uleb128 0x81c
	.long	.LASF2236
	.byte	0x5
	.uleb128 0x81d
	.long	.LASF2237
	.byte	0x5
	.uleb128 0x81e
	.long	.LASF2238
	.byte	0x5
	.uleb128 0x81f
	.long	.LASF2239
	.byte	0x5
	.uleb128 0x820
	.long	.LASF2240
	.byte	0x5
	.uleb128 0x822
	.long	.LASF2241
	.byte	0x5
	.uleb128 0x823
	.long	.LASF2242
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.unctrl.h.46.c707778f5afc46808288a843c83a4633,comdat
.Ldebug_macro81:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF2243
	.byte	0x6
	.uleb128 0x30
	.long	.LASF1756
	.byte	0x5
	.uleb128 0x31
	.long	.LASF1757
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.cpumonlib.h.3.02eaf6afe85a1ee5acd07b0e880f112e,comdat
.Ldebug_macro82:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x3
	.long	.LASF2246
	.byte	0x5
	.uleb128 0x6
	.long	.LASF2247
	.byte	0x5
	.uleb128 0x7
	.long	.LASF2248
	.byte	0x5
	.uleb128 0x8
	.long	.LASF2249
	.byte	0x5
	.uleb128 0x9
	.long	.LASF2250
	.byte	0x5
	.uleb128 0xa
	.long	.LASF2251
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.machine_specific_registers.h.3.d2e1d0b1ada7d991f2dcf44fe45b2999,comdat
.Ldebug_macro83:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x3
	.long	.LASF2252
	.byte	0x5
	.uleb128 0x5
	.long	.LASF2253
	.byte	0x5
	.uleb128 0x6
	.long	.LASF2251
	.byte	0x5
	.uleb128 0xa
	.long	.LASF2254
	.byte	0x5
	.uleb128 0xb
	.long	.LASF2255
	.byte	0x5
	.uleb128 0xc
	.long	.LASF2256
	.byte	0x5
	.uleb128 0xd
	.long	.LASF2257
	.byte	0x5
	.uleb128 0xe
	.long	.LASF2258
	.byte	0x5
	.uleb128 0xf
	.long	.LASF2259
	.byte	0x5
	.uleb128 0x11
	.long	.LASF2260
	.byte	0x5
	.uleb128 0x12
	.long	.LASF2261
	.byte	0x5
	.uleb128 0x13
	.long	.LASF2262
	.byte	0x5
	.uleb128 0x15
	.long	.LASF2263
	.byte	0x5
	.uleb128 0x16
	.long	.LASF2264
	.byte	0x5
	.uleb128 0x17
	.long	.LASF2265
	.byte	0x5
	.uleb128 0x18
	.long	.LASF2266
	.byte	0x5
	.uleb128 0x19
	.long	.LASF2267
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF2268
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF2269
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF2270
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF2271
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF2272
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF2273
	.byte	0x5
	.uleb128 0x20
	.long	.LASF2274
	.byte	0x5
	.uleb128 0x22
	.long	.LASF2275
	.byte	0x5
	.uleb128 0x24
	.long	.LASF2276
	.byte	0x5
	.uleb128 0x29
	.long	.LASF2277
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF2278
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF2279
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF2280
	.byte	0x5
	.uleb128 0x30
	.long	.LASF2281
	.byte	0x5
	.uleb128 0x31
	.long	.LASF2282
	.byte	0x5
	.uleb128 0x32
	.long	.LASF2283
	.byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF2494:
	.string	"_SC_THREAD_SPORADIC_SERVER"
.LASF1977:
	.string	"waddstr(win,str) waddnstr(win,str,-1)"
.LASF2156:
	.string	"KEY_SFIND 0605"
.LASF743:
	.string	"__ldiv_t_defined 1"
.LASF2254:
	.string	"MSR_PERF_STATUS 0x198"
.LASF997:
	.string	"_POSIX_THREADS 200809L"
.LASF2247:
	.string	"AVG_WINDOW 60"
.LASF1412:
	.string	"__DECL_SIMD_logf "
.LASF1456:
	.string	"__DECL_SIMD_atanf64 "
.LASF280:
	.string	"__FLT64X_HAS_QUIET_NAN__ 1"
.LASF2119:
	.string	"KEY_C3 0540"
.LASF1617:
	.string	"__DECL_SIMD_tanhf128 "
.LASF36:
	.string	"__FLOAT_WORD_ORDER__ __ORDER_LITTLE_ENDIAN__"
.LASF1882:
	.string	"ACS_BBSS ACS_URCORNER"
.LASF1645:
	.string	"__DECL_SIMD_tanf32 "
.LASF109:
	.string	"__UINT16_MAX__ 0xffff"
.LASF2192:
	.string	"BUTTON2_RELEASED NCURSES_MOUSE_MASK(2, NCURSES_BUTTON_RELEASED)"
.LASF2383:
	.string	"_SC_2_SW_DEV"
.LASF832:
	.string	"__SIZEOF_PTHREAD_CONDATTR_T 4"
.LASF1049:
	.string	"__ILP32_OFF32_CFLAGS \"-m32\""
.LASF1812:
	.string	"FALSE 0"
.LASF2325:
	.string	"_unused2"
.LASF1362:
	.string	"_CS_POSIX_V7_ILP32_OFFBIG_LINTFLAGS _CS_POSIX_V7_ILP32_OFFBIG_LINTFLAGS"
.LASF2343:
	.string	"_SC_TIMERS"
.LASF2594:
	.string	"setlocale"
.LASF1628:
	.string	"__DECL_SIMD_asinhf32x "
.LASF1132:
	.string	"_SC_LINE_MAX _SC_LINE_MAX"
.LASF1180:
	.string	"_SC_XOPEN_XCU_VERSION _SC_XOPEN_XCU_VERSION"
.LASF203:
	.string	"__FLT32_DIG__ 6"
.LASF706:
	.string	"_WCHAR_T_DEFINED "
.LASF1745:
	.string	"isgreaterequal(x,y) __builtin_isgreaterequal(x, y)"
.LASF2311:
	.string	"_fileno"
.LASF1773:
	.string	"NCURSES_INLINE inline"
.LASF437:
	.string	"__glibc_has_attribute(attr) __has_attribute (attr)"
.LASF1090:
	.string	"_SC_CLK_TCK _SC_CLK_TCK"
.LASF1088:
	.string	"_SC_ARG_MAX _SC_ARG_MAX"
.LASF2490:
	.string	"_SC_SHELL"
.LASF1965:
	.string	"scroll(win) wscrl(win,1)"
.LASF1293:
	.string	"_SC_V7_ILP32_OFFBIG _SC_V7_ILP32_OFFBIG"
.LASF2351:
	.string	"_SC_MEMORY_PROTECTION"
.LASF470:
	.string	"__ASMNAME(cname) __ASMNAME2 (__USER_LABEL_PREFIX__, cname)"
.LASF2444:
	.string	"_SC_SCHAR_MAX"
.LASF25:
	.string	"__SIZEOF_SHORT__ 2"
.LASF2028:
	.string	"mvwaddnstr(win,y,x,str,n) (wmove((win),(y),(x)) == ERR ? ERR : waddnstr((win),(str),(n)))"
.LASF218:
	.string	"__FLT64_MANT_DIG__ 53"
.LASF1757:
	.string	"NCURSES_VERSION \"6.3\""
.LASF368:
	.string	"__GLIBC_INTERNAL_STARTING_HEADER_IMPLEMENTATION "
.LASF1449:
	.string	"__DECL_SIMD_acosf64x "
.LASF1127:
	.string	"_SC_BC_SCALE_MAX _SC_BC_SCALE_MAX"
.LASF158:
	.string	"__FLT_MAX_10_EXP__ 38"
.LASF576:
	.string	"__SQUAD_TYPE long int"
.LASF1950:
	.string	"nocrmode() nocbreak()"
.LASF1765:
	.string	"NCURSES_EXPORT_GENERAL_IMPORT "
.LASF1889:
	.string	"ACS_SBSB ACS_VLINE"
.LASF862:
	.string	"INT32_MIN (-2147483647-1)"
.LASF425:
	.string	"__USE_MISC 1"
.LASF769:
	.string	"__LITTLE_ENDIAN 1234"
.LASF2448:
	.string	"_SC_UCHAR_MAX"
.LASF1028:
	.string	"_POSIX_MESSAGE_PASSING 200809L"
.LASF1721:
	.string	"FP_NORMAL 4"
.LASF1585:
	.string	"__DECL_SIMD_atanhf32 "
.LASF1565:
	.string	"__DECL_SIMD_log2f32 "
.LASF1422:
	.string	"__DECL_SIMD_expf "
.LASF975:
	.string	"_XOPEN_XPG2 1"
.LASF1218:
	.string	"_SC_XBS5_LPBIG_OFFBIG _SC_XBS5_LPBIG_OFFBIG"
.LASF1060:
	.string	"R_OK 4"
.LASF757:
	.string	"__pid_t_defined "
.LASF768:
	.string	"_BITS_ENDIAN_H 1"
.LASF1159:
	.string	"_SC_GETGR_R_SIZE_MAX _SC_GETGR_R_SIZE_MAX"
.LASF1525:
	.string	"__DECL_SIMD_sinhf32 "
.LASF1929:
	.string	"A_PROTECT NCURSES_BITS(1U,16)"
.LASF494:
	.string	"__fortify_function __extern_always_inline __attribute_artificial__"
.LASF953:
	.string	"LC_COLLATE_MASK (1 << __LC_COLLATE)"
.LASF1641:
	.string	"__DECL_SIMD_tan "
.LASF221:
	.string	"__FLT64_MIN_10_EXP__ (-307)"
.LASF1626:
	.string	"__DECL_SIMD_asinhf64 "
.LASF720:
	.string	"WNOWAIT 0x01000000"
.LASF337:
	.string	"__ATOMIC_HLE_RELEASE 131072"
.LASF2197:
	.string	"BUTTON3_RELEASED NCURSES_MOUSE_MASK(3, NCURSES_BUTTON_RELEASED)"
.LASF85:
	.string	"__PTRDIFF_MAX__ 0x7fffffffffffffffL"
.LASF855:
	.string	"_BITS_WCHAR_H 1"
.LASF42:
	.string	"__WCHAR_TYPE__ int"
.LASF1771:
	.string	"NCURSES_CONST const"
.LASF0:
	.string	"__STDC__ 1"
.LASF2186:
	.string	"NCURSES_RESERVED_EVENT 040L"
.LASF2551:
	.string	"_Bool"
.LASF1380:
	.string	"_BITS_LIBM_SIMD_DECL_STUBS_H 1"
.LASF505:
	.string	"__LDBL_REDIR(name,proto) name proto"
.LASF26:
	.string	"__SIZEOF_FLOAT__ 4"
.LASF1668:
	.string	"__MATHDECL_1_IMPL(type,function,suffix,args) extern type __MATH_PRECNAME(function,suffix) args __THROW"
.LASF1119:
	.string	"_SC_PAGE_SIZE _SC_PAGESIZE"
.LASF141:
	.string	"__UINT_FAST16_MAX__ 0xffffffffffffffffUL"
.LASF297:
	.string	"__DEC128_MIN_EXP__ (-6142)"
.LASF1694:
	.string	"__MATH_PRECNAME(name,r) name ##f32x ##r"
.LASF1661:
	.string	"__SIMD_DECL(function) __CONCAT (__DECL_SIMD_, function)"
.LASF1330:
	.string	"_CS_XBS5_ILP32_OFFBIG_LINTFLAGS _CS_XBS5_ILP32_OFFBIG_LINTFLAGS"
.LASF1589:
	.string	"__DECL_SIMD_atanhf64x "
.LASF1431:
	.string	"__DECL_SIMD_pow "
.LASF441:
	.string	"__LEAF_ATTR __attribute__ ((__leaf__))"
.LASF2405:
	.string	"_SC_TTY_NAME_MAX"
.LASF245:
	.string	"__FLT128_DENORM_MIN__ 6.47517511943802511092443895822764655e-4966F128"
.LASF2421:
	.string	"_SC_PASS_MAX"
.LASF1517:
	.string	"__DECL_SIMD_expm1f128 "
.LASF1569:
	.string	"__DECL_SIMD_log2f64x "
.LASF174:
	.string	"__DBL_MAX_10_EXP__ 308"
.LASF487:
	.string	"__attribute_warn_unused_result__ __attribute__ ((__warn_unused_result__))"
.LASF2252:
	.string	"MACHINE_SPECIFIC_REGISTERS "
.LASF1242:
	.string	"_SC_NETWORKING _SC_NETWORKING"
.LASF2386:
	.string	"_SC_PII_XTI"
.LASF1289:
	.string	"_SC_LEVEL4_CACHE_LINESIZE _SC_LEVEL4_CACHE_LINESIZE"
.LASF2010:
	.string	"insch(c) winsch(stdscr,(c))"
.LASF458:
	.string	"__glibc_unsigned_or_positive(__l) ((__typeof (__l)) 0 < (__typeof (__l)) -1 || (__builtin_constant_p (__l) && (__l) > 0))"
.LASF1881:
	.string	"ACS_SSBB ACS_LLCORNER"
.LASF2015:
	.string	"instr(s) winstr(stdscr,(s))"
.LASF1120:
	.string	"_SC_RTSIG_MAX _SC_RTSIG_MAX"
.LASF2052:
	.string	"mvgetch(y,x) mvwgetch(stdscr,(y),(x))"
.LASF1798:
	.string	"_STDARG_H "
.LASF636:
	.string	"__getc_unlocked_body(_fp) (__glibc_unlikely ((_fp)->_IO_read_ptr >= (_fp)->_IO_read_end) ? __uflow (_fp) : *(unsigned char *) (_fp)->_IO_read_ptr++)"
.LASF428:
	.string	"__GLIBC_USE_DEPRECATED_GETS 0"
.LASF2316:
	.string	"_shortbuf"
.LASF2178:
	.string	"KEY_MAX 0777"
.LASF359:
	.string	"__ELF__ 1"
.LASF186:
	.string	"__LDBL_DIG__ 18"
.LASF2340:
	.string	"_SC_SAVED_IDS"
.LASF23:
	.string	"__SIZEOF_LONG__ 8"
.LASF1486:
	.string	"__DECL_SIMD_exp2f64 "
.LASF1685:
	.string	"__MATH_DECLARE_LDOUBLE 1"
.LASF1025:
	.string	"_POSIX_SPAWN 200809L"
.LASF2371:
	.string	"_SC_BC_STRING_MAX"
.LASF2106:
	.string	"KEY_SR 0521"
.LASF1804:
	.string	"__va_copy(d,s) __builtin_va_copy(d,s)"
.LASF1518:
	.string	"__DECL_SIMD_expm1f32x "
.LASF1426:
	.string	"__DECL_SIMD_expf64 "
.LASF2516:
	.string	"_SC_TRACE_INHERIT"
.LASF714:
	.string	"_STDLIB_H 1"
.LASF1253:
	.string	"_SC_SYSTEM_DATABASE_R _SC_SYSTEM_DATABASE_R"
.LASF2613:
	.string	"GNU C17 11.4.0 -masm=intel -mtune=generic -march=x86-64 -g -g -ggdb3 -gdwarf-2 -O0 -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection"
.LASF567:
	.string	"__need___va_list"
.LASF1730:
	.string	"math_errhandling (MATH_ERRNO | MATH_ERREXCEPT)"
.LASF1664:
	.string	"__MATHCALL(function,suffix,args) __MATHDECL (_Mdouble_,function,suffix, args)"
.LASF1688:
	.string	"__MATH_DECLARING_FLOATN 1"
.LASF1592:
	.string	"__DECL_SIMD_acoshf "
.LASF2190:
	.string	"BUTTON1_DOUBLE_CLICKED NCURSES_MOUSE_MASK(1, NCURSES_DOUBLE_CLICKED)"
.LASF2353:
	.string	"_SC_SEMAPHORES"
.LASF1397:
	.string	"__DECL_SIMD_sinf128 "
.LASF1297:
	.string	"_SC_TRACE_EVENT_NAME_MAX _SC_TRACE_EVENT_NAME_MAX"
.LASF1570:
	.string	"__DECL_SIMD_log2f128x "
.LASF2373:
	.string	"_SC_EQUIV_CLASS_MAX"
.LASF88:
	.string	"__SHRT_WIDTH__ 16"
.LASF2055:
	.string	"mvhline(y,x,c,n) mvwhline(stdscr,(y),(x),(c),(n))"
.LASF1523:
	.string	"__DECL_SIMD_sinhl "
.LASF1446:
	.string	"__DECL_SIMD_acosf64 "
.LASF684:
	.string	"__HAVE_DISTINCT_FLOAT64X 0"
.LASF637:
	.string	"__putc_unlocked_body(_ch,_fp) (__glibc_unlikely ((_fp)->_IO_write_ptr >= (_fp)->_IO_write_end) ? __overflow (_fp, (unsigned char) (_ch)) : (unsigned char) (*(_fp)->_IO_write_ptr++ = (_ch)))"
.LASF1265:
	.string	"_SC_2_PBS_CHECKPOINT _SC_2_PBS_CHECKPOINT"
.LASF2352:
	.string	"_SC_MESSAGE_PASSING"
.LASF182:
	.string	"__DBL_HAS_INFINITY__ 1"
.LASF1385:
	.string	"__DECL_SIMD_cosf32 "
.LASF468:
	.string	"__REDIRECT_NTH(name,proto,alias) name proto __asm__ (__ASMNAME (#alias)) __THROW"
.LASF1334:
	.string	"_CS_XBS5_LP64_OFF64_LINTFLAGS _CS_XBS5_LP64_OFF64_LINTFLAGS"
.LASF1829:
	.string	"WA_ALTCHARSET A_ALTCHARSET"
.LASF1101:
	.string	"_SC_PRIORITIZED_IO _SC_PRIORITIZED_IO"
.LASF166:
	.string	"__FLT_HAS_INFINITY__ 1"
.LASF1410:
	.string	"__DECL_SIMD_sincosf128x "
.LASF237:
	.string	"__FLT128_MIN_10_EXP__ (-4931)"
.LASF1726:
	.string	"isnan(x) __builtin_isnan (x)"
.LASF1822:
	.string	"WA_NORMAL A_NORMAL"
.LASF1423:
	.string	"__DECL_SIMD_expl "
.LASF996:
	.string	"_XOPEN_SHM 1"
.LASF780:
	.string	"_BITS_BYTESWAP_H 1"
.LASF1531:
	.string	"__DECL_SIMD_cbrt "
.LASF355:
	.string	"linux 1"
.LASF290:
	.string	"__DEC64_MIN_EXP__ (-382)"
.LASF626:
	.string	"__FD_SETSIZE 1024"
.LASF584:
	.string	"__STD_TYPE typedef"
.LASF1989:
	.string	"attr_set(a,c,o) wattr_set(stdscr,(a),(c),(o))"
.LASF1662:
	.string	"__MATHCALL_VEC(function,suffix,args) __SIMD_DECL (__MATH_PRECNAME (function, suffix)) __MATHCALL (function, suffix, args)"
.LASF2171:
	.string	"KEY_SSAVE 0624"
.LASF1419:
	.string	"__DECL_SIMD_logf64x "
.LASF1211:
	.string	"_SC_NL_MSGMAX _SC_NL_MSGMAX"
.LASF443:
	.string	"__THROWNL __attribute__ ((__nothrow__))"
.LASF2264:
	.string	"PROCHOT 1"
.LASF2474:
	.string	"_SC_DEVICE_SPECIFIC"
.LASF2133:
	.string	"KEY_MOVE 0556"
.LASF2297:
	.string	"_flags"
.LASF2409:
	.string	"_SC_THREAD_THREADS_MAX"
.LASF2041:
	.string	"mvwinsnstr(win,y,x,s,n) (wmove((win),(y),(x)) == ERR ? ERR : winsnstr((win),(s),(n)))"
.LASF1543:
	.string	"__DECL_SIMD_atan2l "
.LASF1928:
	.string	"A_INVIS NCURSES_BITS(1U,15)"
.LASF2527:
	.string	"_SC_LEVEL3_CACHE_SIZE"
.LASF1976:
	.string	"redrawwin(win) wredrawln(win, 0, (NCURSES_OK_ADDR(win) ? (win)->_maxy+1 : -1))"
.LASF2167:
	.string	"KEY_SREDO 0620"
.LASF834:
	.string	"__SIZEOF_PTHREAD_BARRIERATTR_T 4"
.LASF555:
	.string	"_SIZE_T_DEFINED "
.LASF1724:
	.string	"isfinite(x) __builtin_isfinite (x)"
.LASF1248:
	.string	"_SC_SIGNALS _SC_SIGNALS"
.LASF2099:
	.string	"KEY_DC 0512"
.LASF2607:
	.string	"init_sensor"
.LASF1702:
	.string	"__MATHCALL_NARROW_ARGS_1 (_Marg_ __x)"
.LASF2116:
	.string	"KEY_A3 0535"
.LASF756:
	.string	"__uid_t_defined "
.LASF1071:
	.string	"_PC_PATH_MAX _PC_PATH_MAX"
.LASF888:
	.string	"INT_FAST8_MAX (127)"
.LASF573:
	.string	"__U32_TYPE unsigned int"
.LASF635:
	.string	"__struct_FILE_defined 1"
.LASF642:
	.string	"_IO_USER_LOCK 0x8000"
.LASF1395:
	.string	"__DECL_SIMD_sinf32 "
.LASF1369:
	.string	"_CS_POSIX_V7_LPBIG_OFFBIG_LIBS _CS_POSIX_V7_LPBIG_OFFBIG_LIBS"
.LASF2196:
	.string	"BUTTON2_TRIPLE_CLICKED NCURSES_MOUSE_MASK(2, NCURSES_TRIPLE_CLICKED)"
.LASF2069:
	.string	"is_idcok(win) (NCURSES_OK_ADDR(win) ? (win)->_idcok : FALSE)"
.LASF2468:
	.string	"_SC_C_LANG_SUPPORT"
.LASF1361:
	.string	"_CS_POSIX_V7_ILP32_OFFBIG_LIBS _CS_POSIX_V7_ILP32_OFFBIG_LIBS"
.LASF2586:
	.string	"get_sysfs_power_battery_w"
.LASF117:
	.string	"__INT_LEAST16_WIDTH__ 16"
.LASF2415:
	.string	"_SC_THREAD_PROCESS_SHARED"
.LASF1425:
	.string	"__DECL_SIMD_expf32 "
.LASF2339:
	.string	"_SC_JOB_CONTROL"
.LASF651:
	.string	"SEEK_SET 0"
.LASF2282:
	.string	"AMD_ENERGY_UNIT_MASK 0x1F00"
.LASF1632:
	.string	"__DECL_SIMD_erfcf "
.LASF389:
	.string	"__USE_MISC"
.LASF143:
	.string	"__UINT_FAST64_MAX__ 0xffffffffffffffffUL"
.LASF1718:
	.string	"FP_INFINITE 1"
.LASF1777:
	.string	"NCURSES_PAIRS_T short"
.LASF1074:
	.string	"_PC_NO_TRUNC _PC_NO_TRUNC"
.LASF1128:
	.string	"_SC_BC_STRING_MAX _SC_BC_STRING_MAX"
.LASF1034:
	.string	"_POSIX_RAW_SOCKETS 200809L"
.LASF1892:
	.string	"OK (0)"
.LASF643:
	.string	"_VA_LIST_DEFINED "
.LASF296:
	.string	"__DEC128_MANT_DIG__ 34"
.LASF755:
	.string	"__nlink_t_defined "
.LASF77:
	.string	"__SHRT_MAX__ 0x7fff"
.LASF1022:
	.string	"_POSIX_SHELL 1"
.LASF1907:
	.string	"GCC_DEPRECATED(msg) __attribute__((deprecated))"
.LASF992:
	.string	"_POSIX_VDISABLE '\\0'"
.LASF73:
	.string	"__INTPTR_TYPE__ long int"
.LASF697:
	.string	"__wchar_t__ "
.LASF341:
	.string	"__code_model_small__ 1"
.LASF1414:
	.string	"__DECL_SIMD_logf16 "
.LASF2317:
	.string	"_lock"
.LASF928:
	.string	"__LC_MONETARY 4"
.LASF380:
	.string	"__USE_XOPEN_EXTENDED"
.LASF915:
	.string	"UINT8_C(c) c"
.LASF2587:
	.string	"get_max_value"
.LASF1044:
	.string	"_POSIX_V6_LPBIG_OFFBIG -1"
.LASF2023:
	.string	"wdeleteln(win) winsdelln(win,-1)"
.LASF1764:
	.string	"NCURSES_EXPORT_VAR(type) NCURSES_IMPEXP type"
.LASF506:
	.string	"__LDBL_REDIR1_NTH(name,proto,alias) name proto __THROW"
.LASF656:
	.string	"L_tmpnam 20"
.LASF593:
	.string	"__MODE_T_TYPE __U32_TYPE"
.LASF1296:
	.string	"_SC_SS_REPL_MAX _SC_SS_REPL_MAX"
.LASF691:
	.string	"__f64x(x) x ##f64x"
.LASF60:
	.string	"__INT_LEAST64_TYPE__ long int"
.LASF106:
	.string	"__INT32_MAX__ 0x7fffffff"
.LASF243:
	.string	"__FLT128_MIN__ 3.36210314311209350626267781732175260e-4932F128"
.LASF2008:
	.string	"inchstr(s) winchstr(stdscr,(s))"
.LASF1794:
	.string	"NCURSES_WCWIDTH_GRAPHICS 1"
.LASF2228:
	.string	"TRACE_TPUTS 0x0002"
.LASF1094:
	.string	"_SC_TZNAME_MAX _SC_TZNAME_MAX"
.LASF1470:
	.string	"__DECL_SIMD_asinf128x "
.LASF1367:
	.string	"_CS_POSIX_V7_LPBIG_OFFBIG_CFLAGS _CS_POSIX_V7_LPBIG_OFFBIG_CFLAGS"
.LASF1130:
	.string	"_SC_EQUIV_CLASS_MAX _SC_EQUIV_CLASS_MAX"
.LASF312:
	.string	"__GCC_ATOMIC_CHAR_LOCK_FREE 2"
.LASF1309:
	.string	"_CS_GNU_LIBC_VERSION _CS_GNU_LIBC_VERSION"
.LASF130:
	.string	"__UINT_LEAST64_MAX__ 0xffffffffffffffffUL"
.LASF955:
	.string	"LC_MESSAGES_MASK (1 << __LC_MESSAGES)"
.LASF71:
	.string	"__UINT_FAST32_TYPE__ long unsigned int"
.LASF1413:
	.string	"__DECL_SIMD_logl "
.LASF2262:
	.string	"PKG_POWER_LIMITATION_STATUS 1024"
.LASF1241:
	.string	"_SC_SINGLE_PROCESS _SC_SINGLE_PROCESS"
.LASF1339:
	.string	"_CS_POSIX_V6_ILP32_OFF32_CFLAGS _CS_POSIX_V6_ILP32_OFF32_CFLAGS"
.LASF622:
	.string	"__INO_T_MATCHES_INO64_T 1"
.LASF2529:
	.string	"_SC_LEVEL3_CACHE_LINESIZE"
.LASF1072:
	.string	"_PC_PIPE_BUF _PC_PIPE_BUF"
.LASF466:
	.string	"__glibc_c99_flexarr_available 1"
.LASF1966:
	.string	"touchwin(win) wtouchln((win), 0, getmaxy(win), 1)"
.LASF255:
	.string	"__FLT32X_MAX_10_EXP__ 308"
.LASF2368:
	.string	"_SC_BC_BASE_MAX"
.LASF2390:
	.string	"_SC_POLL"
.LASF462:
	.ascii	"__glibc_"
	.string	"fortify_n(f,__l,__s,__osz,...) (__glibc_safe_or_unknown_len (__l, __s, __osz) ? __ ## f ## _alias (__VA_ARGS__) : (__glibc_unsafe_len (__l, __s, __osz) ? __ ## f ## _chk_warn (__VA_ARGS__, (__osz) / (__s)) : __ ## f ## _chk (__VA_ARGS__, (__osz) / (__s))))"
.LASF1650:
	.string	"__DECL_SIMD_tanf128x "
.LASF2266:
	.string	"RESIDENCY_STATE_REGULATION_STATUS 16"
.LASF48:
	.string	"__SIG_ATOMIC_TYPE__ int"
.LASF2542:
	.string	"_SC_TRACE_SYS_MAX"
.LASF556:
	.string	"_BSD_SIZE_T_DEFINED_ "
.LASF31:
	.string	"__BIGGEST_ALIGNMENT__ 16"
.LASF1809:
	.string	"TRUE"
.LASF135:
	.string	"__INT_FAST16_WIDTH__ 64"
.LASF1387:
	.string	"__DECL_SIMD_cosf128 "
.LASF2589:
	.string	"reset_if_status_change"
.LASF892:
	.string	"UINT_FAST8_MAX (255)"
.LASF2092:
	.string	"KEY_RIGHT 0405"
.LASF2326:
	.string	"FILE"
.LASF581:
	.string	"__ULONG32_TYPE unsigned int"
.LASF1496:
	.string	"__DECL_SIMD_exp10f64 "
.LASF127:
	.string	"__UINT16_C(c) c"
.LASF2176:
	.string	"KEY_MOUSE 0631"
.LASF324:
	.string	"__PRAGMA_REDEFINE_EXTNAME 1"
.LASF1038:
	.string	"_POSIX_TRACE -1"
.LASF1793:
	.string	"NCURSES_WCWIDTH_GRAPHICS"
.LASF2439:
	.string	"_SC_LONG_BIT"
.LASF669:
	.string	"__HAVE_DISTINCT_FLOAT128 1"
.LASF2053:
	.string	"mvgetnstr(y,x,str,n) mvwgetnstr(stdscr,(y),(x),(str),(n))"
.LASF15:
	.string	"__pic__ 2"
.LASF439:
	.string	"__glibc_has_extension(ext) 0"
.LASF1100:
	.string	"_SC_ASYNCHRONOUS_IO _SC_ASYNCHRONOUS_IO"
.LASF1722:
	.string	"fpclassify(x) __builtin_fpclassify (FP_NAN, FP_INFINITE, FP_NORMAL, FP_SUBNORMAL, FP_ZERO, x)"
.LASF2470:
	.string	"_SC_CLOCK_SELECTION"
.LASF18:
	.string	"__PIE__ 2"
.LASF2011:
	.string	"insdelln(n) winsdelln(stdscr,(n))"
.LASF1788:
	.string	"NCURSES_SIZE_T short"
.LASF1605:
	.string	"__DECL_SIMD_erff32 "
.LASF852:
	.string	"_BITS_TYPES___LOCALE_T_H 1"
.LASF708:
	.string	"___int_wchar_t_h "
.LASF2113:
	.string	"KEY_PRINT 0532"
.LASF322:
	.string	"__HAVE_SPECULATION_SAFE_VALUE 1"
.LASF1064:
	.string	"L_SET SEEK_SET"
.LASF1163:
	.string	"_SC_THREAD_DESTRUCTOR_ITERATIONS _SC_THREAD_DESTRUCTOR_ITERATIONS"
.LASF2538:
	.string	"_SC_V7_LPBIG_OFFBIG"
.LASF1801:
	.string	"va_end(v) __builtin_va_end(v)"
.LASF1945:
	.string	"setterm(term) setupterm(term, 1, (int *)0)"
.LASF74:
	.string	"__UINTPTR_TYPE__ long unsigned int"
.LASF1277:
	.string	"_SC_LEVEL1_ICACHE_LINESIZE _SC_LEVEL1_ICACHE_LINESIZE"
.LASF179:
	.string	"__DBL_EPSILON__ ((double)2.22044604925031308084726333618164062e-16L)"
.LASF782:
	.string	"__bswap_constant_32(x) ((((x) & 0xff000000u) >> 24) | (((x) & 0x00ff0000u) >> 8) | (((x) & 0x0000ff00u) << 8) | (((x) & 0x000000ffu) << 24))"
.LASF2182:
	.string	"NCURSES_BUTTON_PRESSED 002L"
.LASF2355:
	.string	"_SC_AIO_LISTIO_MAX"
.LASF965:
	.string	"_POSIX_VERSION 200809L"
.LASF86:
	.string	"__SIZE_MAX__ 0xffffffffffffffffUL"
.LASF2033:
	.string	"mvwgetnstr(win,y,x,str,n) (wmove((win),(y),(x)) == ERR ? ERR : wgetnstr((win),(str),(n)))"
.LASF1808:
	.string	"__va_list__ "
.LASF1982:
	.string	"addchnstr(str,n) waddchnstr(stdscr,(str),(n))"
.LASF257:
	.string	"__FLT32X_MAX__ 1.79769313486231570814527423731704357e+308F32x"
.LASF489:
	.string	"__always_inline"
.LASF1487:
	.string	"__DECL_SIMD_exp2f128 "
.LASF2547:
	.string	"_SC_MINSIGSTKSZ"
.LASF2569:
	.string	"power_runtime_avg"
.LASF906:
	.string	"SIZE_MAX (18446744073709551615UL)"
.LASF1139:
	.string	"_SC_2_FORT_RUN _SC_2_FORT_RUN"
.LASF1002:
	.string	"_POSIX_THREAD_ATTR_STACKADDR 200809L"
.LASF205:
	.string	"__FLT32_MIN_10_EXP__ (-37)"
.LASF1519:
	.string	"__DECL_SIMD_expm1f64x "
.LASF941:
	.string	"LC_MONETARY __LC_MONETARY"
.LASF984:
	.string	"_POSIX_PRIORITY_SCHEDULING 200809L"
.LASF236:
	.string	"__FLT128_MIN_EXP__ (-16381)"
.LASF1393:
	.string	"__DECL_SIMD_sinl "
.LASF3:
	.string	"__STDC_UTF_32__ 1"
.LASF115:
	.string	"__INT_LEAST16_MAX__ 0x7fff"
.LASF2202:
	.string	"BUTTON4_RELEASED NCURSES_MOUSE_MASK(4, NCURSES_BUTTON_RELEASED)"
.LASF1014:
	.string	"_LFS_LARGEFILE 1"
.LASF1677:
	.string	"__MATH_PRECNAME"
.LASF1556:
	.string	"__DECL_SIMD_log10f64 "
.LASF1079:
	.string	"_PC_SOCK_MAXBUF _PC_SOCK_MAXBUF"
.LASF1836:
	.string	"WA_TOP A_TOP"
.LASF192:
	.string	"__LDBL_DECIMAL_DIG__ 21"
.LASF1781:
	.string	"NCURSES_OPAQUE_PANEL 0"
.LASF1157:
	.string	"_SC_THREADS _SC_THREADS"
.LASF1687:
	.string	"__MATH_PRECNAME(name,r) name ##f32 ##r"
.LASF2481:
	.string	"_SC_FILE_SYSTEM"
.LASF1709:
	.string	"__MATHCALL_NARROW_ARGS_2"
.LASF2588:
	.string	"get_min_value"
.LASF2303:
	.string	"_IO_write_end"
.LASF1680:
	.string	"_Mdouble_ float"
.LASF1029:
	.string	"_POSIX_THREAD_PROCESS_SHARED 200809L"
.LASF2445:
	.string	"_SC_SCHAR_MIN"
.LASF2375:
	.string	"_SC_LINE_MAX"
.LASF54:
	.string	"__UINT16_TYPE__ short unsigned int"
.LASF1901:
	.string	"_NEWINDEX -1"
.LASF884:
	.string	"INT_FAST8_MIN (-128)"
.LASF2550:
	.string	"double"
.LASF1823:
	.string	"WA_STANDOUT A_STANDOUT"
.LASF1162:
	.string	"_SC_TTY_NAME_MAX _SC_TTY_NAME_MAX"
.LASF1370:
	.string	"_CS_POSIX_V7_LPBIG_OFFBIG_LINTFLAGS _CS_POSIX_V7_LPBIG_OFFBIG_LINTFLAGS"
.LASF603:
	.string	"__FSBLKCNT_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF362:
	.string	"__STDC_IEC_559__ 1"
.LASF784:
	.string	"_BITS_UINTN_IDENTITY_H 1"
.LASF472:
	.string	"__attribute_malloc__ __attribute__ ((__malloc__))"
.LASF579:
	.string	"__UWORD_TYPE unsigned long int"
.LASF1078:
	.string	"_PC_PRIO_IO _PC_PRIO_IO"
.LASF2132:
	.string	"KEY_MESSAGE 0555"
.LASF1295:
	.string	"_SC_V7_LPBIG_OFFBIG _SC_V7_LPBIG_OFFBIG"
.LASF1222:
	.string	"_SC_ADVISORY_INFO _SC_ADVISORY_INFO"
.LASF793:
	.string	"htobe64(x) __bswap_64 (x)"
.LASF263:
	.string	"__FLT32X_HAS_INFINITY__ 1"
.LASF1593:
	.string	"__DECL_SIMD_acoshl "
.LASF801:
	.string	"__FD_ISSET(d,s) ((__FDS_BITS (s)[__FD_ELT (d)] & __FD_MASK (d)) != 0)"
.LASF456:
	.string	"__glibc_objsize(__o) __bos (__o)"
.LASF1630:
	.string	"__DECL_SIMD_asinhf128x "
.LASF1782:
	.string	"NCURSES_WATTR_MACROS 0"
.LASF2163:
	.string	"KEY_SNEXT 0614"
.LASF2042:
	.string	"mvwinsstr(win,y,x,s) (wmove((win),(y),(x)) == ERR ? ERR : winsstr((win),(s)))"
.LASF1379:
	.string	"_MATH_H 1"
.LASF1537:
	.string	"__DECL_SIMD_cbrtf128 "
.LASF111:
	.string	"__UINT64_MAX__ 0xffffffffffffffffUL"
.LASF2378:
	.string	"_SC_2_VERSION"
.LASF46:
	.string	"__CHAR16_TYPE__ short unsigned int"
.LASF522:
	.string	"__stub_chflags "
.LASF2508:
	.string	"_SC_2_PBS_CHECKPOINT"
.LASF1682:
	.string	"__MATH_DECLARING_DOUBLE 0"
.LASF2261:
	.string	"PKG_CRITICAL_TEMPERATURE_STATUS 16"
.LASF2199:
	.string	"BUTTON3_CLICKED NCURSES_MOUSE_MASK(3, NCURSES_BUTTON_CLICKED)"
.LASF2597:
	.string	"freq"
.LASF2207:
	.string	"BUTTON5_RELEASED NCURSES_MOUSE_MASK(5, NCURSES_BUTTON_RELEASED)"
.LASF631:
	.string	"____mbstate_t_defined 1"
.LASF1837:
	.string	"WA_VERTICAL A_VERTICAL"
.LASF731:
	.string	"__WCOREDUMP(status) ((status) & __WCOREFLAG)"
.LASF1279:
	.string	"_SC_LEVEL1_DCACHE_ASSOC _SC_LEVEL1_DCACHE_ASSOC"
.LASF157:
	.string	"__FLT_MAX_EXP__ 128"
.LASF911:
	.string	"INT8_C(c) c"
.LASF2077:
	.string	"is_scrollok(win) (NCURSES_OK_ADDR(win) ? (win)->_scroll : FALSE)"
.LASF10:
	.string	"__ATOMIC_SEQ_CST 5"
.LASF559:
	.string	"_GCC_SIZE_T "
.LASF2100:
	.string	"KEY_IC 0513"
.LASF526:
	.string	"__stub_setlogin "
.LASF1770:
	.string	"NCURSES_CONST"
.LASF679:
	.string	"__HAVE_FLOAT128X 0"
.LASF2299:
	.string	"_IO_read_end"
.LASF1118:
	.string	"_SC_PAGESIZE _SC_PAGESIZE"
.LASF1260:
	.string	"_SC_2_PBS_LOCATE _SC_2_PBS_LOCATE"
.LASF1545:
	.string	"__DECL_SIMD_atan2f32 "
.LASF274:
	.string	"__FLT64X_NORM_MAX__ 1.18973149535723176502126385303097021e+4932F64x"
.LASF202:
	.string	"__FLT32_MANT_DIG__ 24"
.LASF528:
	.string	"__stub_stty "
.LASF2191:
	.string	"BUTTON1_TRIPLE_CLICKED NCURSES_MOUSE_MASK(1, NCURSES_TRIPLE_CLICKED)"
.LASF421:
	.string	"__WORDSIZE 64"
.LASF2239:
	.string	"TRACE_DATABASE 0x0800"
.LASF2531:
	.string	"_SC_LEVEL4_CACHE_ASSOC"
.LASF515:
	.string	"__attr_access(x) __attribute__ ((__access__ x))"
.LASF1469:
	.string	"__DECL_SIMD_asinf64x "
.LASF1316:
	.string	"_CS_LFS_LDFLAGS _CS_LFS_LDFLAGS"
.LASF1036:
	.string	"_POSIX_SPORADIC_SERVER -1"
.LASF1481:
	.string	"__DECL_SIMD_exp2 "
.LASF97:
	.string	"__INTMAX_C(c) c ## L"
.LASF1276:
	.string	"_SC_LEVEL1_ICACHE_ASSOC _SC_LEVEL1_ICACHE_ASSOC"
.LASF913:
	.string	"INT32_C(c) c"
.LASF114:
	.string	"__INT_LEAST8_WIDTH__ 8"
.LASF961:
	.string	"LC_IDENTIFICATION_MASK (1 << __LC_IDENTIFICATION)"
.LASF2280:
	.string	"AMD_MSR_PACKAGE_ENERGY 0xC001029B"
.LASF2453:
	.string	"_SC_NL_LANGMAX"
.LASF959:
	.string	"LC_TELEPHONE_MASK (1 << __LC_TELEPHONE)"
.LASF2085:
	.string	"KEY_MIN 0401"
.LASF1045:
	.string	"_XBS5_LPBIG_OFFBIG -1"
.LASF985:
	.string	"_POSIX_SYNCHRONIZED_IO 200809L"
.LASF1707:
	.string	"__MATHCALL_NARROW(func,redir,nargs) __MATHCALL_NARROW_NORMAL (func, nargs)"
.LASF1985:
	.string	"addstr(str) waddnstr(stdscr,(str),-1)"
.LASF1138:
	.string	"_SC_2_FORT_DEV _SC_2_FORT_DEV"
.LASF728:
	.string	"__WIFSIGNALED(status) (((signed char) (((status) & 0x7f) + 1) >> 1) > 0)"
.LASF148:
	.string	"__GCC_IEC_559_COMPLEX 2"
.LASF935:
	.string	"__LC_MEASUREMENT 11"
.LASF139:
	.string	"__INT_FAST64_WIDTH__ 64"
.LASF391:
	.string	"__USE_DYNAMIC_STACK_SIZE"
.LASF2198:
	.string	"BUTTON3_PRESSED NCURSES_MOUSE_MASK(3, NCURSES_BUTTON_PRESSED)"
.LASF2519:
	.string	"_SC_LEVEL1_ICACHE_ASSOC"
.LASF2206:
	.string	"BUTTON4_TRIPLE_CLICKED NCURSES_MOUSE_MASK(4, NCURSES_TRIPLE_CLICKED)"
.LASF2086:
	.string	"KEY_BREAK 0401"
.LASF1255:
	.string	"_SC_TYPED_MEMORY_OBJECTS _SC_TYPED_MEMORY_OBJECTS"
.LASF1610:
	.string	"__DECL_SIMD_erff128x "
.LASF1870:
	.string	"ACS_BOARD NCURSES_ACS('h')"
.LASF1920:
	.string	"A_COLOR NCURSES_BITS(((1U) << 8) - 1U,0)"
.LASF2269:
	.string	"VR_THERM_DESIGN_CURRENT_STATUS 128"
.LASF1844:
	.string	"COLOR_MAGENTA 5"
.LASF671:
	.string	"__HAVE_FLOAT64X_LONG_DOUBLE 1"
.LASF1952:
	.string	"getattrs(win) NCURSES_CAST(int, NCURSES_OK_ADDR(win) ? (win)->_attrs : A_NORMAL)"
.LASF304:
	.string	"__USER_LABEL_PREFIX__ "
.LASF2582:
	.string	"fgets"
.LASF501:
	.string	"__attribute_copy__"
.LASF557:
	.string	"_SIZE_T_DECLARED "
.LASF427:
	.string	"__USE_FORTIFY_LEVEL 0"
.LASF2174:
	.string	"KEY_SUSPEND 0627"
.LASF191:
	.string	"__DECIMAL_DIG__ 21"
.LASF530:
	.string	"__GLIBC_USE_LIB_EXT2 0"
.LASF128:
	.string	"__UINT_LEAST32_MAX__ 0xffffffffU"
.LASF861:
	.string	"INT16_MIN (-32767-1)"
.LASF1344:
	.string	"_CS_POSIX_V6_ILP32_OFFBIG_LDFLAGS _CS_POSIX_V6_ILP32_OFFBIG_LDFLAGS"
.LASF2246:
	.string	"CPUMONLIB "
.LASF1981:
	.string	"addch(ch) waddch(stdscr,(ch))"
.LASF2590:
	.string	"sysfs_freq_ghz"
.LASF654:
	.string	"P_tmpdir \"/tmp\""
.LASF2029:
	.string	"mvwaddstr(win,y,x,str) (wmove((win),(y),(x)) == ERR ? ERR : waddnstr((win),(str),-1))"
.LASF572:
	.string	"__S32_TYPE int"
.LASF967:
	.string	"_POSIX2_VERSION __POSIX2_THIS_VERSION"
.LASF482:
	.string	"__attribute_format_arg__(x) __attribute__ ((__format_arg__ (x)))"
.LASF1780:
	.string	"NCURSES_OPAQUE_MENU 0"
.LASF1179:
	.string	"_SC_XOPEN_VERSION _SC_XOPEN_VERSION"
.LASF1506:
	.string	"__DECL_SIMD_coshf64 "
.LASF310:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 1"
.LASF779:
	.string	"BYTE_ORDER __BYTE_ORDER"
.LASF699:
	.string	"_WCHAR_T "
.LASF1980:
	.string	"PAIR_NUMBER(a) (NCURSES_CAST(int,((NCURSES_CAST(unsigned long,(a)) & A_COLOR) >> NCURSES_ATTR_SHIFT)))"
.LASF1271:
	.string	"_SC_TRACE _SC_TRACE"
.LASF2162:
	.string	"KEY_SMOVE 0613"
.LASF1026:
	.string	"_POSIX_TIMERS 200809L"
.LASF151:
	.string	"__DEC_EVAL_METHOD__ 2"
.LASF2379:
	.string	"_SC_2_C_BIND"
.LASF541:
	.string	"__GLIBC_USE_IEC_60559_TYPES_EXT"
.LASF1143:
	.string	"_SC_PII_XTI _SC_PII_XTI"
.LASF1264:
	.string	"_SC_STREAMS _SC_STREAMS"
.LASF2136:
	.string	"KEY_OPTIONS 0561"
.LASF204:
	.string	"__FLT32_MIN_EXP__ (-125)"
.LASF1440:
	.string	"__DECL_SIMD_powf128x "
.LASF2243:
	.string	"NCURSES_UNCTRL_H_incl 1"
.LASF1375:
	.string	"F_ULOCK 0"
.LASF772:
	.string	"_BITS_ENDIANNESS_H 1"
.LASF2342:
	.string	"_SC_PRIORITY_SCHEDULING"
.LASF2539:
	.string	"_SC_SS_REPL_MAX"
.LASF1768:
	.string	"NCURSES_ENABLE_STDBOOL_H 1"
.LASF847:
	.string	"alloca"
.LASF748:
	.string	"MB_CUR_MAX (__ctype_get_mb_cur_max ())"
.LASF2074:
	.string	"is_nodelay(win) (NCURSES_OK_ADDR(win) ? ((win)->_delay == 0) : FALSE)"
.LASF805:
	.string	"__timeval_defined 1"
.LASF1314:
	.string	"_CS_POSIX_V7_WIDTH_RESTRICTED_ENVS _CS_V7_WIDTH_RESTRICTED_ENVS"
.LASF261:
	.string	"__FLT32X_DENORM_MIN__ 4.94065645841246544176568792868221372e-324F32x"
.LASF893:
	.string	"UINT_FAST16_MAX (18446744073709551615UL)"
.LASF549:
	.string	"_T_SIZE_ "
.LASF156:
	.string	"__FLT_MIN_10_EXP__ (-37)"
.LASF2361:
	.string	"_SC_VERSION"
.LASF1347:
	.string	"_CS_POSIX_V6_LP64_OFF64_CFLAGS _CS_POSIX_V6_LP64_OFF64_CFLAGS"
.LASF910:
	.string	"WINT_MAX (4294967295u)"
.LASF1024:
	.string	"_POSIX_SPIN_LOCKS 200809L"
.LASF694:
	.string	"__CFLOAT32X _Complex _Float32x"
.LASF1942:
	.string	"setsyx(y,x) do { if (newscr) { if ((y) == -1 && (x) == -1) leaveok(newscr, TRUE); else { leaveok(newscr, FALSE); wmove(newscr, (y), (x)); } } } while(0)"
.LASF1904:
	.string	"GCC_NORETURN "
.LASF2347:
	.string	"_SC_FSYNC"
.LASF1602:
	.string	"__DECL_SIMD_erff "
.LASF830:
	.string	"__SIZEOF_PTHREAD_MUTEXATTR_T 4"
.LASF1816:
	.string	"false 0"
.LASF1507:
	.string	"__DECL_SIMD_coshf128 "
.LASF1035:
	.string	"_POSIX2_CHAR_TERM 200809L"
.LASF169:
	.string	"__DBL_MANT_DIG__ 53"
.LASF1229:
	.string	"_SC_THREAD_CPUTIME _SC_THREAD_CPUTIME"
.LASF1992:
	.string	"attrset(at) wattrset(stdscr,(at))"
.LASF82:
	.string	"__WCHAR_MIN__ (-__WCHAR_MAX__ - 1)"
.LASF964:
	.string	"_UNISTD_H 1"
.LASF339:
	.string	"__k8 1"
.LASF413:
	.string	"__USE_POSIX 1"
.LASF977:
	.string	"_XOPEN_XPG4 1"
.LASF375:
	.string	"__USE_POSIX"
.LASF1197:
	.string	"_SC_WORD_BIT _SC_WORD_BIT"
.LASF709:
	.string	"__INT_WCHAR_T_H "
.LASF753:
	.string	"__gid_t_defined "
.LASF194:
	.string	"__LDBL_NORM_MAX__ 1.18973149535723176502126385303097021e+4932L"
.LASF1924:
	.string	"A_BLINK NCURSES_BITS(1U,11)"
.LASF287:
	.string	"__DEC32_EPSILON__ 1E-6DF"
.LASF1333:
	.string	"_CS_XBS5_LP64_OFF64_LIBS _CS_XBS5_LP64_OFF64_LIBS"
.LASF1789:
	.string	"NCURSES_TPARM_VARARGS"
.LASF1879:
	.string	"ACS_STERLING NCURSES_ACS('}')"
.LASF2604:
	.string	"update_sensor_data"
.LASF144:
	.string	"__INTPTR_MAX__ 0x7fffffffffffffffL"
.LASF1649:
	.string	"__DECL_SIMD_tanf64x "
.LASF1454:
	.string	"__DECL_SIMD_atanf16 "
.LASF1231:
	.string	"_SC_DEVICE_SPECIFIC _SC_DEVICE_SPECIFIC"
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
.LASF2479:
	.string	"_SC_FILE_ATTRIBUTES"
.LASF891:
	.string	"INT_FAST64_MAX (__INT64_C(9223372036854775807))"
.LASF1104:
	.string	"_SC_MAPPED_FILES _SC_MAPPED_FILES"
.LASF1244:
	.string	"_SC_SPIN_LOCKS _SC_SPIN_LOCKS"
.LASF815:
	.string	"FD_SET(fd,fdsetp) __FD_SET (fd, fdsetp)"
.LASF163:
	.string	"__FLT_EPSILON__ 1.19209289550781250000000000000000000e-7F"
.LASF1508:
	.string	"__DECL_SIMD_coshf32x "
.LASF792:
	.string	"le32toh(x) __uint32_identity (x)"
.LASF2027:
	.string	"mvwaddchstr(win,y,x,str) (wmove((win),(y),(x)) == ERR ? ERR : waddchnstr((win),(str),-1))"
.LASF1378:
	.string	"F_TEST 3"
.LASF2442:
	.string	"_SC_NZERO"
.LASF1604:
	.string	"__DECL_SIMD_erff16 "
.LASF1353:
	.string	"_CS_POSIX_V6_LPBIG_OFFBIG_LIBS _CS_POSIX_V6_LPBIG_OFFBIG_LIBS"
.LASF464:
	.string	"__errordecl(name,msg) extern void name (void) __attribute__((__error__ (msg)))"
.LASF269:
	.string	"__FLT64X_MIN_10_EXP__ (-4931)"
.LASF1345:
	.string	"_CS_POSIX_V6_ILP32_OFFBIG_LIBS _CS_POSIX_V6_ILP32_OFFBIG_LIBS"
.LASF741:
	.string	"WIFSTOPPED(status) __WIFSTOPPED (status)"
.LASF1616:
	.string	"__DECL_SIMD_tanhf64 "
.LASF320:
	.string	"__GCC_ATOMIC_TEST_AND_SET_TRUEVAL 1"
.LASF351:
	.string	"__CET__ 3"
.LASF1787:
	.string	"NCURSES_SIZE_T"
.LASF2380:
	.string	"_SC_2_C_DEV"
.LASF1409:
	.string	"__DECL_SIMD_sincosf64x "
.LASF531:
	.string	"__GLIBC_USE_IEC_60559_BFP_EXT"
.LASF1437:
	.string	"__DECL_SIMD_powf128 "
.LASF1478:
	.string	"__DECL_SIMD_hypotf32x "
.LASF1933:
	.string	"A_RIGHT NCURSES_BITS(1U,20)"
.LASF2310:
	.string	"_chain"
.LASF499:
	.string	"__glibc_likely(cond) __builtin_expect ((cond), 1)"
.LASF125:
	.string	"__UINT8_C(c) c"
.LASF1996:
	.string	"clear() wclear(stdscr)"
.LASF754:
	.string	"__mode_t_defined "
.LASF1796:
	.string	"NCURSES_CH_T cchar_t"
.LASF209:
	.string	"__FLT32_MAX__ 3.40282346638528859811704183484516925e+38F32"
.LASF1810:
	.string	"TRUE 1"
.LASF690:
	.string	"__f32x(x) x ##f32x"
.LASF1204:
	.string	"_SC_SHRT_MIN _SC_SHRT_MIN"
.LASF1495:
	.string	"__DECL_SIMD_exp10f32 "
.LASF2609:
	.string	"init_sensor_power"
.LASF2155:
	.string	"KEY_SEXIT 0604"
.LASF1189:
	.string	"_SC_XOPEN_XPG3 _SC_XOPEN_XPG3"
.LASF537:
	.string	"__GLIBC_USE_IEC_60559_FUNCS_EXT"
.LASF2071:
	.string	"is_immedok(win) (NCURSES_OK_ADDR(win) ? (win)->_immed : FALSE)"
.LASF1166:
	.string	"_SC_THREAD_THREADS_MAX _SC_THREAD_THREADS_MAX"
.LASF972:
	.string	"_POSIX2_LOCALEDEF __POSIX2_THIS_VERSION"
.LASF1182:
	.string	"_SC_XOPEN_CRYPT _SC_XOPEN_CRYPT"
.LASF1785:
	.string	"NCURSES_INTEROP_FUNCS"
.LASF1827:
	.string	"WA_DIM A_DIM"
.LASF1212:
	.string	"_SC_NL_NMAX _SC_NL_NMAX"
.LASF871:
	.string	"UINT64_MAX (__UINT64_C(18446744073709551615))"
.LASF1736:
	.string	"M_PI 3.14159265358979323846"
.LASF2115:
	.string	"KEY_A1 0534"
.LASF44:
	.string	"__INTMAX_TYPE__ long int"
.LASF2506:
	.string	"_SC_SYMLOOP_MAX"
.LASF1711:
	.string	"__MATHCALL_NARROW_NORMAL"
.LASF1821:
	.string	"WA_ATTRIBUTES A_ATTRIBUTES"
.LASF875:
	.string	"INT_LEAST64_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF330:
	.string	"__amd64 1"
.LASF2592:
	.string	"malloc"
.LASF2056:
	.string	"mvinch(y,x) mvwinch(stdscr,(y),(x))"
.LASF2179:
	.string	"_XOPEN_CURSES 1"
.LASF2287:
	.string	"unsigned char"
.LASF858:
	.string	"_BITS_STDINT_UINTN_H 1"
.LASF1975:
	.string	"winsstr(w,s) winsnstr(w, s, -1)"
.LASF1951:
	.string	"gettmode() "
.LASF885:
	.string	"INT_FAST16_MIN (-9223372036854775807L-1)"
.LASF1236:
	.string	"_SC_FILE_ATTRIBUTES _SC_FILE_ATTRIBUTES"
.LASF514:
	.string	"__HAVE_GENERIC_SELECTION 1"
.LASF1655:
	.string	"NAN (__builtin_nanf (\"\"))"
.LASF2217:
	.string	"BUTTON_RELEASE(e,x) ((e) & NCURSES_MOUSE_MASK(x, 001))"
.LASF889:
	.string	"INT_FAST16_MAX (9223372036854775807L)"
.LASF32:
	.string	"__ORDER_LITTLE_ENDIAN__ 1234"
.LASF2359:
	.string	"_SC_MQ_OPEN_MAX"
.LASF1116:
	.string	"_SC_MQ_PRIO_MAX _SC_MQ_PRIO_MAX"
.LASF2048:
	.string	"mvaddnstr(y,x,str,n) mvwaddnstr(stdscr,(y),(x),(str),(n))"
.LASF1835:
	.string	"WA_RIGHT A_RIGHT"
.LASF1473:
	.string	"__DECL_SIMD_hypotl "
.LASF587:
	.string	"__SYSCALL_ULONG_TYPE __ULONGWORD_TYPE"
.LASF2565:
	.string	"power_unit"
.LASF1282:
	.string	"_SC_LEVEL2_CACHE_ASSOC _SC_LEVEL2_CACHE_ASSOC"
.LASF2165:
	.string	"KEY_SPREVIOUS 0616"
.LASF154:
	.string	"__FLT_DIG__ 6"
.LASF76:
	.string	"__SCHAR_MAX__ 0x7f"
.LASF763:
	.string	"__time_t_defined 1"
.LASF461:
	.string	"__glibc_fortify(f,__l,__s,__osz,...) (__glibc_safe_or_unknown_len (__l, __s, __osz) ? __ ## f ## _alias (__VA_ARGS__) : (__glibc_unsafe_len (__l, __s, __osz) ? __ ## f ## _chk_warn (__VA_ARGS__, __osz) : __ ## f ## _chk (__VA_ARGS__, __osz)))"
.LASF1864:
	.string	"ACS_PLMINUS NCURSES_ACS('g')"
.LASF1859:
	.string	"ACS_S1 NCURSES_ACS('o')"
.LASF2549:
	.string	"float"
.LASF153:
	.string	"__FLT_MANT_DIG__ 24"
.LASF1224:
	.string	"_SC_BASE _SC_BASE"
.LASF2272:
	.string	"PKG_PL2_STATUS 2048"
.LASF173:
	.string	"__DBL_MAX_EXP__ 1024"
.LASF373:
	.string	"__USE_ISOC95"
.LASF940:
	.string	"LC_COLLATE __LC_COLLATE"
.LASF2097:
	.string	"KEY_DL 0510"
.LASF372:
	.string	"__USE_ISOC99"
.LASF126:
	.string	"__UINT_LEAST16_MAX__ 0xffff"
.LASF1073:
	.string	"_PC_CHOWN_RESTRICTED _PC_CHOWN_RESTRICTED"
.LASF2245:
	.string	"UTILS "
.LASF912:
	.string	"INT16_C(c) c"
.LASF2195:
	.string	"BUTTON2_DOUBLE_CLICKED NCURSES_MOUSE_MASK(2, NCURSES_DOUBLE_CLICKED)"
.LASF999:
	.string	"_POSIX_THREAD_SAFE_FUNCTIONS 200809L"
.LASF2364:
	.string	"_SC_SEM_NSEMS_MAX"
.LASF254:
	.string	"__FLT32X_MAX_EXP__ 1024"
.LASF1603:
	.string	"__DECL_SIMD_erfl "
.LASF1240:
	.string	"_SC_MULTI_PROCESS _SC_MULTI_PROCESS"
.LASF101:
	.string	"__SIG_ATOMIC_MAX__ 0x7fffffff"
.LASF2089:
	.string	"KEY_DOWN 0402"
.LASF29:
	.string	"__SIZEOF_SIZE_T__ 8"
.LASF300:
	.string	"__DEC128_MAX__ 9.999999999999999999999999999999999E6144DL"
.LASF2608:
	.string	"my_sensor"
.LASF2337:
	.string	"_SC_STREAM_MAX"
.LASF2344:
	.string	"_SC_ASYNCHRONOUS_IO"
.LASF765:
	.string	"_BITS_STDINT_INTN_H 1"
.LASF2618:
	.string	"geteuid"
.LASF333:
	.string	"__x86_64__ 1"
.LASF1464:
	.string	"__DECL_SIMD_asinf16 "
.LASF2486:
	.string	"_SC_READER_WRITER_LOCKS"
.LASF2471:
	.string	"_SC_CPUTIME"
.LASF1854:
	.string	"ACS_BTEE NCURSES_ACS('v')"
.LASF510:
	.string	"__REDIRECT_LDBL(name,proto,alias) __REDIRECT (name, proto, alias)"
.LASF94:
	.string	"__PTRDIFF_WIDTH__ 64"
.LASF1852:
	.string	"ACS_LTEE NCURSES_ACS('t')"
.LASF777:
	.string	"BIG_ENDIAN __BIG_ENDIAN"
.LASF382:
	.string	"__USE_XOPEN2K"
.LASF2573:
	.string	"stderr"
.LASF378:
	.string	"__USE_POSIX199506"
.LASF1993:
	.string	"bkgd(ch) wbkgd(stdscr,(ch))"
.LASF2503:
	.string	"_SC_2_PBS_LOCATE"
.LASF1497:
	.string	"__DECL_SIMD_exp10f128 "
.LASF227:
	.string	"__FLT64_MIN__ 2.22507385850720138309023271733240406e-308F64"
.LASF2473:
	.string	"_SC_DEVICE_IO"
.LASF444:
	.string	"__NTH(fct) __attribute__ ((__nothrow__ __LEAF)) fct"
.LASF357:
	.string	"__unix__ 1"
.LASF2376:
	.string	"_SC_RE_DUP_MAX"
.LASF1560:
	.string	"__DECL_SIMD_log10f128x "
.LASF1485:
	.string	"__DECL_SIMD_exp2f32 "
.LASF1427:
	.string	"__DECL_SIMD_expf128 "
.LASF1868:
	.string	"ACS_DARROW NCURSES_ACS('.')"
.LASF195:
	.string	"__LDBL_MIN__ 3.36210314311209350626267781732175260e-4932L"
.LASF2491:
	.string	"_SC_SIGNALS"
.LASF1529:
	.string	"__DECL_SIMD_sinhf64x "
.LASF795:
	.string	"be64toh(x) __bswap_64 (x)"
.LASF2536:
	.string	"_SC_V7_ILP32_OFFBIG"
.LASF1076:
	.string	"_PC_SYNC_IO _PC_SYNC_IO"
.LASF2138:
	.string	"KEY_REDO 0563"
.LASF981:
	.string	"_BITS_POSIX_OPT_H 1"
.LASF1715:
	.string	"__MATH_TG_F64X(FUNC,ARGS) _Float64x: FUNC ## l ARGS,"
.LASF880:
	.string	"UINT_LEAST8_MAX (255)"
.LASF64:
	.string	"__UINT_LEAST64_TYPE__ long unsigned int"
.LASF1598:
	.string	"__DECL_SIMD_acoshf32x "
.LASF1324:
	.string	"_CS_XBS5_ILP32_OFF32_LDFLAGS _CS_XBS5_ILP32_OFF32_LDFLAGS"
.LASF2002:
	.string	"echochar(c) wechochar(stdscr,(c))"
.LASF488:
	.string	"__wur "
.LASF175:
	.string	"__DBL_DECIMAL_DIG__ 17"
.LASF24:
	.string	"__SIZEOF_LONG_LONG__ 8"
.LASF445:
	.string	"__NTHNL(fct) __attribute__ ((__nothrow__)) fct"
.LASF938:
	.string	"LC_NUMERIC __LC_NUMERIC"
.LASF2031:
	.string	"mvwdelch(win,y,x) (wmove((win),(y),(x)) == ERR ? ERR : wdelch(win))"
.LASF2561:
	.string	"pkg_cumulative"
.LASF730:
	.string	"__WIFCONTINUED(status) ((status) == __W_CONTINUED)"
.LASF954:
	.string	"LC_MONETARY_MASK (1 << __LC_MONETARY)"
.LASF271:
	.string	"__FLT64X_MAX_10_EXP__ 4932"
.LASF430:
	.string	"__GNU_LIBRARY__"
.LASF1099:
	.string	"_SC_TIMERS _SC_TIMERS"
.LASF710:
	.string	"_GCC_WCHAR_T "
.LASF1019:
	.string	"_POSIX_THREAD_CPUTIME 0"
.LASF1909:
	.string	"NCURSES_EXT_FUNCS"
.LASF1684:
	.string	"__MATH_PRECNAME(name,r) name ##l ##r"
.LASF1164:
	.string	"_SC_THREAD_KEYS_MAX _SC_THREAD_KEYS_MAX"
.LASF2537:
	.string	"_SC_V7_LP64_OFF64"
.LASF761:
	.string	"__clock_t_defined 1"
.LASF2416:
	.string	"_SC_NPROCESSORS_CONF"
.LASF2109:
	.string	"KEY_STAB 0524"
.LASF403:
	.string	"_DEFAULT_SOURCE 1"
.LASF705:
	.string	"_WCHAR_T_DEFINED_ "
.LASF2580:
	.string	"power_his"
.LASF595:
	.string	"__FSWORD_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF1877:
	.string	"ACS_PI NCURSES_ACS('{')"
.LASF2242:
	.string	"TRACE_MAXIMUM ((1 << TRACE_SHIFT) - 1)"
.LASF1133:
	.string	"_SC_RE_DUP_MAX _SC_RE_DUP_MAX"
.LASF2391:
	.string	"_SC_SELECT"
.LASF239:
	.string	"__FLT128_MAX_10_EXP__ 4932"
.LASF1672:
	.string	"_Mdouble_ double"
.LASF1252:
	.string	"_SC_SYSTEM_DATABASE _SC_SYSTEM_DATABASE"
.LASF1177:
	.string	"_SC_ATEXIT_MAX _SC_ATEXIT_MAX"
.LASF1476:
	.string	"__DECL_SIMD_hypotf64 "
.LASF2423:
	.string	"_SC_XOPEN_XCU_VERSION"
.LASF1047:
	.string	"_POSIX_V6_LP64_OFF64 1"
.LASF988:
	.string	"_POSIX_MEMLOCK 200809L"
.LASF808:
	.string	"__NFDBITS"
.LASF442:
	.string	"__THROW __attribute__ ((__nothrow__ __LEAF))"
.LASF1947:
	.string	"resetterm() reset_shell_mode()"
.LASF859:
	.string	"__intptr_t_defined "
.LASF1957:
	.string	"getmaxx(win) (NCURSES_OK_ADDR(win) ? ((win)->_maxx + 1) : ERR)"
.LASF2051:
	.string	"mvdelch(y,x) mvwdelch(stdscr,(y),(x))"
.LASF867:
	.string	"INT64_MAX (__INT64_C(9223372036854775807))"
.LASF878:
	.string	"INT_LEAST32_MAX (2147483647)"
.LASF504:
	.string	"__LDBL_REDIR1(name,proto,alias) name proto"
.LASF930:
	.string	"__LC_ALL 6"
.LASF1502:
	.string	"__DECL_SIMD_coshf "
.LASF1511:
	.string	"__DECL_SIMD_expm1 "
.LASF733:
	.string	"__W_STOPCODE(sig) ((sig) << 8 | 0x7f)"
.LASF1583:
	.string	"__DECL_SIMD_atanhl "
.LASF2349:
	.string	"_SC_MEMLOCK"
.LASF455:
	.string	"__glibc_objsize0(__o) __bos0 (__o)"
.LASF1600:
	.string	"__DECL_SIMD_acoshf128x "
.LASF968:
	.string	"_POSIX2_C_VERSION __POSIX2_THIS_VERSION"
.LASF358:
	.string	"unix 1"
.LASF1575:
	.string	"__DECL_SIMD_log1pf32 "
.LASF232:
	.string	"__FLT64_HAS_QUIET_NAN__ 1"
.LASF577:
	.string	"__UQUAD_TYPE unsigned long int"
.LASF2166:
	.string	"KEY_SPRINT 0617"
.LASF2145:
	.string	"KEY_SBEG 0572"
.LASF2293:
	.string	"__uid_t"
.LASF1403:
	.string	"__DECL_SIMD_sincosl "
.LASF1634:
	.string	"__DECL_SIMD_erfcf16 "
.LASF385:
	.string	"__USE_XOPEN2K8XSI"
.LASF2275:
	.string	"BIT31 0x8000000"
.LASF1480:
	.string	"__DECL_SIMD_hypotf128x "
.LASF1206:
	.string	"_SC_UINT_MAX _SC_UINT_MAX"
.LASF1972:
	.string	"vline(ch,n) wvline(stdscr, ch, (n))"
.LASF1336:
	.string	"_CS_XBS5_LPBIG_OFFBIG_LDFLAGS _CS_XBS5_LPBIG_OFFBIG_LDFLAGS"
.LASF764:
	.string	"__timer_t_defined 1"
.LASF1169:
	.string	"_SC_THREAD_PRIORITY_SCHEDULING _SC_THREAD_PRIORITY_SCHEDULING"
.LASF2117:
	.string	"KEY_B2 0536"
.LASF1842:
	.string	"COLOR_YELLOW 3"
.LASF895:
	.string	"UINT_FAST64_MAX (__UINT64_C(18446744073709551615))"
.LASF2054:
	.string	"mvgetstr(y,x,str) mvwgetstr(stdscr,(y),(x),(str))"
.LASF95:
	.string	"__SIZE_WIDTH__ 64"
.LASF566:
	.string	"__need___va_list "
.LASF2431:
	.string	"_SC_XOPEN_XPG2"
.LASF2432:
	.string	"_SC_XOPEN_XPG3"
.LASF2433:
	.string	"_SC_XOPEN_XPG4"
.LASF680:
	.string	"__HAVE_DISTINCT_FLOAT16 __HAVE_FLOAT16"
.LASF2319:
	.string	"_codecvt"
.LASF707:
	.string	"_WCHAR_T_H "
.LASF112:
	.string	"__INT_LEAST8_MAX__ 0x7f"
.LASF2302:
	.string	"_IO_write_ptr"
.LASF155:
	.string	"__FLT_MIN_EXP__ (-125)"
.LASF276:
	.string	"__FLT64X_EPSILON__ 1.08420217248550443400745280086994171e-19F64x"
.LASF653:
	.string	"SEEK_END 2"
.LASF35:
	.string	"__BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__"
.LASF2153:
	.string	"KEY_SEND 0602"
.LASF803:
	.string	"____sigset_t_defined "
.LASF767:
	.string	"_ENDIAN_H 1"
.LASF2161:
	.string	"KEY_SMESSAGE 0612"
.LASF152:
	.string	"__FLT_RADIX__ 2"
.LASF119:
	.string	"__INT32_C(c) c"
.LASF512:
	.string	"__glibc_macro_warning1(message) _Pragma (#message)"
.LASF1760:
	.string	"NCURSES_PUBLIC_VAR(name) _nc_ ##name"
.LASF1799:
	.string	"_ANSI_STDARG_H_ "
.LASF201:
	.string	"__LDBL_IS_IEC_60559__ 2"
.LASF1572:
	.string	"__DECL_SIMD_log1pf "
.LASF251:
	.string	"__FLT32X_DIG__ 15"
.LASF1145:
	.string	"_SC_PII_INTERNET _SC_PII_INTERNET"
.LASF2572:
	.string	"cpu_designer_e"
.LASF917:
	.string	"UINT32_C(c) c ## U"
.LASF1553:
	.string	"__DECL_SIMD_log10l "
.LASF986:
	.string	"_POSIX_FSYNC 200809L"
.LASF150:
	.string	"__FLT_EVAL_METHOD_TS_18661_3__ 0"
.LASF1220:
	.string	"_SC_XOPEN_REALTIME _SC_XOPEN_REALTIME"
.LASF1190:
	.string	"_SC_XOPEN_XPG4 _SC_XOPEN_XPG4"
.LASF1926:
	.string	"A_BOLD NCURSES_BITS(1U,13)"
.LASF2606:
	.string	"print_fanspeed"
.LASF2098:
	.string	"KEY_IL 0511"
.LASF1430:
	.string	"__DECL_SIMD_expf128x "
.LASF2414:
	.string	"_SC_THREAD_PRIO_PROTECT"
.LASF770:
	.string	"__BIG_ENDIAN 4321"
.LASF298:
	.string	"__DEC128_MAX_EXP__ 6145"
.LASF2110:
	.string	"KEY_CTAB 0525"
.LASF2260:
	.string	"PKG_THERMAL_STATUS 1"
.LASF1467:
	.string	"__DECL_SIMD_asinf128 "
.LASF971:
	.string	"_POSIX2_SW_DEV __POSIX2_THIS_VERSION"
.LASF682:
	.string	"__HAVE_DISTINCT_FLOAT64 0"
.LASF1198:
	.string	"_SC_MB_LEN_MAX _SC_MB_LEN_MAX"
.LASF914:
	.string	"INT64_C(c) c ## L"
.LASF1381:
	.string	"__DECL_SIMD_cos "
.LASF2122:
	.string	"KEY_CANCEL 0543"
.LASF1834:
	.string	"WA_LOW A_LOW"
.LASF1259:
	.string	"_SC_2_PBS_ACCOUNTING _SC_2_PBS_ACCOUNTING"
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
.LASF317:
	.string	"__GCC_ATOMIC_INT_LOCK_FREE 2"
.LASF890:
	.string	"INT_FAST32_MAX (9223372036854775807L)"
.LASF69:
	.string	"__UINT_FAST8_TYPE__ unsigned char"
.LASF2267:
	.string	"RUNNING_AVERAGE_THERMAL_LIMIT_STATUS 32"
.LASF2617:
	.string	"__isoc99_sscanf"
.LASF47:
	.string	"__CHAR32_TYPE__ unsigned int"
.LASF1540:
	.string	"__DECL_SIMD_cbrtf128x "
.LASF1666:
	.string	"__MATHCALLX(function,suffix,args,attrib) __MATHDECLX (_Mdouble_,function,suffix, args, attrib)"
.LASF607:
	.string	"__ID_T_TYPE __U32_TYPE"
.LASF89:
	.string	"__INT_WIDTH__ 32"
.LASF2603:
	.string	"battery"
.LASF474:
	.string	"__attribute_alloc_align__(param) __attribute__ ((__alloc_align__ param))"
.LASF2255:
	.string	"MSR_RAPL_POWER_UNIT 0x606"
.LASF56:
	.string	"__UINT64_TYPE__ long unsigned int"
.LASF1559:
	.string	"__DECL_SIMD_log10f64x "
.LASF2164:
	.string	"KEY_SOPTIONS 0615"
.LASF2016:
	.string	"move(y,x) wmove(stdscr,(y),(x))"
.LASF2183:
	.string	"NCURSES_BUTTON_CLICKED 004L"
.LASF1462:
	.string	"__DECL_SIMD_asinf "
.LASF724:
	.string	"__WEXITSTATUS(status) (((status) & 0xff00) >> 8)"
.LASF1851:
	.string	"ACS_LRCORNER NCURSES_ACS('j')"
.LASF665:
	.string	"__attr_dealloc_fclose"
.LASF387:
	.string	"__USE_LARGEFILE64"
.LASF1023:
	.string	"_POSIX_TIMEOUTS 200809L"
.LASF217:
	.string	"__FLT32_IS_IEC_60559__ 2"
.LASF766:
	.string	"__BIT_TYPES_DEFINED__ 1"
.LASF2241:
	.string	"TRACE_SHIFT 13"
.LASF490:
	.string	"__always_inline __inline __attribute__ ((__always_inline__))"
.LASF21:
	.string	"__LP64__ 1"
.LASF571:
	.string	"__U16_TYPE unsigned short int"
.LASF2082:
	.string	"wgetscrreg(win,t,b) (NCURSES_OK_ADDR(win) ? (*(t) = (win)->_regtop, *(b) = (win)->_regbottom, OK) : ERR)"
.LASF789:
	.string	"htobe32(x) __bswap_32 (x)"
.LASF485:
	.string	"__nonnull(params) __attribute_nonnull__ (params)"
.LASF1245:
	.string	"_SC_REGEXP _SC_REGEXP"
.LASF2401:
	.string	"_SC_THREAD_SAFE_FUNCTIONS"
.LASF1325:
	.string	"_CS_XBS5_ILP32_OFF32_LIBS _CS_XBS5_ILP32_OFF32_LIBS"
.LASF1675:
	.string	"__MATH_DECLARING_FLOATN 0"
.LASF1434:
	.string	"__DECL_SIMD_powf16 "
.LASF2079:
	.string	"is_syncok(win) (NCURSES_OK_ADDR(win) ? (win)->_sync : FALSE)"
.LASF1216:
	.string	"_SC_XBS5_ILP32_OFFBIG _SC_XBS5_ILP32_OFFBIG"
.LASF197:
	.string	"__LDBL_DENORM_MIN__ 3.64519953188247460252840593361941982e-4951L"
.LASF349:
	.string	"__SEG_FS 1"
.LASF475:
	.string	"__attribute_pure__ __attribute__ ((__pure__))"
.LASF2395:
	.string	"_SC_PII_INTERNET_DGRAM"
.LASF1429:
	.string	"__DECL_SIMD_expf64x "
.LASF256:
	.string	"__FLT32X_DECIMAL_DIG__ 17"
.LASF79:
	.string	"__LONG_MAX__ 0x7fffffffffffffffL"
.LASF1586:
	.string	"__DECL_SIMD_atanhf64 "
.LASF314:
	.string	"__GCC_ATOMIC_CHAR32_T_LOCK_FREE 2"
.LASF1382:
	.string	"__DECL_SIMD_cosf "
.LASF1866:
	.string	"ACS_LARROW NCURSES_ACS(',')"
.LASF50:
	.string	"__INT16_TYPE__ short int"
.LASF235:
	.string	"__FLT128_DIG__ 33"
.LASF2159:
	.string	"KEY_SIC 0610"
.LASF2446:
	.string	"_SC_SHRT_MAX"
.LASF398:
	.string	"__KERNEL_STRICT_NAMES "
.LASF1817:
	.string	"__bool_true_false_are_defined 1"
.LASF634:
	.string	"__FILE_defined 1"
.LASF677:
	.string	"__HAVE_FLOAT64 1"
.LASF2534:
	.string	"_SC_RAW_SOCKETS"
.LASF1214:
	.string	"_SC_NL_TEXTMAX _SC_NL_TEXTMAX"
.LASF2091:
	.string	"KEY_LEFT 0404"
.LASF558:
	.string	"___int_size_t_h "
.LASF63:
	.string	"__UINT_LEAST32_TYPE__ unsigned int"
.LASF1741:
	.string	"M_2_SQRTPI 1.12837916709551257390"
.LASF554:
	.string	"_SIZE_T_DEFINED_ "
.LASF1738:
	.string	"M_PI_4 0.78539816339744830962"
.LASF2292:
	.string	"size_t"
.LASF318:
	.string	"__GCC_ATOMIC_LONG_LOCK_FREE 2"
.LASF778:
	.string	"PDP_ENDIAN __PDP_ENDIAN"
.LASF1348:
	.string	"_CS_POSIX_V6_LP64_OFF64_LDFLAGS _CS_POSIX_V6_LP64_OFF64_LDFLAGS"
.LASF1307:
	.string	"_CS_V6_WIDTH_RESTRICTED_ENVS _CS_V6_WIDTH_RESTRICTED_ENVS"
.LASF1695:
	.string	"_Mdouble_ _Float64x"
.LASF2497:
	.string	"_SC_TIMEOUTS"
.LASF609:
	.string	"__TIME_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF1407:
	.string	"__DECL_SIMD_sincosf128 "
.LASF2483:
	.string	"_SC_MULTI_PROCESS"
.LASF2216:
	.string	"ALL_MOUSE_EVENTS (REPORT_MOUSE_POSITION - 1)"
.LASF1087:
	.string	"_PC_2_SYMLINKS _PC_2_SYMLINKS"
.LASF1614:
	.string	"__DECL_SIMD_tanhf16 "
.LASF1885:
	.string	"ACS_SSSB ACS_LTEE"
.LASF2265:
	.string	"THERMAL_STATUS 2"
.LASF1285:
	.string	"_SC_LEVEL3_CACHE_ASSOC _SC_LEVEL3_CACHE_ASSOC"
.LASF523:
	.string	"__stub_fchflags "
.LASF2012:
	.string	"insertln() winsdelln(stdscr,1)"
.LASF659:
	.string	"L_ctermid 9"
.LASF2154:
	.string	"KEY_SEOL 0603"
.LASF2602:
	.string	"my_power"
.LASF575:
	.string	"__ULONGWORD_TYPE unsigned long int"
.LASF1054:
	.string	"__LP64_OFF64_LDFLAGS \"-m64\""
.LASF563:
	.string	"NULL"
.LASF2200:
	.string	"BUTTON3_DOUBLE_CLICKED NCURSES_MOUSE_MASK(3, NCURSES_DOUBLE_CLICKED)"
.LASF1678:
	.string	"__MATH_DECLARING_DOUBLE"
.LASF2101:
	.string	"KEY_EIC 0514"
.LASF2251:
	.string	"POLL_INTERVAL_S 1"
.LASF837:
	.string	"_BITS_ATOMIC_WIDE_COUNTER_H "
.LASF2096:
	.string	"KEY_F(n) (KEY_F0+(n))"
.LASF2363:
	.string	"_SC_RTSIG_MAX"
.LASF2476:
	.string	"_SC_FD_MGMT"
.LASF2485:
	.string	"_SC_NETWORKING"
.LASF379:
	.string	"__USE_XOPEN"
.LASF1447:
	.string	"__DECL_SIMD_acosf128 "
.LASF331:
	.string	"__amd64__ 1"
.LASF1250:
	.string	"_SC_SPORADIC_SERVER _SC_SPORADIC_SERVER"
.LASF2402:
	.string	"_SC_GETGR_R_SIZE_MAX"
.LASF402:
	.string	"_DEFAULT_SOURCE"
.LASF401:
	.string	"__GLIBC_USE(F) __GLIBC_USE_ ## F"
.LASF2455:
	.string	"_SC_NL_NMAX"
.LASF1639:
	.string	"__DECL_SIMD_erfcf64x "
.LASF1601:
	.string	"__DECL_SIMD_erf "
.LASF1513:
	.string	"__DECL_SIMD_expm1l "
.LASF1637:
	.string	"__DECL_SIMD_erfcf128 "
.LASF2036:
	.string	"mvwinch(win,y,x) (wmove((win),(y),(x)) == ERR ? NCURSES_CAST(chtype, ERR) : winch(win))"
.LASF752:
	.string	"__dev_t_defined "
.LASF422:
	.string	"__WORDSIZE_TIME64_COMPAT32 1"
.LASF2410:
	.string	"_SC_THREAD_ATTR_STACKADDR"
.LASF1826:
	.string	"WA_BLINK A_BLINK"
.LASF1013:
	.string	"_LFS64_ASYNCHRONOUS_IO 1"
.LASF2525:
	.string	"_SC_LEVEL2_CACHE_ASSOC"
.LASF517:
	.string	"__attr_access_none(argno) __attribute__ ((__access__ (__none__, argno)))"
.LASF2393:
	.string	"_SC_IOV_MAX"
.LASF2540:
	.string	"_SC_TRACE_EVENT_NAME_MAX"
.LASF502:
	.string	"__attribute_copy__(arg) __attribute__ ((__copy__ (arg)))"
.LASF1432:
	.string	"__DECL_SIMD_powf "
.LASF1728:
	.string	"MATH_ERRNO 1"
.LASF2009:
	.string	"innstr(s,n) winnstr(stdscr,(s),(n))"
.LASF2388:
	.string	"_SC_PII_INTERNET"
.LASF2177:
	.string	"KEY_RESIZE 0632"
.LASF588:
	.string	"__DEV_T_TYPE __UQUAD_TYPE"
.LASF735:
	.string	"__WCOREFLAG 0x80"
.LASF907:
	.string	"WCHAR_MIN __WCHAR_MIN"
.LASF931:
	.string	"__LC_PAPER 7"
.LASF172:
	.string	"__DBL_MIN_10_EXP__ (-307)"
.LASF2306:
	.string	"_IO_save_base"
.LASF509:
	.string	"__LDBL_REDIR_DECL(name) "
.LASF2006:
	.string	"inch() winch(stdscr)"
.LASF1448:
	.string	"__DECL_SIMD_acosf32x "
.LASF2102:
	.string	"KEY_CLEAR 0515"
.LASF2049:
	.string	"mvaddstr(y,x,str) mvwaddstr(stdscr,(y),(x),(str))"
.LASF543:
	.string	"__need_size_t "
.LASF1708:
	.string	"__MATHCALL_NARROW_ARGS_1"
.LASF1501:
	.string	"__DECL_SIMD_cosh "
.LASF1710:
	.string	"__MATHCALL_NARROW_ARGS_3"
.LASF1391:
	.string	"__DECL_SIMD_sin "
.LASF838:
	.string	"_THREAD_MUTEX_INTERNAL_H 1"
.LASF1499:
	.string	"__DECL_SIMD_exp10f64x "
.LASF1015:
	.string	"_LFS64_LARGEFILE 1"
.LASF2430:
	.string	"_SC_2_UPE"
.LASF187:
	.string	"__LDBL_MIN_EXP__ (-16381)"
.LASF762:
	.string	"__clockid_t_defined 1"
.LASF712:
	.string	"_BSD_WCHAR_T_"
.LASF1404:
	.string	"__DECL_SIMD_sincosf16 "
.LASF1173:
	.string	"_SC_NPROCESSORS_CONF _SC_NPROCESSORS_CONF"
.LASF323:
	.string	"__GCC_HAVE_DWARF2_CFI_ASM 1"
.LASF673:
	.string	"__CFLOAT128 _Complex _Float128"
.LASF1876:
	.string	"ACS_GEQUAL NCURSES_ACS('z')"
.LASF508:
	.string	"__LDBL_REDIR2_DECL(name) "
.LASF1995:
	.string	"chgat(n,a,c,o) wchgat(stdscr,(n),(a),(c),(o))"
.LASF552:
	.string	"_SIZE_T_ "
.LASF943:
	.string	"LC_ALL __LC_ALL"
.LASF2358:
	.string	"_SC_DELAYTIMER_MAX"
.LASF1154:
	.string	"_SC_PII_OSI_CLTS _SC_PII_OSI_CLTS"
.LASF991:
	.string	"_POSIX_CHOWN_RESTRICTED 0"
.LASF1925:
	.string	"A_DIM NCURSES_BITS(1U,12)"
.LASF1865:
	.string	"ACS_BULLET NCURSES_ACS('~')"
.LASF1155:
	.string	"_SC_PII_OSI_M _SC_PII_OSI_M"
.LASF1061:
	.string	"W_OK 2"
.LASF1123:
	.string	"_SC_SIGQUEUE_MAX _SC_SIGQUEUE_MAX"
.LASF562:
	.string	"__need_size_t"
.LASF2553:
	.string	"sensor"
.LASF1308:
	.string	"_CS_POSIX_V6_WIDTH_RESTRICTED_ENVS _CS_V6_WIDTH_RESTRICTED_ENVS"
.LASF1263:
	.string	"_SC_SYMLOOP_MAX _SC_SYMLOOP_MAX"
.LASF781:
	.string	"__bswap_constant_16(x) ((__uint16_t) ((((x) >> 8) & 0xff) | (((x) & 0xff) << 8)))"
.LASF1465:
	.string	"__DECL_SIMD_asinf32 "
.LASF105:
	.string	"__INT16_MAX__ 0x7fff"
.LASF1653:
	.string	"HUGE_VALL (__builtin_huge_vall ())"
.LASF2611:
	.string	"sscanf"
.LASF1331:
	.string	"_CS_XBS5_LP64_OFF64_CFLAGS _CS_XBS5_LP64_OFF64_CFLAGS"
.LASF945:
	.string	"LC_NAME __LC_NAME"
.LASF1766:
	.string	"NCURSES_EXPORT_GENERAL_EXPORT "
.LASF1503:
	.string	"__DECL_SIMD_coshl "
.LASF1679:
	.string	"__MATH_DECLARING_FLOATN"
.LASF1338:
	.string	"_CS_XBS5_LPBIG_OFFBIG_LINTFLAGS _CS_XBS5_LPBIG_OFFBIG_LINTFLAGS"
.LASF1205:
	.string	"_SC_UCHAR_MAX _SC_UCHAR_MAX"
.LASF1588:
	.string	"__DECL_SIMD_atanhf32x "
.LASF299:
	.string	"__DEC128_MIN__ 1E-6143DL"
.LASF1922:
	.string	"A_UNDERLINE NCURSES_BITS(1U,9)"
.LASF905:
	.string	"SIG_ATOMIC_MAX (2147483647)"
.LASF52:
	.string	"__INT64_TYPE__ long int"
.LASF949:
	.string	"LC_IDENTIFICATION __LC_IDENTIFICATION"
.LASF1004:
	.string	"_POSIX_THREAD_PRIO_PROTECT 200809L"
.LASF2563:
	.string	"time_unit"
.LASF289:
	.string	"__DEC64_MANT_DIG__ 16"
.LASF2237:
	.string	"TRACE_ICALLS 0x0200"
.LASF1484:
	.string	"__DECL_SIMD_exp2f16 "
.LASF167:
	.string	"__FLT_HAS_QUIET_NAN__ 1"
.LASF1656:
	.string	"__GLIBC_FLT_EVAL_METHOD __FLT_EVAL_METHOD__"
.LASF2495:
	.string	"_SC_SYSTEM_DATABASE"
.LASF2185:
	.string	"NCURSES_TRIPLE_CLICKED 020L"
.LASF921:
	.string	"_GCC_WRAP_STDINT_H "
.LASF2557:
	.string	"per_core"
.LASF1890:
	.string	"ACS_SSSS ACS_PLUS"
.LASF920:
	.string	"UINTMAX_C(c) c ## UL"
.LASF381:
	.string	"__USE_UNIX98"
.LASF2323:
	.string	"__pad5"
.LASF1606:
	.string	"__DECL_SIMD_erff64 "
.LASF586:
	.string	"__SYSCALL_SLONG_TYPE __SLONGWORD_TYPE"
.LASF2320:
	.string	"_wide_data"
.LASF1150:
	.string	"_SC_IOV_MAX _SC_IOV_MAX"
.LASF1681:
	.string	"__MATH_PRECNAME(name,r) name ##f ##r"
.LASF448:
	.string	"__CONCAT(x,y) x ## y"
.LASF1596:
	.string	"__DECL_SIMD_acoshf64 "
.LASF2284:
	.string	"SYSFS "
.LASF1312:
	.string	"_CS_POSIX_V5_WIDTH_RESTRICTED_ENVS _CS_V5_WIDTH_RESTRICTED_ENVS"
.LASF738:
	.string	"WSTOPSIG(status) __WSTOPSIG (status)"
.LASF1900:
	.string	"_NOCHANGE -1"
.LASF213:
	.string	"__FLT32_DENORM_MIN__ 1.40129846432481707092372958328991613e-45F32"
.LASF2399:
	.string	"_SC_T_IOV_MAX"
.LASF87:
	.string	"__SCHAR_WIDTH__ 8"
.LASF524:
	.string	"__stub_gtty "
.LASF2283:
	.string	"AMD_POWER_UNIT_MASK 0xF"
.LASF990:
	.string	"_POSIX_MEMORY_PROTECTION 200809L"
.LASF34:
	.string	"__ORDER_PDP_ENDIAN__ 3412"
.LASF621:
	.string	"__OFF_T_MATCHES_OFF64_T 1"
.LASF800:
	.string	"__FD_CLR(d,s) ((void) (__FDS_BITS (s)[__FD_ELT(d)] &= ~__FD_MASK(d)))"
.LASF2061:
	.string	"mvinsnstr(y,x,s,n) mvwinsnstr(stdscr,(y),(x),(s),(n))"
.LASF2065:
	.string	"getbkgd(win) (NCURSES_OK_ADDR(win) ? ((win)->_bkgd) : 0)"
.LASF2021:
	.string	"standout() wstandout(stdscr)"
.LASF80:
	.string	"__LONG_LONG_MAX__ 0x7fffffffffffffffLL"
.LASF1554:
	.string	"__DECL_SIMD_log10f16 "
.LASF1217:
	.string	"_SC_XBS5_LP64_OFF64 _SC_XBS5_LP64_OFF64"
.LASF1270:
	.string	"_SC_HOST_NAME_MAX _SC_HOST_NAME_MAX"
.LASF2230:
	.string	"TRACE_MOVE 0x0008"
.LASF2250:
	.string	"BUFSIZE 64"
.LASF1625:
	.string	"__DECL_SIMD_asinhf32 "
.LASF674:
	.string	"_BITS_FLOATN_COMMON_H "
.LASF1514:
	.string	"__DECL_SIMD_expm1f16 "
.LASF1776:
	.string	"NCURSES_PAIRS_T"
.LASF2130:
	.string	"KEY_HELP 0553"
.LASF1003:
	.string	"_POSIX_THREAD_PRIO_INHERIT 200809L"
.LASF1097:
	.string	"_SC_REALTIME_SIGNALS _SC_REALTIME_SIGNALS"
.LASF1915:
	.string	"NCURSES_ATTR_SHIFT 8"
.LASF1091:
	.string	"_SC_NGROUPS_MAX _SC_NGROUPS_MAX"
.LASF872:
	.string	"INT_LEAST8_MIN (-128)"
.LASF1516:
	.string	"__DECL_SIMD_expm1f64 "
.LASF2073:
	.string	"is_leaveok(win) (NCURSES_OK_ADDR(win) ? (win)->_leaveok : FALSE)"
.LASF623:
	.string	"__RLIM_T_MATCHES_RLIM64_T 1"
.LASF1574:
	.string	"__DECL_SIMD_log1pf16 "
.LASF1142:
	.string	"_SC_PII _SC_PII"
.LASF2544:
	.string	"_SC_XOPEN_STREAMS"
.LASF2081:
	.string	"wgetparent(win) (NCURSES_OK_ADDR(win) ? (win)->_parent : 0)"
.LASF1927:
	.string	"A_ALTCHARSET NCURSES_BITS(1U,14)"
.LASF2062:
	.string	"mvinsstr(y,x,s) mvwinsstr(stdscr,(y),(x),(s))"
.LASF1538:
	.string	"__DECL_SIMD_cbrtf32x "
.LASF918:
	.string	"UINT64_C(c) c ## UL"
.LASF672:
	.string	"__f128(x) x ##f128"
.LASF1594:
	.string	"__DECL_SIMD_acoshf16 "
.LASF821:
	.string	"__fsblkcnt_t_defined "
.LASF1223:
	.string	"_SC_BARRIERS _SC_BARRIERS"
.LASF228:
	.string	"__FLT64_EPSILON__ 2.22044604925031308084726333618164062e-16F64"
.LASF873:
	.string	"INT_LEAST16_MIN (-32767-1)"
.LASF1919:
	.string	"A_CHARTEXT (NCURSES_BITS(1U,0) - 1U)"
.LASF1871:
	.string	"ACS_LANTERN NCURSES_ACS('i')"
.LASF1016:
	.string	"_LFS64_STDIO 1"
.LASF100:
	.string	"__INTMAX_WIDTH__ 64"
.LASF776:
	.string	"LITTLE_ENDIAN __LITTLE_ENDIAN"
.LASF568:
	.string	"__GNUC_VA_LIST "
.LASF2050:
	.string	"mvchgat(y,x,n,a,c,o) mvwchgat(stdscr,(y),(x),(n),(a),(c),(o))"
.LASF1275:
	.string	"_SC_LEVEL1_ICACHE_SIZE _SC_LEVEL1_ICACHE_SIZE"
.LASF2208:
	.string	"BUTTON5_PRESSED NCURSES_MOUSE_MASK(5, NCURSES_BUTTON_PRESSED)"
.LASF123:
	.string	"__INT_LEAST64_WIDTH__ 64"
.LASF2035:
	.string	"mvwhline(win,y,x,c,n) (wmove((win),(y),(x)) == ERR ? ERR : whline((win),(c),(n)))"
.LASF1635:
	.string	"__DECL_SIMD_erfcf32 "
.LASF822:
	.string	"__fsfilcnt_t_defined "
.LASF1148:
	.string	"_SC_SELECT _SC_SELECT"
.LASF715:
	.string	"WNOHANG 1"
.LASF1343:
	.string	"_CS_POSIX_V6_ILP32_OFFBIG_CFLAGS _CS_POSIX_V6_ILP32_OFFBIG_CFLAGS"
.LASF1113:
	.string	"_SC_AIO_PRIO_DELTA_MAX _SC_AIO_PRIO_DELTA_MAX"
.LASF1763:
	.string	"NCURSES_EXPORT(type) NCURSES_IMPEXP type NCURSES_API"
.LASF1546:
	.string	"__DECL_SIMD_atan2f64 "
.LASF1751:
	.string	"CURSES 1"
.LASF2127:
	.string	"KEY_END 0550"
.LASF831:
	.string	"__SIZEOF_PTHREAD_COND_T 48"
.LASF9:
	.string	"__ATOMIC_RELAXED 0"
.LASF1839:
	.string	"COLOR_BLACK 0"
.LASF98:
	.string	"__UINTMAX_MAX__ 0xffffffffffffffffUL"
.LASF1341:
	.string	"_CS_POSIX_V6_ILP32_OFF32_LIBS _CS_POSIX_V6_ILP32_OFF32_LIBS"
.LASF1642:
	.string	"__DECL_SIMD_tanf "
.LASF365:
	.string	"__STDC_IEC_60559_COMPLEX__ 201404L"
.LASF978:
	.string	"_XOPEN_UNIX 1"
.LASF412:
	.string	"_POSIX_C_SOURCE 200809L"
.LASF925:
	.string	"__LC_NUMERIC 1"
.LASF1936:
	.string	"A_ITALIC NCURSES_BITS(1U,23)"
.LASF1959:
	.string	"getparx(win) (NCURSES_OK_ADDR(win) ? (win)->_parx : ERR)"
.LASF1313:
	.string	"_CS_V7_WIDTH_RESTRICTED_ENVS _CS_V7_WIDTH_RESTRICTED_ENVS"
.LASF585:
	.string	"_BITS_TYPESIZES_H 1"
.LASF1306:
	.string	"_CS_PATH _CS_PATH"
.LASF53:
	.string	"__UINT8_TYPE__ unsigned char"
.LASF989:
	.string	"_POSIX_MEMLOCK_RANGE 200809L"
.LASF1144:
	.string	"_SC_PII_SOCKET _SC_PII_SOCKET"
.LASF648:
	.string	"_IONBF 2"
.LASF1923:
	.string	"A_REVERSE NCURSES_BITS(1U,10)"
.LASF1898:
	.string	"_HASMOVED 0x20"
.LASF1857:
	.string	"ACS_VLINE NCURSES_ACS('x')"
.LASF1152:
	.string	"_SC_PII_INTERNET_DGRAM _SC_PII_INTERNET_DGRAM"
.LASF180:
	.string	"__DBL_DENORM_MIN__ ((double)4.94065645841246544176568792868221372e-324L)"
.LASF1683:
	.string	"_Mdouble_ long double"
.LASF1552:
	.string	"__DECL_SIMD_log10f "
.LASF1383:
	.string	"__DECL_SIMD_cosl "
.LASF1059:
	.string	"__socklen_t_defined "
.LASF147:
	.string	"__GCC_IEC_559 2"
.LASF168:
	.string	"__FLT_IS_IEC_60559__ 2"
.LASF469:
	.string	"__REDIRECT_NTHNL(name,proto,alias) name proto __asm__ (__ASMNAME (#alias)) __THROWNL"
.LASF1916:
	.string	"NCURSES_BITS(mask,shift) (NCURSES_CAST(chtype,(mask)) << ((shift) + NCURSES_ATTR_SHIFT))"
.LASF1274:
	.string	"_SC_TRACE_LOG _SC_TRACE_LOG"
.LASF1819:
	.string	"NCURSES_CAST(type,value) (type)(value)"
.LASF1914:
	.string	"NCURSES_SP_OUTC NCURSES_SP_NAME(NCURSES_OUTC)"
.LASF657:
	.string	"TMP_MAX 238328"
.LASF369:
	.string	"__GLIBC_INTERNAL_STARTING_HEADER_IMPLEMENTATION"
.LASF1063:
	.string	"F_OK 0"
.LASF717:
	.string	"WSTOPPED 2"
.LASF973:
	.string	"_XOPEN_VERSION 700"
.LASF2128:
	.string	"KEY_EXIT 0551"
.LASF2066:
	.string	"slk_attr_off(a,v) ((v) ? ERR : slk_attroff(a))"
.LASF819:
	.string	"__blksize_t_defined "
.LASF1674:
	.string	"__MATH_DECLARING_DOUBLE 1"
.LASF2215:
	.string	"REPORT_MOUSE_POSITION NCURSES_MOUSE_MASK(6, 0010L)"
.LASF1208:
	.string	"_SC_USHRT_MAX _SC_USHRT_MAX"
.LASF845:
	.string	"__have_pthread_attr_t 1"
.LASF1838:
	.string	"WA_ITALIC A_ITALIC"
.LASF718:
	.string	"WEXITED 4"
.LASF1184:
	.string	"_SC_XOPEN_SHM _SC_XOPEN_SHM"
.LASF134:
	.string	"__INT_FAST16_MAX__ 0x7fffffffffffffffL"
.LASF2126:
	.string	"KEY_CREATE 0547"
.LASF2025:
	.string	"mvwaddch(win,y,x,ch) (wmove((win),(y),(x)) == ERR ? ERR : waddch((win),(ch)))"
.LASF1007:
	.string	"_POSIX_SEMAPHORES 200809L"
.LASF1739:
	.string	"M_1_PI 0.31830988618379067154"
.LASF1080:
	.string	"_PC_FILESIZEBITS _PC_FILESIZEBITS"
.LASF1579:
	.string	"__DECL_SIMD_log1pf64x "
.LASF711:
	.string	"_WCHAR_T_DECLARED "
.LASF923:
	.string	"_BITS_LOCALE_H 1"
.LASF12:
	.string	"__ATOMIC_RELEASE 3"
.LASF107:
	.string	"__INT64_MAX__ 0x7fffffffffffffffL"
.LASF835:
	.string	"__LOCK_ALIGNMENT "
.LASF346:
	.string	"__SSE_MATH__ 1"
.LASF2201:
	.string	"BUTTON3_TRIPLE_CLICKED NCURSES_MOUSE_MASK(3, NCURSES_TRIPLE_CLICKED)"
.LASF5:
	.string	"__GNUC__ 11"
.LASF1845:
	.string	"COLOR_CYAN 6"
.LASF2259:
	.string	"IA32_THERM_STATUS 0x19C"
.LASF987:
	.string	"_POSIX_MAPPED_FILES 200809L"
.LASF1725:
	.string	"isnormal(x) __builtin_isnormal (x)"
.LASF273:
	.string	"__FLT64X_MAX__ 1.18973149535723176502126385303097021e+4932F64x"
.LASF727:
	.string	"__WIFEXITED(status) (__WTERMSIG(status) == 0)"
.LASF2559:
	.string	"cores"
.LASF1886:
	.string	"ACS_SSBS ACS_BTEE"
.LASF2382:
	.string	"_SC_2_FORT_RUN"
.LASF1734:
	.string	"M_LN2 0.69314718055994530942"
.LASF2281:
	.string	"AMD_TIME_UNIT_MASK 0xF0000"
.LASF1638:
	.string	"__DECL_SIMD_erfcf32x "
.LASF1156:
	.string	"_SC_T_IOV_MAX _SC_T_IOV_MAX"
.LASF812:
	.string	"__FDS_BITS(set) ((set)->__fds_bits)"
.LASF120:
	.string	"__INT_LEAST32_WIDTH__ 32"
.LASF1215:
	.string	"_SC_XBS5_ILP32_OFF32 _SC_XBS5_ILP32_OFF32"
.LASF1262:
	.string	"_SC_2_PBS_TRACK _SC_2_PBS_TRACK"
.LASF947:
	.string	"LC_TELEPHONE __LC_TELEPHONE"
.LASF2151:
	.string	"KEY_SDL 0600"
.LASF2465:
	.string	"_SC_ADVISORY_INFO"
.LASF258:
	.string	"__FLT32X_NORM_MAX__ 1.79769313486231570814527423731704357e+308F32x"
.LASF919:
	.string	"INTMAX_C(c) c ## L"
.LASF2578:
	.string	"running_with_privileges"
.LASF1611:
	.string	"__DECL_SIMD_tanh "
.LASF184:
	.string	"__DBL_IS_IEC_60559__ 2"
.LASF1280:
	.string	"_SC_LEVEL1_DCACHE_LINESIZE _SC_LEVEL1_DCACHE_LINESIZE"
.LASF1895:
	.string	"_FULLWIN 0x04"
.LASF1368:
	.string	"_CS_POSIX_V7_LPBIG_OFFBIG_LDFLAGS _CS_POSIX_V7_LPBIG_OFFBIG_LDFLAGS"
.LASF1366:
	.string	"_CS_POSIX_V7_LP64_OFF64_LINTFLAGS _CS_POSIX_V7_LP64_OFF64_LINTFLAGS"
.LASF328:
	.string	"__SIZEOF_WINT_T__ 4"
.LASF963:
	.string	"LC_GLOBAL_LOCALE ((locale_t) -1L)"
.LASF223:
	.string	"__FLT64_MAX_10_EXP__ 308"
.LASF1720:
	.string	"FP_SUBNORMAL 3"
.LASF2277:
	.string	"AMD_CPUID 0x80000007"
.LASF1880:
	.string	"ACS_BSSB ACS_ULCORNER"
.LASF246:
	.string	"__FLT128_HAS_DENORM__ 1"
.LASF670:
	.string	"__HAVE_FLOAT64X 1"
.LASF2400:
	.string	"_SC_THREADS"
.LASF2078:
	.string	"is_subwin(win) (NCURSES_OK_ADDR(win) ? ((win)->_flags & _SUBWIN) != 0 : FALSE)"
.LASF1587:
	.string	"__DECL_SIMD_atanhf128 "
.LASF275:
	.string	"__FLT64X_MIN__ 3.36210314311209350626267781732175260e-4932F64x"
.LASF2496:
	.string	"_SC_SYSTEM_DATABASE_R"
.LASF2500:
	.string	"_SC_USER_GROUPS_R"
.LASF957:
	.string	"LC_NAME_MASK (1 << __LC_NAME)"
.LASF2214:
	.string	"BUTTON_ALT NCURSES_MOUSE_MASK(6, 0004L)"
.LASF78:
	.string	"__INT_MAX__ 0x7fffffff"
.LASF495:
	.string	"__va_arg_pack() __builtin_va_arg_pack ()"
.LASF1194:
	.string	"_SC_INT_MAX _SC_INT_MAX"
.LASF1860:
	.string	"ACS_S9 NCURSES_ACS('s')"
.LASF1790:
	.string	"NCURSES_TPARM_VARARGS 1"
.LASF1278:
	.string	"_SC_LEVEL1_DCACHE_SIZE _SC_LEVEL1_DCACHE_SIZE"
.LASF788:
	.string	"le16toh(x) __uint16_identity (x)"
.LASF75:
	.string	"__GXX_ABI_VERSION 1016"
.LASF2067:
	.string	"slk_attr_on(a,v) ((v) ? ERR : slk_attron(a))"
.LASF344:
	.string	"__SSE2__ 1"
.LASF83:
	.string	"__WINT_MAX__ 0xffffffffU"
.LASF1005:
	.string	"_POSIX_THREAD_ROBUST_PRIO_INHERIT 200809L"
.LASF1350:
	.string	"_CS_POSIX_V6_LP64_OFF64_LINTFLAGS _CS_POSIX_V6_LP64_OFF64_LINTFLAGS"
.LASF2019:
	.string	"setscrreg(t,b) wsetscrreg(stdscr,(t),(b))"
.LASF415:
	.string	"__USE_POSIX199309 1"
.LASF2064:
	.string	"mvvline(y,x,c,n) mvwvline(stdscr,(y),(x),(c),(n))"
.LASF457:
	.string	"__glibc_safe_len_cond(__l,__s,__osz) ((__l) <= (__osz) / (__s))"
.LASF1415:
	.string	"__DECL_SIMD_logf32 "
.LASF233:
	.string	"__FLT64_IS_IEC_60559__ 2"
.LASF2449:
	.string	"_SC_UINT_MAX"
.LASF327:
	.string	"__SIZEOF_WCHAR_T__ 4"
.LASF2058:
	.string	"mvinchstr(y,x,s) mvwinchstr(stdscr,(y),(x),(s))"
.LASF1778:
	.string	"NCURSES_OPAQUE 0"
.LASF149:
	.string	"__FLT_EVAL_METHOD__ 0"
.LASF899:
	.string	"INTMAX_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF432:
	.string	"__GLIBC__ 2"
.LASF84:
	.string	"__WINT_MIN__ 0U"
.LASF2365:
	.string	"_SC_SEM_VALUE_MAX"
.LASF886:
	.string	"INT_FAST32_MIN (-9223372036854775807L-1)"
.LASF104:
	.string	"__INT8_MAX__ 0x7f"
.LASF1460:
	.string	"__DECL_SIMD_atanf128x "
.LASF866:
	.string	"INT32_MAX (2147483647)"
.LASF1086:
	.string	"_PC_SYMLINK_MAX _PC_SYMLINK_MAX"
.LASF1753:
	.string	"NCURSES_VERSION_MAJOR 6"
.LASF703:
	.string	"_WCHAR_T_ "
.LASF1009:
	.string	"_POSIX_ASYNCHRONOUS_IO 200809L"
.LASF1968:
	.string	"untouchwin(win) wtouchln((win), 0, getmaxy(win), 0)"
.LASF1121:
	.string	"_SC_SEM_NSEMS_MAX _SC_SEM_NSEMS_MAX"
.LASF2294:
	.string	"__off_t"
.LASF1795:
	.string	"NCURSES_CH_T"
.LASF113:
	.string	"__INT8_C(c) c"
.LASF1769:
	.string	"NCURSES_ATTR_T int"
.LASF1459:
	.string	"__DECL_SIMD_atanf64x "
.LASF1505:
	.string	"__DECL_SIMD_coshf32 "
.LASF2270:
	.string	"OTHER_STATUS 256"
.LASF446:
	.string	"__P(args) args"
.LASF2541:
	.string	"_SC_TRACE_NAME_MAX"
.LASF686:
	.string	"__HAVE_FLOAT128_UNLIKE_LDBL (__HAVE_DISTINCT_FLOAT128 && __LDBL_MANT_DIG__ != 113)"
.LASF16:
	.string	"__PIC__ 2"
.LASF2574:
	.string	"period_counter"
.LASF898:
	.string	"UINTPTR_MAX (18446744073709551615UL)"
.LASF1988:
	.string	"attr_on(a,o) wattr_on(stdscr,(a),(o))"
.LASF876:
	.string	"INT_LEAST8_MAX (127)"
.LASF548:
	.string	"_SYS_SIZE_T_H "
.LASF599:
	.string	"__RLIM_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF1058:
	.string	"__useconds_t_defined "
.LASF1691:
	.string	"_Mdouble_ _Float128"
.LASF1388:
	.string	"__DECL_SIMD_cosf32x "
.LASF1287:
	.string	"_SC_LEVEL4_CACHE_SIZE _SC_LEVEL4_CACHE_SIZE"
.LASF1818:
	.string	"NCURSES_BOOL bool"
.LASF1897:
	.string	"_ISPAD 0x10"
.LASF1371:
	.string	"_CS_V6_ENV _CS_V6_ENV"
.LASF225:
	.string	"__FLT64_MAX__ 1.79769313486231570814527423731704357e+308F64"
.LASF1365:
	.string	"_CS_POSIX_V7_LP64_OFF64_LIBS _CS_POSIX_V7_LP64_OFF64_LIBS"
.LASF638:
	.string	"_IO_EOF_SEEN 0x0010"
.LASF332:
	.string	"__x86_64 1"
.LASF1803:
	.string	"va_copy(d,s) __builtin_va_copy(d,s)"
.LASF1967:
	.string	"touchline(win,s,c) wtouchln((win), s, c, 1)"
.LASF2107:
	.string	"KEY_NPAGE 0522"
.LASF1126:
	.string	"_SC_BC_DIM_MAX _SC_BC_DIM_MAX"
.LASF2194:
	.string	"BUTTON2_CLICKED NCURSES_MOUSE_MASK(2, NCURSES_BUTTON_CLICKED)"
.LASF1068:
	.string	"_PC_MAX_CANON _PC_MAX_CANON"
.LASF1351:
	.string	"_CS_POSIX_V6_LPBIG_OFFBIG_CFLAGS _CS_POSIX_V6_LPBIG_OFFBIG_CFLAGS"
.LASF393:
	.string	"__USE_FORTIFY_LEVEL"
.LASF2472:
	.string	"_SC_THREAD_CPUTIME"
.LASF2227:
	.string	"TRACE_TIMES 0x0001"
.LASF1847:
	.string	"NCURSES_ACS(c) (acs_map[NCURSES_CAST(unsigned char,(c))])"
.LASF2333:
	.string	"_SC_CHILD_MAX"
.LASF2258:
	.string	"MSR_TEMPERATURE_TARGET 0x1A2"
.LASF371:
	.string	"__USE_ISOC11"
.LASF2308:
	.string	"_IO_save_end"
.LASF807:
	.string	"__suseconds_t_defined "
.LASF610:
	.string	"__USECONDS_T_TYPE __U32_TYPE"
.LASF864:
	.string	"INT8_MAX (127)"
.LASF824:
	.string	"_THREAD_SHARED_TYPES_H 1"
.LASF2193:
	.string	"BUTTON2_PRESSED NCURSES_MOUSE_MASK(2, NCURSES_BUTTON_PRESSED)"
.LASF816:
	.string	"FD_CLR(fd,fdsetp) __FD_CLR (fd, fdsetp)"
.LASF1573:
	.string	"__DECL_SIMD_log1pl "
.LASF1455:
	.string	"__DECL_SIMD_atanf32 "
.LASF1246:
	.string	"_SC_REGEX_VERSION _SC_REGEX_VERSION"
.LASF887:
	.string	"INT_FAST64_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF2511:
	.string	"_SC_V6_LP64_OFF64"
.LASF1477:
	.string	"__DECL_SIMD_hypotf128 "
.LASF367:
	.string	"_STDIO_H 1"
.LASF1500:
	.string	"__DECL_SIMD_exp10f128x "
.LASF2335:
	.string	"_SC_NGROUPS_MAX"
.LASF1405:
	.string	"__DECL_SIMD_sincosf32 "
.LASF611:
	.string	"__SUSECONDS_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF1178:
	.string	"_SC_PASS_MAX _SC_PASS_MAX"
.LASF1578:
	.string	"__DECL_SIMD_log1pf32x "
.LASF1095:
	.string	"_SC_JOB_CONTROL _SC_JOB_CONTROL"
.LASF1712:
	.string	"__MATHCALL_NARROW_REDIR"
.LASF397:
	.string	"__GLIBC_USE_DEPRECATED_SCANF"
.LASF1114:
	.string	"_SC_DELAYTIMER_MAX _SC_DELAYTIMER_MAX"
.LASF1527:
	.string	"__DECL_SIMD_sinhf128 "
.LASF1693:
	.string	"_Mdouble_ _Float32x"
.LASF423:
	.string	"__SYSCALL_WORDSIZE 64"
.LASF2093:
	.string	"KEY_HOME 0406"
.LASF386:
	.string	"__USE_LARGEFILE"
.LASF1938:
	.string	"getbegyx(win,y,x) (y = getbegy(win), x = getbegx(win))"
.LASF1706:
	.string	"__MATHCALL_NARROW_REDIR(func,redir,nargs) extern _Mret_ __REDIRECT_NTH (func, __MATHCALL_NARROW_ARGS_ ## nargs, redir)"
.LASF283:
	.string	"__DEC32_MIN_EXP__ (-94)"
.LASF1522:
	.string	"__DECL_SIMD_sinhf "
.LASF2545:
	.string	"_SC_THREAD_ROBUST_PRIO_INHERIT"
.LASF983:
	.string	"_POSIX_SAVED_IDS 1"
.LASF307:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 1"
.LASF1435:
	.string	"__DECL_SIMD_powf32 "
.LASF1051:
	.string	"__ILP32_OFFBIG_CFLAGS \"-m32 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64\""
.LASF1566:
	.string	"__DECL_SIMD_log2f64 "
.LASF1451:
	.string	"__DECL_SIMD_atan "
.LASF2141:
	.string	"KEY_REPLACE 0566"
.LASF2406:
	.string	"_SC_THREAD_DESTRUCTOR_ITERATIONS"
.LASF199:
	.string	"__LDBL_HAS_INFINITY__ 1"
.LASF2467:
	.string	"_SC_BASE"
.LASF55:
	.string	"__UINT32_TYPE__ unsigned int"
.LASF1129:
	.string	"_SC_COLL_WEIGHTS_MAX _SC_COLL_WEIGHTS_MAX"
.LASF1961:
	.string	"wstandout(win) (wattrset(win,A_STANDOUT))"
.LASF1699:
	.string	"__MATHDECL_ALIAS"
.LASF477:
	.string	"__attribute_maybe_unused__ __attribute__ ((__unused__))"
.LASF267:
	.string	"__FLT64X_DIG__ 18"
.LASF1134:
	.string	"_SC_CHARCLASS_NAME_MAX _SC_CHARCLASS_NAME_MAX"
.LASF2338:
	.string	"_SC_TZNAME_MAX"
.LASF1896:
	.string	"_SCROLLWIN 0x08"
.LASF632:
	.string	"_____fpos64_t_defined 1"
.LASF882:
	.string	"UINT_LEAST32_MAX (4294967295U)"
.LASF2443:
	.string	"_SC_SSIZE_MAX"
.LASF1474:
	.string	"__DECL_SIMD_hypotf16 "
.LASF190:
	.string	"__LDBL_MAX_10_EXP__ 4932"
.LASF452:
	.string	"__END_DECLS "
.LASF2397:
	.string	"_SC_PII_OSI_CLTS"
.LASF2121:
	.string	"KEY_BEG 0542"
.LASF932:
	.string	"__LC_NAME 8"
.LASF2040:
	.string	"mvwinsch(win,y,x,c) (wmove((win),(y),(x)) == ERR ? ERR : winsch((win),(c)))"
.LASF294:
	.string	"__DEC64_EPSILON__ 1E-15DD"
.LASF658:
	.string	"FILENAME_MAX 4096"
.LASF1468:
	.string	"__DECL_SIMD_asinf32x "
.LASF565:
	.string	"__need_NULL"
.LASF1210:
	.string	"_SC_NL_LANGMAX _SC_NL_LANGMAX"
.LASF2118:
	.string	"KEY_C1 0537"
.LASF1238:
	.string	"_SC_FILE_SYSTEM _SC_FILE_SYSTEM"
.LASF850:
	.string	"_STRING_H 1"
.LASF1302:
	.string	"_SC_THREAD_ROBUST_PRIO_INHERIT _SC_THREAD_ROBUST_PRIO_INHERIT"
.LASF1643:
	.string	"__DECL_SIMD_tanl "
.LASF284:
	.string	"__DEC32_MAX_EXP__ 97"
.LASF1374:
	.string	"_GETOPT_CORE_H 1"
.LASF596:
	.string	"__OFF_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF934:
	.string	"__LC_TELEPHONE 10"
.LASF265:
	.string	"__FLT32X_IS_IEC_60559__ 2"
.LASF1729:
	.string	"MATH_ERREXCEPT 2"
.LASF1949:
	.string	"crmode() cbreak()"
.LASF1191:
	.string	"_SC_CHAR_BIT _SC_CHAR_BIT"
.LASF1731:
	.string	"M_E 2.7182818284590452354"
.LASF2072:
	.string	"is_keypad(win) (NCURSES_OK_ADDR(win) ? (win)->_use_keypad : FALSE)"
.LASF1011:
	.string	"_LFS_ASYNCHRONOUS_IO 1"
.LASF1700:
	.string	"__MATHDECL"
.LASF1597:
	.string	"__DECL_SIMD_acoshf128 "
.LASF1735:
	.string	"M_LN10 2.30258509299404568402"
.LASF244:
	.string	"__FLT128_EPSILON__ 1.92592994438723585305597794258492732e-34F128"
.LASF326:
	.string	"__SIZEOF_INT128__ 16"
.LASF1290:
	.string	"_SC_IPV6 _SC_IPV6"
.LASF2288:
	.string	"short unsigned int"
.LASF249:
	.string	"__FLT128_IS_IEC_60559__ 2"
.LASF2289:
	.string	"signed char"
.LASF687:
	.string	"__HAVE_FLOATN_NOT_TYPEDEF 1"
.LASF315:
	.string	"__GCC_ATOMIC_WCHAR_T_LOCK_FREE 2"
.LASF1304:
	.string	"_SC_MINSIGSTKSZ _SC_MINSIGSTKSZ"
.LASF2004:
	.string	"getch() wgetch(stdscr)"
.LASF177:
	.string	"__DBL_NORM_MAX__ ((double)1.79769313486231570814527423731704357e+308L)"
.LASF1399:
	.string	"__DECL_SIMD_sinf64x "
.LASF1582:
	.string	"__DECL_SIMD_atanhf "
.LASF1230:
	.string	"_SC_DEVICE_IO _SC_DEVICE_IO"
.LASF1488:
	.string	"__DECL_SIMD_exp2f32x "
.LASF1188:
	.string	"_SC_XOPEN_XPG2 _SC_XOPEN_XPG2"
.LASF1515:
	.string	"__DECL_SIMD_expm1f32 "
.LASF335:
	.string	"__SIZEOF_FLOAT128__ 16"
.LASF545:
	.string	"__size_t__ "
.LASF2253:
	.string	"POWER_DOMAIN_COUNT 3"
.LASF417:
	.string	"__USE_XOPEN2K 1"
.LASF574:
	.string	"__SLONGWORD_TYPE long int"
.LASF2507:
	.string	"_SC_STREAMS"
.LASF1960:
	.string	"getpary(win) (NCURSES_OK_ADDR(win) ? (win)->_pary : ERR)"
.LASF2367:
	.string	"_SC_TIMER_MAX"
.LASF1520:
	.string	"__DECL_SIMD_expm1f128x "
.LASF2585:
	.string	"get_battery_status"
.LASF2068:
	.string	"is_cleared(win) (NCURSES_OK_ADDR(win) ? (win)->_clear : FALSE)"
.LASF1962:
	.string	"wstandend(win) (wattrset(win,A_NORMAL))"
.LASF279:
	.string	"__FLT64X_HAS_INFINITY__ 1"
.LASF478:
	.string	"__attribute_used__ __attribute__ ((__used__))"
.LASF30:
	.string	"__CHAR_BIT__ 8"
.LASF2362:
	.string	"_SC_PAGESIZE"
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
.LASF1599:
	.string	"__DECL_SIMD_acoshf64x "
.LASF995:
	.string	"_XOPEN_REALTIME_THREADS 1"
.LASF2570:
	.string	"status"
.LASF900:
	.string	"INTMAX_MAX (__INT64_C(9223372036854775807))"
.LASF521:
	.string	"__stub___compat_bdflush "
.LASF1867:
	.string	"ACS_RARROW NCURSES_ACS('+')"
.LASF1937:
	.string	"getyx(win,y,x) (y = getcury(win), x = getcurx(win))"
.LASF1187:
	.string	"_SC_2_UPE _SC_2_UPE"
.LASF1978:
	.string	"waddchstr(win,str) waddchnstr(win,str,-1)"
.LASF1137:
	.string	"_SC_2_C_DEV _SC_2_C_DEV"
.LASF1226:
	.string	"_SC_C_LANG_SUPPORT_R _SC_C_LANG_SUPPORT_R"
.LASF2039:
	.string	"mvwinnstr(win,y,x,s,n) (wmove((win),(y),(x)) == ERR ? ERR : winnstr((win),(s),(n)))"
.LASF844:
	.string	"__ONCE_FLAG_INIT { 0 }"
.LASF1098:
	.string	"_SC_PRIORITY_SCHEDULING _SC_PRIORITY_SCHEDULING"
.LASF370:
	.string	"_FEATURES_H 1"
.LASF689:
	.string	"__f64(x) x ##f64"
.LASF277:
	.string	"__FLT64X_DENORM_MIN__ 3.64519953188247460252840593361941982e-4951F64x"
.LASF2108:
	.string	"KEY_PPAGE 0523"
.LASF553:
	.string	"_BSD_SIZE_T_ "
.LASF496:
	.string	"__va_arg_pack_len() __builtin_va_arg_pack_len ()"
.LASF1690:
	.string	"__MATH_PRECNAME(name,r) name ##f64 ##r"
.LASF480:
	.string	"__attribute_deprecated__ __attribute__ ((__deprecated__))"
.LASF2014:
	.string	"insstr(s) winsstr(stdscr,(s))"
.LASF2462:
	.string	"_SC_XOPEN_LEGACY"
.LASF956:
	.string	"LC_PAPER_MASK (1 << __LC_PAPER)"
.LASF1041:
	.string	"_POSIX_TRACE_LOG -1"
.LASF1746:
	.string	"isless(x,y) __builtin_isless(x, y)"
.LASF2213:
	.string	"BUTTON_SHIFT NCURSES_MOUSE_MASK(6, 0002L)"
.LASF1108:
	.string	"_SC_MESSAGE_PASSING _SC_MESSAGE_PASSING"
.LASF823:
	.string	"_BITS_PTHREADTYPES_COMMON_H 1"
.LASF1027:
	.string	"_POSIX_BARRIERS 200809L"
.LASF1084:
	.string	"_PC_REC_XFER_ALIGN _PC_REC_XFER_ALIGN"
.LASF723:
	.string	"__WCLONE 0x80000000"
.LASF11:
	.string	"__ATOMIC_ACQUIRE 2"
.LASF1140:
	.string	"_SC_2_SW_DEV _SC_2_SW_DEV"
.LASF982:
	.string	"_POSIX_JOB_CONTROL 1"
.LASF1563:
	.string	"__DECL_SIMD_log2l "
.LASF1356:
	.string	"_CS_POSIX_V7_ILP32_OFF32_LDFLAGS _CS_POSIX_V7_ILP32_OFF32_LDFLAGS"
.LASF2169:
	.string	"KEY_SRIGHT 0622"
.LASF321:
	.string	"__GCC_ATOMIC_POINTER_LOCK_FREE 2"
.LASF1323:
	.string	"_CS_XBS5_ILP32_OFF32_CFLAGS _CS_XBS5_ILP32_OFF32_CFLAGS"
.LASF818:
	.string	"FD_ZERO(fdsetp) __FD_ZERO (fdsetp)"
.LASF1056:
	.string	"STDOUT_FILENO 1"
.LASF2300:
	.string	"_IO_read_base"
.LASF739:
	.string	"WIFEXITED(status) __WIFEXITED (status)"
.LASF597:
	.string	"__OFF64_T_TYPE __SQUAD_TYPE"
.LASF1284:
	.string	"_SC_LEVEL3_CACHE_SIZE _SC_LEVEL3_CACHE_SIZE"
.LASF678:
	.string	"__HAVE_FLOAT32X 1"
.LASF2318:
	.string	"_offset"
.LASF2346:
	.string	"_SC_SYNCHRONIZED_IO"
.LASF207:
	.string	"__FLT32_MAX_10_EXP__ 38"
.LASF927:
	.string	"__LC_COLLATE 3"
.LASF8:
	.string	"__VERSION__ \"11.4.0\""
.LASF1082:
	.string	"_PC_REC_MAX_XFER_SIZE _PC_REC_MAX_XFER_SIZE"
.LASF1813:
	.string	"_STDBOOL_H "
.LASF516:
	.string	"__fortified_attr_access(a,o,s) __attr_access ((a, o, s))"
.LASF1528:
	.string	"__DECL_SIMD_sinhf32x "
.LASF1802:
	.string	"va_arg(v,l) __builtin_va_arg(v,l)"
.LASF1912:
	.string	"NCURSES_SP_FUNCS 20211021"
.LASF291:
	.string	"__DEC64_MAX_EXP__ 385"
.LASF2305:
	.string	"_IO_buf_end"
.LASF1910:
	.string	"NCURSES_EXT_FUNCS 20211021"
.LASF1174:
	.string	"_SC_NPROCESSORS_ONLN _SC_NPROCESSORS_ONLN"
.LASF93:
	.string	"__WINT_WIDTH__ 32"
.LASF698:
	.string	"__WCHAR_T__ "
.LASF2278:
	.string	"AMD_MSR_PWR_UNIT 0xC0010299"
.LASF589:
	.string	"__UID_T_TYPE __U32_TYPE"
.LASF2075:
	.string	"is_notimeout(win) (NCURSES_OK_ADDR(win) ? (win)->_notimeout : FALSE)"
.LASF22:
	.string	"__SIZEOF_INT__ 4"
.LASF1376:
	.string	"F_LOCK 1"
.LASF198:
	.string	"__LDBL_HAS_DENORM__ 1"
.LASF1624:
	.string	"__DECL_SIMD_asinhf16 "
.LASF1825:
	.string	"WA_REVERSE A_REVERSE"
.LASF424:
	.string	"__TIMESIZE __WORDSIZE"
.LASF1615:
	.string	"__DECL_SIMD_tanhf32 "
.LASF440:
	.string	"__LEAF , __leaf__"
.LASF1349:
	.string	"_CS_POSIX_V6_LP64_OFF64_LIBS _CS_POSIX_V6_LP64_OFF64_LIBS"
.LASF2090:
	.string	"KEY_UP 0403"
.LASF1417:
	.string	"__DECL_SIMD_logf128 "
.LASF1539:
	.string	"__DECL_SIMD_cbrtf64x "
.LASF1934:
	.string	"A_TOP NCURSES_BITS(1U,21)"
.LASF1832:
	.string	"WA_HORIZONTAL A_HORIZONTAL"
.LASF2475:
	.string	"_SC_DEVICE_SPECIFIC_R"
.LASF129:
	.string	"__UINT32_C(c) c ## U"
.LASF222:
	.string	"__FLT64_MAX_EXP__ 1024"
.LASF2249:
	.string	"POWER_LIMIT_COUNT 2"
.LASF2146:
	.string	"KEY_SCANCEL 0573"
.LASF136:
	.string	"__INT_FAST32_MAX__ 0x7fffffffffffffffL"
.LASF1853:
	.string	"ACS_RTEE NCURSES_ACS('u')"
.LASF942:
	.string	"LC_MESSAGES __LC_MESSAGES"
.LASF1749:
	.string	"isunordered(x,y) __builtin_isunordered(x, y)"
.LASF2584:
	.string	"get_amd_pkg_power_w"
.LASF1737:
	.string	"M_PI_2 1.57079632679489661923"
.LASF2256:
	.string	"MSR_PKG_POWER_LIMIT 0x610"
.LASF2324:
	.string	"_mode"
.LASF1300:
	.string	"_SC_TRACE_USER_EVENT_MAX _SC_TRACE_USER_EVENT_MAX"
.LASF1055:
	.string	"STDIN_FILENO 0"
.LASF511:
	.string	"__REDIRECT_NTH_LDBL(name,proto,alias) __REDIRECT_NTH (name, proto, alias)"
.LASF979:
	.string	"_XOPEN_ENH_I18N 1"
.LASF1046:
	.string	"_POSIX_V7_LP64_OFF64 1"
.LASF2478:
	.string	"_SC_PIPE"
.LASF2301:
	.string	"_IO_write_base"
.LASF939:
	.string	"LC_TIME __LC_TIME"
.LASF1875:
	.string	"ACS_LEQUAL NCURSES_ACS('y')"
.LASF1186:
	.string	"_SC_2_C_VERSION _SC_2_C_VERSION"
.LASF2425:
	.string	"_SC_XOPEN_CRYPT"
.LASF1408:
	.string	"__DECL_SIMD_sincosf32x "
.LASF1510:
	.string	"__DECL_SIMD_coshf128x "
.LASF760:
	.string	"__key_t_defined "
.LASF1567:
	.string	"__DECL_SIMD_log2f128 "
.LASF1411:
	.string	"__DECL_SIMD_log "
.LASF688:
	.string	"__f32(x) x ##f32"
.LASF1066:
	.string	"L_XTND SEEK_END"
.LASF1609:
	.string	"__DECL_SIMD_erff64x "
.LASF591:
	.string	"__INO_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF1146:
	.string	"_SC_PII_OSI _SC_PII_OSI"
.LASF2614:
	.string	"/home/jscha/dvp/cpumon/src/cpumonlib.c"
.LASF1719:
	.string	"FP_ZERO 2"
.LASF786:
	.string	"htole16(x) __uint16_identity (x)"
.LASF2140:
	.string	"KEY_REFRESH 0565"
.LASF590:
	.string	"__GID_T_TYPE __U32_TYPE"
.LASF1855:
	.string	"ACS_TTEE NCURSES_ACS('w')"
.LASF2418:
	.string	"_SC_PHYS_PAGES"
.LASF775:
	.string	"__LONG_LONG_PAIR(HI,LO) LO, HI"
.LASF2037:
	.string	"mvwinchnstr(win,y,x,s,n) (wmove((win),(y),(x)) == ERR ? ERR : winchnstr((win),(s),(n)))"
.LASF1779:
	.string	"NCURSES_OPAQUE_FORM 0"
.LASF1251:
	.string	"_SC_THREAD_SPORADIC_SERVER _SC_THREAD_SPORADIC_SERVER"
.LASF354:
	.string	"__linux__ 1"
.LASF1424:
	.string	"__DECL_SIMD_expf16 "
.LASF2576:
	.string	"core_count"
.LASF303:
	.string	"__REGISTER_PREFIX__ "
.LASF2026:
	.string	"mvwaddchnstr(win,y,x,str,n) (wmove((win),(y),(x)) == ERR ? ERR : waddchnstr((win),(str),(n)))"
.LASF1288:
	.string	"_SC_LEVEL4_CACHE_ASSOC _SC_LEVEL4_CACHE_ASSOC"
.LASF2030:
	.string	"mvwchgat(win,y,x,n,a,c,o) (wmove((win),(y),(x)) == ERR ? ERR : wchgat((win),(n),(a),(c),(o)))"
.LASF2575:
	.string	"poll_cycle_counter"
.LASF2420:
	.string	"_SC_ATEXIT_MAX"
.LASF450:
	.string	"__ptr_t void *"
.LASF1828:
	.string	"WA_BOLD A_BOLD"
.LASF661:
	.string	"FOPEN_MAX 16"
.LASF2059:
	.string	"mvinnstr(y,x,s,n) mvwinnstr(stdscr,(y),(x),(s),(n))"
.LASF1568:
	.string	"__DECL_SIMD_log2f32x "
.LASF933:
	.string	"__LC_ADDRESS 9"
.LASF946:
	.string	"LC_ADDRESS __LC_ADDRESS"
.LASF580:
	.string	"__SLONG32_TYPE int"
.LASF2477:
	.string	"_SC_FIFO"
.LASF970:
	.string	"_POSIX2_C_DEV __POSIX2_THIS_VERSION"
.LASF1786:
	.string	"NCURSES_INTEROP_FUNCS 1"
.LASF4:
	.string	"__STDC_HOSTED__ 1"
.LASF295:
	.string	"__DEC64_SUBNORMAL_MIN__ 0.000000000000001E-383DD"
.LASF67:
	.string	"__INT_FAST32_TYPE__ long int"
.LASF870:
	.string	"UINT32_MAX (4294967295U)"
.LASF340:
	.string	"__k8__ 1"
.LASF2499:
	.string	"_SC_USER_GROUPS"
.LASF334:
	.string	"__SIZEOF_FLOAT80__ 16"
.LASF408:
	.string	"__USE_POSIX_IMPLICITLY 1"
.LASF1530:
	.string	"__DECL_SIMD_sinhf128x "
.LASF118:
	.string	"__INT_LEAST32_MAX__ 0x7fffffff"
.LASF206:
	.string	"__FLT32_MAX_EXP__ 128"
.LASF374:
	.string	"__USE_ISOCXX11"
.LASF1494:
	.string	"__DECL_SIMD_exp10f16 "
.LASF1299:
	.string	"_SC_TRACE_SYS_MAX _SC_TRACE_SYS_MAX"
.LASF2291:
	.string	"long int"
.LASF1954:
	.string	"getcury(win) (NCURSES_OK_ADDR(win) ? (win)->_cury : ERR)"
.LASF1158:
	.string	"_SC_THREAD_SAFE_FUNCTIONS _SC_THREAD_SAFE_FUNCTIONS"
.LASF1092:
	.string	"_SC_OPEN_MAX _SC_OPEN_MAX"
.LASF1971:
	.string	"hline(ch,n) whline(stdscr, ch, (n))"
.LASF2514:
	.string	"_SC_TRACE"
.LASF640:
	.string	"_IO_ERR_SEEN 0x0020"
.LASF181:
	.string	"__DBL_HAS_DENORM__ 1"
.LASF2469:
	.string	"_SC_C_LANG_SUPPORT_R"
.LASF1564:
	.string	"__DECL_SIMD_log2f16 "
.LASF110:
	.string	"__UINT32_MAX__ 0xffffffffU"
.LASF1085:
	.string	"_PC_ALLOC_SIZE_MIN _PC_ALLOC_SIZE_MIN"
.LASF2111:
	.string	"KEY_CATAB 0526"
.LASF1983:
	.string	"addchstr(str) waddchstr(stdscr,(str))"
.LASF1329:
	.string	"_CS_XBS5_ILP32_OFFBIG_LIBS _CS_XBS5_ILP32_OFFBIG_LIBS"
.LASF2451:
	.string	"_SC_USHRT_MAX"
.LASF400:
	.string	"__glibc_clang_prereq(maj,min) 0"
.LASF2581:
	.string	"pclose"
.LASF1181:
	.string	"_SC_XOPEN_UNIX _SC_XOPEN_UNIX"
.LASF860:
	.string	"INT8_MIN (-128)"
.LASF313:
	.string	"__GCC_ATOMIC_CHAR16_T_LOCK_FREE 2"
.LASF868:
	.string	"UINT8_MAX (255)"
.LASF1292:
	.string	"_SC_V7_ILP32_OFF32 _SC_V7_ILP32_OFF32"
.LASF2327:
	.string	"_IO_marker"
.LASF17:
	.string	"__pie__ 2"
.LASF2571:
	.string	"INTEL"
.LASF305:
	.string	"__GNUC_STDC_INLINE__ 1"
.LASF662:
	.string	"stdin stdin"
.LASF1576:
	.string	"__DECL_SIMD_log1pf64 "
.LASF2157:
	.string	"KEY_SHELP 0606"
.LASF1943:
	.string	"wgetstr(w,s) wgetnstr(w, s, -1)"
.LASF260:
	.string	"__FLT32X_EPSILON__ 2.22044604925031308084726333618164062e-16F32x"
.LASF1888:
	.string	"ACS_BSBS ACS_HLINE"
.LASF1743:
	.string	"M_SQRT1_2 0.70710678118654752440"
.LASF2504:
	.string	"_SC_2_PBS_MESSAGE"
.LASF828:
	.string	"__SIZEOF_PTHREAD_RWLOCK_T 56"
.LASF447:
	.string	"__PMT(args) args"
.LASF1355:
	.string	"_CS_POSIX_V7_ILP32_OFF32_CFLAGS _CS_POSIX_V7_ILP32_OFF32_CFLAGS"
.LASF1042:
	.string	"_POSIX_TYPED_MEMORY_OBJECTS -1"
.LASF435:
	.string	"_SYS_CDEFS_H 1"
.LASF92:
	.string	"__WCHAR_WIDTH__ 32"
.LASF877:
	.string	"INT_LEAST16_MAX (32767)"
.LASF944:
	.string	"LC_PAPER __LC_PAPER"
.LASF2556:
	.string	"cumulative"
.LASF2105:
	.string	"KEY_SF 0520"
.LASF1167:
	.string	"_SC_THREAD_ATTR_STACKADDR _SC_THREAD_ATTR_STACKADDR"
.LASF2032:
	.string	"mvwgetch(win,y,x) (wmove((win),(y),(x)) == ERR ? ERR : wgetch(win))"
.LASF1171:
	.string	"_SC_THREAD_PRIO_PROTECT _SC_THREAD_PRIO_PROTECT"
.LASF806:
	.string	"_STRUCT_TIMESPEC 1"
.LASF2189:
	.string	"BUTTON1_CLICKED NCURSES_MOUSE_MASK(1, NCURSES_BUTTON_CLICKED)"
.LASF363:
	.string	"__STDC_IEC_60559_BFP__ 201404L"
.LASF747:
	.string	"EXIT_SUCCESS 0"
.LASF1310:
	.string	"_CS_GNU_LIBPTHREAD_VERSION _CS_GNU_LIBPTHREAD_VERSION"
.LASF2229:
	.string	"TRACE_UPDATE 0x0004"
.LASF1940:
	.string	"getparyx(win,y,x) (y = getpary(win), x = getparx(win))"
.LASF1667:
	.string	"__MATHDECLX(type,function,suffix,args,attrib) __MATHDECL_1(type, function,suffix, args) __attribute__ (attrib); __MATHDECL_1(type, __CONCAT(__,function),suffix, args) __attribute__ (attrib)"
.LASF81:
	.string	"__WCHAR_MAX__ 0x7fffffff"
.LASF2487:
	.string	"_SC_SPIN_LOCKS"
.LASF613:
	.string	"__DADDR_T_TYPE __S32_TYPE"
.LASF1987:
	.string	"attr_off(a,o) wattr_off(stdscr,(a),(o))"
.LASF214:
	.string	"__FLT32_HAS_DENORM__ 1"
.LASF1294:
	.string	"_SC_V7_LP64_OFF64 _SC_V7_LP64_OFF64"
.LASF2493:
	.string	"_SC_SPORADIC_SERVER"
.LASF453:
	.string	"__bos(ptr) __builtin_object_size (ptr, __USE_FORTIFY_LEVEL > 1)"
.LASF2276:
	.string	"CPU_TIGERLAKE 140"
.LASF700:
	.string	"_T_WCHAR_ "
.LASF663:
	.string	"stdout stdout"
.LASF1944:
	.string	"getnstr(s,n) wgetnstr(stdscr, s, (n))"
.LASF2523:
	.string	"_SC_LEVEL1_DCACHE_LINESIZE"
.LASF1272:
	.string	"_SC_TRACE_EVENT_FILTER _SC_TRACE_EVENT_FILTER"
.LASF660:
	.string	"FOPEN_MAX"
.LASF2170:
	.string	"KEY_SRSUME 0623"
.LASF2345:
	.string	"_SC_PRIORITIZED_IO"
.LASF325:
	.string	"__SSP_STRONG__ 3"
.LASF1673:
	.string	"__MATH_PRECNAME(name,r) __CONCAT(name,r)"
.LASF551:
	.string	"__SIZE_T "
.LASF618:
	.string	"__FSID_T_TYPE struct { int __val[2]; }"
.LASF1463:
	.string	"__DECL_SIMD_asinl "
.LASF2328:
	.string	"_IO_codecvt"
.LASF2403:
	.string	"_SC_GETPW_R_SIZE_MAX"
.LASF1039:
	.string	"_POSIX_TRACE_EVENT_FILTER -1"
.LASF2509:
	.string	"_SC_V6_ILP32_OFF32"
.LASF692:
	.string	"__CFLOAT32 _Complex _Float32"
.LASF1740:
	.string	"M_2_PI 0.63661977236758134308"
.LASF316:
	.string	"__GCC_ATOMIC_SHORT_LOCK_FREE 2"
.LASF2234:
	.string	"TRACE_VIRTPUT 0x0040"
.LASF2422:
	.string	"_SC_XOPEN_VERSION"
.LASF1561:
	.string	"__DECL_SIMD_log2 "
.LASF1869:
	.string	"ACS_UARROW NCURSES_ACS('-')"
.LASF1774:
	.string	"NCURSES_COLOR_T"
.LASF1791:
	.string	"NCURSES_TPARM_ARG"
.LASF2370:
	.string	"_SC_BC_SCALE_MAX"
.LASF2429:
	.string	"_SC_2_C_VERSION"
.LASF601:
	.string	"__BLKCNT_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF338:
	.string	"__GCC_ASM_FLAG_OUTPUTS__ 1"
.LASF617:
	.string	"__BLKSIZE_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF37:
	.string	"__SIZEOF_POINTER__ 8"
.LASF1797:
	.string	"NCURSES_WIDECHAR 0"
.LASF1941:
	.string	"getsyx(y,x) do { if (newscr) { if (is_leaveok(newscr)) (y) = (x) = -1; else getyx(newscr,(y), (x)); } } while(0)"
.LASF242:
	.string	"__FLT128_NORM_MAX__ 1.18973149535723176508575932662800702e+4932F128"
.LASF1991:
	.string	"attron(at) wattron(stdscr,(at))"
.LASF1549:
	.string	"__DECL_SIMD_atan2f64x "
.LASF1283:
	.string	"_SC_LEVEL2_CACHE_LINESIZE _SC_LEVEL2_CACHE_LINESIZE"
.LASF1580:
	.string	"__DECL_SIMD_log1pf128x "
.LASF1083:
	.string	"_PC_REC_MIN_XFER_SIZE _PC_REC_MIN_XFER_SIZE"
.LASF550:
	.string	"_T_SIZE "
.LASF266:
	.string	"__FLT64X_MANT_DIG__ 64"
.LASF693:
	.string	"__CFLOAT64 _Complex _Float64"
.LASF810:
	.string	"__FD_ELT(d) ((d) / __NFDBITS)"
.LASF2532:
	.string	"_SC_LEVEL4_CACHE_LINESIZE"
.LASF1590:
	.string	"__DECL_SIMD_atanhf128x "
.LASF960:
	.string	"LC_MEASUREMENT_MASK (1 << __LC_MEASUREMENT)"
.LASF1040:
	.string	"_POSIX_TRACE_INHERIT -1"
.LASF1619:
	.string	"__DECL_SIMD_tanhf64x "
.LASF2231:
	.string	"TRACE_CHARPUT 0x0010"
.LASF1999:
	.string	"color_set(c,o) wcolor_set(stdscr,(c),(o))"
.LASF1201:
	.string	"_SC_SCHAR_MAX _SC_SCHAR_MAX"
.LASF2457:
	.string	"_SC_NL_TEXTMAX"
.LASF1390:
	.string	"__DECL_SIMD_cosf128x "
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
.LASF2554:
	.string	"cpu_avg"
.LASF231:
	.string	"__FLT64_HAS_INFINITY__ 1"
.LASF1824:
	.string	"WA_UNDERLINE A_UNDERLINE"
.LASF856:
	.string	"__WCHAR_MAX __WCHAR_MAX__"
.LASF881:
	.string	"UINT_LEAST16_MAX (65535)"
.LASF2000:
	.string	"delch() wdelch(stdscr)"
.LASF2404:
	.string	"_SC_LOGIN_NAME_MAX"
.LASF1663:
	.string	"__MATHDECL_VEC(type,function,suffix,args) __SIMD_DECL (__MATH_PRECNAME (function, suffix)) __MATHDECL(type, function,suffix, args)"
.LASF1377:
	.string	"F_TLOCK 2"
.LASF467:
	.string	"__REDIRECT(name,proto,alias) name proto __asm__ (__ASMNAME (#alias))"
.LASF534:
	.string	"__GLIBC_USE_IEC_60559_BFP_EXT_C2X 0"
.LASF804:
	.string	"_SIGSET_NWORDS (1024 / (8 * sizeof (unsigned long int)))"
.LASF270:
	.string	"__FLT64X_MAX_EXP__ 16384"
.LASF2460:
	.string	"_SC_XBS5_LP64_OFF64"
.LASF2492:
	.string	"_SC_SPAWN"
.LASF405:
	.string	"__USE_ISOC11 1"
.LASF39:
	.string	"__GNUC_WIDE_EXECUTION_CHARSET_NAME \"UTF-32LE\""
.LASF2232:
	.string	"TRACE_ORDINARY 0x001F"
.LASF874:
	.string	"INT_LEAST32_MIN (-2147483647-1)"
.LASF2398:
	.string	"_SC_PII_OSI_M"
.LASF411:
	.string	"_POSIX_C_SOURCE"
.LASF966:
	.string	"__POSIX2_THIS_VERSION 200809L"
.LASF1400:
	.string	"__DECL_SIMD_sinf128x "
.LASF1170:
	.string	"_SC_THREAD_PRIO_INHERIT _SC_THREAD_PRIO_INHERIT"
.LASF1555:
	.string	"__DECL_SIMD_log10f32 "
.LASF745:
	.string	"RAND_MAX 2147483647"
.LASF2558:
	.string	"power"
.LASF2219:
	.string	"BUTTON_CLICK(e,x) ((e) & NCURSES_MOUSE_MASK(x, 004))"
.LASF1031:
	.string	"_POSIX_CLOCK_SELECTION 200809L"
.LASF1850:
	.string	"ACS_URCORNER NCURSES_ACS('k')"
.LASF146:
	.string	"__UINTPTR_MAX__ 0xffffffffffffffffUL"
.LASF2501:
	.string	"_SC_2_PBS"
.LASF1202:
	.string	"_SC_SCHAR_MIN _SC_SCHAR_MIN"
.LASF319:
	.string	"__GCC_ATOMIC_LLONG_LOCK_FREE 2"
.LASF1887:
	.string	"ACS_BSSS ACS_TTEE"
.LASF1332:
	.string	"_CS_XBS5_LP64_OFF64_LDFLAGS _CS_XBS5_LP64_OFF64_LDFLAGS"
.LASF2022:
	.string	"timeout(delay) wtimeout(stdscr,(delay))"
.LASF137:
	.string	"__INT_FAST32_WIDTH__ 64"
.LASF2461:
	.string	"_SC_XBS5_LPBIG_OFFBIG"
.LASF1125:
	.string	"_SC_BC_BASE_MAX _SC_BC_BASE_MAX"
.LASF2440:
	.string	"_SC_WORD_BIT"
.LASF809:
	.string	"__NFDBITS (8 * (int) sizeof (__fd_mask))"
.LASF1261:
	.string	"_SC_2_PBS_MESSAGE _SC_2_PBS_MESSAGE"
.LASF160:
	.string	"__FLT_MAX__ 3.40282346638528859811704183484516925e+38F"
.LASF1008:
	.string	"_POSIX_REALTIME_SIGNALS 200809L"
.LASF91:
	.string	"__LONG_LONG_WIDTH__ 64"
.LASF1136:
	.string	"_SC_2_C_BIND _SC_2_C_BIND"
.LASF2112:
	.string	"KEY_ENTER 0527"
.LASF1147:
	.string	"_SC_POLL _SC_POLL"
.LASF1081:
	.string	"_PC_REC_INCR_XFER_SIZE _PC_REC_INCR_XFER_SIZE"
.LASF1122:
	.string	"_SC_SEM_VALUE_MAX _SC_SEM_VALUE_MAX"
.LASF2296:
	.string	"char"
.LASF829:
	.string	"__SIZEOF_PTHREAD_BARRIER_T 32"
.LASF1303:
	.string	"_SC_THREAD_ROBUST_PRIO_PROTECT _SC_THREAD_ROBUST_PRIO_PROTECT"
.LASF2502:
	.string	"_SC_2_PBS_ACCOUNTING"
.LASF1321:
	.string	"_CS_LFS64_LIBS _CS_LFS64_LIBS"
.LASF719:
	.string	"WCONTINUED 8"
.LASF1526:
	.string	"__DECL_SIMD_sinhf64 "
.LASF592:
	.string	"__INO64_T_TYPE __UQUAD_TYPE"
.LASF2134:
	.string	"KEY_NEXT 0557"
.LASF527:
	.string	"__stub_sigreturn "
.LASF1141:
	.string	"_SC_2_LOCALEDEF _SC_2_LOCALEDEF"
.LASF1849:
	.string	"ACS_LLCORNER NCURSES_ACS('m')"
.LASF681:
	.string	"__HAVE_DISTINCT_FLOAT32 0"
.LASF2024:
	.string	"winsertln(win) winsdelln(win,1)"
.LASF2466:
	.string	"_SC_BARRIERS"
.LASF2356:
	.string	"_SC_AIO_MAX"
.LASF535:
	.string	"__GLIBC_USE_IEC_60559_EXT"
.LASF62:
	.string	"__UINT_LEAST16_TYPE__ short unsigned int"
.LASF2095:
	.string	"KEY_F0 0410"
.LASF2428:
	.string	"_SC_2_CHAR_TERM"
.LASF1161:
	.string	"_SC_LOGIN_NAME_MAX _SC_LOGIN_NAME_MAX"
.LASF2094:
	.string	"KEY_BACKSPACE 0407"
.LASF2520:
	.string	"_SC_LEVEL1_ICACHE_LINESIZE"
.LASF200:
	.string	"__LDBL_HAS_QUIET_NAN__ 1"
.LASF570:
	.string	"__S16_TYPE short int"
.LASF1471:
	.string	"__DECL_SIMD_hypot "
.LASF1192:
	.string	"_SC_CHAR_MAX _SC_CHAR_MAX"
.LASF1658:
	.string	"__FP_LOGBNAN_IS_MIN 1"
.LASF306:
	.string	"__NO_INLINE__ 1"
.LASF229:
	.string	"__FLT64_DENORM_MIN__ 4.94065645841246544176568792868221372e-324F64"
.LASF614:
	.string	"__KEY_T_TYPE __S32_TYPE"
.LASF716:
	.string	"WUNTRACED 2"
.LASF2304:
	.string	"_IO_buf_base"
.LASF974:
	.string	"_XOPEN_XCU_VERSION 4"
.LASF794:
	.string	"htole64(x) __uint64_identity (x)"
.LASF2610:
	.string	"cpu_designer"
.LASF484:
	.string	"__attribute_nonnull__(params) __attribute__ ((__nonnull__ params))"
.LASF2295:
	.string	"__off64_t"
.LASF1386:
	.string	"__DECL_SIMD_cosf64 "
.LASF1558:
	.string	"__DECL_SIMD_log10f32x "
.LASF1450:
	.string	"__DECL_SIMD_acosf128x "
.LASF2598:
	.string	"load"
.LASF1544:
	.string	"__DECL_SIMD_atan2f16 "
.LASF2104:
	.string	"KEY_EOL 0517"
.LASF1906:
	.string	"GCC_DEPRECATED"
.LASF857:
	.string	"__WCHAR_MIN __WCHAR_MIN__"
.LASF426:
	.string	"__USE_ATFILE 1"
.LASF2427:
	.string	"_SC_XOPEN_SHM"
.LASF2426:
	.string	"_SC_XOPEN_ENH_I18N"
.LASF2172:
	.string	"KEY_SSUSPEND 0625"
.LASF1815:
	.string	"true 1"
.LASF2173:
	.string	"KEY_SUNDO 0626"
.LASF1213:
	.string	"_SC_NL_SETMAX _SC_NL_SETMAX"
.LASF1346:
	.string	"_CS_POSIX_V6_ILP32_OFFBIG_LINTFLAGS _CS_POSIX_V6_ILP32_OFFBIG_LINTFLAGS"
.LASF491:
	.string	"__attribute_artificial__ __attribute__ ((__artificial__))"
.LASF1858:
	.string	"ACS_PLUS NCURSES_ACS('n')"
.LASF1033:
	.string	"_POSIX_IPV6 200809L"
.LASF1235:
	.string	"_SC_PIPE _SC_PIPE"
.LASF1358:
	.string	"_CS_POSIX_V7_ILP32_OFF32_LINTFLAGS _CS_POSIX_V7_ILP32_OFF32_LINTFLAGS"
.LASF1057:
	.string	"STDERR_FILENO 2"
.LASF1442:
	.string	"__DECL_SIMD_acosf "
.LASF604:
	.string	"__FSBLKCNT64_T_TYPE __UQUAD_TYPE"
.LASF2605:
	.string	"init_sensor_battery"
.LASF196:
	.string	"__LDBL_EPSILON__ 1.08420217248550443400745280086994171e-19L"
.LASF2047:
	.string	"mvaddchstr(y,x,str) mvwaddchstr(stdscr,(y),(x),(str))"
.LASF2434:
	.string	"_SC_CHAR_BIT"
.LASF241:
	.string	"__FLT128_MAX__ 1.18973149535723176508575932662800702e+4932F128"
.LASF2175:
	.string	"KEY_UNDO 0630"
.LASF1428:
	.string	"__DECL_SIMD_expf32x "
.LASF2450:
	.string	"_SC_ULONG_MAX"
.LASF1984:
	.string	"addnstr(str,n) waddnstr(stdscr,(str),(n))"
.LASF2498:
	.string	"_SC_TYPED_MEMORY_OBJECTS"
.LASF1199:
	.string	"_SC_NZERO _SC_NZERO"
.LASF103:
	.string	"__SIG_ATOMIC_WIDTH__ 32"
.LASF629:
	.string	"__STD_TYPE"
.LASF1193:
	.string	"_SC_CHAR_MIN _SC_CHAR_MIN"
.LASF749:
	.string	"_SYS_TYPES_H 1"
.LASF1311:
	.string	"_CS_V5_WIDTH_RESTRICTED_ENVS _CS_V5_WIDTH_RESTRICTED_ENVS"
.LASF1820:
	.string	"NCURSES_OK_ADDR(p) (0 != NCURSES_CAST(const void *, (p)))"
.LASF883:
	.string	"UINT_LEAST64_MAX (__UINT64_C(18446744073709551615))"
.LASF737:
	.string	"WTERMSIG(status) __WTERMSIG (status)"
.LASF2424:
	.string	"_SC_XOPEN_UNIX"
.LASF473:
	.string	"__attribute_alloc_size__(params) __attribute__ ((__alloc_size__ params))"
.LASF676:
	.string	"__HAVE_FLOAT32 1"
.LASF2552:
	.string	"_IO_FILE"
.LASF68:
	.string	"__INT_FAST64_TYPE__ long int"
.LASF1584:
	.string	"__DECL_SIMD_atanhf16 "
.LASF544:
	.string	"__need_NULL "
.LASF2548:
	.string	"_SC_SIGSTKSZ"
.LASF1359:
	.string	"_CS_POSIX_V7_ILP32_OFFBIG_CFLAGS _CS_POSIX_V7_ILP32_OFFBIG_CFLAGS"
.LASF2329:
	.string	"_IO_wide_data"
.LASF1750:
	.string	"__NCURSES_H "
.LASF1000:
	.string	"_POSIX_THREAD_PRIORITY_SCHEDULING 200809L"
.LASF1956:
	.string	"getbegy(win) (NCURSES_OK_ADDR(win) ? (win)->_begy : ERR)"
.LASF185:
	.string	"__LDBL_MANT_DIG__ 64"
.LASF1219:
	.string	"_SC_XOPEN_LEGACY _SC_XOPEN_LEGACY"
.LASF655:
	.string	"_BITS_STDIO_LIM_H 1"
.LASF929:
	.string	"__LC_MESSAGES 5"
.LASF2526:
	.string	"_SC_LEVEL2_CACHE_LINESIZE"
.LASF1466:
	.string	"__DECL_SIMD_asinf64 "
.LASF1884:
	.string	"ACS_SBSS ACS_RTEE"
.LASF72:
	.string	"__UINT_FAST64_TYPE__ long unsigned int"
.LASF1106:
	.string	"_SC_MEMLOCK_RANGE _SC_MEMLOCK_RANGE"
.LASF564:
	.string	"NULL ((void *)0)"
.LASF145:
	.string	"__INTPTR_WIDTH__ 64"
.LASF33:
	.string	"__ORDER_BIG_ENDIAN__ 4321"
.LASF1622:
	.string	"__DECL_SIMD_asinhf "
.LASF352:
	.string	"__gnu_linux__ 1"
.LASF2615:
	.string	"/home/jscha/dvp/cpumon/build"
.LASF1225:
	.string	"_SC_C_LANG_SUPPORT _SC_C_LANG_SUPPORT"
.LASF843:
	.string	"__PTHREAD_RWLOCK_INITIALIZER(__flags) 0, 0, 0, 0, 0, 0, 0, 0, __PTHREAD_RWLOCK_ELISION_EXTRA, 0, __flags"
.LASF2257:
	.string	"IA32_PACKAGE_THERM_STATUS 0x1B1"
.LASF1043:
	.string	"_POSIX_V7_LPBIG_OFFBIG -1"
.LASF1340:
	.string	"_CS_POSIX_V6_ILP32_OFF32_LDFLAGS _CS_POSIX_V6_ILP32_OFF32_LDFLAGS"
.LASF308:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 1"
.LASF278:
	.string	"__FLT64X_HAS_DENORM__ 1"
.LASF1239:
	.string	"_SC_MONOTONIC_CLOCK _SC_MONOTONIC_CLOCK"
.LASF2408:
	.string	"_SC_THREAD_STACK_MIN"
.LASF2204:
	.string	"BUTTON4_CLICKED NCURSES_MOUSE_MASK(4, NCURSES_BUTTON_CLICKED)"
.LASF1196:
	.string	"_SC_LONG_BIT _SC_LONG_BIT"
.LASF863:
	.string	"INT64_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF102:
	.string	"__SIG_ATOMIC_MIN__ (-__SIG_ATOMIC_MAX__ - 1)"
.LASF1131:
	.string	"_SC_EXPR_NEST_MAX _SC_EXPR_NEST_MAX"
.LASF518:
	.string	"__attr_dealloc(dealloc,argno) __attribute__ ((__malloc__ (dealloc, argno)))"
.LASF1077:
	.string	"_PC_ASYNC_IO _PC_ASYNC_IO"
.LASF1352:
	.string	"_CS_POSIX_V6_LPBIG_OFFBIG_LDFLAGS _CS_POSIX_V6_LPBIG_OFFBIG_LDFLAGS"
.LASF364:
	.string	"__STDC_IEC_559_COMPLEX__ 1"
.LASF1093:
	.string	"_SC_STREAM_MAX _SC_STREAM_MAX"
.LASF908:
	.string	"WCHAR_MAX __WCHAR_MAX"
.LASF802:
	.string	"__sigset_t_defined 1"
.LASF57:
	.string	"__INT_LEAST8_TYPE__ signed char"
.LASF1327:
	.string	"_CS_XBS5_ILP32_OFFBIG_CFLAGS _CS_XBS5_ILP32_OFFBIG_CFLAGS"
.LASF1492:
	.string	"__DECL_SIMD_exp10f "
.LASF507:
	.string	"__LDBL_REDIR_NTH(name,proto) name proto __THROW"
.LASF2223:
	.string	"mouse_trafo(y,x,to_screen) wmouse_trafo(stdscr,y,x,to_screen)"
.LASF2568:
	.string	"power_cumulative"
.LASF492:
	.string	"__extern_inline extern __inline __attribute__ ((__gnu_inline__))"
.LASF2454:
	.string	"_SC_NL_MSGMAX"
.LASF1727:
	.string	"isinf(x) __builtin_isinf_sign (x)"
.LASF713:
	.string	"__need_wchar_t"
.LASF159:
	.string	"__FLT_DECIMAL_DIG__ 9"
.LASF897:
	.string	"INTPTR_MAX (9223372036854775807L)"
.LASF1547:
	.string	"__DECL_SIMD_atan2f128 "
.LASF2447:
	.string	"_SC_SHRT_MIN"
.LASF1917:
	.string	"A_NORMAL (1U - 1U)"
.LASF2596:
	.string	"duty"
.LASF644:
	.string	"__off_t_defined "
.LASF1648:
	.string	"__DECL_SIMD_tanf32x "
.LASF1591:
	.string	"__DECL_SIMD_acosh "
.LASF2579:
	.string	"freq_his"
.LASF2524:
	.string	"_SC_LEVEL2_CACHE_SIZE"
.LASF1160:
	.string	"_SC_GETPW_R_SIZE_MAX _SC_GETPW_R_SIZE_MAX"
.LASF1811:
	.string	"FALSE"
.LASF2458:
	.string	"_SC_XBS5_ILP32_OFF32"
.LASF532:
	.string	"__GLIBC_USE_IEC_60559_BFP_EXT 0"
.LASF2080:
	.string	"wgetdelay(win) (NCURSES_OK_ADDR(win) ? (win)->_delay : 0)"
.LASF353:
	.string	"__linux 1"
.LASF1714:
	.string	"__MATH_TG_F32(FUNC,ARGS) _Float32: FUNC ## f ARGS,"
.LASF2034:
	.string	"mvwgetstr(win,y,x,str) (wmove((win),(y),(x)) == ERR ? ERR : wgetstr((win),(str)))"
.LASF434:
	.string	"__GLIBC_PREREQ(maj,min) ((__GLIBC__ << 16) + __GLIBC_MINOR__ >= ((maj) << 16) + (min))"
.LASF1747:
	.string	"islessequal(x,y) __builtin_islessequal(x, y)"
.LASF2160:
	.string	"KEY_SLEFT 0611"
.LASF865:
	.string	"INT16_MAX (32767)"
.LASF1717:
	.string	"FP_NAN 0"
.LASF19:
	.string	"__FINITE_MATH_ONLY__ 0"
.LASF520:
	.string	"__attribute_returns_twice__ __attribute__ ((__returns_twice__))"
.LASF2407:
	.string	"_SC_THREAD_KEYS_MAX"
.LASF2369:
	.string	"_SC_BC_DIM_MAX"
.LASF2521:
	.string	"_SC_LEVEL1_DCACHE_SIZE"
.LASF758:
	.string	"__id_t_defined "
.LASF2522:
	.string	"_SC_LEVEL1_DCACHE_ASSOC"
.LASF1548:
	.string	"__DECL_SIMD_atan2f32x "
.LASF1364:
	.string	"_CS_POSIX_V7_LP64_OFF64_LDFLAGS _CS_POSIX_V7_LP64_OFF64_LDFLAGS"
.LASF1504:
	.string	"__DECL_SIMD_coshf16 "
.LASF2459:
	.string	"_SC_XBS5_ILP32_OFFBIG"
.LASF1733:
	.string	"M_LOG10E 0.43429448190325182765"
.LASF922:
	.string	"_LOCALE_H 1"
.LASF1:
	.string	"__STDC_VERSION__ 201710L"
.LASF841:
	.string	"_RWLOCK_INTERNAL_H "
.LASF732:
	.string	"__W_EXITCODE(ret,sig) ((ret) << 8 | (sig))"
.LASF2018:
	.string	"scrl(n) wscrl(stdscr,(n))"
.LASF1913:
	.string	"NCURSES_SP_NAME(name) name ##_sp"
.LASF1970:
	.string	"border(ls,rs,ts,bs,tl,tr,bl,br) wborder(stdscr, ls, rs, ts, bs, tl, tr, bl, br)"
.LASF1305:
	.string	"_SC_SIGSTKSZ _SC_SIGSTKSZ"
.LASF1185:
	.string	"_SC_2_CHAR_TERM _SC_2_CHAR_TERM"
.LASF121:
	.string	"__INT_LEAST64_MAX__ 0x7fffffffffffffffL"
.LASF1669:
	.string	"__MATHDECL_1(type,function,suffix,args) __MATHDECL_1_IMPL(type, function, suffix, args)"
.LASF1647:
	.string	"__DECL_SIMD_tanf128 "
.LASF1665:
	.string	"__MATHDECL(type,function,suffix,args) __MATHDECL_1(type, function,suffix, args); __MATHDECL_1(type, __CONCAT(__,function),suffix, args)"
.LASF1247:
	.string	"_SC_SHELL _SC_SHELL"
.LASF2357:
	.string	"_SC_AIO_PRIO_DELTA_MAX"
.LASF840:
	.string	"__PTHREAD_MUTEX_INITIALIZER(__kind) 0, 0, 0, 0, __kind, 0, 0, { 0, 0 }"
.LASF361:
	.string	"_STDC_PREDEF_H 1"
.LASF1256:
	.string	"_SC_USER_GROUPS _SC_USER_GROUPS"
.LASF759:
	.string	"__daddr_t_defined "
.LASF493:
	.string	"__extern_always_inline extern __always_inline __attribute__ ((__gnu_inline__))"
.LASF2226:
	.string	"TRACE_DISABLE 0x0000"
.LASF1636:
	.string	"__DECL_SIMD_erfcf64 "
.LASF2103:
	.string	"KEY_EOS 0516"
.LASF1713:
	.string	"__MATHCALL_NARROW"
.LASF2463:
	.string	"_SC_XOPEN_REALTIME"
.LASF1183:
	.string	"_SC_XOPEN_ENH_I18N _SC_XOPEN_ENH_I18N"
.LASF2309:
	.string	"_markers"
.LASF722:
	.string	"__WALL 0x40000000"
.LASF51:
	.string	"__INT32_TYPE__ int"
.LASF1257:
	.string	"_SC_USER_GROUPS_R _SC_USER_GROUPS_R"
.LASF2137:
	.string	"KEY_PREVIOUS 0562"
.LASF454:
	.string	"__bos0(ptr) __builtin_object_size (ptr, 0)"
.LASF272:
	.string	"__FLT64X_DECIMAL_DIG__ 21"
.LASF1946:
	.string	"fixterm() reset_prog_mode()"
.LASF773:
	.string	"__BYTE_ORDER __LITTLE_ENDIAN"
.LASF787:
	.string	"be16toh(x) __bswap_16 (x)"
.LASF1441:
	.string	"__DECL_SIMD_acos "
.LASF396:
	.string	"__GLIBC_USE_DEPRECATED_GETS"
.LASF2437:
	.string	"_SC_INT_MAX"
.LASF219:
	.string	"__FLT64_DIG__ 15"
.LASF1207:
	.string	"_SC_ULONG_MAX _SC_ULONG_MAX"
.LASF2070:
	.string	"is_idlok(win) (NCURSES_OK_ADDR(win) ? (win)->_idlok : FALSE)"
.LASF2360:
	.string	"_SC_MQ_PRIO_MAX"
.LASF311:
	.string	"__GCC_ATOMIC_BOOL_LOCK_FREE 2"
.LASF2017:
	.string	"refresh() wrefresh(stdscr)"
.LASF293:
	.string	"__DEC64_MAX__ 9.999999999999999E384DD"
.LASF1512:
	.string	"__DECL_SIMD_expm1f "
.LASF1030:
	.string	"_POSIX_MONOTONIC_CLOCK 0"
.LASF1958:
	.string	"getmaxy(win) (NCURSES_OK_ADDR(win) ? ((win)->_maxy + 1) : ERR)"
.LASF1418:
	.string	"__DECL_SIMD_logf32x "
.LASF1298:
	.string	"_SC_TRACE_NAME_MAX _SC_TRACE_NAME_MAX"
.LASF826:
	.string	"__SIZEOF_PTHREAD_MUTEX_T 40"
.LASF388:
	.string	"__USE_FILE_OFFSET64"
.LASF2263:
	.string	"MSR_CORE_PERF_LIMIT_REASONS 0x64F"
.LASF734:
	.string	"__W_CONTINUED 0xffff"
.LASF178:
	.string	"__DBL_MIN__ ((double)2.22507385850720138309023271733240406e-308L)"
.LASF1891:
	.string	"ERR (-1)"
.LASF2517:
	.string	"_SC_TRACE_LOG"
.LASF1052:
	.string	"__ILP32_OFFBIG_LDFLAGS \"-m32\""
.LASF1652:
	.string	"HUGE_VALF (__builtin_huge_valf ())"
.LASF664:
	.string	"stderr stderr"
.LASF1744:
	.string	"isgreater(x,y) __builtin_isgreater(x, y)"
.LASF2038:
	.string	"mvwinchstr(win,y,x,s) (wmove((win),(y),(x)) == ERR ? ERR : winchstr((win),(s)))"
.LASF2076:
	.string	"is_pad(win) (NCURSES_OK_ADDR(win) ? ((win)->_flags & _ISPAD) != 0 : FALSE)"
.LASF1110:
	.string	"_SC_SHARED_MEMORY_OBJECTS _SC_SHARED_MEMORY_OBJECTS"
.LASF1232:
	.string	"_SC_DEVICE_SPECIFIC_R _SC_DEVICE_SPECIFIC_R"
.LASF1165:
	.string	"_SC_THREAD_STACK_MIN _SC_THREAD_STACK_MIN"
.LASF2224:
	.string	"_tracech_t _tracechtype"
.LASF2046:
	.string	"mvaddchnstr(y,x,str,n) mvwaddchnstr(stdscr,(y),(x),(str),(n))"
.LASF1444:
	.string	"__DECL_SIMD_acosf16 "
.LASF1831:
	.string	"WA_PROTECT A_PROTECT"
.LASF790:
	.string	"htole32(x) __uint32_identity (x)"
.LASF1168:
	.string	"_SC_THREAD_ATTR_STACKSIZE _SC_THREAD_ATTR_STACKSIZE"
.LASF1541:
	.string	"__DECL_SIMD_atan2 "
.LASF1651:
	.string	"HUGE_VAL (__builtin_huge_val ())"
.LASF1963:
	.string	"wattron(win,at) wattr_on(win, NCURSES_CAST(attr_t, at), NULL)"
.LASF602:
	.string	"__BLKCNT64_T_TYPE __SQUAD_TYPE"
.LASF2045:
	.string	"mvaddch(y,x,ch) mvwaddch(stdscr,(y),(x),(ch))"
.LASF1065:
	.string	"L_INCR SEEK_CUR"
.LASF771:
	.string	"__PDP_ENDIAN 3412"
.LASF1671:
	.string	"__MATHREDIR(type,function,suffix,args,to) extern type __REDIRECT_NTH (__MATH_PRECNAME (function, suffix), args, to)"
.LASF1360:
	.string	"_CS_POSIX_V7_ILP32_OFFBIG_LDFLAGS _CS_POSIX_V7_ILP32_OFFBIG_LDFLAGS"
.LASF1758:
	.string	"NCURSES_MOUSE_VERSION 2"
.LASF2044:
	.string	"mvwvline(win,y,x,c,n) (wmove((win),(y),(x)) == ERR ? ERR : wvline((win),(c),(n)))"
.LASF2535:
	.string	"_SC_V7_ILP32_OFF32"
.LASF2336:
	.string	"_SC_OPEN_MAX"
.LASF27:
	.string	"__SIZEOF_DOUBLE__ 8"
.LASF774:
	.string	"__FLOAT_WORD_ORDER __BYTE_ORDER"
.LASF1479:
	.string	"__DECL_SIMD_hypotf64x "
.LASF1053:
	.string	"__LP64_OFF64_CFLAGS \"-m64\""
.LASF2124:
	.string	"KEY_COMMAND 0545"
.LASF1124:
	.string	"_SC_TIMER_MAX _SC_TIMER_MAX"
.LASF612:
	.string	"__SUSECONDS64_T_TYPE __SQUAD_TYPE"
.LASF420:
	.string	"_ATFILE_SOURCE 1"
.LASF238:
	.string	"__FLT128_MAX_EXP__ 16384"
.LASF1618:
	.string	"__DECL_SIMD_tanhf32x "
.LASF1482:
	.string	"__DECL_SIMD_exp2f "
.LASF2562:
	.string	"pkg_runtime_avg"
.LASF1973:
	.string	"winstr(w,s) winnstr(w, s, -1)"
.LASF211:
	.string	"__FLT32_MIN__ 1.17549435082228750796873653722224568e-38F32"
.LASF704:
	.string	"_BSD_WCHAR_T_ "
.LASF1489:
	.string	"__DECL_SIMD_exp2f64x "
.LASF1209:
	.string	"_SC_NL_ARGMAX _SC_NL_ARGMAX"
.LASF666:
	.string	"__attr_dealloc_fclose __attr_dealloc (fclose, 1)"
.LASF744:
	.string	"__lldiv_t_defined 1"
.LASF2392:
	.string	"_SC_UIO_MAXIOV"
.LASF879:
	.string	"INT_LEAST64_MAX (__INT64_C(9223372036854775807))"
.LASF2181:
	.string	"NCURSES_BUTTON_RELEASED 001L"
.LASF479:
	.string	"__attribute_noinline__ __attribute__ ((__noinline__))"
.LASF2129:
	.string	"KEY_FIND 0552"
.LASF1266:
	.string	"_SC_V6_ILP32_OFF32 _SC_V6_ILP32_OFF32"
.LASF1732:
	.string	"M_LOG2E 1.4426950408889634074"
.LASF1254:
	.string	"_SC_TIMEOUTS _SC_TIMEOUTS"
.LASF833:
	.string	"__SIZEOF_PTHREAD_RWLOCKATTR_T 8"
.LASF2268:
	.string	"VR_THERM_ALERT_STATUS 64"
.LASF1659:
	.string	"FP_ILOGB0 (-2147483647 - 1)"
.LASF641:
	.string	"__ferror_unlocked_body(_fp) (((_fp)->_flags & _IO_ERR_SEEN) != 0)"
.LASF1762:
	.string	"NCURSES_WRAPPED_VAR(type,name) extern NCURSES_IMPEXP type NCURSES_PUBLIC_VAR(name)(void)"
.LASF1452:
	.string	"__DECL_SIMD_atanf "
.LASF392:
	.string	"__USE_GNU"
.LASF226:
	.string	"__FLT64_NORM_MAX__ 1.79769313486231570814527423731704357e+308F64"
.LASF1629:
	.string	"__DECL_SIMD_asinhf64x "
.LASF729:
	.string	"__WIFSTOPPED(status) (((status) & 0xff) == 0x7f)"
.LASF376:
	.string	"__USE_POSIX2"
.LASF2601:
	.string	"power_per_domain"
.LASF1705:
	.string	"__MATHCALL_NARROW_NORMAL(func,nargs) extern _Mret_ func __MATHCALL_NARROW_ARGS_ ## nargs __THROW"
.LASF1998:
	.string	"clrtoeol() wclrtoeol(stdscr)"
.LASF2187:
	.string	"BUTTON1_RELEASED NCURSES_MOUSE_MASK(1, NCURSES_BUTTON_RELEASED)"
.LASF615:
	.string	"__CLOCKID_T_TYPE __S32_TYPE"
.LASF1862:
	.string	"ACS_CKBOARD NCURSES_ACS('a')"
.LASF2555:
	.string	"runtime_avg"
.LASF2583:
	.string	"printw"
.LASF1692:
	.string	"__MATH_PRECNAME(name,r) name ##f128 ##r"
.LASF1115:
	.string	"_SC_MQ_OPEN_MAX _SC_MQ_OPEN_MAX"
.LASF1841:
	.string	"COLOR_GREEN 2"
.LASF1939:
	.string	"getmaxyx(win,y,x) (y = getmaxy(win), x = getmaxx(win))"
.LASF2020:
	.string	"standend() wstandend(stdscr)"
.LASF2168:
	.string	"KEY_SREPLACE 0621"
.LASF1863:
	.string	"ACS_DEGREE NCURSES_ACS('f')"
.LASF1490:
	.string	"__DECL_SIMD_exp2f128x "
.LASF2413:
	.string	"_SC_THREAD_PRIO_INHERIT"
.LASF1291:
	.string	"_SC_RAW_SOCKETS _SC_RAW_SOCKETS"
.LASF1227:
	.string	"_SC_CLOCK_SELECTION _SC_CLOCK_SELECTION"
.LASF2220:
	.string	"BUTTON_DOUBLE_CLICK(e,x) ((e) & NCURSES_MOUSE_MASK(x, 010))"
.LASF2484:
	.string	"_SC_SINGLE_PROCESS"
.LASF1443:
	.string	"__DECL_SIMD_acosl "
.LASF1908:
	.string	"vid_attr(a,pair,opts) vidattr(a)"
.LASF1112:
	.string	"_SC_AIO_MAX _SC_AIO_MAX"
.LASF384:
	.string	"__USE_XOPEN2K8"
.LASF1676:
	.string	"_Mdouble_"
.LASF578:
	.string	"__SWORD_TYPE long int"
.LASF696:
	.string	"__need_wchar_t "
.LASF383:
	.string	"__USE_XOPEN2KXSI"
.LASF2435:
	.string	"_SC_CHAR_MAX"
.LASF1755:
	.string	"NCURSES_VERSION_PATCH 20211021"
.LASF894:
	.string	"UINT_FAST32_MAX (18446744073709551615UL)"
.LASF2120:
	.string	"KEY_BTAB 0541"
.LASF2577:
	.string	"charging_status_before"
.LASF820:
	.string	"__blkcnt_t_defined "
.LASF13:
	.string	"__ATOMIC_ACQ_REL 4"
.LASF1107:
	.string	"_SC_MEMORY_PROTECTION _SC_MEMORY_PROTECTION"
.LASF721:
	.string	"__WNOTHREAD 0x20000000"
.LASF1670:
	.string	"__MATHDECL_ALIAS(type,function,suffix,args,alias) __MATHDECL_1(type, function, suffix, args)"
.LASF701:
	.string	"_T_WCHAR "
.LASF1438:
	.string	"__DECL_SIMD_powf32x "
.LASF560:
	.string	"_SIZET_ "
.LASF49:
	.string	"__INT8_TYPE__ signed char"
.LASF2043:
	.string	"mvwinstr(win,y,x,s) (wmove((win),(y),(x)) == ERR ? ERR : winstr((win),(s)))"
.LASF869:
	.string	"UINT16_MAX (65535)"
.LASF347:
	.string	"__SSE2_MATH__ 1"
.LASF309:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 1"
.LASF342:
	.string	"__MMX__ 1"
.LASF1752:
	.string	"CURSES_H 1"
.LASF1935:
	.string	"A_VERTICAL NCURSES_BITS(1U,22)"
.LASF620:
	.string	"__CPU_MASK_TYPE __SYSCALL_ULONG_TYPE"
.LASF1062:
	.string	"X_OK 1"
.LASF628:
	.string	"__TIME64_T_TYPE __TIME_T_TYPE"
.LASF1461:
	.string	"__DECL_SIMD_asin "
.LASF1905:
	.string	"GCC_UNUSED "
.LASF647:
	.string	"_IOLBF 1"
.LASF1050:
	.string	"__ILP32_OFF32_LDFLAGS \"-m32\""
.LASF2222:
	.string	"BUTTON_RESERVED_EVENT(e,x) ((e) & NCURSES_MOUSE_MASK(x, 040))"
.LASF460:
	.string	"__glibc_unsafe_len(__l,__s,__osz) (__glibc_unsigned_or_positive (__l) && __builtin_constant_p (__glibc_safe_len_cond ((__SIZE_TYPE__) (__l), __s, __osz)) && !__glibc_safe_len_cond ((__SIZE_TYPE__) (__l), __s, __osz))"
.LASF220:
	.string	"__FLT64_MIN_EXP__ (-1021)"
.LASF1701:
	.string	"__MATHCALL"
.LASF2593:
	.string	"sysconf"
.LASF2152:
	.string	"KEY_SELECT 0601"
.LASF2125:
	.string	"KEY_COPY 0546"
.LASF1623:
	.string	"__DECL_SIMD_asinhl "
.LASF2211:
	.string	"BUTTON5_TRIPLE_CLICKED NCURSES_MOUSE_MASK(5, NCURSES_TRIPLE_CLICKED)"
.LASF624:
	.string	"__STATFS_MATCHES_STATFS64 1"
.LASF916:
	.string	"UINT16_C(c) c"
.LASF1921:
	.string	"A_STANDOUT NCURSES_BITS(1U,8)"
.LASF827:
	.string	"__SIZEOF_PTHREAD_ATTR_T 56"
.LASF924:
	.string	"__LC_CTYPE 0"
.LASF2396:
	.string	"_SC_PII_OSI_COTS"
.LASF902:
	.string	"PTRDIFF_MIN (-9223372036854775807L-1)"
.LASF2184:
	.string	"NCURSES_DOUBLE_CLICKED 010L"
.LASF1748:
	.string	"islessgreater(x,y) __builtin_islessgreater(x, y)"
.LASF630:
	.string	"_____fpos_t_defined 1"
.LASF345:
	.string	"__FXSR__ 1"
.LASF1608:
	.string	"__DECL_SIMD_erff32x "
.LASF65:
	.string	"__INT_FAST8_TYPE__ signed char"
.LASF1581:
	.string	"__DECL_SIMD_atanh "
.LASF1394:
	.string	"__DECL_SIMD_sinf16 "
.LASF2387:
	.string	"_SC_PII_SOCKET"
.LASF377:
	.string	"__USE_POSIX199309"
.LASF904:
	.string	"SIG_ATOMIC_MIN (-2147483647-1)"
.LASF2512:
	.string	"_SC_V6_LPBIG_OFFBIG"
.LASF208:
	.string	"__FLT32_DECIMAL_DIG__ 9"
.LASF1493:
	.string	"__DECL_SIMD_exp10l "
.LASF1903:
	.string	"GCC_SCANFLIKE(fmt,var) __attribute__((format(scanf,fmt,var)))"
.LASF350:
	.string	"__SEG_GS 1"
.LASF1631:
	.string	"__DECL_SIMD_erfc "
.LASF1151:
	.string	"_SC_PII_INTERNET_STREAM _SC_PII_INTERNET_STREAM"
.LASF1550:
	.string	"__DECL_SIMD_atan2f128x "
.LASF210:
	.string	"__FLT32_NORM_MAX__ 3.40282346638528859811704183484516925e+38F32"
.LASF252:
	.string	"__FLT32X_MIN_EXP__ (-1021)"
.LASF1357:
	.string	"_CS_POSIX_V7_ILP32_OFF32_LIBS _CS_POSIX_V7_ILP32_OFF32_LIBS"
.LASF702:
	.string	"__WCHAR_T "
.LASF1070:
	.string	"_PC_NAME_MAX _PC_NAME_MAX"
.LASF1373:
	.string	"_GETOPT_POSIX_H 1"
.LASF2515:
	.string	"_SC_TRACE_EVENT_FILTER"
.LASF750:
	.string	"__u_char_defined "
.LASF2158:
	.string	"KEY_SHOME 0607"
.LASF2233:
	.string	"TRACE_CALLS 0x0020"
.LASF998:
	.string	"_POSIX_REENTRANT_FUNCTIONS 1"
.LASF2322:
	.string	"_freeres_buf"
.LASF1472:
	.string	"__DECL_SIMD_hypotf "
.LASF336:
	.string	"__ATOMIC_HLE_ACQUIRE 65536"
.LASF1646:
	.string	"__DECL_SIMD_tanf64 "
.LASF2599:
	.string	"temperature"
.LASF1406:
	.string	"__DECL_SIMD_sincosf64 "
.LASF116:
	.string	"__INT16_C(c) c"
.LASF811:
	.string	"__FD_MASK(d) ((__fd_mask) (1UL << ((d) % __NFDBITS)))"
.LASF43:
	.string	"__WINT_TYPE__ unsigned int"
.LASF2188:
	.string	"BUTTON1_PRESSED NCURSES_MOUSE_MASK(1, NCURSES_BUTTON_PRESSED)"
.LASF1457:
	.string	"__DECL_SIMD_atanf128 "
.LASF132:
	.string	"__INT_FAST8_MAX__ 0x7f"
.LASF2131:
	.string	"KEY_MARK 0554"
.LASF1840:
	.string	"COLOR_RED 1"
.LASF683:
	.string	"__HAVE_DISTINCT_FLOAT32X 0"
.LASF1723:
	.string	"signbit(x) __builtin_signbit (x)"
.LASF404:
	.string	"__GLIBC_USE_ISOC2X 0"
.LASF2083:
	.string	"is_linetouched(w,l) ((!(w) || ((l) > getmaxy(w)) || ((l) < 0)) ? ERR : (is_linetouched)((w),(l)))"
.LASF247:
	.string	"__FLT128_HAS_INFINITY__ 1"
.LASF1006:
	.string	"_POSIX_THREAD_ROBUST_PRIO_PROTECT -1"
.LASF2389:
	.string	"_SC_PII_OSI"
.LASF2331:
	.string	"long long unsigned int"
.LASF751:
	.string	"__ino_t_defined "
.LASF1805:
	.string	"_VA_LIST_ "
.LASF937:
	.string	"LC_CTYPE __LC_CTYPE"
.LASF625:
	.string	"__KERNEL_OLD_TIMEVAL_MATCHES_TIMEVAL64 1"
.LASF2452:
	.string	"_SC_NL_ARGMAX"
.LASF70:
	.string	"__UINT_FAST16_TYPE__ long unsigned int"
.LASF2314:
	.string	"_cur_column"
.LASF90:
	.string	"__LONG_WIDTH__ 64"
.LASF1436:
	.string	"__DECL_SIMD_powf64 "
.LASF980:
	.string	"_XOPEN_LEGACY 1"
.LASF108:
	.string	"__UINT8_MAX__ 0xff"
.LASF1402:
	.string	"__DECL_SIMD_sincosf "
.LASF2385:
	.string	"_SC_PII"
.LASF2348:
	.string	"_SC_MAPPED_FILES"
.LASF1089:
	.string	"_SC_CHILD_MAX _SC_CHILD_MAX"
.LASF668:
	.string	"__HAVE_FLOAT128 1"
.LASF1775:
	.string	"NCURSES_COLOR_T short"
.LASF360:
	.string	"__DECIMAL_BID_FORMAT__ 1"
.LASF1286:
	.string	"_SC_LEVEL3_CACHE_LINESIZE _SC_LEVEL3_CACHE_LINESIZE"
.LASF2530:
	.string	"_SC_LEVEL4_CACHE_SIZE"
.LASF1783:
	.string	"NCURSES_REENTRANT 0"
.LASF538:
	.string	"__GLIBC_USE_IEC_60559_FUNCS_EXT 0"
.LASF1458:
	.string	"__DECL_SIMD_atanf32x "
.LASF1401:
	.string	"__DECL_SIMD_sincos "
.LASF2381:
	.string	"_SC_2_FORT_DEV"
.LASF140:
	.string	"__UINT_FAST8_MAX__ 0xff"
.LASF1318:
	.string	"_CS_LFS_LINTFLAGS _CS_LFS_LINTFLAGS"
.LASF234:
	.string	"__FLT128_MANT_DIG__ 113"
.LASF926:
	.string	"__LC_TIME 2"
.LASF451:
	.string	"__BEGIN_DECLS "
.LASF1249:
	.string	"_SC_SPAWN _SC_SPAWN"
.LASF497:
	.string	"__restrict_arr __restrict"
.LASF936:
	.string	"__LC_IDENTIFICATION 12"
.LASF1398:
	.string	"__DECL_SIMD_sinf32x "
.LASF1363:
	.string	"_CS_POSIX_V7_LP64_OFF64_CFLAGS _CS_POSIX_V7_LP64_OFF64_CFLAGS"
.LASF854:
	.string	"_STDINT_H 1"
.LASF1742:
	.string	"M_SQRT2 1.41421356237309504880"
.LASF2591:
	.string	"get_msr_core_units"
.LASF285:
	.string	"__DEC32_MIN__ 1E-95DF"
.LASF675:
	.string	"__HAVE_FLOAT16 0"
.LASF2341:
	.string	"_SC_REALTIME_SIGNALS"
.LASF667:
	.string	"_BITS_FLOATN_H "
.LASF224:
	.string	"__FLT64_DECIMAL_DIG__ 17"
.LASF993:
	.string	"_POSIX_NO_TRUNC 1"
.LASF2142:
	.string	"KEY_RESTART 0567"
.LASF1894:
	.string	"_ENDLINE 0x02"
.LASF1562:
	.string	"__DECL_SIMD_log2f "
.LASF1806:
	.string	"_VA_LIST "
.LASF2209:
	.string	"BUTTON5_CLICKED NCURSES_MOUSE_MASK(5, NCURSES_BUTTON_CLICKED)"
.LASF2384:
	.string	"_SC_2_LOCALEDEF"
.LASF1067:
	.string	"_PC_LINK_MAX _PC_LINK_MAX"
.LASF1149:
	.string	"_SC_UIO_MAXIOV _SC_UIO_MAXIOV"
.LASF212:
	.string	"__FLT32_EPSILON__ 1.19209289550781250000000000000000000e-7F32"
.LASF131:
	.string	"__UINT64_C(c) c ## UL"
.LASF14:
	.string	"__ATOMIC_CONSUME 1"
.LASF2236:
	.string	"TRACE_BITS 0x0100"
.LASF1686:
	.string	"_Mdouble_ _Float32"
.LASF525:
	.string	"__stub_revoke "
.LASF58:
	.string	"__INT_LEAST16_TYPE__ short int"
.LASF498:
	.string	"__glibc_unlikely(cond) __builtin_expect ((cond), 0)"
.LASF1372:
	.string	"_CS_V7_ENV _CS_V7_ENV"
.LASF1697:
	.string	"__MATHDECL_1_IMPL"
.LASF1237:
	.string	"_SC_FILE_LOCKING _SC_FILE_LOCKING"
.LASF725:
	.string	"__WTERMSIG(status) ((status) & 0x7f)"
.LASF1135:
	.string	"_SC_2_VERSION _SC_2_VERSION"
.LASF1320:
	.string	"_CS_LFS64_LDFLAGS _CS_LFS64_LDFLAGS"
.LASF1117:
	.string	"_SC_VERSION _SC_VERSION"
.LASF2244:
	.string	"unctrl"
.LASF2013:
	.string	"insnstr(s,n) winsnstr(stdscr,(s),(n))"
.LASF2543:
	.string	"_SC_TRACE_USER_EVENT_MAX"
.LASF2307:
	.string	"_IO_backup_base"
.LASF418:
	.string	"__USE_XOPEN2K8 1"
.LASF2560:
	.string	"pkg_now"
.LASF600:
	.string	"__RLIM64_T_TYPE __UQUAD_TYPE"
.LASF1509:
	.string	"__DECL_SIMD_coshf64x "
.LASF994:
	.string	"_XOPEN_REALTIME 1"
.LASF533:
	.string	"__GLIBC_USE_IEC_60559_BFP_EXT_C2X"
.LASF1986:
	.string	"attr_get(ap,cp,o) wattr_get(stdscr,(ap),(cp),(o))"
.LASF2298:
	.string	"_IO_read_ptr"
.LASF59:
	.string	"__INT_LEAST32_TYPE__ int"
.LASF649:
	.string	"BUFSIZ 8192"
.LASF1979:
	.string	"COLOR_PAIR(n) (NCURSES_BITS((n), 0) & A_COLOR)"
.LASF1620:
	.string	"__DECL_SIMD_tanhf128x "
.LASF329:
	.string	"__SIZEOF_PTRDIFF_T__ 8"
.LASF1491:
	.string	"__DECL_SIMD_exp10 "
.LASF1020:
	.string	"_POSIX_REGEXP 1"
.LASF742:
	.string	"WIFCONTINUED(status) __WIFCONTINUED (status)"
.LASF619:
	.string	"__SSIZE_T_TYPE __SWORD_TYPE"
.LASF853:
	.string	"_STRINGS_H 1"
.LASF1269:
	.string	"_SC_V6_LPBIG_OFFBIG _SC_V6_LPBIG_OFFBIG"
.LASF1948:
	.string	"saveterm() def_prog_mode()"
.LASF1807:
	.string	"_VA_LIST_T_H "
.LASF645:
	.string	"__ssize_t_defined "
.LASF264:
	.string	"__FLT32X_HAS_QUIET_NAN__ 1"
.LASF1200:
	.string	"_SC_SSIZE_MAX _SC_SSIZE_MAX"
.LASF1396:
	.string	"__DECL_SIMD_sinf64 "
.LASF38:
	.string	"__GNUC_EXECUTION_CHARSET_NAME \"UTF-8\""
.LASF419:
	.string	"_ATFILE_SOURCE"
.LASF2248:
	.string	"BATTERY_STATUS_BUF_SIZE 20"
.LASF1612:
	.string	"__DECL_SIMD_tanhf "
.LASF2321:
	.string	"_freeres_list"
.LASF633:
	.string	"____FILE_defined 1"
.LASF519:
	.string	"__attr_dealloc_free __attr_dealloc (__builtin_free, 1)"
.LASF1644:
	.string	"__DECL_SIMD_tanf16 "
.LASF171:
	.string	"__DBL_MIN_EXP__ (-1021)"
.LASF429:
	.string	"__GLIBC_USE_DEPRECATED_SCANF 0"
.LASF2238:
	.string	"TRACE_CCALLS 0x0400"
.LASF817:
	.string	"FD_ISSET(fd,fdsetp) __FD_ISSET (fd, fdsetp)"
.LASF1267:
	.string	"_SC_V6_ILP32_OFFBIG _SC_V6_ILP32_OFFBIG"
.LASF1930:
	.string	"A_HORIZONTAL NCURSES_BITS(1U,17)"
.LASF1534:
	.string	"__DECL_SIMD_cbrtf16 "
.LASF1931:
	.string	"A_LEFT NCURSES_BITS(1U,18)"
.LASF2057:
	.string	"mvinchnstr(y,x,s,n) mvwinchnstr(stdscr,(y),(x),(s),(n))"
.LASF1096:
	.string	"_SC_SAVED_IDS _SC_SAVED_IDS"
.LASF539:
	.string	"__GLIBC_USE_IEC_60559_FUNCS_EXT_C2X"
.LASF685:
	.string	"__HAVE_DISTINCT_FLOAT128X __HAVE_FLOAT128X"
.LASF1756:
	.string	"NCURSES_VERSION"
.LASF1281:
	.string	"_SC_LEVEL2_CACHE_SIZE _SC_LEVEL2_CACHE_SIZE"
.LASF1759:
	.string	"NCURSES_DLL_H_incl 1"
.LASF1439:
	.string	"__DECL_SIMD_powf64x "
.LASF1389:
	.string	"__DECL_SIMD_cosf64x "
.LASF2412:
	.string	"_SC_THREAD_PRIORITY_SCHEDULING"
.LASF2063:
	.string	"mvinstr(y,x,s) mvwinstr(stdscr,(y),(x),(s))"
.LASF1109:
	.string	"_SC_SEMAPHORES _SC_SEMAPHORES"
.LASF2438:
	.string	"_SC_INT_MIN"
.LASF1017:
	.string	"_POSIX_SHARED_MEMORY_OBJECTS 200809L"
.LASF410:
	.string	"_POSIX_SOURCE 1"
.LASF1453:
	.string	"__DECL_SIMD_atanl "
.LASF1233:
	.string	"_SC_FD_MGMT _SC_FD_MGMT"
.LASF2084:
	.string	"KEY_CODE_YES 0400"
.LASF825:
	.string	"_BITS_PTHREADTYPES_ARCH_H 1"
.LASF2394:
	.string	"_SC_PII_INTERNET_STREAM"
.LASF1032:
	.string	"_POSIX_ADVISORY_INFO 200809L"
.LASF848:
	.string	"alloca(size) __builtin_alloca (size)"
.LASF1873:
	.string	"ACS_S3 NCURSES_ACS('p')"
.LASF286:
	.string	"__DEC32_MAX__ 9.999999E96DF"
.LASF2411:
	.string	"_SC_THREAD_ATTR_STACKSIZE"
.LASF901:
	.string	"UINTMAX_MAX (__UINT64_C(18446744073709551615))"
.LASF2313:
	.string	"_old_offset"
.LASF1814:
	.string	"bool _Bool"
.LASF1830:
	.string	"WA_INVIS A_INVIS"
.LASF2366:
	.string	"_SC_SIGQUEUE_MAX"
.LASF1872:
	.string	"ACS_BLOCK NCURSES_ACS('0')"
.LASF2203:
	.string	"BUTTON4_PRESSED NCURSES_MOUSE_MASK(4, NCURSES_BUTTON_PRESSED)"
.LASF248:
	.string	"__FLT128_HAS_QUIET_NAN__ 1"
.LASF1551:
	.string	"__DECL_SIMD_log10 "
.LASF2600:
	.string	"voltage"
.LASF500:
	.string	"__attribute_nonstring__ __attribute__ ((__nonstring__))"
.LASF616:
	.string	"__TIMER_T_TYPE void *"
.LASF976:
	.string	"_XOPEN_XPG3 1"
.LASF1918:
	.string	"A_ATTRIBUTES NCURSES_BITS(~(1U - 1U),0)"
.LASF1607:
	.string	"__DECL_SIMD_erff128 "
.LASF2546:
	.string	"_SC_THREAD_ROBUST_PRIO_PROTECT"
.LASF1557:
	.string	"__DECL_SIMD_log10f128 "
.LASF1955:
	.string	"getbegx(win) (NCURSES_OK_ADDR(win) ? (win)->_begx : ERR)"
.LASF1392:
	.string	"__DECL_SIMD_sinf "
.LASF1524:
	.string	"__DECL_SIMD_sinhf16 "
.LASF2001:
	.string	"deleteln() winsdelln(stdscr,-1)"
.LASF1445:
	.string	"__DECL_SIMD_acosf32 "
.LASF262:
	.string	"__FLT32X_HAS_DENORM__ 1"
.LASF2273:
	.string	"MAX_TURBO_LIMIT_STATUS 4096"
.LASF1800:
	.string	"va_start(v,l) __builtin_va_start(v,l)"
.LASF2564:
	.string	"energy_unit"
.LASF785:
	.string	"htobe16(x) __bswap_16 (x)"
.LASF1932:
	.string	"A_LOW NCURSES_BITS(1U,19)"
.LASF216:
	.string	"__FLT32_HAS_QUIET_NAN__ 1"
.LASF1532:
	.string	"__DECL_SIMD_cbrtf "
.LASF1883:
	.string	"ACS_SBBS ACS_LRCORNER"
.LASF2149:
	.string	"KEY_SCREATE 0576"
.LASF2374:
	.string	"_SC_EXPR_NEST_MAX"
.LASF1433:
	.string	"__DECL_SIMD_powl "
.LASF431:
	.string	"__GNU_LIBRARY__ 6"
.LASF814:
	.string	"NFDBITS __NFDBITS"
.LASF2330:
	.string	"long long int"
.LASF1953:
	.string	"getcurx(win) (NCURSES_OK_ADDR(win) ? (win)->_curx : ERR)"
.LASF606:
	.string	"__FSFILCNT64_T_TYPE __UQUAD_TYPE"
.LASF909:
	.string	"WINT_MIN (0u)"
.LASF1268:
	.string	"_SC_V6_LP64_OFF64 _SC_V6_LP64_OFF64"
.LASF2180:
	.string	"NCURSES_MOUSE_MASK(b,m) ((m) << (((b) - 1) * 5))"
.LASF2312:
	.string	"_flags2"
.LASF1258:
	.string	"_SC_2_PBS _SC_2_PBS"
.LASF746:
	.string	"EXIT_FAILURE 1"
.LASF1354:
	.string	"_CS_POSIX_V6_LPBIG_OFFBIG_LINTFLAGS _CS_POSIX_V6_LPBIG_OFFBIG_LINTFLAGS"
.LASF799:
	.string	"__FD_SET(d,s) ((void) (__FDS_BITS (s)[__FD_ELT(d)] |= __FD_MASK(d)))"
.LASF736:
	.string	"WEXITSTATUS(status) __WEXITSTATUS (status)"
.LASF2218:
	.string	"BUTTON_PRESS(e,x) ((e) & NCURSES_MOUSE_MASK(x, 002))"
.LASF1689:
	.string	"_Mdouble_ _Float64"
.LASF302:
	.string	"__DEC128_SUBNORMAL_MIN__ 0.000000000000000000000000000000001E-6143DL"
.LASF1221:
	.string	"_SC_XOPEN_REALTIME_THREADS _SC_XOPEN_REALTIME_THREADS"
.LASF797:
	.string	"_SYS_SELECT_H 1"
.LASF1322:
	.string	"_CS_LFS64_LINTFLAGS _CS_LFS64_LINTFLAGS"
.LASF2489:
	.string	"_SC_REGEX_VERSION"
.LASF1856:
	.string	"ACS_HLINE NCURSES_ACS('q')"
.LASF1754:
	.string	"NCURSES_VERSION_MINOR 3"
.LASF1315:
	.string	"_CS_LFS_CFLAGS _CS_LFS_CFLAGS"
.LASF1018:
	.string	"_POSIX_CPUTIME 0"
.LASF639:
	.string	"__feof_unlocked_body(_fp) (((_fp)->_flags & _IO_EOF_SEEN) != 0)"
.LASF1696:
	.string	"__MATH_PRECNAME(name,r) name ##f64x ##r"
.LASF414:
	.string	"__USE_POSIX2 1"
.LASF962:
	.string	"LC_ALL_MASK (LC_CTYPE_MASK | LC_NUMERIC_MASK | LC_TIME_MASK | LC_COLLATE_MASK | LC_MONETARY_MASK | LC_MESSAGES_MASK | LC_PAPER_MASK | LC_NAME_MASK | LC_ADDRESS_MASK | LC_TELEPHONE_MASK | LC_MEASUREMENT_MASK | LC_IDENTIFICATION_MASK )"
.LASF2480:
	.string	"_SC_FILE_LOCKING"
.LASF1337:
	.string	"_CS_XBS5_LPBIG_OFFBIG_LIBS _CS_XBS5_LPBIG_OFFBIG_LIBS"
.LASF846:
	.string	"_ALLOCA_H 1"
.LASF96:
	.string	"__INTMAX_MAX__ 0x7fffffffffffffffL"
.LASF1175:
	.string	"_SC_PHYS_PAGES _SC_PHYS_PAGES"
.LASF839:
	.string	"__PTHREAD_MUTEX_HAVE_PREV 1"
.LASF2143:
	.string	"KEY_RESUME 0570"
.LASF726:
	.string	"__WSTOPSIG(status) __WEXITSTATUS(status)"
.LASF1899:
	.string	"_WRAPPED 0x40"
.LASF1195:
	.string	"_SC_INT_MIN _SC_INT_MIN"
.LASF2419:
	.string	"_SC_AVPHYS_PAGES"
.LASF481:
	.string	"__attribute_deprecated_msg__(msg) __attribute__ ((__deprecated__ (msg)))"
.LASF2441:
	.string	"_SC_MB_LEN_MAX"
.LASF1105:
	.string	"_SC_MEMLOCK _SC_MEMLOCK"
.LASF292:
	.string	"__DEC64_MIN__ 1E-383DD"
.LASF436:
	.string	"__PMT"
.LASF2377:
	.string	"_SC_CHARCLASS_NAME_MAX"
.LASF343:
	.string	"__SSE__ 1"
.LASF2612:
	.string	"init_environment"
.LASF2332:
	.string	"_SC_ARG_MAX"
.LASF183:
	.string	"__DBL_HAS_QUIET_NAN__ 1"
.LASF1703:
	.string	"__MATHCALL_NARROW_ARGS_2 (_Marg_ __x, _Marg_ __y)"
.LASF282:
	.string	"__DEC32_MANT_DIG__ 7"
.LASF390:
	.string	"__USE_ATFILE"
.LASF2350:
	.string	"_SC_MEMLOCK_RANGE"
.LASF164:
	.string	"__FLT_DENORM_MIN__ 1.40129846432481707092372958328991613e-45F"
.LASF969:
	.string	"_POSIX2_C_BIND __POSIX2_THIS_VERSION"
.LASF2354:
	.string	"_SC_SHARED_MEMORY_OBJECTS"
.LASF2144:
	.string	"KEY_SAVE 0571"
.LASF1243:
	.string	"_SC_READER_WRITER_LOCKS _SC_READER_WRITER_LOCKS"
.LASF253:
	.string	"__FLT32X_MIN_10_EXP__ (-307)"
.LASF1176:
	.string	"_SC_AVPHYS_PAGES _SC_AVPHYS_PAGES"
.LASF2225:
	.string	"_tracech_t2 _tracechtype2"
.LASF842:
	.string	"__PTHREAD_RWLOCK_ELISION_EXTRA 0, { 0, 0, 0, 0, 0, 0, 0 }"
.LASF356:
	.string	"__unix 1"
.LASF503:
	.string	"__LDOUBLE_REDIRECTS_TO_FLOAT128_ABI 0"
.LASF281:
	.string	"__FLT64X_IS_IEC_60559__ 2"
.LASF2436:
	.string	"_SC_CHAR_MIN"
.LASF1384:
	.string	"__DECL_SIMD_cosf16 "
.LASF1319:
	.string	"_CS_LFS64_CFLAGS _CS_LFS64_CFLAGS"
.LASF176:
	.string	"__DBL_MAX__ ((double)1.79769313486231570814527423731704357e+308L)"
.LASF483:
	.string	"__attribute_format_strfmon__(a,b) __attribute__ ((__format__ (__strfmon__, a, b)))"
.LASF2285:
	.string	"long unsigned int"
.LASF646:
	.string	"_IOFBF 0"
.LASF2212:
	.string	"BUTTON_CTRL NCURSES_MOUSE_MASK(6, 0001L)"
.LASF896:
	.string	"INTPTR_MIN (-9223372036854775807L-1)"
.LASF395:
	.string	"__GLIBC_USE_ISOC2X"
.LASF536:
	.string	"__GLIBC_USE_IEC_60559_EXT 0"
.LASF903:
	.string	"PTRDIFF_MAX (9223372036854775807L)"
.LASF161:
	.string	"__FLT_NORM_MAX__ 3.40282346638528859811704183484516925e+38F"
.LASF438:
	.string	"__glibc_has_builtin(name) __has_builtin (name)"
.LASF2147:
	.string	"KEY_SCOMMAND 0574"
.LASF1911:
	.string	"NCURSES_SP_FUNCS"
.LASF608:
	.string	"__CLOCK_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF268:
	.string	"__FLT64X_MIN_EXP__ (-16381)"
.LASF459:
	.string	"__glibc_safe_or_unknown_len(__l,__s,__osz) (__glibc_unsigned_or_positive (__l) && __builtin_constant_p (__glibc_safe_len_cond ((__SIZE_TYPE__) (__l), __s, __osz)) && __glibc_safe_len_cond ((__SIZE_TYPE__) (__l), __s, __osz))"
.LASF1861:
	.string	"ACS_DIAMOND NCURSES_ACS('`')"
.LASF2464:
	.string	"_SC_XOPEN_REALTIME_THREADS"
.LASF2505:
	.string	"_SC_2_PBS_TRACK"
.LASF1902:
	.string	"GCC_PRINTFLIKE(fmt,var) __attribute__((format(printf,fmt,var)))"
.LASF1994:
	.string	"bkgdset(ch) wbkgdset(stdscr,(ch))"
.LASF1326:
	.string	"_CS_XBS5_ILP32_OFF32_LINTFLAGS _CS_XBS5_ILP32_OFF32_LINTFLAGS"
.LASF28:
	.string	"__SIZEOF_LONG_DOUBLE__ 16"
.LASF2139:
	.string	"KEY_REFERENCE 0564"
.LASF1878:
	.string	"ACS_NEQUAL NCURSES_ACS('|')"
.LASF1069:
	.string	"_PC_MAX_INPUT _PC_MAX_INPUT"
.LASF66:
	.string	"__INT_FAST16_TYPE__ long int"
.LASF851:
	.string	"_BITS_TYPES_LOCALE_T_H 1"
.LASF951:
	.string	"LC_NUMERIC_MASK (1 << __LC_NUMERIC)"
.LASF605:
	.string	"__FSFILCNT_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF1657:
	.string	"__FP_LOGB0_IS_MIN 1"
.LASF1654:
	.string	"INFINITY (__builtin_inff ())"
.LASF230:
	.string	"__FLT64_HAS_DENORM__ 1"
.LASF1021:
	.string	"_POSIX_READER_WRITER_LOCKS 200809L"
.LASF240:
	.string	"__FLT128_DECIMAL_DIG__ 36"
.LASF2528:
	.string	"_SC_LEVEL3_CACHE_ASSOC"
.LASF165:
	.string	"__FLT_HAS_DENORM__ 1"
.LASF2417:
	.string	"_SC_NPROCESSORS_ONLN"
.LASF1704:
	.string	"__MATHCALL_NARROW_ARGS_3 (_Marg_ __x, _Marg_ __y, _Marg_ __z)"
.LASF1075:
	.string	"_PC_VDISABLE _PC_VDISABLE"
.LASF1792:
	.string	"NCURSES_TPARM_ARG intptr_t"
.LASF1833:
	.string	"WA_LEFT A_LEFT"
.LASF1969:
	.string	"box(win,v,h) wborder(win, v, v, h, h, 0, 0, 0, 0)"
.LASF1621:
	.string	"__DECL_SIMD_asinh "
.LASF950:
	.string	"LC_CTYPE_MASK (1 << __LC_CTYPE)"
.LASF598:
	.string	"__PID_T_TYPE __S32_TYPE"
.LASF2271:
	.string	"PKG_PL1_STATUS 1024"
.LASF1234:
	.string	"_SC_FIFO _SC_FIFO"
.LASF1048:
	.string	"_XBS5_LP64_OFF64 1"
.LASF1420:
	.string	"__DECL_SIMD_logf128x "
.LASF1761:
	.string	"NCURSES_IMPEXP NCURSES_EXPORT_GENERAL_IMPORT"
.LASF1111:
	.string	"_SC_AIO_LISTIO_MAX _SC_AIO_LISTIO_MAX"
.LASF2274:
	.string	"TURBO_TRANSITION_ATTENUATION_STATUS 8192"
.LASF2221:
	.string	"BUTTON_TRIPLE_CLICK(e,x) ((e) & NCURSES_MOUSE_MASK(x, 020))"
.LASF1103:
	.string	"_SC_FSYNC _SC_FSYNC"
.LASF2513:
	.string	"_SC_HOST_NAME_MAX"
.LASF1577:
	.string	"__DECL_SIMD_log1pf128 "
.LASF2005:
	.string	"getstr(str) wgetstr(stdscr,(str))"
.LASF193:
	.string	"__LDBL_MAX__ 1.18973149535723176502126385303097021e+4932L"
.LASF1536:
	.string	"__DECL_SIMD_cbrtf64 "
.LASF215:
	.string	"__FLT32_HAS_INFINITY__ 1"
.LASF2205:
	.string	"BUTTON4_DOUBLE_CLICKED NCURSES_MOUSE_MASK(4, NCURSES_DOUBLE_CLICKED)"
.LASF1317:
	.string	"_CS_LFS_LIBS _CS_LFS_LIBS"
.LASF301:
	.string	"__DEC128_EPSILON__ 1E-33DL"
.LASF546:
	.string	"__SIZE_T__ "
.LASF2372:
	.string	"_SC_COLL_WEIGHTS_MAX"
.LASF1153:
	.string	"_SC_PII_OSI_COTS _SC_PII_OSI_COTS"
.LASF2482:
	.string	"_SC_MONOTONIC_CLOCK"
.LASF1012:
	.string	"_POSIX_PRIORITIZED_IO 200809L"
.LASF1846:
	.string	"COLOR_WHITE 7"
.LASF2088:
	.string	"KEY_RESET 0531"
.LASF2087:
	.string	"KEY_SRESET 0530"
.LASF61:
	.string	"__UINT_LEAST8_TYPE__ unsigned char"
.LASF594:
	.string	"__NLINK_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF366:
	.string	"__STDC_ISO_10646__ 201706L"
.LASF188:
	.string	"__LDBL_MIN_10_EXP__ (-4931)"
.LASF2334:
	.string	"_SC_CLK_TCK"
.LASF1228:
	.string	"_SC_CPUTIME _SC_CPUTIME"
.LASF1784:
	.string	"NCURSES_BROKEN_LINKER"
.LASF463:
	.string	"__warnattr(msg) __attribute__((__warning__ (msg)))"
.LASF449:
	.string	"__STRING(x) #x"
.LASF2518:
	.string	"_SC_LEVEL1_ICACHE_SIZE"
.LASF652:
	.string	"SEEK_CUR 1"
.LASF1964:
	.string	"wattroff(win,at) wattr_off(win, NCURSES_CAST(attr_t, at), NULL)"
.LASF2566:
	.string	"battery_s"
.LASF1893:
	.string	"_SUBWIN 0x01"
.LASF2456:
	.string	"_SC_NL_SETMAX"
.LASF416:
	.string	"__USE_POSIX199506 1"
.LASF1595:
	.string	"__DECL_SIMD_acoshf32 "
.LASF1001:
	.string	"_POSIX_THREAD_ATTR_STACKSIZE 200809L"
.LASF2286:
	.string	"unsigned int"
.LASF2567:
	.string	"power_now"
.LASF1342:
	.string	"_CS_POSIX_V6_ILP32_OFF32_LINTFLAGS _CS_POSIX_V6_ILP32_OFF32_LINTFLAGS"
.LASF1475:
	.string	"__DECL_SIMD_hypotf32 "
.LASF796:
	.string	"le64toh(x) __uint64_identity (x)"
.LASF1640:
	.string	"__DECL_SIMD_erfcf128x "
.LASF2003:
	.string	"erase() werase(stdscr)"
.LASF948:
	.string	"LC_MEASUREMENT __LC_MEASUREMENT"
.LASF1716:
	.string	"__MATH_TG(TG_ARG,FUNC,ARGS) _Generic ((TG_ARG), float: FUNC ## f ARGS, __MATH_TG_F32 (FUNC, ARGS) default: FUNC ARGS, long double: FUNC ## l ARGS, __MATH_TG_F64X (FUNC, ARGS) _Float128: FUNC ## f128 ARGS)"
.LASF1203:
	.string	"_SC_SHRT_MAX _SC_SHRT_MAX"
.LASF1335:
	.string	"_CS_XBS5_LPBIG_OFFBIG_CFLAGS _CS_XBS5_LPBIG_OFFBIG_CFLAGS"
.LASF1301:
	.string	"_SC_XOPEN_STREAMS _SC_XOPEN_STREAMS"
.LASF476:
	.string	"__attribute_const__ __attribute__ ((__const__))"
.LASF540:
	.string	"__GLIBC_USE_IEC_60559_FUNCS_EXT_C2X 0"
.LASF486:
	.string	"__returns_nonnull __attribute__ ((__returns_nonnull__))"
.LASF2060:
	.string	"mvinsch(y,x,c) mvwinsch(stdscr,(y),(x),(c))"
.LASF1542:
	.string	"__DECL_SIMD_atan2f "
.LASF1273:
	.string	"_SC_TRACE_INHERIT _SC_TRACE_INHERIT"
.LASF1843:
	.string	"COLOR_BLUE 4"
.LASF1613:
	.string	"__DECL_SIMD_tanhl "
.LASF162:
	.string	"__FLT_MIN__ 1.17549435082228750796873653722224568e-38F"
.LASF2510:
	.string	"_SC_V6_ILP32_OFFBIG"
.LASF2148:
	.string	"KEY_SCOPY 0575"
.LASF952:
	.string	"LC_TIME_MASK (1 << __LC_TIME)"
.LASF433:
	.string	"__GLIBC_MINOR__ 35"
.LASF40:
	.string	"__SIZE_TYPE__ long unsigned int"
.LASF189:
	.string	"__LDBL_MAX_EXP__ 16384"
.LASF1483:
	.string	"__DECL_SIMD_exp2l "
.LASF1037:
	.string	"_POSIX_THREAD_SPORADIC_SERVER -1"
.LASF1997:
	.string	"clrtobot() wclrtobot(stdscr)"
.LASF2290:
	.string	"short int"
.LASF348:
	.string	"__MMX_WITH_SSE__ 1"
.LASF958:
	.string	"LC_ADDRESS_MASK (1 << __LC_ADDRESS)"
.LASF1010:
	.string	"_POSIX_ASYNC_IO 1"
.LASF6:
	.string	"__GNUC_MINOR__ 4"
.LASF1172:
	.string	"_SC_THREAD_PROCESS_SHARED _SC_THREAD_PROCESS_SHARED"
.LASF2:
	.string	"__STDC_UTF_16__ 1"
.LASF1535:
	.string	"__DECL_SIMD_cbrtf32 "
.LASF2235:
	.string	"TRACE_IEVENT 0x0080"
.LASF1990:
	.string	"attroff(at) wattroff(stdscr,(at))"
.LASF1772:
	.string	"NCURSES_INLINE"
.LASF20:
	.string	"_LP64 1"
.LASF2315:
	.string	"_vtable_offset"
.LASF1421:
	.string	"__DECL_SIMD_exp "
.LASF2279:
	.string	"AMD_MSR_CORE_ENERGY 0xC001029A"
.LASF2150:
	.string	"KEY_SDC 0577"
.LASF2533:
	.string	"_SC_IPV6"
.LASF582:
	.string	"__S64_TYPE long int"
.LASF547:
	.string	"_SIZE_T "
.LASF813:
	.string	"FD_SETSIZE __FD_SETSIZE"
.LASF142:
	.string	"__UINT_FAST32_MAX__ 0xffffffffffffffffUL"
.LASF1660:
	.string	"FP_ILOGBNAN (-2147483647 - 1)"
.LASF1633:
	.string	"__DECL_SIMD_erfcl "
.LASF1874:
	.string	"ACS_S7 NCURSES_ACS('r')"
.LASF1102:
	.string	"_SC_SYNCHRONIZED_IO _SC_SYNCHRONIZED_IO"
.LASF2488:
	.string	"_SC_REGEXP"
.LASF1848:
	.string	"ACS_ULCORNER NCURSES_ACS('l')"
.LASF1571:
	.string	"__DECL_SIMD_log1p "
.LASF133:
	.string	"__INT_FAST8_WIDTH__ 8"
.LASF99:
	.string	"__UINTMAX_C(c) c ## UL"
.LASF1974:
	.string	"winchstr(w,s) winchnstr(w, s, -1)"
.LASF1767:
	.string	"NCURSES_API "
.LASF1498:
	.string	"__DECL_SIMD_exp10f32x "
.LASF1698:
	.string	"__MATHDECL_1"
.LASF138:
	.string	"__INT_FAST64_MAX__ 0x7fffffffffffffffL"
.LASF2616:
	.string	"_IO_lock_t"
.LASF2595:
	.string	"popen"
.LASF2114:
	.string	"KEY_LL 0533"
.LASF41:
	.string	"__PTRDIFF_TYPE__ long int"
.LASF2210:
	.string	"BUTTON5_DOUBLE_CLICKED NCURSES_MOUSE_MASK(5, NCURSES_DOUBLE_CLICKED)"
.LASF1328:
	.string	"_CS_XBS5_ILP32_OFFBIG_LDFLAGS _CS_XBS5_ILP32_OFFBIG_LDFLAGS"
.LASF124:
	.string	"__UINT_LEAST8_MAX__ 0xff"
.LASF740:
	.string	"WIFSIGNALED(status) __WIFSIGNALED (status)"
.LASF2123:
	.string	"KEY_CLOSE 0544"
.LASF407:
	.string	"__USE_ISOC95 1"
.LASF1521:
	.string	"__DECL_SIMD_sinh "
.LASF259:
	.string	"__FLT32X_MIN__ 2.22507385850720138309023271733240406e-308F32x"
.LASF2007:
	.string	"inchnstr(s,n) winchnstr(stdscr,(s),(n))"
.LASF122:
	.string	"__INT64_C(c) c ## L"
.LASF1416:
	.string	"__DECL_SIMD_logf64 "
.LASF1627:
	.string	"__DECL_SIMD_asinhf128 "
.LASF2240:
	.string	"TRACE_ATTRS 0x1000"
.LASF529:
	.string	"__GLIBC_USE_LIB_EXT2"
.LASF2135:
	.string	"KEY_OPEN 0560"
.LASF7:
	.string	"__GNUC_PATCHLEVEL__ 0"
.LASF170:
	.string	"__DBL_DIG__ 15"
.LASF1533:
	.string	"__DECL_SIMD_cbrtl "
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
