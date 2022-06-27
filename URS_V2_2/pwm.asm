TIM2_COMP:
	push r17
	push r16		
	in r16, SREG
	push r16

//Ako je BROJAC_250 nula, zavrsi
	cpi  BROJAC_250, 0x00
	BREQ KRAJ_PROGRAMA
	
//Ako je TEMP0 | TEMP1 | TEMP2 = 0
//	*	Povecaj pwm za 20mV (tocnije 19,989mV)
//	*	smanji  BROJAC_250
//	*	postavi na binarni temp brojac na max (originalni binarni brojac R10 R9 R8)
//
// TEMP2 = R10
// TEMP1 = R9
// TEMP0 = R8
//
//
	ldi r16, 0x00
	or  r16, TEMP0
	or  r16, TEMP1
	or  r16, TEMP2

	BRNE SMANJI_TEMP	//Ako nije nula, smanji temp, inace smanji brojac_250	

	//OCR1A + 262 --- 262 = 0x0106 = -0xfefa
	in   r16, OCR1AL
	in   r17, OCR1AH
	subi r16, 0xfa
	sbci r17, 0xfe

	out OCR1AL, r16
	out OCR1AH, r17
	
	dec BROJAC_250

	mov TEMP0, r8 
	mov TEMP1, r9
	mov TEMP2, r10
	
	jmp KRAJ_PWM

//Inace smanji binarni temp brojac
SMANJI_TEMP:
	subi TEMP0, 0x01
	sbci TEMP1, 0x00
 	sbci TEMP2, 0x00


KRAJ_PWM:
	pop r16
	out SREG, r16
	pop r16
	pop r17
reti


KRAJ_PROGRAMA:
	ldi r16, 0xFA
	mov BROJAC_250, r16

	
	ldi R17, 0x00;
	out OCR0, R17;
	pop r16
	out SREG, r16
	pop r16
reti
