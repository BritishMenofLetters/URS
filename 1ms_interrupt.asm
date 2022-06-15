TIM0_COMP:	//svake 1ms pomaknuti brojac R0, R1, R2, R3, R4, R5, R6 .... R6-R5-R4-R3,R2-R1-R0

	

	push r16		
	in r16, SREG
	push r16

	//za inkrementiranje bin brojaca

	ldi r16, 0x01
	add r8, r16
	ldi r16, 0x00
	adc r9, r16
	adc r10, r16

	//povecaj R0
	mov r16, r0
	call INKREMENT_ZNAMENKE
	mov r0, r16

	//ako je R0 isa sa 9 na 0, povecaj R1
	cpi r16, 0x03
	BRNE KRAJ_INKREMENTA

	mov r16, r1
	call INKREMENT_ZNAMENKE
	mov r1, r16

	//ako je R1 isa sa 9 na 0, povecaj R2
	cpi r16, 0x03
	BRNE KRAJ_INKREMENTA
	
	mov r16, r2
	call INKREMENT_ZNAMENKE
	mov r2, r16

	//ako je R2 isa sa 9 na 0, povecaj R3
	cpi r16, 0x03
	BRNE KRAJ_INKREMENTA

	mov r16, r3
	call INKREMENT_ZNAMENKE
	mov r3, r16

	//ako je R3 isa sa 9 na 0, povecaj R4 i pomakni zarez ako je na tom mjestu
	cpi r16, 0x03
	BRNE KRAJ_INKREMENTA

	//ako je na tom mjestu, pomakni
	sbrc r7, 3	//preskoci ako je bit 3 setan
	lsr r7

	mov r16, r4
	call INKREMENT_ZNAMENKE
	mov r4, r16

	//ako je R4 isa sa 9 na 0, povecaj R5
	cpi r16, 0x03
	BRNE KRAJ_INKREMENTA

	//ako je na tom mjestu, pomakni
	sbrc r7, 2	//preskoci ako je bit 2 clearan
	lsr r7

	mov r16, r5
	call INKREMENT_ZNAMENKE
	mov r5, r16	

	//ako je R5 isa sa 9 na 0, povecaj R6
	cpi r16, 0x03
	BRNE KRAJ_INKREMENTA

	//ako je na tom mjestu, pomakni
	sbrc r7, 1	//preskoci ako je bit 1 setan
	lsr r7

	mov r16, r6
	call INKREMENT_ZNAMENKE
	mov r6, r16

	//vrati zarez ako se dogodio prebacaj R6	

	//ako je na tom mjestu, pomakni
	sbrc r7, 0
	ldi r16, 0x08
	mov r7, r16	//zarez je na pocetnom mjestu

	clr r7
	clr r8
	clr r9
	//mozda bolje da ode na reset?

KRAJ_INKREMENTA:

	pop r16
	out SREG, r16
	pop r16
	reti
