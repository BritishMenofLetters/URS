restart:
// izgasi timere
	clr r16
	out TCCR2,  r16
	out TCCR0,  r16
	out TCCR1A, r16

// clearaj timere
	out TCNT0,  r16
	out TCNT2,  r16
	out TCNT1L, r16
	out TCNT1H, r16

	ldi r16, 0x00
	mov NULA, r16

	.equ iVal=22 //inicijalizacija

	//inicijalizacija stoga
	ldi r16, low(RAMEND)
	out SPL, r16
	ldi r16, high(RAMEND)
	out SPH, r16

	LDI r17, 0b00000011		// nula registra za dekadsko brojanje

	//postavljanje ulaznog pina D2
	cbi ddrd, 0x02
	cbi portd, 0x02
	//omoguci vanjski INTERRUPT0
	ldi r16, 1<<ISC00
	out MCUCR, r16

	ldi r16, 1<<INT0
	out GICR, r16

	//postavljanje TIMER0 1ms i TIMER2 1us
	ldi r16, 1<<OCF0 | 1<<OCF2
	out TIFR, r16

	ldi r16, 1<<OCIE0 || 1<<OCIE2
	out TIMSK, r16

	ldi r16, 0x7e
	out OCR0, r16

	ldi r16, 0x08
	out OCR2, r16

	//povezivanje Timera1 s vanjskim pinom PD5 (OC1A)
	sbi ddrd,  0x05
	sbi portd, 0x05

	//setiranje pinova
	ldi r16, 0xff
	out ddrc, r16

	ldi r16, 0xff
	out ddrb, r16

	//postavljanje brojnih registara na nulu
	mov r0, r17
	mov r1, r17
	mov r2, r17
	mov r3, r17
	mov r4, r17
	mov r5, r17
	mov r6, r17
	
	//postavljanje mjesta zareza
	ldi r16, 0x08
	mov r7, r16	//zarez je na pocetnom mjestu

	//binarni brojac vremena
	clr r8
	clr r9
	clr r10

	sei

