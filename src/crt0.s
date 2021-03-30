	.global _start
	.global _start_test
	.global __ExitProcess
	.global _unk_0C020094
	.import __sbss
	.import __ebss
	.import __stack_begin
	.import main

.section .text
_start:
	bra	_start_L1			;#\Normal entry point
	 mov	#0x00, r1			;#/
_start_test:
	mov	#0x01, r1
_start_L1:
	mov.l	_test_mode_ref, r0		;#\Set _testModeFlag
	mov.l	r1, @r0				;#/
	mova	_clear_regs, r0			;#\Jump to _clear_regs
	mov.l	_p2_mask_ref, r1		;#|(make this an uncached address)
	and	r1, r0				;#|
	mov.l	_p2_bits_ref, r1		;#|
	or	r1, r0				;#|
	jmp	@r0				;#|
	 nop					;#/

	.balign 4
_clear_regs:
	mov.l	_ccr_addr_ref, r0		;#\Initialize CCR register
	mov.l	_ccr_val_ref, r1		;#|(enable ICE, OCE, and CB flags)
	mov.l	r1, @r0				;#/
	nop					;#\Wait 8 instructions for CPU to update
	nop					;#|
	nop					;#|
	nop					;#|
	nop					;#|
	nop					;#|
	nop					;#|
	nop					;#/
	mova	_bss_addr_ref, r0		;#\Get BSS location and size
	mov.l	@r0+, r2			;#|
	mov	#0x00, r3			;#|
	mov.l	@r0+, r4			;#/
start_loop:
	mov.l	r3, @r2				;#\Clear BSS
	dt	r4				;#|
	add	#0x04, r2			;#|
	bf	start_loop			;#/
	 nop
	mov.l	_fpscr_val_ref, r0		;#\Initialize FPSCR register
	lds	r0, fpscr			;#/
	mova	_stack_ref, r0			;#\Setup stack pointer and main address
	mov.l	@r0+, r15			;#|
	mov.l	@r0+, r0			;#/
	mov	#0x00, r1			;#\Zero main registers
	mov	#0x00, r2			;#|
	mov	#0x00, r3			;#|
	mov	#0x00, r4			;#|
	mov	#0x00, r5			;#|
	mov	#0x00, r6			;#|
	mov	#0x00, r7			;#|
	mov	#0x00, r8			;#|
	mov	#0x00, r9			;#|
	mov	#0x00, r10			;#|
	mov	#0x00, r11			;#|
	mov	#0x00, r12			;#|
	mov	#0x00, r13			;#|
	mov	#0x00, r14			;#/
	fldi0	fr0				;#\Zero FPU registers
	fmov	fr0, fr1			;#|
	fmov	fr0, fr2			;#|
	fmov	fr0, fr3			;#|
	fmov	fr0, fr4			;#|
	fmov	fr0, fr5			;#|
	fmov	fr0, fr6			;#|
	fmov	fr0, fr7			;#|
	fmov	fr0, fr8			;#|
	fmov	fr0, fr9			;#|
	fmov	fr0, fr10			;#|
	fmov	fr0, fr11			;#|
	fmov	fr0, fr12			;#|
	fmov	fr0, fr13			;#|
	fmov	fr0, fr14			;#|
	fmov	fr0, fr15			;#/
	jsr	@r0				;#\Call main
	 nop					;#/
__ExitProcess:
	bra	__ExitProcess			;#\Infinite loop
	 nop					;#/

	nop
	nop
	nop
_unk_0C020094:
	nop					;#\Do nothing and return?
	nop					;#|
	rts					;#|
	 nop					;#/

	.balign 8
_bss_addr_ref:
	.4byte __sbss				;# r2
_bss_sz_ref:
	.4byte __sbss_size			;# r4
_stack_ref:
	.4byte __stack_begin			;# r15
_entry_ref:
	.4byte main				;# r0
_fpscr_val_ref:
	.4byte 0x00040001
_test_mode_ref:
	.4byte _testModeFlag
_p2_mask_ref:
	.4byte 0x1FFFFFFF
_p2_bits_ref:
	.4byte 0xA0000000
_ccr_addr_ref:
	.4byte 0xFF00001C
_ccr_val_ref:
	.4byte 0x00000105
