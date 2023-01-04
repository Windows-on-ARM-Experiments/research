// This is a minimal console application that does not use the crt 
// and invokes window kernel methods directly.
// 
// Bulild with clang
//
// clang --target=arm64-pc-windows-msvc con-app.c -nostdlib -Wl,/SUBSYSTEM:CONSOLE -lkernel32 -o con-app-aarch64.exe
// clang --target=x86_64-pc-windows-msvc con-app.c -nostdlib -Wl,/SUBSYSTEM:CONSOLE -lkernel32 -o con-app-x64.exe
//
// This version includes seh info
//
	.text
	.def	"@feat.00";
	.scl	3;
	.type	0;
	.endef
	.globl	"@feat.00"
.set "@feat.00", 0
	.file	"con-app.c"
	.def	mainCRTStartup;
	.scl	2;
	.type	32;
	.endef
	.globl	mainCRTStartup                  // -- Begin function mainCRTStartup
	.p2align	2
mainCRTStartup:                         // @mainCRTStartup
.seh_proc mainCRTStartup
// %bb.0:
	sub	sp, sp, #48
	.seh_stackalloc	48
	str	x30, [sp, #32]                  // 8-byte Folded Spill
	.seh_save_reg	x30, 32
	.seh_endprologue
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
	.seh_startepilogue
	ldr	x30, [sp, #32]                  // 8-byte Folded Reload
	.seh_save_reg	x30, 32
	add	sp, sp, #48
	.seh_stackalloc	48
	.seh_endepilogue
	ret
	.seh_endfunclet
	.seh_endproc
                                        // -- End function
	.section	.rdata,"dr",discard,hello_world_text
	.globl	hello_world_text 
	.p2align	3
hello_world_text:
	.hword	72                              // 0x48
	.hword	101                             // 0x65
	.hword	108                             // 0x6c
	.hword	108                             // 0x6c
	.hword	111                             // 0x6f
	.hword	32                              // 0x20
	.hword	119                             // 0x77
	.hword	111                             // 0x6f
	.hword	114                             // 0x72
	.hword	108                             // 0x6c
	.hword	100                             // 0x64
	.hword	10                              // 0xa
	.hword	0                               // 0x0

	.addrsig
