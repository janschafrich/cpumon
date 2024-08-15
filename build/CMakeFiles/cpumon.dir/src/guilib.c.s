	.file	"guilib.c"
	.intel_syntax noprefix
# GNU C17 (Ubuntu 11.4.0-1ubuntu1~22.04) version 11.4.0 (x86_64-linux-gnu)
#	compiled by GNU C version 11.4.0, GMP version 6.2.1, MPFR version 4.1.0, MPC version 1.2.1, isl version isl-0.24-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -masm=intel -mtune=generic -march=x86-64 -g -g -ggdb3 -gdwarf-2 -O0 -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection
	.text
.Ltext0:
	.globl	init_gui
	.type	init_gui, @function
init_gui:
.LFB0:
	.file 1 "/home/jscha/dvp/cpumon/src/guilib.c"
	.loc 1 4 20
	.cfi_startproc
	endbr64	
	push	rbp	#
.LCFI0:
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
.LCFI1:
	.cfi_def_cfa_register 6
# /home/jscha/dvp/cpumon/src/guilib.c:5:     initscr();
	.loc 1 5 5
	call	initscr@PLT	#
# /home/jscha/dvp/cpumon/src/guilib.c:6:     cbreak();
	.loc 1 6 5
	call	cbreak@PLT	#
# /home/jscha/dvp/cpumon/src/guilib.c:7:     noecho();
	.loc 1 7 5
	call	noecho@PLT	#
# /home/jscha/dvp/cpumon/src/guilib.c:9:     nodelay(stdscr, TRUE);
	.loc 1 9 5
	mov	rax, QWORD PTR stdscr[rip]	# stdscr.0_1, stdscr
	mov	esi, 1	#,
	mov	rdi, rax	#, stdscr.0_1
	call	nodelay@PLT	#
# /home/jscha/dvp/cpumon/src/guilib.c:10:     scrollok(stdscr, TRUE);
	.loc 1 10 5
	mov	rax, QWORD PTR stdscr[rip]	# stdscr.1_2, stdscr
	mov	esi, 1	#,
	mov	rdi, rax	#, stdscr.1_2
	call	scrollok@PLT	#
# /home/jscha/dvp/cpumon/src/guilib.c:11:     use_default_colors();
	.loc 1 11 5
	call	use_default_colors@PLT	#
# /home/jscha/dvp/cpumon/src/guilib.c:12:     start_color();
	.loc 1 12 5
	call	start_color@PLT	#
# /home/jscha/dvp/cpumon/src/guilib.c:13:     init_pair(WHITE, COLOR_WHITE, -1);
	.loc 1 13 5
	mov	edx, -1	#,
	mov	esi, 7	#,
	mov	edi, 1	#,
	call	init_pair@PLT	#
# /home/jscha/dvp/cpumon/src/guilib.c:14:     init_pair(BLUE, COLOR_BLUE, -1);
	.loc 1 14 5
	mov	edx, -1	#,
	mov	esi, 4	#,
	mov	edi, 2	#,
	call	init_pair@PLT	#
# /home/jscha/dvp/cpumon/src/guilib.c:15:     init_pair(RED, COLOR_RED, -1);
	.loc 1 15 5
	mov	edx, -1	#,
	mov	esi, 1	#,
	mov	edi, 3	#,
	call	init_pair@PLT	#
# /home/jscha/dvp/cpumon/src/guilib.c:16:     init_pair(GREEN, COLOR_GREEN, -1);
	.loc 1 16 5
	mov	edx, -1	#,
	mov	esi, 2	#,
	mov	edi, 4	#,
	call	init_pair@PLT	#
# /home/jscha/dvp/cpumon/src/guilib.c:17: }
	.loc 1 17 1
	nop	
	pop	rbp	#
.LCFI2:
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE0:
	.size	init_gui, .-init_gui
	.globl	kbhit
	.type	kbhit, @function
kbhit:
.LFB1:
	.loc 1 20 1
	.cfi_startproc
	endbr64	
	push	rbp	#
.LCFI3:
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
.LCFI4:
	.cfi_def_cfa_register 6
	sub	rsp, 16	#,
# /home/jscha/dvp/cpumon/src/guilib.c:21:     int ch = 0;
	.loc 1 21 9
	mov	DWORD PTR -4[rbp], 0	# ch,
# /home/jscha/dvp/cpumon/src/guilib.c:22:     ch = getch();
	.loc 1 22 9
	mov	rax, QWORD PTR stdscr[rip]	# stdscr.2_1, stdscr
	mov	rdi, rax	#, stdscr.2_1
	call	wgetch@PLT	#
	mov	DWORD PTR -4[rbp], eax	# ch, tmp85
# /home/jscha/dvp/cpumon/src/guilib.c:24:     if (ch != ERR) {
	.loc 1 24 8
	cmp	DWORD PTR -4[rbp], -1	# ch,
	je	.L3	#,
# /home/jscha/dvp/cpumon/src/guilib.c:25:         return ch;
	.loc 1 25 16
	mov	eax, DWORD PTR -4[rbp]	# _2, ch
	jmp	.L4	#
.L3:
# /home/jscha/dvp/cpumon/src/guilib.c:27:         return 0;
	.loc 1 27 16
	mov	eax, 0	# _2,
.L4:
# /home/jscha/dvp/cpumon/src/guilib.c:29: }
	.loc 1 29 1
	leave	
.LCFI5:
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE1:
	.size	kbhit, .-kbhit
	.section	.rodata
	.align 8
.LC0:
	.string	"\tPkg Power: %.2f W, avg: %.2f W\n"
.LC1:
	.string	"#"
.LC2:
	.string	"\nRest of Pkg: %.2f W"
.LC3:
	.string	"  Cores: %.2f W"
.LC4:
	.string	"  GPU: %.2f W"
.LC5:
	.string	"\n"
	.text
	.globl	draw_power
	.type	draw_power, @function
draw_power:
.LFB2:
	.loc 1 31 45
	.cfi_startproc
	endbr64	
	push	rbp	#
.LCFI6:
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
.LCFI7:
	.cfi_def_cfa_register 6
	sub	rsp, 48	#,
	mov	QWORD PTR -40[rbp], rdi	# value, value
	movss	DWORD PTR -44[rbp], xmm0	# pkg_avg, pkg_avg
# /home/jscha/dvp/cpumon/src/guilib.c:33:     int value_count = 3;
	.loc 1 33 9
	mov	DWORD PTR -12[rbp], 3	# value_count,
# /home/jscha/dvp/cpumon/src/guilib.c:34:     int width = 48;                         // choose highly composite number
	.loc 1 34 9
	mov	DWORD PTR -8[rbp], 48	# width,
# /home/jscha/dvp/cpumon/src/guilib.c:36:     float total = value[0];
	.loc 1 36 11
	mov	rax, QWORD PTR -40[rbp]	# tmp115, value
	movss	xmm0, DWORD PTR [rax]	# tmp116, *value_42(D)
	movss	DWORD PTR -4[rbp], xmm0	# total, tmp116
# /home/jscha/dvp/cpumon/src/guilib.c:38:     printw("\tPkg Power: %.2f W, avg: %.2f W\n", value[0], pkg_avg);
	.loc 1 38 5
	pxor	xmm0, xmm0	# _1
	cvtss2sd	xmm0, DWORD PTR -44[rbp]	# _1, pkg_avg
# /home/jscha/dvp/cpumon/src/guilib.c:38:     printw("\tPkg Power: %.2f W, avg: %.2f W\n", value[0], pkg_avg);
	.loc 1 38 55
	mov	rax, QWORD PTR -40[rbp]	# tmp117, value
	movss	xmm1, DWORD PTR [rax]	# _2, *value_42(D)
# /home/jscha/dvp/cpumon/src/guilib.c:38:     printw("\tPkg Power: %.2f W, avg: %.2f W\n", value[0], pkg_avg);
	.loc 1 38 5
	pxor	xmm2, xmm2	# _3
	cvtss2sd	xmm2, xmm1	# _3, _2
	movq	rax, xmm2	# _3, _3
	movapd	xmm1, xmm0	#, _1
	movq	xmm0, rax	#, _3
	lea	rax, .LC0[rip]	# tmp118,
	mov	rdi, rax	#, tmp118
	mov	eax, 2	#,
	call	printw@PLT	#
# /home/jscha/dvp/cpumon/src/guilib.c:39:     value[0] = value[0] - value[1] - value[2];      // subtract cpu and uncore power from package power to get "rest of chip power"
	.loc 1 39 21
	mov	rax, QWORD PTR -40[rbp]	# tmp119, value
	movss	xmm0, DWORD PTR [rax]	# _4, *value_42(D)
# /home/jscha/dvp/cpumon/src/guilib.c:39:     value[0] = value[0] - value[1] - value[2];      // subtract cpu and uncore power from package power to get "rest of chip power"
	.loc 1 39 32
	mov	rax, QWORD PTR -40[rbp]	# tmp120, value
	add	rax, 4	# _5,
	movss	xmm1, DWORD PTR [rax]	# _6, *_5
# /home/jscha/dvp/cpumon/src/guilib.c:39:     value[0] = value[0] - value[1] - value[2];      // subtract cpu and uncore power from package power to get "rest of chip power"
	.loc 1 39 25
	subss	xmm0, xmm1	# _7, _6
# /home/jscha/dvp/cpumon/src/guilib.c:39:     value[0] = value[0] - value[1] - value[2];      // subtract cpu and uncore power from package power to get "rest of chip power"
	.loc 1 39 43
	mov	rax, QWORD PTR -40[rbp]	# tmp121, value
	add	rax, 8	# _8,
	movss	xmm1, DWORD PTR [rax]	# _9, *_8
# /home/jscha/dvp/cpumon/src/guilib.c:39:     value[0] = value[0] - value[1] - value[2];      // subtract cpu and uncore power from package power to get "rest of chip power"
	.loc 1 39 36
	subss	xmm0, xmm1	# _10, _9
# /home/jscha/dvp/cpumon/src/guilib.c:39:     value[0] = value[0] - value[1] - value[2];      // subtract cpu and uncore power from package power to get "rest of chip power"
	.loc 1 39 14
	mov	rax, QWORD PTR -40[rbp]	# tmp122, value
	movss	DWORD PTR [rax], xmm0	# *value_42(D), _10
.LBB2:
# /home/jscha/dvp/cpumon/src/guilib.c:40:     for (int i = 0; i < value_count; i++){
	.loc 1 40 14
	mov	DWORD PTR -20[rbp], 0	# i,
# /home/jscha/dvp/cpumon/src/guilib.c:40:     for (int i = 0; i < value_count; i++){
	.loc 1 40 5
	jmp	.L6	#
.L13:
# /home/jscha/dvp/cpumon/src/guilib.c:41:         switch (i) {
	.loc 1 41 9
	cmp	DWORD PTR -20[rbp], 2	# i,
	je	.L7	#,
	cmp	DWORD PTR -20[rbp], 2	# i,
	jg	.L8	#,
	cmp	DWORD PTR -20[rbp], 0	# i,
	je	.L9	#,
	cmp	DWORD PTR -20[rbp], 1	# i,
	je	.L10	#,
	jmp	.L8	#
.L9:
# /home/jscha/dvp/cpumon/src/guilib.c:42:             case 0: attron(COLOR_PAIR(BLUE)); break;
	.loc 1 42 20
	mov	rax, QWORD PTR stdscr[rip]	# stdscr.3_11, stdscr
	mov	edx, 0	#,
	mov	esi, 512	#,
	mov	rdi, rax	#, stdscr.3_11
	call	wattr_on@PLT	#
# /home/jscha/dvp/cpumon/src/guilib.c:42:             case 0: attron(COLOR_PAIR(BLUE)); break;
	.loc 1 42 46
	jmp	.L8	#
.L10:
# /home/jscha/dvp/cpumon/src/guilib.c:43:             case 1: attron(COLOR_PAIR(RED)); break;
	.loc 1 43 20
	mov	rax, QWORD PTR stdscr[rip]	# stdscr.4_12, stdscr
	mov	edx, 0	#,
	mov	esi, 768	#,
	mov	rdi, rax	#, stdscr.4_12
	call	wattr_on@PLT	#
# /home/jscha/dvp/cpumon/src/guilib.c:43:             case 1: attron(COLOR_PAIR(RED)); break;
	.loc 1 43 45
	jmp	.L8	#
.L7:
# /home/jscha/dvp/cpumon/src/guilib.c:44:             case 2: attron(COLOR_PAIR(GREEN)); break;
	.loc 1 44 20
	mov	rax, QWORD PTR stdscr[rip]	# stdscr.5_13, stdscr
	mov	edx, 0	#,
	mov	esi, 1024	#,
	mov	rdi, rax	#, stdscr.5_13
	call	wattr_on@PLT	#
# /home/jscha/dvp/cpumon/src/guilib.c:44:             case 2: attron(COLOR_PAIR(GREEN)); break;
	.loc 1 44 47
	nop	
.L8:
.LBB3:
# /home/jscha/dvp/cpumon/src/guilib.c:46:         for (int j = 0; j < (int)( (value[i] * width ) / total ); j++ ){
	.loc 1 46 18
	mov	DWORD PTR -16[rbp], 0	# j,
# /home/jscha/dvp/cpumon/src/guilib.c:46:         for (int j = 0; j < (int)( (value[i] * width ) / total ); j++ ){
	.loc 1 46 9
	jmp	.L11	#
.L12:
# /home/jscha/dvp/cpumon/src/guilib.c:47:             printw("#");
	.loc 1 47 13 discriminator 3
	lea	rax, .LC1[rip]	# tmp123,
	mov	rdi, rax	#, tmp123
	mov	eax, 0	#,
	call	printw@PLT	#
# /home/jscha/dvp/cpumon/src/guilib.c:46:         for (int j = 0; j < (int)( (value[i] * width ) / total ); j++ ){
	.loc 1 46 68 discriminator 3
	add	DWORD PTR -16[rbp], 1	# j,
.L11:
# /home/jscha/dvp/cpumon/src/guilib.c:46:         for (int j = 0; j < (int)( (value[i] * width ) / total ); j++ ){
	.loc 1 46 42 discriminator 1
	mov	eax, DWORD PTR -20[rbp]	# tmp124, i
	cdqe
	lea	rdx, 0[0+rax*4]	# _15,
	mov	rax, QWORD PTR -40[rbp]	# tmp125, value
	add	rax, rdx	# _16, _15
	movss	xmm1, DWORD PTR [rax]	# _17, *_16
# /home/jscha/dvp/cpumon/src/guilib.c:46:         for (int j = 0; j < (int)( (value[i] * width ) / total ); j++ ){
	.loc 1 46 46 discriminator 1
	pxor	xmm0, xmm0	# _18
	cvtsi2ss	xmm0, DWORD PTR -8[rbp]	# _18, width
	mulss	xmm0, xmm1	# _19, _17
# /home/jscha/dvp/cpumon/src/guilib.c:46:         for (int j = 0; j < (int)( (value[i] * width ) / total ); j++ ){
	.loc 1 46 56 discriminator 1
	divss	xmm0, DWORD PTR -4[rbp]	# _20, total
# /home/jscha/dvp/cpumon/src/guilib.c:46:         for (int j = 0; j < (int)( (value[i] * width ) / total ); j++ ){
	.loc 1 46 29 discriminator 1
	cvttss2si	eax, xmm0	# _21, _20
# /home/jscha/dvp/cpumon/src/guilib.c:46:         for (int j = 0; j < (int)( (value[i] * width ) / total ); j++ ){
	.loc 1 46 27 discriminator 1
	cmp	DWORD PTR -16[rbp], eax	# j, _21
	jl	.L12	#,
.LBE3:
# /home/jscha/dvp/cpumon/src/guilib.c:40:     for (int i = 0; i < value_count; i++){
	.loc 1 40 39 discriminator 2
	add	DWORD PTR -20[rbp], 1	# i,
.L6:
# /home/jscha/dvp/cpumon/src/guilib.c:40:     for (int i = 0; i < value_count; i++){
	.loc 1 40 23 discriminator 1
	mov	eax, DWORD PTR -20[rbp]	# tmp126, i
	cmp	eax, DWORD PTR -12[rbp]	# tmp126, value_count
	jl	.L13	#,
.LBE2:
# /home/jscha/dvp/cpumon/src/guilib.c:50:     attron(COLOR_PAIR(BLUE));
	.loc 1 50 4
	mov	rax, QWORD PTR stdscr[rip]	# stdscr.6_22, stdscr
	mov	edx, 0	#,
	mov	esi, 512	#,
	mov	rdi, rax	#, stdscr.6_22
	call	wattr_on@PLT	#
# /home/jscha/dvp/cpumon/src/guilib.c:51:     printw("\nRest of Pkg: %.2f W", value[0]);
	.loc 1 51 42
	mov	rax, QWORD PTR -40[rbp]	# tmp127, value
	movss	xmm0, DWORD PTR [rax]	# _23, *value_42(D)
# /home/jscha/dvp/cpumon/src/guilib.c:51:     printw("\nRest of Pkg: %.2f W", value[0]);
	.loc 1 51 5
	pxor	xmm3, xmm3	# _24
	cvtss2sd	xmm3, xmm0	# _24, _23
	movq	rax, xmm3	# _24, _24
	movq	xmm0, rax	#, _24
	lea	rax, .LC2[rip]	# tmp128,
	mov	rdi, rax	#, tmp128
	mov	eax, 1	#,
	call	printw@PLT	#
# /home/jscha/dvp/cpumon/src/guilib.c:52:     attron(COLOR_PAIR(RED));
	.loc 1 52 4
	mov	rax, QWORD PTR stdscr[rip]	# stdscr.7_25, stdscr
	mov	edx, 0	#,
	mov	esi, 768	#,
	mov	rdi, rax	#, stdscr.7_25
	call	wattr_on@PLT	#
# /home/jscha/dvp/cpumon/src/guilib.c:53:     printw("  Cores: %.2f W", value[1]);
	.loc 1 53 36
	mov	rax, QWORD PTR -40[rbp]	# tmp129, value
	add	rax, 4	# _26,
	movss	xmm0, DWORD PTR [rax]	# _27, *_26
# /home/jscha/dvp/cpumon/src/guilib.c:53:     printw("  Cores: %.2f W", value[1]);
	.loc 1 53 5
	pxor	xmm4, xmm4	# _28
	cvtss2sd	xmm4, xmm0	# _28, _27
	movq	rax, xmm4	# _28, _28
	movq	xmm0, rax	#, _28
	lea	rax, .LC3[rip]	# tmp130,
	mov	rdi, rax	#, tmp130
	mov	eax, 1	#,
	call	printw@PLT	#
# /home/jscha/dvp/cpumon/src/guilib.c:54:     attron(COLOR_PAIR(GREEN));
	.loc 1 54 4
	mov	rax, QWORD PTR stdscr[rip]	# stdscr.8_29, stdscr
	mov	edx, 0	#,
	mov	esi, 1024	#,
	mov	rdi, rax	#, stdscr.8_29
	call	wattr_on@PLT	#
# /home/jscha/dvp/cpumon/src/guilib.c:55:     printw("  GPU: %.2f W", value[2]);
	.loc 1 55 34
	mov	rax, QWORD PTR -40[rbp]	# tmp131, value
	add	rax, 8	# _30,
	movss	xmm0, DWORD PTR [rax]	# _31, *_30
# /home/jscha/dvp/cpumon/src/guilib.c:55:     printw("  GPU: %.2f W", value[2]);
	.loc 1 55 5
	pxor	xmm5, xmm5	# _32
	cvtss2sd	xmm5, xmm0	# _32, _31
	movq	rax, xmm5	# _32, _32
	movq	xmm0, rax	#, _32
	lea	rax, .LC4[rip]	# tmp132,
	mov	rdi, rax	#, tmp132
	mov	eax, 1	#,
	call	printw@PLT	#
# /home/jscha/dvp/cpumon/src/guilib.c:56:     attron(COLOR_PAIR(WHITE));
	.loc 1 56 4
	mov	rax, QWORD PTR stdscr[rip]	# stdscr.9_33, stdscr
	mov	edx, 0	#,
	mov	esi, 256	#,
	mov	rdi, rax	#, stdscr.9_33
	call	wattr_on@PLT	#
# /home/jscha/dvp/cpumon/src/guilib.c:57:     printw("\n");
	.loc 1 57 5
	lea	rax, .LC5[rip]	# tmp133,
	mov	rdi, rax	#, tmp133
	mov	eax, 0	#,
	call	printw@PLT	#
# /home/jscha/dvp/cpumon/src/guilib.c:59: }
	.loc 1 59 1
	nop	
	leave	
.LCFI8:
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE2:
	.size	draw_power, .-draw_power
