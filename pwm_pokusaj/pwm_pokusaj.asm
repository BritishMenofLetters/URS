.include "m16def.inc"


.org 0x0000     rjmp 	reset
.org OC2addr	jmp 	TIM2_COMP 	; Timer0 Compare Handler
;.org OC1addr	jmp 	TIM0_COMP 	; Timer0 Compare Handler


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
	mov BROJAC_250, r16

	ldi r16, 0xfa
	mov	r8, r16

	ldi r16, 0x02
	mov	r9, r16

	ldi r16, 0x00
	mov	r10, r16

	mov TEMP0, r8 
	mov TEMP1, r9
	mov TEMP2, r10

//////////// Paljenje timera2

	ldi r16, 0x08	//1us
	//ldi r16, 0x1a	//1ms
	out OCR2, r16
//65536
	ldi r16, 1<<TOV2 | 1<<OCF2
	out TIFR, r16
	ldi r16, 1<<OCIE2
	out TIMSK, r16
	ldi r16, (1<<CS20) |(0<<CS22) | (1<<WGM21)
 	out TCCR2, r16
	sei
////////////


LDI R16, 0b00001000;
OUT DDRB, R16; Povezivanje Tajmera/Brojaèa 0 s
;vanjskim pinom PB3
.
LDI R17, 0x00;
OUT OCR0, R17;

LDI R16, 0b01101010;
OUT TCCR0, R16;

main:
//inc r17
//OUT OCR0, R17;
//call delay10ms
rjmp main


delay10ms:


		ldi	iLoopRl,LOW(iVal)	; intialize inner loop count in inner
		ldi	iLoopRh,HIGH(iVal)	; loop high and low registers

iLoop:	sbiw	iLoopRl,1		; decrement inner loop registers
		brne	iLoop			; branch to iLoop if iLoop registers != 0

		dec	loopCt			; decrement outer loop register
		brne	delay10ms		; branch to oLoop if outer loop register != 0
	//	rjmp start
ret

.include"pwm_vjezba.asm"
/*
TIM2_COMP:
	INC r17
	OUT OCR0, R17;
reti

*/
