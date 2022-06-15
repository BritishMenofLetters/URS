EXT_INT0:

//TODO: ubaciti push, pop
//pokretanje timera - ako je pritisnut D2

	sbis PIND, 2
	jmp zaustavi_timer

	clr r16
	out TCNT0, r16
	ldi r16, (1<<CS01) | (1<<WGM01) | (1<<WGM00)
 	out TCCR0, r16
	reti

zaustavi_timer:

	ldi r16, (0<<CS01) | (0<<CS00)
	reti