.Letext0:
	.file 2 "/usr/include/curses.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x510
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF1329
	.byte	0xc
	.long	.LASF1330
	.long	.LASF1331
	.quad	.Ltext0
	.quad	.Letext0
	.long	.Ldebug_line0
	.long	.Ldebug_macro0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF1265
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF1266
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF1267
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF1268
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF1269
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF1270
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF1271
	.uleb128 0x4
	.byte	0x8
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF1272
	.uleb128 0x5
	.long	0x6b
	.uleb128 0x6
	.long	.LASF1273
	.byte	0x2
	.byte	0xde
	.byte	0x12
	.long	0x3f
	.uleb128 0x7
	.long	.LASF1274
	.byte	0x2
	.value	0x1ba
	.byte	0x18
	.long	0x90
	.uleb128 0x8
	.long	.LASF1303
	.byte	0x58
	.byte	0x2
	.value	0x1eb
	.byte	0x8
	.long	0x24f
	.uleb128 0x9
	.long	.LASF1275
	.byte	0x2
	.value	0x1ed
	.byte	0x8
	.long	0x54
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x9
	.long	.LASF1276
	.byte	0x2
	.value	0x1ed
	.byte	0xf
	.long	0x54
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x9
	.long	.LASF1277
	.byte	0x2
	.value	0x1f0
	.byte	0x8
	.long	0x54
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x9
	.long	.LASF1278
	.byte	0x2
	.value	0x1f0
	.byte	0xf
	.long	0x54
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x9
	.long	.LASF1279
	.byte	0x2
	.value	0x1f1
	.byte	0x8
	.long	0x54
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x9
	.long	.LASF1280
	.byte	0x2
	.value	0x1f1
	.byte	0xf
	.long	0x54
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.uleb128 0x9
	.long	.LASF1281
	.byte	0x2
	.value	0x1f3
	.byte	0x8
	.long	0x54
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x9
	.long	.LASF1282
	.byte	0x2
	.value	0x1f6
	.byte	0x9
	.long	0x24f
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x9
	.long	.LASF1283
	.byte	0x2
	.value	0x1f7
	.byte	0x9
	.long	0x77
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x9
	.long	.LASF1284
	.byte	0x2
	.value	0x1fa
	.byte	0x8
	.long	0x2cb
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x9
	.long	.LASF1285
	.byte	0x2
	.value	0x1fb
	.byte	0x8
	.long	0x2cb
	.byte	0x2
	.byte	0x23
	.uleb128 0x19
	.uleb128 0x9
	.long	.LASF1286
	.byte	0x2
	.value	0x1fc
	.byte	0x8
	.long	0x2cb
	.byte	0x2
	.byte	0x23
	.uleb128 0x1a
	.uleb128 0x9
	.long	.LASF1287
	.byte	0x2
	.value	0x1fd
	.byte	0x8
	.long	0x2cb
	.byte	0x2
	.byte	0x23
	.uleb128 0x1b
	.uleb128 0x9
	.long	.LASF1288
	.byte	0x2
	.value	0x1fe
	.byte	0x8
	.long	0x2cb
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x9
	.long	.LASF1289
	.byte	0x2
	.value	0x1ff
	.byte	0x8
	.long	0x2cb
	.byte	0x2
	.byte	0x23
	.uleb128 0x1d
	.uleb128 0x9
	.long	.LASF1290
	.byte	0x2
	.value	0x200
	.byte	0x8
	.long	0x2cb
	.byte	0x2
	.byte	0x23
	.uleb128 0x1e
	.uleb128 0x9
	.long	.LASF1291
	.byte	0x2
	.value	0x201
	.byte	0x8
	.long	0x2cb
	.byte	0x2
	.byte	0x23
	.uleb128 0x1f
	.uleb128 0x9
	.long	.LASF1292
	.byte	0x2
	.value	0x202
	.byte	0x8
	.long	0x2cb
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x9
	.long	.LASF1293
	.byte	0x2
	.value	0x203
	.byte	0x6
	.long	0x5b
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x9
	.long	.LASF1294
	.byte	0x2
	.value	0x205
	.byte	0xf
	.long	0x2d8
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x9
	.long	.LASF1295
	.byte	0x2
	.value	0x208
	.byte	0x8
	.long	0x54
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0x9
	.long	.LASF1296
	.byte	0x2
	.value	0x209
	.byte	0x8
	.long	0x54
	.byte	0x2
	.byte	0x23
	.uleb128 0x32
	.uleb128 0x9
	.long	.LASF1297
	.byte	0x2
	.value	0x20c
	.byte	0x6
	.long	0x5b
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.uleb128 0x9
	.long	.LASF1298
	.byte	0x2
	.value	0x20d
	.byte	0x6
	.long	0x5b
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.uleb128 0x9
	.long	.LASF1299
	.byte	0x2
	.value	0x20e
	.byte	0xa
	.long	0x2de
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0x9
	.long	.LASF1300
	.byte	0x2
	.value	0x216
	.byte	0x4
	.long	0x25c
	.byte	0x2
	.byte	0x23
	.uleb128 0x48
	.uleb128 0x9
	.long	.LASF1301
	.byte	0x2
	.value	0x218
	.byte	0x8
	.long	0x54
	.byte	0x2
	.byte	0x23
	.uleb128 0x54
	.byte	0
	.uleb128 0x7
	.long	.LASF1302
	.byte	0x2
	.value	0x1bc
	.byte	0x10
	.long	0x77
	.uleb128 0x8
	.long	.LASF1304
	.byte	0xc
	.byte	0x2
	.value	0x211
	.byte	0x9
	.long	0x2cb
	.uleb128 0x9
	.long	.LASF1305
	.byte	0x2
	.value	0x213
	.byte	0xc
	.long	0x54
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x9
	.long	.LASF1306
	.byte	0x2
	.value	0x213
	.byte	0x14
	.long	0x54
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x9
	.long	.LASF1307
	.byte	0x2
	.value	0x214
	.byte	0xc
	.long	0x54
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x9
	.long	.LASF1308
	.byte	0x2
	.value	0x214
	.byte	0x16
	.long	0x54
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x9
	.long	.LASF1309
	.byte	0x2
	.value	0x215
	.byte	0xc
	.long	0x54
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x9
	.long	.LASF1310
	.byte	0x2
	.value	0x215
	.byte	0x19
	.long	0x54
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.long	.LASF1311
	.uleb128 0xa
	.long	.LASF1332
	.byte	0x1
	.uleb128 0xb
	.byte	0x8
	.long	0x2d2
	.uleb128 0xb
	.byte	0x8
	.long	0x83
	.uleb128 0xc
	.long	.LASF1333
	.byte	0x2
	.value	0x5c7
	.byte	0x11
	.long	0x2de
	.byte	0x1
	.byte	0x1
	.uleb128 0xd
	.byte	0x1
	.long	.LASF1312
	.byte	0x2
	.value	0x344
	.byte	0xc
	.byte	0x1
	.long	0x5b
	.byte	0x1
	.long	0x317
	.uleb128 0xe
	.long	0x2de
	.uleb128 0xe
	.long	0x24f
	.uleb128 0xe
	.long	0x69
	.byte	0
	.uleb128 0xd
	.byte	0x1
	.long	.LASF1313
	.byte	0x2
	.value	0x2f9
	.byte	0xc
	.byte	0x1
	.long	0x5b
	.byte	0x1
	.long	0x332
	.uleb128 0xe
	.long	0x332
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.byte	0x8
	.long	0x72
	.uleb128 0xd
	.byte	0x1
	.long	.LASF1314
	.byte	0x2
	.value	0x354
	.byte	0xc
	.byte	0x1
	.long	0x5b
	.byte	0x1
	.long	0x352
	.uleb128 0xe
	.long	0x2de
	.byte	0
	.uleb128 0xd
	.byte	0x1
	.long	.LASF1315
	.byte	0x2
	.value	0x2a0
	.byte	0xc
	.byte	0x1
	.long	0x5b
	.byte	0x1
	.long	0x376
	.uleb128 0xe
	.long	0x54
	.uleb128 0xe
	.long	0x54
	.uleb128 0xe
	.long	0x54
	.byte	0
	.uleb128 0x10
	.byte	0x1
	.long	.LASF1316
	.byte	0x2
	.value	0x322
	.byte	0xc
	.byte	0x1
	.long	0x5b
	.byte	0x1
	.uleb128 0x10
	.byte	0x1
	.long	.LASF1317
	.byte	0x2
	.value	0x3b5
	.byte	0xc
	.byte	0x1
	.long	0x5b
	.byte	0x1
	.uleb128 0xd
	.byte	0x1
	.long	.LASF1318
	.byte	0x2
	.value	0x30b
	.byte	0xc
	.byte	0x1
	.long	0x5b
	.byte	0x1
	.long	0x3b5
	.uleb128 0xe
	.long	0x2de
	.uleb128 0xe
	.long	0x2cb
	.byte	0
	.uleb128 0xd
	.byte	0x1
	.long	.LASF1319
	.byte	0x2
	.value	0x2ec
	.byte	0xc
	.byte	0x1
	.long	0x5b
	.byte	0x1
	.long	0x3d4
	.uleb128 0xe
	.long	0x2de
	.uleb128 0xe
	.long	0x2cb
	.byte	0
	.uleb128 0x10
	.byte	0x1
	.long	.LASF1320
	.byte	0x2
	.value	0x2ed
	.byte	0xc
	.byte	0x1
	.long	0x5b
	.byte	0x1
	.uleb128 0x10
	.byte	0x1
	.long	.LASF1321
	.byte	0x2
	.value	0x271
	.byte	0xc
	.byte	0x1
	.long	0x5b
	.byte	0x1
	.uleb128 0x10
	.byte	0x1
	.long	.LASF1322
	.byte	0x2
	.value	0x29e
	.byte	0x11
	.byte	0x1
	.long	0x2de
	.byte	0x1
	.uleb128 0x11
	.byte	0x1
	.long	.LASF1334
	.byte	0x1
	.byte	0x1f
	.byte	0x6
	.byte	0x1
	.quad	.LFB2
	.quad	.LFE2
	.long	.LLST2
	.byte	0x1
	.long	0x4b1
	.uleb128 0x12
	.long	.LASF1323
	.byte	0x1
	.byte	0x1f
	.byte	0x18
	.long	0x4b1
	.byte	0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x12
	.long	.LASF1324
	.byte	0x1
	.byte	0x1f
	.byte	0x25
	.long	0x4b7
	.byte	0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x13
	.long	.LASF1325
	.byte	0x1
	.byte	0x21
	.byte	0x9
	.long	0x5b
	.byte	0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x13
	.long	.LASF1326
	.byte	0x1
	.byte	0x22
	.byte	0x9
	.long	0x5b
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x13
	.long	.LASF1327
	.byte	0x1
	.byte	0x24
	.byte	0xb
	.long	0x4b7
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x14
	.quad	.LBB2
	.quad	.LBE2
	.uleb128 0x15
	.string	"i"
	.byte	0x1
	.byte	0x28
	.byte	0xe
	.long	0x5b
	.byte	0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x14
	.quad	.LBB3
	.quad	.LBE3
	.uleb128 0x15
	.string	"j"
	.byte	0x1
	.byte	0x2e
	.byte	0x12
	.long	0x5b
	.byte	0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xb
	.byte	0x8
	.long	0x4b7
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.long	.LASF1328
	.uleb128 0x16
	.byte	0x1
	.long	.LASF1335
	.byte	0x1
	.byte	0x13
	.byte	0x5
	.byte	0x1
	.long	0x5b
	.quad	.LFB1
	.quad	.LFE1
	.long	.LLST1
	.byte	0x1
	.long	0x4f4
	.uleb128 0x15
	.string	"ch"
	.byte	0x1
	.byte	0x15
	.byte	0x9
	.long	0x5b
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x17
	.byte	0x1
	.long	.LASF1336
	.byte	0x1
	.byte	0x4
	.byte	0x6
	.byte	0x1
	.quad	.LFB0
	.quad	.LFE0
	.long	.LLST0
	.byte	0x1
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
	.uleb128 0x3
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
	.uleb128 0x4
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
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
	.uleb128 0x7
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
	.uleb128 0x5
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
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
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
	.uleb128 0xd
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
	.uleb128 0xe
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x14
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x15
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
	.uleb128 0x17
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
	.file 3 "/usr/include/stdc-predef.h"
	.byte	0x3
	.uleb128 0
	.uleb128 0x3
	.byte	0x7
	.long	.Ldebug_macro2
	.byte	0x4
	.byte	0x3
	.uleb128 0x1
	.uleb128 0x2
	.byte	0x7
	.long	.Ldebug_macro3
	.file 4 "/usr/include/ncurses_dll.h"
	.byte	0x3
	.uleb128 0x59
	.uleb128 0x4
	.byte	0x7
	.long	.Ldebug_macro4
	.byte	0x4
	.file 5 "/usr/lib/gcc/x86_64-linux-gnu/11/include/stdint.h"
	.byte	0x3
	.uleb128 0x5f
	.uleb128 0x5
	.file 6 "/usr/include/stdint.h"
	.byte	0x3
	.uleb128 0x9
	.uleb128 0x6
	.byte	0x7
	.long	.Ldebug_macro5
	.file 7 "/usr/include/x86_64-linux-gnu/bits/libc-header-start.h"
	.byte	0x3
	.uleb128 0x1a
	.uleb128 0x7
	.byte	0x6
	.uleb128 0x1f
	.long	.LASF387
	.file 8 "/usr/include/features.h"
	.byte	0x3
	.uleb128 0x21
	.uleb128 0x8
	.byte	0x7
	.long	.Ldebug_macro6
	.file 9 "/usr/include/features-time64.h"
	.byte	0x3
	.uleb128 0x188
	.uleb128 0x9
	.file 10 "/usr/include/x86_64-linux-gnu/bits/wordsize.h"
	.byte	0x3
	.uleb128 0x14
	.uleb128 0xa
	.byte	0x7
	.long	.Ldebug_macro7
	.byte	0x4
	.file 11 "/usr/include/x86_64-linux-gnu/bits/timesize.h"
	.byte	0x3
	.uleb128 0x15
	.uleb128 0xb
	.byte	0x3
	.uleb128 0x13
	.uleb128 0xa
	.byte	0x7
	.long	.Ldebug_macro7
	.byte	0x4
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF442
	.byte	0x4
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro8
	.file 12 "/usr/include/x86_64-linux-gnu/sys/cdefs.h"
	.byte	0x3
	.uleb128 0x1e6
	.uleb128 0xc
	.byte	0x7
	.long	.Ldebug_macro9
	.byte	0x3
	.uleb128 0x22f
	.uleb128 0xa
	.byte	0x7
	.long	.Ldebug_macro7
	.byte	0x4
	.file 13 "/usr/include/x86_64-linux-gnu/bits/long-double.h"
	.byte	0x3
	.uleb128 0x230
	.uleb128 0xd
	.byte	0x5
	.uleb128 0x15
	.long	.LASF521
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro10
	.byte	0x4
	.file 14 "/usr/include/x86_64-linux-gnu/gnu/stubs.h"
	.byte	0x3
	.uleb128 0x1fe
	.uleb128 0xe
	.file 15 "/usr/include/x86_64-linux-gnu/gnu/stubs-64.h"
	.byte	0x3
	.uleb128 0xa
	.uleb128 0xf
	.byte	0x7
	.long	.Ldebug_macro11
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro12
	.byte	0x4
	.file 16 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.byte	0x3
	.uleb128 0x1b
	.uleb128 0x10
	.byte	0x5
	.uleb128 0x18
	.long	.LASF561
	.byte	0x3
	.uleb128 0x1b
	.uleb128 0xa
	.byte	0x7
	.long	.Ldebug_macro7
	.byte	0x4
	.byte	0x3
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0x3
	.uleb128 0x13
	.uleb128 0xa
	.byte	0x7
	.long	.Ldebug_macro7
	.byte	0x4
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF442
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro13
	.file 17 "/usr/include/x86_64-linux-gnu/bits/typesizes.h"
	.byte	0x3
	.uleb128 0x8d
	.uleb128 0x11
	.byte	0x7
	.long	.Ldebug_macro14
	.byte	0x4
	.file 18 "/usr/include/x86_64-linux-gnu/bits/time64.h"
	.byte	0x3
	.uleb128 0x8e
	.uleb128 0x12
	.byte	0x7
	.long	.Ldebug_macro15
	.byte	0x4
	.byte	0x6
	.uleb128 0xe2
	.long	.LASF621
	.byte	0x4
	.file 19 "/usr/include/x86_64-linux-gnu/bits/wchar.h"
	.byte	0x3
	.uleb128 0x1c
	.uleb128 0x13
	.byte	0x7
	.long	.Ldebug_macro16
	.byte	0x4
	.byte	0x3
	.uleb128 0x1d
	.uleb128 0xa
	.byte	0x7
	.long	.Ldebug_macro7
	.byte	0x4
	.file 20 "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h"
	.byte	0x3
	.uleb128 0x22
	.uleb128 0x14
	.byte	0x5
	.uleb128 0x14
	.long	.LASF625
	.byte	0x4
	.file 21 "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h"
	.byte	0x3
	.uleb128 0x25
	.uleb128 0x15
	.byte	0x5
	.uleb128 0x14
	.long	.LASF626
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro17
	.byte	0x4
	.byte	0x5
	.uleb128 0xd
	.long	.LASF689
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro18
	.file 22 "/usr/include/stdio.h"
	.byte	0x3
	.uleb128 0xe8
	.uleb128 0x16
	.byte	0x7
	.long	.Ldebug_macro19
	.byte	0x3
	.uleb128 0x1b
	.uleb128 0x7
	.byte	0x7
	.long	.Ldebug_macro20
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro21
	.file 23 "/usr/lib/gcc/x86_64-linux-gnu/11/include/stddef.h"
	.byte	0x3
	.uleb128 0x21
	.uleb128 0x17
	.byte	0x7
	.long	.Ldebug_macro22
	.byte	0x4
	.byte	0x5
	.uleb128 0x23
	.long	.LASF743
	.file 24 "/usr/lib/gcc/x86_64-linux-gnu/11/include/stdarg.h"
	.byte	0x3
	.uleb128 0x24
	.uleb128 0x18
	.byte	0x7
	.long	.Ldebug_macro23
	.byte	0x4
	.file 25 "/usr/include/x86_64-linux-gnu/bits/types/__fpos_t.h"
	.byte	0x3
	.uleb128 0x27
	.uleb128 0x19
	.byte	0x5
	.uleb128 0x2
	.long	.LASF746
	.file 26 "/usr/include/x86_64-linux-gnu/bits/types/__mbstate_t.h"
	.byte	0x3
	.uleb128 0x5
	.uleb128 0x1a
	.byte	0x5
	.uleb128 0x2
	.long	.LASF747
	.byte	0x4
	.byte	0x4
	.file 27 "/usr/include/x86_64-linux-gnu/bits/types/__fpos64_t.h"
	.byte	0x3
	.uleb128 0x28
	.uleb128 0x1b
	.byte	0x5
	.uleb128 0x2
	.long	.LASF748
	.byte	0x4
	.file 28 "/usr/include/x86_64-linux-gnu/bits/types/__FILE.h"
	.byte	0x3
	.uleb128 0x29
	.uleb128 0x1c
	.byte	0x5
	.uleb128 0x2
	.long	.LASF749
	.byte	0x4
	.file 29 "/usr/include/x86_64-linux-gnu/bits/types/FILE.h"
	.byte	0x3
	.uleb128 0x2a
	.uleb128 0x1d
	.byte	0x5
	.uleb128 0x2
	.long	.LASF750
	.byte	0x4
	.file 30 "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h"
	.byte	0x3
	.uleb128 0x2b
	.uleb128 0x1e
	.byte	0x7
	.long	.Ldebug_macro24
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro25
	.file 31 "/usr/include/x86_64-linux-gnu/bits/stdio_lim.h"
	.byte	0x3
	.uleb128 0x85
	.uleb128 0x1f
	.byte	0x7
	.long	.Ldebug_macro26
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro27
	.file 32 "/usr/include/x86_64-linux-gnu/bits/floatn.h"
	.byte	0x3
	.uleb128 0x1ae
	.uleb128 0x20
	.byte	0x7
	.long	.Ldebug_macro28
	.file 33 "/usr/include/x86_64-linux-gnu/bits/floatn-common.h"
	.byte	0x3
	.uleb128 0x77
	.uleb128 0x21
	.byte	0x5
	.uleb128 0x15
	.long	.LASF790
	.byte	0x3
	.uleb128 0x18
	.uleb128 0xd
	.byte	0x5
	.uleb128 0x15
	.long	.LASF521
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro29
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.byte	0x5
	.uleb128 0xf5
	.long	.LASF812
	.byte	0x3
	.uleb128 0xf9
	.uleb128 0x18
	.byte	0x7
	.long	.Ldebug_macro30
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro31
	.file 34 "/usr/lib/gcc/x86_64-linux-gnu/11/include/stdbool.h"
	.byte	0x3
	.uleb128 0x11a
	.uleb128 0x22
	.byte	0x7
	.long	.Ldebug_macro32
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro33
	.file 35 "/usr/include/unctrl.h"
	.byte	0x3
	.uleb128 0x830
	.uleb128 0x23
	.byte	0x7
	.long	.Ldebug_macro34
	.byte	0x3
	.uleb128 0x37
	.uleb128 0x2
	.byte	0x4
	.byte	0x6
	.uleb128 0x39
	.long	.LASF1259
	.byte	0x4
	.byte	0x4
	.file 36 "/home/jscha/dvp/cpumon/src/../include/guilib.h"
	.byte	0x3
	.uleb128 0x2
	.uleb128 0x24
	.byte	0x7
	.long	.Ldebug_macro35
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
	.section	.debug_macro,"G",@progbits,wm4.curses.h.39.3b102e3630033b221c3e41b51ca3db05,comdat
