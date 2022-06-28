EXT_INT0:

	push r16		
	in   r16, SREG
	push r16
//pokretanje timera - ako je pritisnut D2

	sbis PIND, 2
	jmp  zaustavi_timer
	
	ldi MODE, 0x01
	ldi r16, (1<<CS00) |(1<<CS01) | (1<<WGM01)
 	out TCCR0, r16

	
	pop r16
	out SREG, r16
	pop r16
reti

zaustavi_timer:

	clr r16
	out TCNT0, r16
	
	ldi MODE, 0x02

//onemoguci daljne interrupte
	ldi r16, 0<<INT0
	out GICR, r16
////////	
	lsr r9
	rol r8
////////
	
	mov r18, r7
	mov r26, r0
	mov r27, r1
	mov r28, r2
	mov r29, r3
	mov r30, r4
	mov r31, r5
	mov r14, r6

//pokreni timer1 = pwm - No prescaling, fast pwm | clear OC1A on compare set (non-inverting)
	ldi r16,  1<<WGM10 | 1<<WGM11 | 1<<COM1B1 |  1<<COM1A1 
	out TCCR1A, r16
	
	ldi r16, 1<<WGM13 | 1<<WGM12 | 1<<CS10
	out TCCR1B, r16

//pokreni timer2
	ldi r16, (1<<CS20) |(0<<CS22) | (1<<WGM21)
 	out TCCR2, r16


	pop r16
	out SREG, r16
	pop r16
reti
