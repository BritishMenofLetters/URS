;
; AssemblerApplication6.asm
;
; Created: 3.6.2022. 7:19:56
; Author : mateo i  merisa
;

; Replace with your application code
.include "m16def.inc"

.cseg

.org 0x0000
				.def	iLoopRl = r24	
				.def	iLoopRh = r25	
				.def	loopCt	= r18
				.def	NULA	= r13			
				rjmp 	restart


.org INT0addr	jmp 	EXT_INT0 		; Timer0 Compare Handler
.org OC0addr	jmp 	TIM0_COMP 		; Timer0 Compare Handler


.include"pocetna_inicijalizacija.asm"
.include"ispisivanje_na_display.asm"	;main funkcija

.include"delay_loop.asm"
.include"inkrement_dekadske_znamenke.asm"

.include"vanjski_interrupt.asm"
.include"1ms_interrupt.asm"

.include "ispis_znamenke.asm"
s