.Ldebug_macro3:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x27
	.long	.LASF367
	.byte	0x5
	.uleb128 0x45
	.long	.LASF368
	.byte	0x5
	.uleb128 0x46
	.long	.LASF369
	.byte	0x5
	.uleb128 0x49
	.long	.LASF370
	.byte	0x5
	.uleb128 0x4a
	.long	.LASF371
	.byte	0x5
	.uleb128 0x4b
	.long	.LASF372
	.byte	0x6
	.uleb128 0x4e
	.long	.LASF373
	.byte	0x5
	.uleb128 0x4f
	.long	.LASF374
	.byte	0x5
	.uleb128 0x54
	.long	.LASF375
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.ncurses_dll.h.32.4f7d5f75878767130cff27603ec5ce98,comdat
.Ldebug_macro4:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x20
	.long	.LASF376
	.byte	0x5
	.uleb128 0x44
	.long	.LASF377
	.byte	0x5
	.uleb128 0x49
	.long	.LASF378
	.byte	0x5
	.uleb128 0x4c
	.long	.LASF379
	.byte	0x5
	.uleb128 0x4e
	.long	.LASF380
	.byte	0x5
	.uleb128 0x4f
	.long	.LASF381
	.byte	0x5
	.uleb128 0x5e
	.long	.LASF382
	.byte	0x5
	.uleb128 0x5f
	.long	.LASF383
	.byte	0x5
	.uleb128 0x60
	.long	.LASF384
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdint.h.23.022efde71688fcb285fe42cc87d41ee3,comdat
.Ldebug_macro5:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x17
	.long	.LASF385
	.byte	0x5
	.uleb128 0x19
	.long	.LASF386
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.features.h.19.94fa84bfdc4fa1f32c117154c6101507,comdat
.Ldebug_macro6:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x13
	.long	.LASF388
	.byte	0x6
	.uleb128 0x7e
	.long	.LASF389
	.byte	0x6
	.uleb128 0x7f
	.long	.LASF390
	.byte	0x6
	.uleb128 0x80
	.long	.LASF391
	.byte	0x6
	.uleb128 0x81
	.long	.LASF392
	.byte	0x6
	.uleb128 0x82
	.long	.LASF393
	.byte	0x6
	.uleb128 0x83
	.long	.LASF394
	.byte	0x6
	.uleb128 0x84
	.long	.LASF395
	.byte	0x6
	.uleb128 0x85
	.long	.LASF396
	.byte	0x6
	.uleb128 0x86
	.long	.LASF397
	.byte	0x6
	.uleb128 0x87
	.long	.LASF398
	.byte	0x6
	.uleb128 0x88
	.long	.LASF399
	.byte	0x6
	.uleb128 0x89
	.long	.LASF400
	.byte	0x6
	.uleb128 0x8a
	.long	.LASF401
	.byte	0x6
	.uleb128 0x8b
	.long	.LASF402
	.byte	0x6
	.uleb128 0x8c
	.long	.LASF403
	.byte	0x6
	.uleb128 0x8d
	.long	.LASF404
	.byte	0x6
	.uleb128 0x8e
	.long	.LASF405
	.byte	0x6
	.uleb128 0x8f
	.long	.LASF406
	.byte	0x6
	.uleb128 0x90
	.long	.LASF407
	.byte	0x6
	.uleb128 0x91
	.long	.LASF408
	.byte	0x6
	.uleb128 0x92
	.long	.LASF409
	.byte	0x6
	.uleb128 0x93
	.long	.LASF410
	.byte	0x6
	.uleb128 0x94
	.long	.LASF411
	.byte	0x6
	.uleb128 0x95
	.long	.LASF412
	.byte	0x6
	.uleb128 0x96
	.long	.LASF413
	.byte	0x6
	.uleb128 0x97
	.long	.LASF414
	.byte	0x6
	.uleb128 0x98
	.long	.LASF415
	.byte	0x5
	.uleb128 0x9d
	.long	.LASF416
	.byte	0x5
	.uleb128 0xa8
	.long	.LASF417
	.byte	0x5
	.uleb128 0xb6
	.long	.LASF418
	.byte	0x5
	.uleb128 0xba
	.long	.LASF419
	.byte	0x6
	.uleb128 0xeb
	.long	.LASF420
	.byte	0x5
	.uleb128 0xec
	.long	.LASF421
	.byte	0x5
	.uleb128 0xf4
	.long	.LASF422
	.byte	0x5
	.uleb128 0xfa
	.long	.LASF423
	.byte	0x5
	.uleb128 0x101
	.long	.LASF424
	.byte	0x5
	.uleb128 0x108
	.long	.LASF425
	.byte	0x5
	.uleb128 0x11d
	.long	.LASF426
	.byte	0x6
	.uleb128 0x11f
	.long	.LASF427
	.byte	0x5
	.uleb128 0x120
	.long	.LASF428
	.byte	0x6
	.uleb128 0x121
	.long	.LASF429
	.byte	0x5
	.uleb128 0x122
	.long	.LASF430
	.byte	0x5
	.uleb128 0x145
	.long	.LASF431
	.byte	0x5
	.uleb128 0x149
	.long	.LASF432
	.byte	0x5
	.uleb128 0x14d
	.long	.LASF433
	.byte	0x5
	.uleb128 0x151
	.long	.LASF434
	.byte	0x5
	.uleb128 0x155
	.long	.LASF435
	.byte	0x6
	.uleb128 0x156
	.long	.LASF391
	.byte	0x5
	.uleb128 0x157
	.long	.LASF425
	.byte	0x6
	.uleb128 0x158
	.long	.LASF390
	.byte	0x5
	.uleb128 0x159
	.long	.LASF424
	.byte	0x5
	.uleb128 0x15d
	.long	.LASF436
	.byte	0x6
	.uleb128 0x15e
	.long	.LASF437
	.byte	0x5
	.uleb128 0x15f
	.long	.LASF438
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.wordsize.h.4.baf119258a1e53d8dba67ceac44ab6bc,comdat
.Ldebug_macro7:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x4
	.long	.LASF439
	.byte	0x5
	.uleb128 0xc
	.long	.LASF440
	.byte	0x5
	.uleb128 0xe
	.long	.LASF441
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.features.h.395.e2af5c05e8a4fd5a2d004043e21657e0,comdat
.Ldebug_macro8:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x18b
	.long	.LASF443
	.byte	0x5
	.uleb128 0x18f
	.long	.LASF444
	.byte	0x5
	.uleb128 0x1ac
	.long	.LASF445
	.byte	0x5
	.uleb128 0x1b4
	.long	.LASF446
	.byte	0x5
	.uleb128 0x1cb
	.long	.LASF447
	.byte	0x6
	.uleb128 0x1d8
	.long	.LASF448
	.byte	0x5
	.uleb128 0x1d9
	.long	.LASF449
	.byte	0x5
	.uleb128 0x1dd
	.long	.LASF450
	.byte	0x5
	.uleb128 0x1de
	.long	.LASF451
	.byte	0x5
	.uleb128 0x1e0
	.long	.LASF452
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.cdefs.h.20.49c9437adba4cb37cdb1b4e91d72989f,comdat
.Ldebug_macro9:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.long	.LASF453
	.byte	0x2
	.uleb128 0x23
	.string	"__P"
	.byte	0x6
	.uleb128 0x24
	.long	.LASF454
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF455
	.byte	0x5
	.uleb128 0x32
	.long	.LASF456
	.byte	0x5
	.uleb128 0x39
	.long	.LASF457
	.byte	0x5
	.uleb128 0x41
	.long	.LASF458
	.byte	0x5
	.uleb128 0x42
	.long	.LASF459
	.byte	0x5
	.uleb128 0x4f
	.long	.LASF460
	.byte	0x5
	.uleb128 0x50
	.long	.LASF461
	.byte	0x5
	.uleb128 0x51
	.long	.LASF462
	.byte	0x5
	.uleb128 0x52
	.long	.LASF463
	.byte	0x5
	.uleb128 0x76
	.long	.LASF464
	.byte	0x5
	.uleb128 0x77
	.long	.LASF465
	.byte	0x5
	.uleb128 0x7c
	.long	.LASF466
	.byte	0x5
	.uleb128 0x7d
	.long	.LASF467
	.byte	0x5
	.uleb128 0x80
	.long	.LASF468
	.byte	0x5
	.uleb128 0x88
	.long	.LASF469
	.byte	0x5
	.uleb128 0x89
	.long	.LASF470
	.byte	0x5
	.uleb128 0x8e
	.long	.LASF471
	.byte	0x5
	.uleb128 0x8f
	.long	.LASF472
	.byte	0x5
	.uleb128 0x97
	.long	.LASF473
	.byte	0x5
	.uleb128 0x98
	.long	.LASF474
	.byte	0x5
	.uleb128 0x9f
	.long	.LASF475
	.byte	0x5
	.uleb128 0xa0
	.long	.LASF476
	.byte	0x5
	.uleb128 0xa7
	.long	.LASF477
	.byte	0x5
	.uleb128 0xb0
	.long	.LASF478
	.byte	0x5
	.uleb128 0xb9
	.long	.LASF479
	.byte	0x5
	.uleb128 0xc3
	.long	.LASF480
	.byte	0x5
	.uleb128 0xcb
	.long	.LASF481
	.byte	0x5
	.uleb128 0xcc
	.long	.LASF482
	.byte	0x5
	.uleb128 0xd8
	.long	.LASF483
	.byte	0x5
	.uleb128 0xd9
	.long	.LASF484
	.byte	0x5
	.uleb128 0xf7
	.long	.LASF485
	.byte	0x5
	.uleb128 0xfe
	.long	.LASF486
	.byte	0x5
	.uleb128 0x100
	.long	.LASF487
	.byte	0x5
	.uleb128 0x103
	.long	.LASF488
	.byte	0x5
	.uleb128 0x104
	.long	.LASF489
	.byte	0x5
	.uleb128 0x119
	.long	.LASF490
	.byte	0x5
	.uleb128 0x121
	.long	.LASF491
	.byte	0x5
	.uleb128 0x12a
	.long	.LASF492
	.byte	0x5
	.uleb128 0x134
	.long	.LASF493
	.byte	0x5
	.uleb128 0x13b
	.long	.LASF494
	.byte	0x5
	.uleb128 0x141
	.long	.LASF495
	.byte	0x5
	.uleb128 0x14a
	.long	.LASF496
	.byte	0x5
	.uleb128 0x14b
	.long	.LASF497
	.byte	0x5
	.uleb128 0x153
	.long	.LASF498
	.byte	0x5
	.uleb128 0x15d
	.long	.LASF499
	.byte	0x5
	.uleb128 0x16a
	.long	.LASF500
	.byte	0x5
	.uleb128 0x174
	.long	.LASF501
	.byte	0x5
	.uleb128 0x180
	.long	.LASF502
	.byte	0x5
	.uleb128 0x186
	.long	.LASF503
	.byte	0x5
	.uleb128 0x18d
	.long	.LASF504
	.byte	0x5
	.uleb128 0x196
	.long	.LASF505
	.byte	0x5
	.uleb128 0x19f
	.long	.LASF506
	.byte	0x6
	.uleb128 0x1a7
	.long	.LASF507
	.byte	0x5
	.uleb128 0x1a8
	.long	.LASF508
	.byte	0x5
	.uleb128 0x1b1
	.long	.LASF509
	.byte	0x5
	.uleb128 0x1c3
	.long	.LASF510
	.byte	0x5
	.uleb128 0x1c4
	.long	.LASF511
	.byte	0x5
	.uleb128 0x1cd
	.long	.LASF512
	.byte	0x5
	.uleb128 0x1d3
	.long	.LASF513
	.byte	0x5
	.uleb128 0x1d4
	.long	.LASF514
	.byte	0x5
	.uleb128 0x1ef
	.long	.LASF515
	.byte	0x5
	.uleb128 0x1fe
	.long	.LASF516
	.byte	0x5
	.uleb128 0x1ff
	.long	.LASF517
	.byte	0x5
	.uleb128 0x214
	.long	.LASF518
	.byte	0x6
	.uleb128 0x21a
	.long	.LASF519
	.byte	0x5
	.uleb128 0x21e
	.long	.LASF520
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.cdefs.h.616.8d7ca1b9d01e52f5b2c040c19a111f7b,comdat
.Ldebug_macro10:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x268
	.long	.LASF522
	.byte	0x5
	.uleb128 0x269
	.long	.LASF523
	.byte	0x5
	.uleb128 0x26a
	.long	.LASF524
	.byte	0x5
	.uleb128 0x26b
	.long	.LASF525
	.byte	0x5
	.uleb128 0x26c
	.long	.LASF526
	.byte	0x5
	.uleb128 0x26d
	.long	.LASF527
	.byte	0x5
	.uleb128 0x26f
	.long	.LASF528
	.byte	0x5
	.uleb128 0x270
	.long	.LASF529
	.byte	0x5
	.uleb128 0x27b
	.long	.LASF530
	.byte	0x5
	.uleb128 0x27c
	.long	.LASF531
	.byte	0x5
	.uleb128 0x28e
	.long	.LASF532
	.byte	0x5
	.uleb128 0x299
	.long	.LASF533
	.byte	0x5
	.uleb128 0x2a1
	.long	.LASF534
	.byte	0x5
	.uleb128 0x2a4
	.long	.LASF535
	.byte	0x5
	.uleb128 0x2b1
	.long	.LASF536
	.byte	0x5
	.uleb128 0x2b3
	.long	.LASF537
	.byte	0x5
	.uleb128 0x2bc
	.long	.LASF538
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stubs64.h.10.7865f4f7062bab1c535c1f73f43aa9b9,comdat
.Ldebug_macro11:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xa
	.long	.LASF539
	.byte	0x5
	.uleb128 0xb
	.long	.LASF540
	.byte	0x5
	.uleb128 0xc
	.long	.LASF541
	.byte	0x5
	.uleb128 0xd
	.long	.LASF542
	.byte	0x5
	.uleb128 0xe
	.long	.LASF543
	.byte	0x5
	.uleb128 0xf
	.long	.LASF544
	.byte	0x5
	.uleb128 0x10
	.long	.LASF545
	.byte	0x5
	.uleb128 0x11
	.long	.LASF546
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.libcheaderstart.h.37.e7d4b6f4649b40d3e0dce357ae78234f,comdat
.Ldebug_macro12:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x25
	.long	.LASF547
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF548
	.byte	0x6
	.uleb128 0x43
	.long	.LASF549
	.byte	0x5
	.uleb128 0x47
	.long	.LASF550
	.byte	0x6
	.uleb128 0x49
	.long	.LASF551
	.byte	0x5
	.uleb128 0x4d
	.long	.LASF552
	.byte	0x6
	.uleb128 0x4f
	.long	.LASF553
	.byte	0x5
	.uleb128 0x53
	.long	.LASF554
	.byte	0x6
	.uleb128 0x5a
	.long	.LASF555
	.byte	0x5
	.uleb128 0x5e
	.long	.LASF556
	.byte	0x6
	.uleb128 0x60
	.long	.LASF557
	.byte	0x5
	.uleb128 0x64
	.long	.LASF558
	.byte	0x6
	.uleb128 0x69
	.long	.LASF559
	.byte	0x5
	.uleb128 0x6d
	.long	.LASF560
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.types.h.109.56eb9ae966b255288cc544f18746a7ff,comdat
.Ldebug_macro13:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x6d
	.long	.LASF562
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF563
	.byte	0x5
	.uleb128 0x6f
	.long	.LASF564
	.byte	0x5
	.uleb128 0x70
	.long	.LASF565
	.byte	0x5
	.uleb128 0x71
	.long	.LASF566
	.byte	0x5
	.uleb128 0x72
	.long	.LASF567
	.byte	0x5
	.uleb128 0x80
	.long	.LASF568
	.byte	0x5
	.uleb128 0x81
	.long	.LASF569
	.byte	0x5
	.uleb128 0x82
	.long	.LASF570
	.byte	0x5
	.uleb128 0x83
	.long	.LASF571
	.byte	0x5
	.uleb128 0x84
	.long	.LASF572
	.byte	0x5
	.uleb128 0x85
	.long	.LASF573
	.byte	0x5
	.uleb128 0x86
	.long	.LASF574
	.byte	0x5
	.uleb128 0x87
	.long	.LASF575
	.byte	0x5
	.uleb128 0x89
	.long	.LASF576
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.typesizes.h.24.ccf5919b8e01b553263cf8f4ab1d5fde,comdat
.Ldebug_macro14:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x18
	.long	.LASF577
	.byte	0x5
	.uleb128 0x22
	.long	.LASF578
	.byte	0x5
	.uleb128 0x23
	.long	.LASF579
	.byte	0x5
	.uleb128 0x26
	.long	.LASF580
	.byte	0x5
	.uleb128 0x27
	.long	.LASF581
	.byte	0x5
	.uleb128 0x28
	.long	.LASF582
	.byte	0x5
	.uleb128 0x29
	.long	.LASF583
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF584
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF585
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF586
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF587
	.byte	0x5
	.uleb128 0x33
	.long	.LASF588
	.byte	0x5
	.uleb128 0x34
	.long	.LASF589
	.byte	0x5
	.uleb128 0x35
	.long	.LASF590
	.byte	0x5
	.uleb128 0x36
	.long	.LASF591
	.byte	0x5
	.uleb128 0x37
	.long	.LASF592
	.byte	0x5
	.uleb128 0x38
	.long	.LASF593
	.byte	0x5
	.uleb128 0x39
	.long	.LASF594
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF595
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF596
	.byte	0x5
	.uleb128 0x3c
	.long	.LASF597
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF598
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF599
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF600
	.byte	0x5
	.uleb128 0x40
	.long	.LASF601
	.byte	0x5
	.uleb128 0x41
	.long	.LASF602
	.byte	0x5
	.uleb128 0x42
	.long	.LASF603
	.byte	0x5
	.uleb128 0x43
	.long	.LASF604
	.byte	0x5
	.uleb128 0x44
	.long	.LASF605
	.byte	0x5
	.uleb128 0x45
	.long	.LASF606
	.byte	0x5
	.uleb128 0x46
	.long	.LASF607
	.byte	0x5
	.uleb128 0x47
	.long	.LASF608
	.byte	0x5
	.uleb128 0x48
	.long	.LASF609
	.byte	0x5
	.uleb128 0x49
	.long	.LASF610
	.byte	0x5
	.uleb128 0x4a
	.long	.LASF611
	.byte	0x5
	.uleb128 0x4b
	.long	.LASF612
	.byte	0x5
	.uleb128 0x51
	.long	.LASF613
	.byte	0x5
	.uleb128 0x54
	.long	.LASF614
	.byte	0x5
	.uleb128 0x57
	.long	.LASF615
	.byte	0x5
	.uleb128 0x5a
	.long	.LASF616
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF617
	.byte	0x5
	.uleb128 0x67
	.long	.LASF618
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.time64.h.24.a8166ae916ec910dab0d8987098d42ee,comdat
.Ldebug_macro15:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x18
	.long	.LASF619
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF620
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.wchar.h.20.510818a05484290d697a517509bf4b2d,comdat
.Ldebug_macro16:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.long	.LASF622
	.byte	0x5
	.uleb128 0x22
	.long	.LASF623
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF624
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdint.h.88.7e8071bbba3b822ff5b29420f80324ec,comdat
.Ldebug_macro17:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x58
	.long	.LASF627
	.byte	0x5
	.uleb128 0x6a
	.long	.LASF122
	.byte	0x5
	.uleb128 0x6b
	.long	.LASF131
	.byte	0x5
	.uleb128 0x74
	.long	.LASF628
	.byte	0x5
	.uleb128 0x75
	.long	.LASF629
	.byte	0x5
	.uleb128 0x76
	.long	.LASF630
	.byte	0x5
	.uleb128 0x77
	.long	.LASF631
	.byte	0x5
	.uleb128 0x79
	.long	.LASF632
	.byte	0x5
	.uleb128 0x7a
	.long	.LASF633
	.byte	0x5
	.uleb128 0x7b
	.long	.LASF634
	.byte	0x5
	.uleb128 0x7c
	.long	.LASF635
	.byte	0x5
	.uleb128 0x7f
	.long	.LASF636
	.byte	0x5
	.uleb128 0x80
	.long	.LASF637
	.byte	0x5
	.uleb128 0x81
	.long	.LASF638
	.byte	0x5
	.uleb128 0x82
	.long	.LASF639
	.byte	0x5
	.uleb128 0x86
	.long	.LASF640
	.byte	0x5
	.uleb128 0x87
	.long	.LASF641
	.byte	0x5
	.uleb128 0x88
	.long	.LASF642
	.byte	0x5
	.uleb128 0x89
	.long	.LASF643
	.byte	0x5
	.uleb128 0x8b
	.long	.LASF644
	.byte	0x5
	.uleb128 0x8c
	.long	.LASF645
	.byte	0x5
	.uleb128 0x8d
	.long	.LASF646
	.byte	0x5
	.uleb128 0x8e
	.long	.LASF647
	.byte	0x5
	.uleb128 0x91
	.long	.LASF648
	.byte	0x5
	.uleb128 0x92
	.long	.LASF649
	.byte	0x5
	.uleb128 0x93
	.long	.LASF650
	.byte	0x5
	.uleb128 0x94
	.long	.LASF651
	.byte	0x5
	.uleb128 0x98
	.long	.LASF652
	.byte	0x5
	.uleb128 0x9a
	.long	.LASF653
	.byte	0x5
	.uleb128 0x9b
	.long	.LASF654
	.byte	0x5
	.uleb128 0xa0
	.long	.LASF655
	.byte	0x5
	.uleb128 0xa2
	.long	.LASF656
	.byte	0x5
	.uleb128 0xa4
	.long	.LASF657
	.byte	0x5
	.uleb128 0xa5
	.long	.LASF658
	.byte	0x5
	.uleb128 0xaa
	.long	.LASF659
	.byte	0x5
	.uleb128 0xad
	.long	.LASF660
	.byte	0x5
	.uleb128 0xaf
	.long	.LASF661
	.byte	0x5
	.uleb128 0xb0
	.long	.LASF662
	.byte	0x5
	.uleb128 0xb5
	.long	.LASF663
	.byte	0x5
	.uleb128 0xba
	.long	.LASF664
	.byte	0x5
	.uleb128 0xbb
	.long	.LASF665
	.byte	0x5
	.uleb128 0xbc
	.long	.LASF666
	.byte	0x5
	.uleb128 0xc5
	.long	.LASF667
	.byte	0x5
	.uleb128 0xc7
	.long	.LASF668
	.byte	0x5
	.uleb128 0xca
	.long	.LASF669
	.byte	0x5
	.uleb128 0xd1
	.long	.LASF670
	.byte	0x5
	.uleb128 0xd2
	.long	.LASF671
	.byte	0x5
	.uleb128 0xde
	.long	.LASF672
	.byte	0x5
	.uleb128 0xdf
	.long	.LASF673
	.byte	0x5
	.uleb128 0xe3
	.long	.LASF674
	.byte	0x5
	.uleb128 0xef
	.long	.LASF675
	.byte	0x5
	.uleb128 0xf0
	.long	.LASF676
	.byte	0x5
	.uleb128 0xf4
	.long	.LASF677
	.byte	0x5
	.uleb128 0xf5
	.long	.LASF678
	.byte	0x5
	.uleb128 0xf8
	.long	.LASF679
	.byte	0x5
	.uleb128 0xf9
	.long	.LASF680
	.byte	0x5
	.uleb128 0xfa
	.long	.LASF681
	.byte	0x5
	.uleb128 0xfc
	.long	.LASF682
	.byte	0x5
	.uleb128 0x102
	.long	.LASF683
	.byte	0x5
	.uleb128 0x103
	.long	.LASF684
	.byte	0x5
	.uleb128 0x104
	.long	.LASF685
	.byte	0x5
	.uleb128 0x106
	.long	.LASF686
	.byte	0x5
	.uleb128 0x10d
	.long	.LASF687
	.byte	0x5
	.uleb128 0x10e
	.long	.LASF688
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.curses.h.111.1816aa94fd8346c6fc08d16a2856dafe,comdat
.Ldebug_macro18:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x6f
	.long	.LASF690
	.byte	0x5
	.uleb128 0x77
	.long	.LASF691
	.byte	0x6
	.uleb128 0x7e
	.long	.LASF692
	.byte	0x5
	.uleb128 0x7f
	.long	.LASF693
	.byte	0x6
	.uleb128 0x81
	.long	.LASF694
	.byte	0x5
	.uleb128 0x82
	.long	.LASF695
	.byte	0x6
	.uleb128 0x8d
	.long	.LASF696
	.byte	0x5
	.uleb128 0x8e
	.long	.LASF697
	.byte	0x6
	.uleb128 0x90
	.long	.LASF698
	.byte	0x5
	.uleb128 0x91
	.long	.LASF699
	.byte	0x5
	.uleb128 0x97
	.long	.LASF700
	.byte	0x5
	.uleb128 0x98
	.long	.LASF701
	.byte	0x5
	.uleb128 0x99
	.long	.LASF702
	.byte	0x5
	.uleb128 0x9a
	.long	.LASF703
	.byte	0x5
	.uleb128 0xa3
	.long	.LASF704
	.byte	0x5
	.uleb128 0xaa
	.long	.LASF705
	.byte	0x6
	.uleb128 0xb0
	.long	.LASF706
	.byte	0x6
	.uleb128 0xb8
	.long	.LASF707
	.byte	0x5
	.uleb128 0xb9
	.long	.LASF708
	.byte	0x6
	.uleb128 0xbe
	.long	.LASF709
	.byte	0x5
	.uleb128 0xbf
	.long	.LASF710
	.byte	0x6
	.uleb128 0xc4
	.long	.LASF711
	.byte	0x5
	.uleb128 0xc5
	.long	.LASF712
	.byte	0x6
	.uleb128 0xcb
	.long	.LASF713
	.byte	0x5
	.uleb128 0xcc
	.long	.LASF714
	.byte	0x6
	.uleb128 0xd2
	.long	.LASF715
	.byte	0x5
	.uleb128 0xd3
	.long	.LASF716
	.byte	0x6
	.uleb128 0xda
	.long	.LASF717
	.byte	0x5
	.uleb128 0xdb
	.long	.LASF718
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdio.h.24.5c1b97eef3c86b7a2549420f69f4f128,comdat
.Ldebug_macro19:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x18
	.long	.LASF719
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF386
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.libcheaderstart.h.31.045646cfd09d1c615866e08d91c4f364,comdat
.Ldebug_macro20:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x1f
	.long	.LASF387
	.byte	0x6
	.uleb128 0x25
	.long	.LASF547
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF548
	.byte	0x6
	.uleb128 0x43
	.long	.LASF549
	.byte	0x5
	.uleb128 0x47
	.long	.LASF550
	.byte	0x6
	.uleb128 0x49
	.long	.LASF551
	.byte	0x5
	.uleb128 0x4d
	.long	.LASF552
	.byte	0x6
	.uleb128 0x4f
	.long	.LASF553
	.byte	0x5
	.uleb128 0x53
	.long	.LASF554
	.byte	0x6
	.uleb128 0x5a
	.long	.LASF555
	.byte	0x5
	.uleb128 0x5e
	.long	.LASF556
	.byte	0x6
	.uleb128 0x60
	.long	.LASF557
	.byte	0x5
	.uleb128 0x64
	.long	.LASF558
	.byte	0x6
	.uleb128 0x69
	.long	.LASF559
	.byte	0x5
	.uleb128 0x6d
	.long	.LASF560
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdio.h.31.e39a94e203ad4e1d978c0fc68ce016ee,comdat
.Ldebug_macro21:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF720
	.byte	0x5
	.uleb128 0x20
	.long	.LASF721
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stddef.h.181.c3f52a3b0f4c288bddb5dda1562858e2,comdat
.Ldebug_macro22:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xb5
	.long	.LASF722
	.byte	0x5
	.uleb128 0xb6
	.long	.LASF723
	.byte	0x5
	.uleb128 0xb7
	.long	.LASF724
	.byte	0x5
	.uleb128 0xb8
	.long	.LASF725
	.byte	0x5
	.uleb128 0xb9
	.long	.LASF726
	.byte	0x5
	.uleb128 0xba
	.long	.LASF727
	.byte	0x5
	.uleb128 0xbb
	.long	.LASF728
	.byte	0x5
	.uleb128 0xbc
	.long	.LASF729
	.byte	0x5
	.uleb128 0xbd
	.long	.LASF730
	.byte	0x5
	.uleb128 0xbe
	.long	.LASF731
	.byte	0x5
	.uleb128 0xbf
	.long	.LASF732
	.byte	0x5
	.uleb128 0xc0
	.long	.LASF733
	.byte	0x5
	.uleb128 0xc1
	.long	.LASF734
	.byte	0x5
	.uleb128 0xc2
	.long	.LASF735
	.byte	0x5
	.uleb128 0xc3
	.long	.LASF736
	.byte	0x5
	.uleb128 0xc4
	.long	.LASF737
	.byte	0x5
	.uleb128 0xcb
	.long	.LASF738
	.byte	0x6
	.uleb128 0xe7
	.long	.LASF739
	.byte	0x6
	.uleb128 0x186
	.long	.LASF740
	.byte	0x5
	.uleb128 0x18b
	.long	.LASF741
	.byte	0x6
	.uleb128 0x191
	.long	.LASF742
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdarg.h.34.3a23a216c0c293b3d2ea2e89281481e6,comdat
.Ldebug_macro23:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x22
	.long	.LASF744
	.byte	0x5
	.uleb128 0x27
	.long	.LASF745
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.struct_FILE.h.19.0888ac70396abe1031c03d393554032f,comdat
.Ldebug_macro24:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x13
	.long	.LASF751
	.byte	0x5
	.uleb128 0x66
	.long	.LASF752
	.byte	0x5
	.uleb128 0x6a
	.long	.LASF753
	.byte	0x5
	.uleb128 0x6f
	.long	.LASF754
	.byte	0x5
	.uleb128 0x70
	.long	.LASF755
	.byte	0x5
	.uleb128 0x72
	.long	.LASF756
	.byte	0x5
	.uleb128 0x73
	.long	.LASF757
	.byte	0x5
	.uleb128 0x75
	.long	.LASF758
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdio.h.53.78a7f18f3bc87ded52f05aa6f6a64310,comdat
.Ldebug_macro25:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x35
	.long	.LASF759
	.byte	0x5
	.uleb128 0x43
	.long	.LASF760
	.byte	0x5
	.uleb128 0x4e
	.long	.LASF761
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF762
	.byte	0x5
	.uleb128 0x5e
	.long	.LASF763
	.byte	0x5
	.uleb128 0x5f
	.long	.LASF764
	.byte	0x5
	.uleb128 0x63
	.long	.LASF765
	.byte	0x5
	.uleb128 0x68
	.long	.LASF766
	.byte	0x5
	.uleb128 0x6d
	.long	.LASF767
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF768
	.byte	0x5
	.uleb128 0x6f
	.long	.LASF769
	.byte	0x5
	.uleb128 0x78
	.long	.LASF770
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdio_lim.h.19.e4b00b560d878dcfbc6635b3406640c5,comdat
.Ldebug_macro26:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x13
	.long	.LASF771
	.byte	0x5
	.uleb128 0x19
	.long	.LASF772
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF773
	.byte	0x5
	.uleb128 0x1b
	.long	.LASF774
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF775
	.byte	0x6
	.uleb128 0x24
	.long	.LASF776
	.byte	0x5
	.uleb128 0x25
	.long	.LASF777
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdio.h.147.dbd603e98db8f3e1583090fab2abd54e,comdat
.Ldebug_macro27:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x93
	.long	.LASF778
	.byte	0x5
	.uleb128 0x94
	.long	.LASF779
	.byte	0x5
	.uleb128 0x95
	.long	.LASF780
	.byte	0x6
	.uleb128 0xb4
	.long	.LASF781
	.byte	0x5
	.uleb128 0xb5
	.long	.LASF782
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.floatn.h.20.a55feb25f1f7464b830caad4873a8713,comdat
.Ldebug_macro28:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x14
	.long	.LASF783
	.byte	0x5
	.uleb128 0x20
	.long	.LASF784
	.byte	0x5
	.uleb128 0x28
	.long	.LASF785
	.byte	0x5
	.uleb128 0x30
	.long	.LASF786
	.byte	0x5
	.uleb128 0x36
	.long	.LASF787
	.byte	0x5
	.uleb128 0x41
	.long	.LASF788
	.byte	0x5
	.uleb128 0x4d
	.long	.LASF789
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.floatncommon.h.34.7e1840d7dfb19e9bdb51aeb077d76637,comdat
.Ldebug_macro29:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x22
	.long	.LASF791
	.byte	0x5
	.uleb128 0x23
	.long	.LASF792
	.byte	0x5
	.uleb128 0x24
	.long	.LASF793
	.byte	0x5
	.uleb128 0x25
	.long	.LASF794
	.byte	0x5
	.uleb128 0x26
	.long	.LASF795
	.byte	0x5
	.uleb128 0x34
	.long	.LASF796
	.byte	0x5
	.uleb128 0x35
	.long	.LASF797
	.byte	0x5
	.uleb128 0x36
	.long	.LASF798
	.byte	0x5
	.uleb128 0x37
	.long	.LASF799
	.byte	0x5
	.uleb128 0x38
	.long	.LASF800
	.byte	0x5
	.uleb128 0x39
	.long	.LASF801
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF802
	.byte	0x5
	.uleb128 0x46
	.long	.LASF803
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF804
	.byte	0x5
	.uleb128 0x69
	.long	.LASF805
	.byte	0x5
	.uleb128 0x71
	.long	.LASF806
	.byte	0x5
	.uleb128 0x7d
	.long	.LASF807
	.byte	0x5
	.uleb128 0x97
	.long	.LASF808
	.byte	0x5
	.uleb128 0xa3
	.long	.LASF809
	.byte	0x5
	.uleb128 0xab
	.long	.LASF810
	.byte	0x5
	.uleb128 0xb7
	.long	.LASF811
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdarg.h.31.3fa7b8f6daaa31edd1696c08c77f2a73,comdat
.Ldebug_macro30:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF813
	.byte	0x5
	.uleb128 0x20
	.long	.LASF814
	.byte	0x6
	.uleb128 0x22
	.long	.LASF744
	.byte	0x5
	.uleb128 0x2f
	.long	.LASF815
	.byte	0x5
	.uleb128 0x30
	.long	.LASF816
	.byte	0x5
	.uleb128 0x31
	.long	.LASF817
	.byte	0x5
	.uleb128 0x34
	.long	.LASF818
	.byte	0x5
	.uleb128 0x36
	.long	.LASF819
	.byte	0x5
	.uleb128 0x69
	.long	.LASF820
	.byte	0x5
	.uleb128 0x6c
	.long	.LASF821
	.byte	0x5
	.uleb128 0x72
	.long	.LASF822
	.byte	0x5
	.uleb128 0x75
	.long	.LASF823
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.curses.h.266.a6aa4f23550a6272814a993111e6627b,comdat
.Ldebug_macro31:
	.value	0x4
	.byte	0
	.byte	0x6
	.uleb128 0x10a
	.long	.LASF824
	.byte	0x5
	.uleb128 0x10b
	.long	.LASF825
	.byte	0x6
	.uleb128 0x10d
	.long	.LASF826
	.byte	0x5
	.uleb128 0x10e
	.long	.LASF827
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.stdbool.h.29.4a1c88fe569adb8d03217dd16982ca34,comdat
.Ldebug_macro32:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF828
	.byte	0x5
	.uleb128 0x21
	.long	.LASF829
	.byte	0x5
	.uleb128 0x26
	.long	.LASF830
	.byte	0x5
	.uleb128 0x27
	.long	.LASF831
	.byte	0x5
	.uleb128 0x32
	.long	.LASF832
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.curses.h.284.b5c88a40caf804363b8dba931290ab8a,comdat
.Ldebug_macro33:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x11c
	.long	.LASF833
	.byte	0x5
	.uleb128 0x129
	.long	.LASF834
	.byte	0x5
	.uleb128 0x12c
	.long	.LASF835
	.byte	0x5
	.uleb128 0x132
	.long	.LASF836
	.byte	0x5
	.uleb128 0x133
	.long	.LASF837
	.byte	0x5
	.uleb128 0x134
	.long	.LASF838
	.byte	0x5
	.uleb128 0x135
	.long	.LASF839
	.byte	0x5
	.uleb128 0x136
	.long	.LASF840
	.byte	0x5
	.uleb128 0x137
	.long	.LASF841
	.byte	0x5
	.uleb128 0x138
	.long	.LASF842
	.byte	0x5
	.uleb128 0x139
	.long	.LASF843
	.byte	0x5
	.uleb128 0x13a
	.long	.LASF844
	.byte	0x5
	.uleb128 0x13b
	.long	.LASF845
	.byte	0x5
	.uleb128 0x13c
	.long	.LASF846
	.byte	0x5
	.uleb128 0x13d
	.long	.LASF847
	.byte	0x5
	.uleb128 0x13e
	.long	.LASF848
	.byte	0x5
	.uleb128 0x13f
	.long	.LASF849
	.byte	0x5
	.uleb128 0x140
	.long	.LASF850
	.byte	0x5
	.uleb128 0x141
	.long	.LASF851
	.byte	0x5
	.uleb128 0x142
	.long	.LASF852
	.byte	0x5
	.uleb128 0x145
	.long	.LASF853
	.byte	0x5
	.uleb128 0x149
	.long	.LASF854
	.byte	0x5
	.uleb128 0x14a
	.long	.LASF855
	.byte	0x5
	.uleb128 0x14b
	.long	.LASF856
	.byte	0x5
	.uleb128 0x14c
	.long	.LASF857
	.byte	0x5
	.uleb128 0x14d
	.long	.LASF858
	.byte	0x5
	.uleb128 0x14e
	.long	.LASF859
	.byte	0x5
	.uleb128 0x14f
	.long	.LASF860
	.byte	0x5
	.uleb128 0x150
	.long	.LASF861
	.byte	0x5
	.uleb128 0x15b
	.long	.LASF862
	.byte	0x5
	.uleb128 0x15e
	.long	.LASF863
	.byte	0x5
	.uleb128 0x15f
	.long	.LASF864
	.byte	0x5
	.uleb128 0x160
	.long	.LASF865
	.byte	0x5
	.uleb128 0x161
	.long	.LASF866
	.byte	0x5
	.uleb128 0x162
	.long	.LASF867
	.byte	0x5
	.uleb128 0x163
	.long	.LASF868
	.byte	0x5
	.uleb128 0x164
	.long	.LASF869
	.byte	0x5
	.uleb128 0x165
	.long	.LASF870
	.byte	0x5
	.uleb128 0x166
	.long	.LASF871
	.byte	0x5
	.uleb128 0x167
	.long	.LASF872
	.byte	0x5
	.uleb128 0x168
	.long	.LASF873
	.byte	0x5
	.uleb128 0x169
	.long	.LASF874
	.byte	0x5
	.uleb128 0x16a
	.long	.LASF875
	.byte	0x5
	.uleb128 0x16b
	.long	.LASF876
	.byte	0x5
	.uleb128 0x16c
	.long	.LASF877
	.byte	0x5
	.uleb128 0x16d
	.long	.LASF878
	.byte	0x5
	.uleb128 0x16e
	.long	.LASF879
	.byte	0x5
	.uleb128 0x16f
	.long	.LASF880
	.byte	0x5
	.uleb128 0x171
	.long	.LASF881
	.byte	0x5
	.uleb128 0x172
	.long	.LASF882
	.byte	0x5
	.uleb128 0x173
	.long	.LASF883
	.byte	0x5
	.uleb128 0x174
	.long	.LASF884
	.byte	0x5
	.uleb128 0x175
	.long	.LASF885
	.byte	0x5
	.uleb128 0x176
	.long	.LASF886
	.byte	0x5
	.uleb128 0x177
	.long	.LASF887
	.byte	0x5
	.uleb128 0x17d
	.long	.LASF888
	.byte	0x5
	.uleb128 0x17e
	.long	.LASF889
	.byte	0x5
	.uleb128 0x17f
	.long	.LASF890
	.byte	0x5
	.uleb128 0x180
	.long	.LASF891
	.byte	0x5
	.uleb128 0x181
	.long	.LASF892
	.byte	0x5
	.uleb128 0x182
	.long	.LASF893
	.byte	0x5
	.uleb128 0x183
	.long	.LASF894
	.byte	0x5
	.uleb128 0x18b
	.long	.LASF895
	.byte	0x5
	.uleb128 0x18c
	.long	.LASF896
	.byte	0x5
	.uleb128 0x18d
	.long	.LASF897
	.byte	0x5
	.uleb128 0x18e
	.long	.LASF898
	.byte	0x5
	.uleb128 0x18f
	.long	.LASF899
	.byte	0x5
	.uleb128 0x190
	.long	.LASF900
	.byte	0x5
	.uleb128 0x191
	.long	.LASF901
	.byte	0x5
	.uleb128 0x192
	.long	.LASF902
	.byte	0x5
	.uleb128 0x193
	.long	.LASF903
	.byte	0x5
	.uleb128 0x194
	.long	.LASF904
	.byte	0x5
	.uleb128 0x195
	.long	.LASF905
	.byte	0x2
	.uleb128 0x197
	.string	"ERR"
	.byte	0x5
	.uleb128 0x198
	.long	.LASF906
	.byte	0x2
	.uleb128 0x19a
	.string	"OK"
	.byte	0x5
	.uleb128 0x19b
	.long	.LASF907
	.byte	0x5
	.uleb128 0x19e
	.long	.LASF908
	.byte	0x5
	.uleb128 0x19f
	.long	.LASF909
	.byte	0x5
	.uleb128 0x1a0
	.long	.LASF910
	.byte	0x5
	.uleb128 0x1a1
	.long	.LASF911
	.byte	0x5
	.uleb128 0x1a2
	.long	.LASF912
	.byte	0x5
	.uleb128 0x1a3
	.long	.LASF913
	.byte	0x5
	.uleb128 0x1a4
	.long	.LASF914
	.byte	0x5
	.uleb128 0x1aa
	.long	.LASF915
	.byte	0x5
	.uleb128 0x1b0
	.long	.LASF916
	.byte	0x5
	.uleb128 0x234
	.long	.LASF917
	.byte	0x5
	.uleb128 0x23c
	.long	.LASF918
	.byte	0x5
	.uleb128 0x243
	.long	.LASF919
	.byte	0x5
	.uleb128 0x247
	.long	.LASF920
	.byte	0x6
	.uleb128 0x24a
	.long	.LASF921
	.byte	0x5
	.uleb128 0x24c
	.long	.LASF922
	.byte	0x5
	.uleb128 0x395
	.long	.LASF923
	.byte	0x6
	.uleb128 0x39c
	.long	.LASF924
	.byte	0x5
	.uleb128 0x39d
	.long	.LASF925
	.byte	0x6
	.uleb128 0x3da
	.long	.LASF926
	.byte	0x5
	.uleb128 0x3db
	.long	.LASF927
	.byte	0x5
	.uleb128 0x3dc
	.long	.LASF928
	.byte	0x5
	.uleb128 0x3df
	.long	.LASF929
	.byte	0x5
	.uleb128 0x44f
	.long	.LASF930
	.byte	0x5
	.uleb128 0x450
	.long	.LASF931
	.byte	0x5
	.uleb128 0x452
	.long	.LASF932
	.byte	0x5
	.uleb128 0x453
	.long	.LASF933
	.byte	0x5
	.uleb128 0x454
	.long	.LASF934
	.byte	0x5
	.uleb128 0x455
	.long	.LASF935
	.byte	0x5
	.uleb128 0x456
	.long	.LASF936
	.byte	0x5
	.uleb128 0x457
	.long	.LASF937
	.byte	0x5
	.uleb128 0x458
	.long	.LASF938
	.byte	0x5
	.uleb128 0x459
	.long	.LASF939
	.byte	0x5
	.uleb128 0x45a
	.long	.LASF940
	.byte	0x5
	.uleb128 0x45b
	.long	.LASF941
	.byte	0x5
	.uleb128 0x45c
	.long	.LASF942
	.byte	0x5
	.uleb128 0x45d
	.long	.LASF943
	.byte	0x5
	.uleb128 0x45e
	.long	.LASF944
	.byte	0x5
	.uleb128 0x45f
	.long	.LASF945
	.byte	0x5
	.uleb128 0x460
	.long	.LASF946
	.byte	0x5
	.uleb128 0x461
	.long	.LASF947
	.byte	0x5
	.uleb128 0x462
	.long	.LASF948
	.byte	0x5
	.uleb128 0x463
	.long	.LASF949
	.byte	0x5
	.uleb128 0x464
	.long	.LASF950
	.byte	0x5
	.uleb128 0x467
	.long	.LASF951
	.byte	0x5
	.uleb128 0x474
	.long	.LASF952
	.byte	0x5
	.uleb128 0x475
	.long	.LASF953
	.byte	0x5
	.uleb128 0x476
	.long	.LASF954
	.byte	0x5
	.uleb128 0x477
	.long	.LASF955
	.byte	0x5
	.uleb128 0x479
	.long	.LASF956
	.byte	0x5
	.uleb128 0x481
	.long	.LASF957
	.byte	0x5
	.uleb128 0x491
	.long	.LASF958
	.byte	0x5
	.uleb128 0x492
	.long	.LASF959
	.byte	0x5
	.uleb128 0x494
	.long	.LASF960
	.byte	0x5
	.uleb128 0x496
	.long	.LASF961
	.byte	0x5
	.uleb128 0x497
	.long	.LASF962
	.byte	0x5
	.uleb128 0x498
	.long	.LASF963
	.byte	0x5
	.uleb128 0x499
	.long	.LASF964
	.byte	0x5
	.uleb128 0x49a
	.long	.LASF965
	.byte	0x5
	.uleb128 0x49b
	.long	.LASF966
	.byte	0x5
	.uleb128 0x49f
	.long	.LASF967
	.byte	0x5
	.uleb128 0x4a0
	.long	.LASF968
	.byte	0x5
	.uleb128 0x4a1
	.long	.LASF969
	.byte	0x5
	.uleb128 0x4a2
	.long	.LASF970
	.byte	0x5
	.uleb128 0x4a3
	.long	.LASF971
	.byte	0x5
	.uleb128 0x4a4
	.long	.LASF972
	.byte	0x5
	.uleb128 0x4a5
	.long	.LASF973
	.byte	0x5
	.uleb128 0x4a6
	.long	.LASF974
	.byte	0x5
	.uleb128 0x4a7
	.long	.LASF975
	.byte	0x5
	.uleb128 0x4aa
	.long	.LASF976
	.byte	0x5
	.uleb128 0x4ab
	.long	.LASF977
	.byte	0x5
	.uleb128 0x4ad
	.long	.LASF978
	.byte	0x5
	.uleb128 0x4ae
	.long	.LASF979
	.byte	0x5
	.uleb128 0x4c3
	.long	.LASF980
	.byte	0x5
	.uleb128 0x4c5
	.long	.LASF981
	.byte	0x5
	.uleb128 0x4c6
	.long	.LASF982
	.byte	0x5
	.uleb128 0x4c7
	.long	.LASF983
	.byte	0x5
	.uleb128 0x4c9
	.long	.LASF984
	.byte	0x5
	.uleb128 0x4ca
	.long	.LASF985
	.byte	0x5
	.uleb128 0x4cb
	.long	.LASF986
	.byte	0x5
	.uleb128 0x4cc
	.long	.LASF987
	.byte	0x5
	.uleb128 0x4ce
	.long	.LASF988
	.byte	0x5
	.uleb128 0x4cf
	.long	.LASF989
	.byte	0x5
	.uleb128 0x4d0
	.long	.LASF990
	.byte	0x5
	.uleb128 0x4d3
	.long	.LASF991
	.byte	0x5
	.uleb128 0x4d6
	.long	.LASF992
	.byte	0x5
	.uleb128 0x4d7
	.long	.LASF993
	.byte	0x5
	.uleb128 0x4dc
	.long	.LASF994
	.byte	0x5
	.uleb128 0x4dd
	.long	.LASF995
	.byte	0x5
	.uleb128 0x4e3
	.long	.LASF996
	.byte	0x5
	.uleb128 0x4e4
	.long	.LASF997
	.byte	0x5
	.uleb128 0x4e5
	.long	.LASF998
	.byte	0x5
	.uleb128 0x4e6
	.long	.LASF999
	.byte	0x5
	.uleb128 0x4e7
	.long	.LASF1000
	.byte	0x5
	.uleb128 0x4e8
	.long	.LASF1001
	.byte	0x5
	.uleb128 0x4e9
	.long	.LASF1002
	.byte	0x5
	.uleb128 0x4ea
	.long	.LASF1003
	.byte	0x5
	.uleb128 0x4eb
	.long	.LASF1004
	.byte	0x5
	.uleb128 0x4ec
	.long	.LASF1005
	.byte	0x5
	.uleb128 0x4ed
	.long	.LASF1006
	.byte	0x5
	.uleb128 0x4ee
	.long	.LASF1007
	.byte	0x5
	.uleb128 0x4ef
	.long	.LASF1008
	.byte	0x5
	.uleb128 0x4f0
	.long	.LASF1009
	.byte	0x5
	.uleb128 0x4f1
	.long	.LASF1010
	.byte	0x5
	.uleb128 0x4f2
	.long	.LASF1011
	.byte	0x5
	.uleb128 0x4f3
	.long	.LASF1012
	.byte	0x5
	.uleb128 0x4f4
	.long	.LASF1013
	.byte	0x5
	.uleb128 0x4f5
	.long	.LASF1014
	.byte	0x5
	.uleb128 0x4f6
	.long	.LASF1015
	.byte	0x5
	.uleb128 0x4f7
	.long	.LASF1016
	.byte	0x5
	.uleb128 0x4f8
	.long	.LASF1017
	.byte	0x5
	.uleb128 0x4f9
	.long	.LASF1018
	.byte	0x5
	.uleb128 0x4fa
	.long	.LASF1019
	.byte	0x5
	.uleb128 0x4fb
	.long	.LASF1020
	.byte	0x5
	.uleb128 0x4fc
	.long	.LASF1021
	.byte	0x5
	.uleb128 0x4fd
	.long	.LASF1022
	.byte	0x5
	.uleb128 0x4fe
	.long	.LASF1023
	.byte	0x5
	.uleb128 0x4ff
	.long	.LASF1024
	.byte	0x5
	.uleb128 0x500
	.long	.LASF1025
	.byte	0x5
	.uleb128 0x501
	.long	.LASF1026
	.byte	0x5
	.uleb128 0x502
	.long	.LASF1027
	.byte	0x5
	.uleb128 0x503
	.long	.LASF1028
	.byte	0x5
	.uleb128 0x504
	.long	.LASF1029
	.byte	0x5
	.uleb128 0x505
	.long	.LASF1030
	.byte	0x5
	.uleb128 0x506
	.long	.LASF1031
	.byte	0x5
	.uleb128 0x507
	.long	.LASF1032
	.byte	0x5
	.uleb128 0x508
	.long	.LASF1033
	.byte	0x5
	.uleb128 0x509
	.long	.LASF1034
	.byte	0x5
	.uleb128 0x50a
	.long	.LASF1035
	.byte	0x5
	.uleb128 0x50b
	.long	.LASF1036
	.byte	0x5
	.uleb128 0x50c
	.long	.LASF1037
	.byte	0x5
	.uleb128 0x50d
	.long	.LASF1038
	.byte	0x5
	.uleb128 0x50e
	.long	.LASF1039
	.byte	0x5
	.uleb128 0x514
	.long	.LASF1040
	.byte	0x5
	.uleb128 0x515
	.long	.LASF1041
	.byte	0x5
	.uleb128 0x516
	.long	.LASF1042
	.byte	0x5
	.uleb128 0x517
	.long	.LASF1043
	.byte	0x5
	.uleb128 0x518
	.long	.LASF1044
	.byte	0x5
	.uleb128 0x519
	.long	.LASF1045
	.byte	0x5
	.uleb128 0x51a
	.long	.LASF1046
	.byte	0x5
	.uleb128 0x51b
	.long	.LASF1047
	.byte	0x5
	.uleb128 0x51c
	.long	.LASF1048
	.byte	0x5
	.uleb128 0x51d
	.long	.LASF1049
	.byte	0x5
	.uleb128 0x51e
	.long	.LASF1050
	.byte	0x5
	.uleb128 0x51f
	.long	.LASF1051
	.byte	0x5
	.uleb128 0x520
	.long	.LASF1052
	.byte	0x5
	.uleb128 0x521
	.long	.LASF1053
	.byte	0x5
	.uleb128 0x522
	.long	.LASF1054
	.byte	0x5
	.uleb128 0x523
	.long	.LASF1055
	.byte	0x5
	.uleb128 0x524
	.long	.LASF1056
	.byte	0x5
	.uleb128 0x525
	.long	.LASF1057
	.byte	0x5
	.uleb128 0x526
	.long	.LASF1058
	.byte	0x5
	.uleb128 0x527
	.long	.LASF1059
	.byte	0x5
	.uleb128 0x529
	.long	.LASF1060
	.byte	0x5
	.uleb128 0x52a
	.long	.LASF1061
	.byte	0x5
	.uleb128 0x52b
	.long	.LASF1062
	.byte	0x5
	.uleb128 0x52c
	.long	.LASF1063
	.byte	0x5
	.uleb128 0x52d
	.long	.LASF1064
	.byte	0x5
	.uleb128 0x52e
	.long	.LASF1065
	.byte	0x5
	.uleb128 0x52f
	.long	.LASF1066
	.byte	0x5
	.uleb128 0x530
	.long	.LASF1067
	.byte	0x5
	.uleb128 0x531
	.long	.LASF1068
	.byte	0x5
	.uleb128 0x532
	.long	.LASF1069
	.byte	0x5
	.uleb128 0x533
	.long	.LASF1070
	.byte	0x5
	.uleb128 0x534
	.long	.LASF1071
	.byte	0x5
	.uleb128 0x535
	.long	.LASF1072
	.byte	0x5
	.uleb128 0x536
	.long	.LASF1073
	.byte	0x5
	.uleb128 0x537
	.long	.LASF1074
	.byte	0x5
	.uleb128 0x538
	.long	.LASF1075
	.byte	0x5
	.uleb128 0x539
	.long	.LASF1076
	.byte	0x5
	.uleb128 0x53a
	.long	.LASF1077
	.byte	0x5
	.uleb128 0x53b
	.long	.LASF1078
	.byte	0x5
	.uleb128 0x53c
	.long	.LASF1079
	.byte	0x5
	.uleb128 0x542
	.long	.LASF1080
	.byte	0x5
	.uleb128 0x545
	.long	.LASF1081
	.byte	0x5
	.uleb128 0x546
	.long	.LASF1082
	.byte	0x5
	.uleb128 0x589
	.long	.LASF1083
	.byte	0x5
	.uleb128 0x58a
	.long	.LASF1084
	.byte	0x5
	.uleb128 0x58b
	.long	.LASF1085
	.byte	0x5
	.uleb128 0x58c
	.long	.LASF1086
	.byte	0x5
	.uleb128 0x58d
	.long	.LASF1087
	.byte	0x5
	.uleb128 0x58e
	.long	.LASF1088
	.byte	0x5
	.uleb128 0x58f
	.long	.LASF1089
	.byte	0x5
	.uleb128 0x590
	.long	.LASF1090
	.byte	0x5
	.uleb128 0x591
	.long	.LASF1091
	.byte	0x5
	.uleb128 0x592
	.long	.LASF1092
	.byte	0x5
	.uleb128 0x593
	.long	.LASF1093
	.byte	0x5
	.uleb128 0x594
	.long	.LASF1094
	.byte	0x5
	.uleb128 0x595
	.long	.LASF1095
	.byte	0x5
	.uleb128 0x596
	.long	.LASF1096
	.byte	0x5
	.uleb128 0x597
	.long	.LASF1097
	.byte	0x5
	.uleb128 0x59f
	.long	.LASF1098
	.byte	0x5
	.uleb128 0x5de
	.long	.LASF1099
	.byte	0x5
	.uleb128 0x5df
	.long	.LASF1100
	.byte	0x5
	.uleb128 0x5e0
	.long	.LASF1101
	.byte	0x5
	.uleb128 0x5e1
	.long	.LASF1102
	.byte	0x5
	.uleb128 0x5e2
	.long	.LASF1103
	.byte	0x5
	.uleb128 0x5e6
	.long	.LASF1104
	.byte	0x5
	.uleb128 0x5e7
	.long	.LASF1105
	.byte	0x5
	.uleb128 0x5e8
	.long	.LASF1106
	.byte	0x5
	.uleb128 0x5e9
	.long	.LASF1107
	.byte	0x5
	.uleb128 0x5ea
	.long	.LASF1108
	.byte	0x5
	.uleb128 0x5eb
	.long	.LASF1109
	.byte	0x5
	.uleb128 0x5ec
	.long	.LASF1110
	.byte	0x5
	.uleb128 0x5ed
	.long	.LASF1111
	.byte	0x5
	.uleb128 0x5ee
	.long	.LASF1112
	.byte	0x5
	.uleb128 0x5ef
	.long	.LASF1113
	.byte	0x5
	.uleb128 0x5f0
	.long	.LASF1114
	.byte	0x5
	.uleb128 0x5f1
	.long	.LASF1115
	.byte	0x5
	.uleb128 0x5f2
	.long	.LASF1116
	.byte	0x5
	.uleb128 0x5f3
	.long	.LASF1117
	.byte	0x5
	.uleb128 0x5f4
	.long	.LASF1118
	.byte	0x5
	.uleb128 0x5f5
	.long	.LASF1119
	.byte	0x5
	.uleb128 0x5f6
	.long	.LASF1120
	.byte	0x5
	.uleb128 0x5f7
	.long	.LASF1121
	.byte	0x5
	.uleb128 0x5f8
	.long	.LASF1122
	.byte	0x5
	.uleb128 0x5f9
	.long	.LASF1123
	.byte	0x5
	.uleb128 0x5fa
	.long	.LASF1124
	.byte	0x5
	.uleb128 0x5fb
	.long	.LASF1125
	.byte	0x5
	.uleb128 0x5fc
	.long	.LASF1126
	.byte	0x5
	.uleb128 0x5fd
	.long	.LASF1127
	.byte	0x5
	.uleb128 0x5fe
	.long	.LASF1128
	.byte	0x5
	.uleb128 0x5ff
	.long	.LASF1129
	.byte	0x5
	.uleb128 0x600
	.long	.LASF1130
	.byte	0x5
	.uleb128 0x601
	.long	.LASF1131
	.byte	0x5
	.uleb128 0x602
	.long	.LASF1132
	.byte	0x5
	.uleb128 0x603
	.long	.LASF1133
	.byte	0x5
	.uleb128 0x604
	.long	.LASF1134
	.byte	0x5
	.uleb128 0x605
	.long	.LASF1135
	.byte	0x5
	.uleb128 0x606
	.long	.LASF1136
	.byte	0x5
	.uleb128 0x607
	.long	.LASF1137
	.byte	0x5
	.uleb128 0x608
	.long	.LASF1138
	.byte	0x5
	.uleb128 0x609
	.long	.LASF1139
	.byte	0x5
	.uleb128 0x60a
	.long	.LASF1140
	.byte	0x5
	.uleb128 0x60b
	.long	.LASF1141
	.byte	0x5
	.uleb128 0x60c
	.long	.LASF1142
	.byte	0x5
	.uleb128 0x60d
	.long	.LASF1143
	.byte	0x5
	.uleb128 0x60e
	.long	.LASF1144
	.byte	0x5
	.uleb128 0x60f
	.long	.LASF1145
	.byte	0x5
	.uleb128 0x610
	.long	.LASF1146
	.byte	0x5
	.uleb128 0x611
	.long	.LASF1147
	.byte	0x5
	.uleb128 0x612
	.long	.LASF1148
	.byte	0x5
	.uleb128 0x613
	.long	.LASF1149
	.byte	0x5
	.uleb128 0x614
	.long	.LASF1150
	.byte	0x5
	.uleb128 0x615
	.long	.LASF1151
	.byte	0x5
	.uleb128 0x616
	.long	.LASF1152
	.byte	0x5
	.uleb128 0x617
	.long	.LASF1153
	.byte	0x5
	.uleb128 0x618
	.long	.LASF1154
	.byte	0x5
	.uleb128 0x619
	.long	.LASF1155
	.byte	0x5
	.uleb128 0x61a
	.long	.LASF1156
	.byte	0x5
	.uleb128 0x61b
	.long	.LASF1157
	.byte	0x5
	.uleb128 0x61c
	.long	.LASF1158
	.byte	0x5
	.uleb128 0x61d
	.long	.LASF1159
	.byte	0x5
	.uleb128 0x61e
	.long	.LASF1160
	.byte	0x5
	.uleb128 0x61f
	.long	.LASF1161
	.byte	0x5
	.uleb128 0x620
	.long	.LASF1162
	.byte	0x5
	.uleb128 0x621
	.long	.LASF1163
	.byte	0x5
	.uleb128 0x622
	.long	.LASF1164
	.byte	0x5
	.uleb128 0x623
	.long	.LASF1165
	.byte	0x5
	.uleb128 0x624
	.long	.LASF1166
	.byte	0x5
	.uleb128 0x625
	.long	.LASF1167
	.byte	0x5
	.uleb128 0x626
	.long	.LASF1168
	.byte	0x5
	.uleb128 0x627
	.long	.LASF1169
	.byte	0x5
	.uleb128 0x628
	.long	.LASF1170
	.byte	0x5
	.uleb128 0x629
	.long	.LASF1171
	.byte	0x5
	.uleb128 0x62a
	.long	.LASF1172
	.byte	0x5
	.uleb128 0x62b
	.long	.LASF1173
	.byte	0x5
	.uleb128 0x62c
	.long	.LASF1174
	.byte	0x5
	.uleb128 0x62d
	.long	.LASF1175
	.byte	0x5
	.uleb128 0x62e
	.long	.LASF1176
	.byte	0x5
	.uleb128 0x62f
	.long	.LASF1177
	.byte	0x5
	.uleb128 0x630
	.long	.LASF1178
	.byte	0x5
	.uleb128 0x631
	.long	.LASF1179
	.byte	0x5
	.uleb128 0x632
	.long	.LASF1180
	.byte	0x5
	.uleb128 0x633
	.long	.LASF1181
	.byte	0x5
	.uleb128 0x634
	.long	.LASF1182
	.byte	0x5
	.uleb128 0x635
	.long	.LASF1183
	.byte	0x5
	.uleb128 0x636
	.long	.LASF1184
	.byte	0x5
	.uleb128 0x637
	.long	.LASF1185
	.byte	0x5
	.uleb128 0x638
	.long	.LASF1186
	.byte	0x5
	.uleb128 0x639
	.long	.LASF1187
	.byte	0x5
	.uleb128 0x63a
	.long	.LASF1188
	.byte	0x5
	.uleb128 0x63b
	.long	.LASF1189
	.byte	0x5
	.uleb128 0x63c
	.long	.LASF1190
	.byte	0x5
	.uleb128 0x63d
	.long	.LASF1191
	.byte	0x5
	.uleb128 0x640
	.long	.LASF1192
	.byte	0x5
	.uleb128 0x643
	.long	.LASF1193
	.byte	0x5
	.uleb128 0x64a
	.long	.LASF1194
	.byte	0x5
	.uleb128 0x788
	.long	.LASF1195
	.byte	0x5
	.uleb128 0x78d
	.long	.LASF1196
	.byte	0x5
	.uleb128 0x78e
	.long	.LASF1197
	.byte	0x5
	.uleb128 0x78f
	.long	.LASF1198
	.byte	0x5
	.uleb128 0x790
	.long	.LASF1199
	.byte	0x5
	.uleb128 0x791
	.long	.LASF1200
	.byte	0x5
	.uleb128 0x792
	.long	.LASF1201
	.byte	0x5
	.uleb128 0x795
	.long	.LASF1202
	.byte	0x5
	.uleb128 0x796
	.long	.LASF1203
	.byte	0x5
	.uleb128 0x797
	.long	.LASF1204
	.byte	0x5
	.uleb128 0x798
	.long	.LASF1205
	.byte	0x5
	.uleb128 0x799
	.long	.LASF1206
	.byte	0x5
	.uleb128 0x79b
	.long	.LASF1207
	.byte	0x5
	.uleb128 0x79c
	.long	.LASF1208
	.byte	0x5
	.uleb128 0x79d
	.long	.LASF1209
	.byte	0x5
	.uleb128 0x79e
	.long	.LASF1210
	.byte	0x5
	.uleb128 0x79f
	.long	.LASF1211
	.byte	0x5
	.uleb128 0x7a1
	.long	.LASF1212
	.byte	0x5
	.uleb128 0x7a2
	.long	.LASF1213
	.byte	0x5
	.uleb128 0x7a3
	.long	.LASF1214
	.byte	0x5
	.uleb128 0x7a4
	.long	.LASF1215
	.byte	0x5
	.uleb128 0x7a5
	.long	.LASF1216
	.byte	0x5
	.uleb128 0x7a7
	.long	.LASF1217
	.byte	0x5
	.uleb128 0x7a8
	.long	.LASF1218
	.byte	0x5
	.uleb128 0x7a9
	.long	.LASF1219
	.byte	0x5
	.uleb128 0x7aa
	.long	.LASF1220
	.byte	0x5
	.uleb128 0x7ab
	.long	.LASF1221
	.byte	0x5
	.uleb128 0x7b3
	.long	.LASF1222
	.byte	0x5
	.uleb128 0x7b4
	.long	.LASF1223
	.byte	0x5
	.uleb128 0x7b5
	.long	.LASF1224
	.byte	0x5
	.uleb128 0x7b6
	.long	.LASF1225
	.byte	0x5
	.uleb128 0x7b7
	.long	.LASF1226
	.byte	0x5
	.uleb128 0x7b9
	.long	.LASF1227
	.byte	0x5
	.uleb128 0x7ba
	.long	.LASF1228
	.byte	0x5
	.uleb128 0x7bb
	.long	.LASF1229
	.byte	0x5
	.uleb128 0x7bc
	.long	.LASF1230
	.byte	0x5
	.uleb128 0x7cc
	.long	.LASF1231
	.byte	0x5
	.uleb128 0x7cf
	.long	.LASF1232
	.byte	0x5
	.uleb128 0x7d0
	.long	.LASF1233
	.byte	0x5
	.uleb128 0x7d1
	.long	.LASF1234
	.byte	0x5
	.uleb128 0x7d2
	.long	.LASF1235
	.byte	0x5
	.uleb128 0x7d3
	.long	.LASF1236
	.byte	0x5
	.uleb128 0x7d4
	.long	.LASF1237
	.byte	0x5
	.uleb128 0x7f0
	.long	.LASF1238
	.byte	0x5
	.uleb128 0x80b
	.long	.LASF1239
	.byte	0x5
	.uleb128 0x80c
	.long	.LASF1240
	.byte	0x5
	.uleb128 0x812
	.long	.LASF1241
	.byte	0x5
	.uleb128 0x813
	.long	.LASF1242
	.byte	0x5
	.uleb128 0x814
	.long	.LASF1243
	.byte	0x5
	.uleb128 0x815
	.long	.LASF1244
	.byte	0x5
	.uleb128 0x816
	.long	.LASF1245
	.byte	0x5
	.uleb128 0x817
	.long	.LASF1246
	.byte	0x5
	.uleb128 0x818
	.long	.LASF1247
	.byte	0x5
	.uleb128 0x819
	.long	.LASF1248
	.byte	0x5
	.uleb128 0x81a
	.long	.LASF1249
	.byte	0x5
	.uleb128 0x81b
	.long	.LASF1250
	.byte	0x5
	.uleb128 0x81c
	.long	.LASF1251
	.byte	0x5
	.uleb128 0x81d
	.long	.LASF1252
	.byte	0x5
	.uleb128 0x81e
	.long	.LASF1253
	.byte	0x5
	.uleb128 0x81f
	.long	.LASF1254
	.byte	0x5
	.uleb128 0x820
	.long	.LASF1255
	.byte	0x5
	.uleb128 0x822
	.long	.LASF1256
	.byte	0x5
	.uleb128 0x823
	.long	.LASF1257
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.unctrl.h.46.c707778f5afc46808288a843c83a4633,comdat
.Ldebug_macro34:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF1258
	.byte	0x6
	.uleb128 0x30
	.long	.LASF373
	.byte	0x5
	.uleb128 0x31
	.long	.LASF374
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.guilib.h.2.1a7fb1209788ff5735fc4737be9abb8b,comdat
.Ldebug_macro35:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x2
	.long	.LASF1260
	.byte	0x5
	.uleb128 0x14
	.long	.LASF1261
	.byte	0x5
	.uleb128 0x15
	.long	.LASF1262
	.byte	0x5
	.uleb128 0x16
	.long	.LASF1263
	.byte	0x5
	.uleb128 0x17
	.long	.LASF1264
	.byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF1324:
	.string	"pkg_avg"
