TIM2_COMP:	//svake 1ms pomaknuti brojac R0, R1, R2, R3, R4, R5, R6 .... R6-R5-R4-R3,R2-R1-R0

	push r16		
	in r16, SREG
	push r16

	//za DEKREMENTIRANJE binarnog brojaca
/*
	ldi r16, 0x01
	subi r8, r16
	ldi r16, 0x00
	adc r9, r16
	adc r10, r16
	mov r16, r1
*/

//SMANJI_R0:
	mov r16, r0
	call DEKREMENT_ZNAMENKE
	mov r0, r16	

	//ako je R0 isa sa 0 na 9, provjeri jel triba smanjiti R1 ili resetirati program ako su daljni registri na nuli
	cpi r16, 0x84
//!	BRNE KRAJ_DEKREMENTA - nije moglo doseci labelu pa se koristi jmp
	in r17, SREG
	sbrs r17, 1 //skipaj ako je Z clearan 
	jmp KRAJ_DEKREMENTA

	mov r16, r7
	cpi	r16, 0x08	//Provjera je li zarez na R3
	BRNE SMANJI_R1

	//Ako je zarez na R3, provjeri je li on nula i ako jest , provjeri R2 i R1 nula i ako je postavi R0 u nulu
	mov r16, r3
	cpi r16, 0x03
	BRNE SMANJI_R1

	mov r16, r2
	cpi r16, 0x03
	BRNE SMANJI_R1

	mov r16, r1
	cpi r16, 0x03
	BRNE SMANJI_R1

	ldi r16, 0x03
	mov r0, r16
	jmp 0x0000

SMANJI_R1:
	mov r16, r1
	call DEKREMENT_ZNAMENKE
	mov r1, r16	

	//ako je R1 isa sa 0 na 9, provjeri jel triba smanjiti R2 ili skociti na kraj ako su daljni registri na nuli
	cpi r16, 0x84
//!	BRNE KRAJ_DEKREMENTA - nije moglo doseci labelu pa se koristi jmp
	in r17, SREG
	sbrs r17, 1 //skipaj ako je Z clearan 
	jmp KRAJ_DEKREMENTA
	
	mov r16, r7
	cpi	r16, 0x08	//Provjera je li zarez na R3
	BRNE SMANJI_R2

	//Ako je zarez na R3, provjeri je li on nula i ako jest , provjeri R2 nula i ako je postavi R1 u nulu
	mov r16, r3
	cpi r16, 0x03
	BRNE SMANJI_R2

	mov r16, r2
	cpi r16, 0x03
	BRNE SMANJI_R2

	ldi r16, 0x03
	mov r1, r16
	jmp KRAJ_DEKREMENTA

SMANJI_R2:
	mov r16, r2
	call DEKREMENT_ZNAMENKE
	mov r2, r16	


	//ako je R2 isa sa 0 na 9, provjeri jel triba smanjiti R3 ili skociti na kraj ako su daljni registri na nuli
	cpi r16, 0x84
	BRNE KRAJ_DEKREMENTA
	
	mov r16, r7
	cpi	r16, 0x08	//Provjera je li zarez na R3
	BRNE SMANJI_R3
	//Ako je zarez na R3, provjeri je li on nula i ako jest postavi R2 u nulu
	mov r16, r3
	cpi r16, 0x03
	BRNE SMANJI_R3

	ldi r16, 0x03
	mov r2, r16
	jmp KRAJ_DEKREMENTA

SMANJI_R3:
	
	mov r16, r3
	call DEKREMENT_ZNAMENKE
	mov r3, r16	


	//ako je R3 isa sa 0 na 9, provjeri jel triba prominiti zarez ili smanjiti R4
	cpi r16, 0x84
	BRNE KRAJ_DEKREMENTA
	
	sbrs r7, 4	
	jmp SMANJI_R4

	//Pomakni zarez i postav i taj registar u 0
	lsl r7
	ldi r16, 0x03
	mov r3, r16
	jmp KRAJ_DEKREMENTA

SMANJI_R4:
	mov r16, r4
	call DEKREMENT_ZNAMENKE
	mov r4, r16	


	//ako je R4 isa sa 9 na 0, provjeri jel triba prominizi zarez ili smanjiti R5
	cpi r16, 0x84
	BRNE KRAJ_DEKREMENTA
	
	sbrs r7, 3	
	jmp SMANJI_R5

	//Pomakni zarez i postav i taj registar u 0
	lsl r7
	ldi r16, 0x03
	mov r4, r16
	jmp KRAJ_DEKREMENTA

SMANJI_R5:
	mov r16, r5
	call DEKREMENT_ZNAMENKE
	mov r5, r16	


	//ako je R5 isa sa 9 na 0, provjeri jel triba prominizi zarez ili smanjiti R6
	cpi r16, 0x84
	BRNE KRAJ_DEKREMENTA
	
	sbrs r7, 2	
	jmp SMANJI_R6 

	//Pomakni zarez i postav i taj registar u 0
	lsl r7
	ldi r16, 0x03
	mov r5, r16
	jmp KRAJ_DEKREMENTA

SMANJI_R6:
	mov r16, r6
	call DEKREMENT_ZNAMENKE
	mov r6, r16

	//vrati zarez ako se dogodio prebacaj R6	
	cpi r16, 0x84
	BRNE KRAJ_DEKREMENTA
	//Pomakni zarez i postav i taj registar u 0
	lsl r7
	ldi r16, 0x03
	mov r6, r16

KRAJ_DEKREMENTA:

	pop r16
	out SREG, r16
	pop r16
reti
