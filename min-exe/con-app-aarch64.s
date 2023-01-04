// This is a minimal console application that does not use the crt 
// and invokes window kernel methods directly.
// 
// Building with GAS (aarch64-pe version)
// ../tools/as con-app-aarch64.s -o con-app-aarch64.o
//
// Linking with Windows linker (arm64 version)
// link con-app-aarch64.o kernel32.Lib /SUBSYSTEM:CONSOLE
//
	.text
	.def	mainCRTStartup;
	.scl	2;
	.type	32;
	.endef
	.globl	mainCRTStartup                  // -- Begin function mainCRTStartup
	.p2align	2
mainCRTStartup:                         // @mainCRTStartup
	sub	sp, sp, #48
	str	x30, [sp, #32]                  // 8-byte Folded Spill
	adrp	x8, hello_world_text
	add	x8, x8, :lo12:hello_world_text
	str	x8, [sp, #24]
	adrp	x8, __imp_GetStdHandle
	ldr	x8, [x8, :lo12:__imp_GetStdHandle]
	mov	w0, #-11
	blr	x8
	str	x0, [sp, #8]
	ldr	x1, [sp, #24]
	ldr	x0, [sp, #8]
	adrp	x8, __imp_WriteFile
	ldr	x8, [x8, :lo12:__imp_WriteFile]
	mov	w2, #24
	add	x3, sp, #20
	mov	x4, xzr
	blr	x8
	mov	w0, wzr
	ldr	x30, [sp, #32]                  // 8-byte Folded Reload
	add	sp, sp, #48
	ret
                                        // -- End function
	.section	.rdata
	.globl	hello_world_text 
	.p2align	3
hello_world_text:
	.hword	72
	.hword	101
	.hword	108
	.hword	108
	.hword	111
	.hword	32
	.hword	119
	.hword	111
	.hword	114
	.hword	108
	.hword	100
	.hword	10
	.hword	0

	.addrsig