.LASF634:
	.string	"INT32_MAX (2147483647)"
.LASF641:
	.string	"INT_LEAST16_MIN (-32767-1)"
.LASF1331:
	.string	"/home/jscha/dvp/cpumon/build"
.LASF1205:
	.string	"BUTTON1_DOUBLE_CLICKED NCURSES_MOUSE_MASK(1, NCURSES_DOUBLE_CLICKED)"
.LASF1130:
	.string	"KEY_A1 0534"
.LASF576:
	.string	"__STD_TYPE typedef"
.LASF1216:
	.string	"BUTTON3_TRIPLE_CLICKED NCURSES_MOUSE_MASK(3, NCURSES_TRIPLE_CLICKED)"
.LASF440:
	.string	"__WORDSIZE_TIME64_COMPAT32 1"
.LASF237:
	.string	"__FLT128_MIN_10_EXP__ (-4931)"
.LASF638:
	.string	"UINT32_MAX (4294967295U)"
.LASF691:
	.string	"NCURSES_ATTR_T int"
.LASF785:
	.string	"__HAVE_DISTINCT_FLOAT128 1"
.LASF825:
	.string	"TRUE 1"
.LASF1332:
	.string	"ldat"
.LASF315:
	.string	"__GCC_ATOMIC_WCHAR_T_LOCK_FREE 2"
