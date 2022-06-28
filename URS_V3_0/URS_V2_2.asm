;
; AssemblerApplication6.asm
;
; Created: 3.6.2022. 7:19:56
; Author : mateo i  merisa
;

; Replace with your application code
.include "m16def.inc"

.cseg

.org 0x0000		//Iskoristeni registri :| r19 |  r20 | r21 | r22 | r23 | r24 | r25 | r18 - tocka 
				.def	iLoopRl 	= r24	
				.def	iLoopRh 	= r25	
				
				.def	NULA		= r13	
				.def	MODE		= r23	//Inkrementiranje = 0x01	|	Dekrementiranje = 0x02	
			
				.def 	TEMP0		= r19
				.def	TEMP1		= r20
				.def	TEMP2		= r21
				.def	BROJAC_250 	= r22
				jmp 	restart


.org INT0addr	jmp 	EXT_INT0 		; External Interrupt Handler
.org OC2addr	jmp		TIM2_COMP		; Timer2 Compare Handler
.org OC0addr	jmp 	TIM0_COMP 		; Timer0 Compare Handler



.include"pocetna_inicijalizacija.asm"
.include"ispisivanje_na_display.asm"	;MAIN funkcija

.include"delay_loop.asm"
.include"inkrement_dekadske_znamenke.asm"

.include"vanjski_interrupt.asm"
.include"timer0_1ms.asm"

.include"pwm.asm"
.include "ispis_znamenke.asm"



