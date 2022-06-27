TIM0_COMP:	//svake 1ms pomaknuti brojac R0, R1, R2, R3, R4, R5, R6 == R6-R5-R4-R3,R2-R1-R0

	push r16		
	in r16, SREG
	push r16

	sbrc MODE, 1	//	Uzlaz - 0x01	Silaz - 0x02
	jmp DEKREMENTIRANJE



//INKREMENTIRANJE:
.include"uzlazni_brojac.asm"

KRAJ_INKREMENTA:
	pop r16
	out SREG, r16
	pop r16
reti




DEKREMENTIRANJE:
.include"silazni_brojac.asm"

KRAJ_DEKREMENTA:

	pop r16
	out SREG, r16
	pop r16
reti