.LASF110:
	.string	"__UINT32_MAX__ 0xffffffffU"
.LASF1148:
	.string	"KEY_MOVE 0556"
.LASF793:
	.string	"__HAVE_FLOAT64 1"
.LASF1027:
	.string	"insertln() winsdelln(stdscr,1)"
.LASF64:
	.string	"__UINT_LEAST64_TYPE__ long unsigned int"
.LASF1255:
	.string	"TRACE_ATTRS 0x1000"
.LASF778:
	.string	"stdin stdin"
.LASF231:
	.string	"__FLT64_HAS_INFINITY__ 1"
.LASF765:
	.string	"BUFSIZ 8192"
.LASF1174:
	.string	"KEY_SIC 0610"
.LASF805:
	.string	"__f64(x) x ##f64"
.LASF95:
	.string	"__SIZE_WIDTH__ 64"
.LASF300:
	.string	"__DEC128_MAX__ 9.999999999999999999999999999999999E6144DL"
.LASF843:
	.string	"WA_BOLD A_BOLD"
.LASF1190:
	.string	"KEY_UNDO 0630"
.LASF21:
	.string	"__LP64__ 1"
.LASF1172:
	.string	"KEY_SHELP 0606"
.LASF1238:
	.string	"mouse_trafo(y,x,to_screen) wmouse_trafo(stdscr,y,x,to_screen)"
.LASF545:
	.string	"__stub_sigreturn "
.LASF653:
	.string	"INT_FAST16_MIN (-9223372036854775807L-1)"
.LASF767:
	.string	"SEEK_SET 0"
.LASF224:
	.string	"__FLT64_DECIMAL_DIG__ 17"
.LASF508:
	.string	"__always_inline __inline __attribute__ ((__always_inline__))"
.LASF1019:
	.string	"getch() wgetch(stdscr)"
.LASF869:
	.string	"ACS_BTEE NCURSES_ACS('v')"
.LASF922:
	.string	"GCC_DEPRECATED(msg) __attribute__((deprecated))"
.LASF589:
	.string	"__OFF64_T_TYPE __SQUAD_TYPE"
.LASF1304:
	.string	"pdat"
.LASF919:
	.string	"GCC_NORETURN "
.LASF415:
	.string	"__GLIBC_USE_DEPRECATED_SCANF"
.LASF839:
	.string	"WA_UNDERLINE A_UNDERLINE"
.LASF408:
	.string	"__USE_ATFILE"
.LASF1256:
	.string	"TRACE_SHIFT 13"
.LASF483:
	.string	"__flexarr []"
.LASF249:
	.string	"__FLT128_IS_IEC_60559__ 2"
.LASF1118:
	.string	"KEY_EOS 0516"
.LASF680:
	.string	"INT16_C(c) c"
.LASF910:
	.string	"_FULLWIN 0x04"
.LASF1090:
	.string	"is_notimeout(win) (NCURSES_OK_ADDR(win) ? (win)->_notimeout : FALSE)"
.LASF448:
	.string	"__GNU_LIBRARY__"
.LASF141:
	.string	"__UINT_FAST16_MAX__ 0xffffffffffffffffUL"
.LASF174:
	.string	"__DBL_MAX_10_EXP__ 308"
.LASF1264:
	.string	"GREEN 4"
.LASF1254:
	.string	"TRACE_DATABASE 0x0800"
.LASF715:
	.string	"NCURSES_WCWIDTH_GRAPHICS"
.LASF285:
	.string	"__DEC32_MIN__ 1E-95DF"
.LASF138:
	.string	"__INT_FAST64_MAX__ 0x7fffffffffffffffL"
.LASF1105:
	.string	"KEY_UP 0403"
.LASF34:
	.string	"__ORDER_PDP_ENDIAN__ 3412"
.LASF1199:
	.string	"NCURSES_DOUBLE_CLICKED 010L"
.LASF291:
	.string	"__DEC64_MAX_EXP__ 385"
.LASF165:
	.string	"__FLT_HAS_DENORM__ 1"
.LASF49:
	.string	"__INT8_TYPE__ signed char"
.LASF1125:
	.string	"KEY_CTAB 0525"
.LASF1219:
	.string	"BUTTON4_CLICKED NCURSES_MOUSE_MASK(4, NCURSES_BUTTON_CLICKED)"
.LASF1156:
	.string	"KEY_REPLACE 0566"
.LASF208:
	.string	"__FLT32_DECIMAL_DIG__ 9"
.LASF478:
	.string	"__glibc_unsafe_len(__l,__s,__osz) (__glibc_unsigned_or_positive (__l) && __builtin_constant_p (__glibc_safe_len_cond ((__SIZE_TYPE__) (__l), __s, __osz)) && !__glibc_safe_len_cond ((__SIZE_TYPE__) (__l), __s, __osz))"
.LASF854:
	.string	"COLOR_BLACK 0"
.LASF2:
	.string	"__STDC_UTF_16__ 1"
.LASF40:
	.string	"__SIZE_TYPE__ long unsigned int"
.LASF888:
	.string	"ACS_S3 NCURSES_ACS('p')"
.LASF1044:
	.string	"mvwaddstr(win,y,x,str) (wmove((win),(y),(x)) == ERR ? ERR : waddnstr((win),(str),-1))"
.LASF125:
	.string	"__UINT8_C(c) c"
.LASF1115:
	.string	"KEY_IC 0513"
.LASF50:
	.string	"__INT16_TYPE__ short int"
.LASF355:
	.string	"linux 1"
.LASF700:
	.string	"NCURSES_OPAQUE 0"
.LASF8:
	.string	"__VERSION__ \"11.4.0\""
.LASF864:
	.string	"ACS_LLCORNER NCURSES_ACS('m')"
.LASF1209:
	.string	"BUTTON2_CLICKED NCURSES_MOUSE_MASK(2, NCURSES_BUTTON_CLICKED)"
.LASF1040:
	.string	"mvwaddch(win,y,x,ch) (wmove((win),(y),(x)) == ERR ? ERR : waddch((win),(ch)))"
.LASF1037:
	.string	"timeout(delay) wtimeout(stdscr,(delay))"
.LASF1110:
	.string	"KEY_F0 0410"
.LASF837:
	.string	"WA_NORMAL A_NORMAL"
.LASF1235:
	.string	"BUTTON_DOUBLE_CLICK(e,x) ((e) & NCURSES_MOUSE_MASK(x, 010))"
.LASF497:
	.string	"__attribute_noinline__ __attribute__ ((__noinline__))"
.LASF307:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 1"
.LASF930:
	.string	"NCURSES_ATTR_SHIFT 8"
.LASF703:
	.string	"NCURSES_OPAQUE_PANEL 0"
.LASF916:
	.string	"_NEWINDEX -1"
.LASF4:
	.string	"__STDC_HOSTED__ 1"
.LASF621:
	.string	"__STD_TYPE"
.LASF912:
	.string	"_ISPAD 0x10"
.LASF332:
	.string	"__x86_64 1"
.LASF659:
	.string	"INT_FAST64_MAX (__INT64_C(9223372036854775807))"
.LASF464:
	.string	"__P(args) args"
.LASF1282:
	.string	"_attrs"
.LASF848:
	.string	"WA_LEFT A_LEFT"
.LASF1119:
	.string	"KEY_EOL 0517"
.LASF971:
	.string	"getbegy(win) (NCURSES_OK_ADDR(win) ? (win)->_begy : ERR)"
.LASF723:
	.string	"__SIZE_T__ "
.LASF211:
	.string	"__FLT32_MIN__ 1.17549435082228750796873653722224568e-38F32"
.LASF207:
	.string	"__FLT32_MAX_10_EXP__ 38"
.LASF1126:
	.string	"KEY_CATAB 0526"
.LASF1091:
	.string	"is_pad(win) (NCURSES_OK_ADDR(win) ? ((win)->_flags & _ISPAD) != 0 : FALSE)"
.LASF107:
	.string	"__INT64_MAX__ 0x7fffffffffffffffL"
.LASF1088:
	.string	"is_leaveok(win) (NCURSES_OK_ADDR(win) ? (win)->_leaveok : FALSE)"
.LASF895:
	.string	"ACS_BSSB ACS_ULCORNER"
.LASF161:
	.string	"__FLT_NORM_MAX__ 3.40282346638528859811704183484516925e+38F"
.LASF352:
	.string	"__gnu_linux__ 1"
.LASF1095:
	.string	"wgetdelay(win) (NCURSES_OK_ADDR(win) ? (win)->_delay : 0)"
.LASF204:
	.string	"__FLT32_MIN_EXP__ (-125)"
.LASF185:
	.string	"__LDBL_MANT_DIG__ 64"
.LASF807:
	.string	"__f64x(x) x ##f64x"
.LASF1178:
	.string	"KEY_SNEXT 0614"
.LASF663:
	.string	"UINT_FAST64_MAX (__UINT64_C(18446744073709551615))"
.LASF1098:
	.string	"is_linetouched(w,l) ((!(w) || ((l) > getmaxy(w)) || ((l) < 0)) ? ERR : (is_linetouched)((w),(l)))"
.LASF792:
	.string	"__HAVE_FLOAT32 1"
.LASF736:
	.string	"_GCC_SIZE_T "
.LASF1111:
	.string	"KEY_F(n) (KEY_F0+(n))"
.LASF684:
	.string	"UINT16_C(c) c"
.LASF221:
	.string	"__FLT64_MIN_10_EXP__ (-307)"
.LASF38:
	.string	"__GNUC_EXECUTION_CHARSET_NAME \"UTF-8\""
.LASF954:
	.string	"getmaxyx(win,y,x) (y = getmaxy(win), x = getmaxx(win))"
.LASF628:
	.string	"INT8_MIN (-128)"
.LASF139:
	.string	"__INT_FAST64_WIDTH__ 64"
.LASF1249:
	.string	"TRACE_VIRTPUT 0x0040"
.LASF701:
	.string	"NCURSES_OPAQUE_FORM 0"
.LASF573:
	.string	"__ULONG32_TYPE unsigned int"
.LASF452:
	.string	"__GLIBC_PREREQ(maj,min) ((__GLIBC__ << 16) + __GLIBC_MINOR__ >= ((maj) << 16) + (min))"
.LASF485:
	.string	"__REDIRECT(name,proto,alias) name proto __asm__ (__ASMNAME (#alias))"
.LASF727:
	.string	"_T_SIZE "
.LASF1109:
	.string	"KEY_BACKSPACE 0407"
.LASF287:
	.string	"__DEC32_EPSILON__ 1E-6DF"
.LASF33:
	.string	"__ORDER_BIG_ENDIAN__ 4321"
.LASF394:
	.string	"__USE_POSIX2"
.LASF206:
	.string	"__FLT32_MAX_EXP__ 128"
.LASF637:
	.string	"UINT16_MAX (65535)"
.LASF299:
	.string	"__DEC128_MIN__ 1E-6143DL"
.LASF658:
	.string	"INT_FAST32_MAX (9223372036854775807L)"
.LASF530:
	.string	"__glibc_macro_warning1(message) _Pragma (#message)"
.LASF867:
	.string	"ACS_LTEE NCURSES_ACS('t')"
.LASF856:
	.string	"COLOR_GREEN 2"
.LASF351:
	.string	"__CET__ 3"
.LASF248:
	.string	"__FLT128_HAS_QUIET_NAN__ 1"
.LASF1048:
	.string	"mvwgetnstr(win,y,x,str,n) (wmove((win),(y),(x)) == ERR ? ERR : wgetnstr((win),(str),(n)))"
.LASF948:
	.string	"A_RIGHT NCURSES_BITS(1U,20)"
.LASF406:
	.string	"__USE_FILE_OFFSET64"
.LASF220:
	.string	"__FLT64_MIN_EXP__ (-1021)"
.LASF1217:
	.string	"BUTTON4_RELEASED NCURSES_MOUSE_MASK(4, NCURSES_BUTTON_RELEASED)"
.LASF1287:
	.string	"_scroll"
.LASF1325:
	.string	"value_count"
.LASF393:
	.string	"__USE_POSIX"
.LASF31:
	.string	"__BIGGEST_ALIGNMENT__ 16"
.LASF1069:
	.string	"mvgetstr(y,x,str) mvwgetstr(stdscr,(y),(x),(str))"
.LASF672:
	.string	"SIG_ATOMIC_MIN (-2147483647-1)"
.LASF740:
	.string	"NULL"
.LASF1149:
	.string	"KEY_NEXT 0557"
.LASF619:
	.string	"_BITS_TIME64_H 1"
.LASF1207:
	.string	"BUTTON2_RELEASED NCURSES_MOUSE_MASK(2, NCURSES_BUTTON_RELEASED)"
.LASF271:
	.string	"__FLT64X_MAX_10_EXP__ 4932"
.LASF1161:
	.string	"KEY_SCANCEL 0573"
.LASF1308:
	.string	"_pad_left"
.LASF898:
	.string	"ACS_SBBS ACS_LRCORNER"
.LASF1077:
	.string	"mvinsstr(y,x,s) mvwinsstr(stdscr,(y),(x),(s))"
.LASF1084:
	.string	"is_idcok(win) (NCURSES_OK_ADDR(win) ? (win)->_idcok : FALSE)"
.LASF675:
	.string	"WCHAR_MIN __WCHAR_MIN"
.LASF541:
	.string	"__stub_fchflags "
.LASF1173:
	.string	"KEY_SHOME 0607"
.LASF321:
	.string	"__GCC_ATOMIC_POINTER_LOCK_FREE 2"
.LASF44:
	.string	"__INTMAX_TYPE__ long int"
.LASF1215:
	.string	"BUTTON3_DOUBLE_CLICKED NCURSES_MOUSE_MASK(3, NCURSES_DOUBLE_CLICKED)"
.LASF598:
	.string	"__FSFILCNT64_T_TYPE __UQUAD_TYPE"
.LASF796:
	.string	"__HAVE_DISTINCT_FLOAT16 __HAVE_FLOAT16"
.LASF852:
	.string	"WA_VERTICAL A_VERTICAL"
.LASF695:
	.string	"NCURSES_INLINE inline"
.LASF242:
	.string	"__FLT128_NORM_MAX__ 1.18973149535723176508575932662800702e+4932F128"
.LASF844:
	.string	"WA_ALTCHARSET A_ALTCHARSET"
.LASF193:
	.string	"__LDBL_MAX__ 1.18973149535723176502126385303097021e+4932L"
.LASF417:
	.string	"__GNUC_PREREQ(maj,min) ((__GNUC__ << 16) + __GNUC_MINOR__ >= ((maj) << 16) + (min))"
.LASF397:
	.string	"__USE_XOPEN"
.LASF717:
	.string	"NCURSES_CH_T"
.LASF140:
	.string	"__UINT_FAST8_MAX__ 0xff"
.LASF981:
	.string	"touchwin(win) wtouchln((win), 0, getmaxy(win), 1)"
.LASF402:
	.string	"__USE_XOPEN2K8"
.LASF889:
	.string	"ACS_S7 NCURSES_ACS('r')"
.LASF263:
	.string	"__FLT32X_HAS_INFINITY__ 1"
.LASF507:
	.string	"__always_inline"
.LASF725:
	.string	"_SYS_SIZE_T_H "
.LASF1074:
	.string	"mvinnstr(y,x,s,n) mvwinnstr(stdscr,(y),(x),(s),(n))"
.LASF1250:
	.string	"TRACE_IEVENT 0x0080"
.LASF61:
	.string	"__UINT_LEAST8_TYPE__ unsigned char"
.LASF413:
	.string	"__GLIBC_USE_ISOC2X"
.LASF649:
	.string	"UINT_LEAST16_MAX (65535)"
.LASF336:
	.string	"__ATOMIC_HLE_ACQUIRE 65536"
.LASF450:
	.string	"__GLIBC__ 2"
.LASF1280:
	.string	"_begx"
.LASF1279:
	.string	"_begy"
.LASF1271:
	.string	"long int"
.LASF442:
	.string	"__TIMESIZE __WORDSIZE"
.LASF1081:
	.string	"slk_attr_off(a,v) ((v) ? ERR : slk_attroff(a))"
.LASF302:
	.string	"__DEC128_SUBNORMAL_MIN__ 0.000000000000000000000000000000001E-6143DL"
.LASF256:
	.string	"__FLT32X_DECIMAL_DIG__ 17"
.LASF958:
	.string	"wgetstr(w,s) wgetnstr(w, s, -1)"
.LASF264:
	.string	"__FLT32X_HAS_QUIET_NAN__ 1"
.LASF418:
	.string	"__glibc_clang_prereq(maj,min) 0"
.LASF436:
	.string	"__USE_XOPEN2K8 1"
.LASF607:
	.string	"__CLOCKID_T_TYPE __S32_TYPE"
.LASF1085:
	.string	"is_idlok(win) (NCURSES_OK_ADDR(win) ? (win)->_idlok : FALSE)"
.LASF297:
	.string	"__DEC128_MIN_EXP__ (-6142)"
.LASF1096:
	.string	"wgetparent(win) (NCURSES_OK_ADDR(win) ? (win)->_parent : 0)"
.LASF722:
	.string	"__size_t__ "
.LASF236:
	.string	"__FLT128_MIN_EXP__ (-16381)"
.LASF746:
	.string	"_____fpos_t_defined 1"
.LASF72:
	.string	"__UINT_FAST64_TYPE__ long unsigned int"
.LASF356:
	.string	"__unix 1"
.LASF986:
	.string	"hline(ch,n) whline(stdscr, ch, (n))"
.LASF57:
	.string	"__INT_LEAST8_TYPE__ signed char"
.LASF1286:
	.string	"_leaveok"
.LASF37:
	.string	"__SIZEOF_POINTER__ 8"
.LASF311:
	.string	"__GCC_ATOMIC_BOOL_LOCK_FREE 2"
.LASF618:
	.string	"__FD_SETSIZE 1024"
.LASF278:
	.string	"__FLT64X_HAS_DENORM__ 1"
.LASF976:
	.string	"wstandout(win) (wattrset(win,A_STANDOUT))"
.LASF603:
	.string	"__SUSECONDS_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF269:
	.string	"__FLT64X_MIN_10_EXP__ (-4931)"
.LASF949:
	.string	"A_TOP NCURSES_BITS(1U,21)"
.LASF777:
	.string	"FOPEN_MAX 16"
.LASF712:
	.string	"NCURSES_TPARM_VARARGS 1"
.LASF71:
	.string	"__UINT_FAST32_TYPE__ long unsigned int"
.LASF665:
	.string	"INTPTR_MAX (9223372036854775807L)"
.LASF597:
	.string	"__FSFILCNT_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF596:
	.string	"__FSBLKCNT64_T_TYPE __UQUAD_TYPE"
.LASF504:
	.string	"__returns_nonnull __attribute__ ((__returns_nonnull__))"
.LASF253:
	.string	"__FLT32X_MIN_10_EXP__ (-307)"
.LASF866:
	.string	"ACS_LRCORNER NCURSES_ACS('j')"
.LASF488:
	.string	"__ASMNAME(cname) __ASMNAME2 (__USER_LABEL_PREFIX__, cname)"
.LASF1284:
	.string	"_notimeout"
.LASF857:
	.string	"COLOR_YELLOW 3"
.LASF980:
	.string	"scroll(win) wscrl(win,1)"
.LASF779:
	.string	"stdout stdout"
.LASF143:
	.string	"__UINT_FAST64_MAX__ 0xffffffffffffffffUL"
.LASF184:
	.string	"__DBL_IS_IEC_60559__ 2"
.LASF933:
	.string	"A_ATTRIBUTES NCURSES_BITS(~(1U - 1U),0)"
.LASF157:
	.string	"__FLT_MAX_EXP__ 128"
.LASF1071:
	.string	"mvinch(y,x) mvwinch(stdscr,(y),(x))"
.LASF362:
	.string	"__STDC_IEC_559__ 1"
.LASF23:
	.string	"__SIZEOF_LONG__ 8"
.LASF493:
	.string	"__attribute_pure__ __attribute__ ((__pure__))"
.LASF1100:
	.string	"KEY_MIN 0401"
.LASF1195:
	.string	"NCURSES_MOUSE_MASK(b,m) ((m) << (((b) - 1) * 5))"
.LASF1251:
	.string	"TRACE_BITS 0x0100"
.LASF27:
	.string	"__SIZEOF_DOUBLE__ 8"
.LASF120:
	.string	"__INT_LEAST32_WIDTH__ 32"
.LASF967:
	.string	"getattrs(win) NCURSES_CAST(int, NCURSES_OK_ADDR(win) ? (win)->_attrs : A_NORMAL)"
.LASF190:
	.string	"__LDBL_MAX_10_EXP__ 4932"
.LASF803:
	.string	"__HAVE_FLOATN_NOT_TYPEDEF 1"
.LASF386:
	.string	"__GLIBC_INTERNAL_STARTING_HEADER_IMPLEMENTATION "
.LASF361:
	.string	"_STDC_PREDEF_H 1"
.LASF890:
	.string	"ACS_LEQUAL NCURSES_ACS('y')"
.LASF997:
	.string	"addchnstr(str,n) waddchnstr(stdscr,(str),(n))"
.LASF18:
	.string	"__PIE__ 2"
.LASF229:
	.string	"__FLT64_DENORM_MIN__ 4.94065645841246544176568792868221372e-324F64"
.LASF293:
	.string	"__DEC64_MAX__ 9.999999999999999E384DD"
.LASF486:
	.string	"__REDIRECT_NTH(name,proto,alias) name proto __asm__ (__ASMNAME (#alias)) __THROW"
.LASF1187:
	.string	"KEY_SSUSPEND 0625"
.LASF404:
	.string	"__USE_LARGEFILE"
.LASF548:
	.string	"__GLIBC_USE_LIB_EXT2 0"
.LASF702:
	.string	"NCURSES_OPAQUE_MENU 0"
.LASF156:
	.string	"__FLT_MIN_10_EXP__ (-37)"
.LASF226:
	.string	"__FLT64_NORM_MAX__ 1.79769313486231570814527423731704357e+308F64"
.LASF447:
	.string	"__GLIBC_USE_DEPRECATED_SCANF 0"
.LASF159:
	.string	"__FLT_DECIMAL_DIG__ 9"
.LASF457:
	.string	"__glibc_has_extension(ext) 0"
.LASF1107:
	.string	"KEY_RIGHT 0405"
.LASF1021:
	.string	"inch() winch(stdscr)"
.LASF1009:
	.string	"bkgdset(ch) wbkgdset(stdscr,(ch))"
.LASF1269:
	.string	"signed char"
.LASF1152:
	.string	"KEY_PREVIOUS 0562"
.LASF945:
	.string	"A_HORIZONTAL NCURSES_BITS(1U,17)"
.LASF846:
	.string	"WA_PROTECT A_PROTECT"
.LASF902:
	.string	"ACS_BSSS ACS_TTEE"
.LASF563:
	.string	"__U16_TYPE unsigned short int"
.LASF213:
	.string	"__FLT32_DENORM_MIN__ 1.40129846432481707092372958328991613e-45F32"
.LASF369:
	.string	"CURSES_H 1"
.LASF305:
	.string	"__GNUC_STDC_INLINE__ 1"
.LASF1066:
	.string	"mvdelch(y,x) mvwdelch(stdscr,(y),(x))"
.LASF903:
	.string	"ACS_BSBS ACS_HLINE"
.LASF955:
	.string	"getparyx(win,y,x) (y = getpary(win), x = getparx(win))"
.LASF167:
	.string	"__FLT_HAS_QUIET_NAN__ 1"
.LASF7:
	.string	"__GNUC_PATCHLEVEL__ 0"
.LASF578:
	.string	"__SYSCALL_SLONG_TYPE __SLONGWORD_TYPE"
.LASF521:
	.string	"__LDOUBLE_REDIRECTS_TO_FLOAT128_ABI 0"
.LASF1045:
	.string	"mvwchgat(win,y,x,n,a,c,o) (wmove((win),(y),(x)) == ERR ? ERR : wchgat((win),(n),(a),(c),(o)))"
.LASF94:
	.string	"__PTRDIFF_WIDTH__ 64"
.LASF126:
	.string	"__UINT_LEAST16_MAX__ 0xffff"
.LASF458:
	.string	"__LEAF , __leaf__"
.LASF216:
	.string	"__FLT32_HAS_QUIET_NAN__ 1"
.LASF1:
	.string	"__STDC_VERSION__ 201710L"
.LASF911:
	.string	"_SCROLLWIN 0x08"
.LASF594:
	.string	"__BLKCNT64_T_TYPE __SQUAD_TYPE"
.LASF1018:
	.string	"erase() werase(stdscr)"
.LASF261:
	.string	"__FLT32X_DENORM_MIN__ 4.94065645841246544176568792868221372e-324F32x"
.LASF223:
	.string	"__FLT64_MAX_10_EXP__ 308"
.LASF1231:
	.string	"ALL_MOUSE_EVENTS (REPORT_MOUSE_POSITION - 1)"
.LASF1063:
	.string	"mvaddnstr(y,x,str,n) mvwaddnstr(stdscr,(y),(x),(str),(n))"
.LASF135:
	.string	"__INT_FAST16_WIDTH__ 64"
.LASF1294:
	.string	"_line"
.LASF380:
	.string	"NCURSES_EXPORT(type) NCURSES_IMPEXP type NCURSES_API"
.LASF1265:
	.string	"unsigned char"
.LASF3:
	.string	"__STDC_UTF_32__ 1"
.LASF424:
	.string	"__USE_ISOC99 1"
.LASF212:
	.string	"__FLT32_EPSILON__ 1.19209289550781250000000000000000000e-7F32"
.LASF158:
	.string	"__FLT_MAX_10_EXP__ 38"
.LASF465:
	.string	"__PMT(args) args"
.LASF360:
	.string	"__DECIMAL_BID_FORMAT__ 1"
.LASF298:
	.string	"__DEC128_MAX_EXP__ 6145"
.LASF650:
	.string	"UINT_LEAST32_MAX (4294967295U)"
.LASF1082:
	.string	"slk_attr_on(a,v) ((v) ? ERR : slk_attron(a))"
.LASF1064:
	.string	"mvaddstr(y,x,str) mvwaddstr(stdscr,(y),(x),(str))"
.LASF268:
	.string	"__FLT64X_MIN_EXP__ (-16381)"
.LASF10:
	.string	"__ATOMIC_SEQ_CST 5"
