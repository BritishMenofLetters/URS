.include "m16def.inc"


.org 0x0000     rjmp 	reset
.org OC2addr	jmp 	TIM2_COMP 	; Timer0 Compare Handler
//.org OC1Aaddr	jmp 	TIM1_COMP 	; Timer0 Compare Handler


.def	iLoopRl 	= r24	
.def	iLoopRh 	= r25	
.def	loopCt		= r18
.def 	TEMP0		= r19
.def	TEMP1		= r20
.def	TEMP2		= r21
.def	BROJAC_250 	= r22
reset:


	.equ iVal=2 //inicijalizacija
	ldi r16, low(RAMEND)
	out SPL, r16
	ldi r16, high(RAMEND)
	out SPH, r16

	ldi r16, 0xFA
//	ldi r16, 0x7D
	mov BROJAC_250, r16

	ldi r16, 0x64
	mov	r8, r16

	ldi r16, 0x21
	mov	r9, r16

	ldi r16, 0x00
	mov	r10, r16

	mov TEMP0, r8 
	mov TEMP1, r9
	mov TEMP2, r10

//////////// Paljenje timera2

	ldi r16, 0x33	//4us
	//ldi r16, 0x1a	//1ms
	out OCR2, r16
//65536
	ldi r16, 1<<TOV2 | 1<<OCF2 | 1<<OCF1A
	out TIFR, r16
	ldi r16, 1<<OCIE2  | 1<<OCIE1A
	out TIMSK, r16
	ldi r16, (1<<CS20) |(0<<CS22) | (1<<WGM21)
 	out TCCR2, r16

////////////


LDI R16, 0b00110000;
OUT DDRD, R16; Povezivanje Tajmera/Brojaèa 0 s
;vanjskim pinom PD5 i PD4
.
LDI R17, 0xFA;
OUT OCR1AL, R17;
LDI R17, 0x00
OUT OCR1AH, R17;

OUT OCR1BL, R17;
OUT OCR1BH, R17;

//pokreni timer1 = pwm - No prescaling, fast pwm | clear OC1A on compare set (non-inverting)
	ldi r16,  1<<WGM10 | 1<<WGM11 | 1<<COM1B1 |  1<<COM1A1 
	out TCCR1A, r16
	
	ldi r16, 1<<WGM13 | 1<<WGM12 | 1<<CS10
	out TCCR1B, r16

	sei
main:
//inc r17
//OUT OCR0, R17;
//call delay10ms
rjmp main

.include"pwm_vjezba.asm"
/*
TIM2_COMP:
	INC r17
	OUT OCR0, R17;
reti

*/

