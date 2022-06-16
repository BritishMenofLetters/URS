main:
	
	ldi r16, 0x08
	mov r11, r16
	mov  r12, r7

	//ispis zareza
	ldi r16, 0x80
	out PORTC, r16

	mov r16, r7
	out PORTB, r16
	ldi r16, 0x00
	CALL delay		
 	out PORTB, R16

//ispis znamenaka
	lsr r12
	brcc REG_PET
	adc r12, NULA
	mov r16, r6
	call ISPIS_ZNAMENKE

	mov  R16, r11
	out PORTB, R16
	ldi r16, 0x00
	CALL delay		
	out PORTB, R16
	
	lsr r11

REG_PET:	
	lsr r12
	brcc REG_CETIRI
	adc r12, NULA
	mov r16, r5
	call ISPIS_ZNAMENKE

	mov  R16, r11
	out PORTB, R16
	ldi r16, 0x00 
	CALL delay
	out PORTB, R16

	lsr r11

REG_CETIRI:
	lsr r12
	brcc REG_TRI
	adc r12, NULA
	mov r16, r4
	call ISPIS_ZNAMENKE
	
	mov  R16, r11
	out PORTB, R16
	ldi r16, 0x00 
	CALL delay
	out PORTB, R16
	
	lsr r11

REG_TRI:
	mov r16, r3
	call ISPIS_ZNAMENKE	
	mov R16, r11
	out PORTB, R16
	ldi r16, 0x00 
	CALL delay
	out PORTB, R16

	lsr r11
	breq main

	mov r16, r2
	call ISPIS_ZNAMENKE	
	mov R16, r11
	out PORTB, R16
	ldi r16, 0x00 
	CALL delay
	out PORTB, R16

	lsr r11
	breq KRAJ

	mov r16, r1
	call ISPIS_ZNAMENKE	
	mov R16, r11
	out PORTB, R16
	ldi r16, 0x00 
	CALL delay
	out PORTB, R16

	lsr r11
	breq KRAJ

	mov r16, r0
	call ISPIS_ZNAMENKE	
	mov R16, r11
	out PORTB, R16
	ldi r16, 0x00 
	CALL delay
	out PORTB, R16

KRAJ:
	rjmp main