.LASF892:
	.string	"ACS_PI NCURSES_ACS('{')"
.LASF1035:
	.string	"standend() wstandend(stdscr)"
.LASF977:
	.string	"wstandend(win) (wattrset(win,A_NORMAL))"
.LASF1276:
	.string	"_curx"
.LASF1275:
	.string	"_cury"
.LASF882:
	.string	"ACS_RARROW NCURSES_ACS('+')"
.LASF1252:
	.string	"TRACE_ICALLS 0x0200"
.LASF860:
	.string	"COLOR_CYAN 6"
.LASF109:
	.string	"__UINT16_MAX__ 0xffff"
.LASF790:
	.string	"_BITS_FLOATN_COMMON_H "
.LASF1273:
	.string	"chtype"
.LASF129:
	.string	"__UINT32_C(c) c ## U"
.LASF347:
	.string	"__SSE2_MATH__ 1"
.LASF97:
	.string	"__INTMAX_C(c) c ## L"
.LASF189:
	.string	"__LDBL_MAX_EXP__ 16384"
.LASF629:
	.string	"INT16_MIN (-32767-1)"
.LASF25:
	.string	"__SIZEOF_SHORT__ 2"
.LASF1055:
	.string	"mvwinsch(win,y,x,c) (wmove((win),(y),(x)) == ERR ? ERR : winsch((win),(c)))"
.LASF1001:
	.string	"attr_get(ap,cp,o) wattr_get(stdscr,(ap),(cp),(o))"
.LASF1311:
	.string	"_Bool"
.LASF122:
	.string	"__INT64_C(c) c ## L"
.LASF515:
	.string	"__restrict_arr __restrict"
.LASF539:
	.string	"__stub___compat_bdflush "
.LASF1260:
	.string	"GUILIB "
.LASF731:
	.string	"_SIZE_T_DEFINED_ "
.LASF1323:
	.string	"value"
.LASF940:
	.string	"A_DIM NCURSES_BITS(1U,12)"
.LASF99:
	.string	"__UINTMAX_C(c) c ## UL"
.LASF950:
	.string	"A_VERTICAL NCURSES_BITS(1U,22)"
.LASF605:
	.string	"__DADDR_T_TYPE __S32_TYPE"
.LASF243:
	.string	"__FLT128_MIN__ 3.36210314311209350626267781732175260e-4932F128"
.LASF446:
	.string	"__GLIBC_USE_DEPRECATED_GETS 0"
.LASF324:
	.string	"__PRAGMA_REDEFINE_EXTNAME 1"
.LASF645:
	.string	"INT_LEAST16_MAX (32767)"
.LASF383:
	.string	"NCURSES_EXPORT_GENERAL_EXPORT "
.LASF1000:
	.string	"addstr(str) waddnstr(stdscr,(str),-1)"
.LASF494:
	.string	"__attribute_const__ __attribute__ ((__const__))"
.LASF203:
	.string	"__FLT32_DIG__ 6"
.LASF643:
	.string	"INT_LEAST64_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF308:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 1"
.LASF789:
	.string	"__CFLOAT128 _Complex _Float128"
.LASF1177:
	.string	"KEY_SMOVE 0613"
.LASF68:
	.string	"__INT_FAST64_TYPE__ long int"
.LASF191:
	.string	"__DECIMAL_DIG__ 21"
.LASF995:
	.string	"PAIR_NUMBER(a) (NCURSES_CAST(int,((NCURSES_CAST(unsigned long,(a)) & A_COLOR) >> NCURSES_ATTR_SHIFT)))"
.LASF81:
	.string	"__WCHAR_MAX__ 0x7fffffff"
.LASF937:
	.string	"A_UNDERLINE NCURSES_BITS(1U,9)"
.LASF550:
	.string	"__GLIBC_USE_IEC_60559_BFP_EXT 0"
.LASF476:
	.string	"__glibc_unsigned_or_positive(__l) ((__typeof (__l)) 0 < (__typeof (__l)) -1 || (__builtin_constant_p (__l) && (__l) > 0))"
.LASF1220:
	.string	"BUTTON4_DOUBLE_CLICKED NCURSES_MOUSE_MASK(4, NCURSES_DOUBLE_CLICKED)"
.LASF1203:
	.string	"BUTTON1_PRESSED NCURSES_MOUSE_MASK(1, NCURSES_BUTTON_PRESSED)"
.LASF720:
	.string	"__need_size_t "
.LASF1099:
	.string	"KEY_CODE_YES 0400"
.LASF566:
	.string	"__SLONGWORD_TYPE long int"
.LASF588:
	.string	"__OFF_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF412:
	.string	"__KERNEL_STRICT_NAMES"
.LASF217:
	.string	"__FLT32_IS_IEC_60559__ 2"
.LASF1191:
	.string	"KEY_MOUSE 0631"
.LASF920:
	.string	"GCC_UNUSED "
.LASF1116:
	.string	"KEY_EIC 0514"
.LASF512:
	.string	"__fortify_function __extern_always_inline __attribute_artificial__"
.LASF426:
	.string	"__USE_POSIX_IMPLICITLY 1"
.LASF333:
	.string	"__x86_64__ 1"
.LASF1241:
	.string	"TRACE_DISABLE 0x0000"
.LASF689:
	.string	"_GCC_WRAP_STDINT_H "
.LASF743:
	.string	"__need___va_list "
.LASF1151:
	.string	"KEY_OPTIONS 0561"
.LASF1213:
	.string	"BUTTON3_PRESSED NCURSES_MOUSE_MASK(3, NCURSES_BUTTON_PRESSED)"
.LASF400:
	.string	"__USE_XOPEN2K"
.LASF474:
	.string	"__glibc_objsize(__o) __bos (__o)"
.LASF620:
	.string	"__TIME64_T_TYPE __TIME_T_TYPE"
.LASF973:
	.string	"getmaxy(win) (NCURSES_OK_ADDR(win) ? ((win)->_maxy + 1) : ERR)"
.LASF401:
	.string	"__USE_XOPEN2KXSI"
.LASF108:
	.string	"__UINT8_MAX__ 0xff"
.LASF1128:
	.string	"KEY_PRINT 0532"
.LASF163:
	.string	"__FLT_EPSILON__ 1.19209289550781250000000000000000000e-7F"
.LASF365:
	.string	"__STDC_IEC_60559_COMPLEX__ 201404L"
.LASF893:
	.string	"ACS_NEQUAL NCURSES_ACS('|')"
.LASF510:
	.string	"__extern_inline extern __inline __attribute__ ((__gnu_inline__))"
.LASF555:
	.string	"__GLIBC_USE_IEC_60559_FUNCS_EXT"
.LASF1334:
	.string	"draw_power"
.LASF984:
	.string	"box(win,v,h) wborder(win, v, v, h, h, 0, 0, 0, 0)"
.LASF181:
	.string	"__DBL_HAS_DENORM__ 1"
.LASF433:
	.string	"__USE_POSIX199309 1"
.LASF349:
	.string	"__SEG_FS 1"
.LASF656:
	.string	"INT_FAST8_MAX (127)"
.LASF644:
	.string	"INT_LEAST8_MAX (127)"
.LASF1025:
	.string	"insch(c) winsch(stdscr,(c))"
.LASF974:
	.string	"getparx(win) (NCURSES_OK_ADDR(win) ? (win)->_parx : ERR)"
.LASF75:
	.string	"__GXX_ABI_VERSION 1016"
.LASF850:
	.string	"WA_RIGHT A_RIGHT"
.LASF115:
	.string	"__INT_LEAST16_MAX__ 0x7fff"
.LASF972:
	.string	"getmaxx(win) (NCURSES_OK_ADDR(win) ? ((win)->_maxx + 1) : ERR)"
.LASF238:
	.string	"__FLT128_MAX_EXP__ 16384"
.LASF1299:
	.string	"_parent"
.LASF685:
	.string	"UINT32_C(c) c ## U"
.LASF868:
	.string	"ACS_RTEE NCURSES_ACS('u')"
.LASF664:
	.string	"INTPTR_MIN (-9223372036854775807L-1)"
.LASF395:
	.string	"__USE_POSIX199309"
.LASF635:
	.string	"INT64_MAX (__INT64_C(9223372036854775807))"
.LASF366:
	.string	"__STDC_ISO_10646__ 201706L"
.LASF809:
	.string	"__CFLOAT64 _Complex _Float64"
.LASF808:
	.string	"__CFLOAT32 _Complex _Float32"
.LASF780:
	.string	"stderr stderr"
.LASF1160:
	.string	"KEY_SBEG 0572"
.LASF750:
	.string	"__FILE_defined 1"
.LASF753:
	.string	"__putc_unlocked_body(_ch,_fp) (__glibc_unlikely ((_fp)->_IO_write_ptr >= (_fp)->_IO_write_end) ? __overflow (_fp, (unsigned char) (_ch)) : (unsigned char) (*(_fp)->_IO_write_ptr++ = (_ch)))"
.LASF674:
	.string	"SIZE_MAX (18446744073709551615UL)"
.LASF1051:
	.string	"mvwinch(win,y,x) (wmove((win),(y),(x)) == ERR ? NCURSES_CAST(chtype, ERR) : winch(win))"
.LASF381:
	.string	"NCURSES_EXPORT_VAR(type) NCURSES_IMPEXP type"
.LASF451:
	.string	"__GLIBC_MINOR__ 35"
.LASF667:
	.string	"INTMAX_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF316:
	.string	"__GCC_ATOMIC_SHORT_LOCK_FREE 2"
.LASF399:
	.string	"__USE_UNIX98"
.LASF65:
	.string	"__INT_FAST8_TYPE__ signed char"
.LASF1245:
	.string	"TRACE_MOVE 0x0008"
.LASF988:
	.string	"winstr(w,s) winnstr(w, s, -1)"
.LASF416:
	.string	"__KERNEL_STRICT_NAMES "
.LASF1010:
	.string	"chgat(n,a,c,o) wchgat(stdscr,(n),(a),(c),(o))"
.LASF885:
	.string	"ACS_BOARD NCURSES_ACS('h')"
.LASF1194:
	.string	"_XOPEN_CURSES 1"
.LASF1086:
	.string	"is_immedok(win) (NCURSES_OK_ADDR(win) ? (win)->_immed : FALSE)"
.LASF582:
	.string	"__GID_T_TYPE __U32_TYPE"
.LASF758:
	.string	"_IO_USER_LOCK 0x8000"
.LASF123:
	.string	"__INT_LEAST64_WIDTH__ 64"
.LASF1036:
	.string	"standout() wstandout(stdscr)"
.LASF1123:
	.string	"KEY_PPAGE 0523"
.LASF52:
	.string	"__INT64_TYPE__ long int"
.LASF567:
	.string	"__ULONGWORD_TYPE unsigned long int"
.LASF739:
	.string	"__need_size_t"
.LASF320:
	.string	"__GCC_ATOMIC_TEST_AND_SET_TRUEVAL 1"
.LASF1004:
	.string	"attr_set(a,c,o) wattr_set(stdscr,(a),(c),(o))"
.LASF612:
	.string	"__CPU_MASK_TYPE __SYSCALL_ULONG_TYPE"
.LASF359:
	.string	"__ELF__ 1"
.LASF759:
	.string	"_VA_LIST_DEFINED "
.LASF716:
	.string	"NCURSES_WCWIDTH_GRAPHICS 1"
.LASF1310:
	.string	"_pad_right"
.LASF98:
	.string	"__UINTMAX_MAX__ 0xffffffffffffffffUL"
.LASF905:
	.string	"ACS_SSSS ACS_PLUS"
.LASF1296:
	.string	"_regbottom"
.LASF652:
	.string	"INT_FAST8_MIN (-128)"
.LASF199:
	.string	"__LDBL_HAS_INFINITY__ 1"
.LASF544:
	.string	"__stub_setlogin "
.LASF286:
	.string	"__DEC32_MAX__ 9.999999E96DF"
.LASF614:
	.string	"__INO_T_MATCHES_INO64_T 1"
.LASF1283:
	.string	"_bkgd"
.LASF1020:
	.string	"getstr(str) wgetstr(stdscr,(str))"
.LASF255:
	.string	"__FLT32X_MAX_10_EXP__ 308"
.LASF558:
	.string	"__GLIBC_USE_IEC_60559_FUNCS_EXT_C2X 0"
.LASF745:
	.string	"__GNUC_VA_LIST "
.LASF879:
	.string	"ACS_PLMINUS NCURSES_ACS('g')"
.LASF960:
	.string	"setterm(term) setupterm(term, 1, (int *)0)"
.LASF1026:
	.string	"insdelln(n) winsdelln(stdscr,(n))"
.LASF1052:
	.string	"mvwinchnstr(win,y,x,s,n) (wmove((win),(y),(x)) == ERR ? ERR : winchnstr((win),(s),(n)))"
.LASF829:
	.string	"bool _Bool"
.LASF477:
	.string	"__glibc_safe_or_unknown_len(__l,__s,__osz) (__glibc_unsigned_or_positive (__l) && __builtin_constant_p (__glibc_safe_len_cond ((__SIZE_TYPE__) (__l), __s, __osz)) && __glibc_safe_len_cond ((__SIZE_TYPE__) (__l), __s, __osz))"
.LASF1103:
	.string	"KEY_RESET 0531"
.LASF883:
	.string	"ACS_DARROW NCURSES_ACS('.')"
.LASF102:
	.string	"__SIG_ATOMIC_MIN__ (-__SIG_ATOMIC_MAX__ - 1)"
.LASF124:
	.string	"__UINT_LEAST8_MAX__ 0xff"
.LASF1204:
	.string	"BUTTON1_CLICKED NCURSES_MOUSE_MASK(1, NCURSES_BUTTON_CLICKED)"
.LASF836:
	.string	"WA_ATTRIBUTES A_ATTRIBUTES"
.LASF592:
	.string	"__RLIM64_T_TYPE __UQUAD_TYPE"
.LASF615:
	.string	"__RLIM_T_MATCHES_RLIM64_T 1"
.LASF914:
	.string	"_WRAPPED 0x40"
.LASF279:
	.string	"__FLT64X_HAS_INFINITY__ 1"
.LASF771:
	.string	"_BITS_STDIO_LIM_H 1"
.LASF1313:
	.string	"printw"
.LASF176:
	.string	"__DBL_MAX__ ((double)1.79769313486231570814527423731704357e+308L)"
.LASF1243:
	.string	"TRACE_TPUTS 0x0002"
.LASF1222:
	.string	"BUTTON5_RELEASED NCURSES_MOUSE_MASK(5, NCURSES_BUTTON_RELEASED)"
.LASF551:
	.string	"__GLIBC_USE_IEC_60559_BFP_EXT_C2X"
.LASF1132:
	.string	"KEY_B2 0536"
.LASF492:
	.string	"__attribute_alloc_align__(param) __attribute__ ((__alloc_align__ param))"
.LASF772:
	.string	"L_tmpnam 20"
.LASF887:
	.string	"ACS_BLOCK NCURSES_ACS('0')"
.LASF747:
	.string	"____mbstate_t_defined 1"
.LASF1076:
	.string	"mvinsnstr(y,x,s,n) mvwinsnstr(stdscr,(y),(x),(s),(n))"
.LASF117:
	.string	"__INT_LEAST16_WIDTH__ 16"
.LASF966:
	.string	"gettmode() "
.LASF151:
	.string	"__DEC_EVAL_METHOD__ 2"
.LASF947:
	.string	"A_LOW NCURSES_BITS(1U,19)"
.LASF662:
	.string	"UINT_FAST32_MAX (18446744073709551615UL)"
.LASF886:
	.string	"ACS_LANTERN NCURSES_ACS('i')"
.LASF655:
	.string	"INT_FAST64_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF1183:
	.string	"KEY_SREPLACE 0621"
.LASF295:
	.string	"__DEC64_SUBNORMAL_MIN__ 0.000000000000001E-383DD"
.LASF552:
	.string	"__GLIBC_USE_IEC_60559_BFP_EXT_C2X 0"
.LASF741:
	.string	"NULL ((void *)0)"
.LASF870:
	.string	"ACS_TTEE NCURSES_ACS('w')"
.LASF906:
	.string	"ERR (-1)"
.LASF1221:
	.string	"BUTTON4_TRIPLE_CLICKED NCURSES_MOUSE_MASK(4, NCURSES_TRIPLE_CLICKED)"
.LASF1234:
	.string	"BUTTON_CLICK(e,x) ((e) & NCURSES_MOUSE_MASK(x, 004))"
.LASF475:
	.string	"__glibc_safe_len_cond(__l,__s,__osz) ((__l) <= (__osz) / (__s))"
.LASF873:
	.string	"ACS_PLUS NCURSES_ACS('n')"
.LASF502:
	.string	"__attribute_nonnull__(params) __attribute__ ((__nonnull__ params))"
.LASF513:
	.string	"__va_arg_pack() __builtin_va_arg_pack ()"
.LASF938:
	.string	"A_REVERSE NCURSES_BITS(1U,10)"
.LASF149:
	.string	"__FLT_EVAL_METHOD__ 0"
.LASF690:
	.string	"NCURSES_ENABLE_STDBOOL_H 1"
.LASF434:
	.string	"__USE_POSIX199506 1"
.LASF39:
	.string	"__GNUC_WIDE_EXECUTION_CHARSET_NAME \"UTF-32LE\""
.LASF996:
	.string	"addch(ch) waddch(stdscr,(ch))"
.LASF799:
	.string	"__HAVE_DISTINCT_FLOAT32X 0"
.LASF60:
	.string	"__INT_LEAST64_TYPE__ long int"
.LASF927:
	.string	"NCURSES_SP_FUNCS 20211021"
.LASF437:
	.string	"_ATFILE_SOURCE"
.LASF572:
	.string	"__SLONG32_TYPE int"
.LASF677:
	.string	"WINT_MIN (0u)"
.LASF112:
	.string	"__INT_LEAST8_MAX__ 0x7f"
.LASF593:
	.string	"__BLKCNT_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF409:
	.string	"__USE_DYNAMIC_STACK_SIZE"
.LASF845:
	.string	"WA_INVIS A_INVIS"
.LASF11:
	.string	"__ATOMIC_ACQUIRE 2"
.LASF387:
	.string	"__GLIBC_INTERNAL_STARTING_HEADER_IMPLEMENTATION"
.LASF978:
	.string	"wattron(win,at) wattr_on(win, NCURSES_CAST(attr_t, at), NULL)"
.LASF389:
	.string	"__USE_ISOC11"
.LASF441:
	.string	"__SYSCALL_WORDSIZE 64"
.LASF499:
	.string	"__attribute_deprecated_msg__(msg) __attribute__ ((__deprecated__ (msg)))"
.LASF1293:
	.string	"_delay"
.LASF382:
	.string	"NCURSES_EXPORT_GENERAL_IMPORT "
.LASF254:
	.string	"__FLT32X_MAX_EXP__ 1024"
.LASF626:
	.string	"_BITS_STDINT_UINTN_H 1"
.LASF1032:
	.string	"refresh() wrefresh(stdscr)"
.LASF549:
	.string	"__GLIBC_USE_IEC_60559_BFP_EXT"
.LASF704:
	.string	"NCURSES_WATTR_MACROS 0"
.LASF1198:
	.string	"NCURSES_BUTTON_CLICKED 004L"
.LASF14:
	.string	"__ATOMIC_CONSUME 1"
.LASF348:
	.string	"__MMX_WITH_SSE__ 1"
.LASF166:
	.string	"__FLT_HAS_INFINITY__ 1"
.LASF943:
	.string	"A_INVIS NCURSES_BITS(1U,15)"
.LASF364:
	.string	"__STDC_IEC_559_COMPLEX__ 1"
.LASF979:
	.string	"wattroff(win,at) wattr_off(win, NCURSES_CAST(attr_t, at), NULL)"
.LASF104:
	.string	"__INT8_MAX__ 0x7f"
.LASF200:
	.string	"__LDBL_HAS_QUIET_NAN__ 1"
.LASF595:
	.string	"__FSBLKCNT_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF323:
	.string	"__GCC_HAVE_DWARF2_CFI_ASM 1"
.LASF1061:
	.string	"mvaddchnstr(y,x,str,n) mvwaddchnstr(stdscr,(y),(x),(str),(n))"
.LASF1046:
	.string	"mvwdelch(win,y,x) (wmove((win),(y),(x)) == ERR ? ERR : wdelch(win))"
.LASF561:
	.string	"_BITS_TYPES_H 1"
.LASF636:
	.string	"UINT8_MAX (255)"
.LASF673:
	.string	"SIG_ATOMIC_MAX (2147483647)"
.LASF459:
	.string	"__LEAF_ATTR __attribute__ ((__leaf__))"
.LASF148:
	.string	"__GCC_IEC_559_COMPLEX 2"
.LASF17:
	.string	"__pie__ 2"
.LASF54:
	.string	"__UINT16_TYPE__ short unsigned int"
.LASF427:
	.string	"_POSIX_SOURCE"
.LASF936:
	.string	"A_STANDOUT NCURSES_BITS(1U,8)"
.LASF989:
	.string	"winchstr(w,s) winchnstr(w, s, -1)"
.LASF425:
	.string	"__USE_ISOC95 1"
.LASF531:
	.string	"__glibc_macro_warning(message) __glibc_macro_warning1 (GCC warning message)"
.LASF543:
	.string	"__stub_revoke "
.LASF284:
	.string	"__DEC32_MAX_EXP__ 97"
.LASF726:
	.string	"_T_SIZE_ "
.LASF150:
	.string	"__FLT_EVAL_METHOD_TS_18661_3__ 0"
.LASF909:
	.string	"_ENDLINE 0x02"
.LASF479:
	.string	"__glibc_fortify(f,__l,__s,__osz,...) (__glibc_safe_or_unknown_len (__l, __s, __osz) ? __ ## f ## _alias (__VA_ARGS__) : (__glibc_unsafe_len (__l, __s, __osz) ? __ ## f ## _chk_warn (__VA_ARGS__, __osz) : __ ## f ## _chk (__VA_ARGS__, __osz)))"
.LASF87:
	.string	"__SCHAR_WIDTH__ 8"
.LASF994:
	.string	"COLOR_PAIR(n) (NCURSES_BITS((n), 0) & A_COLOR)"
.LASF774:
	.string	"FILENAME_MAX 4096"
.LASF964:
	.string	"crmode() cbreak()"
.LASF484:
	.string	"__glibc_c99_flexarr_available 1"
.LASF896:
	.string	"ACS_SSBB ACS_LLCORNER"
.LASF340:
	.string	"__k8__ 1"
.LASF992:
	.string	"waddstr(win,str) waddnstr(win,str,-1)"
.LASF20:
	.string	"_LP64 1"
.LASF921:
	.string	"GCC_DEPRECATED"
.LASF133:
	.string	"__INT_FAST8_WIDTH__ 8"
.LASF240:
	.string	"__FLT128_DECIMAL_DIG__ 36"
.LASF460:
	.string	"__THROW __attribute__ ((__nothrow__ __LEAF))"
.LASF1042:
	.string	"mvwaddchstr(win,y,x,str) (wmove((win),(y),(x)) == ERR ? ERR : waddchnstr((win),(str),-1))"
.LASF721:
	.string	"__need_NULL "
.LASF388:
	.string	"_FEATURES_H 1"
.LASF421:
	.string	"_DEFAULT_SOURCE 1"
.LASF1226:
	.string	"BUTTON5_TRIPLE_CLICKED NCURSES_MOUSE_MASK(5, NCURSES_TRIPLE_CLICKED)"
.LASF202:
	.string	"__FLT32_MANT_DIG__ 24"
.LASF1030:
	.string	"instr(s) winstr(stdscr,(s))"
.LASF1165:
	.string	"KEY_SDC 0577"
.LASF522:
	.string	"__LDBL_REDIR1(name,proto,alias) name proto"
.LASF624:
	.string	"__WCHAR_MIN __WCHAR_MIN__"
.LASF301:
	.string	"__DEC128_EPSILON__ 1E-33DL"
.LASF1059:
	.string	"mvwvline(win,y,x,c,n) (wmove((win),(y),(x)) == ERR ? ERR : wvline((win),(c),(n)))"
.LASF496:
	.string	"__attribute_used__ __attribute__ ((__used__))"
.LASF1167:
	.string	"KEY_SELECT 0601"
.LASF969:
	.string	"getcury(win) (NCURSES_OK_ADDR(win) ? (win)->_cury : ERR)"
.LASF1230:
	.string	"REPORT_MOUSE_POSITION NCURSES_MOUSE_MASK(6, 0010L)"
.LASF313:
	.string	"__GCC_ATOMIC_CHAR16_T_LOCK_FREE 2"
.LASF1227:
	.string	"BUTTON_CTRL NCURSES_MOUSE_MASK(6, 0001L)"
.LASF841:
	.string	"WA_BLINK A_BLINK"
.LASF379:
	.string	"NCURSES_WRAPPED_VAR(type,name) extern NCURSES_IMPEXP type NCURSES_PUBLIC_VAR(name)(void)"
.LASF1180:
	.string	"KEY_SPREVIOUS 0616"
.LASF173:
	.string	"__DBL_MAX_EXP__ 1024"
.LASF577:
	.string	"_BITS_TYPESIZES_H 1"
.LASF12:
	.string	"__ATOMIC_RELEASE 3"
.LASF262:
	.string	"__FLT32X_HAS_DENORM__ 1"
.LASF153:
	.string	"__FLT_MANT_DIG__ 24"
.LASF1278:
	.string	"_maxx"
.LASF1277:
	.string	"_maxy"
.LASF813:
	.string	"_STDARG_H "
.LASF840:
	.string	"WA_REVERSE A_REVERSE"
.LASF317:
	.string	"__GCC_ATOMIC_INT_LOCK_FREE 2"
.LASF810:
	.string	"__CFLOAT32X _Complex _Float32x"
.LASF1163:
	.string	"KEY_SCOPY 0575"
.LASF503:
	.string	"__nonnull(params) __attribute_nonnull__ (params)"
.LASF1041:
	.string	"mvwaddchnstr(win,y,x,str,n) (wmove((win),(y),(x)) == ERR ? ERR : waddchnstr((win),(str),(n)))"
.LASF227:
	.string	"__FLT64_MIN__ 2.22507385850720138309023271733240406e-308F64"
.LASF1014:
	.string	"color_set(c,o) wcolor_set(stdscr,(c),(o))"
.LASF935:
	.string	"A_COLOR NCURSES_BITS(((1U) << 8) - 1U,0)"
.LASF1224:
	.string	"BUTTON5_CLICKED NCURSES_MOUSE_MASK(5, NCURSES_BUTTON_CLICKED)"
.LASF1002:
	.string	"attr_off(a,o) wattr_off(stdscr,(a),(o))"
.LASF835:
	.string	"NCURSES_OK_ADDR(p) (0 != NCURSES_CAST(const void *, (p)))"
.LASF1292:
	.string	"_use_keypad"
.LASF1060:
	.string	"mvaddch(y,x,ch) mvwaddch(stdscr,(y),(x),(ch))"
.LASF833:
	.string	"NCURSES_BOOL bool"
.LASF343:
	.string	"__SSE__ 1"
.LASF718:
	.string	"NCURSES_CH_T cchar_t"
.LASF100:
	.string	"__INTMAX_WIDTH__ 64"
.LASF953:
	.string	"getbegyx(win,y,x) (y = getbegy(win), x = getbegx(win))"
.LASF192:
	.string	"__LDBL_DECIMAL_DIG__ 21"
.LASF5:
	.string	"__GNUC__ 11"
.LASF310:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 1"
.LASF711:
	.string	"NCURSES_TPARM_VARARGS"
.LASF613:
	.string	"__OFF_T_MATCHES_OFF64_T 1"
.LASF815:
	.string	"va_start(v,l) __builtin_va_start(v,l)"
.LASF913:
	.string	"_HASMOVED 0x20"
.LASF118:
	.string	"__INT_LEAST32_MAX__ 0x7fffffff"
