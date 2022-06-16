EXT_INT0:

//TODO: ubaciti push, pop
//pokretanje timera - ako je pritisnut D2


	sbis PIND, 2
	jmp zaustavi_timer



	ldi r16, (1<<CS00) |(1<<CS01) | (1<<WGM01); | (0<<WGM00)
 	out TCCR0, r16
reti

zaustavi_timer:

	ldi r16, (0<<CS01) | (0<<CS00)
	out TCCR0, r16

	//igasi interrupt timera0 i upali interruptove timera2
	//TODO: mozda bolje izgasiti vanjske interruptove,
	//		a ostaviti u inicijalizaciji postavljanje interruptova timera0 i 2
	ldi r16, 1<<TOV2 | 1<<OCF2
	out TIFR, r16
	ldi r16, 1<<OCIE2
	out TIMSK, r16
//Krece timer za vracanje u nulu
	ldi r16, (0<<CS20) |(1<<CS22) | (1<<WGM21)
 	out TCCR2, r16
reti
