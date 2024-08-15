	.file	"main.c"
	.intel_syntax noprefix
# GNU C17 (Ubuntu 11.4.0-1ubuntu1~22.04) version 11.4.0 (x86_64-linux-gnu)
#	compiled by GNU C version 11.4.0, GMP version 6.2.1, MPFR version 4.1.0, MPC version 1.2.1, isl version isl-0.24-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -masm=intel -mtune=generic -march=x86-64 -g -g -ggdb3 -gdwarf-2 -O0 -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection
	.text
.Ltext0:
	.globl	period_counter
	.bss
	.align 8
	.type	period_counter, @object
	.size	period_counter, 8
period_counter:
	.zero	8
	.globl	poll_cycle_counter
	.align 8
	.type	poll_cycle_counter, @object
	.size	poll_cycle_counter, 8
poll_cycle_counter:
	.zero	8
	.globl	display_power_config_flag
	.data
	.type	display_power_config_flag, @object
	.size	display_power_config_flag, 1
display_power_config_flag:
	.byte	1
	.globl	display_moving_average_flag
	.bss
	.type	display_moving_average_flag, @object
	.size	display_moving_average_flag, 1
display_moving_average_flag:
	.zero	1
	.globl	cpu_designer
	.data
	.align 4
	.type	cpu_designer, @object
	.size	cpu_designer, 4
cpu_designer:
	.long	1
	.globl	freq_his
	.bss
	.align 32
	.type	freq_his, @object
	.size	freq_his, 240
freq_his:
	.zero	240
	.globl	load_his
	.align 32
	.type	load_his, @object
	.size	load_his, 240
load_his:
	.zero	240
	.globl	temp_his
	.align 32
	.type	temp_his, @object
	.size	temp_his, 240
temp_his:
	.zero	240
	.globl	voltage_his
	.align 32
	.type	voltage_his, @object
	.size	voltage_his, 240
voltage_his:
	.zero	240
	.globl	power_his
	.align 32
	.type	power_his, @object
	.size	power_his, 240
power_his:
	.zero	240
	.section	.rodata
	.align 8
.LC1:
	.string	"\t-p    : displays performance and power configurations"
.LC2:
	.string	"\t-h    : displays this help"
.LC3:
	.string	"Unknown option %c\n"
.LC4:
	.string	"c:hmps"
.LC5:
	.string	"\n\t\t%s\n\n"
	.align 8
.LC6:
	.string	"       f/GHz \tC0%%   Temp/\302\260C\tU/V\n"
	.align 8
.LC7:
	.string	"-------------------------------------\n"
.LC8:
	.string	"Core %d \t%.1f\t%.f\t%.f\t%.2f\n"
.LC9:
	.string	"\n"
.LC10:
	.string	"avg\t%.2f\t%.2f\t%.1f\t%.2f\n"
.LC11:
	.string	"min\t%.2f\t%.2f\t%.0f\t%.2f\n"
.LC12:
	.string	"max\t%.2f\t%.2f\t%.0f\t%.2f\n"
	.align 8
.LC13:
	.string	"To monitor all metrics, pls run as root.\n\n"
.LC14:
	.string	"\t\tf/GHz \tC0%% \n"
.LC15:
	.string	"Core \t%d \t%.1f\t%.f\n"
.LC16:
	.string	"avg\t\t%.2f\t%.2f\n"
.LC17:
	.string	"min\t\t%.2f\t\n"
.LC18:
	.string	"max\t\t%.2f\t\n"
	.align 8
.LC19:
	.string	"---------- Battery (%s) ----------\n"
	.align 8
.LC20:
	.string	"    now      avg      min      max\n"
	.align 8
.LC21:
	.string	"  %.2f W   %.2f W   %.2f W   %.2f W\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.file 1 "/home/jscha/dvp/cpumon/src/main.c"
	.loc 1 52 1
	.cfi_startproc
	endbr64	
	push	rbp	#
.LCFI0:
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
.LCFI1:
	.cfi_def_cfa_register 6
	sub	rsp, 160	#,
	mov	DWORD PTR -148[rbp], edi	# argc, argc
	mov	QWORD PTR -160[rbp], rsi	# argv, argv
# /home/jscha/dvp/cpumon/src/main.c:52: {   
	.loc 1 52 1
	mov	rax, QWORD PTR fs:40	# tmp323, MEM[(<address-space-1> long unsigned int *)40B]
	mov	QWORD PTR -8[rbp], rax	# D.5309, tmp323
	xor	eax, eax	# tmp323
# /home/jscha/dvp/cpumon/src/main.c:53:     init_environment();
	.loc 1 53 5
	call	init_environment@PLT	#
# /home/jscha/dvp/cpumon/src/main.c:59:     sensor *freq = malloc( sizeof(sensor) + core_count * sizeof(freq->per_core[0]) );
	.loc 1 59 43
	mov	eax, DWORD PTR core_count[rip]	# core_count.0_1, core_count
	cdqe
	add	rax, 5	# _3,
# /home/jscha/dvp/cpumon/src/main.c:59:     sensor *freq = malloc( sizeof(sensor) + core_count * sizeof(freq->per_core[0]) );
	.loc 1 59 20
	sal	rax, 2	# _4,
	mov	rdi, rax	#, _4
	call	malloc@PLT	#
	mov	QWORD PTR -112[rbp], rax	# freq, tmp196
# /home/jscha/dvp/cpumon/src/main.c:60:     *freq = (sensor) {.min = 1000, .max = 0}; 
	.loc 1 60 11
	mov	rax, QWORD PTR -112[rbp]	# tmp197, freq
	mov	QWORD PTR [rax], 0	# *freq_130,
	mov	QWORD PTR 8[rax], 0	# *freq_130,
	mov	DWORD PTR 16[rax], 0	# *freq_130,
	mov	rax, QWORD PTR -112[rbp]	# tmp198, freq
	movss	xmm0, DWORD PTR .LC0[rip]	# tmp199,
	movss	DWORD PTR 12[rax], xmm0	# freq_130->min, tmp199
# /home/jscha/dvp/cpumon/src/main.c:61:     sensor *load = malloc( sizeof(sensor) + core_count * sizeof(load->per_core[0]) ); 
	.loc 1 61 43
	mov	eax, DWORD PTR core_count[rip]	# core_count.1_5, core_count
	cdqe
	add	rax, 5	# _7,
# /home/jscha/dvp/cpumon/src/main.c:61:     sensor *load = malloc( sizeof(sensor) + core_count * sizeof(load->per_core[0]) ); 
	.loc 1 61 20
	sal	rax, 2	# _8,
	mov	rdi, rax	#, _8
	call	malloc@PLT	#
	mov	QWORD PTR -104[rbp], rax	# load, tmp200
# /home/jscha/dvp/cpumon/src/main.c:62:     *load = (sensor) {.min = 1000, .max = 0}; 
	.loc 1 62 11
	mov	rax, QWORD PTR -104[rbp]	# tmp201, load
	mov	QWORD PTR [rax], 0	# *load_134,
	mov	QWORD PTR 8[rax], 0	# *load_134,
	mov	DWORD PTR 16[rax], 0	# *load_134,
	mov	rax, QWORD PTR -104[rbp]	# tmp202, load
	movss	xmm0, DWORD PTR .LC0[rip]	# tmp203,
	movss	DWORD PTR 12[rax], xmm0	# load_134->min, tmp203
# /home/jscha/dvp/cpumon/src/main.c:63:     sensor *temperature = malloc( sizeof(sensor) + core_count * sizeof(temperature->per_core[0]) ); 
	.loc 1 63 50
	mov	eax, DWORD PTR core_count[rip]	# core_count.2_9, core_count
	cdqe
	add	rax, 5	# _11,
# /home/jscha/dvp/cpumon/src/main.c:63:     sensor *temperature = malloc( sizeof(sensor) + core_count * sizeof(temperature->per_core[0]) ); 
	.loc 1 63 27
	sal	rax, 2	# _12,
	mov	rdi, rax	#, _12
	call	malloc@PLT	#
	mov	QWORD PTR -96[rbp], rax	# temperature, tmp204
# /home/jscha/dvp/cpumon/src/main.c:64:     *temperature = (sensor) {.min = 1000, .max = 0}; 
	.loc 1 64 18
	mov	rax, QWORD PTR -96[rbp]	# tmp205, temperature
	mov	QWORD PTR [rax], 0	# *temperature_138,
	mov	QWORD PTR 8[rax], 0	# *temperature_138,
	mov	DWORD PTR 16[rax], 0	# *temperature_138,
	mov	rax, QWORD PTR -96[rbp]	# tmp206, temperature
	movss	xmm0, DWORD PTR .LC0[rip]	# tmp207,
	movss	DWORD PTR 12[rax], xmm0	# temperature_138->min, tmp207
# /home/jscha/dvp/cpumon/src/main.c:65:     sensor *voltage = malloc( sizeof(sensor) + core_count * sizeof(voltage->per_core[0]) ); 
	.loc 1 65 46
	mov	eax, DWORD PTR core_count[rip]	# core_count.3_13, core_count
	cdqe
	add	rax, 5	# _15,
# /home/jscha/dvp/cpumon/src/main.c:65:     sensor *voltage = malloc( sizeof(sensor) + core_count * sizeof(voltage->per_core[0]) ); 
	.loc 1 65 23
	sal	rax, 2	# _16,
	mov	rdi, rax	#, _16
	call	malloc@PLT	#
	mov	QWORD PTR -88[rbp], rax	# voltage, tmp208
# /home/jscha/dvp/cpumon/src/main.c:66:     *voltage = (sensor) {.min = 1000, .max = 0}; 
	.loc 1 66 14
	mov	rax, QWORD PTR -88[rbp]	# tmp209, voltage
	mov	QWORD PTR [rax], 0	# *voltage_142,
	mov	QWORD PTR 8[rax], 0	# *voltage_142,
	mov	DWORD PTR 16[rax], 0	# *voltage_142,
	mov	rax, QWORD PTR -88[rbp]	# tmp210, voltage
	movss	xmm0, DWORD PTR .LC0[rip]	# tmp211,
	movss	DWORD PTR 12[rax], xmm0	# voltage_142->min, tmp211
# /home/jscha/dvp/cpumon/src/main.c:67:     battery *my_battery = malloc(sizeof(battery));
	.loc 1 67 27
	mov	edi, 40	#,
	call	malloc@PLT	#
	mov	QWORD PTR -80[rbp], rax	# my_battery, tmp212
# /home/jscha/dvp/cpumon/src/main.c:68:     *my_battery = (battery) {.min = 1000, .max = 0};
	.loc 1 68 17
	mov	rax, QWORD PTR -80[rbp]	# tmp213, my_battery
	mov	QWORD PTR [rax], 0	# *my_battery_146,
	mov	QWORD PTR 8[rax], 0	# *my_battery_146,
	mov	QWORD PTR 16[rax], 0	# *my_battery_146,
	mov	QWORD PTR 24[rax], 0	# *my_battery_146,
	mov	QWORD PTR 32[rax], 0	# *my_battery_146,
	mov	rax, QWORD PTR -80[rbp]	# tmp214, my_battery
	movss	xmm0, DWORD PTR .LC0[rip]	# tmp215,
	movss	DWORD PTR 12[rax], xmm0	# my_battery_146->min, tmp215
# /home/jscha/dvp/cpumon/src/main.c:71:     switch (cpu_designer)
	.loc 1 71 5
	mov	eax, DWORD PTR cpu_designer[rip]	# cpu_designer.4_17, cpu_designer
	test	eax, eax	# cpu_designer.4_17
	je	.L2	#,
	cmp	eax, 1	# cpu_designer.4_17,
	je	.L3	#,
	jmp	.L26	#
.L2:
# /home/jscha/dvp/cpumon/src/main.c:74:             my_power = malloc(sizeof(power)); 
	.loc 1 74 24
	mov	edi, 32	#,
	call	malloc@PLT	#
	mov	QWORD PTR -120[rbp], rax	# my_power, tmp216
# /home/jscha/dvp/cpumon/src/main.c:75:             break;
	.loc 1 75 13
	jmp	.L5	#
.L3:
# /home/jscha/dvp/cpumon/src/main.c:77:             my_power = malloc( sizeof(power) + core_count * sizeof(my_power->per_core[0]) );
	.loc 1 77 46
	mov	eax, DWORD PTR core_count[rip]	# core_count.5_18, core_count
	cdqe
	add	rax, 8	# _20,
# /home/jscha/dvp/cpumon/src/main.c:77:             my_power = malloc( sizeof(power) + core_count * sizeof(my_power->per_core[0]) );
	.loc 1 77 24
	sal	rax, 2	# _21,
	mov	rdi, rax	#, _21
	call	malloc@PLT	#
	mov	QWORD PTR -120[rbp], rax	# my_power, tmp217
# /home/jscha/dvp/cpumon/src/main.c:78:             break;
	.loc 1 78 13
	jmp	.L5	#
.L26:
# /home/jscha/dvp/cpumon/src/main.c:80:             my_power = malloc(sizeof(power)); 
	.loc 1 80 24
	mov	edi, 32	#,
	call	malloc@PLT	#
	mov	QWORD PTR -120[rbp], rax	# my_power, tmp218
# /home/jscha/dvp/cpumon/src/main.c:81:             break;
	.loc 1 81 13
	nop	
.L5:
# /home/jscha/dvp/cpumon/src/main.c:84:     long long *work_jiffies_before = malloc((core_count) * sizeof(*work_jiffies_before));                  // store for next interval
	.loc 1 84 38
	mov	eax, DWORD PTR core_count[rip]	# core_count.6_22, core_count
	cdqe
	sal	rax, 3	# _24,
	mov	rdi, rax	#, _24
	call	malloc@PLT	#
	mov	QWORD PTR -72[rbp], rax	# work_jiffies_before, tmp219
# /home/jscha/dvp/cpumon/src/main.c:85:     long long *total_jiffies_before = malloc((core_count) * sizeof(*total_jiffies_before));
	.loc 1 85 39
	mov	eax, DWORD PTR core_count[rip]	# core_count.7_25, core_count
	cdqe
	sal	rax, 3	# _27,
	mov	rdi, rax	#, _27
	call	malloc@PLT	#
	mov	QWORD PTR -64[rbp], rax	# total_jiffies_before, tmp220
# /home/jscha/dvp/cpumon/src/main.c:87:     char *cpu_model = identifiy_cpu();
	.loc 1 87 23
	call	identifiy_cpu@PLT	#
	mov	QWORD PTR -56[rbp], rax	# cpu_model, tmp221
# /home/jscha/dvp/cpumon/src/main.c:92:     while ((command =getopt(argc, argv, "c:hmps")) != -1){
	.loc 1 92 11
	jmp	.L6	#
.L11:
# /home/jscha/dvp/cpumon/src/main.c:93:         switch (command) {
	.loc 1 93 9
	cmp	DWORD PTR -124[rbp], 112	# command,
	je	.L7	#,
	cmp	DWORD PTR -124[rbp], 112	# command,
	jg	.L8	#,
	cmp	DWORD PTR -124[rbp], 97	# command,
	je	.L9	#,
	cmp	DWORD PTR -124[rbp], 104	# command,
	je	.L10	#,
	jmp	.L8	#
.L7:
# /home/jscha/dvp/cpumon/src/main.c:95:                 display_power_config_flag = 1; break;
	.loc 1 95 43
	mov	BYTE PTR display_power_config_flag[rip], 1	# display_power_config_flag,
# /home/jscha/dvp/cpumon/src/main.c:95:                 display_power_config_flag = 1; break;
	.loc 1 95 48
	jmp	.L6	#
.L9:
# /home/jscha/dvp/cpumon/src/main.c:97:                 display_moving_average_flag = 1; break;
	.loc 1 97 45
	mov	BYTE PTR display_moving_average_flag[rip], 1	# display_moving_average_flag,
# /home/jscha/dvp/cpumon/src/main.c:97:                 display_moving_average_flag = 1; break;
	.loc 1 97 50
	jmp	.L6	#
.L10:
# /home/jscha/dvp/cpumon/src/main.c:100:                 printf("\t-p    : displays performance and power configurations\n");
	.loc 1 100 17
	lea	rax, .LC1[rip]	# tmp222,
	mov	rdi, rax	#, tmp222
	call	puts@PLT	#
# /home/jscha/dvp/cpumon/src/main.c:101: 			    printf("\t-h    : displays this help\n");
	.loc 1 101 8
	lea	rax, .LC2[rip]	# tmp223,
	mov	rdi, rax	#, tmp223
	call	puts@PLT	#
# /home/jscha/dvp/cpumon/src/main.c:102: 			    exit(EXIT_SUCCESS);
	.loc 1 102 8
	mov	edi, 0	#,
	call	exit@PLT	#
.L8:
# /home/jscha/dvp/cpumon/src/main.c:104: 			    fprintf(stderr,"Unknown option %c\n",command); exit(EXIT_FAILURE);
	.loc 1 104 8
	mov	rax, QWORD PTR stderr[rip]	# stderr.8_28, stderr
	mov	edx, DWORD PTR -124[rbp]	# tmp224, command
	lea	rcx, .LC3[rip]	# tmp225,
	mov	rsi, rcx	#, tmp225
	mov	rdi, rax	#, stderr.8_28
	mov	eax, 0	#,
	call	fprintf@PLT	#
# /home/jscha/dvp/cpumon/src/main.c:104: 			    fprintf(stderr,"Unknown option %c\n",command); exit(EXIT_FAILURE);
	.loc 1 104 54
	mov	edi, 1	#,
	call	exit@PLT	#
.L6:
# /home/jscha/dvp/cpumon/src/main.c:92:     while ((command =getopt(argc, argv, "c:hmps")) != -1){
	.loc 1 92 22
	mov	rcx, QWORD PTR -160[rbp]	# tmp226, argv
	mov	eax, DWORD PTR -148[rbp]	# tmp227, argc
	lea	rdx, .LC4[rip]	# tmp228,
	mov	rsi, rcx	#, tmp226
	mov	edi, eax	#, tmp227
	call	getopt@PLT	#
	mov	DWORD PTR -124[rbp], eax	# command, tmp229
# /home/jscha/dvp/cpumon/src/main.c:92:     while ((command =getopt(argc, argv, "c:hmps")) != -1){
	.loc 1 92 52
	cmp	DWORD PTR -124[rbp], -1	# command,
	jne	.L11	#,
# /home/jscha/dvp/cpumon/src/main.c:108:     init_gui();
	.loc 1 108 5
	call	init_gui@PLT	#
.L24:
# /home/jscha/dvp/cpumon/src/main.c:113:         command = kbhit();
	.loc 1 113 19
	call	kbhit@PLT	#
	mov	DWORD PTR -124[rbp], eax	# command, tmp230
# /home/jscha/dvp/cpumon/src/main.c:114:         switch (command) {
	.loc 1 114 9
	cmp	DWORD PTR -124[rbp], 112	# command,
	jne	.L12	#,
# /home/jscha/dvp/cpumon/src/main.c:116:                 display_power_config_flag = display_power_config_flag ^ 1; break;
	.loc 1 116 71
	movzx	eax, BYTE PTR display_power_config_flag[rip]	# display_power_config_flag.9_29, display_power_config_flag
	xor	eax, 1	# _30,
	movzx	eax, al	# _31, _30
	test	eax, eax	# _31
	setne	al	#, _32
# /home/jscha/dvp/cpumon/src/main.c:116:                 display_power_config_flag = display_power_config_flag ^ 1; break;
	.loc 1 116 43
	mov	BYTE PTR display_power_config_flag[rip], al	# display_power_config_flag, _32
# /home/jscha/dvp/cpumon/src/main.c:116:                 display_power_config_flag = display_power_config_flag ^ 1; break;
	.loc 1 116 76
	jmp	.L13	#
.L12:
# /home/jscha/dvp/cpumon/src/main.c:118:                 sleep(POLL_INTERVAL_S);
	.loc 1 118 17
	mov	edi, 1	#,
	call	sleep@PLT	#
.L13:
# /home/jscha/dvp/cpumon/src/main.c:121:         update_sensor_data(freq, load, temperature, voltage, power_per_domain, my_power, my_battery);
	.loc 1 121 9
	mov	r8, QWORD PTR -120[rbp]	# tmp231, my_power
	lea	rdi, -48[rbp]	# tmp232,
	mov	rcx, QWORD PTR -88[rbp]	# tmp233, voltage
	mov	rdx, QWORD PTR -96[rbp]	# tmp234, temperature
	mov	rsi, QWORD PTR -104[rbp]	# tmp235, load
	mov	rax, QWORD PTR -112[rbp]	# tmp236, freq
	sub	rsp, 8	#,
	push	QWORD PTR -80[rbp]	# my_battery
	mov	r9, r8	#, tmp231
	mov	r8, rdi	#, tmp232
	mov	rdi, rax	#, tmp236
	call	update_sensor_data@PLT	#
	add	rsp, 16	#,
# /home/jscha/dvp/cpumon/src/main.c:123:         cpucore_load(load->per_core, &load->cpu_avg, work_jiffies_before, total_jiffies_before, core_count);
	.loc 1 123 9
	mov	esi, DWORD PTR core_count[rip]	# core_count.10_33, core_count
	mov	rax, QWORD PTR -104[rbp]	# _34, load
# /home/jscha/dvp/cpumon/src/main.c:123:         cpucore_load(load->per_core, &load->cpu_avg, work_jiffies_before, total_jiffies_before, core_count);
	.loc 1 123 26
	mov	rdx, QWORD PTR -104[rbp]	# tmp237, load
	lea	rdi, 20[rdx]	# _35,
# /home/jscha/dvp/cpumon/src/main.c:123:         cpucore_load(load->per_core, &load->cpu_avg, work_jiffies_before, total_jiffies_before, core_count);
	.loc 1 123 9
	mov	rcx, QWORD PTR -64[rbp]	# tmp238, total_jiffies_before
	mov	rdx, QWORD PTR -72[rbp]	# tmp239, work_jiffies_before
	mov	r8d, esi	#, core_count.10_33
	mov	rsi, rax	#, _34
	call	cpucore_load@PLT	#
# /home/jscha/dvp/cpumon/src/main.c:124:         load->runtime_avg = runtime_avg(poll_cycle_counter, &load->cumulative, &load->cpu_avg);
	.loc 1 124 29
	mov	rdx, QWORD PTR -104[rbp]	# _36, load
	mov	rax, QWORD PTR -104[rbp]	# tmp240, load
	lea	rcx, 8[rax]	# _37,
	mov	rax, QWORD PTR poll_cycle_counter[rip]	# poll_cycle_counter.11_38, poll_cycle_counter
	mov	rsi, rcx	#, _37
	mov	rdi, rax	#, poll_cycle_counter.11_38
	call	runtime_avg@PLT	#
	movd	eax, xmm0	# _39,
# /home/jscha/dvp/cpumon/src/main.c:124:         load->runtime_avg = runtime_avg(poll_cycle_counter, &load->cumulative, &load->cpu_avg);
	.loc 1 124 27
	mov	rdx, QWORD PTR -104[rbp]	# tmp241, load
	mov	DWORD PTR 4[rdx], eax	# load_134->runtime_avg, _39
# /home/jscha/dvp/cpumon/src/main.c:125:         load_his[period_counter] = load->cpu_avg;
	.loc 1 125 17
	mov	rdx, QWORD PTR period_counter[rip]	# period_counter.12_40, period_counter
# /home/jscha/dvp/cpumon/src/main.c:125:         load_his[period_counter] = load->cpu_avg;
	.loc 1 125 40
	mov	rax, QWORD PTR -104[rbp]	# tmp242, load
	movss	xmm0, DWORD PTR [rax]	# _41, load_134->cpu_avg
# /home/jscha/dvp/cpumon/src/main.c:125:         load_his[period_counter] = load->cpu_avg;
	.loc 1 125 34
	sal	rdx, 2	# tmp243,
	lea	rax, load_his[rip]	# tmp244,
	movss	DWORD PTR [rdx+rax], xmm0	# load_his[period_counter.12_40], _41
# /home/jscha/dvp/cpumon/src/main.c:129:         if (period_counter < AVG_WINDOW/POLL_INTERVAL_S)    // for last minute history
	.loc 1 129 28
	mov	rax, QWORD PTR period_counter[rip]	# period_counter.13_42, period_counter
# /home/jscha/dvp/cpumon/src/main.c:129:         if (period_counter < AVG_WINDOW/POLL_INTERVAL_S)    // for last minute history
	.loc 1 129 12
	cmp	rax, 59	# period_counter.13_42,
	jg	.L14	#,
# /home/jscha/dvp/cpumon/src/main.c:131:             period_counter++;
	.loc 1 131 27
	mov	rax, QWORD PTR period_counter[rip]	# period_counter.14_43, period_counter
	add	rax, 1	# _44,
	mov	QWORD PTR period_counter[rip], rax	# period_counter, _44
	jmp	.L15	#
.L14:
# /home/jscha/dvp/cpumon/src/main.c:133:             period_counter = 0;                    // reset index
	.loc 1 133 28
	mov	QWORD PTR period_counter[rip], 0	# period_counter,
.L15:
# /home/jscha/dvp/cpumon/src/main.c:135:         poll_cycle_counter += 1;
	.loc 1 135 28
	mov	rax, QWORD PTR poll_cycle_counter[rip]	# poll_cycle_counter.15_45, poll_cycle_counter
	add	rax, 1	# _46,
	mov	QWORD PTR poll_cycle_counter[rip], rax	# poll_cycle_counter, _46
# /home/jscha/dvp/cpumon/src/main.c:141:         clear();
	.loc 1 141 8
	mov	rax, QWORD PTR stdscr[rip]	# stdscr.16_47, stdscr
	mov	rdi, rax	#, stdscr.16_47
	call	wclear@PLT	#
# /home/jscha/dvp/cpumon/src/main.c:143:         attron(A_BOLD);
	.loc 1 143 8
	mov	rax, QWORD PTR stdscr[rip]	# stdscr.17_48, stdscr
	mov	edx, 0	#,
	mov	esi, 2097152	#,
	mov	rdi, rax	#, stdscr.17_48
	call	wattr_on@PLT	#
# /home/jscha/dvp/cpumon/src/main.c:144:         printw("\n\t\t%s\n\n", cpu_model);
	.loc 1 144 9
	mov	rax, QWORD PTR -56[rbp]	# tmp245, cpu_model
	mov	rsi, rax	#, tmp245
	lea	rax, .LC5[rip]	# tmp246,
	mov	rdi, rax	#, tmp246
	mov	eax, 0	#,
	call	printw@PLT	#
# /home/jscha/dvp/cpumon/src/main.c:145:         attroff(A_BOLD);
	.loc 1 145 8
	mov	rax, QWORD PTR stdscr[rip]	# stdscr.18_49, stdscr
	mov	edx, 0	#,
	mov	esi, 2097152	#,
	mov	rdi, rax	#, stdscr.18_49
	call	wattr_off@PLT	#
# /home/jscha/dvp/cpumon/src/main.c:147:         if (running_with_privileges == TRUE)
	.loc 1 147 37
	movzx	eax, BYTE PTR running_with_privileges[rip]	# running_with_privileges.19_50, running_with_privileges
# /home/jscha/dvp/cpumon/src/main.c:147:         if (running_with_privileges == TRUE)
	.loc 1 147 12
	test	al, al	# running_with_privileges.19_50
	je	.L16	#,
# /home/jscha/dvp/cpumon/src/main.c:149:             printw("       f/GHz \tC0%%   Temp/°C\tU/V\n");
	.loc 1 149 13
	lea	rax, .LC6[rip]	# tmp247,
	mov	rdi, rax	#, tmp247
	mov	eax, 0	#,
	call	printw@PLT	#
# /home/jscha/dvp/cpumon/src/main.c:150:             printw("-------------------------------------\n");
	.loc 1 150 13
	lea	rax, .LC7[rip]	# tmp248,
	mov	rdi, rax	#, tmp248
	mov	eax, 0	#,
	call	printw@PLT	#
.LBB2:
# /home/jscha/dvp/cpumon/src/main.c:151:             for (int core = 0; core < core_count; core++)
	.loc 1 151 22
	mov	DWORD PTR -132[rbp], 0	# core,
# /home/jscha/dvp/cpumon/src/main.c:151:             for (int core = 0; core < core_count; core++)
	.loc 1 151 13
	jmp	.L17	#
.L18:
# /home/jscha/dvp/cpumon/src/main.c:153:                 printw("Core %d \t%.1f\t%.f\t%.f\t%.2f\n", core, freq->per_core[core], load->per_core[core], temperature->per_core[core], voltage->per_core[core]);
	.loc 1 153 156 discriminator 3
	mov	rax, QWORD PTR -88[rbp]	# tmp249, voltage
	mov	edx, DWORD PTR -132[rbp]	# tmp251, core
	movsx	rdx, edx	# tmp250, tmp251
	add	rdx, 4	# tmp252,
	movss	xmm0, DWORD PTR 4[rax+rdx*4]	# _51, voltage_142->per_core[core_115]
# /home/jscha/dvp/cpumon/src/main.c:153:                 printw("Core %d \t%.1f\t%.f\t%.f\t%.2f\n", core, freq->per_core[core], load->per_core[core], temperature->per_core[core], voltage->per_core[core]);
	.loc 1 153 17 discriminator 3
	pxor	xmm2, xmm2	# _52
	cvtss2sd	xmm2, xmm0	# _52, _51
# /home/jscha/dvp/cpumon/src/main.c:153:                 printw("Core %d \t%.1f\t%.f\t%.f\t%.2f\n", core, freq->per_core[core], load->per_core[core], temperature->per_core[core], voltage->per_core[core]);
	.loc 1 153 131 discriminator 3
	mov	rax, QWORD PTR -96[rbp]	# tmp253, temperature
	mov	edx, DWORD PTR -132[rbp]	# tmp255, core
	movsx	rdx, edx	# tmp254, tmp255
	add	rdx, 4	# tmp256,
	movss	xmm0, DWORD PTR 4[rax+rdx*4]	# _53, temperature_138->per_core[core_115]
# /home/jscha/dvp/cpumon/src/main.c:153:                 printw("Core %d \t%.1f\t%.f\t%.f\t%.2f\n", core, freq->per_core[core], load->per_core[core], temperature->per_core[core], voltage->per_core[core]);
	.loc 1 153 17 discriminator 3
	pxor	xmm1, xmm1	# _54
	cvtss2sd	xmm1, xmm0	# _54, _53
# /home/jscha/dvp/cpumon/src/main.c:153:                 printw("Core %d \t%.1f\t%.f\t%.f\t%.2f\n", core, freq->per_core[core], load->per_core[core], temperature->per_core[core], voltage->per_core[core]);
	.loc 1 153 102 discriminator 3
	mov	rax, QWORD PTR -104[rbp]	# tmp257, load
	mov	edx, DWORD PTR -132[rbp]	# tmp259, core
	movsx	rdx, edx	# tmp258, tmp259
	add	rdx, 4	# tmp260,
	movss	xmm0, DWORD PTR 4[rax+rdx*4]	# _55, load_134->per_core[core_115]
# /home/jscha/dvp/cpumon/src/main.c:153:                 printw("Core %d \t%.1f\t%.f\t%.f\t%.2f\n", core, freq->per_core[core], load->per_core[core], temperature->per_core[core], voltage->per_core[core]);
	.loc 1 153 17 discriminator 3
	cvtss2sd	xmm0, xmm0	# _56, _55
# /home/jscha/dvp/cpumon/src/main.c:153:                 printw("Core %d \t%.1f\t%.f\t%.f\t%.2f\n", core, freq->per_core[core], load->per_core[core], temperature->per_core[core], voltage->per_core[core]);
	.loc 1 153 80 discriminator 3
	mov	rax, QWORD PTR -112[rbp]	# tmp261, freq
	mov	edx, DWORD PTR -132[rbp]	# tmp263, core
	movsx	rdx, edx	# tmp262, tmp263
	add	rdx, 4	# tmp264,
	movss	xmm3, DWORD PTR 4[rax+rdx*4]	# _57, freq_130->per_core[core_115]
# /home/jscha/dvp/cpumon/src/main.c:153:                 printw("Core %d \t%.1f\t%.f\t%.f\t%.2f\n", core, freq->per_core[core], load->per_core[core], temperature->per_core[core], voltage->per_core[core]);
	.loc 1 153 17 discriminator 3
	pxor	xmm4, xmm4	# _58
	cvtss2sd	xmm4, xmm3	# _58, _57
	movq	rdx, xmm4	# _58, _58
	mov	eax, DWORD PTR -132[rbp]	# tmp265, core
	movapd	xmm3, xmm2	#, _52
	movapd	xmm2, xmm1	#, _54
	movapd	xmm1, xmm0	#, _56
	movq	xmm0, rdx	#, _58
	mov	esi, eax	#, tmp265
	lea	rax, .LC8[rip]	# tmp266,
	mov	rdi, rax	#, tmp266
	mov	eax, 4	#,
	call	printw@PLT	#
# /home/jscha/dvp/cpumon/src/main.c:151:             for (int core = 0; core < core_count; core++)
	.loc 1 151 55 discriminator 3
	add	DWORD PTR -132[rbp], 1	# core,
.L17:
# /home/jscha/dvp/cpumon/src/main.c:151:             for (int core = 0; core < core_count; core++)
	.loc 1 151 37 discriminator 1
	mov	eax, DWORD PTR core_count[rip]	# core_count.20_59, core_count
	cmp	DWORD PTR -132[rbp], eax	# core, core_count.20_59
	jl	.L18	#,
.LBE2:
# /home/jscha/dvp/cpumon/src/main.c:155:             printw("\n");
	.loc 1 155 13
	lea	rax, .LC9[rip]	# tmp267,
	mov	rdi, rax	#, tmp267
	mov	eax, 0	#,
	call	printw@PLT	#
# /home/jscha/dvp/cpumon/src/main.c:157:             printw("avg\t%.2f\t%.2f\t%.1f\t%.2f\n", freq->runtime_avg, load->runtime_avg, temperature->runtime_avg, voltage->runtime_avg);
	.loc 1 157 124
	mov	rax, QWORD PTR -88[rbp]	# tmp268, voltage
	movss	xmm0, DWORD PTR 4[rax]	# _60, voltage_142->runtime_avg
# /home/jscha/dvp/cpumon/src/main.c:157:             printw("avg\t%.2f\t%.2f\t%.1f\t%.2f\n", freq->runtime_avg, load->runtime_avg, temperature->runtime_avg, voltage->runtime_avg);
	.loc 1 157 13
	pxor	xmm2, xmm2	# _61
	cvtss2sd	xmm2, xmm0	# _61, _60
# /home/jscha/dvp/cpumon/src/main.c:157:             printw("avg\t%.2f\t%.2f\t%.1f\t%.2f\n", freq->runtime_avg, load->runtime_avg, temperature->runtime_avg, voltage->runtime_avg);
	.loc 1 157 102
	mov	rax, QWORD PTR -96[rbp]	# tmp269, temperature
	movss	xmm0, DWORD PTR 4[rax]	# _62, temperature_138->runtime_avg
# /home/jscha/dvp/cpumon/src/main.c:157:             printw("avg\t%.2f\t%.2f\t%.1f\t%.2f\n", freq->runtime_avg, load->runtime_avg, temperature->runtime_avg, voltage->runtime_avg);
	.loc 1 157 13
	pxor	xmm1, xmm1	# _63
	cvtss2sd	xmm1, xmm0	# _63, _62
# /home/jscha/dvp/cpumon/src/main.c:157:             printw("avg\t%.2f\t%.2f\t%.1f\t%.2f\n", freq->runtime_avg, load->runtime_avg, temperature->runtime_avg, voltage->runtime_avg);
	.loc 1 157 76
	mov	rax, QWORD PTR -104[rbp]	# tmp270, load
	movss	xmm0, DWORD PTR 4[rax]	# _64, load_134->runtime_avg
# /home/jscha/dvp/cpumon/src/main.c:157:             printw("avg\t%.2f\t%.2f\t%.1f\t%.2f\n", freq->runtime_avg, load->runtime_avg, temperature->runtime_avg, voltage->runtime_avg);
	.loc 1 157 13
	cvtss2sd	xmm0, xmm0	# _65, _64
# /home/jscha/dvp/cpumon/src/main.c:157:             printw("avg\t%.2f\t%.2f\t%.1f\t%.2f\n", freq->runtime_avg, load->runtime_avg, temperature->runtime_avg, voltage->runtime_avg);
	.loc 1 157 57
	mov	rax, QWORD PTR -112[rbp]	# tmp271, freq
	movss	xmm3, DWORD PTR 4[rax]	# _66, freq_130->runtime_avg
# /home/jscha/dvp/cpumon/src/main.c:157:             printw("avg\t%.2f\t%.2f\t%.1f\t%.2f\n", freq->runtime_avg, load->runtime_avg, temperature->runtime_avg, voltage->runtime_avg);
	.loc 1 157 13
	pxor	xmm5, xmm5	# _67
	cvtss2sd	xmm5, xmm3	# _67, _66
	movq	rax, xmm5	# _67, _67
	movapd	xmm3, xmm2	#, _61
	movapd	xmm2, xmm1	#, _63
	movapd	xmm1, xmm0	#, _65
	movq	xmm0, rax	#, _67
	lea	rax, .LC10[rip]	# tmp272,
	mov	rdi, rax	#, tmp272
	mov	eax, 4	#,
	call	printw@PLT	#
# /home/jscha/dvp/cpumon/src/main.c:158:             printw("min\t%.2f\t%.2f\t%.0f\t%.2f\n", freq->min, load->min, temperature->min, voltage->min);
	.loc 1 158 100
	mov	rax, QWORD PTR -88[rbp]	# tmp273, voltage
	movss	xmm0, DWORD PTR 12[rax]	# _68, voltage_142->min
# /home/jscha/dvp/cpumon/src/main.c:158:             printw("min\t%.2f\t%.2f\t%.0f\t%.2f\n", freq->min, load->min, temperature->min, voltage->min);
	.loc 1 158 13
	pxor	xmm2, xmm2	# _69
	cvtss2sd	xmm2, xmm0	# _69, _68
# /home/jscha/dvp/cpumon/src/main.c:158:             printw("min\t%.2f\t%.2f\t%.0f\t%.2f\n", freq->min, load->min, temperature->min, voltage->min);
	.loc 1 158 86
	mov	rax, QWORD PTR -96[rbp]	# tmp274, temperature
	movss	xmm0, DWORD PTR 12[rax]	# _70, temperature_138->min
# /home/jscha/dvp/cpumon/src/main.c:158:             printw("min\t%.2f\t%.2f\t%.0f\t%.2f\n", freq->min, load->min, temperature->min, voltage->min);
	.loc 1 158 13
	pxor	xmm1, xmm1	# _71
	cvtss2sd	xmm1, xmm0	# _71, _70
# /home/jscha/dvp/cpumon/src/main.c:158:             printw("min\t%.2f\t%.2f\t%.0f\t%.2f\n", freq->min, load->min, temperature->min, voltage->min);
	.loc 1 158 68
	mov	rax, QWORD PTR -104[rbp]	# tmp275, load
	movss	xmm0, DWORD PTR 12[rax]	# _72, load_134->min
# /home/jscha/dvp/cpumon/src/main.c:158:             printw("min\t%.2f\t%.2f\t%.0f\t%.2f\n", freq->min, load->min, temperature->min, voltage->min);
	.loc 1 158 13
	cvtss2sd	xmm0, xmm0	# _73, _72
# /home/jscha/dvp/cpumon/src/main.c:158:             printw("min\t%.2f\t%.2f\t%.0f\t%.2f\n", freq->min, load->min, temperature->min, voltage->min);
	.loc 1 158 57
	mov	rax, QWORD PTR -112[rbp]	# tmp276, freq
	movss	xmm3, DWORD PTR 12[rax]	# _74, freq_130->min
# /home/jscha/dvp/cpumon/src/main.c:158:             printw("min\t%.2f\t%.2f\t%.0f\t%.2f\n", freq->min, load->min, temperature->min, voltage->min);
	.loc 1 158 13
	pxor	xmm6, xmm6	# _75
	cvtss2sd	xmm6, xmm3	# _75, _74
	movq	rax, xmm6	# _75, _75
	movapd	xmm3, xmm2	#, _69
	movapd	xmm2, xmm1	#, _71
	movapd	xmm1, xmm0	#, _73
	movq	xmm0, rax	#, _75
	lea	rax, .LC11[rip]	# tmp277,
	mov	rdi, rax	#, tmp277
	mov	eax, 4	#,
	call	printw@PLT	#
# /home/jscha/dvp/cpumon/src/main.c:159:             printw("max\t%.2f\t%.2f\t%.0f\t%.2f\n", freq->max, load->max, temperature->max, voltage->max);
	.loc 1 159 100
	mov	rax, QWORD PTR -88[rbp]	# tmp278, voltage
	movss	xmm0, DWORD PTR 16[rax]	# _76, voltage_142->max
# /home/jscha/dvp/cpumon/src/main.c:159:             printw("max\t%.2f\t%.2f\t%.0f\t%.2f\n", freq->max, load->max, temperature->max, voltage->max);
	.loc 1 159 13
	pxor	xmm2, xmm2	# _77
	cvtss2sd	xmm2, xmm0	# _77, _76
# /home/jscha/dvp/cpumon/src/main.c:159:             printw("max\t%.2f\t%.2f\t%.0f\t%.2f\n", freq->max, load->max, temperature->max, voltage->max);
	.loc 1 159 86
	mov	rax, QWORD PTR -96[rbp]	# tmp279, temperature
	movss	xmm0, DWORD PTR 16[rax]	# _78, temperature_138->max
# /home/jscha/dvp/cpumon/src/main.c:159:             printw("max\t%.2f\t%.2f\t%.0f\t%.2f\n", freq->max, load->max, temperature->max, voltage->max);
	.loc 1 159 13
	pxor	xmm1, xmm1	# _79
	cvtss2sd	xmm1, xmm0	# _79, _78
# /home/jscha/dvp/cpumon/src/main.c:159:             printw("max\t%.2f\t%.2f\t%.0f\t%.2f\n", freq->max, load->max, temperature->max, voltage->max);
	.loc 1 159 68
	mov	rax, QWORD PTR -104[rbp]	# tmp280, load
	movss	xmm0, DWORD PTR 16[rax]	# _80, load_134->max
# /home/jscha/dvp/cpumon/src/main.c:159:             printw("max\t%.2f\t%.2f\t%.0f\t%.2f\n", freq->max, load->max, temperature->max, voltage->max);
	.loc 1 159 13
	cvtss2sd	xmm0, xmm0	# _81, _80
# /home/jscha/dvp/cpumon/src/main.c:159:             printw("max\t%.2f\t%.2f\t%.0f\t%.2f\n", freq->max, load->max, temperature->max, voltage->max);
	.loc 1 159 57
	mov	rax, QWORD PTR -112[rbp]	# tmp281, freq
	movss	xmm3, DWORD PTR 16[rax]	# _82, freq_130->max
# /home/jscha/dvp/cpumon/src/main.c:159:             printw("max\t%.2f\t%.2f\t%.0f\t%.2f\n", freq->max, load->max, temperature->max, voltage->max);
	.loc 1 159 13
	pxor	xmm7, xmm7	# _83
	cvtss2sd	xmm7, xmm3	# _83, _82
	movq	rax, xmm7	# _83, _83
	movapd	xmm3, xmm2	#, _77
	movapd	xmm2, xmm1	#, _79
	movapd	xmm1, xmm0	#, _81
	movq	xmm0, rax	#, _83
	lea	rax, .LC12[rip]	# tmp282,
	mov	rdi, rax	#, tmp282
	mov	eax, 4	#,
	call	printw@PLT	#
# /home/jscha/dvp/cpumon/src/main.c:160:             if (display_moving_average_flag == TRUE)
	.loc 1 160 45
	movzx	eax, BYTE PTR display_moving_average_flag[rip]	# display_moving_average_flag.21_84, display_moving_average_flag
# /home/jscha/dvp/cpumon/src/main.c:160:             if (display_moving_average_flag == TRUE)
	.loc 1 160 16
	test	al, al	# display_moving_average_flag.21_84
	je	.L19	#,
# /home/jscha/dvp/cpumon/src/main.c:162:                 moving_average(period_counter, freq_his, load_his, temp_his, voltage_his, power_his);   
	.loc 1 162 17
	mov	rax, QWORD PTR period_counter[rip]	# period_counter.22_85, period_counter
	mov	edi, eax	# _86, period_counter.22_85
	lea	r9, power_his[rip]	#,
	lea	r8, voltage_his[rip]	#,
	lea	rax, temp_his[rip]	# tmp283,
	mov	rcx, rax	#, tmp283
	lea	rax, load_his[rip]	# tmp284,
	mov	rdx, rax	#, tmp284
	lea	rax, freq_his[rip]	# tmp285,
	mov	rsi, rax	#, tmp285
	call	moving_average@PLT	#
.L19:
# /home/jscha/dvp/cpumon/src/main.c:164:             printw("\n");
	.loc 1 164 13
	lea	rax, .LC9[rip]	# tmp286,
	mov	rdi, rax	#, tmp286
	mov	eax, 0	#,
	call	printw@PLT	#
# /home/jscha/dvp/cpumon/src/main.c:165:             draw_power(power_per_domain, my_power->pkg_runtime_avg);
	.loc 1 165 13
	mov	rax, QWORD PTR -120[rbp]	# tmp287, my_power
	mov	edx, DWORD PTR 16[rax]	# _87, my_power_114->pkg_runtime_avg
	lea	rax, -48[rbp]	# tmp288,
	movd	xmm0, edx	#, _87
	mov	rdi, rax	#, tmp288
	call	draw_power@PLT	#
# /home/jscha/dvp/cpumon/src/main.c:166:             printw("\n");
	.loc 1 166 13
	lea	rax, .LC9[rip]	# tmp289,
	mov	rdi, rax	#, tmp289
	mov	eax, 0	#,
	call	printw@PLT	#
# /home/jscha/dvp/cpumon/src/main.c:168:             printw("\n");
	.loc 1 168 13
	lea	rax, .LC9[rip]	# tmp290,
	mov	rdi, rax	#, tmp290
	mov	eax, 0	#,
	call	printw@PLT	#
	jmp	.L20	#
.L16:
# /home/jscha/dvp/cpumon/src/main.c:176:             printw("To monitor all metrics, pls run as root.\n\n");
	.loc 1 176 13
	lea	rax, .LC13[rip]	# tmp291,
	mov	rdi, rax	#, tmp291
	mov	eax, 0	#,
	call	printw@PLT	#
# /home/jscha/dvp/cpumon/src/main.c:178:             printw("\t\tf/GHz \tC0%% \n");
	.loc 1 178 13
	lea	rax, .LC14[rip]	# tmp292,
	mov	rdi, rax	#, tmp292
	mov	eax, 0	#,
	call	printw@PLT	#
.LBB3:
# /home/jscha/dvp/cpumon/src/main.c:179:             for (int i = 0; i < core_count; i++){   
	.loc 1 179 22
	mov	DWORD PTR -128[rbp], 0	# i,
# /home/jscha/dvp/cpumon/src/main.c:179:             for (int i = 0; i < core_count; i++){   
	.loc 1 179 13
	jmp	.L21	#
.L22:
# /home/jscha/dvp/cpumon/src/main.c:180:                 printw("Core \t%d \t%.1f\t%.f\n", i, freq->per_core[i], load->per_core[i]);
	.loc 1 180 87 discriminator 3
	mov	rax, QWORD PTR -104[rbp]	# tmp293, load
	mov	edx, DWORD PTR -128[rbp]	# tmp295, i
	movsx	rdx, edx	# tmp294, tmp295
	add	rdx, 4	# tmp296,
	movss	xmm0, DWORD PTR 4[rax+rdx*4]	# _88, load_134->per_core[i_116]
# /home/jscha/dvp/cpumon/src/main.c:180:                 printw("Core \t%d \t%.1f\t%.f\n", i, freq->per_core[i], load->per_core[i]);
	.loc 1 180 17 discriminator 3
	cvtss2sd	xmm0, xmm0	# _89, _88
# /home/jscha/dvp/cpumon/src/main.c:180:                 printw("Core \t%d \t%.1f\t%.f\n", i, freq->per_core[i], load->per_core[i]);
	.loc 1 180 68 discriminator 3
	mov	rax, QWORD PTR -112[rbp]	# tmp297, freq
	mov	edx, DWORD PTR -128[rbp]	# tmp299, i
	movsx	rdx, edx	# tmp298, tmp299
	add	rdx, 4	# tmp300,
	movss	xmm1, DWORD PTR 4[rax+rdx*4]	# _90, freq_130->per_core[i_116]
# /home/jscha/dvp/cpumon/src/main.c:180:                 printw("Core \t%d \t%.1f\t%.f\n", i, freq->per_core[i], load->per_core[i]);
	.loc 1 180 17 discriminator 3
	pxor	xmm4, xmm4	# _91
	cvtss2sd	xmm4, xmm1	# _91, _90
	movq	rdx, xmm4	# _91, _91
	mov	eax, DWORD PTR -128[rbp]	# tmp301, i
	movapd	xmm1, xmm0	#, _89
	movq	xmm0, rdx	#, _91
	mov	esi, eax	#, tmp301
	lea	rax, .LC15[rip]	# tmp302,
	mov	rdi, rax	#, tmp302
	mov	eax, 2	#,
	call	printw@PLT	#
# /home/jscha/dvp/cpumon/src/main.c:179:             for (int i = 0; i < core_count; i++){   
	.loc 1 179 46 discriminator 3
	add	DWORD PTR -128[rbp], 1	# i,
.L21:
# /home/jscha/dvp/cpumon/src/main.c:179:             for (int i = 0; i < core_count; i++){   
	.loc 1 179 31 discriminator 1
	mov	eax, DWORD PTR core_count[rip]	# core_count.23_92, core_count
	cmp	DWORD PTR -128[rbp], eax	# i, core_count.23_92
	jl	.L22	#,
.LBE3:
# /home/jscha/dvp/cpumon/src/main.c:182:             printw("\n");
	.loc 1 182 13
	lea	rax, .LC9[rip]	# tmp303,
	mov	rdi, rax	#, tmp303
	mov	eax, 0	#,
	call	printw@PLT	#
# /home/jscha/dvp/cpumon/src/main.c:183:             printw("avg\t\t%.2f\t%.2f\n", freq->runtime_avg, load->runtime_avg);
	.loc 1 183 66
	mov	rax, QWORD PTR -104[rbp]	# tmp304, load
	movss	xmm0, DWORD PTR 4[rax]	# _93, load_134->runtime_avg
# /home/jscha/dvp/cpumon/src/main.c:183:             printw("avg\t\t%.2f\t%.2f\n", freq->runtime_avg, load->runtime_avg);
	.loc 1 183 13
	cvtss2sd	xmm0, xmm0	# _94, _93
# /home/jscha/dvp/cpumon/src/main.c:183:             printw("avg\t\t%.2f\t%.2f\n", freq->runtime_avg, load->runtime_avg);
	.loc 1 183 47
	mov	rax, QWORD PTR -112[rbp]	# tmp305, freq
	movss	xmm1, DWORD PTR 4[rax]	# _95, freq_130->runtime_avg
# /home/jscha/dvp/cpumon/src/main.c:183:             printw("avg\t\t%.2f\t%.2f\n", freq->runtime_avg, load->runtime_avg);
	.loc 1 183 13
	pxor	xmm5, xmm5	# _96
	cvtss2sd	xmm5, xmm1	# _96, _95
	movq	rax, xmm5	# _96, _96
	movapd	xmm1, xmm0	#, _94
	movq	xmm0, rax	#, _96
	lea	rax, .LC16[rip]	# tmp306,
	mov	rdi, rax	#, tmp306
	mov	eax, 2	#,
	call	printw@PLT	#
# /home/jscha/dvp/cpumon/src/main.c:184:             printw("min\t\t%.2f\t\n", freq->min);
	.loc 1 184 43
	mov	rax, QWORD PTR -112[rbp]	# tmp307, freq
	movss	xmm0, DWORD PTR 12[rax]	# _97, freq_130->min
# /home/jscha/dvp/cpumon/src/main.c:184:             printw("min\t\t%.2f\t\n", freq->min);
	.loc 1 184 13
	pxor	xmm6, xmm6	# _98
	cvtss2sd	xmm6, xmm0	# _98, _97
	movq	rax, xmm6	# _98, _98
	movq	xmm0, rax	#, _98
	lea	rax, .LC17[rip]	# tmp308,
	mov	rdi, rax	#, tmp308
	mov	eax, 1	#,
	call	printw@PLT	#
# /home/jscha/dvp/cpumon/src/main.c:185:             printw("max\t\t%.2f\t\n", freq->max);
	.loc 1 185 43
	mov	rax, QWORD PTR -112[rbp]	# tmp309, freq
	movss	xmm0, DWORD PTR 16[rax]	# _99, freq_130->max
# /home/jscha/dvp/cpumon/src/main.c:185:             printw("max\t\t%.2f\t\n", freq->max);
	.loc 1 185 13
	pxor	xmm7, xmm7	# _100
	cvtss2sd	xmm7, xmm0	# _100, _99
	movq	rax, xmm7	# _100, _100
	movq	xmm0, rax	#, _100
	lea	rax, .LC18[rip]	# tmp310,
	mov	rdi, rax	#, tmp310
	mov	eax, 1	#,
	call	printw@PLT	#
.L20:
# /home/jscha/dvp/cpumon/src/main.c:189:         printw("\n");
	.loc 1 189 9
	lea	rax, .LC9[rip]	# tmp311,
	mov	rdi, rax	#, tmp311
	mov	eax, 0	#,
	call	printw@PLT	#
# /home/jscha/dvp/cpumon/src/main.c:191:         printw("\n");
	.loc 1 191 9
	lea	rax, .LC9[rip]	# tmp312,
	mov	rdi, rax	#, tmp312
	mov	eax, 0	#,
	call	printw@PLT	#
# /home/jscha/dvp/cpumon/src/main.c:192:         printw("\n");
	.loc 1 192 9
	lea	rax, .LC9[rip]	# tmp313,
	mov	rdi, rax	#, tmp313
	mov	eax, 0	#,
	call	printw@PLT	#
# /home/jscha/dvp/cpumon/src/main.c:193:         printw("---------- Battery (%s) ----------\n", my_battery->status);
	.loc 1 193 66
	mov	rax, QWORD PTR -80[rbp]	# tmp314, my_battery
	add	rax, 20	# _101,
# /home/jscha/dvp/cpumon/src/main.c:193:         printw("---------- Battery (%s) ----------\n", my_battery->status);
	.loc 1 193 9
	mov	rsi, rax	#, _101
	lea	rax, .LC19[rip]	# tmp315,
	mov	rdi, rax	#, tmp315
	mov	eax, 0	#,
	call	printw@PLT	#
# /home/jscha/dvp/cpumon/src/main.c:194:         printw("    now      avg      min      max\n");
	.loc 1 194 9
	lea	rax, .LC20[rip]	# tmp316,
	mov	rdi, rax	#, tmp316
	mov	eax, 0	#,
	call	printw@PLT	#
# /home/jscha/dvp/cpumon/src/main.c:195:         printw("  %.2f W   %.2f W   %.2f W   %.2f W\n", my_battery->power_now, my_battery->power_runtime_avg, my_battery->min, my_battery->max);
	.loc 1 195 138
	mov	rax, QWORD PTR -80[rbp]	# tmp317, my_battery
	movss	xmm0, DWORD PTR 16[rax]	# _102, my_battery_146->max
# /home/jscha/dvp/cpumon/src/main.c:195:         printw("  %.2f W   %.2f W   %.2f W   %.2f W\n", my_battery->power_now, my_battery->power_runtime_avg, my_battery->min, my_battery->max);
	.loc 1 195 9
	pxor	xmm2, xmm2	# _103
	cvtss2sd	xmm2, xmm0	# _103, _102
# /home/jscha/dvp/cpumon/src/main.c:195:         printw("  %.2f W   %.2f W   %.2f W   %.2f W\n", my_battery->power_now, my_battery->power_runtime_avg, my_battery->min, my_battery->max);
	.loc 1 195 121
	mov	rax, QWORD PTR -80[rbp]	# tmp318, my_battery
	movss	xmm0, DWORD PTR 12[rax]	# _104, my_battery_146->min
# /home/jscha/dvp/cpumon/src/main.c:195:         printw("  %.2f W   %.2f W   %.2f W   %.2f W\n", my_battery->power_now, my_battery->power_runtime_avg, my_battery->min, my_battery->max);
	.loc 1 195 9
	pxor	xmm1, xmm1	# _105
	cvtss2sd	xmm1, xmm0	# _105, _104
# /home/jscha/dvp/cpumon/src/main.c:195:         printw("  %.2f W   %.2f W   %.2f W   %.2f W\n", my_battery->power_now, my_battery->power_runtime_avg, my_battery->min, my_battery->max);
	.loc 1 195 90
	mov	rax, QWORD PTR -80[rbp]	# tmp319, my_battery
	movss	xmm0, DWORD PTR 8[rax]	# _106, my_battery_146->power_runtime_avg
# /home/jscha/dvp/cpumon/src/main.c:195:         printw("  %.2f W   %.2f W   %.2f W   %.2f W\n", my_battery->power_now, my_battery->power_runtime_avg, my_battery->min, my_battery->max);
	.loc 1 195 9
	cvtss2sd	xmm0, xmm0	# _107, _106
# /home/jscha/dvp/cpumon/src/main.c:195:         printw("  %.2f W   %.2f W   %.2f W   %.2f W\n", my_battery->power_now, my_battery->power_runtime_avg, my_battery->min, my_battery->max);
	.loc 1 195 67
	mov	rax, QWORD PTR -80[rbp]	# tmp320, my_battery
	movss	xmm3, DWORD PTR [rax]	# _108, my_battery_146->power_now
# /home/jscha/dvp/cpumon/src/main.c:195:         printw("  %.2f W   %.2f W   %.2f W   %.2f W\n", my_battery->power_now, my_battery->power_runtime_avg, my_battery->min, my_battery->max);
	.loc 1 195 9
	pxor	xmm4, xmm4	# _109
	cvtss2sd	xmm4, xmm3	# _109, _108
	movq	rax, xmm4	# _109, _109
	movapd	xmm3, xmm2	#, _103
	movapd	xmm2, xmm1	#, _105
	movapd	xmm1, xmm0	#, _107
	movq	xmm0, rax	#, _109
	lea	rax, .LC21[rip]	# tmp321,
	mov	rdi, rax	#, tmp321
	mov	eax, 4	#,
	call	printw@PLT	#
# /home/jscha/dvp/cpumon/src/main.c:196:         printw("\n");
	.loc 1 196 9
	lea	rax, .LC9[rip]	# tmp322,
	mov	rdi, rax	#, tmp322
	mov	eax, 0	#,
	call	printw@PLT	#
# /home/jscha/dvp/cpumon/src/main.c:197:         if (display_power_config_flag == TRUE)
	.loc 1 197 39
	movzx	eax, BYTE PTR display_power_config_flag[rip]	# display_power_config_flag.24_110, display_power_config_flag
# /home/jscha/dvp/cpumon/src/main.c:197:         if (display_power_config_flag == TRUE)
	.loc 1 197 12
	test	al, al	# display_power_config_flag.24_110
	je	.L24	#,
# /home/jscha/dvp/cpumon/src/main.c:199:             power_config(running_with_privileges, cpu_designer);
	.loc 1 199 13
	mov	edx, DWORD PTR cpu_designer[rip]	# cpu_designer.25_111, cpu_designer
	movzx	eax, BYTE PTR running_with_privileges[rip]	# running_with_privileges.26_112, running_with_privileges
	movzx	eax, al	# _113, running_with_privileges.26_112
	mov	esi, edx	#, cpu_designer.25_111
	mov	edi, eax	#, _113
	call	power_config@PLT	#
# /home/jscha/dvp/cpumon/src/main.c:113:         command = kbhit();
	.loc 1 113 17
	jmp	.L24	#
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.section	.rodata
	.align 4
.LC0:
	.long	1148846080
	.text
.Letext0:
	.file 2 "/usr/lib/gcc/x86_64-linux-gnu/11/include/stddef.h"
	.file 3 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 4 "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h"
	.file 5 "/usr/include/x86_64-linux-gnu/bits/types/FILE.h"
	.file 6 "/usr/include/curses.h"
	.file 7 "/usr/include/stdio.h"
	.file 8 "/home/jscha/dvp/cpumon/src/../include/cpumonlib.h"
	.file 9 "/home/jscha/dvp/cpumon/src/../include/sysfs.h"
	.file 10 "/home/jscha/dvp/cpumon/src/../include/guilib.h"
	.file 11 "/usr/include/unistd.h"
	.file 12 "/usr/include/x86_64-linux-gnu/bits/getopt_core.h"
	.file 13 "/usr/include/stdlib.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xbe3
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF2030
	.byte	0xc
	.long	.LASF2031
	.long	.LASF2032
	.quad	.Ltext0
	.quad	.Letext0
	.long	.Ldebug_line0
	.long	.Ldebug_macro0
	.uleb128 0x2
	.long	.LASF1884
	.byte	0x2
	.byte	0xd1
	.byte	0x1b
	.long	0x3d
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF1877
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF1878
	.uleb128 0x4
	.byte	0x8
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF1879
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF1880
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF1881
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF1882
	.uleb128 0x5
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF1883
	.uleb128 0x2
	.long	.LASF1885
	.byte	0x3
	.byte	0x98
	.byte	0x12
	.long	0x70
	.uleb128 0x2
	.long	.LASF1886
	.byte	0x3
	.byte	0x99
	.byte	0x12
	.long	0x70
	.uleb128 0x6
	.byte	0x8
	.long	0x9a
	.uleb128 0x7
	.long	0x8f
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF1887
	.uleb128 0x7
	.long	0x9a
	.uleb128 0x8
	.long	.LASF1925
	.byte	0xd8
	.byte	0x4
	.byte	0x31
	.byte	0x8
	.long	0x273
	.uleb128 0x9
	.long	.LASF1888
	.byte	0x4
	.byte	0x33
	.byte	0x7
	.long	0x69
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x9
	.long	.LASF1889
	.byte	0x4
	.byte	0x36
	.byte	0x9
	.long	0x8f
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x9
	.long	.LASF1890
	.byte	0x4
	.byte	0x37
	.byte	0x9
	.long	0x8f
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x9
	.long	.LASF1891
	.byte	0x4
	.byte	0x38
	.byte	0x9
	.long	0x8f
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x9
	.long	.LASF1892
	.byte	0x4
	.byte	0x39
	.byte	0x9
	.long	0x8f
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x9
	.long	.LASF1893
	.byte	0x4
	.byte	0x3a
	.byte	0x9
	.long	0x8f
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x9
	.long	.LASF1894
	.byte	0x4
	.byte	0x3b
	.byte	0x9
	.long	0x8f
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0x9
	.long	.LASF1895
	.byte	0x4
	.byte	0x3c
	.byte	0x9
	.long	0x8f
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.uleb128 0x9
	.long	.LASF1896
	.byte	0x4
	.byte	0x3d
	.byte	0x9
	.long	0x8f
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0x9
	.long	.LASF1897
	.byte	0x4
	.byte	0x40
	.byte	0x9
	.long	0x8f
	.byte	0x2
	.byte	0x23
	.uleb128 0x48
	.uleb128 0x9
	.long	.LASF1898
	.byte	0x4
	.byte	0x41
	.byte	0x9
	.long	0x8f
	.byte	0x2
	.byte	0x23
	.uleb128 0x50
	.uleb128 0x9
	.long	.LASF1899
	.byte	0x4
	.byte	0x42
	.byte	0x9
	.long	0x8f
	.byte	0x2
	.byte	0x23
	.uleb128 0x58
	.uleb128 0x9
	.long	.LASF1900
	.byte	0x4
	.byte	0x44
	.byte	0x16
	.long	0x28d
	.byte	0x2
	.byte	0x23
	.uleb128 0x60
	.uleb128 0x9
	.long	.LASF1901
	.byte	0x4
	.byte	0x46
	.byte	0x14
	.long	0x293
	.byte	0x2
	.byte	0x23
	.uleb128 0x68
	.uleb128 0x9
	.long	.LASF1902
	.byte	0x4
	.byte	0x48
	.byte	0x7
	.long	0x69
	.byte	0x2
	.byte	0x23
	.uleb128 0x70
	.uleb128 0x9
	.long	.LASF1903
	.byte	0x4
	.byte	0x49
	.byte	0x7
	.long	0x69
	.byte	0x2
	.byte	0x23
	.uleb128 0x74
	.uleb128 0x9
	.long	.LASF1904
	.byte	0x4
	.byte	0x4a
	.byte	0xb
	.long	0x77
	.byte	0x2
	.byte	0x23
	.uleb128 0x78
	.uleb128 0x9
	.long	.LASF1905
	.byte	0x4
	.byte	0x4d
	.byte	0x12
	.long	0x54
	.byte	0x3
	.byte	0x23
	.uleb128 0x80
	.uleb128 0x9
	.long	.LASF1906
	.byte	0x4
	.byte	0x4e
	.byte	0xf
	.long	0x5b
	.byte	0x3
	.byte	0x23
	.uleb128 0x82
	.uleb128 0x9
	.long	.LASF1907
	.byte	0x4
	.byte	0x4f
	.byte	0x8
	.long	0x299
	.byte	0x3
	.byte	0x23
	.uleb128 0x83
	.uleb128 0x9
	.long	.LASF1908
	.byte	0x4
	.byte	0x51
	.byte	0xf
	.long	0x2a9
	.byte	0x3
	.byte	0x23
	.uleb128 0x88
	.uleb128 0x9
	.long	.LASF1909
	.byte	0x4
	.byte	0x59
	.byte	0xd
	.long	0x83
	.byte	0x3
	.byte	0x23
	.uleb128 0x90
	.uleb128 0x9
	.long	.LASF1910
	.byte	0x4
	.byte	0x5b
	.byte	0x17
	.long	0x2b5
	.byte	0x3
	.byte	0x23
	.uleb128 0x98
	.uleb128 0x9
	.long	.LASF1911
	.byte	0x4
	.byte	0x5c
	.byte	0x19
	.long	0x2c1
	.byte	0x3
	.byte	0x23
	.uleb128 0xa0
	.uleb128 0x9
	.long	.LASF1912
	.byte	0x4
	.byte	0x5d
	.byte	0x14
	.long	0x293
	.byte	0x3
	.byte	0x23
	.uleb128 0xa8
	.uleb128 0x9
	.long	.LASF1913
	.byte	0x4
	.byte	0x5e
	.byte	0x9
	.long	0x4b
	.byte	0x3
	.byte	0x23
	.uleb128 0xb0
	.uleb128 0x9
	.long	.LASF1914
	.byte	0x4
	.byte	0x5f
	.byte	0xa
	.long	0x31
	.byte	0x3
	.byte	0x23
	.uleb128 0xb8
	.uleb128 0x9
	.long	.LASF1915
	.byte	0x4
	.byte	0x60
	.byte	0x7
	.long	0x69
	.byte	0x3
	.byte	0x23
	.uleb128 0xc0
	.uleb128 0x9
	.long	.LASF1916
	.byte	0x4
	.byte	0x62
	.byte	0x8
	.long	0x2c7
	.byte	0x3
	.byte	0x23
	.uleb128 0xc4
	.byte	0
	.uleb128 0x2
	.long	.LASF1917
	.byte	0x5
	.byte	0x7
	.byte	0x19
	.long	0xa6
	.uleb128 0xa
	.long	.LASF2033
	.byte	0x4
	.byte	0x2b
	.byte	0xe
	.uleb128 0xb
	.long	.LASF1918
	.byte	0x1
	.uleb128 0x6
	.byte	0x8
	.long	0x287
	.uleb128 0x6
	.byte	0x8
	.long	0xa6
	.uleb128 0xc
	.long	0x9a
	.long	0x2a9
	.uleb128 0xd
	.long	0x3d
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x27f
	.uleb128 0xb
	.long	.LASF1919
	.byte	0x1
	.uleb128 0x6
	.byte	0x8
	.long	0x2af
	.uleb128 0xb
	.long	.LASF1920
	.byte	0x1
	.uleb128 0x6
	.byte	0x8
	.long	0x2bb
	.uleb128 0xc
	.long	0x9a
	.long	0x2d7
	.uleb128 0xd
	.long	0x3d
	.byte	0x13
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x273
	.uleb128 0xe
	.long	.LASF1963
	.byte	0x7
	.byte	0x91
	.byte	0xe
	.long	0x2d7
	.byte	0x1
	.byte	0x1
	.uleb128 0x6
	.byte	0x8
	.long	0xa1
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF1921
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF1922
	.uleb128 0x6
	.byte	0x8
	.long	0x8f
	.uleb128 0x2
	.long	.LASF1923
	.byte	0x6
	.byte	0xde
	.byte	0x12
	.long	0x44
	.uleb128 0xf
	.long	.LASF1924
	.byte	0x6
	.value	0x1ba
	.byte	0x18
	.long	0x31e
	.uleb128 0x10
	.long	.LASF1926
	.byte	0x58
	.byte	0x6
	.value	0x1eb
	.byte	0x8
	.long	0x4dd
	.uleb128 0x11
	.long	.LASF1927
	.byte	0x6
	.value	0x1ed
	.byte	0x8
	.long	0x62
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x11
	.long	.LASF1928
	.byte	0x6
	.value	0x1ed
	.byte	0xf
	.long	0x62
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x11
	.long	.LASF1929
	.byte	0x6
	.value	0x1f0
	.byte	0x8
	.long	0x62
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x11
	.long	.LASF1930
	.byte	0x6
	.value	0x1f0
	.byte	0xf
	.long	0x62
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x11
	.long	.LASF1931
	.byte	0x6
	.value	0x1f1
	.byte	0x8
	.long	0x62
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x11
	.long	.LASF1932
	.byte	0x6
	.value	0x1f1
	.byte	0xf
	.long	0x62
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.uleb128 0x11
	.long	.LASF1888
	.byte	0x6
	.value	0x1f3
	.byte	0x8
	.long	0x62
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x11
	.long	.LASF1933
	.byte	0x6
	.value	0x1f6
	.byte	0x9
	.long	0x4dd
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x11
	.long	.LASF1934
	.byte	0x6
	.value	0x1f7
	.byte	0x9
	.long	0x305
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x11
	.long	.LASF1935
	.byte	0x6
	.value	0x1fa
	.byte	0x8
	.long	0x559
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x11
	.long	.LASF1936
	.byte	0x6
	.value	0x1fb
	.byte	0x8
	.long	0x559
	.byte	0x2
	.byte	0x23
	.uleb128 0x19
	.uleb128 0x11
	.long	.LASF1937
	.byte	0x6
	.value	0x1fc
	.byte	0x8
	.long	0x559
	.byte	0x2
	.byte	0x23
	.uleb128 0x1a
	.uleb128 0x11
	.long	.LASF1938
	.byte	0x6
	.value	0x1fd
	.byte	0x8
	.long	0x559
	.byte	0x2
	.byte	0x23
	.uleb128 0x1b
	.uleb128 0x11
	.long	.LASF1939
	.byte	0x6
	.value	0x1fe
	.byte	0x8
	.long	0x559
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x11
	.long	.LASF1940
	.byte	0x6
	.value	0x1ff
	.byte	0x8
	.long	0x559
	.byte	0x2
	.byte	0x23
	.uleb128 0x1d
	.uleb128 0x11
	.long	.LASF1941
	.byte	0x6
	.value	0x200
	.byte	0x8
	.long	0x559
	.byte	0x2
	.byte	0x23
	.uleb128 0x1e
	.uleb128 0x11
	.long	.LASF1942
	.byte	0x6
	.value	0x201
	.byte	0x8
	.long	0x559
	.byte	0x2
	.byte	0x23
	.uleb128 0x1f
	.uleb128 0x11
	.long	.LASF1943
	.byte	0x6
	.value	0x202
	.byte	0x8
	.long	0x559
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x11
	.long	.LASF1944
	.byte	0x6
	.value	0x203
	.byte	0x6
	.long	0x69
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x11
	.long	.LASF1945
	.byte	0x6
	.value	0x205
	.byte	0xf
	.long	0x566
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x11
	.long	.LASF1946
	.byte	0x6
	.value	0x208
	.byte	0x8
	.long	0x62
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0x11
	.long	.LASF1947
	.byte	0x6
	.value	0x209
	.byte	0x8
	.long	0x62
	.byte	0x2
	.byte	0x23
	.uleb128 0x32
	.uleb128 0x11
	.long	.LASF1948
	.byte	0x6
	.value	0x20c
	.byte	0x6
	.long	0x69
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.uleb128 0x11
	.long	.LASF1949
	.byte	0x6
	.value	0x20d
	.byte	0x6
	.long	0x69
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.uleb128 0x11
	.long	.LASF1950
	.byte	0x6
	.value	0x20e
	.byte	0xa
	.long	0x56c
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0x11
	.long	.LASF1951
	.byte	0x6
	.value	0x216
	.byte	0x4
	.long	0x4ea
	.byte	0x2
	.byte	0x23
	.uleb128 0x48
	.uleb128 0x11
	.long	.LASF1952
	.byte	0x6
	.value	0x218
	.byte	0x8
	.long	0x62
	.byte	0x2
	.byte	0x23
	.uleb128 0x54
	.byte	0
	.uleb128 0xf
	.long	.LASF1953
	.byte	0x6
	.value	0x1bc
	.byte	0x10
	.long	0x305
	.uleb128 0x10
	.long	.LASF1954
	.byte	0xc
	.byte	0x6
	.value	0x211
	.byte	0x9
	.long	0x559
	.uleb128 0x11
	.long	.LASF1955
	.byte	0x6
	.value	0x213
	.byte	0xc
	.long	0x62
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x11
	.long	.LASF1956
	.byte	0x6
	.value	0x213
	.byte	0x14
	.long	0x62
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x11
	.long	.LASF1957
	.byte	0x6
	.value	0x214
	.byte	0xc
	.long	0x62
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x11
	.long	.LASF1958
	.byte	0x6
	.value	0x214
	.byte	0x16
	.long	0x62
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x11
	.long	.LASF1959
	.byte	0x6
	.value	0x215
	.byte	0xc
	.long	0x62
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x11
	.long	.LASF1960
	.byte	0x6
	.value	0x215
	.byte	0x19
	.long	0x62
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.byte	0
	.uleb128 0x3
	.byte	0x1
	.byte	0x2
	.long	.LASF1961
	.uleb128 0xb
	.long	.LASF1962
	.byte	0x1
	.uleb128 0x6
	.byte	0x8
	.long	0x560
	.uleb128 0x6
	.byte	0x8
	.long	0x311
	.uleb128 0x12
	.long	.LASF1964
	.byte	0x6
	.value	0x5c7
	.byte	0x11
	.long	0x56c
	.byte	0x1
	.byte	0x1
	.uleb128 0x8
	.long	.LASF1965
	.byte	0x14
	.byte	0x8
	.byte	0x11
	.byte	0x8
	.long	0x5e9
	.uleb128 0x9
	.long	.LASF1966
	.byte	0x8
	.byte	0x13
	.byte	0xb
	.long	0x5e9
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x9
	.long	.LASF1967
	.byte	0x8
	.byte	0x14
	.byte	0xb
	.long	0x5e9
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x9
	.long	.LASF1968
	.byte	0x8
	.byte	0x15
	.byte	0xb
	.long	0x5e9
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x13
	.string	"min"
	.byte	0x8
	.byte	0x16
	.byte	0xb
	.long	0x5e9
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x13
	.string	"max"
	.byte	0x8
	.byte	0x17
	.byte	0xb
	.long	0x5e9
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x9
	.long	.LASF1969
	.byte	0x8
	.byte	0x18
	.byte	0xb
	.long	0x5f0
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.byte	0
	.uleb128 0x3
	.byte	0x4
	.byte	0x4
	.long	.LASF1970
	.uleb128 0xc
	.long	0x5e9
	.long	0x5ff
	.uleb128 0x14
	.long	0x3d
	.byte	0
	.uleb128 0x2
	.long	.LASF1965
	.byte	0x8
	.byte	0x1a
	.byte	0x17
	.long	0x581
	.uleb128 0x8
	.long	.LASF1971
	.byte	0x20
	.byte	0x8
	.byte	0x1c
	.byte	0x8
	.long	0x6a0
	.uleb128 0x9
	.long	.LASF1972
	.byte	0x8
	.byte	0x1d
	.byte	0xb
	.long	0x5e9
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x13
	.string	"gpu"
	.byte	0x8
	.byte	0x1e
	.byte	0xb
	.long	0x5e9
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x9
	.long	.LASF1973
	.byte	0x8
	.byte	0x1f
	.byte	0xb
	.long	0x5e9
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x9
	.long	.LASF1974
	.byte	0x8
	.byte	0x20
	.byte	0xb
	.long	0x5e9
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x9
	.long	.LASF1975
	.byte	0x8
	.byte	0x21
	.byte	0xb
	.long	0x5e9
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x9
	.long	.LASF1976
	.byte	0x8
	.byte	0x22
	.byte	0x12
	.long	0x44
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x9
	.long	.LASF1977
	.byte	0x8
	.byte	0x22
	.byte	0x1d
	.long	0x44
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x9
	.long	.LASF1978
	.byte	0x8
	.byte	0x22
	.byte	0x2a
	.long	0x44
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x9
	.long	.LASF1969
	.byte	0x8
	.byte	0x23
	.byte	0xb
	.long	0x5f0
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.byte	0
	.uleb128 0x2
	.long	.LASF1971
	.byte	0x8
	.byte	0x25
	.byte	0x16
	.long	0x60b
	.uleb128 0x8
	.long	.LASF1979
	.byte	0x28
	.byte	0x8
	.byte	0x28
	.byte	0x8
	.long	0x714
	.uleb128 0x9
	.long	.LASF1980
	.byte	0x8
	.byte	0x29
	.byte	0xb
	.long	0x5e9
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x9
	.long	.LASF1981
	.byte	0x8
	.byte	0x2a
	.byte	0xb
	.long	0x5e9
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x9
	.long	.LASF1982
	.byte	0x8
	.byte	0x2b
	.byte	0xb
	.long	0x5e9
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x13
	.string	"min"
	.byte	0x8
	.byte	0x2c
	.byte	0xb
	.long	0x5e9
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x13
	.string	"max"
	.byte	0x8
	.byte	0x2d
	.byte	0xb
	.long	0x5e9
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x9
	.long	.LASF1983
	.byte	0x8
	.byte	0x2e
	.byte	0xa
	.long	0x2c7
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.byte	0
	.uleb128 0x2
	.long	.LASF1979
	.byte	0x8
	.byte	0x30
	.byte	0x18
	.long	0x6ac
	.uleb128 0x15
	.byte	0x7
	.byte	0x4
	.long	0x44
	.byte	0x8
	.byte	0x32
	.byte	0xe
	.long	0x73b
	.uleb128 0x16
	.long	.LASF1984
	.byte	0
	.uleb128 0x17
	.string	"AMD"
	.byte	0x1
	.byte	0
	.uleb128 0x2
	.long	.LASF1985
	.byte	0x8
	.byte	0x32
	.byte	0x1d
	.long	0x720
	.uleb128 0x18
	.long	.LASF1986
	.byte	0x1
	.byte	0x22
	.byte	0x6
	.long	0x70
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	period_counter
	.uleb128 0x18
	.long	.LASF1987
	.byte	0x1
	.byte	0x23
	.byte	0x6
	.long	0x70
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	poll_cycle_counter
	.uleb128 0x18
	.long	.LASF1988
	.byte	0x1
	.byte	0x24
	.byte	0x5
	.long	0x559
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	display_power_config_flag
	.uleb128 0x18
	.long	.LASF1989
	.byte	0x1
	.byte	0x25
	.byte	0x5
	.long	0x559
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	display_moving_average_flag
	.uleb128 0x18
	.long	.LASF1990
	.byte	0x1
	.byte	0x26
	.byte	0x10
	.long	0x73b
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	cpu_designer
	.uleb128 0xe
	.long	.LASF1991
	.byte	0x1
	.byte	0x28
	.byte	0xc
	.long	0x69
	.byte	0x1
	.byte	0x1
	.uleb128 0xe
	.long	.LASF1992
	.byte	0x1
	.byte	0x29
	.byte	0xc
	.long	0x559
	.byte	0x1
	.byte	0x1
	.uleb128 0xc
	.long	0x5e9
	.long	0x7e6
	.uleb128 0xd
	.long	0x3d
	.byte	0x3b
	.byte	0
	.uleb128 0x18
	.long	.LASF1993
	.byte	0x1
	.byte	0x2b
	.byte	0x7
	.long	0x7d6
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	freq_his
	.uleb128 0x18
	.long	.LASF1994
	.byte	0x1
	.byte	0x2c
	.byte	0x7
	.long	0x7d6
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	load_his
	.uleb128 0x18
	.long	.LASF1995
	.byte	0x1
	.byte	0x2d
	.byte	0x7
	.long	0x7d6
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	temp_his
	.uleb128 0x18
	.long	.LASF1996
	.byte	0x1
	.byte	0x2e
	.byte	0x7
	.long	0x7d6
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	voltage_his
	.uleb128 0x18
	.long	.LASF1997
	.byte	0x1
	.byte	0x2f
	.byte	0x7
	.long	0x7d6
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	power_his
	.uleb128 0x19
	.byte	0x1
	.long	.LASF1998
	.byte	0x9
	.byte	0x7
	.byte	0x6
	.byte	0x1
	.byte	0x1
	.long	0x873
	.uleb128 0x1a
	.long	0x559
	.uleb128 0x1a
	.long	0x73b
	.byte	0
	.uleb128 0x19
	.byte	0x1
	.long	.LASF1999
	.byte	0xa
	.byte	0x1b
	.byte	0x6
	.byte	0x1
	.byte	0x1
	.long	0x88d
	.uleb128 0x1a
	.long	0x88d
	.uleb128 0x1a
	.long	0x5e9
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x5e9
	.uleb128 0x19
	.byte	0x1
	.long	.LASF2000
	.byte	0x8
	.byte	0x3d
	.byte	0x6
	.byte	0x1
	.byte	0x1
	.long	0x8c1
	.uleb128 0x1a
	.long	0x69
	.uleb128 0x1a
	.long	0x88d
	.uleb128 0x1a
	.long	0x88d
	.uleb128 0x1a
	.long	0x88d
	.uleb128 0x1a
	.long	0x88d
	.uleb128 0x1a
	.long	0x88d
	.byte	0
	.uleb128 0x1b
	.byte	0x1
	.long	.LASF2001
	.byte	0x6
	.value	0x345
	.byte	0xc
	.byte	0x1
	.long	0x69
	.byte	0x1
	.long	0x8e5
	.uleb128 0x1a
	.long	0x56c
	.uleb128 0x1a
	.long	0x4dd
	.uleb128 0x1a
	.long	0x4b
	.byte	0
	.uleb128 0x1b
	.byte	0x1
	.long	.LASF2002
	.byte	0x6
	.value	0x2f9
	.byte	0xc
	.byte	0x1
	.long	0x69
	.byte	0x1
	.long	0x900
	.uleb128 0x1a
	.long	0x2eb
	.uleb128 0x1c
	.byte	0
	.uleb128 0x1b
	.byte	0x1
	.long	.LASF2003
	.byte	0x6
	.value	0x344
	.byte	0xc
	.byte	0x1
	.long	0x69
	.byte	0x1
	.long	0x924
	.uleb128 0x1a
	.long	0x56c
	.uleb128 0x1a
	.long	0x4dd
	.uleb128 0x1a
	.long	0x4b
	.byte	0
	.uleb128 0x1b
	.byte	0x1
	.long	.LASF2004
	.byte	0x6
	.value	0x34b
	.byte	0xc
	.byte	0x1
	.long	0x69
	.byte	0x1
	.long	0x93e
	.uleb128 0x1a
	.long	0x56c
	.byte	0
	.uleb128 0x1d
	.byte	0x1
	.long	.LASF1967
	.byte	0x8
	.byte	0x3e
	.byte	0x7
	.byte	0x1
	.long	0x5e9
	.byte	0x1
	.long	0x961
	.uleb128 0x1a
	.long	0x70
	.uleb128 0x1a
	.long	0x88d
	.uleb128 0x1a
	.long	0x88d
	.byte	0
	.uleb128 0x19
	.byte	0x1
	.long	.LASF2005
	.byte	0x9
	.byte	0xd
	.byte	0x6
	.byte	0x1
	.byte	0x1
	.long	0x98a
	.uleb128 0x1a
	.long	0x88d
	.uleb128 0x1a
	.long	0x88d
	.uleb128 0x1a
	.long	0x98a
	.uleb128 0x1a
	.long	0x98a
	.uleb128 0x1a
	.long	0x69
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x2f1
	.uleb128 0x19
	.byte	0x1
	.long	.LASF2006
	.byte	0x8
	.byte	0x3a
	.byte	0x6
	.byte	0x1
	.byte	0x1
	.long	0x9c3
	.uleb128 0x1a
	.long	0x9c3
	.uleb128 0x1a
	.long	0x9c3
	.uleb128 0x1a
	.long	0x9c3
	.uleb128 0x1a
	.long	0x9c3
	.uleb128 0x1a
	.long	0x88d
	.uleb128 0x1a
	.long	0x9c9
	.uleb128 0x1a
	.long	0x9cf
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x5ff
	.uleb128 0x6
	.byte	0x8
	.long	0x6a0
	.uleb128 0x6
	.byte	0x8
	.long	0x714
	.uleb128 0x1b
	.byte	0x1
	.long	.LASF2007
	.byte	0xb
	.value	0x1d0
	.byte	0x15
	.byte	0x1
	.long	0x44
	.byte	0x1
	.long	0x9ef
	.uleb128 0x1a
	.long	0x44
	.byte	0
	.uleb128 0x1e
	.byte	0x1
	.long	.LASF2011
	.byte	0xa
	.byte	0x1a
	.byte	0x5
	.byte	0x1
	.long	0x69
	.byte	0x1
	.uleb128 0x1f
	.byte	0x1
	.long	.LASF2014
	.byte	0xa
	.byte	0x19
	.byte	0x6
	.byte	0x1
	.byte	0x1
	.uleb128 0x1d
	.byte	0x1
	.long	.LASF2008
	.byte	0xc
	.byte	0x5b
	.byte	0xc
	.byte	0x1
	.long	0x69
	.byte	0x1
	.long	0xa2c
	.uleb128 0x1a
	.long	0x69
	.uleb128 0x1a
	.long	0xa2c
	.uleb128 0x1a
	.long	0x2eb
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x95
	.uleb128 0x1b
	.byte	0x1
	.long	.LASF2009
	.byte	0x7
	.value	0x15e
	.byte	0xc
	.byte	0x1
	.long	0x69
	.byte	0x1
	.long	0xa52
	.uleb128 0x1a
	.long	0x2d7
	.uleb128 0x1a
	.long	0x2eb
	.uleb128 0x1c
	.byte	0
	.uleb128 0x20
	.byte	0x1
	.long	.LASF2010
	.byte	0xd
	.value	0x270
	.byte	0xd
	.byte	0x1
	.byte	0x1
	.byte	0x1
	.long	0xa69
	.uleb128 0x1a
	.long	0x69
	.byte	0
	.uleb128 0x1e
	.byte	0x1
	.long	.LASF2012
	.byte	0x9
	.byte	0x5
	.byte	0x7
	.byte	0x1
	.long	0x8f
	.byte	0x1
	.uleb128 0x1b
	.byte	0x1
	.long	.LASF2013
	.byte	0xd
	.value	0x21c
	.byte	0xe
	.byte	0x1
	.long	0x4b
	.byte	0x1
	.long	0xa92
	.uleb128 0x1a
	.long	0x31
	.byte	0
	.uleb128 0x1f
	.byte	0x1
	.long	.LASF2015
	.byte	0x8
	.byte	0x35
	.byte	0x6
	.byte	0x1
	.byte	0x1
	.uleb128 0x21
	.byte	0x1
	.long	.LASF2034
	.byte	0x1
	.byte	0x33
	.byte	0x5
	.byte	0x1
	.long	0x69
	.quad	.LFB6
	.quad	.LFE6
	.long	.LLST0
	.byte	0x1
	.long	0xbda
	.uleb128 0x22
	.long	.LASF2016
	.byte	0x1
	.byte	0x33
	.byte	0xf
	.long	0x69
	.byte	0x3
	.byte	0x91
	.sleb128 -164
	.uleb128 0x22
	.long	.LASF2017
	.byte	0x1
	.byte	0x33
	.byte	0x1c
	.long	0x2ff
	.byte	0x3
	.byte	0x91
	.sleb128 -176
	.uleb128 0x23
	.long	.LASF2018
	.byte	0x1
	.byte	0x39
	.byte	0xb
	.long	0xbda
	.byte	0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x23
	.long	.LASF2019
	.byte	0x1
	.byte	0x3b
	.byte	0xd
	.long	0x9c3
	.byte	0x3
	.byte	0x91
	.sleb128 -128
	.uleb128 0x23
	.long	.LASF2020
	.byte	0x1
	.byte	0x3d
	.byte	0xd
	.long	0x9c3
	.byte	0x3
	.byte	0x91
	.sleb128 -120
	.uleb128 0x23
	.long	.LASF2021
	.byte	0x1
	.byte	0x3f
	.byte	0xd
	.long	0x9c3
	.byte	0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x23
	.long	.LASF2022
	.byte	0x1
	.byte	0x41
	.byte	0xd
	.long	0x9c3
	.byte	0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0x23
	.long	.LASF2023
	.byte	0x1
	.byte	0x43
	.byte	0xe
	.long	0x9cf
	.byte	0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x23
	.long	.LASF2024
	.byte	0x1
	.byte	0x46
	.byte	0xc
	.long	0x9c9
	.byte	0x3
	.byte	0x91
	.sleb128 -136
	.uleb128 0x23
	.long	.LASF2025
	.byte	0x1
	.byte	0x54
	.byte	0x10
	.long	0x98a
	.byte	0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x23
	.long	.LASF2026
	.byte	0x1
	.byte	0x55
	.byte	0x10
	.long	0x98a
	.byte	0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x23
	.long	.LASF2027
	.byte	0x1
	.byte	0x57
	.byte	0xb
	.long	0x8f
	.byte	0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x23
	.long	.LASF2028
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.long	0x69
	.byte	0x3
	.byte	0x91
	.sleb128 -140
	.uleb128 0x24
	.quad	.LBB2
	.quad	.LBE2
	.long	0xbb9
	.uleb128 0x23
	.long	.LASF2029
	.byte	0x1
	.byte	0x97
	.byte	0x16
	.long	0x69
	.byte	0x3
	.byte	0x91
	.sleb128 -148
	.byte	0
	.uleb128 0x25
	.quad	.LBB3
	.quad	.LBE3
	.uleb128 0x26
	.string	"i"
	.byte	0x1
	.byte	0xb3
	.byte	0x16
	.long	0x69
	.byte	0x3
	.byte	0x91
	.sleb128 -144
	.byte	0
	.byte	0
	.uleb128 0x27
	.long	0x5e9
	.uleb128 0xd
	.long	0x3d
	.byte	0x2
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
	.uleb128 0x16
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
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0xd
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
	.uleb128 0x38
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x12
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
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.uleb128 0x14
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
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
	.uleb128 0x16
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1c
	.uleb128 0xb
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
	.uleb128 0x3f
	.uleb128 0xc
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
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x18
	.byte	0
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
	.uleb128 0x1e
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
	.uleb128 0x1f
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
	.uleb128 0x3c
	.uleb128 0xc
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x22
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
	.uleb128 0x23
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
	.uleb128 0x24
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
	.uleb128 0x25
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x26
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
	.uleb128 0x27
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
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
	.quad	.LFE6-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 16
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
	.file 14 "/usr/include/stdc-predef.h"
	.byte	0x3
	.uleb128 0
	.uleb128 0xe
	.byte	0x7
	.long	.Ldebug_macro2
	.byte	0x4
	.byte	0x3
	.uleb128 0x16
	.uleb128 0x7
	.byte	0x7
	.long	.Ldebug_macro3
	.file 15 "/usr/include/x86_64-linux-gnu/bits/libc-header-start.h"
	.byte	0x3
	.uleb128 0x1b
	.uleb128 0xf
	.byte	0x6
	.uleb128 0x1f
	.long	.LASF369
	.file 16 "/usr/include/features.h"
	.byte	0x3
	.uleb128 0x21
	.uleb128 0x10
	.byte	0x7
	.long	.Ldebug_macro4
	.file 17 "/usr/include/features-time64.h"
	.byte	0x3
	.uleb128 0x188
	.uleb128 0x11
	.file 18 "/usr/include/x86_64-linux-gnu/bits/wordsize.h"
	.byte	0x3
	.uleb128 0x14
	.uleb128 0x12
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.file 19 "/usr/include/x86_64-linux-gnu/bits/timesize.h"
	.byte	0x3
	.uleb128 0x15
	.uleb128 0x13
	.byte	0x3
	.uleb128 0x13
	.uleb128 0x12
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
	.file 20 "/usr/include/x86_64-linux-gnu/sys/cdefs.h"
	.byte	0x3
	.uleb128 0x1e6
	.uleb128 0x14
	.byte	0x7
	.long	.Ldebug_macro7
	.byte	0x3
	.uleb128 0x22f
	.uleb128 0x12
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.file 21 "/usr/include/x86_64-linux-gnu/bits/long-double.h"
	.byte	0x3
	.uleb128 0x230
	.uleb128 0x15
	.byte	0x5
	.uleb128 0x15
	.long	.LASF503
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro8
	.byte	0x4
	.file 22 "/usr/include/x86_64-linux-gnu/gnu/stubs.h"
	.byte	0x3
	.uleb128 0x1fe
	.uleb128 0x16
	.file 23 "/usr/include/x86_64-linux-gnu/gnu/stubs-64.h"
	.byte	0x3
	.uleb128 0xa
	.uleb128 0x17
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
	.file 24 "/usr/lib/gcc/x86_64-linux-gnu/11/include/stdarg.h"
	.byte	0x3
	.uleb128 0x24
	.uleb128 0x18
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
	.uleb128 0x12
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.byte	0x3
	.uleb128 0x1c
	.uleb128 0x13
	.byte	0x3
	.uleb128 0x13
	.uleb128 0x12
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF424
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro14
	.file 25 "/usr/include/x86_64-linux-gnu/bits/typesizes.h"
	.byte	0x3
	.uleb128 0x8d
	.uleb128 0x19
	.byte	0x7
	.long	.Ldebug_macro15
	.byte	0x4
	.file 26 "/usr/include/x86_64-linux-gnu/bits/time64.h"
	.byte	0x3
	.uleb128 0x8e
	.uleb128 0x1a
	.byte	0x7
	.long	.Ldebug_macro16
	.byte	0x4
	.byte	0x6
	.uleb128 0xe2
	.long	.LASF629
	.byte	0x4
	.file 27 "/usr/include/x86_64-linux-gnu/bits/types/__fpos_t.h"
	.byte	0x3
	.uleb128 0x27
	.uleb128 0x1b
	.byte	0x5
	.uleb128 0x2
	.long	.LASF630
	.file 28 "/usr/include/x86_64-linux-gnu/bits/types/__mbstate_t.h"
	.byte	0x3
	.uleb128 0x5
	.uleb128 0x1c
	.byte	0x5
	.uleb128 0x2
	.long	.LASF631
	.byte	0x4
	.byte	0x4
	.file 29 "/usr/include/x86_64-linux-gnu/bits/types/__fpos64_t.h"
	.byte	0x3
	.uleb128 0x28
	.uleb128 0x1d
	.byte	0x5
	.uleb128 0x2
	.long	.LASF632
	.byte	0x4
	.file 30 "/usr/include/x86_64-linux-gnu/bits/types/__FILE.h"
	.byte	0x3
	.uleb128 0x29
	.uleb128 0x1e
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
	.file 31 "/usr/include/x86_64-linux-gnu/bits/stdio_lim.h"
	.byte	0x3
	.uleb128 0x85
	.uleb128 0x1f
	.byte	0x7
	.long	.Ldebug_macro19
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro20
	.file 32 "/usr/include/x86_64-linux-gnu/bits/floatn.h"
	.byte	0x3
	.uleb128 0x1ae
	.uleb128 0x20
	.byte	0x7
	.long	.Ldebug_macro21
	.file 33 "/usr/include/x86_64-linux-gnu/bits/floatn-common.h"
	.byte	0x3
	.uleb128 0x77
	.uleb128 0x21
	.byte	0x5
	.uleb128 0x15
	.long	.LASF674
	.byte	0x3
	.uleb128 0x18
	.uleb128 0x15
	.byte	0x5
	.uleb128 0x15
	.long	.LASF503
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro22
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.file 34 "/usr/include/string.h"
	.byte	0x3
	.uleb128 0x17
	.uleb128 0x22
	.byte	0x7
	.long	.Ldebug_macro23
	.byte	0x3
	.uleb128 0x1a
	.uleb128 0xf
	.byte	0x7
	.long	.Ldebug_macro24
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro25
	.byte	0x3
	.uleb128 0x21
	.uleb128 0x2
	.byte	0x7
	.long	.Ldebug_macro26
	.byte	0x4
	.file 35 "/usr/include/x86_64-linux-gnu/bits/types/locale_t.h"
	.byte	0x3
	.uleb128 0xac
	.uleb128 0x23
	.byte	0x5
	.uleb128 0x14
	.long	.LASF697
	.file 36 "/usr/include/x86_64-linux-gnu/bits/types/__locale_t.h"
	.byte	0x3
	.uleb128 0x16
	.uleb128 0x24
	.byte	0x5
	.uleb128 0x14
	.long	.LASF698
	.byte	0x4
	.byte	0x4
	.file 37 "/usr/include/strings.h"
	.byte	0x3
	.uleb128 0x1ce
	.uleb128 0x25
	.byte	0x7
	.long	.Ldebug_macro27
	.byte	0x3
	.uleb128 0x17
	.uleb128 0x2
	.byte	0x7
	.long	.Ldebug_macro28
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.byte	0x3
	.uleb128 0x18
	.uleb128 0xd
	.byte	0x5
	.uleb128 0x19
	.long	.LASF368
	.byte	0x3
	.uleb128 0x1a
	.uleb128 0xf
	.byte	0x7
	.long	.Ldebug_macro24
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro29
	.byte	0x3
	.uleb128 0x20
	.uleb128 0x2
	.byte	0x7
	.long	.Ldebug_macro30
	.byte	0x4
	.byte	0x5
	.uleb128 0x24
	.long	.LASF718
	.file 38 "/usr/include/x86_64-linux-gnu/bits/waitflags.h"
	.byte	0x3
	.uleb128 0x28
	.uleb128 0x26
	.byte	0x7
	.long	.Ldebug_macro31
	.byte	0x4
	.file 39 "/usr/include/x86_64-linux-gnu/bits/waitstatus.h"
	.byte	0x3
	.uleb128 0x29
	.uleb128 0x27
	.byte	0x7
	.long	.Ldebug_macro32
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro33
	.file 40 "/usr/include/x86_64-linux-gnu/sys/types.h"
	.byte	0x3
	.uleb128 0x18b
	.uleb128 0x28
	.byte	0x7
	.long	.Ldebug_macro34
	.file 41 "/usr/include/x86_64-linux-gnu/bits/types/clock_t.h"
	.byte	0x3
	.uleb128 0x7e
	.uleb128 0x29
	.byte	0x5
	.uleb128 0x2
	.long	.LASF765
	.byte	0x4
	.file 42 "/usr/include/x86_64-linux-gnu/bits/types/clockid_t.h"
	.byte	0x3
	.uleb128 0x80
	.uleb128 0x2a
	.byte	0x5
	.uleb128 0x2
	.long	.LASF766
	.byte	0x4
	.file 43 "/usr/include/x86_64-linux-gnu/bits/types/time_t.h"
	.byte	0x3
	.uleb128 0x81
	.uleb128 0x2b
	.byte	0x5
	.uleb128 0x2
	.long	.LASF767
	.byte	0x4
	.file 44 "/usr/include/x86_64-linux-gnu/bits/types/timer_t.h"
	.byte	0x3
	.uleb128 0x82
	.uleb128 0x2c
	.byte	0x5
	.uleb128 0x2
	.long	.LASF768
	.byte	0x4
	.byte	0x5
	.uleb128 0x8f
	.long	.LASF543
	.byte	0x3
	.uleb128 0x90
	.uleb128 0x2
	.byte	0x7
	.long	.Ldebug_macro28
	.byte	0x4
	.file 45 "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h"
	.byte	0x3
	.uleb128 0x9b
	.uleb128 0x2d
	.byte	0x5
	.uleb128 0x14
	.long	.LASF769
	.byte	0x4
	.byte	0x5
	.uleb128 0xab
	.long	.LASF770
	.file 46 "/usr/include/endian.h"
	.byte	0x3
	.uleb128 0xb0
	.uleb128 0x2e
	.byte	0x5
	.uleb128 0x13
	.long	.LASF771
	.file 47 "/usr/include/x86_64-linux-gnu/bits/endian.h"
	.byte	0x3
	.uleb128 0x18
	.uleb128 0x2f
	.byte	0x7
	.long	.Ldebug_macro35
	.file 48 "/usr/include/x86_64-linux-gnu/bits/endianness.h"
	.byte	0x3
	.uleb128 0x23
	.uleb128 0x30
	.byte	0x7
	.long	.Ldebug_macro36
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro37
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro38
	.file 49 "/usr/include/x86_64-linux-gnu/bits/byteswap.h"
	.byte	0x3
	.uleb128 0x23
	.uleb128 0x31
	.byte	0x7
	.long	.Ldebug_macro39
	.byte	0x4
	.file 50 "/usr/include/x86_64-linux-gnu/bits/uintn-identity.h"
	.byte	0x3
	.uleb128 0x24
	.uleb128 0x32
	.byte	0x5
	.uleb128 0x18
	.long	.LASF788
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro40
	.byte	0x4
	.file 51 "/usr/include/x86_64-linux-gnu/sys/select.h"
	.byte	0x3
	.uleb128 0xb3
	.uleb128 0x33
	.byte	0x5
	.uleb128 0x16
	.long	.LASF801
	.file 52 "/usr/include/x86_64-linux-gnu/bits/select.h"
	.byte	0x3
	.uleb128 0x1e
	.uleb128 0x34
	.byte	0x7
	.long	.Ldebug_macro41
	.byte	0x4
	.file 53 "/usr/include/x86_64-linux-gnu/bits/types/sigset_t.h"
	.byte	0x3
	.uleb128 0x21
	.uleb128 0x35
	.byte	0x5
	.uleb128 0x2
	.long	.LASF806
	.file 54 "/usr/include/x86_64-linux-gnu/bits/types/__sigset_t.h"
	.byte	0x3
	.uleb128 0x4
	.uleb128 0x36
	.byte	0x7
	.long	.Ldebug_macro42
	.byte	0x4
	.byte	0x4
	.file 55 "/usr/include/x86_64-linux-gnu/bits/types/struct_timeval.h"
	.byte	0x3
	.uleb128 0x25
	.uleb128 0x37
	.byte	0x5
	.uleb128 0x2
	.long	.LASF809
	.byte	0x4
	.file 56 "/usr/include/x86_64-linux-gnu/bits/types/struct_timespec.h"
	.byte	0x3
	.uleb128 0x27
	.uleb128 0x38
	.byte	0x5
	.uleb128 0x3
	.long	.LASF810
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro43
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro44
	.file 57 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h"
	.byte	0x3
	.uleb128 0xe3
	.uleb128 0x39
	.byte	0x5
	.uleb128 0x14
	.long	.LASF827
	.file 58 "/usr/include/x86_64-linux-gnu/bits/thread-shared-types.h"
	.byte	0x3
	.uleb128 0x17
	.uleb128 0x3a
	.byte	0x5
	.uleb128 0x14
	.long	.LASF828
	.file 59 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes-arch.h"
	.byte	0x3
	.uleb128 0x2c
	.uleb128 0x3b
	.byte	0x5
	.uleb128 0x13
	.long	.LASF829
	.byte	0x3
	.uleb128 0x15
	.uleb128 0x12
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro45
	.byte	0x4
	.file 60 "/usr/include/x86_64-linux-gnu/bits/atomic_wide_counter.h"
	.byte	0x3
	.uleb128 0x2e
	.uleb128 0x3c
	.byte	0x5
	.uleb128 0x14
	.long	.LASF841
	.byte	0x4
	.file 61 "/usr/include/x86_64-linux-gnu/bits/struct_mutex.h"
	.byte	0x3
	.uleb128 0x4c
	.uleb128 0x3d
	.byte	0x7
	.long	.Ldebug_macro46
	.byte	0x4
	.file 62 "/usr/include/x86_64-linux-gnu/bits/struct_rwlock.h"
	.byte	0x3
	.uleb128 0x59
	.uleb128 0x3e
	.byte	0x7
	.long	.Ldebug_macro47
	.byte	0x4
	.byte	0x5
	.uleb128 0x71
	.long	.LASF848
	.byte	0x4
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF849
	.byte	0x4
	.byte	0x4
	.file 63 "/usr/include/alloca.h"
	.byte	0x3
	.uleb128 0x23e
	.uleb128 0x3f
	.byte	0x7
	.long	.Ldebug_macro48
	.byte	0x3
	.uleb128 0x18
	.uleb128 0x2
	.byte	0x7
	.long	.Ldebug_macro28
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro49
	.byte	0x4
	.byte	0x5
	.uleb128 0x32f
	.long	.LASF853
	.file 64 "/usr/include/x86_64-linux-gnu/bits/stdlib-float.h"
	.byte	0x3
	.uleb128 0x3ff
	.uleb128 0x40
	.byte	0x4
	.byte	0x4
	.byte	0x3
	.uleb128 0x19
	.uleb128 0xb
	.byte	0x7
	.long	.Ldebug_macro50
	.file 65 "/usr/include/x86_64-linux-gnu/bits/posix_opt.h"
	.byte	0x3
	.uleb128 0xca
	.uleb128 0x41
	.byte	0x7
	.long	.Ldebug_macro51
	.byte	0x4
	.file 66 "/usr/include/x86_64-linux-gnu/bits/environments.h"
	.byte	0x3
	.uleb128 0xce
	.uleb128 0x42
	.byte	0x3
	.uleb128 0x16
	.uleb128 0x12
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro52
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro53
	.byte	0x3
	.uleb128 0xe2
	.uleb128 0x2
	.byte	0x7
	.long	.Ldebug_macro26
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro54
	.file 67 "/usr/include/x86_64-linux-gnu/bits/confname.h"
	.byte	0x3
	.uleb128 0x276
	.uleb128 0x43
	.byte	0x7
	.long	.Ldebug_macro55
	.byte	0x4
	.file 68 "/usr/include/x86_64-linux-gnu/bits/getopt_posix.h"
	.byte	0x3
	.uleb128 0x387
	.uleb128 0x44
	.byte	0x5
	.uleb128 0x15
	.long	.LASF1264
	.byte	0x3
	.uleb128 0x1b
	.uleb128 0xc
	.byte	0x5
	.uleb128 0x15
	.long	.LASF1265
	.byte	0x4
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro56
	.file 69 "/usr/include/x86_64-linux-gnu/bits/unistd_ext.h"
	.byte	0x3
	.uleb128 0x4c2
	.uleb128 0x45
	.byte	0x4
	.byte	0x4
	.byte	0x3
	.uleb128 0x1a
	.uleb128 0x6
	.byte	0x7
	.long	.Ldebug_macro57
	.file 70 "/usr/include/ncurses_dll.h"
	.byte	0x3
	.uleb128 0x59
	.uleb128 0x46
	.byte	0x7
	.long	.Ldebug_macro58
	.byte	0x4
	.file 71 "/usr/lib/gcc/x86_64-linux-gnu/11/include/stdint.h"
	.byte	0x3
	.uleb128 0x5f
	.uleb128 0x47
	.file 72 "/usr/include/stdint.h"
	.byte	0x3
	.uleb128 0x9
	.uleb128 0x48
	.byte	0x7
	.long	.Ldebug_macro59
	.byte	0x3
	.uleb128 0x1a
	.uleb128 0xf
	.byte	0x7
	.long	.Ldebug_macro24
	.byte	0x4
	.file 73 "/usr/include/x86_64-linux-gnu/bits/wchar.h"
	.byte	0x3
	.uleb128 0x1c
	.uleb128 0x49
	.byte	0x7
	.long	.Ldebug_macro60
	.byte	0x4
	.byte	0x3
	.uleb128 0x1d
	.uleb128 0x12
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.file 74 "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h"
	.byte	0x3
	.uleb128 0x25
	.uleb128 0x4a
	.byte	0x5
	.uleb128 0x14
	.long	.LASF1292
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro61
	.byte	0x4
	.byte	0x5
	.uleb128 0xd
	.long	.LASF1354
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro62
	.byte	0x3
	.uleb128 0xf9
	.uleb128 0x18
	.byte	0x7
	.long	.Ldebug_macro63
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro64
	.file 75 "/usr/lib/gcc/x86_64-linux-gnu/11/include/stdbool.h"
	.byte	0x3
	.uleb128 0x11a
	.uleb128 0x4b
	.byte	0x7
	.long	.Ldebug_macro65
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro66
	.file 76 "/usr/include/unctrl.h"
	.byte	0x3
	.uleb128 0x830
	.uleb128 0x4c
	.byte	0x7
	.long	.Ldebug_macro67
	.byte	0x3
	.uleb128 0x37
	.uleb128 0x6
	.byte	0x4
	.byte	0x6
	.uleb128 0x39
	.long	.LASF1831
	.byte	0x4
	.byte	0x4
	.byte	0x3
	.uleb128 0x1b
	.uleb128 0x8
	.byte	0x7
	.long	.Ldebug_macro68
	.byte	0x4
	.byte	0x3
	.uleb128 0x1c
	.uleb128 0xa
	.byte	0x7
	.long	.Ldebug_macro69
	.byte	0x4
	.file 77 "/home/jscha/dvp/cpumon/src/../include/machine_specific_registers.h"
	.byte	0x3
	.uleb128 0x1d
	.uleb128 0x4d
	.byte	0x7
	.long	.Ldebug_macro70
	.byte	0x4
	.byte	0x3
	.uleb128 0x1e
	.uleb128 0x9
	.byte	0x5
	.uleb128 0x2
	.long	.LASF1876
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
	.section	.debug_macro,"G",@progbits,wm4.string.h.23.93403f89af7dba8212345449bb14b09d,comdat
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
	.section	.debug_macro,"G",@progbits,wm4.string.h.31.e39a94e203ad4e1d978c0fc68ce016ee,comdat
.Ldebug_macro25:
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
.Ldebug_macro26:
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
.Ldebug_macro27:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x13
	.long	.LASF699
	.byte	0x5
	.uleb128 0x16
	.long	.LASF543
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stddef.h.231.0adce5c8c1fd8096aaff50981b3d1f0f,comdat
.Ldebug_macro28:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0xe7
	.long	.LASF562
	.byte	0x6
	.uleb128 0x191
	.long	.LASF565
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdlib.h.29.dde59e751a3b6c4506ba901b60a85c87,comdat
.Ldebug_macro29:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF543
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF700
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF544
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stddef.h.231.ac1e89356001c54fbeb8aaa0d15e8b3c,comdat
.Ldebug_macro30:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0xe7
	.long	.LASF562
	.byte	0x5
	.uleb128 0x104
	.long	.LASF701
	.byte	0x5
	.uleb128 0x105
	.long	.LASF702
	.byte	0x5
	.uleb128 0x106
	.long	.LASF703
	.byte	0x5
	.uleb128 0x107
	.long	.LASF704
	.byte	0x5
	.uleb128 0x108
	.long	.LASF705
	.byte	0x5
	.uleb128 0x109
	.long	.LASF706
	.byte	0x5
	.uleb128 0x10a
	.long	.LASF707
	.byte	0x5
	.uleb128 0x10b
	.long	.LASF708
	.byte	0x5
	.uleb128 0x10c
	.long	.LASF709
	.byte	0x5
	.uleb128 0x10d
	.long	.LASF710
	.byte	0x5
	.uleb128 0x10e
	.long	.LASF711
	.byte	0x5
	.uleb128 0x10f
	.long	.LASF712
	.byte	0x5
	.uleb128 0x110
	.long	.LASF713
	.byte	0x5
	.uleb128 0x111
	.long	.LASF714
	.byte	0x5
	.uleb128 0x112
	.long	.LASF715
	.byte	0x6
	.uleb128 0x11f
	.long	.LASF716
	.byte	0x6
	.uleb128 0x154
	.long	.LASF717
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
.Ldebug_macro31:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x19
	.long	.LASF719
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF720
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF721
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF722
	.byte	0x5
	.uleb128 0x20
	.long	.LASF723
	.byte	0x5
	.uleb128 0x21
	.long	.LASF724
	.byte	0x5
	.uleb128 0x24
	.long	.LASF725
	.byte	0x5
	.uleb128 0x26
	.long	.LASF726
	.byte	0x5
	.uleb128 0x27
	.long	.LASF727
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.waitstatus.h.28.93f167f49d64e2b9b99f98d1162a93bf,comdat
.Ldebug_macro32:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF728
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF729
	.byte	0x5
	.uleb128 0x22
	.long	.LASF730
	.byte	0x5
	.uleb128 0x25
	.long	.LASF731
	.byte	0x5
	.uleb128 0x28
	.long	.LASF732
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF733
	.byte	0x5
	.uleb128 0x31
	.long	.LASF734
	.byte	0x5
	.uleb128 0x35
	.long	.LASF735
	.byte	0x5
	.uleb128 0x38
	.long	.LASF736
	.byte	0x5
	.uleb128 0x39
	.long	.LASF737
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF738
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF739
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdlib.h.44.fc9d051d38577d71bf2818359e56065c,comdat
.Ldebug_macro33:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF740
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF741
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF742
	.byte	0x5
	.uleb128 0x2f
	.long	.LASF743
	.byte	0x5
	.uleb128 0x30
	.long	.LASF744
	.byte	0x5
	.uleb128 0x31
	.long	.LASF745
	.byte	0x5
	.uleb128 0x33
	.long	.LASF746
	.byte	0x5
	.uleb128 0x48
	.long	.LASF747
	.byte	0x5
	.uleb128 0x52
	.long	.LASF748
	.byte	0x5
	.uleb128 0x57
	.long	.LASF749
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF750
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF751
	.byte	0x5
	.uleb128 0x61
	.long	.LASF752
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.types.h.23.882ecbf54662e1f16e101552381a65da,comdat
.Ldebug_macro34:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x17
	.long	.LASF753
	.byte	0x5
	.uleb128 0x28
	.long	.LASF754
	.byte	0x5
	.uleb128 0x33
	.long	.LASF755
	.byte	0x5
	.uleb128 0x3c
	.long	.LASF756
	.byte	0x5
	.uleb128 0x41
	.long	.LASF757
	.byte	0x5
	.uleb128 0x46
	.long	.LASF758
	.byte	0x5
	.uleb128 0x4b
	.long	.LASF759
	.byte	0x5
	.uleb128 0x50
	.long	.LASF760
	.byte	0x5
	.uleb128 0x62
	.long	.LASF761
	.byte	0x5
	.uleb128 0x68
	.long	.LASF762
	.byte	0x5
	.uleb128 0x74
	.long	.LASF763
	.byte	0x5
	.uleb128 0x7a
	.long	.LASF764
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.endian.h.20.efabd1018df5d7b4052c27dc6bdd5ce5,comdat
.Ldebug_macro35:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.long	.LASF772
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF773
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF774
	.byte	0x5
	.uleb128 0x20
	.long	.LASF775
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.endianness.h.2.2c6a211f7909f3af5e9e9cfa3b6b63c8,comdat
.Ldebug_macro36:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x2
	.long	.LASF776
	.byte	0x5
	.uleb128 0x9
	.long	.LASF777
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.endian.h.40.9e5d395adda2f4eb53ae69b69b664084,comdat
.Ldebug_macro37:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x28
	.long	.LASF778
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF779
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.endian.h.27.4c4f94262c4eaee2982fe00ed1b4f173,comdat
.Ldebug_macro38:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF780
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF781
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF782
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF783
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.byteswap.h.24.5363c019348146aada5aeadf51456576,comdat
.Ldebug_macro39:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x18
	.long	.LASF784
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF785
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF786
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF787
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.endian.h.39.30a606dbd99b6c3df61c1f06dbdabd4e,comdat
.Ldebug_macro40:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x27
	.long	.LASF789
	.byte	0x5
	.uleb128 0x28
	.long	.LASF790
	.byte	0x5
	.uleb128 0x29
	.long	.LASF791
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF792
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF793
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF794
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF795
	.byte	0x5
	.uleb128 0x2f
	.long	.LASF796
	.byte	0x5
	.uleb128 0x31
	.long	.LASF797
	.byte	0x5
	.uleb128 0x32
	.long	.LASF798
	.byte	0x5
	.uleb128 0x33
	.long	.LASF799
	.byte	0x5
	.uleb128 0x34
	.long	.LASF800
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.select.h.25.df647f04fce2d846f134ede6a14ddf91,comdat
.Ldebug_macro41:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x19
	.long	.LASF802
	.byte	0x5
	.uleb128 0x20
	.long	.LASF803
	.byte	0x5
	.uleb128 0x22
	.long	.LASF804
	.byte	0x5
	.uleb128 0x24
	.long	.LASF805
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.__sigset_t.h.2.6b1ab6ff3d7b8fd9c0c42b0d80afbd80,comdat
.Ldebug_macro42:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x2
	.long	.LASF807
	.byte	0x5
	.uleb128 0x4
	.long	.LASF808
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.select.h.44.887a4ff60aa97fcd9c1be017735e1675,comdat
.Ldebug_macro43:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF811
	.byte	0x6
	.uleb128 0x34
	.long	.LASF812
	.byte	0x5
	.uleb128 0x36
	.long	.LASF813
	.byte	0x5
	.uleb128 0x37
	.long	.LASF814
	.byte	0x5
	.uleb128 0x38
	.long	.LASF815
	.byte	0x5
	.uleb128 0x44
	.long	.LASF816
	.byte	0x5
	.uleb128 0x49
	.long	.LASF817
	.byte	0x5
	.uleb128 0x50
	.long	.LASF818
	.byte	0x5
	.uleb128 0x55
	.long	.LASF819
	.byte	0x5
	.uleb128 0x56
	.long	.LASF820
	.byte	0x5
	.uleb128 0x57
	.long	.LASF821
	.byte	0x5
	.uleb128 0x58
	.long	.LASF822
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.types.h.186.489a4ed8f2d29cd358843490f54ddea5,comdat
.Ldebug_macro44:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xba
	.long	.LASF823
	.byte	0x5
	.uleb128 0xc1
	.long	.LASF824
	.byte	0x5
	.uleb128 0xc5
	.long	.LASF825
	.byte	0x5
	.uleb128 0xc9
	.long	.LASF826
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.pthreadtypesarch.h.25.6063cba99664c916e22d3a912bcc348a,comdat
.Ldebug_macro45:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x19
	.long	.LASF830
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF831
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF832
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF833
	.byte	0x5
	.uleb128 0x29
	.long	.LASF834
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF835
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF836
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF837
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF838
	.byte	0x5
	.uleb128 0x2f
	.long	.LASF839
	.byte	0x5
	.uleb128 0x30
	.long	.LASF840
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.struct_mutex.h.20.ed51f515172b9be99e450ba83eb5dd99,comdat
.Ldebug_macro46:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.long	.LASF842
	.byte	0x5
	.uleb128 0x25
	.long	.LASF843
	.byte	0x5
	.uleb128 0x38
	.long	.LASF844
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.struct_rwlock.h.21.0254880f2904e3833fb8ae683e0f0330,comdat
.Ldebug_macro47:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x15
	.long	.LASF845
	.byte	0x5
	.uleb128 0x28
	.long	.LASF846
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF847
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.alloca.h.19.edefa922a76c1cbaaf1e416903ba2d1c,comdat
.Ldebug_macro48:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x13
	.long	.LASF850
	.byte	0x5
	.uleb128 0x17
	.long	.LASF543
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.alloca.h.29.156e12058824cc23d961c4d3b13031f6,comdat
.Ldebug_macro49:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x1d
	.long	.LASF851
	.byte	0x5
	.uleb128 0x23
	.long	.LASF852
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.unistd.h.23.e34f3a5c100123d9385c8b91a86a6783,comdat
.Ldebug_macro50:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x17
	.long	.LASF854
	.byte	0x5
	.uleb128 0x22
	.long	.LASF855
	.byte	0x5
	.uleb128 0x35
	.long	.LASF856
	.byte	0x5
	.uleb128 0x43
	.long	.LASF857
	.byte	0x5
	.uleb128 0x46
	.long	.LASF858
	.byte	0x5
	.uleb128 0x4a
	.long	.LASF859
	.byte	0x5
	.uleb128 0x4e
	.long	.LASF860
	.byte	0x5
	.uleb128 0x52
	.long	.LASF861
	.byte	0x5
	.uleb128 0x56
	.long	.LASF862
	.byte	0x5
	.uleb128 0x5a
	.long	.LASF863
	.byte	0x5
	.uleb128 0x64
	.long	.LASF864
	.byte	0x5
	.uleb128 0x67
	.long	.LASF865
	.byte	0x5
	.uleb128 0x68
	.long	.LASF866
	.byte	0x5
	.uleb128 0x69
	.long	.LASF867
	.byte	0x5
	.uleb128 0x6c
	.long	.LASF868
	.byte	0x5
	.uleb128 0x70
	.long	.LASF869
	.byte	0x5
	.uleb128 0x73
	.long	.LASF870
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.posix_opt.h.20.21a42956ee7763f6aa309b86c7756272,comdat
.Ldebug_macro51:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.long	.LASF871
	.byte	0x5
	.uleb128 0x17
	.long	.LASF872
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF873
	.byte	0x5
	.uleb128 0x20
	.long	.LASF874
	.byte	0x5
	.uleb128 0x23
	.long	.LASF875
	.byte	0x5
	.uleb128 0x26
	.long	.LASF876
	.byte	0x5
	.uleb128 0x29
	.long	.LASF877
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF878
	.byte	0x5
	.uleb128 0x2f
	.long	.LASF879
	.byte	0x5
	.uleb128 0x32
	.long	.LASF880
	.byte	0x5
	.uleb128 0x35
	.long	.LASF881
	.byte	0x5
	.uleb128 0x39
	.long	.LASF882
	.byte	0x5
	.uleb128 0x3c
	.long	.LASF883
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF884
	.byte	0x5
	.uleb128 0x42
	.long	.LASF885
	.byte	0x5
	.uleb128 0x45
	.long	.LASF886
	.byte	0x5
	.uleb128 0x48
	.long	.LASF887
	.byte	0x5
	.uleb128 0x4b
	.long	.LASF888
	.byte	0x5
	.uleb128 0x4c
	.long	.LASF889
	.byte	0x5
	.uleb128 0x4f
	.long	.LASF890
	.byte	0x5
	.uleb128 0x52
	.long	.LASF891
	.byte	0x5
	.uleb128 0x55
	.long	.LASF892
	.byte	0x5
	.uleb128 0x58
	.long	.LASF893
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF894
	.byte	0x5
	.uleb128 0x60
	.long	.LASF895
	.byte	0x5
	.uleb128 0x63
	.long	.LASF896
	.byte	0x5
	.uleb128 0x67
	.long	.LASF897
	.byte	0x5
	.uleb128 0x6a
	.long	.LASF898
	.byte	0x5
	.uleb128 0x6d
	.long	.LASF899
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF900
	.byte	0x5
	.uleb128 0x70
	.long	.LASF901
	.byte	0x5
	.uleb128 0x72
	.long	.LASF902
	.byte	0x5
	.uleb128 0x75
	.long	.LASF903
	.byte	0x5
	.uleb128 0x78
	.long	.LASF904
	.byte	0x5
	.uleb128 0x79
	.long	.LASF905
	.byte	0x5
	.uleb128 0x7a
	.long	.LASF906
	.byte	0x5
	.uleb128 0x7d
	.long	.LASF907
	.byte	0x5
	.uleb128 0x80
	.long	.LASF908
	.byte	0x5
	.uleb128 0x83
	.long	.LASF909
	.byte	0x5
	.uleb128 0x86
	.long	.LASF910
	.byte	0x5
	.uleb128 0x89
	.long	.LASF911
	.byte	0x5
	.uleb128 0x8c
	.long	.LASF912
	.byte	0x5
	.uleb128 0x8f
	.long	.LASF913
	.byte	0x5
	.uleb128 0x92
	.long	.LASF914
	.byte	0x5
	.uleb128 0x95
	.long	.LASF915
	.byte	0x5
	.uleb128 0x98
	.long	.LASF916
	.byte	0x5
	.uleb128 0x9b
	.long	.LASF917
	.byte	0x5
	.uleb128 0x9e
	.long	.LASF918
	.byte	0x5
	.uleb128 0xa1
	.long	.LASF919
	.byte	0x5
	.uleb128 0xa4
	.long	.LASF920
	.byte	0x5
	.uleb128 0xa7
	.long	.LASF921
	.byte	0x5
	.uleb128 0xaa
	.long	.LASF922
	.byte	0x5
	.uleb128 0xad
	.long	.LASF923
	.byte	0x5
	.uleb128 0xb0
	.long	.LASF924
	.byte	0x5
	.uleb128 0xb3
	.long	.LASF925
	.byte	0x5
	.uleb128 0xb6
	.long	.LASF926
	.byte	0x5
	.uleb128 0xb7
	.long	.LASF927
	.byte	0x5
	.uleb128 0xba
	.long	.LASF928
	.byte	0x5
	.uleb128 0xbb
	.long	.LASF929
	.byte	0x5
	.uleb128 0xbc
	.long	.LASF930
	.byte	0x5
	.uleb128 0xbd
	.long	.LASF931
	.byte	0x5
	.uleb128 0xc0
	.long	.LASF932
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.environments.h.56.c5802092ccc191baeb41f8d355bb878f,comdat
.Ldebug_macro52:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x38
	.long	.LASF933
	.byte	0x5
	.uleb128 0x39
	.long	.LASF934
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF935
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF936
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF937
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF938
	.byte	0x5
	.uleb128 0x5f
	.long	.LASF939
	.byte	0x5
	.uleb128 0x60
	.long	.LASF940
	.byte	0x5
	.uleb128 0x65
	.long	.LASF941
	.byte	0x5
	.uleb128 0x66
	.long	.LASF942
	.byte	0x5
	.uleb128 0x68
	.long	.LASF943
	.byte	0x5
	.uleb128 0x69
	.long	.LASF944
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.unistd.h.210.b40c6c15db1d0b653f8dce03f258da9c,comdat
.Ldebug_macro53:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xd2
	.long	.LASF945
	.byte	0x5
	.uleb128 0xd3
	.long	.LASF946
	.byte	0x5
	.uleb128 0xd4
	.long	.LASF947
	.byte	0x5
	.uleb128 0xe0
	.long	.LASF543
	.byte	0x5
	.uleb128 0xe1
	.long	.LASF544
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.unistd.h.256.afd745de2c03742f75ac85ed821b1299,comdat
.Ldebug_macro54:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x100
	.long	.LASF948
	.byte	0x5
	.uleb128 0x10c
	.long	.LASF949
	.byte	0x5
	.uleb128 0x113
	.long	.LASF950
	.byte	0x5
	.uleb128 0x119
	.long	.LASF951
	.byte	0x5
	.uleb128 0x11a
	.long	.LASF952
	.byte	0x5
	.uleb128 0x11b
	.long	.LASF953
	.byte	0x5
	.uleb128 0x11c
	.long	.LASF954
	.byte	0x5
	.uleb128 0x147
	.long	.LASF955
	.byte	0x5
	.uleb128 0x148
	.long	.LASF956
	.byte	0x5
	.uleb128 0x149
	.long	.LASF957
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.confname.h.27.257966e7e49af2ab4cb41132b3606cbf,comdat
.Ldebug_macro55:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF958
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF959
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF960
	.byte	0x5
	.uleb128 0x21
	.long	.LASF961
	.byte	0x5
	.uleb128 0x23
	.long	.LASF962
	.byte	0x5
	.uleb128 0x25
	.long	.LASF963
	.byte	0x5
	.uleb128 0x27
	.long	.LASF964
	.byte	0x5
	.uleb128 0x29
	.long	.LASF965
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF966
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF967
	.byte	0x5
	.uleb128 0x2f
	.long	.LASF968
	.byte	0x5
	.uleb128 0x31
	.long	.LASF969
	.byte	0x5
	.uleb128 0x33
	.long	.LASF970
	.byte	0x5
	.uleb128 0x35
	.long	.LASF971
	.byte	0x5
	.uleb128 0x37
	.long	.LASF972
	.byte	0x5
	.uleb128 0x39
	.long	.LASF973
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF974
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF975
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF976
	.byte	0x5
	.uleb128 0x41
	.long	.LASF977
	.byte	0x5
	.uleb128 0x43
	.long	.LASF978
	.byte	0x5
	.uleb128 0x4a
	.long	.LASF979
	.byte	0x5
	.uleb128 0x4c
	.long	.LASF980
	.byte	0x5
	.uleb128 0x4e
	.long	.LASF981
	.byte	0x5
	.uleb128 0x50
	.long	.LASF982
	.byte	0x5
	.uleb128 0x52
	.long	.LASF983
	.byte	0x5
	.uleb128 0x54
	.long	.LASF984
	.byte	0x5
	.uleb128 0x56
	.long	.LASF985
	.byte	0x5
	.uleb128 0x58
	.long	.LASF986
	.byte	0x5
	.uleb128 0x5a
	.long	.LASF987
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF988
	.byte	0x5
	.uleb128 0x5e
	.long	.LASF989
	.byte	0x5
	.uleb128 0x60
	.long	.LASF990
	.byte	0x5
	.uleb128 0x62
	.long	.LASF991
	.byte	0x5
	.uleb128 0x64
	.long	.LASF992
	.byte	0x5
	.uleb128 0x66
	.long	.LASF993
	.byte	0x5
	.uleb128 0x68
	.long	.LASF994
	.byte	0x5
	.uleb128 0x6a
	.long	.LASF995
	.byte	0x5
	.uleb128 0x6c
	.long	.LASF996
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF997
	.byte	0x5
	.uleb128 0x70
	.long	.LASF998
	.byte	0x5
	.uleb128 0x72
	.long	.LASF999
	.byte	0x5
	.uleb128 0x74
	.long	.LASF1000
	.byte	0x5
	.uleb128 0x76
	.long	.LASF1001
	.byte	0x5
	.uleb128 0x78
	.long	.LASF1002
	.byte	0x5
	.uleb128 0x7a
	.long	.LASF1003
	.byte	0x5
	.uleb128 0x7c
	.long	.LASF1004
	.byte	0x5
	.uleb128 0x7e
	.long	.LASF1005
	.byte	0x5
	.uleb128 0x80
	.long	.LASF1006
	.byte	0x5
	.uleb128 0x82
	.long	.LASF1007
	.byte	0x5
	.uleb128 0x84
	.long	.LASF1008
	.byte	0x5
	.uleb128 0x86
	.long	.LASF1009
	.byte	0x5
	.uleb128 0x87
	.long	.LASF1010
	.byte	0x5
	.uleb128 0x89
	.long	.LASF1011
	.byte	0x5
	.uleb128 0x8b
	.long	.LASF1012
	.byte	0x5
	.uleb128 0x8d
	.long	.LASF1013
	.byte	0x5
	.uleb128 0x8f
	.long	.LASF1014
	.byte	0x5
	.uleb128 0x91
	.long	.LASF1015
	.byte	0x5
	.uleb128 0x96
	.long	.LASF1016
	.byte	0x5
	.uleb128 0x98
	.long	.LASF1017
	.byte	0x5
	.uleb128 0x9a
	.long	.LASF1018
	.byte	0x5
	.uleb128 0x9c
	.long	.LASF1019
	.byte	0x5
	.uleb128 0x9e
	.long	.LASF1020
	.byte	0x5
	.uleb128 0xa0
	.long	.LASF1021
	.byte	0x5
	.uleb128 0xa2
	.long	.LASF1022
	.byte	0x5
	.uleb128 0xa4
	.long	.LASF1023
	.byte	0x5
	.uleb128 0xa6
	.long	.LASF1024
	.byte	0x5
	.uleb128 0xa8
	.long	.LASF1025
	.byte	0x5
	.uleb128 0xab
	.long	.LASF1026
	.byte	0x5
	.uleb128 0xad
	.long	.LASF1027
	.byte	0x5
	.uleb128 0xaf
	.long	.LASF1028
	.byte	0x5
	.uleb128 0xb1
	.long	.LASF1029
	.byte	0x5
	.uleb128 0xb3
	.long	.LASF1030
	.byte	0x5
	.uleb128 0xb5
	.long	.LASF1031
	.byte	0x5
	.uleb128 0xb7
	.long	.LASF1032
	.byte	0x5
	.uleb128 0xba
	.long	.LASF1033
	.byte	0x5
	.uleb128 0xbc
	.long	.LASF1034
	.byte	0x5
	.uleb128 0xbe
	.long	.LASF1035
	.byte	0x5
	.uleb128 0xc0
	.long	.LASF1036
	.byte	0x5
	.uleb128 0xc2
	.long	.LASF1037
	.byte	0x5
	.uleb128 0xc4
	.long	.LASF1038
	.byte	0x5
	.uleb128 0xc6
	.long	.LASF1039
	.byte	0x5
	.uleb128 0xc8
	.long	.LASF1040
	.byte	0x5
	.uleb128 0xca
	.long	.LASF1041
	.byte	0x5
	.uleb128 0xcc
	.long	.LASF1042
	.byte	0x5
	.uleb128 0xce
	.long	.LASF1043
	.byte	0x5
	.uleb128 0xd0
	.long	.LASF1044
	.byte	0x5
	.uleb128 0xd2
	.long	.LASF1045
	.byte	0x5
	.uleb128 0xd4
	.long	.LASF1046
	.byte	0x5
	.uleb128 0xd6
	.long	.LASF1047
	.byte	0x5
	.uleb128 0xda
	.long	.LASF1048
	.byte	0x5
	.uleb128 0xdc
	.long	.LASF1049
	.byte	0x5
	.uleb128 0xde
	.long	.LASF1050
	.byte	0x5
	.uleb128 0xe0
	.long	.LASF1051
	.byte	0x5
	.uleb128 0xe2
	.long	.LASF1052
	.byte	0x5
	.uleb128 0xe4
	.long	.LASF1053
	.byte	0x5
	.uleb128 0xe6
	.long	.LASF1054
	.byte	0x5
	.uleb128 0xe8
	.long	.LASF1055
	.byte	0x5
	.uleb128 0xea
	.long	.LASF1056
	.byte	0x5
	.uleb128 0xec
	.long	.LASF1057
	.byte	0x5
	.uleb128 0xee
	.long	.LASF1058
	.byte	0x5
	.uleb128 0xf0
	.long	.LASF1059
	.byte	0x5
	.uleb128 0xf2
	.long	.LASF1060
	.byte	0x5
	.uleb128 0xf4
	.long	.LASF1061
	.byte	0x5
	.uleb128 0xf6
	.long	.LASF1062
	.byte	0x5
	.uleb128 0xf8
	.long	.LASF1063
	.byte	0x5
	.uleb128 0xfb
	.long	.LASF1064
	.byte	0x5
	.uleb128 0xfd
	.long	.LASF1065
	.byte	0x5
	.uleb128 0xff
	.long	.LASF1066
	.byte	0x5
	.uleb128 0x101
	.long	.LASF1067
	.byte	0x5
	.uleb128 0x103
	.long	.LASF1068
	.byte	0x5
	.uleb128 0x105
	.long	.LASF1069
	.byte	0x5
	.uleb128 0x108
	.long	.LASF1070
	.byte	0x5
	.uleb128 0x10a
	.long	.LASF1071
	.byte	0x5
	.uleb128 0x10c
	.long	.LASF1072
	.byte	0x5
	.uleb128 0x10e
	.long	.LASF1073
	.byte	0x5
	.uleb128 0x110
	.long	.LASF1074
	.byte	0x5
	.uleb128 0x112
	.long	.LASF1075
	.byte	0x5
	.uleb128 0x115
	.long	.LASF1076
	.byte	0x5
	.uleb128 0x117
	.long	.LASF1077
	.byte	0x5
	.uleb128 0x119
	.long	.LASF1078
	.byte	0x5
	.uleb128 0x11c
	.long	.LASF1079
	.byte	0x5
	.uleb128 0x11e
	.long	.LASF1080
	.byte	0x5
	.uleb128 0x120
	.long	.LASF1081
	.byte	0x5
	.uleb128 0x123
	.long	.LASF1082
	.byte	0x5
	.uleb128 0x125
	.long	.LASF1083
	.byte	0x5
	.uleb128 0x127
	.long	.LASF1084
	.byte	0x5
	.uleb128 0x129
	.long	.LASF1085
	.byte	0x5
	.uleb128 0x12b
	.long	.LASF1086
	.byte	0x5
	.uleb128 0x12d
	.long	.LASF1087
	.byte	0x5
	.uleb128 0x12f
	.long	.LASF1088
	.byte	0x5
	.uleb128 0x131
	.long	.LASF1089
	.byte	0x5
	.uleb128 0x133
	.long	.LASF1090
	.byte	0x5
	.uleb128 0x135
	.long	.LASF1091
	.byte	0x5
	.uleb128 0x137
	.long	.LASF1092
	.byte	0x5
	.uleb128 0x139
	.long	.LASF1093
	.byte	0x5
	.uleb128 0x13b
	.long	.LASF1094
	.byte	0x5
	.uleb128 0x13d
	.long	.LASF1095
	.byte	0x5
	.uleb128 0x13f
	.long	.LASF1096
	.byte	0x5
	.uleb128 0x141
	.long	.LASF1097
	.byte	0x5
	.uleb128 0x143
	.long	.LASF1098
	.byte	0x5
	.uleb128 0x145
	.long	.LASF1099
	.byte	0x5
	.uleb128 0x148
	.long	.LASF1100
	.byte	0x5
	.uleb128 0x14a
	.long	.LASF1101
	.byte	0x5
	.uleb128 0x14c
	.long	.LASF1102
	.byte	0x5
	.uleb128 0x14e
	.long	.LASF1103
	.byte	0x5
	.uleb128 0x150
	.long	.LASF1104
	.byte	0x5
	.uleb128 0x152
	.long	.LASF1105
	.byte	0x5
	.uleb128 0x155
	.long	.LASF1106
	.byte	0x5
	.uleb128 0x157
	.long	.LASF1107
	.byte	0x5
	.uleb128 0x159
	.long	.LASF1108
	.byte	0x5
	.uleb128 0x15b
	.long	.LASF1109
	.byte	0x5
	.uleb128 0x15e
	.long	.LASF1110
	.byte	0x5
	.uleb128 0x160
	.long	.LASF1111
	.byte	0x5
	.uleb128 0x162
	.long	.LASF1112
	.byte	0x5
	.uleb128 0x165
	.long	.LASF1113
	.byte	0x5
	.uleb128 0x167
	.long	.LASF1114
	.byte	0x5
	.uleb128 0x169
	.long	.LASF1115
	.byte	0x5
	.uleb128 0x16b
	.long	.LASF1116
	.byte	0x5
	.uleb128 0x16d
	.long	.LASF1117
	.byte	0x5
	.uleb128 0x16f
	.long	.LASF1118
	.byte	0x5
	.uleb128 0x171
	.long	.LASF1119
	.byte	0x5
	.uleb128 0x173
	.long	.LASF1120
	.byte	0x5
	.uleb128 0x175
	.long	.LASF1121
	.byte	0x5
	.uleb128 0x177
	.long	.LASF1122
	.byte	0x5
	.uleb128 0x179
	.long	.LASF1123
	.byte	0x5
	.uleb128 0x17b
	.long	.LASF1124
	.byte	0x5
	.uleb128 0x17d
	.long	.LASF1125
	.byte	0x5
	.uleb128 0x17f
	.long	.LASF1126
	.byte	0x5
	.uleb128 0x181
	.long	.LASF1127
	.byte	0x5
	.uleb128 0x183
	.long	.LASF1128
	.byte	0x5
	.uleb128 0x185
	.long	.LASF1129
	.byte	0x5
	.uleb128 0x187
	.long	.LASF1130
	.byte	0x5
	.uleb128 0x189
	.long	.LASF1131
	.byte	0x5
	.uleb128 0x18b
	.long	.LASF1132
	.byte	0x5
	.uleb128 0x18d
	.long	.LASF1133
	.byte	0x5
	.uleb128 0x18f
	.long	.LASF1134
	.byte	0x5
	.uleb128 0x191
	.long	.LASF1135
	.byte	0x5
	.uleb128 0x193
	.long	.LASF1136
	.byte	0x5
	.uleb128 0x195
	.long	.LASF1137
	.byte	0x5
	.uleb128 0x197
	.long	.LASF1138
	.byte	0x5
	.uleb128 0x199
	.long	.LASF1139
	.byte	0x5
	.uleb128 0x19b
	.long	.LASF1140
	.byte	0x5
	.uleb128 0x19d
	.long	.LASF1141
	.byte	0x5
	.uleb128 0x19f
	.long	.LASF1142
	.byte	0x5
	.uleb128 0x1a1
	.long	.LASF1143
	.byte	0x5
	.uleb128 0x1a3
	.long	.LASF1144
	.byte	0x5
	.uleb128 0x1a5
	.long	.LASF1145
	.byte	0x5
	.uleb128 0x1a7
	.long	.LASF1146
	.byte	0x5
	.uleb128 0x1a9
	.long	.LASF1147
	.byte	0x5
	.uleb128 0x1ab
	.long	.LASF1148
	.byte	0x5
	.uleb128 0x1ad
	.long	.LASF1149
	.byte	0x5
	.uleb128 0x1af
	.long	.LASF1150
	.byte	0x5
	.uleb128 0x1b1
	.long	.LASF1151
	.byte	0x5
	.uleb128 0x1b3
	.long	.LASF1152
	.byte	0x5
	.uleb128 0x1b5
	.long	.LASF1153
	.byte	0x5
	.uleb128 0x1b7
	.long	.LASF1154
	.byte	0x5
	.uleb128 0x1b9
	.long	.LASF1155
	.byte	0x5
	.uleb128 0x1bb
	.long	.LASF1156
	.byte	0x5
	.uleb128 0x1be
	.long	.LASF1157
	.byte	0x5
	.uleb128 0x1c0
	.long	.LASF1158
	.byte	0x5
	.uleb128 0x1c2
	.long	.LASF1159
	.byte	0x5
	.uleb128 0x1c4
	.long	.LASF1160
	.byte	0x5
	.uleb128 0x1c7
	.long	.LASF1161
	.byte	0x5
	.uleb128 0x1c9
	.long	.LASF1162
	.byte	0x5
	.uleb128 0x1cb
	.long	.LASF1163
	.byte	0x5
	.uleb128 0x1cd
	.long	.LASF1164
	.byte	0x5
	.uleb128 0x1cf
	.long	.LASF1165
	.byte	0x5
	.uleb128 0x1d2
	.long	.LASF1166
	.byte	0x5
	.uleb128 0x1d4
	.long	.LASF1167
	.byte	0x5
	.uleb128 0x1d6
	.long	.LASF1168
	.byte	0x5
	.uleb128 0x1d8
	.long	.LASF1169
	.byte	0x5
	.uleb128 0x1da
	.long	.LASF1170
	.byte	0x5
	.uleb128 0x1dc
	.long	.LASF1171
	.byte	0x5
	.uleb128 0x1de
	.long	.LASF1172
	.byte	0x5
	.uleb128 0x1e0
	.long	.LASF1173
	.byte	0x5
	.uleb128 0x1e2
	.long	.LASF1174
	.byte	0x5
	.uleb128 0x1e4
	.long	.LASF1175
	.byte	0x5
	.uleb128 0x1e6
	.long	.LASF1176
	.byte	0x5
	.uleb128 0x1e8
	.long	.LASF1177
	.byte	0x5
	.uleb128 0x1ea
	.long	.LASF1178
	.byte	0x5
	.uleb128 0x1ec
	.long	.LASF1179
	.byte	0x5
	.uleb128 0x1ee
	.long	.LASF1180
	.byte	0x5
	.uleb128 0x1f2
	.long	.LASF1181
	.byte	0x5
	.uleb128 0x1f4
	.long	.LASF1182
	.byte	0x5
	.uleb128 0x1f7
	.long	.LASF1183
	.byte	0x5
	.uleb128 0x1f9
	.long	.LASF1184
	.byte	0x5
	.uleb128 0x1fb
	.long	.LASF1185
	.byte	0x5
	.uleb128 0x1fd
	.long	.LASF1186
	.byte	0x5
	.uleb128 0x200
	.long	.LASF1187
	.byte	0x5
	.uleb128 0x203
	.long	.LASF1188
	.byte	0x5
	.uleb128 0x205
	.long	.LASF1189
	.byte	0x5
	.uleb128 0x207
	.long	.LASF1190
	.byte	0x5
	.uleb128 0x209
	.long	.LASF1191
	.byte	0x5
	.uleb128 0x20c
	.long	.LASF1192
	.byte	0x5
	.uleb128 0x20f
	.long	.LASF1193
	.byte	0x5
	.uleb128 0x211
	.long	.LASF1194
	.byte	0x5
	.uleb128 0x214
	.long	.LASF1195
	.byte	0x5
	.uleb128 0x217
	.long	.LASF1196
	.byte	0x5
	.uleb128 0x21e
	.long	.LASF1197
	.byte	0x5
	.uleb128 0x221
	.long	.LASF1198
	.byte	0x5
	.uleb128 0x222
	.long	.LASF1199
	.byte	0x5
	.uleb128 0x225
	.long	.LASF1200
	.byte	0x5
	.uleb128 0x227
	.long	.LASF1201
	.byte	0x5
	.uleb128 0x22a
	.long	.LASF1202
	.byte	0x5
	.uleb128 0x22b
	.long	.LASF1203
	.byte	0x5
	.uleb128 0x22e
	.long	.LASF1204
	.byte	0x5
	.uleb128 0x22f
	.long	.LASF1205
	.byte	0x5
	.uleb128 0x232
	.long	.LASF1206
	.byte	0x5
	.uleb128 0x234
	.long	.LASF1207
	.byte	0x5
	.uleb128 0x236
	.long	.LASF1208
	.byte	0x5
	.uleb128 0x238
	.long	.LASF1209
	.byte	0x5
	.uleb128 0x23a
	.long	.LASF1210
	.byte	0x5
	.uleb128 0x23c
	.long	.LASF1211
	.byte	0x5
	.uleb128 0x23e
	.long	.LASF1212
	.byte	0x5
	.uleb128 0x240
	.long	.LASF1213
	.byte	0x5
	.uleb128 0x243
	.long	.LASF1214
	.byte	0x5
	.uleb128 0x245
	.long	.LASF1215
	.byte	0x5
	.uleb128 0x247
	.long	.LASF1216
	.byte	0x5
	.uleb128 0x249
	.long	.LASF1217
	.byte	0x5
	.uleb128 0x24b
	.long	.LASF1218
	.byte	0x5
	.uleb128 0x24d
	.long	.LASF1219
	.byte	0x5
	.uleb128 0x24f
	.long	.LASF1220
	.byte	0x5
	.uleb128 0x251
	.long	.LASF1221
	.byte	0x5
	.uleb128 0x253
	.long	.LASF1222
	.byte	0x5
	.uleb128 0x255
	.long	.LASF1223
	.byte	0x5
	.uleb128 0x257
	.long	.LASF1224
	.byte	0x5
	.uleb128 0x259
	.long	.LASF1225
	.byte	0x5
	.uleb128 0x25b
	.long	.LASF1226
	.byte	0x5
	.uleb128 0x25d
	.long	.LASF1227
	.byte	0x5
	.uleb128 0x25f
	.long	.LASF1228
	.byte	0x5
	.uleb128 0x261
	.long	.LASF1229
	.byte	0x5
	.uleb128 0x264
	.long	.LASF1230
	.byte	0x5
	.uleb128 0x266
	.long	.LASF1231
	.byte	0x5
	.uleb128 0x268
	.long	.LASF1232
	.byte	0x5
	.uleb128 0x26a
	.long	.LASF1233
	.byte	0x5
	.uleb128 0x26c
	.long	.LASF1234
	.byte	0x5
	.uleb128 0x26e
	.long	.LASF1235
	.byte	0x5
	.uleb128 0x270
	.long	.LASF1236
	.byte	0x5
	.uleb128 0x272
	.long	.LASF1237
	.byte	0x5
	.uleb128 0x274
	.long	.LASF1238
	.byte	0x5
	.uleb128 0x276
	.long	.LASF1239
	.byte	0x5
	.uleb128 0x278
	.long	.LASF1240
	.byte	0x5
	.uleb128 0x27a
	.long	.LASF1241
	.byte	0x5
	.uleb128 0x27c
	.long	.LASF1242
	.byte	0x5
	.uleb128 0x27e
	.long	.LASF1243
	.byte	0x5
	.uleb128 0x280
	.long	.LASF1244
	.byte	0x5
	.uleb128 0x282
	.long	.LASF1245
	.byte	0x5
	.uleb128 0x285
	.long	.LASF1246
	.byte	0x5
	.uleb128 0x287
	.long	.LASF1247
	.byte	0x5
	.uleb128 0x289
	.long	.LASF1248
	.byte	0x5
	.uleb128 0x28b
	.long	.LASF1249
	.byte	0x5
	.uleb128 0x28d
	.long	.LASF1250
	.byte	0x5
	.uleb128 0x28f
	.long	.LASF1251
	.byte	0x5
	.uleb128 0x291
	.long	.LASF1252
	.byte	0x5
	.uleb128 0x293
	.long	.LASF1253
	.byte	0x5
	.uleb128 0x295
	.long	.LASF1254
	.byte	0x5
	.uleb128 0x297
	.long	.LASF1255
	.byte	0x5
	.uleb128 0x299
	.long	.LASF1256
	.byte	0x5
	.uleb128 0x29b
	.long	.LASF1257
	.byte	0x5
	.uleb128 0x29d
	.long	.LASF1258
	.byte	0x5
	.uleb128 0x29f
	.long	.LASF1259
	.byte	0x5
	.uleb128 0x2a1
	.long	.LASF1260
	.byte	0x5
	.uleb128 0x2a3
	.long	.LASF1261
	.byte	0x5
	.uleb128 0x2a6
	.long	.LASF1262
	.byte	0x5
	.uleb128 0x2a8
	.long	.LASF1263
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.unistd.h.1108.0d9b49b7dac9f8f76c53696f4c15e077,comdat
.Ldebug_macro56:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x454
	.long	.LASF1266
	.byte	0x5
	.uleb128 0x455
	.long	.LASF1267
	.byte	0x5
	.uleb128 0x456
	.long	.LASF1268
	.byte	0x5
	.uleb128 0x457
	.long	.LASF1269
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.curses.h.39.3b102e3630033b221c3e41b51ca3db05,comdat
.Ldebug_macro57:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x27
	.long	.LASF1270
	.byte	0x5
	.uleb128 0x45
	.long	.LASF1271
	.byte	0x5
	.uleb128 0x46
	.long	.LASF1272
	.byte	0x5
	.uleb128 0x49
	.long	.LASF1273
	.byte	0x5
	.uleb128 0x4a
	.long	.LASF1274
	.byte	0x5
	.uleb128 0x4b
	.long	.LASF1275
	.byte	0x6
	.uleb128 0x4e
	.long	.LASF1276
	.byte	0x5
	.uleb128 0x4f
	.long	.LASF1277
	.byte	0x5
	.uleb128 0x54
	.long	.LASF1278
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.ncurses_dll.h.32.4f7d5f75878767130cff27603ec5ce98,comdat
.Ldebug_macro58:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x20
	.long	.LASF1279
	.byte	0x5
	.uleb128 0x44
	.long	.LASF1280
	.byte	0x5
	.uleb128 0x49
	.long	.LASF1281
	.byte	0x5
	.uleb128 0x4c
	.long	.LASF1282
	.byte	0x5
	.uleb128 0x4e
	.long	.LASF1283
	.byte	0x5
	.uleb128 0x4f
	.long	.LASF1284
	.byte	0x5
	.uleb128 0x5e
	.long	.LASF1285
	.byte	0x5
	.uleb128 0x5f
	.long	.LASF1286
	.byte	0x5
	.uleb128 0x60
	.long	.LASF1287
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdint.h.23.022efde71688fcb285fe42cc87d41ee3,comdat
.Ldebug_macro59:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x17
	.long	.LASF1288
	.byte	0x5
	.uleb128 0x19
	.long	.LASF368
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.wchar.h.20.510818a05484290d697a517509bf4b2d,comdat
.Ldebug_macro60:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.long	.LASF1289
	.byte	0x5
	.uleb128 0x22
	.long	.LASF1290
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF1291
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdint.h.106.c0152116e1b88cf2ba3a62d151d58031,comdat
.Ldebug_macro61:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x6a
	.long	.LASF122
	.byte	0x5
	.uleb128 0x6b
	.long	.LASF131
	.byte	0x5
	.uleb128 0x74
	.long	.LASF1293
	.byte	0x5
	.uleb128 0x75
	.long	.LASF1294
	.byte	0x5
	.uleb128 0x76
	.long	.LASF1295
	.byte	0x5
	.uleb128 0x77
	.long	.LASF1296
	.byte	0x5
	.uleb128 0x79
	.long	.LASF1297
	.byte	0x5
	.uleb128 0x7a
	.long	.LASF1298
	.byte	0x5
	.uleb128 0x7b
	.long	.LASF1299
	.byte	0x5
	.uleb128 0x7c
	.long	.LASF1300
	.byte	0x5
	.uleb128 0x7f
	.long	.LASF1301
	.byte	0x5
	.uleb128 0x80
	.long	.LASF1302
	.byte	0x5
	.uleb128 0x81
	.long	.LASF1303
	.byte	0x5
	.uleb128 0x82
	.long	.LASF1304
	.byte	0x5
	.uleb128 0x86
	.long	.LASF1305
	.byte	0x5
	.uleb128 0x87
	.long	.LASF1306
	.byte	0x5
	.uleb128 0x88
	.long	.LASF1307
	.byte	0x5
	.uleb128 0x89
	.long	.LASF1308
	.byte	0x5
	.uleb128 0x8b
	.long	.LASF1309
	.byte	0x5
	.uleb128 0x8c
	.long	.LASF1310
	.byte	0x5
	.uleb128 0x8d
	.long	.LASF1311
	.byte	0x5
	.uleb128 0x8e
	.long	.LASF1312
	.byte	0x5
	.uleb128 0x91
	.long	.LASF1313
	.byte	0x5
	.uleb128 0x92
	.long	.LASF1314
	.byte	0x5
	.uleb128 0x93
	.long	.LASF1315
	.byte	0x5
	.uleb128 0x94
	.long	.LASF1316
	.byte	0x5
	.uleb128 0x98
	.long	.LASF1317
	.byte	0x5
	.uleb128 0x9a
	.long	.LASF1318
	.byte	0x5
	.uleb128 0x9b
	.long	.LASF1319
	.byte	0x5
	.uleb128 0xa0
	.long	.LASF1320
	.byte	0x5
	.uleb128 0xa2
	.long	.LASF1321
	.byte	0x5
	.uleb128 0xa4
	.long	.LASF1322
	.byte	0x5
	.uleb128 0xa5
	.long	.LASF1323
	.byte	0x5
	.uleb128 0xaa
	.long	.LASF1324
	.byte	0x5
	.uleb128 0xad
	.long	.LASF1325
	.byte	0x5
	.uleb128 0xaf
	.long	.LASF1326
	.byte	0x5
	.uleb128 0xb0
	.long	.LASF1327
	.byte	0x5
	.uleb128 0xb5
	.long	.LASF1328
	.byte	0x5
	.uleb128 0xba
	.long	.LASF1329
	.byte	0x5
	.uleb128 0xbb
	.long	.LASF1330
	.byte	0x5
	.uleb128 0xbc
	.long	.LASF1331
	.byte	0x5
	.uleb128 0xc5
	.long	.LASF1332
	.byte	0x5
	.uleb128 0xc7
	.long	.LASF1333
	.byte	0x5
	.uleb128 0xca
	.long	.LASF1334
	.byte	0x5
	.uleb128 0xd1
	.long	.LASF1335
	.byte	0x5
	.uleb128 0xd2
	.long	.LASF1336
	.byte	0x5
	.uleb128 0xde
	.long	.LASF1337
	.byte	0x5
	.uleb128 0xdf
	.long	.LASF1338
	.byte	0x5
	.uleb128 0xe3
	.long	.LASF1339
	.byte	0x5
	.uleb128 0xef
	.long	.LASF1340
	.byte	0x5
	.uleb128 0xf0
	.long	.LASF1341
	.byte	0x5
	.uleb128 0xf4
	.long	.LASF1342
	.byte	0x5
	.uleb128 0xf5
	.long	.LASF1343
	.byte	0x5
	.uleb128 0xf8
	.long	.LASF1344
	.byte	0x5
	.uleb128 0xf9
	.long	.LASF1345
	.byte	0x5
	.uleb128 0xfa
	.long	.LASF1346
	.byte	0x5
	.uleb128 0xfc
	.long	.LASF1347
	.byte	0x5
	.uleb128 0x102
	.long	.LASF1348
	.byte	0x5
	.uleb128 0x103
	.long	.LASF1349
	.byte	0x5
	.uleb128 0x104
	.long	.LASF1350
	.byte	0x5
	.uleb128 0x106
	.long	.LASF1351
	.byte	0x5
	.uleb128 0x10d
	.long	.LASF1352
	.byte	0x5
	.uleb128 0x10e
	.long	.LASF1353
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.curses.h.111.996a0c5f11e7351daad14d76d85bb96b,comdat
.Ldebug_macro62:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x6f
	.long	.LASF1355
	.byte	0x5
	.uleb128 0x77
	.long	.LASF1356
	.byte	0x6
	.uleb128 0x7e
	.long	.LASF1357
	.byte	0x5
	.uleb128 0x7f
	.long	.LASF1358
	.byte	0x6
	.uleb128 0x81
	.long	.LASF1359
	.byte	0x5
	.uleb128 0x82
	.long	.LASF1360
	.byte	0x6
	.uleb128 0x8d
	.long	.LASF1361
	.byte	0x5
	.uleb128 0x8e
	.long	.LASF1362
	.byte	0x6
	.uleb128 0x90
	.long	.LASF1363
	.byte	0x5
	.uleb128 0x91
	.long	.LASF1364
	.byte	0x5
	.uleb128 0x97
	.long	.LASF1365
	.byte	0x5
	.uleb128 0x98
	.long	.LASF1366
	.byte	0x5
	.uleb128 0x99
	.long	.LASF1367
	.byte	0x5
	.uleb128 0x9a
	.long	.LASF1368
	.byte	0x5
	.uleb128 0xa3
	.long	.LASF1369
	.byte	0x5
	.uleb128 0xaa
	.long	.LASF1370
	.byte	0x6
	.uleb128 0xb0
	.long	.LASF1371
	.byte	0x6
	.uleb128 0xb8
	.long	.LASF1372
	.byte	0x5
	.uleb128 0xb9
	.long	.LASF1373
	.byte	0x6
	.uleb128 0xbe
	.long	.LASF1374
	.byte	0x5
	.uleb128 0xbf
	.long	.LASF1375
	.byte	0x6
	.uleb128 0xc4
	.long	.LASF1376
	.byte	0x5
	.uleb128 0xc5
	.long	.LASF1377
	.byte	0x6
	.uleb128 0xcb
	.long	.LASF1378
	.byte	0x5
	.uleb128 0xcc
	.long	.LASF1379
	.byte	0x6
	.uleb128 0xd2
	.long	.LASF1380
	.byte	0x5
	.uleb128 0xd3
	.long	.LASF1381
	.byte	0x6
	.uleb128 0xda
	.long	.LASF1382
	.byte	0x5
	.uleb128 0xdb
	.long	.LASF1383
	.byte	0x5
	.uleb128 0xf5
	.long	.LASF1384
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdarg.h.31.3fa7b8f6daaa31edd1696c08c77f2a73,comdat
.Ldebug_macro63:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF1385
	.byte	0x5
	.uleb128 0x20
	.long	.LASF1386
	.byte	0x6
	.uleb128 0x22
	.long	.LASF567
	.byte	0x5
	.uleb128 0x2f
	.long	.LASF1387
	.byte	0x5
	.uleb128 0x30
	.long	.LASF1388
	.byte	0x5
	.uleb128 0x31
	.long	.LASF1389
	.byte	0x5
	.uleb128 0x34
	.long	.LASF1390
	.byte	0x5
	.uleb128 0x36
	.long	.LASF1391
	.byte	0x5
	.uleb128 0x69
	.long	.LASF1392
	.byte	0x5
	.uleb128 0x6c
	.long	.LASF1393
	.byte	0x5
	.uleb128 0x72
	.long	.LASF1394
	.byte	0x5
	.uleb128 0x75
	.long	.LASF1395
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.curses.h.266.a6aa4f23550a6272814a993111e6627b,comdat
.Ldebug_macro64:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x10a
	.long	.LASF1396
	.byte	0x5
	.uleb128 0x10b
	.long	.LASF1397
	.byte	0x6
	.uleb128 0x10d
	.long	.LASF1398
	.byte	0x5
	.uleb128 0x10e
	.long	.LASF1399
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdbool.h.29.4a1c88fe569adb8d03217dd16982ca34,comdat
.Ldebug_macro65:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF1400
	.byte	0x5
	.uleb128 0x21
	.long	.LASF1401
	.byte	0x5
	.uleb128 0x26
	.long	.LASF1402
	.byte	0x5
	.uleb128 0x27
	.long	.LASF1403
	.byte	0x5
	.uleb128 0x32
	.long	.LASF1404
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.curses.h.284.b5c88a40caf804363b8dba931290ab8a,comdat
.Ldebug_macro66:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x11c
	.long	.LASF1405
	.byte	0x5
	.uleb128 0x129
	.long	.LASF1406
	.byte	0x5
	.uleb128 0x12c
	.long	.LASF1407
	.byte	0x5
	.uleb128 0x132
	.long	.LASF1408
	.byte	0x5
	.uleb128 0x133
	.long	.LASF1409
	.byte	0x5
	.uleb128 0x134
	.long	.LASF1410
	.byte	0x5
	.uleb128 0x135
	.long	.LASF1411
	.byte	0x5
	.uleb128 0x136
	.long	.LASF1412
	.byte	0x5
	.uleb128 0x137
	.long	.LASF1413
	.byte	0x5
	.uleb128 0x138
	.long	.LASF1414
	.byte	0x5
	.uleb128 0x139
	.long	.LASF1415
	.byte	0x5
	.uleb128 0x13a
	.long	.LASF1416
	.byte	0x5
	.uleb128 0x13b
	.long	.LASF1417
	.byte	0x5
	.uleb128 0x13c
	.long	.LASF1418
	.byte	0x5
	.uleb128 0x13d
	.long	.LASF1419
	.byte	0x5
	.uleb128 0x13e
	.long	.LASF1420
	.byte	0x5
	.uleb128 0x13f
	.long	.LASF1421
	.byte	0x5
	.uleb128 0x140
	.long	.LASF1422
	.byte	0x5
	.uleb128 0x141
	.long	.LASF1423
	.byte	0x5
	.uleb128 0x142
	.long	.LASF1424
	.byte	0x5
	.uleb128 0x145
	.long	.LASF1425
	.byte	0x5
	.uleb128 0x149
	.long	.LASF1426
	.byte	0x5
	.uleb128 0x14a
	.long	.LASF1427
	.byte	0x5
	.uleb128 0x14b
	.long	.LASF1428
	.byte	0x5
	.uleb128 0x14c
	.long	.LASF1429
	.byte	0x5
	.uleb128 0x14d
	.long	.LASF1430
	.byte	0x5
	.uleb128 0x14e
	.long	.LASF1431
	.byte	0x5
	.uleb128 0x14f
	.long	.LASF1432
	.byte	0x5
	.uleb128 0x150
	.long	.LASF1433
	.byte	0x5
	.uleb128 0x15b
	.long	.LASF1434
	.byte	0x5
	.uleb128 0x15e
	.long	.LASF1435
	.byte	0x5
	.uleb128 0x15f
	.long	.LASF1436
	.byte	0x5
	.uleb128 0x160
	.long	.LASF1437
	.byte	0x5
	.uleb128 0x161
	.long	.LASF1438
	.byte	0x5
	.uleb128 0x162
	.long	.LASF1439
	.byte	0x5
	.uleb128 0x163
	.long	.LASF1440
	.byte	0x5
	.uleb128 0x164
	.long	.LASF1441
	.byte	0x5
	.uleb128 0x165
	.long	.LASF1442
	.byte	0x5
	.uleb128 0x166
	.long	.LASF1443
	.byte	0x5
	.uleb128 0x167
	.long	.LASF1444
	.byte	0x5
	.uleb128 0x168
	.long	.LASF1445
	.byte	0x5
	.uleb128 0x169
	.long	.LASF1446
	.byte	0x5
	.uleb128 0x16a
	.long	.LASF1447
	.byte	0x5
	.uleb128 0x16b
	.long	.LASF1448
	.byte	0x5
	.uleb128 0x16c
	.long	.LASF1449
	.byte	0x5
	.uleb128 0x16d
	.long	.LASF1450
	.byte	0x5
	.uleb128 0x16e
	.long	.LASF1451
	.byte	0x5
	.uleb128 0x16f
	.long	.LASF1452
	.byte	0x5
	.uleb128 0x171
	.long	.LASF1453
	.byte	0x5
	.uleb128 0x172
	.long	.LASF1454
	.byte	0x5
	.uleb128 0x173
	.long	.LASF1455
	.byte	0x5
	.uleb128 0x174
	.long	.LASF1456
	.byte	0x5
	.uleb128 0x175
	.long	.LASF1457
	.byte	0x5
	.uleb128 0x176
	.long	.LASF1458
	.byte	0x5
	.uleb128 0x177
	.long	.LASF1459
	.byte	0x5
	.uleb128 0x17d
	.long	.LASF1460
	.byte	0x5
	.uleb128 0x17e
	.long	.LASF1461
	.byte	0x5
	.uleb128 0x17f
	.long	.LASF1462
	.byte	0x5
	.uleb128 0x180
	.long	.LASF1463
	.byte	0x5
	.uleb128 0x181
	.long	.LASF1464
	.byte	0x5
	.uleb128 0x182
	.long	.LASF1465
	.byte	0x5
	.uleb128 0x183
	.long	.LASF1466
	.byte	0x5
	.uleb128 0x18b
	.long	.LASF1467
	.byte	0x5
	.uleb128 0x18c
	.long	.LASF1468
	.byte	0x5
	.uleb128 0x18d
	.long	.LASF1469
	.byte	0x5
	.uleb128 0x18e
	.long	.LASF1470
	.byte	0x5
	.uleb128 0x18f
	.long	.LASF1471
	.byte	0x5
	.uleb128 0x190
	.long	.LASF1472
	.byte	0x5
	.uleb128 0x191
	.long	.LASF1473
	.byte	0x5
	.uleb128 0x192
	.long	.LASF1474
	.byte	0x5
	.uleb128 0x193
	.long	.LASF1475
	.byte	0x5
	.uleb128 0x194
	.long	.LASF1476
	.byte	0x5
	.uleb128 0x195
	.long	.LASF1477
	.byte	0x2
	.uleb128 0x197
	.string	"ERR"
	.byte	0x5
	.uleb128 0x198
	.long	.LASF1478
	.byte	0x2
	.uleb128 0x19a
	.string	"OK"
	.byte	0x5
	.uleb128 0x19b
	.long	.LASF1479
	.byte	0x5
	.uleb128 0x19e
	.long	.LASF1480
	.byte	0x5
	.uleb128 0x19f
	.long	.LASF1481
	.byte	0x5
	.uleb128 0x1a0
	.long	.LASF1482
	.byte	0x5
	.uleb128 0x1a1
	.long	.LASF1483
	.byte	0x5
	.uleb128 0x1a2
	.long	.LASF1484
	.byte	0x5
	.uleb128 0x1a3
	.long	.LASF1485
	.byte	0x5
	.uleb128 0x1a4
	.long	.LASF1486
	.byte	0x5
	.uleb128 0x1aa
	.long	.LASF1487
	.byte	0x5
	.uleb128 0x1b0
	.long	.LASF1488
	.byte	0x5
	.uleb128 0x234
	.long	.LASF1489
	.byte	0x5
	.uleb128 0x23c
	.long	.LASF1490
	.byte	0x5
	.uleb128 0x243
	.long	.LASF1491
	.byte	0x5
	.uleb128 0x247
	.long	.LASF1492
	.byte	0x6
	.uleb128 0x24a
	.long	.LASF1493
	.byte	0x5
	.uleb128 0x24c
	.long	.LASF1494
	.byte	0x5
	.uleb128 0x395
	.long	.LASF1495
	.byte	0x6
	.uleb128 0x39c
	.long	.LASF1496
	.byte	0x5
	.uleb128 0x39d
	.long	.LASF1497
	.byte	0x6
	.uleb128 0x3da
	.long	.LASF1498
	.byte	0x5
	.uleb128 0x3db
	.long	.LASF1499
	.byte	0x5
	.uleb128 0x3dc
	.long	.LASF1500
	.byte	0x5
	.uleb128 0x3df
	.long	.LASF1501
	.byte	0x5
	.uleb128 0x44f
	.long	.LASF1502
	.byte	0x5
	.uleb128 0x450
	.long	.LASF1503
	.byte	0x5
	.uleb128 0x452
	.long	.LASF1504
	.byte	0x5
	.uleb128 0x453
	.long	.LASF1505
	.byte	0x5
	.uleb128 0x454
	.long	.LASF1506
	.byte	0x5
	.uleb128 0x455
	.long	.LASF1507
	.byte	0x5
	.uleb128 0x456
	.long	.LASF1508
	.byte	0x5
	.uleb128 0x457
	.long	.LASF1509
	.byte	0x5
	.uleb128 0x458
	.long	.LASF1510
	.byte	0x5
	.uleb128 0x459
	.long	.LASF1511
	.byte	0x5
	.uleb128 0x45a
	.long	.LASF1512
	.byte	0x5
	.uleb128 0x45b
	.long	.LASF1513
	.byte	0x5
	.uleb128 0x45c
	.long	.LASF1514
	.byte	0x5
	.uleb128 0x45d
	.long	.LASF1515
	.byte	0x5
	.uleb128 0x45e
	.long	.LASF1516
	.byte	0x5
	.uleb128 0x45f
	.long	.LASF1517
	.byte	0x5
	.uleb128 0x460
	.long	.LASF1518
	.byte	0x5
	.uleb128 0x461
	.long	.LASF1519
	.byte	0x5
	.uleb128 0x462
	.long	.LASF1520
	.byte	0x5
	.uleb128 0x463
	.long	.LASF1521
	.byte	0x5
	.uleb128 0x464
	.long	.LASF1522
	.byte	0x5
	.uleb128 0x467
	.long	.LASF1523
	.byte	0x5
	.uleb128 0x474
	.long	.LASF1524
	.byte	0x5
	.uleb128 0x475
	.long	.LASF1525
	.byte	0x5
	.uleb128 0x476
	.long	.LASF1526
	.byte	0x5
	.uleb128 0x477
	.long	.LASF1527
	.byte	0x5
	.uleb128 0x479
	.long	.LASF1528
	.byte	0x5
	.uleb128 0x481
	.long	.LASF1529
	.byte	0x5
	.uleb128 0x491
	.long	.LASF1530
	.byte	0x5
	.uleb128 0x492
	.long	.LASF1531
	.byte	0x5
	.uleb128 0x494
	.long	.LASF1532
	.byte	0x5
	.uleb128 0x496
	.long	.LASF1533
	.byte	0x5
	.uleb128 0x497
	.long	.LASF1534
	.byte	0x5
	.uleb128 0x498
	.long	.LASF1535
	.byte	0x5
	.uleb128 0x499
	.long	.LASF1536
	.byte	0x5
	.uleb128 0x49a
	.long	.LASF1537
	.byte	0x5
	.uleb128 0x49b
	.long	.LASF1538
	.byte	0x5
	.uleb128 0x49f
	.long	.LASF1539
	.byte	0x5
	.uleb128 0x4a0
	.long	.LASF1540
	.byte	0x5
	.uleb128 0x4a1
	.long	.LASF1541
	.byte	0x5
	.uleb128 0x4a2
	.long	.LASF1542
	.byte	0x5
	.uleb128 0x4a3
	.long	.LASF1543
	.byte	0x5
	.uleb128 0x4a4
	.long	.LASF1544
	.byte	0x5
	.uleb128 0x4a5
	.long	.LASF1545
	.byte	0x5
	.uleb128 0x4a6
	.long	.LASF1546
	.byte	0x5
	.uleb128 0x4a7
	.long	.LASF1547
	.byte	0x5
	.uleb128 0x4aa
	.long	.LASF1548
	.byte	0x5
	.uleb128 0x4ab
	.long	.LASF1549
	.byte	0x5
	.uleb128 0x4ad
	.long	.LASF1550
	.byte	0x5
	.uleb128 0x4ae
	.long	.LASF1551
	.byte	0x5
	.uleb128 0x4c3
	.long	.LASF1552
	.byte	0x5
	.uleb128 0x4c5
	.long	.LASF1553
	.byte	0x5
	.uleb128 0x4c6
	.long	.LASF1554
	.byte	0x5
	.uleb128 0x4c7
	.long	.LASF1555
	.byte	0x5
	.uleb128 0x4c9
	.long	.LASF1556
	.byte	0x5
	.uleb128 0x4ca
	.long	.LASF1557
	.byte	0x5
	.uleb128 0x4cb
	.long	.LASF1558
	.byte	0x5
	.uleb128 0x4cc
	.long	.LASF1559
	.byte	0x5
	.uleb128 0x4ce
	.long	.LASF1560
	.byte	0x5
	.uleb128 0x4cf
	.long	.LASF1561
	.byte	0x5
	.uleb128 0x4d0
	.long	.LASF1562
	.byte	0x5
	.uleb128 0x4d3
	.long	.LASF1563
	.byte	0x5
	.uleb128 0x4d6
	.long	.LASF1564
	.byte	0x5
	.uleb128 0x4d7
	.long	.LASF1565
	.byte	0x5
	.uleb128 0x4dc
	.long	.LASF1566
	.byte	0x5
	.uleb128 0x4dd
	.long	.LASF1567
	.byte	0x5
	.uleb128 0x4e3
	.long	.LASF1568
	.byte	0x5
	.uleb128 0x4e4
	.long	.LASF1569
	.byte	0x5
	.uleb128 0x4e5
	.long	.LASF1570
	.byte	0x5
	.uleb128 0x4e6
	.long	.LASF1571
	.byte	0x5
	.uleb128 0x4e7
	.long	.LASF1572
	.byte	0x5
	.uleb128 0x4e8
	.long	.LASF1573
	.byte	0x5
	.uleb128 0x4e9
	.long	.LASF1574
	.byte	0x5
	.uleb128 0x4ea
	.long	.LASF1575
	.byte	0x5
	.uleb128 0x4eb
	.long	.LASF1576
	.byte	0x5
	.uleb128 0x4ec
	.long	.LASF1577
	.byte	0x5
	.uleb128 0x4ed
	.long	.LASF1578
	.byte	0x5
	.uleb128 0x4ee
	.long	.LASF1579
	.byte	0x5
	.uleb128 0x4ef
	.long	.LASF1580
	.byte	0x5
	.uleb128 0x4f0
	.long	.LASF1581
	.byte	0x5
	.uleb128 0x4f1
	.long	.LASF1582
	.byte	0x5
	.uleb128 0x4f2
	.long	.LASF1583
	.byte	0x5
	.uleb128 0x4f3
	.long	.LASF1584
	.byte	0x5
	.uleb128 0x4f4
	.long	.LASF1585
	.byte	0x5
	.uleb128 0x4f5
	.long	.LASF1586
	.byte	0x5
	.uleb128 0x4f6
	.long	.LASF1587
	.byte	0x5
	.uleb128 0x4f7
	.long	.LASF1588
	.byte	0x5
	.uleb128 0x4f8
	.long	.LASF1589
	.byte	0x5
	.uleb128 0x4f9
	.long	.LASF1590
	.byte	0x5
	.uleb128 0x4fa
	.long	.LASF1591
	.byte	0x5
	.uleb128 0x4fb
	.long	.LASF1592
	.byte	0x5
	.uleb128 0x4fc
	.long	.LASF1593
	.byte	0x5
	.uleb128 0x4fd
	.long	.LASF1594
	.byte	0x5
	.uleb128 0x4fe
	.long	.LASF1595
	.byte	0x5
	.uleb128 0x4ff
	.long	.LASF1596
	.byte	0x5
	.uleb128 0x500
	.long	.LASF1597
	.byte	0x5
	.uleb128 0x501
	.long	.LASF1598
	.byte	0x5
	.uleb128 0x502
	.long	.LASF1599
	.byte	0x5
	.uleb128 0x503
	.long	.LASF1600
	.byte	0x5
	.uleb128 0x504
	.long	.LASF1601
	.byte	0x5
	.uleb128 0x505
	.long	.LASF1602
	.byte	0x5
	.uleb128 0x506
	.long	.LASF1603
	.byte	0x5
	.uleb128 0x507
	.long	.LASF1604
	.byte	0x5
	.uleb128 0x508
	.long	.LASF1605
	.byte	0x5
	.uleb128 0x509
	.long	.LASF1606
	.byte	0x5
	.uleb128 0x50a
	.long	.LASF1607
	.byte	0x5
	.uleb128 0x50b
	.long	.LASF1608
	.byte	0x5
	.uleb128 0x50c
	.long	.LASF1609
	.byte	0x5
	.uleb128 0x50d
	.long	.LASF1610
	.byte	0x5
	.uleb128 0x50e
	.long	.LASF1611
	.byte	0x5
	.uleb128 0x514
	.long	.LASF1612
	.byte	0x5
	.uleb128 0x515
	.long	.LASF1613
	.byte	0x5
	.uleb128 0x516
	.long	.LASF1614
	.byte	0x5
	.uleb128 0x517
	.long	.LASF1615
	.byte	0x5
	.uleb128 0x518
	.long	.LASF1616
	.byte	0x5
	.uleb128 0x519
	.long	.LASF1617
	.byte	0x5
	.uleb128 0x51a
	.long	.LASF1618
	.byte	0x5
	.uleb128 0x51b
	.long	.LASF1619
	.byte	0x5
	.uleb128 0x51c
	.long	.LASF1620
	.byte	0x5
	.uleb128 0x51d
	.long	.LASF1621
	.byte	0x5
	.uleb128 0x51e
	.long	.LASF1622
	.byte	0x5
	.uleb128 0x51f
	.long	.LASF1623
	.byte	0x5
	.uleb128 0x520
	.long	.LASF1624
	.byte	0x5
	.uleb128 0x521
	.long	.LASF1625
	.byte	0x5
	.uleb128 0x522
	.long	.LASF1626
	.byte	0x5
	.uleb128 0x523
	.long	.LASF1627
	.byte	0x5
	.uleb128 0x524
	.long	.LASF1628
	.byte	0x5
	.uleb128 0x525
	.long	.LASF1629
	.byte	0x5
	.uleb128 0x526
	.long	.LASF1630
	.byte	0x5
	.uleb128 0x527
	.long	.LASF1631
	.byte	0x5
	.uleb128 0x529
	.long	.LASF1632
	.byte	0x5
	.uleb128 0x52a
	.long	.LASF1633
	.byte	0x5
	.uleb128 0x52b
	.long	.LASF1634
	.byte	0x5
	.uleb128 0x52c
	.long	.LASF1635
	.byte	0x5
	.uleb128 0x52d
	.long	.LASF1636
	.byte	0x5
	.uleb128 0x52e
	.long	.LASF1637
	.byte	0x5
	.uleb128 0x52f
	.long	.LASF1638
	.byte	0x5
	.uleb128 0x530
	.long	.LASF1639
	.byte	0x5
	.uleb128 0x531
	.long	.LASF1640
	.byte	0x5
	.uleb128 0x532
	.long	.LASF1641
	.byte	0x5
	.uleb128 0x533
	.long	.LASF1642
	.byte	0x5
	.uleb128 0x534
	.long	.LASF1643
	.byte	0x5
	.uleb128 0x535
	.long	.LASF1644
	.byte	0x5
	.uleb128 0x536
	.long	.LASF1645
	.byte	0x5
	.uleb128 0x537
	.long	.LASF1646
	.byte	0x5
	.uleb128 0x538
	.long	.LASF1647
	.byte	0x5
	.uleb128 0x539
	.long	.LASF1648
	.byte	0x5
	.uleb128 0x53a
	.long	.LASF1649
	.byte	0x5
	.uleb128 0x53b
	.long	.LASF1650
	.byte	0x5
	.uleb128 0x53c
	.long	.LASF1651
	.byte	0x5
	.uleb128 0x542
	.long	.LASF1652
	.byte	0x5
	.uleb128 0x545
	.long	.LASF1653
	.byte	0x5
	.uleb128 0x546
	.long	.LASF1654
	.byte	0x5
	.uleb128 0x589
	.long	.LASF1655
	.byte	0x5
	.uleb128 0x58a
	.long	.LASF1656
	.byte	0x5
	.uleb128 0x58b
	.long	.LASF1657
	.byte	0x5
	.uleb128 0x58c
	.long	.LASF1658
	.byte	0x5
	.uleb128 0x58d
	.long	.LASF1659
	.byte	0x5
	.uleb128 0x58e
	.long	.LASF1660
	.byte	0x5
	.uleb128 0x58f
	.long	.LASF1661
	.byte	0x5
	.uleb128 0x590
	.long	.LASF1662
	.byte	0x5
	.uleb128 0x591
	.long	.LASF1663
	.byte	0x5
	.uleb128 0x592
	.long	.LASF1664
	.byte	0x5
	.uleb128 0x593
	.long	.LASF1665
	.byte	0x5
	.uleb128 0x594
	.long	.LASF1666
	.byte	0x5
	.uleb128 0x595
	.long	.LASF1667
	.byte	0x5
	.uleb128 0x596
	.long	.LASF1668
	.byte	0x5
	.uleb128 0x597
	.long	.LASF1669
	.byte	0x5
	.uleb128 0x59f
	.long	.LASF1670
	.byte	0x5
	.uleb128 0x5de
	.long	.LASF1671
	.byte	0x5
	.uleb128 0x5df
	.long	.LASF1672
	.byte	0x5
	.uleb128 0x5e0
	.long	.LASF1673
	.byte	0x5
	.uleb128 0x5e1
	.long	.LASF1674
	.byte	0x5
	.uleb128 0x5e2
	.long	.LASF1675
	.byte	0x5
	.uleb128 0x5e6
	.long	.LASF1676
	.byte	0x5
	.uleb128 0x5e7
	.long	.LASF1677
	.byte	0x5
	.uleb128 0x5e8
	.long	.LASF1678
	.byte	0x5
	.uleb128 0x5e9
	.long	.LASF1679
	.byte	0x5
	.uleb128 0x5ea
	.long	.LASF1680
	.byte	0x5
	.uleb128 0x5eb
	.long	.LASF1681
	.byte	0x5
	.uleb128 0x5ec
	.long	.LASF1682
	.byte	0x5
	.uleb128 0x5ed
	.long	.LASF1683
	.byte	0x5
	.uleb128 0x5ee
	.long	.LASF1684
	.byte	0x5
	.uleb128 0x5ef
	.long	.LASF1685
	.byte	0x5
	.uleb128 0x5f0
	.long	.LASF1686
	.byte	0x5
	.uleb128 0x5f1
	.long	.LASF1687
	.byte	0x5
	.uleb128 0x5f2
	.long	.LASF1688
	.byte	0x5
	.uleb128 0x5f3
	.long	.LASF1689
	.byte	0x5
	.uleb128 0x5f4
	.long	.LASF1690
	.byte	0x5
	.uleb128 0x5f5
	.long	.LASF1691
	.byte	0x5
	.uleb128 0x5f6
	.long	.LASF1692
	.byte	0x5
	.uleb128 0x5f7
	.long	.LASF1693
	.byte	0x5
	.uleb128 0x5f8
	.long	.LASF1694
	.byte	0x5
	.uleb128 0x5f9
	.long	.LASF1695
	.byte	0x5
	.uleb128 0x5fa
	.long	.LASF1696
	.byte	0x5
	.uleb128 0x5fb
	.long	.LASF1697
	.byte	0x5
	.uleb128 0x5fc
	.long	.LASF1698
	.byte	0x5
	.uleb128 0x5fd
	.long	.LASF1699
	.byte	0x5
	.uleb128 0x5fe
	.long	.LASF1700
	.byte	0x5
	.uleb128 0x5ff
	.long	.LASF1701
	.byte	0x5
	.uleb128 0x600
	.long	.LASF1702
	.byte	0x5
	.uleb128 0x601
	.long	.LASF1703
	.byte	0x5
	.uleb128 0x602
	.long	.LASF1704
	.byte	0x5
	.uleb128 0x603
	.long	.LASF1705
	.byte	0x5
	.uleb128 0x604
	.long	.LASF1706
	.byte	0x5
	.uleb128 0x605
	.long	.LASF1707
	.byte	0x5
	.uleb128 0x606
	.long	.LASF1708
	.byte	0x5
	.uleb128 0x607
	.long	.LASF1709
	.byte	0x5
	.uleb128 0x608
	.long	.LASF1710
	.byte	0x5
	.uleb128 0x609
	.long	.LASF1711
	.byte	0x5
	.uleb128 0x60a
	.long	.LASF1712
	.byte	0x5
	.uleb128 0x60b
	.long	.LASF1713
	.byte	0x5
	.uleb128 0x60c
	.long	.LASF1714
	.byte	0x5
	.uleb128 0x60d
	.long	.LASF1715
	.byte	0x5
	.uleb128 0x60e
	.long	.LASF1716
	.byte	0x5
	.uleb128 0x60f
	.long	.LASF1717
	.byte	0x5
	.uleb128 0x610
	.long	.LASF1718
	.byte	0x5
	.uleb128 0x611
	.long	.LASF1719
	.byte	0x5
	.uleb128 0x612
	.long	.LASF1720
	.byte	0x5
	.uleb128 0x613
	.long	.LASF1721
	.byte	0x5
	.uleb128 0x614
	.long	.LASF1722
	.byte	0x5
	.uleb128 0x615
	.long	.LASF1723
	.byte	0x5
	.uleb128 0x616
	.long	.LASF1724
	.byte	0x5
	.uleb128 0x617
	.long	.LASF1725
	.byte	0x5
	.uleb128 0x618
	.long	.LASF1726
	.byte	0x5
	.uleb128 0x619
	.long	.LASF1727
	.byte	0x5
	.uleb128 0x61a
	.long	.LASF1728
	.byte	0x5
	.uleb128 0x61b
	.long	.LASF1729
	.byte	0x5
	.uleb128 0x61c
	.long	.LASF1730
	.byte	0x5
	.uleb128 0x61d
	.long	.LASF1731
	.byte	0x5
	.uleb128 0x61e
	.long	.LASF1732
	.byte	0x5
	.uleb128 0x61f
	.long	.LASF1733
	.byte	0x5
	.uleb128 0x620
	.long	.LASF1734
	.byte	0x5
	.uleb128 0x621
	.long	.LASF1735
	.byte	0x5
	.uleb128 0x622
	.long	.LASF1736
	.byte	0x5
	.uleb128 0x623
	.long	.LASF1737
	.byte	0x5
	.uleb128 0x624
	.long	.LASF1738
	.byte	0x5
	.uleb128 0x625
	.long	.LASF1739
	.byte	0x5
	.uleb128 0x626
	.long	.LASF1740
	.byte	0x5
	.uleb128 0x627
	.long	.LASF1741
	.byte	0x5
	.uleb128 0x628
	.long	.LASF1742
	.byte	0x5
	.uleb128 0x629
	.long	.LASF1743
	.byte	0x5
	.uleb128 0x62a
	.long	.LASF1744
	.byte	0x5
	.uleb128 0x62b
	.long	.LASF1745
	.byte	0x5
	.uleb128 0x62c
	.long	.LASF1746
	.byte	0x5
	.uleb128 0x62d
	.long	.LASF1747
	.byte	0x5
	.uleb128 0x62e
	.long	.LASF1748
	.byte	0x5
	.uleb128 0x62f
	.long	.LASF1749
	.byte	0x5
	.uleb128 0x630
	.long	.LASF1750
	.byte	0x5
	.uleb128 0x631
	.long	.LASF1751
	.byte	0x5
	.uleb128 0x632
	.long	.LASF1752
	.byte	0x5
	.uleb128 0x633
	.long	.LASF1753
	.byte	0x5
	.uleb128 0x634
	.long	.LASF1754
	.byte	0x5
	.uleb128 0x635
	.long	.LASF1755
	.byte	0x5
	.uleb128 0x636
	.long	.LASF1756
	.byte	0x5
	.uleb128 0x637
	.long	.LASF1757
	.byte	0x5
	.uleb128 0x638
	.long	.LASF1758
	.byte	0x5
	.uleb128 0x639
	.long	.LASF1759
	.byte	0x5
	.uleb128 0x63a
	.long	.LASF1760
	.byte	0x5
	.uleb128 0x63b
	.long	.LASF1761
	.byte	0x5
	.uleb128 0x63c
	.long	.LASF1762
	.byte	0x5
	.uleb128 0x63d
	.long	.LASF1763
	.byte	0x5
	.uleb128 0x640
	.long	.LASF1764
	.byte	0x5
	.uleb128 0x643
	.long	.LASF1765
	.byte	0x5
	.uleb128 0x64a
	.long	.LASF1766
	.byte	0x5
	.uleb128 0x788
	.long	.LASF1767
	.byte	0x5
	.uleb128 0x78d
	.long	.LASF1768
	.byte	0x5
	.uleb128 0x78e
	.long	.LASF1769
	.byte	0x5
	.uleb128 0x78f
	.long	.LASF1770
	.byte	0x5
	.uleb128 0x790
	.long	.LASF1771
	.byte	0x5
	.uleb128 0x791
	.long	.LASF1772
	.byte	0x5
	.uleb128 0x792
	.long	.LASF1773
	.byte	0x5
	.uleb128 0x795
	.long	.LASF1774
	.byte	0x5
	.uleb128 0x796
	.long	.LASF1775
	.byte	0x5
	.uleb128 0x797
	.long	.LASF1776
	.byte	0x5
	.uleb128 0x798
	.long	.LASF1777
	.byte	0x5
	.uleb128 0x799
	.long	.LASF1778
	.byte	0x5
	.uleb128 0x79b
	.long	.LASF1779
	.byte	0x5
	.uleb128 0x79c
	.long	.LASF1780
	.byte	0x5
	.uleb128 0x79d
	.long	.LASF1781
	.byte	0x5
	.uleb128 0x79e
	.long	.LASF1782
	.byte	0x5
	.uleb128 0x79f
	.long	.LASF1783
	.byte	0x5
	.uleb128 0x7a1
	.long	.LASF1784
	.byte	0x5
	.uleb128 0x7a2
	.long	.LASF1785
	.byte	0x5
	.uleb128 0x7a3
	.long	.LASF1786
	.byte	0x5
	.uleb128 0x7a4
	.long	.LASF1787
	.byte	0x5
	.uleb128 0x7a5
	.long	.LASF1788
	.byte	0x5
	.uleb128 0x7a7
	.long	.LASF1789
	.byte	0x5
	.uleb128 0x7a8
	.long	.LASF1790
	.byte	0x5
	.uleb128 0x7a9
	.long	.LASF1791
	.byte	0x5
	.uleb128 0x7aa
	.long	.LASF1792
	.byte	0x5
	.uleb128 0x7ab
	.long	.LASF1793
	.byte	0x5
	.uleb128 0x7b3
	.long	.LASF1794
	.byte	0x5
	.uleb128 0x7b4
	.long	.LASF1795
	.byte	0x5
	.uleb128 0x7b5
	.long	.LASF1796
	.byte	0x5
	.uleb128 0x7b6
	.long	.LASF1797
	.byte	0x5
	.uleb128 0x7b7
	.long	.LASF1798
	.byte	0x5
	.uleb128 0x7b9
	.long	.LASF1799
	.byte	0x5
	.uleb128 0x7ba
	.long	.LASF1800
	.byte	0x5
	.uleb128 0x7bb
	.long	.LASF1801
	.byte	0x5
	.uleb128 0x7bc
	.long	.LASF1802
	.byte	0x5
	.uleb128 0x7cc
	.long	.LASF1803
	.byte	0x5
	.uleb128 0x7cf
	.long	.LASF1804
	.byte	0x5
	.uleb128 0x7d0
	.long	.LASF1805
	.byte	0x5
	.uleb128 0x7d1
	.long	.LASF1806
	.byte	0x5
	.uleb128 0x7d2
	.long	.LASF1807
	.byte	0x5
	.uleb128 0x7d3
	.long	.LASF1808
	.byte	0x5
	.uleb128 0x7d4
	.long	.LASF1809
	.byte	0x5
	.uleb128 0x7f0
	.long	.LASF1810
	.byte	0x5
	.uleb128 0x80b
	.long	.LASF1811
	.byte	0x5
	.uleb128 0x80c
	.long	.LASF1812
	.byte	0x5
	.uleb128 0x812
	.long	.LASF1813
	.byte	0x5
	.uleb128 0x813
	.long	.LASF1814
	.byte	0x5
	.uleb128 0x814
	.long	.LASF1815
	.byte	0x5
	.uleb128 0x815
	.long	.LASF1816
	.byte	0x5
	.uleb128 0x816
	.long	.LASF1817
	.byte	0x5
	.uleb128 0x817
	.long	.LASF1818
	.byte	0x5
	.uleb128 0x818
	.long	.LASF1819
	.byte	0x5
	.uleb128 0x819
	.long	.LASF1820
	.byte	0x5
	.uleb128 0x81a
	.long	.LASF1821
	.byte	0x5
	.uleb128 0x81b
	.long	.LASF1822
	.byte	0x5
	.uleb128 0x81c
	.long	.LASF1823
	.byte	0x5
	.uleb128 0x81d
	.long	.LASF1824
	.byte	0x5
	.uleb128 0x81e
	.long	.LASF1825
	.byte	0x5
	.uleb128 0x81f
	.long	.LASF1826
	.byte	0x5
	.uleb128 0x820
	.long	.LASF1827
	.byte	0x5
	.uleb128 0x822
	.long	.LASF1828
	.byte	0x5
	.uleb128 0x823
	.long	.LASF1829
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.unctrl.h.46.c707778f5afc46808288a843c83a4633,comdat
.Ldebug_macro67:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF1830
	.byte	0x6
	.uleb128 0x30
	.long	.LASF1276
	.byte	0x5
	.uleb128 0x31
	.long	.LASF1277
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.cpumonlib.h.3.53a80dcb972256ad710bb0611da875ed,comdat
.Ldebug_macro68:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x3
	.long	.LASF1832
	.byte	0x5
	.uleb128 0x6
	.long	.LASF1833
	.byte	0x5
	.uleb128 0x7
	.long	.LASF1834
	.byte	0x5
	.uleb128 0x8
	.long	.LASF1835
	.byte	0x5
	.uleb128 0x9
	.long	.LASF1836
	.byte	0x5
	.uleb128 0xa
	.long	.LASF1837
	.byte	0x5
	.uleb128 0xc
	.long	.LASF1838
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.guilib.h.2.1a7fb1209788ff5735fc4737be9abb8b,comdat
.Ldebug_macro69:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x2
	.long	.LASF1839
	.byte	0x5
	.uleb128 0x14
	.long	.LASF1840
	.byte	0x5
	.uleb128 0x15
	.long	.LASF1841
	.byte	0x5
	.uleb128 0x16
	.long	.LASF1842
	.byte	0x5
	.uleb128 0x17
	.long	.LASF1843
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.machine_specific_registers.h.3.d2e1d0b1ada7d991f2dcf44fe45b2999,comdat
.Ldebug_macro70:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x3
	.long	.LASF1844
	.byte	0x5
	.uleb128 0x5
	.long	.LASF1845
	.byte	0x5
	.uleb128 0x6
	.long	.LASF1837
	.byte	0x5
	.uleb128 0xa
	.long	.LASF1846
	.byte	0x5
	.uleb128 0xb
	.long	.LASF1847
	.byte	0x5
	.uleb128 0xc
	.long	.LASF1848
	.byte	0x5
	.uleb128 0xd
	.long	.LASF1849
	.byte	0x5
	.uleb128 0xe
	.long	.LASF1850
	.byte	0x5
	.uleb128 0xf
	.long	.LASF1851
	.byte	0x5
	.uleb128 0x11
	.long	.LASF1852
	.byte	0x5
	.uleb128 0x12
	.long	.LASF1853
	.byte	0x5
	.uleb128 0x13
	.long	.LASF1854
	.byte	0x5
	.uleb128 0x15
	.long	.LASF1855
	.byte	0x5
	.uleb128 0x16
	.long	.LASF1856
	.byte	0x5
	.uleb128 0x17
	.long	.LASF1857
	.byte	0x5
	.uleb128 0x18
	.long	.LASF1858
	.byte	0x5
	.uleb128 0x19
	.long	.LASF1859
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF1860
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF1861
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF1862
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF1863
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF1864
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF1865
	.byte	0x5
	.uleb128 0x20
	.long	.LASF1866
	.byte	0x5
	.uleb128 0x22
	.long	.LASF1867
	.byte	0x5
	.uleb128 0x24
	.long	.LASF1868
	.byte	0x5
	.uleb128 0x29
	.long	.LASF1869
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF1870
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF1871
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF1872
	.byte	0x5
	.uleb128 0x30
	.long	.LASF1873
	.byte	0x5
	.uleb128 0x31
	.long	.LASF1874
	.byte	0x5
	.uleb128 0x32
	.long	.LASF1875
	.byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF1752:
	.string	"KEY_SPREVIOUS 0616"
.LASF1564:
	.string	"waddstr(win,str) waddnstr(win,str,-1)"
.LASF1743:
	.string	"KEY_SFIND 0605"
.LASF747:
	.string	"__ldiv_t_defined 1"
.LASF1846:
	.string	"MSR_PERF_STATUS 0x198"
.LASF887:
	.string	"_POSIX_THREADS 200809L"
.LASF1833:
	.string	"AVG_WINDOW 60"
.LASF280:
	.string	"__FLT64X_HAS_QUIET_NAN__ 1"
.LASF36:
	.string	"__FLOAT_WORD_ORDER__ __ORDER_LITTLE_ENDIAN__"
.LASF1982:
	.string	"power_runtime_avg"
.LASF851:
	.string	"alloca"
.LASF1779:
	.string	"BUTTON2_RELEASED NCURSES_MOUSE_MASK(2, NCURSES_BUTTON_RELEASED)"
.LASF836:
	.string	"__SIZEOF_PTHREAD_CONDATTR_T 4"
.LASF939:
	.string	"__ILP32_OFF32_CFLAGS \"-m32\""
.LASF1399:
	.string	"FALSE 0"
.LASF1916:
	.string	"_unused2"
.LASF1253:
	.string	"_CS_POSIX_V7_ILP32_OFFBIG_LINTFLAGS _CS_POSIX_V7_ILP32_OFFBIG_LINTFLAGS"
.LASF1196:
	.string	"_SC_SIGSTKSZ _SC_SIGSTKSZ"
.LASF1023:
	.string	"_SC_LINE_MAX _SC_LINE_MAX"
.LASF1071:
	.string	"_SC_XOPEN_XCU_VERSION _SC_XOPEN_XCU_VERSION"
.LASF203:
	.string	"__FLT32_DIG__ 6"
.LASF710:
	.string	"_WCHAR_T_DEFINED "
.LASF1902:
	.string	"_fileno"
.LASF1360:
	.string	"NCURSES_INLINE inline"
.LASF437:
	.string	"__glibc_has_attribute(attr) __has_attribute (attr)"
.LASF981:
	.string	"_SC_CLK_TCK _SC_CLK_TCK"
.LASF979:
	.string	"_SC_ARG_MAX _SC_ARG_MAX"
.LASF1552:
	.string	"scroll(win) wscrl(win,1)"
.LASF1184:
	.string	"_SC_V7_ILP32_OFFBIG _SC_V7_ILP32_OFFBIG"
.LASF470:
	.string	"__ASMNAME(cname) __ASMNAME2 (__USER_LABEL_PREFIX__, cname)"
.LASF25:
	.string	"__SIZEOF_SHORT__ 2"
.LASF1615:
	.string	"mvwaddnstr(win,y,x,str,n) (wmove((win),(y),(x)) == ERR ? ERR : waddnstr((win),(str),(n)))"
.LASF218:
	.string	"__FLT64_MANT_DIG__ 53"
.LASF1277:
	.string	"NCURSES_VERSION \"6.3\""
.LASF368:
	.string	"__GLIBC_INTERNAL_STARTING_HEADER_IMPLEMENTATION "
.LASF1018:
	.string	"_SC_BC_SCALE_MAX _SC_BC_SCALE_MAX"
.LASF158:
	.string	"__FLT_MAX_10_EXP__ 38"
.LASF576:
	.string	"__SQUAD_TYPE long int"
.LASF1285:
	.string	"NCURSES_EXPORT_GENERAL_IMPORT "
.LASF1476:
	.string	"ACS_SBSB ACS_VLINE"
.LASF1616:
	.string	"mvwaddstr(win,y,x,str) (wmove((win),(y),(x)) == ERR ? ERR : waddnstr((win),(str),-1))"
.LASF425:
	.string	"__USE_MISC 1"
.LASF1173:
	.string	"_SC_LEVEL2_CACHE_ASSOC _SC_LEVEL2_CACHE_ASSOC"
.LASF1382:
	.string	"NCURSES_CH_T"
.LASF918:
	.string	"_POSIX_MESSAGE_PASSING 200809L"
.LASF1641:
	.string	"mvgetstr(y,x,str) mvwgetstr(stdscr,(y),(x),(str))"
.LASF1679:
	.string	"KEY_RIGHT 0405"
.LASF865:
	.string	"_XOPEN_XPG2 1"
.LASF123:
	.string	"__INT_LEAST64_WIDTH__ 64"
.LASF1570:
	.string	"addchstr(str) waddchstr(stdscr,(str))"
.LASF951:
	.string	"R_OK 4"
.LASF761:
	.string	"__pid_t_defined "
.LASF772:
	.string	"_BITS_ENDIAN_H 1"
.LASF1050:
	.string	"_SC_GETGR_R_SIZE_MAX _SC_GETGR_R_SIZE_MAX"
.LASF1286:
	.string	"NCURSES_EXPORT_GENERAL_EXPORT "
.LASF1516:
	.string	"A_PROTECT NCURSES_BITS(1U,16)"
.LASF494:
	.string	"__fortify_function __extern_always_inline __attribute_artificial__"
.LASF1217:
	.string	"_CS_XBS5_ILP32_OFF32_LINTFLAGS _CS_XBS5_ILP32_OFF32_LINTFLAGS"
.LASF221:
	.string	"__FLT64_MIN_10_EXP__ (-307)"
.LASF724:
	.string	"WNOWAIT 0x01000000"
.LASF337:
	.string	"__ATOMIC_HLE_RELEASE 131072"
.LASF85:
	.string	"__PTRDIFF_MAX__ 0x7fffffffffffffffL"
.LASF1289:
	.string	"_BITS_WCHAR_H 1"
.LASF42:
	.string	"__WCHAR_TYPE__ int"
.LASF1358:
	.string	"NCURSES_CONST const"
.LASF1046:
	.string	"_SC_PII_OSI_M _SC_PII_OSI_M"
.LASF1773:
	.string	"NCURSES_RESERVED_EVENT 040L"
.LASF1961:
	.string	"_Bool"
.LASF505:
	.string	"__LDBL_REDIR(name,proto) name proto"
.LASF1947:
	.string	"_regbottom"
.LASF1010:
	.string	"_SC_PAGE_SIZE _SC_PAGESIZE"
.LASF141:
	.string	"__UINT_FAST16_MAX__ 0xffffffffffffffffUL"
.LASF297:
	.string	"__DEC128_MIN_EXP__ (-6142)"
.LASF1944:
	.string	"_delay"
.LASF1221:
	.string	"_CS_XBS5_ILP32_OFFBIG_LINTFLAGS _CS_XBS5_ILP32_OFFBIG_LINTFLAGS"
.LASF818:
	.string	"NFDBITS __NFDBITS"
.LASF441:
	.string	"__LEAF_ATTR __attribute__ ((__leaf__))"
.LASF1600:
	.string	"insnstr(s,n) winsnstr(stdscr,(s),(n))"
.LASF245:
	.string	"__FLT128_DENORM_MIN__ 6.47517511943802511092443895822764655e-4966F128"
.LASF2023:
	.string	"my_battery"
.LASF174:
	.string	"__DBL_MAX_10_EXP__ 308"
.LASF487:
	.string	"__attribute_warn_unused_result__ __attribute__ ((__warn_unused_result__))"
.LASF1844:
	.string	"MACHINE_SPECIFIC_REGISTERS "
.LASF1133:
	.string	"_SC_NETWORKING _SC_NETWORKING"
.LASF1180:
	.string	"_SC_LEVEL4_CACHE_LINESIZE _SC_LEVEL4_CACHE_LINESIZE"
.LASF1597:
	.string	"insch(c) winsch(stdscr,(c))"
.LASF458:
	.string	"__glibc_unsigned_or_positive(__l) ((__typeof (__l)) 0 < (__typeof (__l)) -1 || (__builtin_constant_p (__l) && (__l) > 0))"
.LASF1468:
	.string	"ACS_SSBB ACS_LLCORNER"
.LASF1896:
	.string	"_IO_buf_end"
.LASF1011:
	.string	"_SC_RTSIG_MAX _SC_RTSIG_MAX"
.LASF636:
	.string	"__getc_unlocked_body(_fp) (__glibc_unlikely ((_fp)->_IO_read_ptr >= (_fp)->_IO_read_end) ? __uflow (_fp) : *(unsigned char *) (_fp)->_IO_read_ptr++)"
.LASF1034:
	.string	"_SC_PII_XTI _SC_PII_XTI"
.LASF1907:
	.string	"_shortbuf"
.LASF1765:
	.string	"KEY_MAX 0777"
.LASF359:
	.string	"__ELF__ 1"
.LASF186:
	.string	"__LDBL_DIG__ 18"
.LASF1671:
	.string	"KEY_CODE_YES 0400"
.LASF23:
	.string	"__SIZEOF_LONG__ 8"
.LASF1507:
	.string	"A_COLOR NCURSES_BITS(((1U) << 8) - 1U,0)"
.LASF915:
	.string	"_POSIX_SPAWN 200809L"
.LASF1807:
	.string	"BUTTON_DOUBLE_CLICK(e,x) ((e) & NCURSES_MOUSE_MASK(x, 010))"
.LASF1693:
	.string	"KEY_SR 0521"
.LASF1391:
	.string	"__va_copy(d,s) __builtin_va_copy(d,s)"
.LASF1793:
	.string	"BUTTON4_TRIPLE_CLICKED NCURSES_MOUSE_MASK(4, NCURSES_TRIPLE_CLICKED)"
.LASF702:
	.string	"__WCHAR_T__ "
.LASF718:
	.string	"_STDLIB_H 1"
.LASF1144:
	.string	"_SC_SYSTEM_DATABASE_R _SC_SYSTEM_DATABASE_R"
.LASF2030:
	.string	"GNU C17 11.4.0 -masm=intel -mtune=generic -march=x86-64 -g -g -ggdb3 -gdwarf-2 -O0 -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection"
.LASF567:
	.string	"__need___va_list"
.LASF1627:
	.string	"mvwinsch(win,y,x,c) (wmove((win),(y),(x)) == ERR ? ERR : winsch((win),(c)))"
.LASF1682:
	.string	"KEY_F0 0410"
.LASF1777:
	.string	"BUTTON1_DOUBLE_CLICKED NCURSES_MOUSE_MASK(1, NCURSES_DOUBLE_CLICKED)"
.LASF1400:
	.string	"_STDBOOL_H "
.LASF88:
	.string	"__SHRT_WIDTH__ 16"
.LASF1642:
	.string	"mvhline(y,x,c,n) mvwhline(stdscr,(y),(x),(c),(n))"
.LASF1956:
	.string	"_pad_x"
.LASF1955:
	.string	"_pad_y"
.LASF637:
	.string	"__putc_unlocked_body(_ch,_fp) (__glibc_unlikely ((_fp)->_IO_write_ptr >= (_fp)->_IO_write_end) ? __overflow (_fp, (unsigned char) (_ch)) : (unsigned char) (*(_fp)->_IO_write_ptr++ = (_ch)))"
.LASF1156:
	.string	"_SC_2_PBS_CHECKPOINT _SC_2_PBS_CHECKPOINT"
.LASF182:
	.string	"__DBL_HAS_INFINITY__ 1"
.LASF468:
	.string	"__REDIRECT_NTH(name,proto,alias) name proto __asm__ (__ASMNAME (#alias)) __THROW"
.LASF1225:
	.string	"_CS_XBS5_LP64_OFF64_LINTFLAGS _CS_XBS5_LP64_OFF64_LINTFLAGS"
.LASF1416:
	.string	"WA_ALTCHARSET A_ALTCHARSET"
.LASF992:
	.string	"_SC_PRIORITIZED_IO _SC_PRIORITIZED_IO"
.LASF166:
	.string	"__FLT_HAS_INFINITY__ 1"
.LASF1818:
	.string	"TRACE_CHARPUT 0x0010"
.LASF237:
	.string	"__FLT128_MIN_10_EXP__ (-4931)"
.LASF886:
	.string	"_XOPEN_SHM 1"
.LASF784:
	.string	"_BITS_BYTESWAP_H 1"
.LASF355:
	.string	"linux 1"
.LASF290:
	.string	"__DEC64_MIN_EXP__ (-382)"
.LASF626:
	.string	"__FD_SETSIZE 1024"
.LASF584:
	.string	"__STD_TYPE typedef"
.LASF1576:
	.string	"attr_set(a,c,o) wattr_set(stdscr,(a),(c),(o))"
.LASF1758:
	.string	"KEY_SSAVE 0624"
.LASF1725:
	.string	"KEY_REDO 0563"
.LASF1138:
	.string	"_SC_SHELL _SC_SHELL"
.LASF443:
	.string	"__THROWNL __attribute__ ((__nothrow__))"
.LASF1856:
	.string	"PROCHOT 1"
.LASF121:
	.string	"__INT_LEAST64_MAX__ 0x7fffffffffffffffL"
.LASF2000:
	.string	"moving_average"
.LASF1888:
	.string	"_flags"
.LASF954:
	.string	"F_OK 0"
.LASF1628:
	.string	"mvwinsnstr(win,y,x,s,n) (wmove((win),(y),(x)) == ERR ? ERR : winsnstr((win),(s),(n)))"
.LASF1714:
	.string	"KEY_END 0550"
.LASF1038:
	.string	"_SC_POLL _SC_POLL"
.LASF2001:
	.string	"wattr_off"
.LASF1754:
	.string	"KEY_SREDO 0620"
.LASF655:
	.string	"_BITS_STDIO_LIM_H 1"
.LASF555:
	.string	"_SIZE_T_DEFINED "
.LASF1078:
	.string	"_SC_2_UPE _SC_2_UPE"
.LASF1139:
	.string	"_SC_SIGNALS _SC_SIGNALS"
.LASF1686:
	.string	"KEY_DC 0512"
.LASF1343:
	.string	"WINT_MAX (4294967295u)"
.LASF1270:
	.string	"__NCURSES_H "
.LASF1703:
	.string	"KEY_A3 0535"
.LASF1885:
	.string	"__off_t"
.LASF962:
	.string	"_PC_PATH_MAX _PC_PATH_MAX"
.LASF1321:
	.string	"INT_FAST8_MAX (127)"
.LASF573:
	.string	"__U32_TYPE unsigned int"
.LASF635:
	.string	"__struct_FILE_defined 1"
.LASF642:
	.string	"_IO_USER_LOCK 0x8000"
.LASF1260:
	.string	"_CS_POSIX_V7_LPBIG_OFFBIG_LIBS _CS_POSIX_V7_LPBIG_OFFBIG_LIBS"
.LASF1422:
	.string	"WA_RIGHT A_RIGHT"
.LASF1783:
	.string	"BUTTON2_TRIPLE_CLICKED NCURSES_MOUSE_MASK(2, NCURSES_TRIPLE_CLICKED)"
.LASF822:
	.string	"FD_ZERO(fdsetp) __FD_ZERO (fdsetp)"
.LASF1252:
	.string	"_CS_POSIX_V7_ILP32_OFFBIG_LIBS _CS_POSIX_V7_ILP32_OFFBIG_LIBS"
.LASF924:
	.string	"_POSIX_RAW_SOCKETS 200809L"
.LASF1712:
	.string	"KEY_COPY 0546"
.LASF651:
	.string	"SEEK_SET 0"
.LASF1874:
	.string	"AMD_ENERGY_UNIT_MASK 0x1F00"
.LASF389:
	.string	"__USE_MISC"
.LASF143:
	.string	"__UINT_FAST64_MAX__ 0xffffffffffffffffUL"
.LASF1497:
	.string	"NCURSES_EXT_FUNCS 20211021"
.LASF1364:
	.string	"NCURSES_PAIRS_T short"
.LASF965:
	.string	"_PC_NO_TRUNC _PC_NO_TRUNC"
.LASF1019:
	.string	"_SC_BC_STRING_MAX _SC_BC_STRING_MAX"
.LASF1724:
	.string	"KEY_PREVIOUS 0562"
.LASF643:
	.string	"_VA_LIST_DEFINED "
.LASF296:
	.string	"__DEC128_MANT_DIG__ 34"
.LASF759:
	.string	"__nlink_t_defined "
.LASF77:
	.string	"__SHRT_MAX__ 0x7fff"
.LASF912:
	.string	"_POSIX_SHELL 1"
.LASF1494:
	.string	"GCC_DEPRECATED(msg) __attribute__((deprecated))"
.LASF882:
	.string	"_POSIX_VDISABLE '\\0'"
.LASF73:
	.string	"__INTPTR_TYPE__ long int"
.LASF701:
	.string	"__wchar_t__ "
.LASF341:
	.string	"__code_model_small__ 1"
.LASF1908:
	.string	"_lock"
.LASF380:
	.string	"__USE_XOPEN_EXTENDED"
.LASF1348:
	.string	"UINT8_C(c) c"
.LASF934:
	.string	"_POSIX_V6_LPBIG_OFFBIG -1"
.LASF1610:
	.string	"wdeleteln(win) winsdelln(win,-1)"
.LASF109:
	.string	"__UINT16_MAX__ 0xffff"
.LASF1284:
	.string	"NCURSES_EXPORT_VAR(type) NCURSES_IMPEXP type"
.LASF506:
	.string	"__LDBL_REDIR1_NTH(name,proto,alias) name proto __THROW"
.LASF656:
	.string	"L_tmpnam 20"
.LASF593:
	.string	"__MODE_T_TYPE __U32_TYPE"
.LASF691:
	.string	"__f64x(x) x ##f64x"
.LASF60:
	.string	"__INT_LEAST64_TYPE__ long int"
.LASF106:
	.string	"__INT32_MAX__ 0x7fffffff"
.LASF243:
	.string	"__FLT128_MIN__ 3.36210314311209350626267781732175260e-4932F128"
.LASF1595:
	.string	"inchstr(s) winchstr(stdscr,(s))"
.LASF1381:
	.string	"NCURSES_WCWIDTH_GRAPHICS 1"
.LASF1815:
	.string	"TRACE_TPUTS 0x0002"
.LASF1258:
	.string	"_CS_POSIX_V7_LPBIG_OFFBIG_CFLAGS _CS_POSIX_V7_LPBIG_OFFBIG_CFLAGS"
.LASF1021:
	.string	"_SC_EQUIV_CLASS_MAX _SC_EQUIV_CLASS_MAX"
.LASF312:
	.string	"__GCC_ATOMIC_CHAR_LOCK_FREE 2"
.LASF1107:
	.string	"_SC_XBS5_ILP32_OFFBIG _SC_XBS5_ILP32_OFFBIG"
.LASF71:
	.string	"__UINT_FAST32_TYPE__ long unsigned int"
.LASF1132:
	.string	"_SC_SINGLE_PROCESS _SC_SINGLE_PROCESS"
.LASF622:
	.string	"__INO_T_MATCHES_INO64_T 1"
.LASF22:
	.string	"__SIZEOF_INT__ 4"
.LASF933:
	.string	"_POSIX_V7_LPBIG_OFFBIG -1"
.LASF466:
	.string	"__glibc_c99_flexarr_available 1"
.LASF1553:
	.string	"touchwin(win) wtouchln((win), 0, getmaxy(win), 1)"
.LASF255:
	.string	"__FLT32X_MAX_10_EXP__ 308"
.LASF462:
	.ascii	"__glibc_"
	.string	"fortify_n(f,__l,__s,__osz,...) (__glibc_safe_or_unknown_len (__l, __s, __osz) ? __ ## f ## _alias (__VA_ARGS__) : (__glibc_unsafe_len (__l, __s, __osz) ? __ ## f ## _chk_warn (__VA_ARGS__, (__osz) / (__s)) : __ ## f ## _chk (__VA_ARGS__, (__osz) / (__s))))"
.LASF1617:
	.string	"mvwchgat(win,y,x,n,a,c,o) (wmove((win),(y),(x)) == ERR ? ERR : wchgat((win),(n),(a),(c),(o)))"
.LASF48:
	.string	"__SIG_ATOMIC_TYPE__ int"
.LASF556:
	.string	"_BSD_SIZE_T_DEFINED_ "
.LASF31:
	.string	"__BIGGEST_ALIGNMENT__ 16"
.LASF1396:
	.string	"TRUE"
.LASF135:
	.string	"__INT_FAST16_WIDTH__ 64"
.LASF1791:
	.string	"BUTTON4_CLICKED NCURSES_MOUSE_MASK(4, NCURSES_BUTTON_CLICKED)"
.LASF1325:
	.string	"UINT_FAST8_MAX (255)"
.LASF1917:
	.string	"FILE"
.LASF1629:
	.string	"mvwinsstr(win,y,x,s) (wmove((win),(y),(x)) == ERR ? ERR : winsstr((win),(s)))"
.LASF127:
	.string	"__UINT16_C(c) c"
.LASF1763:
	.string	"KEY_MOUSE 0631"
.LASF324:
	.string	"__PRAGMA_REDEFINE_EXTNAME 1"
.LASF801:
	.string	"_SYS_SELECT_H 1"
.LASF669:
	.string	"__HAVE_DISTINCT_FLOAT128 1"
.LASF1640:
	.string	"mvgetnstr(y,x,str,n) mvwgetnstr(stdscr,(y),(x),(str),(n))"
.LASF15:
	.string	"__pic__ 2"
.LASF439:
	.string	"__glibc_has_extension(ext) 0"
.LASF813:
	.string	"__NFDBITS (8 * (int) sizeof (__fd_mask))"
.LASF1744:
	.string	"KEY_SHELP 0606"
.LASF18:
	.string	"__PIE__ 2"
.LASF1598:
	.string	"insdelln(n) winsdelln(stdscr,(n))"
.LASF1375:
	.string	"NCURSES_SIZE_T short"
.LASF698:
	.string	"_BITS_TYPES___LOCALE_T_H 1"
.LASF809:
	.string	"__timeval_defined 1"
.LASF1700:
	.string	"KEY_PRINT 0532"
.LASF322:
	.string	"__HAVE_SPECULATION_SAFE_VALUE 1"
.LASF955:
	.string	"L_SET SEEK_SET"
.LASF1054:
	.string	"_SC_THREAD_DESTRUCTOR_ITERATIONS _SC_THREAD_DESTRUCTOR_ITERATIONS"
.LASF1419:
	.string	"WA_HORIZONTAL A_HORIZONTAL"
.LASF1388:
	.string	"va_end(v) __builtin_va_end(v)"
.LASF74:
	.string	"__UINTPTR_TYPE__ long unsigned int"
.LASF179:
	.string	"__DBL_EPSILON__ ((double)2.22044604925031308084726333618164062e-16L)"
.LASF786:
	.string	"__bswap_constant_32(x) ((((x) & 0xff000000u) >> 24) | (((x) & 0x00ff0000u) >> 8) | (((x) & 0x0000ff00u) << 8) | (((x) & 0x000000ffu) << 24))"
.LASF855:
	.string	"_POSIX_VERSION 200809L"
.LASF86:
	.string	"__SIZE_MAX__ 0xffffffffffffffffUL"
.LASF1620:
	.string	"mvwgetnstr(win,y,x,str,n) (wmove((win),(y),(x)) == ERR ? ERR : wgetnstr((win),(str),(n)))"
.LASF1395:
	.string	"__va_list__ "
.LASF653:
	.string	"SEEK_END 2"
.LASF257:
	.string	"__FLT32X_MAX__ 1.79769313486231570814527423731704357e+308F32x"
.LASF489:
	.string	"__always_inline"
.LASF53:
	.string	"__UINT8_TYPE__ unsigned char"
.LASF675:
	.string	"__HAVE_FLOAT16 0"
.LASF1339:
	.string	"SIZE_MAX (18446744073709551615UL)"
.LASF1030:
	.string	"_SC_2_FORT_RUN _SC_2_FORT_RUN"
.LASF892:
	.string	"_POSIX_THREAD_ATTR_STACKADDR 200809L"
.LASF2004:
	.string	"wclear"
.LASF205:
	.string	"__FLT32_MIN_10_EXP__ (-37)"
.LASF1295:
	.string	"INT32_MIN (-2147483647-1)"
.LASF874:
	.string	"_POSIX_PRIORITY_SCHEDULING 200809L"
.LASF236:
	.string	"__FLT128_MIN_EXP__ (-16381)"
.LASF3:
	.string	"__STDC_UTF_32__ 1"
.LASF115:
	.string	"__INT_LEAST16_MAX__ 0x7fff"
.LASF904:
	.string	"_LFS_LARGEFILE 1"
.LASF970:
	.string	"_PC_SOCK_MAXBUF _PC_SOCK_MAXBUF"
.LASF1423:
	.string	"WA_TOP A_TOP"
.LASF192:
	.string	"__LDBL_DECIMAL_DIG__ 21"
.LASF1368:
	.string	"NCURSES_OPAQUE_PANEL 0"
.LASF1048:
	.string	"_SC_THREADS _SC_THREADS"
.LASF1789:
	.string	"BUTTON4_RELEASED NCURSES_MOUSE_MASK(4, NCURSES_BUTTON_RELEASED)"
.LASF1894:
	.string	"_IO_write_end"
.LASF1566:
	.string	"COLOR_PAIR(n) (NCURSES_BITS((n), 0) & A_COLOR)"
.LASF1800:
	.string	"BUTTON_SHIFT NCURSES_MOUSE_MASK(6, 0002L)"
.LASF919:
	.string	"_POSIX_THREAD_PROCESS_SHARED 200809L"
.LASF54:
	.string	"__UINT16_TYPE__ short unsigned int"
.LASF1488:
	.string	"_NEWINDEX -1"
.LASF1209:
	.string	"_CS_LFS_LINTFLAGS _CS_LFS_LINTFLAGS"
.LASF894:
	.string	"_POSIX_THREAD_PRIO_PROTECT 200809L"
.LASF1410:
	.string	"WA_STANDOUT A_STANDOUT"
.LASF1053:
	.string	"_SC_TTY_NAME_MAX _SC_TTY_NAME_MAX"
.LASF1261:
	.string	"_CS_POSIX_V7_LPBIG_OFFBIG_LINTFLAGS _CS_POSIX_V7_LPBIG_OFFBIG_LINTFLAGS"
.LASF1247:
	.string	"_CS_POSIX_V7_ILP32_OFF32_LDFLAGS _CS_POSIX_V7_ILP32_OFF32_LDFLAGS"
.LASF362:
	.string	"__STDC_IEC_559__ 1"
.LASF788:
	.string	"_BITS_UINTN_IDENTITY_H 1"
.LASF472:
	.string	"__attribute_malloc__ __attribute__ ((__malloc__))"
.LASF579:
	.string	"__UWORD_TYPE unsigned long int"
.LASF969:
	.string	"_PC_PRIO_IO _PC_PRIO_IO"
.LASF1186:
	.string	"_SC_V7_LPBIG_OFFBIG _SC_V7_LPBIG_OFFBIG"
.LASF1113:
	.string	"_SC_ADVISORY_INFO _SC_ADVISORY_INFO"
.LASF797:
	.string	"htobe64(x) __bswap_64 (x)"
.LASF263:
	.string	"__FLT32X_HAS_INFINITY__ 1"
.LASF805:
	.string	"__FD_ISSET(d,s) ((__FDS_BITS (s)[__FD_ELT (d)] & __FD_MASK (d)) != 0)"
.LASF456:
	.string	"__glibc_objsize(__o) __bos (__o)"
.LASF1524:
	.string	"getyx(win,y,x) (y = getcury(win), x = getcurx(win))"
.LASF1369:
	.string	"NCURSES_WATTR_MACROS 0"
.LASF1537:
	.string	"nocrmode() nocbreak()"
.LASF111:
	.string	"__UINT64_MAX__ 0xffffffffffffffffUL"
.LASF113:
	.string	"__INT8_C(c) c"
.LASF522:
	.string	"__stub_chflags "
.LASF1939:
	.string	"_idlok"
.LASF1853:
	.string	"PKG_CRITICAL_TEMPERATURE_STATUS 16"
.LASF1972:
	.string	"cores"
.LASF1786:
	.string	"BUTTON3_CLICKED NCURSES_MOUSE_MASK(3, NCURSES_BUTTON_CLICKED)"
.LASF2019:
	.string	"freq"
.LASF1794:
	.string	"BUTTON5_RELEASED NCURSES_MOUSE_MASK(5, NCURSES_BUTTON_RELEASED)"
.LASF215:
	.string	"__FLT32_HAS_INFINITY__ 1"
.LASF631:
	.string	"____mbstate_t_defined 1"
.LASF1780:
	.string	"BUTTON2_PRESSED NCURSES_MOUSE_MASK(2, NCURSES_BUTTON_PRESSED)"
.LASF735:
	.string	"__WCOREDUMP(status) ((status) & __WCOREFLAG)"
.LASF1170:
	.string	"_SC_LEVEL1_DCACHE_ASSOC _SC_LEVEL1_DCACHE_ASSOC"
.LASF157:
	.string	"__FLT_MAX_EXP__ 128"
.LASF1344:
	.string	"INT8_C(c) c"
.LASF1664:
	.string	"is_scrollok(win) (NCURSES_OK_ADDR(win) ? (win)->_scroll : FALSE)"
.LASF10:
	.string	"__ATOMIC_SEQ_CST 5"
.LASF559:
	.string	"_GCC_SIZE_T "
.LASF526:
	.string	"__stub_setlogin "
.LASF679:
	.string	"__HAVE_FLOAT128X 0"
.LASF1890:
	.string	"_IO_read_end"
.LASF1009:
	.string	"_SC_PAGESIZE _SC_PAGESIZE"
.LASF799:
	.string	"be64toh(x) __bswap_64 (x)"
.LASF1151:
	.string	"_SC_2_PBS_LOCATE _SC_2_PBS_LOCATE"
.LASF274:
	.string	"__FLT64X_NORM_MAX__ 1.18973149535723176502126385303097021e+4932F64x"
.LASF202:
	.string	"__FLT32_MANT_DIG__ 24"
.LASF528:
	.string	"__stub_stty "
.LASF1778:
	.string	"BUTTON1_TRIPLE_CLICKED NCURSES_MOUSE_MASK(1, NCURSES_TRIPLE_CLICKED)"
.LASF1960:
	.string	"_pad_right"
.LASF1327:
	.string	"UINT_FAST32_MAX (18446744073709551615UL)"
.LASF421:
	.string	"__WORDSIZE 64"
.LASF1826:
	.string	"TRACE_DATABASE 0x0800"
.LASF515:
	.string	"__attr_access(x) __attribute__ ((__access__ x))"
.LASF281:
	.string	"__FLT64X_IS_IEC_60559__ 2"
.LASF1207:
	.string	"_CS_LFS_LDFLAGS _CS_LFS_LDFLAGS"
.LASF926:
	.string	"_POSIX_SPORADIC_SERVER -1"
.LASF97:
	.string	"__INTMAX_C(c) c ## L"
.LASF1167:
	.string	"_SC_LEVEL1_ICACHE_ASSOC _SC_LEVEL1_ICACHE_ASSOC"
.LASF1346:
	.string	"INT32_C(c) c"
.LASF114:
	.string	"__INT_LEAST8_WIDTH__ 8"
.LASF760:
	.string	"__uid_t_defined "
.LASF1872:
	.string	"AMD_MSR_PACKAGE_ENERGY 0xC001029B"
.LASF1672:
	.string	"KEY_MIN 0401"
.LASF935:
	.string	"_XBS5_LPBIG_OFFBIG -1"
.LASF875:
	.string	"_POSIX_SYNCHRONIZED_IO 200809L"
.LASF1029:
	.string	"_SC_2_FORT_DEV _SC_2_FORT_DEV"
.LASF732:
	.string	"__WIFSIGNALED(status) (((signed char) (((status) & 0x7f) + 1) >> 1) > 0)"
.LASF148:
	.string	"__GCC_IEC_559_COMPLEX 2"
.LASF1109:
	.string	"_SC_XBS5_LPBIG_OFFBIG _SC_XBS5_LPBIG_OFFBIG"
.LASF139:
	.string	"__INT_FAST64_WIDTH__ 64"
.LASF391:
	.string	"__USE_DYNAMIC_STACK_SIZE"
.LASF1839:
	.string	"GUILIB "
.LASF1785:
	.string	"BUTTON3_PRESSED NCURSES_MOUSE_MASK(3, NCURSES_BUTTON_PRESSED)"
.LASF1361:
	.string	"NCURSES_COLOR_T"
.LASF1673:
	.string	"KEY_BREAK 0401"
.LASF1146:
	.string	"_SC_TYPED_MEMORY_OBJECTS _SC_TYPED_MEMORY_OBJECTS"
.LASF1457:
	.string	"ACS_BOARD NCURSES_ACS('h')"
.LASF1431:
	.string	"COLOR_MAGENTA 5"
.LASF671:
	.string	"__HAVE_FLOAT64X_LONG_DOUBLE 1"
.LASF1539:
	.string	"getattrs(win) NCURSES_CAST(int, NCURSES_OK_ADDR(win) ? (win)->_attrs : A_NORMAL)"
.LASF304:
	.string	"__USER_LABEL_PREFIX__ "
.LASF501:
	.string	"__attribute_copy__"
.LASF557:
	.string	"_SIZE_T_DECLARED "
.LASF427:
	.string	"__USE_FORTIFY_LEVEL 0"
.LASF1761:
	.string	"KEY_SUSPEND 0627"
.LASF191:
	.string	"__DECIMAL_DIG__ 21"
.LASF530:
	.string	"__GLIBC_USE_LIB_EXT2 0"
.LASF128:
	.string	"__UINT_LEAST32_MAX__ 0xffffffffU"
.LASF1294:
	.string	"INT16_MIN (-32767-1)"
.LASF1235:
	.string	"_CS_POSIX_V6_ILP32_OFFBIG_LDFLAGS _CS_POSIX_V6_ILP32_OFFBIG_LDFLAGS"
.LASF1832:
	.string	"CPUMONLIB "
.LASF1568:
	.string	"addch(ch) waddch(stdscr,(ch))"
.LASF654:
	.string	"P_tmpdir \"/tmp\""
.LASF572:
	.string	"__S32_TYPE int"
.LASF857:
	.string	"_POSIX2_VERSION __POSIX2_THIS_VERSION"
.LASF482:
	.string	"__attribute_format_arg__(x) __attribute__ ((__format_arg__ (x)))"
.LASF1367:
	.string	"NCURSES_OPAQUE_MENU 0"
.LASF1070:
	.string	"_SC_XOPEN_VERSION _SC_XOPEN_VERSION"
.LASF310:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 1"
.LASF783:
	.string	"BYTE_ORDER __BYTE_ORDER"
.LASF703:
	.string	"_WCHAR_T "
.LASF1567:
	.string	"PAIR_NUMBER(a) (NCURSES_CAST(int,((NCURSES_CAST(unsigned long,(a)) & A_COLOR) >> NCURSES_ATTR_SHIFT)))"
.LASF1162:
	.string	"_SC_TRACE _SC_TRACE"
.LASF916:
	.string	"_POSIX_TIMERS 200809L"
.LASF151:
	.string	"__DEC_EVAL_METHOD__ 2"
.LASF1366:
	.string	"NCURSES_OPAQUE_FORM 0"
.LASF541:
	.string	"__GLIBC_USE_IEC_60559_TYPES_EXT"
.LASF1155:
	.string	"_SC_STREAMS _SC_STREAMS"
.LASF1723:
	.string	"KEY_OPTIONS 0561"
.LASF204:
	.string	"__FLT32_MIN_EXP__ (-125)"
.LASF1830:
	.string	"NCURSES_UNCTRL_H_incl 1"
.LASF1266:
	.string	"F_ULOCK 0"
.LASF776:
	.string	"_BITS_ENDIANNESS_H 1"
.LASF1618:
	.string	"mvwdelch(win,y,x) (wmove((win),(y),(x)) == ERR ? ERR : wdelch(win))"
.LASF1877:
	.string	"long unsigned int"
.LASF1355:
	.string	"NCURSES_ENABLE_STDBOOL_H 1"
.LASF172:
	.string	"__DBL_MIN_10_EXP__ (-307)"
.LASF752:
	.string	"MB_CUR_MAX (__ctype_get_mb_cur_max ())"
.LASF1661:
	.string	"is_nodelay(win) (NCURSES_OK_ADDR(win) ? ((win)->_delay == 0) : FALSE)"
.LASF1205:
	.string	"_CS_POSIX_V7_WIDTH_RESTRICTED_ENVS _CS_V7_WIDTH_RESTRICTED_ENVS"
.LASF261:
	.string	"__FLT32X_DENORM_MIN__ 4.94065645841246544176568792868221372e-324F32x"
.LASF1326:
	.string	"UINT_FAST16_MAX (18446744073709551615UL)"
.LASF549:
	.string	"_T_SIZE_ "
.LASF156:
	.string	"__FLT_MIN_10_EXP__ (-37)"
.LASF1590:
	.string	"erase() werase(stdscr)"
.LASF1238:
	.string	"_CS_POSIX_V6_LP64_OFF64_CFLAGS _CS_POSIX_V6_LP64_OFF64_CFLAGS"
.LASF1227:
	.string	"_CS_XBS5_LPBIG_OFFBIG_LDFLAGS _CS_XBS5_LPBIG_OFFBIG_LDFLAGS"
.LASF914:
	.string	"_POSIX_SPIN_LOCKS 200809L"
.LASF694:
	.string	"__CFLOAT32X _Complex _Float32x"
.LASF1529:
	.string	"setsyx(y,x) do { if (newscr) { if ((y) == -1 && (x) == -1) leaveok(newscr, TRUE); else { leaveok(newscr, FALSE); wmove(newscr, (y), (x)); } } } while(0)"
.LASF1491:
	.string	"GCC_NORETURN "
.LASF138:
	.string	"__INT_FAST64_MAX__ 0x7fffffffffffffffL"
.LASF1403:
	.string	"false 0"
.LASF1216:
	.string	"_CS_XBS5_ILP32_OFF32_LIBS _CS_XBS5_ILP32_OFF32_LIBS"
.LASF169:
	.string	"__DBL_MANT_DIG__ 53"
.LASF1579:
	.string	"attrset(at) wattrset(stdscr,(at))"
.LASF82:
	.string	"__WCHAR_MIN__ (-__WCHAR_MAX__ - 1)"
.LASF854:
	.string	"_UNISTD_H 1"
.LASF339:
	.string	"__k8 1"
.LASF413:
	.string	"__USE_POSIX 1"
.LASF867:
	.string	"_XOPEN_XPG4 1"
.LASF375:
	.string	"__USE_POSIX"
.LASF1088:
	.string	"_SC_WORD_BIT _SC_WORD_BIT"
.LASF713:
	.string	"__INT_WCHAR_T_H "
.LASF757:
	.string	"__gid_t_defined "
.LASF194:
	.string	"__LDBL_NORM_MAX__ 1.18973149535723176502126385303097021e+4932L"
.LASF1511:
	.string	"A_BLINK NCURSES_BITS(1U,11)"
.LASF287:
	.string	"__DEC32_EPSILON__ 1E-6DF"
.LASF1224:
	.string	"_CS_XBS5_LP64_OFF64_LIBS _CS_XBS5_LP64_OFF64_LIBS"
.LASF1376:
	.string	"NCURSES_TPARM_VARARGS"
.LASF1466:
	.string	"ACS_STERLING NCURSES_ACS('}')"
.LASF2006:
	.string	"update_sensor_data"
.LASF1278:
	.string	"NCURSES_MOUSE_VERSION 2"
.LASF1122:
	.string	"_SC_DEVICE_SPECIFIC _SC_DEVICE_SPECIFIC"
.LASF513:
	.string	"__glibc_macro_warning(message) __glibc_macro_warning1 (GCC warning message)"
.LASF406:
	.string	"__USE_ISOC99 1"
.LASF802:
	.string	"__FD_ZERO(s) do { unsigned int __i; fd_set *__arr = (s); for (__i = 0; __i < sizeof (fd_set) / sizeof (__fd_mask); ++__i) __FDS_BITS (__arr)[__i] = 0; } while (0)"
.LASF409:
	.string	"_POSIX_SOURCE"
.LASF561:
	.string	"__size_t "
.LASF1749:
	.string	"KEY_SMOVE 0613"
.LASF1324:
	.string	"INT_FAST64_MAX (__INT64_C(9223372036854775807))"
.LASF995:
	.string	"_SC_MAPPED_FILES _SC_MAPPED_FILES"
.LASF1135:
	.string	"_SC_SPIN_LOCKS _SC_SPIN_LOCKS"
.LASF819:
	.string	"FD_SET(fd,fdsetp) __FD_SET (fd, fdsetp)"
.LASF163:
	.string	"__FLT_EPSILON__ 1.19209289550781250000000000000000000e-7F"
.LASF796:
	.string	"le32toh(x) __uint32_identity (x)"
.LASF1614:
	.string	"mvwaddchstr(win,y,x,str) (wmove((win),(y),(x)) == ERR ? ERR : waddchnstr((win),(str),-1))"
.LASF1269:
	.string	"F_TEST 3"
.LASF1244:
	.string	"_CS_POSIX_V6_LPBIG_OFFBIG_LIBS _CS_POSIX_V6_LPBIG_OFFBIG_LIBS"
.LASF464:
	.string	"__errordecl(name,msg) extern void name (void) __attribute__((__error__ (msg)))"
.LASF1236:
	.string	"_CS_POSIX_V6_ILP32_OFFBIG_LIBS _CS_POSIX_V6_ILP32_OFFBIG_LIBS"
.LASF745:
	.string	"WIFSTOPPED(status) __WIFSTOPPED (status)"
.LASF320:
	.string	"__GCC_ATOMIC_TEST_AND_SET_TRUEVAL 1"
.LASF351:
	.string	"__CET__ 3"
.LASF1374:
	.string	"NCURSES_SIZE_T"
.LASF130:
	.string	"__UINT_LEAST64_MAX__ 0xffffffffffffffffUL"
.LASF531:
	.string	"__GLIBC_USE_IEC_60559_BFP_EXT"
.LASF1495:
	.string	"vid_attr(a,pair,opts) vidattr(a)"
.LASF1453:
	.string	"ACS_LARROW NCURSES_ACS(',')"
.LASF1520:
	.string	"A_RIGHT NCURSES_BITS(1U,20)"
.LASF1901:
	.string	"_chain"
.LASF499:
	.string	"__glibc_likely(cond) __builtin_expect ((cond), 1)"
.LASF125:
	.string	"__UINT8_C(c) c"
.LASF1583:
	.string	"clear() wclear(stdscr)"
.LASF758:
	.string	"__mode_t_defined "
.LASF1383:
	.string	"NCURSES_CH_T cchar_t"
.LASF209:
	.string	"__FLT32_MAX__ 3.40282346638528859811704183484516925e+38F32"
.LASF1427:
	.string	"COLOR_RED 1"
.LASF690:
	.string	"__f32x(x) x ##f32x"
.LASF1996:
	.string	"voltage_his"
.LASF1317:
	.string	"INT_FAST8_MIN (-128)"
.LASF1397:
	.string	"TRUE 1"
.LASF1742:
	.string	"KEY_SEXIT 0604"
.LASF1080:
	.string	"_SC_XOPEN_XPG3 _SC_XOPEN_XPG3"
.LASF537:
	.string	"__GLIBC_USE_IEC_60559_FUNCS_EXT"
.LASF1057:
	.string	"_SC_THREAD_THREADS_MAX _SC_THREAD_THREADS_MAX"
.LASF1073:
	.string	"_SC_XOPEN_CRYPT _SC_XOPEN_CRYPT"
.LASF1372:
	.string	"NCURSES_INTEROP_FUNCS"
.LASF1414:
	.string	"WA_DIM A_DIM"
.LASF44:
	.string	"__INTMAX_TYPE__ long int"
.LASF1308:
	.string	"INT_LEAST64_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF330:
	.string	"__amd64 1"
.LASF2013:
	.string	"malloc"
.LASF1643:
	.string	"mvinch(y,x) mvwinch(stdscr,(y),(x))"
.LASF1766:
	.string	"_XOPEN_CURSES 1"
.LASF1879:
	.string	"unsigned char"
.LASF1292:
	.string	"_BITS_STDINT_UINTN_H 1"
.LASF1562:
	.string	"winsstr(w,s) winsnstr(w, s, -1)"
.LASF1538:
	.string	"gettmode() "
.LASF1318:
	.string	"INT_FAST16_MIN (-9223372036854775807L-1)"
.LASF514:
	.string	"__HAVE_GENERIC_SELECTION 1"
.LASF1804:
	.string	"BUTTON_RELEASE(e,x) ((e) & NCURSES_MOUSE_MASK(x, 001))"
.LASF1322:
	.string	"INT_FAST16_MAX (9223372036854775807L)"
.LASF32:
	.string	"__ORDER_LITTLE_ENDIAN__ 1234"
.LASF1007:
	.string	"_SC_MQ_PRIO_MAX _SC_MQ_PRIO_MAX"
.LASF1635:
	.string	"mvaddnstr(y,x,str,n) mvwaddnstr(stdscr,(y),(x),(str),(n))"
.LASF959:
	.string	"_PC_MAX_CANON _PC_MAX_CANON"
.LASF1191:
	.string	"_SC_TRACE_USER_EVENT_MAX _SC_TRACE_USER_EVENT_MAX"
.LASF2033:
	.string	"_IO_lock_t"
.LASF1978:
	.string	"power_unit"
.LASF1772:
	.string	"NCURSES_TRIPLE_CLICKED 020L"
.LASF154:
	.string	"__FLT_DIG__ 6"
.LASF76:
	.string	"__SCHAR_MAX__ 0x7f"
.LASF1134:
	.string	"_SC_READER_WRITER_LOCKS _SC_READER_WRITER_LOCKS"
.LASF461:
	.string	"__glibc_fortify(f,__l,__s,__osz,...) (__glibc_safe_or_unknown_len (__l, __s, __osz) ? __ ## f ## _alias (__VA_ARGS__) : (__glibc_unsafe_len (__l, __s, __osz) ? __ ## f ## _chk_warn (__VA_ARGS__, __osz) : __ ## f ## _chk (__VA_ARGS__, __osz)))"
.LASF1451:
	.string	"ACS_PLMINUS NCURSES_ACS('g')"
.LASF1446:
	.string	"ACS_S1 NCURSES_ACS('o')"
.LASF1970:
	.string	"float"
.LASF1578:
	.string	"attron(at) wattron(stdscr,(at))"
.LASF1864:
	.string	"PKG_PL2_STATUS 2048"
.LASF173:
	.string	"__DBL_MAX_EXP__ 1024"
.LASF373:
	.string	"__USE_ISOC95"
.LASF1684:
	.string	"KEY_DL 0510"
.LASF372:
	.string	"__USE_ISOC99"
.LASF126:
	.string	"__UINT_LEAST16_MAX__ 0xffff"
.LASF964:
	.string	"_PC_CHOWN_RESTRICTED _PC_CHOWN_RESTRICTED"
.LASF1345:
	.string	"INT16_C(c) c"
.LASF712:
	.string	"___int_wchar_t_h "
.LASF1782:
	.string	"BUTTON2_DOUBLE_CLICKED NCURSES_MOUSE_MASK(2, NCURSES_DOUBLE_CLICKED)"
.LASF889:
	.string	"_POSIX_THREAD_SAFE_FUNCTIONS 200809L"
.LASF254:
	.string	"__FLT32X_MAX_EXP__ 1024"
.LASF1748:
	.string	"KEY_SMESSAGE 0612"
.LASF1131:
	.string	"_SC_MULTI_PROCESS _SC_MULTI_PROCESS"
.LASF101:
	.string	"__SIG_ATOMIC_MAX__ 0x7fffffff"
.LASF1676:
	.string	"KEY_DOWN 0402"
.LASF29:
	.string	"__SIZEOF_SIZE_T__ 8"
.LASF1966:
	.string	"cpu_avg"
.LASF769:
	.string	"_BITS_STDINT_INTN_H 1"
.LASF333:
	.string	"__x86_64__ 1"
.LASF1200:
	.string	"_CS_GNU_LIBC_VERSION _CS_GNU_LIBC_VERSION"
.LASF1683:
	.string	"KEY_F(n) (KEY_F0+(n))"
.LASF510:
	.string	"__REDIRECT_LDBL(name,proto,alias) __REDIRECT (name, proto, alias)"
.LASF94:
	.string	"__PTRDIFF_WIDTH__ 64"
.LASF1439:
	.string	"ACS_LTEE NCURSES_ACS('t')"
.LASF781:
	.string	"BIG_ENDIAN __BIG_ENDIAN"
.LASF382:
	.string	"__USE_XOPEN2K"
.LASF1963:
	.string	"stderr"
.LASF378:
	.string	"__USE_POSIX199506"
.LASF1580:
	.string	"bkgd(ch) wbkgd(stdscr,(ch))"
.LASF1674:
	.string	"KEY_SRESET 0530"
.LASF444:
	.string	"__NTH(fct) __attribute__ ((__nothrow__ __LEAF)) fct"
.LASF357:
	.string	"__unix__ 1"
.LASF1092:
	.string	"_SC_SCHAR_MAX _SC_SCHAR_MAX"
.LASF1831:
	.string	"unctrl"
.LASF1455:
	.string	"ACS_DARROW NCURSES_ACS('.')"
.LASF195:
	.string	"__LDBL_MIN__ 3.36210314311209350626267781732175260e-4932L"
.LASF402:
	.string	"_DEFAULT_SOURCE"
.LASF967:
	.string	"_PC_SYNC_IO _PC_SYNC_IO"
.LASF871:
	.string	"_BITS_POSIX_OPT_H 1"
.LASF1834:
	.string	"BATTERY_STATUS_BUF_SIZE 20"
.LASF1313:
	.string	"UINT_LEAST8_MAX (255)"
.LASF64:
	.string	"__UINT_LEAST64_TYPE__ long unsigned int"
.LASF1515:
	.string	"A_INVIS NCURSES_BITS(1U,15)"
.LASF1215:
	.string	"_CS_XBS5_ILP32_OFF32_LDFLAGS _CS_XBS5_ILP32_OFF32_LDFLAGS"
.LASF1589:
	.string	"echochar(c) wechochar(stdscr,(c))"
.LASF488:
	.string	"__wur "
.LASF175:
	.string	"__DBL_DECIMAL_DIG__ 17"
.LASF24:
	.string	"__SIZEOF_LONG_LONG__ 8"
.LASF445:
	.string	"__NTHNL(fct) __attribute__ ((__nothrow__)) fct"
.LASF1408:
	.string	"WA_ATTRIBUTES A_ATTRIBUTES"
.LASF1974:
	.string	"pkg_cumulative"
.LASF734:
	.string	"__WIFCONTINUED(status) ((status) == __W_CONTINUED)"
.LASF271:
	.string	"__FLT64X_MAX_10_EXP__ 4932"
.LASF208:
	.string	"__FLT32_DECIMAL_DIG__ 9"
.LASF909:
	.string	"_POSIX_THREAD_CPUTIME 0"
.LASF1857:
	.string	"THERMAL_STATUS 2"
.LASF1055:
	.string	"_SC_THREAD_KEYS_MAX _SC_THREAD_KEYS_MAX"
.LASF765:
	.string	"__clock_t_defined 1"
.LASF403:
	.string	"_DEFAULT_SOURCE 1"
.LASF709:
	.string	"_WCHAR_T_DEFINED_ "
.LASF1100:
	.string	"_SC_NL_ARGMAX _SC_NL_ARGMAX"
.LASF595:
	.string	"__FSWORD_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF1024:
	.string	"_SC_RE_DUP_MAX _SC_RE_DUP_MAX"
.LASF239:
	.string	"__FLT128_MAX_10_EXP__ 4932"
.LASF1143:
	.string	"_SC_SYSTEM_DATABASE _SC_SYSTEM_DATABASE"
.LASF1068:
	.string	"_SC_ATEXIT_MAX _SC_ATEXIT_MAX"
.LASF937:
	.string	"_POSIX_V6_LP64_OFF64 1"
.LASF1230:
	.string	"_CS_POSIX_V6_ILP32_OFF32_CFLAGS _CS_POSIX_V6_ILP32_OFF32_CFLAGS"
.LASF812:
	.string	"__NFDBITS"
.LASF442:
	.string	"__THROW __attribute__ ((__nothrow__ __LEAF))"
.LASF949:
	.string	"__intptr_t_defined "
.LASF1544:
	.string	"getmaxx(win) (NCURSES_OK_ADDR(win) ? ((win)->_maxx + 1) : ERR)"
.LASF1638:
	.string	"mvdelch(y,x) mvwdelch(stdscr,(y),(x))"
.LASF1300:
	.string	"INT64_MAX (__INT64_C(9223372036854775807))"
.LASF1311:
	.string	"INT_LEAST32_MAX (2147483647)"
.LASF504:
	.string	"__LDBL_REDIR1(name,proto,alias) name proto"
.LASF153:
	.string	"__FLT_MANT_DIG__ 24"
.LASF1441:
	.string	"ACS_BTEE NCURSES_ACS('v')"
.LASF737:
	.string	"__W_STOPCODE(sig) ((sig) << 8 | 0x7f)"
.LASF455:
	.string	"__glibc_objsize0(__o) __bos0 (__o)"
.LASF858:
	.string	"_POSIX2_C_VERSION __POSIX2_THIS_VERSION"
.LASF358:
	.string	"unix 1"
.LASF1123:
	.string	"_SC_DEVICE_SPECIFIC_R _SC_DEVICE_SPECIFIC_R"
.LASF1926:
	.string	"_win_st"
.LASF577:
	.string	"__UQUAD_TYPE unsigned long int"
.LASF1753:
	.string	"KEY_SPRINT 0617"
.LASF1732:
	.string	"KEY_SBEG 0572"
.LASF1681:
	.string	"KEY_BACKSPACE 0407"
.LASF385:
	.string	"__USE_XOPEN2K8XSI"
.LASF1867:
	.string	"BIT31 0x8000000"
.LASF1604:
	.string	"refresh() wrefresh(stdscr)"
.LASF768:
	.string	"__timer_t_defined 1"
.LASF1060:
	.string	"_SC_THREAD_PRIORITY_SCHEDULING _SC_THREAD_PRIORITY_SCHEDULING"
.LASF1704:
	.string	"KEY_B2 0536"
.LASF1737:
	.string	"KEY_SDC 0577"
.LASF1328:
	.string	"UINT_FAST64_MAX (__UINT64_C(18446744073709551615))"
.LASF95:
	.string	"__SIZE_WIDTH__ 64"
.LASF566:
	.string	"__need___va_list "
.LASF663:
	.string	"stdout stdout"
.LASF680:
	.string	"__HAVE_DISTINCT_FLOAT16 __HAVE_FLOAT16"
.LASF1910:
	.string	"_codecvt"
.LASF424:
	.string	"__TIMESIZE __WORDSIZE"
.LASF112:
	.string	"__INT_LEAST8_MAX__ 0x7f"
.LASF1893:
	.string	"_IO_write_ptr"
.LASF155:
	.string	"__FLT_MIN_EXP__ (-125)"
.LASF276:
	.string	"__FLT64X_EPSILON__ 1.08420217248550443400745280086994171e-19F64x"
.LASF756:
	.string	"__dev_t_defined "
.LASF35:
	.string	"__BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__"
.LASF1959:
	.string	"_pad_bottom"
.LASF807:
	.string	"____sigset_t_defined "
.LASF771:
	.string	"_ENDIAN_H 1"
.LASF152:
	.string	"__FLT_RADIX__ 2"
.LASF119:
	.string	"__INT32_C(c) c"
.LASF512:
	.string	"__glibc_macro_warning1(message) _Pragma (#message)"
.LASF1280:
	.string	"NCURSES_PUBLIC_VAR(name) _nc_ ##name"
.LASF1386:
	.string	"_ANSI_STDARG_H_ "
.LASF201:
	.string	"__LDBL_IS_IEC_60559__ 2"
.LASF251:
	.string	"__FLT32X_DIG__ 15"
.LASF1036:
	.string	"_SC_PII_INTERNET _SC_PII_INTERNET"
.LASF1985:
	.string	"cpu_designer_e"
.LASF1350:
	.string	"UINT32_C(c) c ## U"
.LASF1460:
	.string	"ACS_S3 NCURSES_ACS('p')"
.LASF1994:
	.string	"load_his"
.LASF392:
	.string	"__USE_GNU"
.LASF1304:
	.string	"UINT64_MAX (__UINT64_C(18446744073709551615))"
.LASF150:
	.string	"__FLT_EVAL_METHOD_TS_18661_3__ 0"
.LASF1111:
	.string	"_SC_XOPEN_REALTIME _SC_XOPEN_REALTIME"
.LASF1513:
	.string	"A_BOLD NCURSES_BITS(1U,13)"
.LASF1685:
	.string	"KEY_IL 0511"
.LASF1424:
	.string	"WA_VERTICAL A_VERTICAL"
.LASF911:
	.string	"_POSIX_READER_WRITER_LOCKS 200809L"
.LASF1392:
	.string	"_VA_LIST_ "
.LASF774:
	.string	"__BIG_ENDIAN 4321"
.LASF298:
	.string	"__DEC128_MAX_EXP__ 6145"
.LASF1697:
	.string	"KEY_CTAB 0525"
.LASF1852:
	.string	"PKG_THERMAL_STATUS 1"
.LASF2010:
	.string	"exit"
.LASF861:
	.string	"_POSIX2_SW_DEV __POSIX2_THIS_VERSION"
.LASF682:
	.string	"__HAVE_DISTINCT_FLOAT64 0"
.LASF1089:
	.string	"_SC_MB_LEN_MAX _SC_MB_LEN_MAX"
.LASF1157:
	.string	"_SC_V6_ILP32_OFF32 _SC_V6_ILP32_OFF32"
.LASF1709:
	.string	"KEY_CANCEL 0543"
.LASF1421:
	.string	"WA_LOW A_LOW"
.LASF288:
	.string	"__DEC32_SUBNORMAL_MIN__ 0.000001E-95DF"
.LASF394:
	.string	"__KERNEL_STRICT_NAMES"
.LASF853:
	.string	"__COMPAR_FN_T "
.LASF45:
	.string	"__UINTMAX_TYPE__ long unsigned int"
.LASF583:
	.string	"__U64_TYPE unsigned long int"
.LASF250:
	.string	"__FLT32X_MANT_DIG__ 53"
.LASF627:
	.string	"_BITS_TIME64_H 1"
.LASF1189:
	.string	"_SC_TRACE_NAME_MAX _SC_TRACE_NAME_MAX"
.LASF1456:
	.string	"ACS_UARROW NCURSES_ACS('-')"
.LASF1323:
	.string	"INT_FAST32_MAX (9223372036854775807L)"
.LASF69:
	.string	"__UINT_FAST8_TYPE__ unsigned char"
.LASF652:
	.string	"SEEK_CUR 1"
.LASF2003:
	.string	"wattr_on"
.LASF47:
	.string	"__CHAR32_TYPE__ unsigned int"
.LASF607:
	.string	"__ID_T_TYPE __U32_TYPE"
.LASF89:
	.string	"__INT_WIDTH__ 32"
.LASF1979:
	.string	"battery"
.LASF474:
	.string	"__attribute_alloc_align__(param) __attribute__ ((__alloc_align__ param))"
.LASF56:
	.string	"__UINT64_TYPE__ long unsigned int"
.LASF1739:
	.string	"KEY_SELECT 0601"
.LASF1751:
	.string	"KEY_SOPTIONS 0615"
.LASF1603:
	.string	"move(y,x) wmove(stdscr,(y),(x))"
.LASF1770:
	.string	"NCURSES_BUTTON_CLICKED 004L"
.LASF1711:
	.string	"KEY_COMMAND 0545"
.LASF728:
	.string	"__WEXITSTATUS(status) (((status) & 0xff00) >> 8)"
.LASF1438:
	.string	"ACS_LRCORNER NCURSES_ACS('j')"
.LASF665:
	.string	"__attr_dealloc_fclose"
.LASF387:
	.string	"__USE_LARGEFILE64"
.LASF991:
	.string	"_SC_ASYNCHRONOUS_IO _SC_ASYNCHRONOUS_IO"
.LASF823:
	.string	"__blksize_t_defined "
.LASF217:
	.string	"__FLT32_IS_IEC_60559__ 2"
.LASF770:
	.string	"__BIT_TYPES_DEFINED__ 1"
.LASF1828:
	.string	"TRACE_SHIFT 13"
.LASF490:
	.string	"__always_inline __inline __attribute__ ((__always_inline__))"
.LASF21:
	.string	"__LP64__ 1"
.LASF571:
	.string	"__U16_TYPE unsigned short int"
.LASF1669:
	.string	"wgetscrreg(win,t,b) (NCURSES_OK_ADDR(win) ? (*(t) = (win)->_regtop, *(b) = (win)->_regbottom, OK) : ERR)"
.LASF793:
	.string	"htobe32(x) __bswap_32 (x)"
.LASF1472:
	.string	"ACS_SSSB ACS_LTEE"
.LASF485:
	.string	"__nonnull(params) __attribute_nonnull__ (params)"
.LASF2012:
	.string	"identifiy_cpu"
.LASF1158:
	.string	"_SC_V6_ILP32_OFFBIG _SC_V6_ILP32_OFFBIG"
.LASF197:
	.string	"__LDBL_DENORM_MIN__ 3.64519953188247460252840593361941982e-4951L"
.LASF349:
	.string	"__SEG_FS 1"
.LASF475:
	.string	"__attribute_pure__ __attribute__ ((__pure__))"
.LASF256:
	.string	"__FLT32X_DECIMAL_DIG__ 17"
.LASF79:
	.string	"__LONG_MAX__ 0x7fffffffffffffffL"
.LASF1775:
	.string	"BUTTON1_PRESSED NCURSES_MOUSE_MASK(1, NCURSES_BUTTON_PRESSED)"
.LASF314:
	.string	"__GCC_ATOMIC_CHAR32_T_LOCK_FREE 2"
.LASF1470:
	.string	"ACS_SBBS ACS_LRCORNER"
.LASF50:
	.string	"__INT16_TYPE__ short int"
.LASF235:
	.string	"__FLT128_DIG__ 33"
.LASF398:
	.string	"__KERNEL_STRICT_NAMES "
.LASF1404:
	.string	"__bool_true_false_are_defined 1"
.LASF634:
	.string	"__FILE_defined 1"
.LASF677:
	.string	"__HAVE_FLOAT64 1"
.LASF1163:
	.string	"_SC_TRACE_EVENT_FILTER _SC_TRACE_EVENT_FILTER"
.LASF1105:
	.string	"_SC_NL_TEXTMAX _SC_NL_TEXTMAX"
.LASF1678:
	.string	"KEY_LEFT 0404"
.LASF558:
	.string	"___int_size_t_h "
.LASF63:
	.string	"__UINT_LEAST32_TYPE__ unsigned int"
.LASF554:
	.string	"_SIZE_T_DEFINED_ "
.LASF1884:
	.string	"size_t"
.LASF318:
	.string	"__GCC_ATOMIC_LONG_LOCK_FREE 2"
.LASF782:
	.string	"PDP_ENDIAN __PDP_ENDIAN"
.LASF1239:
	.string	"_CS_POSIX_V6_LP64_OFF64_LDFLAGS _CS_POSIX_V6_LP64_OFF64_LDFLAGS"
.LASF1198:
	.string	"_CS_V6_WIDTH_RESTRICTED_ENVS _CS_V6_WIDTH_RESTRICTED_ENVS"
.LASF1720:
	.string	"KEY_MOVE 0556"
.LASF2005:
	.string	"cpucore_load"
.LASF609:
	.string	"__TIME_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF84:
	.string	"__WINT_MIN__ 0U"
.LASF1803:
	.string	"ALL_MOUSE_EVENTS (REPORT_MOUSE_POSITION - 1)"
.LASF978:
	.string	"_PC_2_SYMLINKS _PC_2_SYMLINKS"
.LASF1612:
	.string	"mvwaddch(win,y,x,ch) (wmove((win),(y),(x)) == ERR ? ERR : waddch((win),(ch)))"
.LASF913:
	.string	"_POSIX_TIMEOUTS 200809L"
.LASF1176:
	.string	"_SC_LEVEL3_CACHE_ASSOC _SC_LEVEL3_CACHE_ASSOC"
.LASF523:
	.string	"__stub_fchflags "
.LASF659:
	.string	"L_ctermid 9"
.LASF1741:
	.string	"KEY_SEOL 0603"
.LASF2024:
	.string	"my_power"
.LASF575:
	.string	"__ULONGWORD_TYPE unsigned long int"
.LASF944:
	.string	"__LP64_OFF64_LDFLAGS \"-m64\""
.LASF563:
	.string	"NULL"
.LASF1787:
	.string	"BUTTON3_DOUBLE_CLICKED NCURSES_MOUSE_MASK(3, NCURSES_DOUBLE_CLICKED)"
.LASF1837:
	.string	"POLL_INTERVAL_S 1"
.LASF841:
	.string	"_BITS_ATOMIC_WIDE_COUNTER_H "
.LASF401:
	.string	"__GLIBC_USE(F) __GLIBC_USE_ ## F"
.LASF379:
	.string	"__USE_XOPEN"
.LASF1659:
	.string	"is_keypad(win) (NCURSES_OK_ADDR(win) ? (win)->_use_keypad : FALSE)"
.LASF331:
	.string	"__amd64__ 1"
.LASF1471:
	.string	"ACS_SBSS ACS_RTEE"
.LASF300:
	.string	"__DEC128_MAX__ 9.999999999999999999999999999999999E6144DL"
.LASF1639:
	.string	"mvgetch(y,x) mvwgetch(stdscr,(y),(x))"
.LASF1995:
	.string	"temp_his"
.LASF1623:
	.string	"mvwinch(win,y,x) (wmove((win),(y),(x)) == ERR ? NCURSES_CAST(chtype, ERR) : winch(win))"
.LASF1154:
	.string	"_SC_SYMLOOP_MAX _SC_SYMLOOP_MAX"
.LASF1932:
	.string	"_begx"
.LASF422:
	.string	"__WORDSIZE_TIME64_COMPAT32 1"
.LASF1658:
	.string	"is_immedok(win) (NCURSES_OK_ADDR(win) ? (win)->_immed : FALSE)"
.LASF1413:
	.string	"WA_BLINK A_BLINK"
.LASF903:
	.string	"_LFS64_ASYNCHRONOUS_IO 1"
.LASF517:
	.string	"__attr_access_none(argno) __attribute__ ((__access__ (__none__, argno)))"
.LASF714:
	.string	"_GCC_WCHAR_T "
.LASF502:
	.string	"__attribute_copy__(arg) __attribute__ ((__copy__ (arg)))"
.LASF1702:
	.string	"KEY_A1 0534"
.LASF1045:
	.string	"_SC_PII_OSI_CLTS _SC_PII_OSI_CLTS"
.LASF1596:
	.string	"innstr(s,n) winnstr(stdscr,(s),(n))"
.LASF1061:
	.string	"_SC_THREAD_PRIO_INHERIT _SC_THREAD_PRIO_INHERIT"
.LASF1764:
	.string	"KEY_RESIZE 0632"
.LASF588:
	.string	"__DEV_T_TYPE __UQUAD_TYPE"
.LASF739:
	.string	"__WCOREFLAG 0x80"
.LASF1340:
	.string	"WCHAR_MIN __WCHAR_MIN"
.LASF1525:
	.string	"getbegyx(win,y,x) (y = getbegy(win), x = getbegx(win))"
.LASF1897:
	.string	"_IO_save_base"
.LASF509:
	.string	"__LDBL_REDIR_DECL(name) "
.LASF1593:
	.string	"inch() winch(stdscr)"
.LASF1636:
	.string	"mvaddstr(y,x,str) mvwaddstr(stdscr,(y),(x),(str))"
.LASF543:
	.string	"__need_size_t "
.LASF1842:
	.string	"RED 3"
.LASF1387:
	.string	"va_start(v,l) __builtin_va_start(v,l)"
.LASF168:
	.string	"__FLT_IS_IEC_60559__ 2"
.LASF1933:
	.string	"_attrs"
.LASF905:
	.string	"_LFS64_LARGEFILE 1"
.LASF187:
	.string	"__LDBL_MIN_EXP__ (-16381)"
.LASF766:
	.string	"__clockid_t_defined 1"
.LASF716:
	.string	"_BSD_WCHAR_T_"
.LASF1840:
	.string	"WHITE 1"
.LASF1128:
	.string	"_SC_FILE_LOCKING _SC_FILE_LOCKING"
.LASF1064:
	.string	"_SC_NPROCESSORS_CONF _SC_NPROCESSORS_CONF"
.LASF323:
	.string	"__GCC_HAVE_DWARF2_CFI_ASM 1"
.LASF673:
	.string	"__CFLOAT128 _Complex _Float128"
.LASF1463:
	.string	"ACS_GEQUAL NCURSES_ACS('z')"
.LASF1106:
	.string	"_SC_XBS5_ILP32_OFF32 _SC_XBS5_ILP32_OFF32"
.LASF552:
	.string	"_SIZE_T_ "
.LASF780:
	.string	"LITTLE_ENDIAN __LITTLE_ENDIAN"
.LASF876:
	.string	"_POSIX_FSYNC 200809L"
.LASF881:
	.string	"_POSIX_CHOWN_RESTRICTED 0"
.LASF952:
	.string	"W_OK 2"
.LASF1014:
	.string	"_SC_SIGQUEUE_MAX _SC_SIGQUEUE_MAX"
.LASF562:
	.string	"__need_size_t"
.LASF1452:
	.string	"ACS_BULLET NCURSES_ACS('~')"
.LASF1946:
	.string	"_regtop"
.LASF2028:
	.string	"command"
.LASF785:
	.string	"__bswap_constant_16(x) ((__uint16_t) ((((x) >> 8) & 0xff) | (((x) & 0xff) << 8)))"
.LASF105:
	.string	"__INT16_MAX__ 0x7fff"
.LASF1222:
	.string	"_CS_XBS5_LP64_OFF64_CFLAGS _CS_XBS5_LP64_OFF64_CFLAGS"
.LASF931:
	.string	"_POSIX_TRACE_LOG -1"
.LASF1229:
	.string	"_CS_XBS5_LPBIG_OFFBIG_LINTFLAGS _CS_XBS5_LPBIG_OFFBIG_LINTFLAGS"
.LASF1951:
	.string	"_pad"
.LASF299:
	.string	"__DEC128_MIN__ 1E-6143DL"
.LASF1509:
	.string	"A_UNDERLINE NCURSES_BITS(1U,9)"
.LASF1103:
	.string	"_SC_NL_NMAX _SC_NL_NMAX"
.LASF52:
	.string	"__INT64_TYPE__ long int"
.LASF1504:
	.string	"A_NORMAL (1U - 1U)"
.LASF1976:
	.string	"time_unit"
.LASF289:
	.string	"__DEC64_MANT_DIG__ 16"
.LASF1824:
	.string	"TRACE_ICALLS 0x0200"
.LASF1850:
	.string	"MSR_TEMPERATURE_TARGET 0x1A2"
.LASF167:
	.string	"__FLT_HAS_QUIET_NAN__ 1"
.LASF1923:
	.string	"chtype"
.LASF1354:
	.string	"_GCC_WRAP_STDINT_H "
.LASF1969:
	.string	"per_core"
.LASF1477:
	.string	"ACS_SSSS ACS_PLUS"
.LASF1353:
	.string	"UINTMAX_C(c) c ## UL"
.LASF381:
	.string	"__USE_UNIX98"
.LASF1914:
	.string	"__pad5"
.LASF1911:
	.string	"_wide_data"
.LASF1041:
	.string	"_SC_IOV_MAX _SC_IOV_MAX"
.LASF448:
	.string	"__CONCAT(x,y) x ## y"
.LASF1876:
	.string	"SYSFS "
.LASF742:
	.string	"WSTOPSIG(status) __WSTOPSIG (status)"
.LASF1487:
	.string	"_NOCHANGE -1"
.LASF213:
	.string	"__FLT32_DENORM_MIN__ 1.40129846432481707092372958328991613e-45F32"
.LASF87:
	.string	"__SCHAR_WIDTH__ 8"
.LASF524:
	.string	"__stub_gtty "
.LASF1875:
	.string	"AMD_POWER_UNIT_MASK 0xF"
.LASF880:
	.string	"_POSIX_MEMORY_PROTECTION 200809L"
.LASF34:
	.string	"__ORDER_PDP_ENDIAN__ 3412"
.LASF621:
	.string	"__OFF_T_MATCHES_OFF64_T 1"
.LASF804:
	.string	"__FD_CLR(d,s) ((void) (__FDS_BITS (s)[__FD_ELT(d)] &= ~__FD_MASK(d)))"
.LASF1648:
	.string	"mvinsnstr(y,x,s,n) mvwinsnstr(stdscr,(y),(x),(s),(n))"
.LASF1652:
	.string	"getbkgd(win) (NCURSES_OK_ADDR(win) ? ((win)->_bkgd) : 0)"
.LASF1608:
	.string	"standout() wstandout(stdscr)"
.LASF80:
	.string	"__LONG_LONG_MAX__ 0x7fffffffffffffffLL"
.LASF1161:
	.string	"_SC_HOST_NAME_MAX _SC_HOST_NAME_MAX"
.LASF1817:
	.string	"TRACE_MOVE 0x0008"
.LASF1836:
	.string	"BUFSIZE 64"
.LASF674:
	.string	"_BITS_FLOATN_COMMON_H "
.LASF1717:
	.string	"KEY_HELP 0553"
.LASF893:
	.string	"_POSIX_THREAD_PRIO_INHERIT 200809L"
.LASF988:
	.string	"_SC_REALTIME_SIGNALS _SC_REALTIME_SIGNALS"
.LASF1502:
	.string	"NCURSES_ATTR_SHIFT 8"
.LASF1214:
	.string	"_CS_XBS5_ILP32_OFF32_CFLAGS _CS_XBS5_ILP32_OFF32_CFLAGS"
.LASF1305:
	.string	"INT_LEAST8_MIN (-128)"
.LASF1660:
	.string	"is_leaveok(win) (NCURSES_OK_ADDR(win) ? (win)->_leaveok : FALSE)"
.LASF623:
	.string	"__RLIM_T_MATCHES_RLIM64_T 1"
.LASF1936:
	.string	"_clear"
.LASF1033:
	.string	"_SC_PII _SC_PII"
.LASF1935:
	.string	"_notimeout"
.LASF1649:
	.string	"mvinsstr(y,x,s) mvwinsstr(stdscr,(y),(x),(s))"
.LASF1351:
	.string	"UINT64_C(c) c ## UL"
.LASF672:
	.string	"__f128(x) x ##f128"
.LASF1274:
	.string	"NCURSES_VERSION_MINOR 3"
.LASF825:
	.string	"__fsblkcnt_t_defined "
.LASF1114:
	.string	"_SC_BARRIERS _SC_BARRIERS"
.LASF228:
	.string	"__FLT64_EPSILON__ 2.22044604925031308084726333618164062e-16F64"
.LASF1095:
	.string	"_SC_SHRT_MIN _SC_SHRT_MIN"
.LASF1506:
	.string	"A_CHARTEXT (NCURSES_BITS(1U,0) - 1U)"
.LASF1458:
	.string	"ACS_LANTERN NCURSES_ACS('i')"
.LASF906:
	.string	"_LFS64_STDIO 1"
.LASF100:
	.string	"__INTMAX_WIDTH__ 64"
.LASF1081:
	.string	"_SC_XOPEN_XPG4 _SC_XOPEN_XPG4"
.LASF568:
	.string	"__GNUC_VA_LIST "
.LASF1637:
	.string	"mvchgat(y,x,n,a,c,o) mvwchgat(stdscr,(y),(x),(n),(a),(c),(o))"
.LASF1166:
	.string	"_SC_LEVEL1_ICACHE_SIZE _SC_LEVEL1_ICACHE_SIZE"
.LASF1563:
	.string	"redrawwin(win) wredrawln(win, 0, (NCURSES_OK_ADDR(win) ? (win)->_maxy+1 : -1))"
.LASF269:
	.string	"__FLT64X_MIN_10_EXP__ (-4931)"
.LASF1622:
	.string	"mvwhline(win,y,x,c,n) (wmove((win),(y),(x)) == ERR ? ERR : whline((win),(c),(n)))"
.LASF826:
	.string	"__fsfilcnt_t_defined "
.LASF1039:
	.string	"_SC_SELECT _SC_SELECT"
.LASF719:
	.string	"WNOHANG 1"
.LASF1234:
	.string	"_CS_POSIX_V6_ILP32_OFFBIG_CFLAGS _CS_POSIX_V6_ILP32_OFFBIG_CFLAGS"
.LASF1004:
	.string	"_SC_AIO_PRIO_DELTA_MAX _SC_AIO_PRIO_DELTA_MAX"
.LASF1283:
	.string	"NCURSES_EXPORT(type) NCURSES_IMPEXP type NCURSES_API"
.LASF835:
	.string	"__SIZEOF_PTHREAD_COND_T 48"
.LASF9:
	.string	"__ATOMIC_RELAXED 0"
.LASF1426:
	.string	"COLOR_BLACK 0"
.LASF98:
	.string	"__UINTMAX_MAX__ 0xffffffffffffffffUL"
.LASF1736:
	.string	"KEY_SCREATE 0576"
.LASF365:
	.string	"__STDC_IEC_60559_COMPLEX__ 201404L"
.LASF868:
	.string	"_XOPEN_UNIX 1"
.LASF1474:
	.string	"ACS_BSSS ACS_TTEE"
.LASF430:
	.string	"__GNU_LIBRARY__"
.LASF1204:
	.string	"_CS_V7_WIDTH_RESTRICTED_ENVS _CS_V7_WIDTH_RESTRICTED_ENVS"
.LASF426:
	.string	"__USE_ATFILE 1"
.LASF1197:
	.string	"_CS_PATH _CS_PATH"
.LASF879:
	.string	"_POSIX_MEMLOCK_RANGE 200809L"
.LASF1035:
	.string	"_SC_PII_SOCKET _SC_PII_SOCKET"
.LASF648:
	.string	"_IONBF 2"
.LASF1510:
	.string	"A_REVERSE NCURSES_BITS(1U,10)"
.LASF1444:
	.string	"ACS_VLINE NCURSES_ACS('x')"
.LASF1043:
	.string	"_SC_PII_INTERNET_DGRAM _SC_PII_INTERNET_DGRAM"
.LASF180:
	.string	"__DBL_DENORM_MIN__ ((double)4.94065645841246544176568792868221372e-324L)"
.LASF1363:
	.string	"NCURSES_PAIRS_T"
.LASF1461:
	.string	"ACS_S7 NCURSES_ACS('r')"
.LASF950:
	.string	"__socklen_t_defined "
.LASF147:
	.string	"__GCC_IEC_559 2"
.LASF1315:
	.string	"UINT_LEAST32_MAX (4294967295U)"
.LASF469:
	.string	"__REDIRECT_NTHNL(name,proto,alias) name proto __asm__ (__ASMNAME (#alias)) __THROWNL"
.LASF2009:
	.string	"fprintf"
.LASF1165:
	.string	"_SC_TRACE_LOG _SC_TRACE_LOG"
.LASF1501:
	.string	"NCURSES_SP_OUTC NCURSES_SP_NAME(NCURSES_OUTC)"
.LASF657:
	.string	"TMP_MAX 238328"
.LASF344:
	.string	"__SSE2__ 1"
.LASF1145:
	.string	"_SC_TIMEOUTS _SC_TIMEOUTS"
.LASF721:
	.string	"WSTOPPED 2"
.LASF863:
	.string	"_XOPEN_VERSION 700"
.LASF1715:
	.string	"KEY_EXIT 0551"
.LASF1653:
	.string	"slk_attr_off(a,v) ((v) ? ERR : slk_attroff(a))"
.LASF2011:
	.string	"kbhit"
.LASF146:
	.string	"__UINTPTR_MAX__ 0xffffffffffffffffUL"
.LASF1998:
	.string	"power_config"
.LASF1802:
	.string	"REPORT_MOUSE_POSITION NCURSES_MOUSE_MASK(6, 0010L)"
.LASF849:
	.string	"__have_pthread_attr_t 1"
.LASF1425:
	.string	"WA_ITALIC A_ITALIC"
.LASF722:
	.string	"WEXITED 4"
.LASF1075:
	.string	"_SC_XOPEN_SHM _SC_XOPEN_SHM"
.LASF134:
	.string	"__INT_FAST16_MAX__ 0x7fffffffffffffffL"
.LASF1713:
	.string	"KEY_CREATE 0547"
.LASF897:
	.string	"_POSIX_SEMAPHORES 200809L"
.LASF971:
	.string	"_PC_FILESIZEBITS _PC_FILESIZEBITS"
.LASF715:
	.string	"_WCHAR_T_DECLARED "
.LASF963:
	.string	"_PC_PIPE_BUF _PC_PIPE_BUF"
.LASF12:
	.string	"__ATOMIC_RELEASE 3"
.LASF107:
	.string	"__INT64_MAX__ 0x7fffffffffffffffL"
.LASF839:
	.string	"__LOCK_ALIGNMENT "
.LASF346:
	.string	"__SSE_MATH__ 1"
.LASF1788:
	.string	"BUTTON3_TRIPLE_CLICKED NCURSES_MOUSE_MASK(3, NCURSES_TRIPLE_CLICKED)"
.LASF5:
	.string	"__GNUC__ 11"
.LASF790:
	.string	"htole16(x) __uint16_identity (x)"
.LASF1851:
	.string	"IA32_THERM_STATUS 0x19C"
.LASF877:
	.string	"_POSIX_MAPPED_FILES 200809L"
.LASF273:
	.string	"__FLT64X_MAX__ 1.18973149535723176502126385303097021e+4932F64x"
.LASF731:
	.string	"__WIFEXITED(status) (__WTERMSIG(status) == 0)"
.LASF361:
	.string	"_STDC_PREDEF_H 1"
.LASF1473:
	.string	"ACS_SSBS ACS_BTEE"
.LASF1873:
	.string	"AMD_TIME_UNIT_MASK 0xF0000"
.LASF1047:
	.string	"_SC_T_IOV_MAX _SC_T_IOV_MAX"
.LASF816:
	.string	"__FDS_BITS(set) ((set)->__fds_bits)"
.LASF120:
	.string	"__INT_LEAST32_WIDTH__ 32"
.LASF1115:
	.string	"_SC_BASE _SC_BASE"
.LASF1738:
	.string	"KEY_SDL 0600"
.LASF258:
	.string	"__FLT32X_NORM_MAX__ 1.79769313486231570814527423731704357e+308F32x"
.LASF1352:
	.string	"INTMAX_C(c) c ## L"
.LASF1992:
	.string	"running_with_privileges"
.LASF184:
	.string	"__DBL_IS_IEC_60559__ 2"
.LASF1482:
	.string	"_FULLWIN 0x04"
.LASF1259:
	.string	"_CS_POSIX_V7_LPBIG_OFFBIG_LDFLAGS _CS_POSIX_V7_LPBIG_OFFBIG_LDFLAGS"
.LASF1257:
	.string	"_CS_POSIX_V7_LP64_OFF64_LINTFLAGS _CS_POSIX_V7_LP64_OFF64_LINTFLAGS"
.LASF328:
	.string	"__SIZEOF_WINT_T__ 4"
.LASF223:
	.string	"__FLT64_MAX_10_EXP__ 308"
.LASF1841:
	.string	"BLUE 2"
.LASF1869:
	.string	"AMD_CPUID 0x80000007"
.LASF232:
	.string	"__FLT64_HAS_QUIET_NAN__ 1"
.LASF246:
	.string	"__FLT128_HAS_DENORM__ 1"
.LASF670:
	.string	"__HAVE_FLOAT64X 1"
.LASF1827:
	.string	"TRACE_ATTRS 0x1000"
.LASF275:
	.string	"__FLT64X_MIN__ 3.36210314311209350626267781732175260e-4932F64x"
.LASF1940:
	.string	"_idcok"
.LASF644:
	.string	"__off_t_defined "
.LASF1801:
	.string	"BUTTON_ALT NCURSES_MOUSE_MASK(6, 0004L)"
.LASF78:
	.string	"__INT_MAX__ 0x7fffffff"
.LASF495:
	.string	"__va_arg_pack() __builtin_va_arg_pack ()"
.LASF1203:
	.string	"_CS_POSIX_V5_WIDTH_RESTRICTED_ENVS _CS_V5_WIDTH_RESTRICTED_ENVS"
.LASF1377:
	.string	"NCURSES_TPARM_VARARGS 1"
.LASF792:
	.string	"le16toh(x) __uint16_identity (x)"
.LASF75:
	.string	"__GXX_ABI_VERSION 1016"
.LASF1654:
	.string	"slk_attr_on(a,v) ((v) ? ERR : slk_attron(a))"
.LASF723:
	.string	"WCONTINUED 8"
.LASF83:
	.string	"__WINT_MAX__ 0xffffffffU"
.LASF1243:
	.string	"_CS_POSIX_V6_LPBIG_OFFBIG_LDFLAGS _CS_POSIX_V6_LPBIG_OFFBIG_LDFLAGS"
.LASF1241:
	.string	"_CS_POSIX_V6_LP64_OFF64_LINTFLAGS _CS_POSIX_V6_LP64_OFF64_LINTFLAGS"
.LASF574:
	.string	"__SLONGWORD_TYPE long int"
.LASF1651:
	.string	"mvvline(y,x,c,n) mvwvline(stdscr,(y),(x),(c),(n))"
.LASF457:
	.string	"__glibc_safe_len_cond(__l,__s,__osz) ((__l) <= (__osz) / (__s))"
.LASF233:
	.string	"__FLT64_IS_IEC_60559__ 2"
.LASF977:
	.string	"_PC_SYMLINK_MAX _PC_SYMLINK_MAX"
.LASF327:
	.string	"__SIZEOF_WCHAR_T__ 4"
.LASF1645:
	.string	"mvinchstr(y,x,s) mvwinchstr(stdscr,(y),(x),(s))"
.LASF1365:
	.string	"NCURSES_OPAQUE 0"
.LASF741:
	.string	"WTERMSIG(status) __WTERMSIG (status)"
.LASF149:
	.string	"__FLT_EVAL_METHOD__ 0"
.LASF1332:
	.string	"INTMAX_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF432:
	.string	"__GLIBC__ 2"
.LASF1079:
	.string	"_SC_XOPEN_XPG2 _SC_XOPEN_XPG2"
.LASF1319:
	.string	"INT_FAST32_MIN (-9223372036854775807L-1)"
.LASF104:
	.string	"__INT8_MAX__ 0x7f"
.LASF1299:
	.string	"INT32_MAX (2147483647)"
.LASF1273:
	.string	"NCURSES_VERSION_MAJOR 6"
.LASF707:
	.string	"_WCHAR_T_ "
.LASF899:
	.string	"_POSIX_ASYNCHRONOUS_IO 200809L"
.LASF1555:
	.string	"untouchwin(win) wtouchln((win), 0, getmaxy(win), 0)"
.LASF1012:
	.string	"_SC_SEM_NSEMS_MAX _SC_SEM_NSEMS_MAX"
.LASF834:
	.string	"__SIZEOF_PTHREAD_MUTEXATTR_T 4"
.LASF1183:
	.string	"_SC_V7_ILP32_OFF32 _SC_V7_ILP32_OFF32"
.LASF1990:
	.string	"cpu_designer"
.LASF1356:
	.string	"NCURSES_ATTR_T int"
.LASF1862:
	.string	"OTHER_STATUS 256"
.LASF446:
	.string	"__P(args) args"
.LASF686:
	.string	"__HAVE_FLOAT128_UNLIKE_LDBL (__HAVE_DISTINCT_FLOAT128 && __LDBL_MANT_DIG__ != 113)"
.LASF16:
	.string	"__PIC__ 2"
.LASF1986:
	.string	"period_counter"
.LASF1331:
	.string	"UINTPTR_MAX (18446744073709551615UL)"
.LASF1309:
	.string	"INT_LEAST8_MAX (127)"
.LASF548:
	.string	"_SYS_SIZE_T_H "
.LASF599:
	.string	"__RLIM_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF948:
	.string	"__useconds_t_defined "
.LASF1178:
	.string	"_SC_LEVEL4_CACHE_SIZE _SC_LEVEL4_CACHE_SIZE"
.LASF1405:
	.string	"NCURSES_BOOL bool"
.LASF1631:
	.string	"mvwvline(win,y,x,c,n) (wmove((win),(y),(x)) == ERR ? ERR : wvline((win),(c),(n)))"
.LASF1262:
	.string	"_CS_V6_ENV _CS_V6_ENV"
.LASF225:
	.string	"__FLT64_MAX__ 1.79769313486231570814527423731704357e+308F64"
.LASF1256:
	.string	"_CS_POSIX_V7_LP64_OFF64_LIBS _CS_POSIX_V7_LP64_OFF64_LIBS"
.LASF638:
	.string	"_IO_EOF_SEEN 0x0010"
.LASF332:
	.string	"__x86_64 1"
.LASF1390:
	.string	"va_copy(d,s) __builtin_va_copy(d,s)"
.LASF1554:
	.string	"touchline(win,s,c) wtouchln((win), s, c, 1)"
.LASF1694:
	.string	"KEY_NPAGE 0522"
.LASF1017:
	.string	"_SC_BC_DIM_MAX _SC_BC_DIM_MAX"
.LASF1432:
	.string	"COLOR_CYAN 6"
.LASF1090:
	.string	"_SC_NZERO _SC_NZERO"
.LASF393:
	.string	"__USE_FORTIFY_LEVEL"
.LASF1814:
	.string	"TRACE_TIMES 0x0001"
.LASF1434:
	.string	"NCURSES_ACS(c) (acs_map[NCURSES_CAST(unsigned char,(c))])"
.LASF371:
	.string	"__USE_ISOC11"
.LASF1899:
	.string	"_IO_save_end"
.LASF811:
	.string	"__suseconds_t_defined "
.LASF610:
	.string	"__USECONDS_T_TYPE __U32_TYPE"
.LASF1297:
	.string	"INT8_MAX (127)"
.LASF828:
	.string	"_THREAD_SHARED_TYPES_H 1"
.LASF820:
	.string	"FD_CLR(fd,fdsetp) __FD_CLR (fd, fdsetp)"
.LASF1447:
	.string	"ACS_S9 NCURSES_ACS('s')"
.LASF1137:
	.string	"_SC_REGEX_VERSION _SC_REGEX_VERSION"
.LASF384:
	.string	"__USE_XOPEN2K8"
.LASF367:
	.string	"_STDIO_H 1"
.LASF1540:
	.string	"getcurx(win) (NCURSES_OK_ADDR(win) ? (win)->_curx : ERR)"
.LASF803:
	.string	"__FD_SET(d,s) ((void) (__FDS_BITS (s)[__FD_ELT(d)] |= __FD_MASK(d)))"
.LASF611:
	.string	"__SUSECONDS_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF565:
	.string	"__need_NULL"
.LASF986:
	.string	"_SC_JOB_CONTROL _SC_JOB_CONTROL"
.LASF397:
	.string	"__GLIBC_USE_DEPRECATED_SCANF"
.LASF1005:
	.string	"_SC_DELAYTIMER_MAX _SC_DELAYTIMER_MAX"
.LASF423:
	.string	"__SYSCALL_WORDSIZE 64"
.LASF1680:
	.string	"KEY_HOME 0406"
.LASF386:
	.string	"__USE_LARGEFILE"
.LASF283:
	.string	"__DEC32_MIN_EXP__ (-94)"
.LASF873:
	.string	"_POSIX_SAVED_IDS 1"
.LASF307:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 1"
.LASF1688:
	.string	"KEY_EIC 0514"
.LASF941:
	.string	"__ILP32_OFFBIG_CFLAGS \"-m32 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64\""
.LASF1728:
	.string	"KEY_REPLACE 0566"
.LASF1938:
	.string	"_scroll"
.LASF415:
	.string	"__USE_POSIX199309 1"
.LASF661:
	.string	"FOPEN_MAX 16"
.LASF1020:
	.string	"_SC_COLL_WEIGHTS_MAX _SC_COLL_WEIGHTS_MAX"
.LASF1548:
	.string	"wstandout(win) (wattrset(win,A_STANDOUT))"
.LASF477:
	.string	"__attribute_maybe_unused__ __attribute__ ((__unused__))"
.LASF267:
	.string	"__FLT64X_DIG__ 18"
.LASF1025:
	.string	"_SC_CHARCLASS_NAME_MAX _SC_CHARCLASS_NAME_MAX"
.LASF1379:
	.string	"NCURSES_TPARM_ARG intptr_t"
.LASF1483:
	.string	"_SCROLLWIN 0x08"
.LASF632:
	.string	"_____fpos64_t_defined 1"
.LASF1769:
	.string	"NCURSES_BUTTON_PRESSED 002L"
.LASF190:
	.string	"__LDBL_MAX_10_EXP__ 4932"
.LASF452:
	.string	"__END_DECLS "
.LASF1708:
	.string	"KEY_BEG 0542"
.LASF1829:
	.string	"TRACE_MAXIMUM ((1 << TRACE_SHIFT) - 1)"
.LASF294:
	.string	"__DEC64_EPSILON__ 1E-15DD"
.LASF658:
	.string	"FILENAME_MAX 4096"
.LASF1101:
	.string	"_SC_NL_LANGMAX _SC_NL_LANGMAX"
.LASF1705:
	.string	"KEY_C1 0537"
.LASF1129:
	.string	"_SC_FILE_SYSTEM _SC_FILE_SYSTEM"
.LASF696:
	.string	"_STRING_H 1"
.LASF1193:
	.string	"_SC_THREAD_ROBUST_PRIO_INHERIT _SC_THREAD_ROBUST_PRIO_INHERIT"
.LASF284:
	.string	"__DEC32_MAX_EXP__ 97"
.LASF1265:
	.string	"_GETOPT_CORE_H 1"
.LASF596:
	.string	"__OFF_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF845:
	.string	"_RWLOCK_INTERNAL_H "
.LASF265:
	.string	"__FLT32X_IS_IEC_60559__ 2"
.LASF1536:
	.string	"crmode() cbreak()"
.LASF1082:
	.string	"_SC_CHAR_BIT _SC_CHAR_BIT"
.LASF901:
	.string	"_LFS_ASYNCHRONOUS_IO 1"
.LASF1820:
	.string	"TRACE_CALLS 0x0020"
.LASF244:
	.string	"__FLT128_EPSILON__ 1.92592994438723585305597794258492732e-34F128"
.LASF326:
	.string	"__SIZEOF_INT128__ 16"
.LASF1181:
	.string	"_SC_IPV6 _SC_IPV6"
.LASF1880:
	.string	"short unsigned int"
.LASF249:
	.string	"__FLT128_IS_IEC_60559__ 2"
.LASF1881:
	.string	"signed char"
.LASF687:
	.string	"__HAVE_FLOATN_NOT_TYPEDEF 1"
.LASF1591:
	.string	"getch() wgetch(stdscr)"
.LASF177:
	.string	"__DBL_NORM_MAX__ ((double)1.79769313486231570814527423731704357e+308L)"
.LASF1121:
	.string	"_SC_DEVICE_IO _SC_DEVICE_IO"
.LASF335:
	.string	"__SIZEOF_FLOAT128__ 16"
.LASF545:
	.string	"__size_t__ "
.LASF1845:
	.string	"POWER_DOMAIN_COUNT 3"
.LASF417:
	.string	"__USE_XOPEN2K 1"
.LASF1171:
	.string	"_SC_LEVEL1_DCACHE_LINESIZE _SC_LEVEL1_DCACHE_LINESIZE"
.LASF1547:
	.string	"getpary(win) (NCURSES_OK_ADDR(win) ? (win)->_pary : ERR)"
.LASF1582:
	.string	"chgat(n,a,c,o) wchgat(stdscr,(n),(a),(c),(o))"
.LASF1169:
	.string	"_SC_LEVEL1_DCACHE_SIZE _SC_LEVEL1_DCACHE_SIZE"
.LASF1655:
	.string	"is_cleared(win) (NCURSES_OK_ADDR(win) ? (win)->_clear : FALSE)"
.LASF711:
	.string	"_WCHAR_T_H "
.LASF1549:
	.string	"wstandend(win) (wattrset(win,A_NORMAL))"
.LASF279:
	.string	"__FLT64X_HAS_INFINITY__ 1"
.LASF478:
	.string	"__attribute_used__ __attribute__ ((__used__))"
.LASF30:
	.string	"__CHAR_BIT__ 8"
.LASF767:
	.string	"__time_t_defined 1"
.LASF795:
	.string	"be32toh(x) __bswap_32 (x)"
.LASF787:
	.ascii	"__bswap_constant_64(x) ((((x) & 0xff00000000000000ull) >> 56"
	.ascii	") | (((x) & 0x00ff000000"
	.string	"000000ull) >> 40) | (((x) & 0x0000ff0000000000ull) >> 24) | (((x) & 0x000000ff00000000ull) >> 8) | (((x) & 0x00000000ff000000ull) << 8) | (((x) & 0x0000000000ff0000ull) << 24) | (((x) & 0x000000000000ff00ull) << 40) | (((x) & 0x00000000000000ffull) << 56))"
.LASF650:
	.string	"EOF (-1)"
.LASF542:
	.string	"__GLIBC_USE_IEC_60559_TYPES_EXT 0"
.LASF885:
	.string	"_XOPEN_REALTIME_THREADS 1"
.LASF1983:
	.string	"status"
.LASF1333:
	.string	"INTMAX_MAX (__INT64_C(9223372036854775807))"
.LASF521:
	.string	"__stub___compat_bdflush "
.LASF1454:
	.string	"ACS_RARROW NCURSES_ACS('+')"
.LASF1164:
	.string	"_SC_TRACE_INHERIT _SC_TRACE_INHERIT"
.LASF1028:
	.string	"_SC_2_C_DEV _SC_2_C_DEV"
.LASF1117:
	.string	"_SC_C_LANG_SUPPORT_R _SC_C_LANG_SUPPORT_R"
.LASF1626:
	.string	"mvwinnstr(win,y,x,s,n) (wmove((win),(y),(x)) == ERR ? ERR : winnstr((win),(s),(n)))"
.LASF848:
	.string	"__ONCE_FLAG_INIT { 0 }"
.LASF989:
	.string	"_SC_PRIORITY_SCHEDULING _SC_PRIORITY_SCHEDULING"
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
.LASF1601:
	.string	"insstr(s) winsstr(stdscr,(s))"
.LASF1199:
	.string	"_CS_POSIX_V6_WIDTH_RESTRICTED_ENVS _CS_V6_WIDTH_RESTRICTED_ENVS"
.LASF1550:
	.string	"wattron(win,at) wattr_on(win, NCURSES_CAST(attr_t, at), NULL)"
.LASF999:
	.string	"_SC_MESSAGE_PASSING _SC_MESSAGE_PASSING"
.LASF827:
	.string	"_BITS_PTHREADTYPES_COMMON_H 1"
.LASF917:
	.string	"_POSIX_BARRIERS 200809L"
.LASF975:
	.string	"_PC_REC_XFER_ALIGN _PC_REC_XFER_ALIGN"
.LASF1263:
	.string	"_CS_V7_ENV _CS_V7_ENV"
.LASF1886:
	.string	"__off64_t"
.LASF1031:
	.string	"_SC_2_SW_DEV _SC_2_SW_DEV"
.LASF872:
	.string	"_POSIX_JOB_CONTROL 1"
.LASF1954:
	.string	"pdat"
.LASF1989:
	.string	"display_moving_average_flag"
.LASF321:
	.string	"__GCC_ATOMIC_POINTER_LOCK_FREE 2"
.LASF1930:
	.string	"_maxx"
.LASF1929:
	.string	"_maxy"
.LASF946:
	.string	"STDOUT_FILENO 1"
.LASF1891:
	.string	"_IO_read_base"
.LASF743:
	.string	"WIFEXITED(status) __WIFEXITED (status)"
.LASF597:
	.string	"__OFF64_T_TYPE __SQUAD_TYPE"
.LASF1175:
	.string	"_SC_LEVEL3_CACHE_SIZE _SC_LEVEL3_CACHE_SIZE"
.LASF678:
	.string	"__HAVE_FLOAT32X 1"
.LASF1950:
	.string	"_parent"
.LASF1909:
	.string	"_offset"
.LASF1847:
	.string	"MSR_RAPL_POWER_UNIT 0x606"
.LASF207:
	.string	"__FLT32_MAX_10_EXP__ 38"
.LASF8:
	.string	"__VERSION__ \"11.4.0\""
.LASF973:
	.string	"_PC_REC_MAX_XFER_SIZE _PC_REC_MAX_XFER_SIZE"
.LASF516:
	.string	"__fortified_attr_access(a,o,s) __attr_access ((a, o, s))"
.LASF1479:
	.string	"OK (0)"
.LASF1499:
	.string	"NCURSES_SP_FUNCS 20211021"
.LASF291:
	.string	"__DEC64_MAX_EXP__ 385"
.LASF1347:
	.string	"INT64_C(c) c ## L"
.LASF93:
	.string	"__WINT_WIDTH__ 32"
.LASF1870:
	.string	"AMD_MSR_PWR_UNIT 0xC0010299"
.LASF589:
	.string	"__UID_T_TYPE __U32_TYPE"
.LASF1662:
	.string	"is_notimeout(win) (NCURSES_OK_ADDR(win) ? (win)->_notimeout : FALSE)"
.LASF144:
	.string	"__INTPTR_MAX__ 0x7fffffffffffffffL"
.LASF1267:
	.string	"F_LOCK 1"
.LASF198:
	.string	"__LDBL_HAS_DENORM__ 1"
.LASF1412:
	.string	"WA_REVERSE A_REVERSE"
.LASF1784:
	.string	"BUTTON3_RELEASED NCURSES_MOUSE_MASK(3, NCURSES_BUTTON_RELEASED)"
.LASF440:
	.string	"__LEAF , __leaf__"
.LASF1928:
	.string	"_curx"
.LASF1927:
	.string	"_cury"
.LASF1240:
	.string	"_CS_POSIX_V6_LP64_OFF64_LIBS _CS_POSIX_V6_LP64_OFF64_LIBS"
.LASF1677:
	.string	"KEY_UP 0403"
.LASF317:
	.string	"__GCC_ATOMIC_INT_LOCK_FREE 2"
.LASF129:
	.string	"__UINT32_C(c) c ## U"
.LASF1015:
	.string	"_SC_TIMER_MAX _SC_TIMER_MAX"
.LASF1835:
	.string	"POWER_LIMIT_COUNT 2"
.LASF1733:
	.string	"KEY_SCANCEL 0573"
.LASF136:
	.string	"__INT_FAST32_MAX__ 0x7fffffffffffffffL"
.LASF1440:
	.string	"ACS_RTEE NCURSES_ACS('u')"
.LASF303:
	.string	"__REGISTER_PREFIX__ "
.LASF1848:
	.string	"MSR_PKG_POWER_LIMIT 0x610"
.LASF1915:
	.string	"_mode"
.LASF1232:
	.string	"_CS_POSIX_V6_ILP32_OFF32_LIBS _CS_POSIX_V6_ILP32_OFF32_LIBS"
.LASF945:
	.string	"STDIN_FILENO 0"
.LASF511:
	.string	"__REDIRECT_NTH_LDBL(name,proto,alias) __REDIRECT_NTH (name, proto, alias)"
.LASF869:
	.string	"_XOPEN_ENH_I18N 1"
.LASF936:
	.string	"_POSIX_V7_LP64_OFF64 1"
.LASF1320:
	.string	"INT_FAST64_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF1096:
	.string	"_SC_UCHAR_MAX _SC_UCHAR_MAX"
.LASF1892:
	.string	"_IO_write_base"
.LASF1462:
	.string	"ACS_LEQUAL NCURSES_ACS('y')"
.LASF1077:
	.string	"_SC_2_C_VERSION _SC_2_C_VERSION"
.LASF1792:
	.string	"BUTTON4_DOUBLE_CLICKED NCURSES_MOUSE_MASK(4, NCURSES_DOUBLE_CLICKED)"
.LASF764:
	.string	"__key_t_defined "
.LASF688:
	.string	"__f32(x) x ##f32"
.LASF957:
	.string	"L_XTND SEEK_END"
.LASF591:
	.string	"__INO_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF1037:
	.string	"_SC_PII_OSI _SC_PII_OSI"
.LASF668:
	.string	"__HAVE_FLOAT128 1"
.LASF1102:
	.string	"_SC_NL_MSGMAX _SC_NL_MSGMAX"
.LASF1997:
	.string	"power_his"
.LASF1727:
	.string	"KEY_REFRESH 0565"
.LASF590:
	.string	"__GID_T_TYPE __U32_TYPE"
.LASF779:
	.string	"__LONG_LONG_PAIR(HI,LO) LO, HI"
.LASF1624:
	.string	"mvwinchnstr(win,y,x,s,n) (wmove((win),(y),(x)) == ERR ? ERR : winchnstr((win),(s),(n)))"
.LASF117:
	.string	"__INT_LEAST16_WIDTH__ 16"
.LASF1142:
	.string	"_SC_THREAD_SPORADIC_SERVER _SC_THREAD_SPORADIC_SERVER"
.LASF354:
	.string	"__linux__ 1"
.LASF1991:
	.string	"core_count"
.LASF55:
	.string	"__UINT32_TYPE__ unsigned int"
.LASF1179:
	.string	"_SC_LEVEL4_CACHE_ASSOC _SC_LEVEL4_CACHE_ASSOC"
.LASF1569:
	.string	"addchnstr(str,n) waddchnstr(stdscr,(str),(n))"
.LASF1987:
	.string	"poll_cycle_counter"
.LASF450:
	.string	"__ptr_t void *"
.LASF1415:
	.string	"WA_BOLD A_BOLD"
.LASF1646:
	.string	"mvinnstr(y,x,s,n) mvwinnstr(stdscr,(y),(x),(s),(n))"
.LASF925:
	.string	"_POSIX2_CHAR_TERM 200809L"
.LASF580:
	.string	"__SLONG32_TYPE int"
.LASF860:
	.string	"_POSIX2_C_DEV __POSIX2_THIS_VERSION"
.LASF4:
	.string	"__STDC_HOSTED__ 1"
.LASF1964:
	.string	"stdscr"
.LASF67:
	.string	"__INT_FAST32_TYPE__ long int"
.LASF1303:
	.string	"UINT32_MAX (4294967295U)"
.LASF340:
	.string	"__k8__ 1"
.LASF334:
	.string	"__SIZEOF_FLOAT80__ 16"
.LASF408:
	.string	"__USE_POSIX_IMPLICITLY 1"
.LASF1276:
	.string	"NCURSES_VERSION"
.LASF846:
	.string	"__PTHREAD_RWLOCK_ELISION_EXTRA 0, { 0, 0, 0, 0, 0, 0, 0 }"
.LASF118:
	.string	"__INT_LEAST32_MAX__ 0x7fffffff"
.LASF206:
	.string	"__FLT32_MAX_EXP__ 128"
.LASF374:
	.string	"__USE_ISOCXX11"
.LASF1551:
	.string	"wattroff(win,at) wattr_off(win, NCURSES_CAST(attr_t, at), NULL)"
.LASF1883:
	.string	"long int"
.LASF1942:
	.string	"_sync"
.LASF1656:
	.string	"is_idcok(win) (NCURSES_OK_ADDR(win) ? (win)->_idcok : FALSE)"
.LASF1049:
	.string	"_SC_THREAD_SAFE_FUNCTIONS _SC_THREAD_SAFE_FUNCTIONS"
.LASF983:
	.string	"_SC_OPEN_MAX _SC_OPEN_MAX"
.LASF1558:
	.string	"hline(ch,n) whline(stdscr, ch, (n))"
.LASF640:
	.string	"_IO_ERR_SEEN 0x0020"
.LASF181:
	.string	"__DBL_HAS_DENORM__ 1"
.LASF110:
	.string	"__UINT32_MAX__ 0xffffffffU"
.LASF976:
	.string	"_PC_ALLOC_SIZE_MIN _PC_ALLOC_SIZE_MIN"
.LASF1698:
	.string	"KEY_CATAB 0526"
.LASF1696:
	.string	"KEY_STAB 0524"
.LASF1220:
	.string	"_CS_XBS5_ILP32_OFFBIG_LIBS _CS_XBS5_ILP32_OFFBIG_LIBS"
.LASF1941:
	.string	"_immed"
.LASF400:
	.string	"__glibc_clang_prereq(maj,min) 0"
.LASF1534:
	.string	"resetterm() reset_shell_mode()"
.LASF1072:
	.string	"_SC_XOPEN_UNIX _SC_XOPEN_UNIX"
.LASF1293:
	.string	"INT8_MIN (-128)"
.LASF313:
	.string	"__GCC_ATOMIC_CHAR16_T_LOCK_FREE 2"
.LASF1301:
	.string	"UINT8_MAX (255)"
.LASF1918:
	.string	"_IO_marker"
.LASF1599:
	.string	"insertln() winsdelln(stdscr,1)"
.LASF1127:
	.string	"_SC_FILE_ATTRIBUTES _SC_FILE_ATTRIBUTES"
.LASF305:
	.string	"__GNUC_STDC_INLINE__ 1"
.LASF662:
	.string	"stdin stdin"
.LASF1957:
	.string	"_pad_top"
.LASF1530:
	.string	"wgetstr(w,s) wgetnstr(w, s, -1)"
.LASF260:
	.string	"__FLT32X_EPSILON__ 2.22044604925031308084726333618164062e-16F32x"
.LASF1475:
	.string	"ACS_BSBS ACS_HLINE"
.LASF832:
	.string	"__SIZEOF_PTHREAD_RWLOCK_T 56"
.LASF447:
	.string	"__PMT(args) args"
.LASF1246:
	.string	"_CS_POSIX_V7_ILP32_OFF32_CFLAGS _CS_POSIX_V7_ILP32_OFF32_CFLAGS"
.LASF932:
	.string	"_POSIX_TYPED_MEMORY_OBJECTS -1"
.LASF92:
	.string	"__WCHAR_WIDTH__ 32"
.LASF1310:
	.string	"INT_LEAST16_MAX (32767)"
.LASF227:
	.string	"__FLT64_MIN__ 2.22507385850720138309023271733240406e-308F64"
.LASF1968:
	.string	"cumulative"
.LASF1692:
	.string	"KEY_SF 0520"
.LASF1058:
	.string	"_SC_THREAD_ATTR_STACKADDR _SC_THREAD_ATTR_STACKADDR"
.LASF1619:
	.string	"mvwgetch(win,y,x) (wmove((win),(y),(x)) == ERR ? ERR : wgetch(win))"
.LASF1062:
	.string	"_SC_THREAD_PRIO_PROTECT _SC_THREAD_PRIO_PROTECT"
.LASF810:
	.string	"_STRUCT_TIMESPEC 1"
.LASF1776:
	.string	"BUTTON1_CLICKED NCURSES_MOUSE_MASK(1, NCURSES_BUTTON_CLICKED)"
.LASF363:
	.string	"__STDC_IEC_60559_BFP__ 201404L"
.LASF751:
	.string	"EXIT_SUCCESS 0"
.LASF1201:
	.string	"_CS_GNU_LIBPTHREAD_VERSION _CS_GNU_LIBPTHREAD_VERSION"
.LASF1816:
	.string	"TRACE_UPDATE 0x0004"
.LASF2029:
	.string	"core"
.LASF81:
	.string	"__WCHAR_MAX__ 0x7fffffff"
.LASF547:
	.string	"_SIZE_T "
.LASF1962:
	.string	"ldat"
.LASF878:
	.string	"_POSIX_MEMLOCK 200809L"
.LASF214:
	.string	"__FLT32_HAS_DENORM__ 1"
.LASF1282:
	.string	"NCURSES_WRAPPED_VAR(type,name) extern NCURSES_IMPEXP type NCURSES_PUBLIC_VAR(name)(void)"
.LASF435:
	.string	"_SYS_CDEFS_H 1"
.LASF453:
	.string	"__bos(ptr) __builtin_object_size (ptr, __USE_FORTIFY_LEVEL > 1)"
.LASF1868:
	.string	"CPU_TIGERLAKE 140"
.LASF1194:
	.string	"_SC_THREAD_ROBUST_PRIO_PROTECT _SC_THREAD_ROBUST_PRIO_PROTECT"
.LASF11:
	.string	"__ATOMIC_ACQUIRE 2"
.LASF1531:
	.string	"getnstr(s,n) wgetnstr(stdscr, s, (n))"
.LASF1858:
	.string	"RESIDENCY_STATE_REGULATION_STATUS 16"
.LASF660:
	.string	"FOPEN_MAX"
.LASF1757:
	.string	"KEY_SRSUME 0623"
.LASF325:
	.string	"__SSP_STRONG__ 3"
.LASF1795:
	.string	"BUTTON5_PRESSED NCURSES_MOUSE_MASK(5, NCURSES_BUTTON_PRESSED)"
.LASF551:
	.string	"__SIZE_T "
.LASF618:
	.string	"__FSID_T_TYPE struct { int __val[2]; }"
.LASF753:
	.string	"_SYS_TYPES_H 1"
.LASF1919:
	.string	"_IO_codecvt"
.LASF929:
	.string	"_POSIX_TRACE_EVENT_FILTER -1"
.LASF1153:
	.string	"_SC_2_PBS_TRACK _SC_2_PBS_TRACK"
.LASF692:
	.string	"__CFLOAT32 _Complex _Float32"
.LASF316:
	.string	"__GCC_ATOMIC_SHORT_LOCK_FREE 2"
.LASF1821:
	.string	"TRACE_VIRTPUT 0x0040"
.LASF1602:
	.string	"instr(s) winstr(stdscr,(s))"
.LASF1378:
	.string	"NCURSES_TPARM_ARG"
.LASF1719:
	.string	"KEY_MESSAGE 0555"
.LASF601:
	.string	"__BLKCNT_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF338:
	.string	"__GCC_ASM_FLAG_OUTPUTS__ 1"
.LASF617:
	.string	"__BLKSIZE_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF37:
	.string	"__SIZEOF_POINTER__ 8"
.LASF1384:
	.string	"NCURSES_WIDECHAR 0"
.LASF1528:
	.string	"getsyx(y,x) do { if (newscr) { if (is_leaveok(newscr)) (y) = (x) = -1; else getyx(newscr,(y), (x)); } } while(0)"
.LASF242:
	.string	"__FLT128_NORM_MAX__ 1.18973149535723176508575932662800702e+4932F128"
.LASF1861:
	.string	"VR_THERM_DESIGN_CURRENT_STATUS 128"
.LASF1485:
	.string	"_HASMOVED 0x20"
.LASF1174:
	.string	"_SC_LEVEL2_CACHE_LINESIZE _SC_LEVEL2_CACHE_LINESIZE"
.LASF974:
	.string	"_PC_REC_MIN_XFER_SIZE _PC_REC_MIN_XFER_SIZE"
.LASF550:
	.string	"_T_SIZE "
.LASF266:
	.string	"__FLT64X_MANT_DIG__ 64"
.LASF693:
	.string	"__CFLOAT64 _Complex _Float64"
.LASF814:
	.string	"__FD_ELT(d) ((d) / __NFDBITS)"
.LASF1065:
	.string	"_SC_NPROCESSORS_ONLN _SC_NPROCESSORS_ONLN"
.LASF414:
	.string	"__USE_POSIX2 1"
.LASF930:
	.string	"_POSIX_TRACE_INHERIT -1"
.LASF1586:
	.string	"color_set(c,o) wcolor_set(stdscr,(c),(o))"
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
.LASF1411:
	.string	"WA_UNDERLINE A_UNDERLINE"
.LASF1290:
	.string	"__WCHAR_MAX __WCHAR_MAX__"
.LASF1314:
	.string	"UINT_LEAST16_MAX (65535)"
.LASF791:
	.string	"be16toh(x) __bswap_16 (x)"
.LASF1587:
	.string	"delch() wdelch(stdscr)"
.LASF1268:
	.string	"F_TLOCK 2"
.LASF467:
	.string	"__REDIRECT(name,proto,alias) name proto __asm__ (__ASMNAME (#alias))"
.LASF534:
	.string	"__GLIBC_USE_IEC_60559_BFP_EXT_C2X 0"
.LASF808:
	.string	"_SIGSET_NWORDS (1024 / (8 * sizeof (unsigned long int)))"
.LASF270:
	.string	"__FLT64X_MAX_EXP__ 16384"
.LASF704:
	.string	"_T_WCHAR_ "
.LASF39:
	.string	"__GNUC_WIDE_EXECUTION_CHARSET_NAME \"UTF-32LE\""
.LASF1819:
	.string	"TRACE_ORDINARY 0x001F"
.LASF1307:
	.string	"INT_LEAST32_MIN (-2147483647-1)"
.LASF1467:
	.string	"ACS_BSSB ACS_ULCORNER"
.LASF411:
	.string	"_POSIX_C_SOURCE"
.LASF856:
	.string	"__POSIX2_THIS_VERSION 200809L"
.LASF1689:
	.string	"KEY_CLEAR 0515"
.LASF1781:
	.string	"BUTTON2_CLICKED NCURSES_MOUSE_MASK(2, NCURSES_BUTTON_CLICKED)"
.LASF749:
	.string	"RAND_MAX 2147483647"
.LASF1971:
	.string	"power"
.LASF1806:
	.string	"BUTTON_CLICK(e,x) ((e) & NCURSES_MOUSE_MASK(x, 004))"
.LASF921:
	.string	"_POSIX_CLOCK_SELECTION 200809L"
.LASF1437:
	.string	"ACS_URCORNER NCURSES_ACS('k')"
.LASF1242:
	.string	"_CS_POSIX_V6_LPBIG_OFFBIG_CFLAGS _CS_POSIX_V6_LPBIG_OFFBIG_CFLAGS"
.LASF1093:
	.string	"_SC_SCHAR_MIN _SC_SCHAR_MIN"
.LASF319:
	.string	"__GCC_ATOMIC_LLONG_LOCK_FREE 2"
.LASF1223:
	.string	"_CS_XBS5_LP64_OFF64_LDFLAGS _CS_XBS5_LP64_OFF64_LDFLAGS"
.LASF1609:
	.string	"timeout(delay) wtimeout(stdscr,(delay))"
.LASF137:
	.string	"__INT_FAST32_WIDTH__ 64"
.LASF968:
	.string	"_PC_ASYNC_IO _PC_ASYNC_IO"
.LASF1016:
	.string	"_SC_BC_BASE_MAX _SC_BC_BASE_MAX"
.LASF1706:
	.string	"KEY_C3 0540"
.LASF862:
	.string	"_POSIX2_LOCALEDEF __POSIX2_THIS_VERSION"
.LASF1190:
	.string	"_SC_TRACE_SYS_MAX _SC_TRACE_SYS_MAX"
.LASF160:
	.string	"__FLT_MAX__ 3.40282346638528859811704183484516925e+38F"
.LASF898:
	.string	"_POSIX_REALTIME_SIGNALS 200809L"
.LASF91:
	.string	"__LONG_LONG_WIDTH__ 64"
.LASF1027:
	.string	"_SC_2_C_BIND _SC_2_C_BIND"
.LASF1699:
	.string	"KEY_ENTER 0527"
.LASF972:
	.string	"_PC_REC_INCR_XFER_SIZE _PC_REC_INCR_XFER_SIZE"
.LASF1013:
	.string	"_SC_SEM_VALUE_MAX _SC_SEM_VALUE_MAX"
.LASF1887:
	.string	"char"
.LASF833:
	.string	"__SIZEOF_PTHREAD_BARRIER_T 32"
.LASF1418:
	.string	"WA_PROTECT A_PROTECT"
.LASF1212:
	.string	"_CS_LFS64_LIBS _CS_LFS64_LIBS"
.LASF1838:
	.string	"DEBUG_ENABLE 1"
.LASF1988:
	.string	"display_power_config_flag"
.LASF592:
	.string	"__INO64_T_TYPE __UQUAD_TYPE"
.LASF527:
	.string	"__stub_sigreturn "
.LASF1032:
	.string	"_SC_2_LOCALEDEF _SC_2_LOCALEDEF"
.LASF1436:
	.string	"ACS_LLCORNER NCURSES_ACS('m')"
.LASF681:
	.string	"__HAVE_DISTINCT_FLOAT32 0"
.LASF1611:
	.string	"winsertln(win) winsdelln(win,1)"
.LASF428:
	.string	"__GLIBC_USE_DEPRECATED_GETS 0"
.LASF535:
	.string	"__GLIBC_USE_IEC_60559_EXT"
.LASF1187:
	.string	"_SC_SS_REPL_MAX _SC_SS_REPL_MAX"
.LASF1052:
	.string	"_SC_LOGIN_NAME_MAX _SC_LOGIN_NAME_MAX"
.LASF1943:
	.string	"_use_keypad"
.LASF200:
	.string	"__LDBL_HAS_QUIET_NAN__ 1"
.LASF1945:
	.string	"_line"
.LASF570:
	.string	"__S16_TYPE short int"
.LASF1521:
	.string	"A_TOP NCURSES_BITS(1U,21)"
.LASF1083:
	.string	"_SC_CHAR_MAX _SC_CHAR_MAX"
.LASF306:
	.string	"__NO_INLINE__ 1"
.LASF229:
	.string	"__FLT64_DENORM_MIN__ 4.94065645841246544176568792868221372e-324F64"
.LASF614:
	.string	"__KEY_T_TYPE __S32_TYPE"
.LASF720:
	.string	"WUNTRACED 2"
.LASF1895:
	.string	"_IO_buf_base"
.LASF864:
	.string	"_XOPEN_XCU_VERSION 4"
.LASF798:
	.string	"htole64(x) __uint64_identity (x)"
.LASF412:
	.string	"_POSIX_C_SOURCE 200809L"
.LASF484:
	.string	"__attribute_nonnull__(params) __attribute__ ((__nonnull__ params))"
.LASF2020:
	.string	"load"
.LASF1493:
	.string	"GCC_DEPRECATED"
.LASF1291:
	.string	"__WCHAR_MIN __WCHAR_MIN__"
.LASF1958:
	.string	"_pad_left"
.LASF1759:
	.string	"KEY_SSUSPEND 0625"
.LASF1402:
	.string	"true 1"
.LASF1760:
	.string	"KEY_SUNDO 0626"
.LASF1104:
	.string	"_SC_NL_SETMAX _SC_NL_SETMAX"
.LASF1237:
	.string	"_CS_POSIX_V6_ILP32_OFFBIG_LINTFLAGS _CS_POSIX_V6_ILP32_OFFBIG_LINTFLAGS"
.LASF491:
	.string	"__attribute_artificial__ __attribute__ ((__artificial__))"
.LASF1445:
	.string	"ACS_PLUS NCURSES_ACS('n')"
.LASF923:
	.string	"_POSIX_IPV6 200809L"
.LASF1613:
	.string	"mvwaddchnstr(win,y,x,str,n) (wmove((win),(y),(x)) == ERR ? ERR : waddchnstr((win),(str),(n)))"
.LASF1249:
	.string	"_CS_POSIX_V7_ILP32_OFF32_LINTFLAGS _CS_POSIX_V7_ILP32_OFF32_LINTFLAGS"
.LASF947:
	.string	"STDERR_FILENO 2"
.LASF604:
	.string	"__FSBLKCNT64_T_TYPE __UQUAD_TYPE"
.LASF1338:
	.string	"SIG_ATOMIC_MAX (2147483647)"
.LASF196:
	.string	"__LDBL_EPSILON__ 1.08420217248550443400745280086994171e-19L"
.LASF1634:
	.string	"mvaddchstr(y,x,str) mvwaddchstr(stdscr,(y),(x),(str))"
.LASF241:
	.string	"__FLT128_MAX__ 1.18973149535723176508575932662800702e+4932F128"
.LASF1762:
	.string	"KEY_UNDO 0630"
.LASF1571:
	.string	"addnstr(str,n) waddnstr(stdscr,(str),(n))"
.LASF1409:
	.string	"WA_NORMAL A_NORMAL"
.LASF103:
	.string	"__SIG_ATOMIC_WIDTH__ 32"
.LASF629:
	.string	"__STD_TYPE"
.LASF1084:
	.string	"_SC_CHAR_MIN _SC_CHAR_MIN"
.LASF1152:
	.string	"_SC_2_PBS_MESSAGE _SC_2_PBS_MESSAGE"
.LASF1202:
	.string	"_CS_V5_WIDTH_RESTRICTED_ENVS _CS_V5_WIDTH_RESTRICTED_ENVS"
.LASF1407:
	.string	"NCURSES_OK_ADDR(p) (0 != NCURSES_CAST(const void *, (p)))"
.LASF1316:
	.string	"UINT_LEAST64_MAX (__UINT64_C(18446744073709551615))"
.LASF2031:
	.string	"/home/jscha/dvp/cpumon/src/main.c"
.LASF587:
	.string	"__SYSCALL_ULONG_TYPE __ULONGWORD_TYPE"
.LASF1496:
	.string	"NCURSES_EXT_FUNCS"
.LASF581:
	.string	"__ULONG32_TYPE unsigned int"
.LASF676:
	.string	"__HAVE_FLOAT32 1"
.LASF1925:
	.string	"_IO_FILE"
.LASF68:
	.string	"__INT_FAST64_TYPE__ long int"
.LASF544:
	.string	"__need_NULL "
.LASF1250:
	.string	"_CS_POSIX_V7_ILP32_OFFBIG_CFLAGS _CS_POSIX_V7_ILP32_OFFBIG_CFLAGS"
.LASF1920:
	.string	"_IO_wide_data"
.LASF890:
	.string	"_POSIX_THREAD_PRIORITY_SCHEDULING 200809L"
.LASF1543:
	.string	"getbegy(win) (NCURSES_OK_ADDR(win) ? (win)->_begy : ERR)"
.LASF185:
	.string	"__LDBL_MANT_DIG__ 64"
.LASF1110:
	.string	"_SC_XOPEN_LEGACY _SC_XOPEN_LEGACY"
.LASF1859:
	.string	"RUNNING_AVERAGE_THERMAL_LIMIT_STATUS 32"
.LASF72:
	.string	"__UINT_FAST64_TYPE__ long unsigned int"
.LASF997:
	.string	"_SC_MEMLOCK_RANGE _SC_MEMLOCK_RANGE"
.LASF564:
	.string	"NULL ((void *)0)"
.LASF145:
	.string	"__INTPTR_WIDTH__ 64"
.LASF33:
	.string	"__ORDER_BIG_ENDIAN__ 4321"
.LASF352:
	.string	"__gnu_linux__ 1"
.LASF2032:
	.string	"/home/jscha/dvp/cpumon/build"
.LASF1116:
	.string	"_SC_C_LANG_SUPPORT _SC_C_LANG_SUPPORT"
.LASF1532:
	.string	"setterm(term) setupterm(term, 1, (int *)0)"
.LASF847:
	.string	"__PTHREAD_RWLOCK_INITIALIZER(__flags) 0, 0, 0, 0, 0, 0, 0, 0, __PTHREAD_RWLOCK_ELISION_EXTRA, 0, __flags"
.LASF1849:
	.string	"IA32_PACKAGE_THERM_STATUS 0x1B1"
.LASF1271:
	.string	"CURSES 1"
.LASF1231:
	.string	"_CS_POSIX_V6_ILP32_OFF32_LDFLAGS _CS_POSIX_V6_ILP32_OFF32_LDFLAGS"
.LASF308:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 1"
.LASF278:
	.string	"__FLT64X_HAS_DENORM__ 1"
.LASF1130:
	.string	"_SC_MONOTONIC_CLOCK _SC_MONOTONIC_CLOCK"
.LASF1087:
	.string	"_SC_LONG_BIT _SC_LONG_BIT"
.LASF1296:
	.string	"INT64_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF102:
	.string	"__SIG_ATOMIC_MIN__ (-__SIG_ATOMIC_MAX__ - 1)"
.LASF1022:
	.string	"_SC_EXPR_NEST_MAX _SC_EXPR_NEST_MAX"
.LASF1208:
	.string	"_CS_LFS_LIBS _CS_LFS_LIBS"
.LASF518:
	.string	"__attr_dealloc(dealloc,argno) __attribute__ ((__malloc__ (dealloc, argno)))"
.LASF1126:
	.string	"_SC_PIPE _SC_PIPE"
.LASF364:
	.string	"__STDC_IEC_559_COMPLEX__ 1"
.LASF984:
	.string	"_SC_STREAM_MAX _SC_STREAM_MAX"
.LASF1341:
	.string	"WCHAR_MAX __WCHAR_MAX"
.LASF806:
	.string	"__sigset_t_defined 1"
.LASF57:
	.string	"__INT_LEAST8_TYPE__ signed char"
.LASF1218:
	.string	"_CS_XBS5_ILP32_OFFBIG_CFLAGS _CS_XBS5_ILP32_OFFBIG_CFLAGS"
.LASF507:
	.string	"__LDBL_REDIR_NTH(name,proto) name proto __THROW"
.LASF1810:
	.string	"mouse_trafo(y,x,to_screen) wmouse_trafo(stdscr,y,x,to_screen)"
.LASF1981:
	.string	"power_cumulative"
.LASF492:
	.string	"__extern_inline extern __inline __attribute__ ((__gnu_inline__))"
.LASF1546:
	.string	"getparx(win) (NCURSES_OK_ADDR(win) ? (win)->_parx : ERR)"
.LASF717:
	.string	"__need_wchar_t"
.LASF159:
	.string	"__FLT_DECIMAL_DIG__ 9"
.LASF1330:
	.string	"INTPTR_MAX (9223372036854775807L)"
.LASF1575:
	.string	"attr_on(a,o) wattr_on(stdscr,(a),(o))"
.LASF438:
	.string	"__glibc_has_builtin(name) __has_builtin (name)"
.LASF842:
	.string	"_THREAD_MUTEX_INTERNAL_H 1"
.LASF1665:
	.string	"is_subwin(win) (NCURSES_OK_ADDR(win) ? ((win)->_flags & _SUBWIN) != 0 : FALSE)"
.LASF1389:
	.string	"va_arg(v,l) __builtin_va_arg(v,l)"
.LASF1993:
	.string	"freq_his"
.LASF1188:
	.string	"_SC_TRACE_EVENT_NAME_MAX _SC_TRACE_EVENT_NAME_MAX"
.LASF1051:
	.string	"_SC_GETPW_R_SIZE_MAX _SC_GETPW_R_SIZE_MAX"
.LASF532:
	.string	"__GLIBC_USE_IEC_60559_BFP_EXT 0"
.LASF1667:
	.string	"wgetdelay(win) (NCURSES_OK_ADDR(win) ? (win)->_delay : 0)"
.LASF353:
	.string	"__linux 1"
.LASF1621:
	.string	"mvwgetstr(win,y,x,str) (wmove((win),(y),(x)) == ERR ? ERR : wgetstr((win),(str)))"
.LASF434:
	.string	"__GLIBC_PREREQ(maj,min) ((__GLIBC__ << 16) + __GLIBC_MINOR__ >= ((maj) << 16) + (min))"
.LASF1747:
	.string	"KEY_SLEFT 0611"
.LASF1298:
	.string	"INT16_MAX (32767)"
.LASF19:
	.string	"__FINITE_MATH_ONLY__ 0"
.LASF520:
	.string	"__attribute_returns_twice__ __attribute__ ((__returns_twice__))"
.LASF684:
	.string	"__HAVE_DISTINCT_FLOAT64X 0"
.LASF17:
	.string	"__pie__ 2"
.LASF762:
	.string	"__id_t_defined "
.LASF1125:
	.string	"_SC_FIFO _SC_FIFO"
.LASF1:
	.string	"__STDC_VERSION__ 201710L"
.LASF1255:
	.string	"_CS_POSIX_V7_LP64_OFF64_LDFLAGS _CS_POSIX_V7_LP64_OFF64_LDFLAGS"
.LASF736:
	.string	"__W_EXITCODE(ret,sig) ((ret) << 8 | (sig))"
.LASF1605:
	.string	"scrl(n) wscrl(stdscr,(n))"
.LASF1500:
	.string	"NCURSES_SP_NAME(name) name ##_sp"
.LASF1557:
	.string	"border(ls,rs,ts,bs,tl,tr,bl,br) wborder(stdscr, ls, rs, ts, bs, tl, tr, bl, br)"
.LASF259:
	.string	"__FLT32X_MIN__ 2.22507385850720138309023271733240406e-308F32x"
.LASF1380:
	.string	"NCURSES_WCWIDTH_GRAPHICS"
.LASF1076:
	.string	"_SC_2_CHAR_TERM _SC_2_CHAR_TERM"
.LASF0:
	.string	"__STDC__ 1"
.LASF1442:
	.string	"ACS_TTEE NCURSES_ACS('w')"
.LASF1306:
	.string	"INT_LEAST16_MIN (-32767-1)"
.LASF844:
	.string	"__PTHREAD_MUTEX_INITIALIZER(__kind) 0, 0, 0, 0, __kind, 0, 0, { 0, 0 }"
.LASF405:
	.string	"__USE_ISOC11 1"
.LASF1147:
	.string	"_SC_USER_GROUPS _SC_USER_GROUPS"
.LASF763:
	.string	"__daddr_t_defined "
.LASF493:
	.string	"__extern_always_inline extern __always_inline __attribute__ ((__gnu_inline__))"
.LASF1813:
	.string	"TRACE_DISABLE 0x0000"
.LASF1690:
	.string	"KEY_EOS 0516"
.LASF1523:
	.string	"A_ITALIC NCURSES_BITS(1U,23)"
.LASF884:
	.string	"_XOPEN_REALTIME 1"
.LASF1074:
	.string	"_SC_XOPEN_ENH_I18N _SC_XOPEN_ENH_I18N"
.LASF982:
	.string	"_SC_NGROUPS_MAX _SC_NGROUPS_MAX"
.LASF726:
	.string	"__WALL 0x40000000"
.LASF51:
	.string	"__INT32_TYPE__ int"
.LASF1148:
	.string	"_SC_USER_GROUPS_R _SC_USER_GROUPS_R"
.LASF454:
	.string	"__bos0(ptr) __builtin_object_size (ptr, 0)"
.LASF272:
	.string	"__FLT64X_DECIMAL_DIG__ 21"
.LASF1533:
	.string	"fixterm() reset_prog_mode()"
.LASF777:
	.string	"__BYTE_ORDER __LITTLE_ENDIAN"
.LASF2027:
	.string	"cpu_model"
.LASF396:
	.string	"__GLIBC_USE_DEPRECATED_GETS"
.LASF219:
	.string	"__FLT64_DIG__ 15"
.LASF1098:
	.string	"_SC_ULONG_MAX _SC_ULONG_MAX"
.LASF1657:
	.string	"is_idlok(win) (NCURSES_OK_ADDR(win) ? (win)->_idlok : FALSE)"
.LASF311:
	.string	"__GCC_ATOMIC_BOOL_LOCK_FREE 2"
.LASF293:
	.string	"__DEC64_MAX__ 9.999999999999999E384DD"
.LASF920:
	.string	"_POSIX_MONOTONIC_CLOCK 0"
.LASF1545:
	.string	"getmaxy(win) (NCURSES_OK_ADDR(win) ? ((win)->_maxy + 1) : ERR)"
.LASF830:
	.string	"__SIZEOF_PTHREAD_MUTEX_T 40"
.LASF1984:
	.string	"INTEL"
.LASF388:
	.string	"__USE_FILE_OFFSET64"
.LASF1855:
	.string	"MSR_CORE_PERF_LIMIT_REASONS 0x64F"
.LASF738:
	.string	"__W_CONTINUED 0xffff"
.LASF178:
	.string	"__DBL_MIN__ ((double)2.22507385850720138309023271733240406e-308L)"
.LASF1478:
	.string	"ERR (-1)"
.LASF942:
	.string	"__ILP32_OFFBIG_LDFLAGS \"-m32\""
.LASF664:
	.string	"stderr stderr"
.LASF1040:
	.string	"_SC_UIO_MAXIOV _SC_UIO_MAXIOV"
.LASF1625:
	.string	"mvwinchstr(win,y,x,s) (wmove((win),(y),(x)) == ERR ? ERR : winchstr((win),(s)))"
.LASF1663:
	.string	"is_pad(win) (NCURSES_OK_ADDR(win) ? ((win)->_flags & _ISPAD) != 0 : FALSE)"
.LASF1001:
	.string	"_SC_SHARED_MEMORY_OBJECTS _SC_SHARED_MEMORY_OBJECTS"
.LASF1056:
	.string	"_SC_THREAD_STACK_MIN _SC_THREAD_STACK_MIN"
.LASF1811:
	.string	"_tracech_t _tracechtype"
.LASF794:
	.string	"htole32(x) __uint32_identity (x)"
.LASF1059:
	.string	"_SC_THREAD_ATTR_STACKSIZE _SC_THREAD_ATTR_STACKSIZE"
.LASF1541:
	.string	"getcury(win) (NCURSES_OK_ADDR(win) ? (win)->_cury : ERR)"
.LASF2025:
	.string	"work_jiffies_before"
.LASF602:
	.string	"__BLKCNT64_T_TYPE __SQUAD_TYPE"
.LASF1632:
	.string	"mvaddch(y,x,ch) mvwaddch(stdscr,(y),(x),(ch))"
.LASF956:
	.string	"L_INCR SEEK_CUR"
.LASF775:
	.string	"__PDP_ENDIAN 3412"
.LASF1251:
	.string	"_CS_POSIX_V7_ILP32_OFFBIG_LDFLAGS _CS_POSIX_V7_ILP32_OFFBIG_LDFLAGS"
.LASF2026:
	.string	"total_jiffies_before"
.LASF1668:
	.string	"wgetparent(win) (NCURSES_OK_ADDR(win) ? (win)->_parent : 0)"
.LASF27:
	.string	"__SIZEOF_DOUBLE__ 8"
.LASF778:
	.string	"__FLOAT_WORD_ORDER __BYTE_ORDER"
.LASF943:
	.string	"__LP64_OFF64_CFLAGS \"-m64\""
.LASF612:
	.string	"__SUSECONDS64_T_TYPE __SQUAD_TYPE"
.LASF420:
	.string	"_ATFILE_SOURCE 1"
.LASF238:
	.string	"__FLT128_MAX_EXP__ 16384"
.LASF1975:
	.string	"pkg_runtime_avg"
.LASF1560:
	.string	"winstr(w,s) winnstr(w, s, -1)"
.LASF211:
	.string	"__FLT32_MIN__ 1.17549435082228750796873653722224568e-38F32"
.LASF708:
	.string	"_BSD_WCHAR_T_ "
.LASF666:
	.string	"__attr_dealloc_fclose __attr_dealloc (fclose, 1)"
.LASF748:
	.string	"__lldiv_t_defined 1"
.LASF1312:
	.string	"INT_LEAST64_MAX (__INT64_C(9223372036854775807))"
.LASF1768:
	.string	"NCURSES_BUTTON_RELEASED 001L"
.LASF479:
	.string	"__attribute_noinline__ __attribute__ ((__noinline__))"
.LASF1429:
	.string	"COLOR_YELLOW 3"
.LASF1716:
	.string	"KEY_FIND 0552"
.LASF837:
	.string	"__SIZEOF_PTHREAD_RWLOCKATTR_T 8"
.LASF1860:
	.string	"VR_THERM_ALERT_STATUS 64"
.LASF641:
	.string	"__ferror_unlocked_body(_fp) (((_fp)->_flags & _IO_ERR_SEEN) != 0)"
.LASF895:
	.string	"_POSIX_THREAD_ROBUST_PRIO_INHERIT 200809L"
.LASF1695:
	.string	"KEY_PPAGE 0523"
.LASF369:
	.string	"__GLIBC_INTERNAL_STARTING_HEADER_IMPLEMENTATION"
.LASF226:
	.string	"__FLT64_NORM_MAX__ 1.79769313486231570814527423731704357e+308F64"
.LASF733:
	.string	"__WIFSTOPPED(status) (((status) & 0xff) == 0x7f)"
.LASF376:
	.string	"__USE_POSIX2"
.LASF2018:
	.string	"power_per_domain"
.LASF1585:
	.string	"clrtoeol() wclrtoeol(stdscr)"
.LASF1774:
	.string	"BUTTON1_RELEASED NCURSES_MOUSE_MASK(1, NCURSES_BUTTON_RELEASED)"
.LASF615:
	.string	"__CLOCKID_T_TYPE __S32_TYPE"
.LASF1449:
	.string	"ACS_CKBOARD NCURSES_ACS('a')"
.LASF1967:
	.string	"runtime_avg"
.LASF2002:
	.string	"printw"
.LASF1006:
	.string	"_SC_MQ_OPEN_MAX _SC_MQ_OPEN_MAX"
.LASF1428:
	.string	"COLOR_GREEN 2"
.LASF1526:
	.string	"getmaxyx(win,y,x) (y = getmaxy(win), x = getmaxx(win))"
.LASF1607:
	.string	"standend() wstandend(stdscr)"
.LASF1755:
	.string	"KEY_SREPLACE 0621"
.LASF1450:
	.string	"ACS_DEGREE NCURSES_ACS('f')"
.LASF1108:
	.string	"_SC_XBS5_LP64_OFF64 _SC_XBS5_LP64_OFF64"
.LASF1182:
	.string	"_SC_RAW_SOCKETS _SC_RAW_SOCKETS"
.LASF1118:
	.string	"_SC_CLOCK_SELECTION _SC_CLOCK_SELECTION"
.LASF1085:
	.string	"_SC_INT_MAX _SC_INT_MAX"
.LASF1953:
	.string	"attr_t"
.LASF1003:
	.string	"_SC_AIO_MAX _SC_AIO_MAX"
.LASF578:
	.string	"__SWORD_TYPE long int"
.LASF700:
	.string	"__need_wchar_t "
.LASF383:
	.string	"__USE_XOPEN2KXSI"
.LASF1275:
	.string	"NCURSES_VERSION_PATCH 20211021"
.LASF1141:
	.string	"_SC_SPORADIC_SERVER _SC_SPORADIC_SERVER"
.LASF1746:
	.string	"KEY_SIC 0610"
.LASF824:
	.string	"__blkcnt_t_defined "
.LASF13:
	.string	"__ATOMIC_ACQ_REL 4"
.LASF998:
	.string	"_SC_MEMORY_PROTECTION _SC_MEMORY_PROTECTION"
.LASF725:
	.string	"__WNOTHREAD 0x20000000"
.LASF705:
	.string	"_T_WCHAR "
.LASF1721:
	.string	"KEY_NEXT 0557"
.LASF560:
	.string	"_SIZET_ "
.LASF49:
	.string	"__INT8_TYPE__ signed char"
.LASF1302:
	.string	"UINT16_MAX (65535)"
.LASF347:
	.string	"__SSE2_MATH__ 1"
.LASF309:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 1"
.LASF342:
	.string	"__MMX__ 1"
.LASF1272:
	.string	"CURSES_H 1"
.LASF620:
	.string	"__CPU_MASK_TYPE __SYSCALL_ULONG_TYPE"
.LASF953:
	.string	"X_OK 1"
.LASF628:
	.string	"__TIME64_T_TYPE __TIME_T_TYPE"
.LASF1790:
	.string	"BUTTON4_PRESSED NCURSES_MOUSE_MASK(4, NCURSES_BUTTON_PRESSED)"
.LASF585:
	.string	"_BITS_TYPESIZES_H 1"
.LASF1745:
	.string	"KEY_SHOME 0607"
.LASF940:
	.string	"__ILP32_OFF32_LDFLAGS \"-m32\""
.LASF1809:
	.string	"BUTTON_RESERVED_EVENT(e,x) ((e) & NCURSES_MOUSE_MASK(x, 040))"
.LASF460:
	.string	"__glibc_unsafe_len(__l,__s,__osz) (__glibc_unsigned_or_positive (__l) && __builtin_constant_p (__glibc_safe_len_cond ((__SIZE_TYPE__) (__l), __s, __osz)) && !__glibc_safe_len_cond ((__SIZE_TYPE__) (__l), __s, __osz))"
.LASF220:
	.string	"__FLT64_MIN_EXP__ (-1021)"
.LASF1718:
	.string	"KEY_MARK 0554"
.LASF1798:
	.string	"BUTTON5_TRIPLE_CLICKED NCURSES_MOUSE_MASK(5, NCURSES_TRIPLE_CLICKED)"
.LASF624:
	.string	"__STATFS_MATCHES_STATFS64 1"
.LASF1349:
	.string	"UINT16_C(c) c"
.LASF1508:
	.string	"A_STANDOUT NCURSES_BITS(1U,8)"
.LASF831:
	.string	"__SIZEOF_PTHREAD_ATTR_T 56"
.LASF850:
	.string	"_ALLOCA_H 1"
.LASF1069:
	.string	"_SC_PASS_MAX _SC_PASS_MAX"
.LASF727:
	.string	"__WCLONE 0x80000000"
.LASF1335:
	.string	"PTRDIFF_MIN (-9223372036854775807L-1)"
.LASF1771:
	.string	"NCURSES_DOUBLE_CLICKED 010L"
.LASF990:
	.string	"_SC_TIMERS _SC_TIMERS"
.LASF345:
	.string	"__FXSR__ 1"
.LASF65:
	.string	"__INT_FAST8_TYPE__ signed char"
.LASF1687:
	.string	"KEY_IC 0513"
.LASF1574:
	.string	"attr_off(a,o) wattr_off(stdscr,(a),(o))"
.LASF377:
	.string	"__USE_POSIX199309"
.LASF1337:
	.string	"SIG_ATOMIC_MIN (-2147483647-1)"
.LASF1633:
	.string	"mvaddchnstr(y,x,str,n) mvwaddchnstr(stdscr,(y),(x),(str),(n))"
.LASF1503:
	.string	"NCURSES_BITS(mask,shift) (NCURSES_CAST(chtype,(mask)) << ((shift) + NCURSES_ATTR_SHIFT))"
.LASF1490:
	.string	"GCC_SCANFLIKE(fmt,var) __attribute__((format(scanf,fmt,var)))"
.LASF350:
	.string	"__SEG_GS 1"
.LASF1042:
	.string	"_SC_PII_INTERNET_STREAM _SC_PII_INTERNET_STREAM"
.LASF252:
	.string	"__FLT32X_MIN_EXP__ (-1021)"
.LASF1248:
	.string	"_CS_POSIX_V7_ILP32_OFF32_LIBS _CS_POSIX_V7_ILP32_OFF32_LIBS"
.LASF706:
	.string	"__WCHAR_T "
.LASF961:
	.string	"_PC_NAME_MAX _PC_NAME_MAX"
.LASF1264:
	.string	"_GETOPT_POSIX_H 1"
.LASF754:
	.string	"__u_char_defined "
.LASF1124:
	.string	"_SC_FD_MGMT _SC_FD_MGMT"
.LASF888:
	.string	"_POSIX_REENTRANT_FUNCTIONS 1"
.LASF1913:
	.string	"_freeres_buf"
.LASF336:
	.string	"__ATOMIC_HLE_ACQUIRE 65536"
.LASF2021:
	.string	"temperature"
.LASF116:
	.string	"__INT16_C(c) c"
.LASF815:
	.string	"__FD_MASK(d) ((__fd_mask) (1UL << ((d) % __NFDBITS)))"
.LASF43:
	.string	"__WINT_TYPE__ unsigned int"
.LASF132:
	.string	"__INT_FAST8_MAX__ 0x7f"
.LASF1843:
	.string	"GREEN 4"
.LASF683:
	.string	"__HAVE_DISTINCT_FLOAT32X 0"
.LASF1406:
	.string	"NCURSES_CAST(type,value) (type)(value)"
.LASF404:
	.string	"__GLIBC_USE_ISOC2X 0"
.LASF1670:
	.string	"is_linetouched(w,l) ((!(w) || ((l) > getmaxy(w)) || ((l) < 0)) ? ERR : (is_linetouched)((w),(l)))"
.LASF247:
	.string	"__FLT128_HAS_INFINITY__ 1"
.LASF896:
	.string	"_POSIX_THREAD_ROBUST_PRIO_PROTECT -1"
.LASF1922:
	.string	"long long unsigned int"
.LASF755:
	.string	"__ino_t_defined "
.LASF1522:
	.string	"A_VERTICAL NCURSES_BITS(1U,22)"
.LASF625:
	.string	"__KERNEL_OLD_TIMEVAL_MATCHES_TIMEVAL64 1"
.LASF70:
	.string	"__UINT_FAST16_TYPE__ long unsigned int"
.LASF1905:
	.string	"_cur_column"
.LASF90:
	.string	"__LONG_WIDTH__ 64"
.LASF870:
	.string	"_XOPEN_LEGACY 1"
.LASF108:
	.string	"__UINT8_MAX__ 0xff"
.LASF980:
	.string	"_SC_CHILD_MAX _SC_CHILD_MAX"
.LASF630:
	.string	"_____fpos_t_defined 1"
.LASF1362:
	.string	"NCURSES_COLOR_T short"
.LASF360:
	.string	"__DECIMAL_BID_FORMAT__ 1"
.LASF1177:
	.string	"_SC_LEVEL3_CACHE_LINESIZE _SC_LEVEL3_CACHE_LINESIZE"
.LASF1370:
	.string	"NCURSES_REENTRANT 0"
.LASF538:
	.string	"__GLIBC_USE_IEC_60559_FUNCS_EXT 0"
.LASF985:
	.string	"_SC_TZNAME_MAX _SC_TZNAME_MAX"
.LASF140:
	.string	"__UINT_FAST8_MAX__ 0xff"
.LASF1937:
	.string	"_leaveok"
.LASF234:
	.string	"__FLT128_MANT_DIG__ 113"
.LASF222:
	.string	"__FLT64_MAX_EXP__ 1024"
.LASF451:
	.string	"__BEGIN_DECLS "
.LASF1140:
	.string	"_SC_SPAWN _SC_SPAWN"
.LASF497:
	.string	"__restrict_arr __restrict"
.LASF1097:
	.string	"_SC_UINT_MAX _SC_UINT_MAX"
.LASF1484:
	.string	"_ISPAD 0x10"
.LASF1254:
	.string	"_CS_POSIX_V7_LP64_OFF64_CFLAGS _CS_POSIX_V7_LP64_OFF64_CFLAGS"
.LASF1288:
	.string	"_STDINT_H 1"
.LASF285:
	.string	"__DEC32_MIN__ 1E-95DF"
.LASF1469:
	.string	"ACS_BBSS ACS_URCORNER"
.LASF667:
	.string	"_BITS_FLOATN_H "
.LASF224:
	.string	"__FLT64_DECIMAL_DIG__ 17"
.LASF883:
	.string	"_POSIX_NO_TRUNC 1"
.LASF1729:
	.string	"KEY_RESTART 0567"
.LASF1481:
	.string	"_ENDLINE 0x02"
.LASF1393:
	.string	"_VA_LIST "
.LASF1796:
	.string	"BUTTON5_CLICKED NCURSES_MOUSE_MASK(5, NCURSES_BUTTON_CLICKED)"
.LASF416:
	.string	"__USE_POSIX199506 1"
.LASF1517:
	.string	"A_HORIZONTAL NCURSES_BITS(1U,17)"
.LASF958:
	.string	"_PC_LINK_MAX _PC_LINK_MAX"
.LASF2007:
	.string	"sleep"
.LASF212:
	.string	"__FLT32_EPSILON__ 1.19209289550781250000000000000000000e-7F32"
.LASF131:
	.string	"__UINT64_C(c) c ## UL"
.LASF838:
	.string	"__SIZEOF_PTHREAD_BARRIERATTR_T 4"
.LASF14:
	.string	"__ATOMIC_CONSUME 1"
.LASF1823:
	.string	"TRACE_BITS 0x0100"
.LASF525:
	.string	"__stub_revoke "
.LASF613:
	.string	"__DADDR_T_TYPE __S32_TYPE"
.LASF498:
	.string	"__glibc_unlikely(cond) __builtin_expect ((cond), 0)"
.LASF1150:
	.string	"_SC_2_PBS_ACCOUNTING _SC_2_PBS_ACCOUNTING"
.LASF729:
	.string	"__WTERMSIG(status) ((status) & 0x7f)"
.LASF1026:
	.string	"_SC_2_VERSION _SC_2_VERSION"
.LASF1211:
	.string	"_CS_LFS64_LDFLAGS _CS_LFS64_LDFLAGS"
.LASF1008:
	.string	"_SC_VERSION _SC_VERSION"
.LASF1398:
	.string	"FALSE"
.LASF1898:
	.string	"_IO_backup_base"
.LASF418:
	.string	"__USE_XOPEN2K8 1"
.LASF1973:
	.string	"pkg_now"
.LASF600:
	.string	"__RLIM64_T_TYPE __UQUAD_TYPE"
.LASF928:
	.string	"_POSIX_TRACE -1"
.LASF315:
	.string	"__GCC_ATOMIC_WCHAR_T_LOCK_FREE 2"
.LASF1573:
	.string	"attr_get(ap,cp,o) wattr_get(stdscr,(ap),(cp),(o))"
.LASF1889:
	.string	"_IO_read_ptr"
.LASF59:
	.string	"__INT_LEAST32_TYPE__ int"
.LASF649:
	.string	"BUFSIZ 8192"
.LASF1924:
	.string	"WINDOW"
.LASF1931:
	.string	"_begy"
.LASF1606:
	.string	"setscrreg(t,b) wsetscrreg(stdscr,(t),(b))"
.LASF329:
	.string	"__SIZEOF_PTRDIFF_T__ 8"
.LASF1565:
	.string	"waddchstr(win,str) waddchnstr(win,str,-1)"
.LASF910:
	.string	"_POSIX_REGEXP 1"
.LASF746:
	.string	"WIFCONTINUED(status) __WIFCONTINUED (status)"
.LASF619:
	.string	"__SSIZE_T_TYPE __SWORD_TYPE"
.LASF699:
	.string	"_STRINGS_H 1"
.LASF1160:
	.string	"_SC_V6_LPBIG_OFFBIG _SC_V6_LPBIG_OFFBIG"
.LASF1535:
	.string	"saveterm() def_prog_mode()"
.LASF1394:
	.string	"_VA_LIST_T_H "
.LASF645:
	.string	"__ssize_t_defined "
.LASF264:
	.string	"__FLT32X_HAS_QUIET_NAN__ 1"
.LASF1091:
	.string	"_SC_SSIZE_MAX _SC_SSIZE_MAX"
.LASF38:
	.string	"__GNUC_EXECUTION_CHARSET_NAME \"UTF-8\""
.LASF419:
	.string	"_ATFILE_SOURCE"
.LASF2008:
	.string	"getopt"
.LASF1630:
	.string	"mvwinstr(win,y,x,s) (wmove((win),(y),(x)) == ERR ? ERR : winstr((win),(s)))"
.LASF1912:
	.string	"_freeres_list"
.LASF633:
	.string	"____FILE_defined 1"
.LASF519:
	.string	"__attr_dealloc_free __attr_dealloc (__builtin_free, 1)"
.LASF171:
	.string	"__DBL_MIN_EXP__ (-1021)"
.LASF429:
	.string	"__GLIBC_USE_DEPRECATED_SCANF 0"
.LASF1825:
	.string	"TRACE_CCALLS 0x0400"
.LASF821:
	.string	"FD_ISSET(fd,fdsetp) __FD_ISSET (fd, fdsetp)"
.LASF1952:
	.string	"_yoffset"
.LASF1518:
	.string	"A_LEFT NCURSES_BITS(1U,18)"
.LASF1644:
	.string	"mvinchnstr(y,x,s,n) mvwinchnstr(stdscr,(y),(x),(s),(n))"
.LASF987:
	.string	"_SC_SAVED_IDS _SC_SAVED_IDS"
.LASF539:
	.string	"__GLIBC_USE_IEC_60559_FUNCS_EXT_C2X"
.LASF685:
	.string	"__HAVE_DISTINCT_FLOAT128X __HAVE_FLOAT128X"
.LASF1357:
	.string	"NCURSES_CONST"
.LASF1172:
	.string	"_SC_LEVEL2_CACHE_SIZE _SC_LEVEL2_CACHE_SIZE"
.LASF1279:
	.string	"NCURSES_DLL_H_incl 1"
.LASF473:
	.string	"__attribute_alloc_size__(params) __attribute__ ((__alloc_size__ params))"
.LASF1650:
	.string	"mvinstr(y,x,s) mvwinstr(stdscr,(y),(x),(s))"
.LASF1000:
	.string	"_SC_SEMAPHORES _SC_SEMAPHORES"
.LASF840:
	.string	"__ONCE_ALIGNMENT "
.LASF1854:
	.string	"PKG_POWER_LIMITATION_STATUS 1024"
.LASF907:
	.string	"_POSIX_SHARED_MEMORY_OBJECTS 200809L"
.LASF410:
	.string	"_POSIX_SOURCE 1"
.LASF1999:
	.string	"draw_power"
.LASF829:
	.string	"_BITS_PTHREADTYPES_ARCH_H 1"
.LASF922:
	.string	"_POSIX_ADVISORY_INFO 200809L"
.LASF852:
	.string	"alloca(size) __builtin_alloca (size)"
.LASF1756:
	.string	"KEY_SRIGHT 0622"
.LASF286:
	.string	"__DEC32_MAX__ 9.999999E96DF"
.LASF1334:
	.string	"UINTMAX_MAX (__UINT64_C(18446744073709551615))"
.LASF1904:
	.string	"_old_offset"
.LASF1401:
	.string	"bool _Bool"
.LASF1417:
	.string	"WA_INVIS A_INVIS"
.LASF1213:
	.string	"_CS_LFS64_LINTFLAGS _CS_LFS64_LINTFLAGS"
.LASF1459:
	.string	"ACS_BLOCK NCURSES_ACS('0')"
.LASF248:
	.string	"__FLT128_HAS_QUIET_NAN__ 1"
.LASF1722:
	.string	"KEY_OPEN 0560"
.LASF2022:
	.string	"voltage"
.LASF500:
	.string	"__attribute_nonstring__ __attribute__ ((__nonstring__))"
.LASF616:
	.string	"__TIMER_T_TYPE void *"
.LASF866:
	.string	"_XOPEN_XPG3 1"
.LASF1505:
	.string	"A_ATTRIBUTES NCURSES_BITS(~(1U - 1U),0)"
.LASF1735:
	.string	"KEY_SCOPY 0575"
.LASF1542:
	.string	"getbegx(win) (NCURSES_OK_ADDR(win) ? (win)->_begx : ERR)"
.LASF1588:
	.string	"deleteln() winsdelln(stdscr,-1)"
.LASF262:
	.string	"__FLT32X_HAS_DENORM__ 1"
.LASF773:
	.string	"__LITTLE_ENDIAN 1234"
.LASF1865:
	.string	"MAX_TURBO_LIMIT_STATUS 4096"
.LASF1977:
	.string	"energy_unit"
.LASF789:
	.string	"htobe16(x) __bswap_16 (x)"
.LASF1519:
	.string	"A_LOW NCURSES_BITS(1U,19)"
.LASF216:
	.string	"__FLT32_HAS_QUIET_NAN__ 1"
.LASF431:
	.string	"__GNU_LIBRARY__ 6"
.LASF2014:
	.string	"init_gui"
.LASF1921:
	.string	"long long int"
.LASF606:
	.string	"__FSFILCNT64_T_TYPE __UQUAD_TYPE"
.LASF1342:
	.string	"WINT_MIN (0u)"
.LASF1159:
	.string	"_SC_V6_LP64_OFF64 _SC_V6_LP64_OFF64"
.LASF1767:
	.string	"NCURSES_MOUSE_MASK(b,m) ((m) << (((b) - 1) * 5))"
.LASF1740:
	.string	"KEY_SEND 0602"
.LASF1903:
	.string	"_flags2"
.LASF1149:
	.string	"_SC_2_PBS _SC_2_PBS"
.LASF750:
	.string	"EXIT_FAILURE 1"
.LASF1245:
	.string	"_CS_POSIX_V6_LPBIG_OFFBIG_LINTFLAGS _CS_POSIX_V6_LPBIG_OFFBIG_LINTFLAGS"
.LASF1465:
	.string	"ACS_NEQUAL NCURSES_ACS('|')"
.LASF740:
	.string	"WEXITSTATUS(status) __WEXITSTATUS (status)"
.LASF1805:
	.string	"BUTTON_PRESS(e,x) ((e) & NCURSES_MOUSE_MASK(x, 002))"
.LASF302:
	.string	"__DEC128_SUBNORMAL_MIN__ 0.000000000000000000000000000000001E-6143DL"
.LASF1112:
	.string	"_SC_XOPEN_REALTIME_THREADS _SC_XOPEN_REALTIME_THREADS"
.LASF210:
	.string	"__FLT32_NORM_MAX__ 3.40282346638528859811704183484516925e+38F32"
.LASF1443:
	.string	"ACS_HLINE NCURSES_ACS('q')"
.LASF1498:
	.string	"NCURSES_SP_FUNCS"
.LASF908:
	.string	"_POSIX_CPUTIME 0"
.LASF639:
	.string	"__feof_unlocked_body(_fp) (((_fp)->_flags & _IO_EOF_SEEN) != 0)"
.LASF1948:
	.string	"_parx"
.LASF1949:
	.string	"_pary"
.LASF1228:
	.string	"_CS_XBS5_LPBIG_OFFBIG_LIBS _CS_XBS5_LPBIG_OFFBIG_LIBS"
.LASF96:
	.string	"__INTMAX_MAX__ 0x7fffffffffffffffL"
.LASF1066:
	.string	"_SC_PHYS_PAGES _SC_PHYS_PAGES"
.LASF843:
	.string	"__PTHREAD_MUTEX_HAVE_PREV 1"
.LASF1730:
	.string	"KEY_RESUME 0570"
.LASF730:
	.string	"__WSTOPSIG(status) __WEXITSTATUS(status)"
.LASF1206:
	.string	"_CS_LFS_CFLAGS _CS_LFS_CFLAGS"
.LASF481:
	.string	"__attribute_deprecated_msg__(msg) __attribute__ ((__deprecated__ (msg)))"
.LASF176:
	.string	"__DBL_MAX__ ((double)1.79769313486231570814527423731704357e+308L)"
.LASF292:
	.string	"__DEC64_MIN__ 1E-383DD"
.LASF436:
	.string	"__PMT"
.LASF603:
	.string	"__FSBLKCNT_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF343:
	.string	"__SSE__ 1"
.LASF2015:
	.string	"init_environment"
.LASF183:
	.string	"__DBL_HAS_QUIET_NAN__ 1"
.LASF282:
	.string	"__DEC32_MANT_DIG__ 7"
.LASF390:
	.string	"__USE_ATFILE"
.LASF647:
	.string	"_IOLBF 1"
.LASF1195:
	.string	"_SC_MINSIGSTKSZ _SC_MINSIGSTKSZ"
.LASF164:
	.string	"__FLT_DENORM_MIN__ 1.40129846432481707092372958328991613e-45F"
.LASF859:
	.string	"_POSIX2_C_BIND __POSIX2_THIS_VERSION"
.LASF1965:
	.string	"sensor"
.LASF1731:
	.string	"KEY_SAVE 0571"
.LASF253:
	.string	"__FLT32X_MIN_10_EXP__ (-307)"
.LASF1067:
	.string	"_SC_AVPHYS_PAGES _SC_AVPHYS_PAGES"
.LASF1812:
	.string	"_tracech_t2 _tracechtype2"
.LASF1168:
	.string	"_SC_LEVEL1_ICACHE_LINESIZE _SC_LEVEL1_ICACHE_LINESIZE"
.LASF356:
	.string	"__unix 1"
.LASF503:
	.string	"__LDOUBLE_REDIRECTS_TO_FLOAT128_ABI 0"
.LASF533:
	.string	"__GLIBC_USE_IEC_60559_BFP_EXT_C2X"
.LASF199:
	.string	"__LDBL_HAS_INFINITY__ 1"
.LASF1210:
	.string	"_CS_LFS64_CFLAGS _CS_LFS64_CFLAGS"
.LASF996:
	.string	"_SC_MEMLOCK _SC_MEMLOCK"
.LASF483:
	.string	"__attribute_format_strfmon__(a,b) __attribute__ ((__format__ (__strfmon__, a, b)))"
.LASF1120:
	.string	"_SC_THREAD_CPUTIME _SC_THREAD_CPUTIME"
.LASF646:
	.string	"_IOFBF 0"
.LASF1799:
	.string	"BUTTON_CTRL NCURSES_MOUSE_MASK(6, 0001L)"
.LASF1329:
	.string	"INTPTR_MIN (-9223372036854775807L-1)"
.LASF395:
	.string	"__GLIBC_USE_ISOC2X"
.LASF536:
	.string	"__GLIBC_USE_IEC_60559_EXT 0"
.LASF1336:
	.string	"PTRDIFF_MAX (9223372036854775807L)"
.LASF161:
	.string	"__FLT_NORM_MAX__ 3.40282346638528859811704183484516925e+38F"
.LASF1734:
	.string	"KEY_SCOMMAND 0574"
.LASF608:
	.string	"__CLOCK_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF268:
	.string	"__FLT64X_MIN_EXP__ (-16381)"
.LASF459:
	.string	"__glibc_safe_or_unknown_len(__l,__s,__osz) (__glibc_unsigned_or_positive (__l) && __builtin_constant_p (__glibc_safe_len_cond ((__SIZE_TYPE__) (__l), __s, __osz)) && __glibc_safe_len_cond ((__SIZE_TYPE__) (__l), __s, __osz))"
.LASF1448:
	.string	"ACS_DIAMOND NCURSES_ACS('`')"
.LASF1086:
	.string	"_SC_INT_MIN _SC_INT_MIN"
.LASF1581:
	.string	"bkgdset(ch) wbkgdset(stdscr,(ch))"
.LASF295:
	.string	"__DEC64_SUBNORMAL_MIN__ 0.000000000000001E-383DD"
.LASF28:
	.string	"__SIZEOF_LONG_DOUBLE__ 16"
.LASF1726:
	.string	"KEY_REFERENCE 0564"
.LASF960:
	.string	"_PC_MAX_INPUT _PC_MAX_INPUT"
.LASF66:
	.string	"__INT_FAST16_TYPE__ long int"
.LASF697:
	.string	"_BITS_TYPES_LOCALE_T_H 1"
.LASF605:
	.string	"__FSFILCNT_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF1750:
	.string	"KEY_SNEXT 0614"
.LASF230:
	.string	"__FLT64_HAS_DENORM__ 1"
.LASF1934:
	.string	"_bkgd"
.LASF240:
	.string	"__FLT128_DECIMAL_DIG__ 36"
.LASF165:
	.string	"__FLT_HAS_DENORM__ 1"
.LASF966:
	.string	"_PC_VDISABLE _PC_VDISABLE"
.LASF1900:
	.string	"_markers"
.LASF1556:
	.string	"box(win,v,h) wborder(win, v, v, h, h, 0, 0, 0, 0)"
.LASF58:
	.string	"__INT_LEAST16_TYPE__ short int"
.LASF598:
	.string	"__PID_T_TYPE __S32_TYPE"
.LASF1863:
	.string	"PKG_PL1_STATUS 1024"
.LASF1489:
	.string	"GCC_PRINTFLIKE(fmt,var) __attribute__((format(printf,fmt,var)))"
.LASF938:
	.string	"_XBS5_LP64_OFF64 1"
.LASF1464:
	.string	"ACS_PI NCURSES_ACS('{')"
.LASF1281:
	.string	"NCURSES_IMPEXP NCURSES_EXPORT_GENERAL_IMPORT"
.LASF1002:
	.string	"_SC_AIO_LISTIO_MAX _SC_AIO_LISTIO_MAX"
.LASF1866:
	.string	"TURBO_TRANSITION_ATTENUATION_STATUS 8192"
.LASF1808:
	.string	"BUTTON_TRIPLE_CLICK(e,x) ((e) & NCURSES_MOUSE_MASK(x, 020))"
.LASF994:
	.string	"_SC_FSYNC _SC_FSYNC"
.LASF1592:
	.string	"getstr(str) wgetstr(stdscr,(str))"
.LASF193:
	.string	"__LDBL_MAX__ 1.18973149535723176502126385303097021e+4932L"
.LASF26:
	.string	"__SIZEOF_FLOAT__ 4"
.LASF2034:
	.string	"main"
.LASF301:
	.string	"__DEC128_EPSILON__ 1E-33DL"
.LASF546:
	.string	"__SIZE_T__ "
.LASF1044:
	.string	"_SC_PII_OSI_COTS _SC_PII_OSI_COTS"
.LASF1512:
	.string	"A_DIM NCURSES_BITS(1U,12)"
.LASF902:
	.string	"_POSIX_PRIORITIZED_IO 200809L"
.LASF1433:
	.string	"COLOR_WHITE 7"
.LASF1675:
	.string	"KEY_RESET 0531"
.LASF1420:
	.string	"WA_LEFT A_LEFT"
.LASF61:
	.string	"__UINT_LEAST8_TYPE__ unsigned char"
.LASF594:
	.string	"__NLINK_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF366:
	.string	"__STDC_ISO_10646__ 201706L"
.LASF188:
	.string	"__LDBL_MIN_10_EXP__ (-4931)"
.LASF1119:
	.string	"_SC_CPUTIME _SC_CPUTIME"
.LASF1371:
	.string	"NCURSES_BROKEN_LINKER"
.LASF463:
	.string	"__warnattr(msg) __attribute__((__warning__ (msg)))"
.LASF449:
	.string	"__STRING(x) #x"
.LASF1486:
	.string	"_WRAPPED 0x40"
.LASF1192:
	.string	"_SC_XOPEN_STREAMS _SC_XOPEN_STREAMS"
.LASF46:
	.string	"__CHAR16_TYPE__ short unsigned int"
.LASF1480:
	.string	"_SUBWIN 0x01"
.LASF891:
	.string	"_POSIX_THREAD_ATTR_STACKSIZE 200809L"
.LASF1878:
	.string	"unsigned int"
.LASF1980:
	.string	"power_now"
.LASF1233:
	.string	"_CS_POSIX_V6_ILP32_OFF32_LINTFLAGS _CS_POSIX_V6_ILP32_OFF32_LINTFLAGS"
.LASF800:
	.string	"le64toh(x) __uint64_identity (x)"
.LASF1527:
	.string	"getparyx(win,y,x) (y = getpary(win), x = getparx(win))"
.LASF1514:
	.string	"A_ALTCHARSET NCURSES_BITS(1U,14)"
.LASF1559:
	.string	"vline(ch,n) wvline(stdscr, ch, (n))"
.LASF1094:
	.string	"_SC_SHRT_MAX _SC_SHRT_MAX"
.LASF1226:
	.string	"_CS_XBS5_LPBIG_OFFBIG_CFLAGS _CS_XBS5_LPBIG_OFFBIG_CFLAGS"
.LASF476:
	.string	"__attribute_const__ __attribute__ ((__const__))"
.LASF540:
	.string	"__GLIBC_USE_IEC_60559_FUNCS_EXT_C2X 0"
.LASF1136:
	.string	"_SC_REGEXP _SC_REGEXP"
.LASF486:
	.string	"__returns_nonnull __attribute__ ((__returns_nonnull__))"
.LASF1647:
	.string	"mvinsch(y,x,c) mvwinsch(stdscr,(y),(x),(c))"
.LASF1430:
	.string	"COLOR_BLUE 4"
.LASF1707:
	.string	"KEY_BTAB 0541"
.LASF162:
	.string	"__FLT_MIN__ 1.17549435082228750796873653722224568e-38F"
.LASF586:
	.string	"__SYSCALL_SLONG_TYPE __SLONGWORD_TYPE"
.LASF508:
	.string	"__LDBL_REDIR2_DECL(name) "
.LASF40:
	.string	"__SIZE_TYPE__ long unsigned int"
.LASF189:
	.string	"__LDBL_MAX_EXP__ 16384"
.LASF927:
	.string	"_POSIX_THREAD_SPORADIC_SERVER -1"
.LASF1584:
	.string	"clrtobot() wclrtobot(stdscr)"
.LASF1882:
	.string	"short int"
.LASF348:
	.string	"__MMX_WITH_SSE__ 1"
.LASF1691:
	.string	"KEY_EOL 0517"
.LASF900:
	.string	"_POSIX_ASYNC_IO 1"
.LASF2016:
	.string	"argc"
.LASF6:
	.string	"__GNUC_MINOR__ 4"
.LASF1063:
	.string	"_SC_THREAD_PROCESS_SHARED _SC_THREAD_PROCESS_SHARED"
.LASF2:
	.string	"__STDC_UTF_16__ 1"
.LASF1822:
	.string	"TRACE_IEVENT 0x0080"
.LASF1577:
	.string	"attroff(at) wattroff(stdscr,(at))"
.LASF1359:
	.string	"NCURSES_INLINE"
.LASF20:
	.string	"_LP64 1"
.LASF1906:
	.string	"_vtable_offset"
.LASF62:
	.string	"__UINT_LEAST16_TYPE__ short unsigned int"
.LASF1871:
	.string	"AMD_MSR_CORE_ENERGY 0xC001029A"
.LASF582:
	.string	"__S64_TYPE long int"
.LASF1185:
	.string	"_SC_V7_LP64_OFF64 _SC_V7_LP64_OFF64"
.LASF817:
	.string	"FD_SETSIZE __FD_SETSIZE"
.LASF142:
	.string	"__UINT_FAST32_MAX__ 0xffffffffffffffffUL"
.LASF1373:
	.string	"NCURSES_INTEROP_FUNCS 1"
.LASF993:
	.string	"_SC_SYNCHRONIZED_IO _SC_SYNCHRONIZED_IO"
.LASF1572:
	.string	"addstr(str) waddnstr(stdscr,(str),-1)"
.LASF1435:
	.string	"ACS_ULCORNER NCURSES_ACS('l')"
.LASF2017:
	.string	"argv"
.LASF133:
	.string	"__INT_FAST8_WIDTH__ 8"
.LASF99:
	.string	"__UINTMAX_C(c) c ## UL"
.LASF1561:
	.string	"winchstr(w,s) winchnstr(w, s, -1)"
.LASF1287:
	.string	"NCURSES_API "
.LASF1385:
	.string	"_STDARG_H "
.LASF1701:
	.string	"KEY_LL 0533"
.LASF41:
	.string	"__PTRDIFF_TYPE__ long int"
.LASF1797:
	.string	"BUTTON5_DOUBLE_CLICKED NCURSES_MOUSE_MASK(5, NCURSES_DOUBLE_CLICKED)"
.LASF1219:
	.string	"_CS_XBS5_ILP32_OFFBIG_LDFLAGS _CS_XBS5_ILP32_OFFBIG_LDFLAGS"
.LASF124:
	.string	"__UINT_LEAST8_MAX__ 0xff"
.LASF744:
	.string	"WIFSIGNALED(status) __WIFSIGNALED (status)"
.LASF1710:
	.string	"KEY_CLOSE 0544"
.LASF407:
	.string	"__USE_ISOC95 1"
.LASF433:
	.string	"__GLIBC_MINOR__ 35"
.LASF1099:
	.string	"_SC_USHRT_MAX _SC_USHRT_MAX"
.LASF1594:
	.string	"inchnstr(s,n) winchnstr(stdscr,(s),(n))"
.LASF122:
	.string	"__INT64_C(c) c ## L"
.LASF1492:
	.string	"GCC_UNUSED "
.LASF529:
	.string	"__GLIBC_USE_LIB_EXT2"
.LASF7:
	.string	"__GNUC_PATCHLEVEL__ 0"
.LASF170:
	.string	"__DBL_DIG__ 15"
.LASF1666:
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