.LASF915:
	.string	"_NOCHANGE -1"
.LASF1144:
	.string	"KEY_FIND 0552"
.LASF524:
	.string	"__LDBL_REDIR1_NTH(name,proto,alias) name proto __THROW"
.LASF1176:
	.string	"KEY_SMESSAGE 0612"
.LASF661:
	.string	"UINT_FAST16_MAX (18446744073709551615UL)"
.LASF292:
	.string	"__DEC64_MIN__ 1E-383DD"
.LASF1185:
	.string	"KEY_SRSUME 0623"
.LASF318:
	.string	"__GCC_ATOMIC_LONG_LOCK_FREE 2"
.LASF265:
	.string	"__FLT32X_IS_IEC_60559__ 2"
.LASF470:
	.string	"__END_DECLS "
.LASF1079:
	.string	"mvvline(y,x,c,n) mvwvline(stdscr,(y),(x),(c),(n))"
.LASF827:
	.string	"FALSE 0"
.LASF729:
	.string	"_SIZE_T_ "
.LASF1263:
	.string	"RED 3"
.LASF762:
	.string	"_IOFBF 0"
.LASF152:
	.string	"__FLT_RADIX__ 2"
.LASF705:
	.string	"NCURSES_REENTRANT 0"
.LASF1043:
	.string	"mvwaddnstr(win,y,x,str,n) (wmove((win),(y),(x)) == ERR ? ERR : waddnstr((win),(str),(n)))"
.LASF1189:
	.string	"KEY_SUSPEND 0627"
.LASF47:
	.string	"__CHAR32_TYPE__ unsigned int"
.LASF963:
	.string	"saveterm() def_prog_mode()"
.LASF533:
	.string	"__attr_access(x) __attribute__ ((__access__ x))"
.LASF538:
	.string	"__attribute_returns_twice__ __attribute__ ((__returns_twice__))"
.LASF197:
	.string	"__LDBL_DENORM_MIN__ 3.64519953188247460252840593361941982e-4951L"
.LASF1326:
	.string	"width"
.LASF91:
	.string	"__LONG_LONG_WIDTH__ 64"
.LASF1012:
	.string	"clrtobot() wclrtobot(stdscr)"
.LASF16:
	.string	"__PIC__ 2"
.LASF1210:
	.string	"BUTTON2_DOUBLE_CLICKED NCURSES_MOUSE_MASK(2, NCURSES_DOUBLE_CLICKED)"
.LASF385:
	.string	"_STDINT_H 1"
.LASF782:
	.string	"__attr_dealloc_fclose __attr_dealloc (fclose, 1)"
.LASF1007:
	.string	"attrset(at) wattrset(stdscr,(at))"
.LASF802:
	.string	"__HAVE_FLOAT128_UNLIKE_LDBL (__HAVE_DISTINCT_FLOAT128 && __LDBL_MANT_DIG__ != 113)"
.LASF134:
	.string	"__INT_FAST16_MAX__ 0x7fffffffffffffffL"
.LASF319:
	.string	"__GCC_ATOMIC_LLONG_LOCK_FREE 2"
.LASF872:
	.string	"ACS_VLINE NCURSES_ACS('x')"
.LASF956:
	.string	"getsyx(y,x) do { if (newscr) { if (is_leaveok(newscr)) (y) = (x) = -1; else getyx(newscr,(y), (x)); } } while(0)"
.LASF480:
	.ascii	"__glibc_"
	.string	"fortify_n(f,__l,__s,__osz,...) (__glibc_safe_or_unknown_len (__l, __s, __osz) ? __ ## f ## _alias (__VA_ARGS__) : (__glibc_unsafe_len (__l, __s, __osz) ? __ ## f ## _chk_warn (__VA_ARGS__, (__osz) / (__s)) : __ ## f ## _chk (__VA_ARGS__, (__osz) / (__s))))"
.LASF519:
	.string	"__attribute_copy__"
.LASF222:
	.string	"__FLT64_MAX_EXP__ 1024"
.LASF880:
	.string	"ACS_BULLET NCURSES_ACS('~')"
.LASF1181:
	.string	"KEY_SPRINT 0617"
.LASF136:
	.string	"__INT_FAST32_MAX__ 0x7fffffffffffffffL"
.LASF961:
	.string	"fixterm() reset_prog_mode()"
.LASF1034:
	.string	"setscrreg(t,b) wsetscrreg(stdscr,(t),(b))"
.LASF1307:
	.string	"_pad_top"
.LASF463:
	.string	"__NTHNL(fct) __attribute__ ((__nothrow__)) fct"
.LASF45:
	.string	"__UINTMAX_TYPE__ long unsigned int"
.LASF93:
	.string	"__WINT_WIDTH__ 32"
.LASF709:
	.string	"NCURSES_SIZE_T"
.LASF30:
	.string	"__CHAR_BIT__ 8"
.LASF500:
	.string	"__attribute_format_arg__(x) __attribute__ ((__format_arg__ (x)))"
.LASF327:
	.string	"__SIZEOF_WCHAR_T__ 4"
.LASF132:
	.string	"__INT_FAST8_MAX__ 0x7f"
.LASF518:
	.string	"__attribute_nonstring__ __attribute__ ((__nonstring__))"
.LASF82:
	.string	"__WCHAR_MIN__ (-__WCHAR_MAX__ - 1)"
.LASF1050:
	.string	"mvwhline(win,y,x,c,n) (wmove((win),(y),(x)) == ERR ? ERR : whline((win),(c),(n)))"
.LASF454:
	.string	"__PMT"
.LASF822:
	.string	"_VA_LIST_T_H "
.LASF325:
	.string	"__SSP_STRONG__ 3"
.LASF331:
	.string	"__amd64__ 1"
.LASF788:
	.string	"__f128(x) x ##f128"
.LASF142:
	.string	"__UINT_FAST32_MAX__ 0xffffffffffffffffUL"
.LASF599:
	.string	"__ID_T_TYPE __U32_TYPE"
.LASF438:
	.string	"_ATFILE_SOURCE 1"
.LASF1201:
	.string	"NCURSES_RESERVED_EVENT 040L"
.LASF568:
	.string	"__SQUAD_TYPE long int"
.LASF775:
	.string	"L_ctermid 9"
.LASF35:
	.string	"__BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__"
.LASF119:
	.string	"__INT32_C(c) c"
.LASF258:
	.string	"__FLT32X_NORM_MAX__ 1.79769313486231570814527423731704357e+308F32x"
.LASF952:
	.string	"getyx(win,y,x) (y = getcury(win), x = getcurx(win))"
.LASF42:
	.string	"__WCHAR_TYPE__ int"
.LASF1024:
	.string	"innstr(s,n) winnstr(stdscr,(s),(n))"
.LASF74:
	.string	"__UINTPTR_TYPE__ long unsigned int"
.LASF411:
	.string	"__USE_FORTIFY_LEVEL"
.LASF535:
	.string	"__attr_access_none(argno) __attribute__ ((__access__ (__none__, argno)))"
.LASF368:
	.string	"CURSES 1"
.LASF766:
	.string	"EOF (-1)"
.LASF304:
	.string	"__USER_LABEL_PREFIX__ "
.LASF468:
	.string	"__ptr_t void *"
.LASF43:
	.string	"__WINT_TYPE__ unsigned int"
.LASF1233:
	.string	"BUTTON_PRESS(e,x) ((e) & NCURSES_MOUSE_MASK(x, 002))"
.LASF277:
	.string	"__FLT64X_DENORM_MIN__ 3.64519953188247460252840593361941982e-4951F64x"
.LASF1029:
	.string	"insstr(s) winsstr(stdscr,(s))"
.LASF339:
	.string	"__k8 1"
.LASF757:
	.string	"__ferror_unlocked_body(_fp) (((_fp)->_flags & _IO_ERR_SEEN) != 0)"
.LASF1258:
	.string	"NCURSES_UNCTRL_H_incl 1"
.LASF632:
	.string	"INT8_MAX (127)"
.LASF794:
	.string	"__HAVE_FLOAT32X 1"
.LASF784:
	.string	"__HAVE_FLOAT128 1"
.LASF473:
	.string	"__glibc_objsize0(__o) __bos0 (__o)"
.LASF1143:
	.string	"KEY_EXIT 0551"
.LASF824:
	.string	"TRUE"
.LASF63:
	.string	"__UINT_LEAST32_TYPE__ unsigned int"
.LASF1267:
	.string	"unsigned int"
.LASF67:
	.string	"__INT_FAST32_TYPE__ long int"
.LASF748:
	.string	"_____fpos64_t_defined 1"
.LASF155:
	.string	"__FLT_MIN_EXP__ (-125)"
.LASF232:
	.string	"__FLT64_HAS_QUIET_NAN__ 1"
.LASF455:
	.string	"__glibc_has_attribute(attr) __has_attribute (attr)"
.LASF863:
	.string	"ACS_ULCORNER NCURSES_ACS('l')"
.LASF926:
	.string	"NCURSES_SP_FUNCS"
.LASF1214:
	.string	"BUTTON3_CLICKED NCURSES_MOUSE_MASK(3, NCURSES_BUTTON_CLICKED)"
.LASF1315:
	.string	"init_pair"
.LASF407:
	.string	"__USE_MISC"
.LASF257:
	.string	"__FLT32X_MAX__ 1.79769313486231570814527423731704357e+308F32x"
.LASF230:
	.string	"__FLT64_HAS_DENORM__ 1"
.LASF154:
	.string	"__FLT_DIG__ 6"
.LASF828:
	.string	"_STDBOOL_H "
.LASF1288:
	.string	"_idlok"
.LASF363:
	.string	"__STDC_IEC_60559_BFP__ 201404L"
.LASF435:
	.string	"__USE_XOPEN2K 1"
.LASF423:
	.string	"__USE_ISOC11 1"
.LASF1336:
	.string	"init_gui"
.LASF1318:
	.string	"scrollok"
.LASF160:
	.string	"__FLT_MAX__ 3.40282346638528859811704183484516925e+38F"
.LASF76:
	.string	"__SCHAR_MAX__ 0x7f"
.LASF244:
	.string	"__FLT128_EPSILON__ 1.92592994438723585305597794258492732e-34F128"
.LASF565:
	.string	"__U32_TYPE unsigned int"
.LASF374:
	.string	"NCURSES_VERSION \"6.3\""
.LASF987:
	.string	"vline(ch,n) wvline(stdscr, ch, (n))"
.LASF90:
	.string	"__LONG_WIDTH__ 64"
.LASF491:
	.string	"__attribute_alloc_size__(params) __attribute__ ((__alloc_size__ params))"
.LASF838:
	.string	"WA_STANDOUT A_STANDOUT"
.LASF239:
	.string	"__FLT128_MAX_10_EXP__ 4932"
.LASF251:
	.string	"__FLT32X_DIG__ 15"
.LASF147:
	.string	"__GCC_IEC_559 2"
.LASF1073:
	.string	"mvinchstr(y,x,s) mvwinchstr(stdscr,(y),(x),(s))"
.LASF495:
	.string	"__attribute_maybe_unused__ __attribute__ ((__unused__))"
.LASF1068:
	.string	"mvgetnstr(y,x,str,n) mvwgetnstr(stdscr,(y),(x),(str),(n))"
.LASF517:
	.string	"__glibc_likely(cond) __builtin_expect ((cond), 1)"
.LASF542:
	.string	"__stub_gtty "
.LASF0:
	.string	"__STDC__ 1"
.LASF647:
	.string	"INT_LEAST64_MAX (__INT64_C(9223372036854775807))"
.LASF329:
	.string	"__SIZEOF_PTRDIFF_T__ 8"
.LASF602:
	.string	"__USECONDS_T_TYPE __U32_TYPE"
.LASF640:
	.string	"INT_LEAST8_MIN (-128)"
.LASF36:
	.string	"__FLOAT_WORD_ORDER__ __ORDER_LITTLE_ENDIAN__"
.LASF907:
	.string	"OK (0)"
.LASF1261:
	.string	"WHITE 1"
.LASF53:
	.string	"__UINT8_TYPE__ unsigned char"
.LASF559:
	.string	"__GLIBC_USE_IEC_60559_TYPES_EXT"
.LASF734:
	.string	"_SIZE_T_DECLARED "
.LASF506:
	.string	"__wur "
.LASF342:
	.string	"__MMX__ 1"
.LASF1208:
	.string	"BUTTON2_PRESSED NCURSES_MOUSE_MASK(2, NCURSES_BUTTON_PRESSED)"
.LASF370:
	.string	"NCURSES_VERSION_MAJOR 6"
.LASF24:
	.string	"__SIZEOF_LONG_LONG__ 8"
.LASF831:
	.string	"false 0"
.LASF88:
	.string	"__SHRT_WIDTH__ 16"
.LASF1104:
	.string	"KEY_DOWN 0402"
.LASF1327:
	.string	"total"
.LASF296:
	.string	"__DEC128_MANT_DIG__ 34"
.LASF1281:
	.string	"_flags"
.LASF900:
	.string	"ACS_SSSB ACS_LTEE"
.LASF830:
	.string	"true 1"
.LASF571:
	.string	"__UWORD_TYPE unsigned long int"
.LASF341:
	.string	"__code_model_small__ 1"
.LASF617:
	.string	"__KERNEL_OLD_TIMEVAL_MATCHES_TIMEVAL64 1"
.LASF449:
	.string	"__GNU_LIBRARY__ 6"
.LASF581:
	.string	"__UID_T_TYPE __U32_TYPE"
.LASF252:
	.string	"__FLT32X_MIN_EXP__ (-1021)"
.LASF1038:
	.string	"wdeleteln(win) winsdelln(win,-1)"
.LASF1039:
	.string	"winsertln(win) winsdelln(win,1)"
.LASF312:
	.string	"__GCC_ATOMIC_CHAR_LOCK_FREE 2"
.LASF590:
	.string	"__PID_T_TYPE __S32_TYPE"
.LASF461:
	.string	"__THROWNL __attribute__ ((__nothrow__))"
.LASF523:
	.string	"__LDBL_REDIR(name,proto) name proto"
.LASF106:
	.string	"__INT32_MAX__ 0x7fffffff"
.LASF467:
	.string	"__STRING(x) #x"
.LASF998:
	.string	"addchstr(str) waddchstr(stdscr,(str))"
.LASF965:
	.string	"nocrmode() nocbreak()"
.LASF520:
	.string	"__attribute_copy__(arg) __attribute__ ((__copy__ (arg)))"
.LASF801:
	.string	"__HAVE_DISTINCT_FLOAT128X __HAVE_FLOAT128X"
.LASF1212:
	.string	"BUTTON3_RELEASED NCURSES_MOUSE_MASK(3, NCURSES_BUTTON_RELEASED)"
.LASF179:
	.string	"__DBL_EPSILON__ ((double)2.22044604925031308084726333618164062e-16L)"
.LASF205:
	.string	"__FLT32_MIN_10_EXP__ (-37)"
.LASF735:
	.string	"___int_size_t_h "
.LASF962:
	.string	"resetterm() reset_shell_mode()"
.LASF795:
	.string	"__HAVE_FLOAT128X 0"
.LASF859:
	.string	"COLOR_MAGENTA 5"
.LASF164:
	.string	"__FLT_DENORM_MIN__ 1.40129846432481707092372958328991613e-45F"
.LASF812:
	.string	"NCURSES_WIDECHAR 0"
.LASF282:
	.string	"__DEC32_MANT_DIG__ 7"
.LASF733:
	.string	"_BSD_SIZE_T_DEFINED_ "
.LASF970:
	.string	"getbegx(win) (NCURSES_OK_ADDR(win) ? (win)->_begx : ERR)"
.LASF1137:
	.string	"KEY_CANCEL 0543"
.LASF1108:
	.string	"KEY_HOME 0406"
.LASF834:
	.string	"NCURSES_CAST(type,value) (type)(value)"
.LASF527:
	.string	"__LDBL_REDIR_DECL(name) "
.LASF1272:
	.string	"char"
.LASF462:
	.string	"__NTH(fct) __attribute__ ((__nothrow__ __LEAF)) fct"
.LASF529:
	.string	"__REDIRECT_NTH_LDBL(name,proto,alias) __REDIRECT_NTH (name, proto, alias)"
.LASF724:
	.string	"_SIZE_T "
.LASF1253:
	.string	"TRACE_CCALLS 0x0400"
.LASF763:
	.string	"_IOLBF 1"
.LASF826:
	.string	"FALSE"
.LASF1236:
	.string	"BUTTON_TRIPLE_CLICK(e,x) ((e) & NCURSES_MOUSE_MASK(x, 020))"
.LASF899:
	.string	"ACS_SBSS ACS_RTEE"
.LASF931:
	.string	"NCURSES_BITS(mask,shift) (NCURSES_CAST(chtype,(mask)) << ((shift) + NCURSES_ATTR_SHIFT))"
.LASF959:
	.string	"getnstr(s,n) wgetnstr(stdscr, s, (n))"
.LASF668:
	.string	"INTMAX_MAX (__INT64_C(9223372036854775807))"
.LASF764:
	.string	"_IONBF 2"
.LASF642:
	.string	"INT_LEAST32_MIN (-2147483647-1)"
.LASF80:
	.string	"__LONG_LONG_MAX__ 0x7fffffffffffffffLL"
.LASF982:
	.string	"touchline(win,s,c) wtouchln((win), s, c, 1)"
.LASF749:
	.string	"____FILE_defined 1"
.LASF1321:
	.string	"cbreak"
.LASF991:
	.string	"redrawwin(win) wredrawln(win, 0, (NCURSES_OK_ADDR(win) ? (win)->_maxy+1 : -1))"
.LASF891:
	.string	"ACS_GEQUAL NCURSES_ACS('z')"
.LASF847:
	.string	"WA_HORIZONTAL A_HORIZONTAL"
.LASF1158:
	.string	"KEY_RESUME 0570"
.LASF1314:
	.string	"wgetch"
.LASF639:
	.string	"UINT64_MAX (__UINT64_C(18446744073709551615))"
.LASF1240:
	.string	"_tracech_t2 _tracechtype2"
.LASF280:
	.string	"__FLT64X_HAS_QUIET_NAN__ 1"
.LASF235:
	.string	"__FLT128_DIG__ 33"
.LASF113:
	.string	"__INT8_C(c) c"
.LASF209:
	.string	"__FLT32_MAX__ 3.40282346638528859811704183484516925e+38F32"
.LASF1266:
	.string	"short unsigned int"
.LASF932:
	.string	"A_NORMAL (1U - 1U)"
.LASF171:
	.string	"__DBL_MIN_EXP__ (-1021)"
.LASF728:
	.string	"__SIZE_T "
.LASF1003:
	.string	"attr_on(a,o) wattr_on(stdscr,(a),(o))"
.LASF51:
	.string	"__INT32_TYPE__ int"
.LASF1138:
	.string	"KEY_CLOSE 0544"
.LASF1114:
	.string	"KEY_DC 0512"
.LASF289:
	.string	"__DEC64_MANT_DIG__ 16"
.LASF314:
	.string	"__GCC_ATOMIC_CHAR32_T_LOCK_FREE 2"
.LASF610:
	.string	"__FSID_T_TYPE struct { int __val[2]; }"
.LASF391:
	.string	"__USE_ISOC95"
.LASF403:
	.string	"__USE_XOPEN2K8XSI"
.LASF670:
	.string	"PTRDIFF_MIN (-9223372036854775807L-1)"
.LASF390:
	.string	"__USE_ISOC99"
.LASF1008:
	.string	"bkgd(ch) wbkgd(stdscr,(ch))"
.LASF1006:
	.string	"attron(at) wattron(stdscr,(at))"
.LASF1145:
	.string	"KEY_HELP 0553"
.LASF1142:
	.string	"KEY_END 0550"
.LASF1232:
	.string	"BUTTON_RELEASE(e,x) ((e) & NCURSES_MOUSE_MASK(x, 001))"
.LASF696:
	.string	"NCURSES_COLOR_T"
.LASF398:
	.string	"__USE_XOPEN_EXTENDED"
.LASF855:
	.string	"COLOR_RED 1"
.LASF1087:
	.string	"is_keypad(win) (NCURSES_OK_ADDR(win) ? (win)->_use_keypad : FALSE)"
.LASF787:
	.string	"__HAVE_FLOAT64X_LONG_DOUBLE 1"
.LASF198:
	.string	"__LDBL_HAS_DENORM__ 1"
.LASF322:
	.string	"__HAVE_SPECULATION_SAFE_VALUE 1"
.LASF876:
	.string	"ACS_DIAMOND NCURSES_ACS('`')"
.LASF309:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 1"
.LASF918:
	.string	"GCC_SCANFLIKE(fmt,var) __attribute__((format(scanf,fmt,var)))"
.LASF259:
	.string	"__FLT32X_MIN__ 2.22507385850720138309023271733240406e-308F32x"
.LASF375:
	.string	"NCURSES_MOUSE_VERSION 2"
.LASF469:
	.string	"__BEGIN_DECLS "
.LASF1285:
	.string	"_clear"
.LASF1188:
	.string	"KEY_SUNDO 0626"
.LASF713:
	.string	"NCURSES_TPARM_ARG"
.LASF651:
	.string	"UINT_LEAST64_MAX (__UINT64_C(18446744073709551615))"
.LASF719:
	.string	"_STDIO_H 1"
.LASF1175:
	.string	"KEY_SLEFT 0611"
.LASF1169:
	.string	"KEY_SEOL 0603"
.LASF247:
	.string	"__FLT128_HAS_INFINITY__ 1"
.LASF627:
	.string	"__intptr_t_defined "
.LASF942:
	.string	"A_ALTCHARSET NCURSES_BITS(1U,14)"
.LASF233:
	.string	"__FLT64_IS_IEC_60559__ 2"
.LASF32:
	.string	"__ORDER_LITTLE_ENDIAN__ 1234"
.LASF877:
	.string	"ACS_CKBOARD NCURSES_ACS('a')"
.LASF609:
	.string	"__BLKSIZE_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF266:
	.string	"__FLT64X_MANT_DIG__ 64"
.LASF975:
	.string	"getpary(win) (NCURSES_OK_ADDR(win) ? (win)->_pary : ERR)"
.LASF1124:
	.string	"KEY_STAB 0524"
.LASF96:
	.string	"__INTMAX_MAX__ 0x7fffffffffffffffL"
.LASF768:
	.string	"SEEK_CUR 1"
.LASF77:
	.string	"__SHRT_MAX__ 0x7fff"
.LASF201:
	.string	"__LDBL_IS_IEC_60559__ 2"
.LASF392:
	.string	"__USE_ISOCXX11"
.LASF732:
	.string	"_SIZE_T_DEFINED "
.LASF83:
	.string	"__WINT_MAX__ 0xffffffffU"
.LASF761:
	.string	"__ssize_t_defined "
.LASF908:
	.string	"_SUBWIN 0x01"
.LASF575:
	.string	"__U64_TYPE unsigned long int"
.LASF714:
	.string	"NCURSES_TPARM_ARG intptr_t"
.LASF273:
	.string	"__FLT64X_MAX__ 1.18973149535723176502126385303097021e+4932F64x"
.LASF1065:
	.string	"mvchgat(y,x,n,a,c,o) mvwchgat(stdscr,(y),(x),(n),(a),(c),(o))"
.LASF73:
	.string	"__INTPTR_TYPE__ long int"
.LASF1237:
	.string	"BUTTON_RESERVED_EVENT(e,x) ((e) & NCURSES_MOUSE_MASK(x, 040))"
.LASF817:
	.string	"va_arg(v,l) __builtin_va_arg(v,l)"
.LASF1268:
	.string	"long unsigned int"
.LASF430:
	.string	"_POSIX_C_SOURCE 200809L"
.LASF1225:
	.string	"BUTTON5_DOUBLE_CLICKED NCURSES_MOUSE_MASK(5, NCURSES_DOUBLE_CLICKED)"
.LASF1070:
	.string	"mvhline(y,x,c,n) mvwhline(stdscr,(y),(x),(c),(n))"
.LASF62:
	.string	"__UINT_LEAST16_TYPE__ short unsigned int"
.LASF1112:
	.string	"KEY_DL 0510"
.LASF1155:
	.string	"KEY_REFRESH 0565"
.LASF46:
	.string	"__CHAR16_TYPE__ short unsigned int"
.LASF281:
	.string	"__FLT64X_IS_IEC_60559__ 2"
.LASF1157:
	.string	"KEY_RESTART 0567"
.LASF414:
	.string	"__GLIBC_USE_DEPRECATED_GETS"
.LASF396:
	.string	"__USE_POSIX199506"
.LASF999:
	.string	"addnstr(str,n) waddnstr(stdscr,(str),(n))"
.LASF681:
	.string	"INT32_C(c) c"
.LASF798:
	.string	"__HAVE_DISTINCT_FLOAT64 0"
.LASF144:
	.string	"__INTPTR_MAX__ 0x7fffffffffffffffL"
.LASF19:
	.string	"__FINITE_MATH_ONLY__ 0"
.LASF1262:
	.string	"BLUE 2"
.LASF686:
	.string	"UINT64_C(c) c ## UL"
.LASF1319:
	.string	"nodelay"
.LASF818:
	.string	"va_copy(d,s) __builtin_va_copy(d,s)"
.LASF769:
	.string	"SEEK_END 2"
.LASF345:
	.string	"__FXSR__ 1"
.LASF1092:
	.string	"is_scrollok(win) (NCURSES_OK_ADDR(win) ? (win)->_scroll : FALSE)"
.LASF924:
	.string	"NCURSES_EXT_FUNCS"
.LASF439:
	.string	"__WORDSIZE 64"
.LASF738:
	.string	"__size_t "
.LASF1049:
	.string	"mvwgetstr(win,y,x,str) (wmove((win),(y),(x)) == ERR ? ERR : wgetstr((win),(str)))"
.LASF814:
	.string	"_ANSI_STDARG_H_ "
.LASF326:
	.string	"__SIZEOF_INT128__ 16"
.LASF15:
	.string	"__pic__ 2"
.LASF546:
	.string	"__stub_stty "
.LASF1316:
	.string	"start_color"
.LASF1192:
	.string	"KEY_RESIZE 0632"
.LASF41:
	.string	"__PTRDIFF_TYPE__ long int"
.LASF422:
	.string	"__GLIBC_USE_ISOC2X 0"
.LASF288:
	.string	"__DEC32_SUBNORMAL_MIN__ 0.000001E-95DF"
.LASF481:
	.string	"__warnattr(msg) __attribute__((__warning__ (msg)))"
.LASF1168:
	.string	"KEY_SEND 0602"
.LASF121:
	.string	"__INT_LEAST64_MAX__ 0x7fffffffffffffffL"
.LASF574:
	.string	"__S64_TYPE long int"
.LASF951:
	.string	"A_ITALIC NCURSES_BITS(1U,23)"
.LASF534:
	.string	"__fortified_attr_access(a,o,s) __attr_access ((a, o, s))"
.LASF797:
	.string	"__HAVE_DISTINCT_FLOAT32 0"
.LASF730:
	.string	"_BSD_SIZE_T_ "
.LASF472:
	.string	"__bos0(ptr) __builtin_object_size (ptr, 0)"
.LASF742:
	.string	"__need_NULL"
.LASF688:
	.string	"UINTMAX_C(c) c ## UL"
.LASF1200:
	.string	"NCURSES_TRIPLE_CLICKED 020L"
.LASF1295:
	.string	"_regtop"
.LASF1078:
	.string	"mvinstr(y,x,s) mvwinstr(stdscr,(y),(x),(s))"
.LASF1005:
	.string	"attroff(at) wattroff(stdscr,(at))"
.LASF1028:
	.string	"insnstr(s,n) winsnstr(stdscr,(s),(n))"
.LASF564:
	.string	"__S32_TYPE int"
.LASF819:
	.string	"__va_copy(d,s) __builtin_va_copy(d,s)"
.LASF1197:
	.string	"NCURSES_BUTTON_PRESSED 002L"
.LASF86:
	.string	"__SIZE_MAX__ 0xffffffffffffffffUL"
.LASF934:
	.string	"A_CHARTEXT (NCURSES_BITS(1U,0) - 1U)"
.LASF1330:
	.string	"/home/jscha/dvp/cpumon/src/guilib.c"
.LASF1080:
	.string	"getbkgd(win) (NCURSES_OK_ADDR(win) ? ((win)->_bkgd) : 0)"
.LASF1011:
	.string	"clear() wclear(stdscr)"
.LASF1186:
	.string	"KEY_SSAVE 0624"
.LASF1072:
	.string	"mvinchnstr(y,x,s,n) mvwinchnstr(stdscr,(y),(x),(s),(n))"
.LASF131:
	.string	"__UINT64_C(c) c ## UL"
.LASF1121:
	.string	"KEY_SR 0521"
.LASF676:
	.string	"WCHAR_MAX __WCHAR_MAX"
.LASF862:
	.string	"NCURSES_ACS(c) (acs_map[NCURSES_CAST(unsigned char,(c))])"
.LASF1153:
	.string	"KEY_REDO 0563"
.LASF48:
	.string	"__SIG_ATOMIC_TYPE__ int"
.LASF944:
	.string	"A_PROTECT NCURSES_BITS(1U,16)"
.LASF622:
	.string	"_BITS_WCHAR_H 1"
.LASF1031:
	.string	"move(y,x) wmove(stdscr,(y),(x))"
.LASF1257:
	.string	"TRACE_MAXIMUM ((1 << TRACE_SHIFT) - 1)"
.LASF168:
	.string	"__FLT_IS_IEC_60559__ 2"
.LASF1309:
	.string	"_pad_bottom"
.LASF1289:
	.string	"_idcok"
.LASF1075:
	.string	"mvinsch(y,x,c) mvwinsch(stdscr,(y),(x),(c))"
.LASF941:
	.string	"A_BOLD NCURSES_BITS(1U,13)"
.LASF444:
	.string	"__USE_ATFILE 1"
.LASF178:
	.string	"__DBL_MIN__ ((double)2.22507385850720138309023271733240406e-308L)"
.LASF783:
	.string	"_BITS_FLOATN_H "
.LASF275:
	.string	"__FLT64X_MIN__ 3.36210314311209350626267781732175260e-4932F64x"
.LASF760:
	.string	"__off_t_defined "
.LASF1291:
	.string	"_sync"
.LASF1218:
	.string	"BUTTON4_PRESSED NCURSES_MOUSE_MASK(4, NCURSES_BUTTON_PRESSED)"
.LASF1333:
	.string	"stdscr"
.LASF1139:
	.string	"KEY_COMMAND 0545"
.LASF276:
	.string	"__FLT64X_EPSILON__ 1.08420217248550443400745280086994171e-19F64x"
.LASF6:
	.string	"__GNUC_MINOR__ 4"
.LASF188:
	.string	"__LDBL_MIN_10_EXP__ (-4931)"
.LASF630:
	.string	"INT32_MIN (-2147483647-1)"
.LASF1141:
	.string	"KEY_CREATE 0547"
.LASF1297:
	.string	"_parx"
.LASF1298:
	.string	"_pary"
.LASF1170:
	.string	"KEY_SEXIT 0604"
.LASF786:
	.string	"__HAVE_FLOAT64X 1"
.LASF260:
	.string	"__FLT32X_EPSILON__ 2.22044604925031308084726333618164062e-16F32x"
.LASF861:
	.string	"COLOR_WHITE 7"
.LASF540:
	.string	"__stub_chflags "
.LASF755:
	.string	"__feof_unlocked_body(_fp) (((_fp)->_flags & _IO_EOF_SEEN) != 0)"
.LASF1017:
	.string	"echochar(c) wechochar(stdscr,(c))"
.LASF410:
	.string	"__USE_GNU"
.LASF737:
	.string	"_SIZET_ "
.LASF608:
	.string	"__TIMER_T_TYPE void *"
.LASF183:
	.string	"__DBL_HAS_QUIET_NAN__ 1"
.LASF1129:
	.string	"KEY_LL 0533"
.LASF1056:
	.string	"mvwinsnstr(win,y,x,s,n) (wmove((win),(y),(x)) == ERR ? ERR : winsnstr((win),(s),(n)))"
.LASF694:
	.string	"NCURSES_INLINE"
.LASF1193:
	.string	"KEY_MAX 0777"
.LASF1159:
	.string	"KEY_SAVE 0571"
.LASF1122:
	.string	"KEY_NPAGE 0522"
.LASF344:
	.string	"__SSE2__ 1"
.LASF245:
	.string	"__FLT128_DENORM_MIN__ 6.47517511943802511092443895822764655e-4966F128"
.LASF601:
	.string	"__TIME_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF1057:
	.string	"mvwinsstr(win,y,x,s) (wmove((win),(y),(x)) == ERR ? ERR : winsstr((win),(s)))"
.LASF528:
	.string	"__REDIRECT_LDBL(name,proto,alias) __REDIRECT (name, proto, alias)"
.LASF466:
	.string	"__CONCAT(x,y) x ## y"
.LASF511:
	.string	"__extern_always_inline extern __always_inline __attribute__ ((__gnu_inline__))"
.LASF303:
	.string	"__REGISTER_PREFIX__ "
.LASF648:
	.string	"UINT_LEAST8_MAX (255)"
.LASF170:
	.string	"__DBL_DIG__ 15"
.LASF804:
	.string	"__f32(x) x ##f32"
.LASF1023:
	.string	"inchstr(s) winchstr(stdscr,(s))"
.LASF501:
	.string	"__attribute_format_strfmon__(a,b) __attribute__ ((__format__ (__strfmon__, a, b)))"
.LASF1097:
	.string	"wgetscrreg(win,t,b) (NCURSES_OK_ADDR(win) ? (*(t) = (win)->_regtop, *(b) = (win)->_regbottom, OK) : ERR)"
.LASF1062:
	.string	"mvaddchstr(y,x,str) mvwaddchstr(stdscr,(y),(x),(str))"
.LASF29:
	.string	"__SIZEOF_SIZE_T__ 8"
.LASF1162:
	.string	"KEY_SCOMMAND 0574"
.LASF660:
	.string	"UINT_FAST8_MAX (255)"
.LASF228:
	.string	"__FLT64_EPSILON__ 2.22044604925031308084726333618164062e-16F64"
.LASF904:
	.string	"ACS_SBSB ACS_VLINE"
.LASF1013:
	.string	"clrtoeol() wclrtoeol(stdscr)"
.LASF350:
	.string	"__SEG_GS 1"
.LASF1322:
	.string	"initscr"
.LASF1202:
	.string	"BUTTON1_RELEASED NCURSES_MOUSE_MASK(1, NCURSES_BUTTON_RELEASED)"
.LASF111:
	.string	"__UINT64_MAX__ 0xffffffffffffffffUL"
.LASF604:
	.string	"__SUSECONDS64_T_TYPE __SQUAD_TYPE"
.LASF776:
	.string	"FOPEN_MAX"
.LASF443:
	.string	"__USE_MISC 1"
.LASF337:
	.string	"__ATOMIC_HLE_RELEASE 131072"
.LASF1229:
	.string	"BUTTON_ALT NCURSES_MOUSE_MASK(6, 0004L)"
.LASF69:
	.string	"__UINT_FAST8_TYPE__ unsigned char"
.LASF849:
	.string	"WA_LOW A_LOW"
.LASF1058:
	.string	"mvwinstr(win,y,x,s) (wmove((win),(y),(x)) == ERR ? ERR : winstr((win),(s)))"
.LASF334:
	.string	"__SIZEOF_FLOAT80__ 16"
.LASF346:
	.string	"__SSE_MATH__ 1"
.LASF1270:
	.string	"short int"
.LASF453:
	.string	"_SYS_CDEFS_H 1"
.LASF858:
	.string	"COLOR_BLUE 4"
.LASF376:
	.string	"NCURSES_DLL_H_incl 1"
.LASF127:
	.string	"__UINT16_C(c) c"
.LASF698:
	.string	"NCURSES_PAIRS_T"
.LASF419:
	.string	"__GLIBC_USE(F) __GLIBC_USE_ ## F"
.LASF514:
	.string	"__va_arg_pack_len() __builtin_va_arg_pack_len ()"
.LASF306:
	.string	"__NO_INLINE__ 1"
.LASF1127:
	.string	"KEY_ENTER 0527"
.LASF1329:
	.string	"GNU C17 11.4.0 -masm=intel -mtune=generic -march=x86-64 -g -g -ggdb3 -gdwarf-2 -O0 -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection"
.LASF270:
	.string	"__FLT64X_MAX_EXP__ 16384"
.LASF9:
	.string	"__ATOMIC_RELAXED 0"
.LASF489:
	.string	"__ASMNAME2(prefix,cname) __STRING (prefix) cname"
.LASF1136:
	.string	"KEY_BEG 0542"
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
.LASF1146:
	.string	"KEY_MARK 0554"
.LASF66:
	.string	"__INT_FAST16_TYPE__ long int"
.LASF526:
	.string	"__LDBL_REDIR2_DECL(name) "
.LASF878:
	.string	"ACS_DEGREE NCURSES_ACS('f')"
.LASF569:
	.string	"__UQUAD_TYPE unsigned long int"
.LASF26:
	.string	"__SIZEOF_FLOAT__ 4"
.LASF554:
	.string	"__GLIBC_USE_IEC_60559_EXT 0"
.LASF367:
	.string	"__NCURSES_H "
.LASF1306:
	.string	"_pad_x"
.LASF1305:
	.string	"_pad_y"
.LASF175:
	.string	"__DBL_DECIMAL_DIG__ 17"
.LASF1239:
	.string	"_tracech_t _tracechtype"
.LASF537:
	.string	"__attr_dealloc_free __attr_dealloc (__builtin_free, 1)"
.LASF851:
	.string	"WA_TOP A_TOP"
.LASF487:
	.string	"__REDIRECT_NTHNL(name,proto,alias) name proto __asm__ (__ASMNAME (#alias)) __THROWNL"
.LASF874:
	.string	"ACS_S1 NCURSES_ACS('o')"
.LASF1274:
	.string	"WINDOW"
.LASF59:
	.string	"__INT_LEAST32_TYPE__ int"
.LASF586:
	.string	"__NLINK_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF1083:
	.string	"is_cleared(win) (NCURSES_OK_ADDR(win) ? (win)->_clear : FALSE)"
.LASF1242:
	.string	"TRACE_TIMES 0x0001"
.LASF177:
	.string	"__DBL_NORM_MAX__ ((double)1.79769313486231570814527423731704357e+308L)"
.LASF1184:
	.string	"KEY_SRIGHT 0622"
.LASF105:
	.string	"__INT16_MAX__ 0x7fff"
.LASF490:
	.string	"__attribute_malloc__ __attribute__ ((__malloc__))"
.LASF570:
	.string	"__SWORD_TYPE long int"
.LASF1140:
	.string	"KEY_COPY 0546"
.LASF89:
	.string	"__INT_WIDTH__ 32"
.LASF1300:
	.string	"_pad"
.LASF498:
	.string	"__attribute_deprecated__ __attribute__ ((__deprecated__))"
.LASF1106:
	.string	"KEY_LEFT 0404"
.LASF234:
	.string	"__FLT128_MANT_DIG__ 113"
.LASF583:
	.string	"__INO_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF431:
	.string	"__USE_POSIX 1"
.LASF929:
	.string	"NCURSES_SP_OUTC NCURSES_SP_NAME(NCURSES_OUTC)"
.LASF669:
	.string	"UINTMAX_MAX (__UINT64_C(18446744073709551615))"
.LASF666:
	.string	"UINTPTR_MAX (18446744073709551615UL)"
.LASF103:
	.string	"__SIG_ATOMIC_WIDTH__ 32"
.LASF781:
	.string	"__attr_dealloc_fclose"
.LASF708:
	.string	"NCURSES_INTEROP_FUNCS 1"
.LASF536:
	.string	"__attr_dealloc(dealloc,argno) __attribute__ ((__malloc__ (dealloc, argno)))"
.LASF806:
	.string	"__f32x(x) x ##f32x"
.LASF194:
	.string	"__LDBL_NORM_MAX__ 1.18973149535723176502126385303097021e+4932L"
.LASF821:
	.string	"_VA_LIST "
.LASF1171:
	.string	"KEY_SFIND 0605"
.LASF1248:
	.string	"TRACE_CALLS 0x0020"
.LASF562:
	.string	"__S16_TYPE short int"
.LASF328:
	.string	"__SIZEOF_WINT_T__ 4"
.LASF678:
	.string	"WINT_MAX (4294967295u)"
.LASF1089:
	.string	"is_nodelay(win) (NCURSES_OK_ADDR(win) ? ((win)->_delay == 0) : FALSE)"
.LASF1302:
	.string	"attr_t"
.LASF371:
	.string	"NCURSES_VERSION_MINOR 3"
.LASF1102:
	.string	"KEY_SRESET 0530"
.LASF816:
	.string	"va_end(v) __builtin_va_end(v)"
.LASF505:
	.string	"__attribute_warn_unused_result__ __attribute__ ((__warn_unused_result__))"
.LASF509:
	.string	"__attribute_artificial__ __attribute__ ((__artificial__))"
.LASF214:
	.string	"__FLT32_HAS_DENORM__ 1"
.LASF683:
	.string	"UINT8_C(c) c"
.LASF283:
	.string	"__DEC32_MIN_EXP__ (-94)"
.LASF56:
	.string	"__UINT64_TYPE__ long unsigned int"
.LASF800:
	.string	"__HAVE_DISTINCT_FLOAT64X 0"
.LASF823:
	.string	"__va_list__ "
.LASF373:
	.string	"NCURSES_VERSION"
.LASF274:
	.string	"__FLT64X_NORM_MAX__ 1.18973149535723176502126385303097021e+4932F64x"
.LASF28:
	.string	"__SIZEOF_LONG_DOUBLE__ 16"
.LASF1054:
	.string	"mvwinnstr(win,y,x,s,n) (wmove((win),(y),(x)) == ERR ? ERR : winnstr((win),(s),(n)))"
.LASF1022:
	.string	"inchnstr(s,n) winchnstr(stdscr,(s),(n))"
.LASF525:
	.string	"__LDBL_REDIR_NTH(name,proto) name proto __THROW"
.LASF600:
	.string	"__CLOCK_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF591:
	.string	"__RLIM_T_TYPE __SYSCALL_ULONG_TYPE"
.LASF241:
	.string	"__FLT128_MAX__ 1.18973149535723176508575932662800702e+4932F128"
.LASF631:
	.string	"INT64_MIN (-__INT64_C(9223372036854775807)-1)"
.LASF754:
	.string	"_IO_EOF_SEEN 0x0010"
.LASF901:
	.string	"ACS_SSBS ACS_BTEE"
.LASF897:
	.string	"ACS_BBSS ACS_URCORNER"
.LASF1135:
	.string	"KEY_BTAB 0541"
.LASF420:
	.string	"_DEFAULT_SOURCE"
.LASF225:
	.string	"__FLT64_MAX__ 1.79769313486231570814527423731704357e+308F64"
.LASF710:
	.string	"NCURSES_SIZE_T short"
.LASF246:
	.string	"__FLT128_HAS_DENORM__ 1"
.LASF791:
	.string	"__HAVE_FLOAT16 0"
.LASF865:
	.string	"ACS_URCORNER NCURSES_ACS('k')"
.LASF377:
	.string	"NCURSES_PUBLIC_VAR(name) _nc_ ##name"
.LASF1164:
	.string	"KEY_SCREATE 0576"
.LASF1094:
	.string	"is_syncok(win) (NCURSES_OK_ADDR(win) ? (win)->_sync : FALSE)"
.LASF79:
	.string	"__LONG_MAX__ 0x7fffffffffffffffL"
.LASF990:
	.string	"winsstr(w,s) winsnstr(w, s, -1)"
.LASF22:
	.string	"__SIZEOF_INT__ 4"
.LASF692:
	.string	"NCURSES_CONST"
.LASF646:
	.string	"INT_LEAST32_MAX (2147483647)"
.LASF606:
	.string	"__KEY_T_TYPE __S32_TYPE"
.LASF1120:
	.string	"KEY_SF 0520"
.LASF853:
	.string	"WA_ITALIC A_ITALIC"
.LASF1244:
	.string	"TRACE_UPDATE 0x0004"
.LASF1301:
	.string	"_yoffset"
.LASF580:
	.string	"__DEV_T_TYPE __UQUAD_TYPE"
.LASF654:
	.string	"INT_FAST32_MIN (-9223372036854775807L-1)"
.LASF85:
	.string	"__PTRDIFF_MAX__ 0x7fffffffffffffffL"
.LASF146:
	.string	"__UINTPTR_MAX__ 0xffffffffffffffffUL"
.LASF338:
	.string	"__GCC_ASM_FLAG_OUTPUTS__ 1"
.LASF679:
	.string	"INT8_C(c) c"
.LASF1317:
	.string	"use_default_colors"
.LASF471:
	.string	"__bos(ptr) __builtin_object_size (ptr, __USE_FORTIFY_LEVEL > 1)"
.LASF330:
	.string	"__amd64 1"
.LASF428:
	.string	"_POSIX_SOURCE 1"
.LASF195:
	.string	"__LDBL_MIN__ 3.36210314311209350626267781732175260e-4932L"
.LASF432:
	.string	"__USE_POSIX2 1"
.LASF357:
	.string	"__unix__ 1"
.LASF372:
	.string	"NCURSES_VERSION_PATCH 20211021"
.LASF532:
	.string	"__HAVE_GENERIC_SELECTION 1"
.LASF939:
	.string	"A_BLINK NCURSES_BITS(1U,11)"
.LASF633:
	.string	"INT16_MAX (32767)"
.LASF1016:
	.string	"deleteln() winsdelln(stdscr,-1)"
.LASF1211:
	.string	"BUTTON2_TRIPLE_CLICKED NCURSES_MOUSE_MASK(2, NCURSES_TRIPLE_CLICKED)"
.LASF553:
	.string	"__GLIBC_USE_IEC_60559_EXT"
.LASF985:
	.string	"border(ls,rs,ts,bs,tl,tr,bl,br) wborder(stdscr, ls, rs, ts, bs, tl, tr, bl, br)"
.LASF186:
	.string	"__LDBL_DIG__ 18"
.LASF584:
	.string	"__INO64_T_TYPE __UQUAD_TYPE"
.LASF1228:
	.string	"BUTTON_SHIFT NCURSES_MOUSE_MASK(6, 0002L)"
.LASF84:
	.string	"__WINT_MIN__ 0U"
.LASF585:
	.string	"__MODE_T_TYPE __U32_TYPE"
.LASF697:
	.string	"NCURSES_COLOR_T short"
.LASF1147:
	.string	"KEY_MESSAGE 0555"
.LASF219:
	.string	"__FLT64_DIG__ 15"
.LASF294:
	.string	"__DEC64_EPSILON__ 1E-15DD"
.LASF770:
	.string	"P_tmpdir \"/tmp\""
.LASF162:
	.string	"__FLT_MIN__ 1.17549435082228750796873653722224568e-38F"
.LASF1166:
	.string	"KEY_SDL 0600"
.LASF114:
	.string	"__INT_LEAST8_WIDTH__ 8"
.LASF756:
	.string	"_IO_ERR_SEEN 0x0020"
.LASF1033:
	.string	"scrl(n) wscrl(stdscr,(n))"
.LASF58:
	.string	"__INT_LEAST16_TYPE__ short int"
.LASF894:
	.string	"ACS_STERLING NCURSES_ACS('}')"
.LASF456:
	.string	"__glibc_has_builtin(name) __has_builtin (name)"
.LASF1015:
	.string	"delch() wdelch(stdscr)"
.LASF358:
	.string	"unix 1"
.LASF1312:
	.string	"wattr_on"
.LASF625:
	.string	"_BITS_STDINT_INTN_H 1"
.LASF1328:
	.string	"float"
.LASF1154:
	.string	"KEY_REFERENCE 0564"
.LASF215:
	.string	"__FLT32_HAS_INFINITY__ 1"
.LASF1131:
	.string	"KEY_A3 0535"
.LASF657:
	.string	"INT_FAST16_MAX (9223372036854775807L)"
.LASF556:
	.string	"__GLIBC_USE_IEC_60559_FUNCS_EXT 0"
.LASF928:
	.string	"NCURSES_SP_NAME(name) name ##_sp"
.LASF1259:
	.string	"unctrl"
.LASF354:
	.string	"__linux__ 1"
.LASF445:
	.string	"__USE_FORTIFY_LEVEL 0"
.LASF187:
	.string	"__LDBL_MIN_EXP__ (-16381)"
.LASF560:
	.string	"__GLIBC_USE_IEC_60559_TYPES_EXT 0"
.LASF557:
	.string	"__GLIBC_USE_IEC_60559_FUNCS_EXT_C2X"
.LASF832:
	.string	"__bool_true_false_are_defined 1"
.LASF611:
	.string	"__SSIZE_T_TYPE __SWORD_TYPE"
.LASF55:
	.string	"__UINT32_TYPE__ unsigned int"
.LASF623:
	.string	"__WCHAR_MAX __WCHAR_MAX__"
.LASF744:
	.string	"__need___va_list"
.LASF968:
	.string	"getcurx(win) (NCURSES_OK_ADDR(win) ? (win)->_curx : ERR)"
.LASF335:
	.string	"__SIZEOF_FLOAT128__ 16"
.LASF1101:
	.string	"KEY_BREAK 0401"
.LASF128:
	.string	"__UINT_LEAST32_MAX__ 0xffffffffU"
.LASF993:
	.string	"waddchstr(win,str) waddchnstr(win,str,-1)"
.LASF881:
	.string	"ACS_LARROW NCURSES_ACS(',')"
.LASF1047:
	.string	"mvwgetch(win,y,x) (wmove((win),(y),(x)) == ERR ? ERR : wgetch(win))"
.LASF751:
	.string	"__struct_FILE_defined 1"
.LASF1196:
	.string	"NCURSES_BUTTON_RELEASED 001L"
.LASF1117:
	.string	"KEY_CLEAR 0515"
.LASF875:
	.string	"ACS_S9 NCURSES_ACS('s')"
.LASF482:
	.string	"__errordecl(name,msg) extern void name (void) __attribute__((__error__ (msg)))"
.LASF871:
	.string	"ACS_HLINE NCURSES_ACS('q')"
.LASF1133:
	.string	"KEY_C1 0537"
.LASF1335:
	.string	"kbhit"
.LASF693:
	.string	"NCURSES_CONST const"
.LASF811:
	.string	"__CFLOAT64X _Complex _Float64x"
.LASF587:
	.string	"__FSWORD_T_TYPE __SYSCALL_SLONG_TYPE"
.LASF1320:
	.string	"noecho"
.LASF1182:
	.string	"KEY_SREDO 0620"
.LASF707:
	.string	"NCURSES_INTEROP_FUNCS"
.LASF706:
	.string	"NCURSES_BROKEN_LINKER"
.LASF1053:
	.string	"mvwinchstr(win,y,x,s) (wmove((win),(y),(x)) == ERR ? ERR : winchstr((win),(s)))"
.LASF1303:
	.string	"_win_st"
.LASF250:
	.string	"__FLT32X_MANT_DIG__ 53"
.LASF92:
	.string	"__WCHAR_WIDTH__ 32"
.LASF405:
	.string	"__USE_LARGEFILE64"
.LASF752:
	.string	"__getc_unlocked_body(_fp) (__glibc_unlikely ((_fp)->_IO_read_ptr >= (_fp)->_IO_read_end) ? __uflow (_fp) : *(unsigned char *) (_fp)->_IO_read_ptr++)"
.LASF116:
	.string	"__INT16_C(c) c"
.LASF267:
	.string	"__FLT64X_DIG__ 18"
.LASF1206:
	.string	"BUTTON1_TRIPLE_CLICKED NCURSES_MOUSE_MASK(1, NCURSES_TRIPLE_CLICKED)"
.LASF682:
	.string	"INT64_C(c) c ## L"
.LASF290:
	.string	"__DEC64_MIN_EXP__ (-382)"
.LASF923:
	.string	"vid_attr(a,pair,opts) vidattr(a)"
.LASF13:
	.string	"__ATOMIC_ACQ_REL 4"
.LASF145:
	.string	"__INTPTR_WIDTH__ 64"
.LASF1247:
	.string	"TRACE_ORDINARY 0x001F"
.LASF353:
	.string	"__linux 1"
.LASF172:
	.string	"__DBL_MIN_10_EXP__ (-307)"
.LASF1093:
	.string	"is_subwin(win) (NCURSES_OK_ADDR(win) ? ((win)->_flags & _SUBWIN) != 0 : FALSE)"
.LASF884:
	.string	"ACS_UARROW NCURSES_ACS('-')"
.LASF378:
	.string	"NCURSES_IMPEXP NCURSES_EXPORT_GENERAL_IMPORT"
.LASF137:
	.string	"__INT_FAST32_WIDTH__ 64"
.LASF196:
	.string	"__LDBL_EPSILON__ 1.08420217248550443400745280086994171e-19L"
.LASF1223:
	.string	"BUTTON5_PRESSED NCURSES_MOUSE_MASK(5, NCURSES_BUTTON_PRESSED)"
.LASF180:
	.string	"__DBL_DENORM_MIN__ ((double)4.94065645841246544176568792868221372e-324L)"
.LASF272:
	.string	"__FLT64X_DECIMAL_DIG__ 21"
.LASF547:
	.string	"__GLIBC_USE_LIB_EXT2"
.LASF1067:
	.string	"mvgetch(y,x) mvwgetch(stdscr,(y),(x))"
.LASF1150:
	.string	"KEY_OPEN 0560"
.LASF616:
	.string	"__STATFS_MATCHES_STATFS64 1"
.LASF983:
	.string	"untouchwin(win) wtouchln((win), 0, getmaxy(win), 0)"
.LASF946:
	.string	"A_LEFT NCURSES_BITS(1U,18)"
.LASF671:
	.string	"PTRDIFF_MAX (9223372036854775807L)"
.LASF925:
	.string	"NCURSES_EXT_FUNCS 20211021"
.LASF1134:
	.string	"KEY_C3 0540"
.LASF820:
	.string	"_VA_LIST_ "
.LASF429:
	.string	"_POSIX_C_SOURCE"
.LASF1290:
	.string	"_immed"
.LASF169:
	.string	"__DBL_MANT_DIG__ 53"
.LASF1179:
	.string	"KEY_SOPTIONS 0615"
.LASF699:
	.string	"NCURSES_PAIRS_T short"
.LASF384:
	.string	"NCURSES_API "
.LASF687:
	.string	"INTMAX_C(c) c ## L"
.LASF1113:
	.string	"KEY_IL 0511"
.LASF579:
	.string	"__SYSCALL_ULONG_TYPE __ULONGWORD_TYPE"
.LASF516:
	.string	"__glibc_unlikely(cond) __builtin_expect ((cond), 0)"
.LASF78:
	.string	"__INT_MAX__ 0x7fffffff"
.LASF130:
	.string	"__UINT_LEAST64_MAX__ 0xffffffffffffffffUL"
.LASF957:
	.string	"setsyx(y,x) do { if (newscr) { if ((y) == -1 && (x) == -1) leaveok(newscr, TRUE); else { leaveok(newscr, FALSE); wmove(newscr, (y), (x)); } } } while(0)"
.LASF842:
	.string	"WA_DIM A_DIM"
.LASF773:
	.string	"TMP_MAX 238328"
.LASF917:
	.string	"GCC_PRINTFLIKE(fmt,var) __attribute__((format(printf,fmt,var)))"
.LASF1246:
	.string	"TRACE_CHARPUT 0x0010"
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
