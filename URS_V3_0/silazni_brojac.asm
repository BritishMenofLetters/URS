//SMANJI_R0:
	mov r16, r0
	call DEKREMENT_ZNAMENKE
	mov r0, r16	

	cpi r16, 0x84	//Ako se R0 prebacio sa 0 na 9, smanji R1
	BREQ SMANJI_R1

	//Provjeri je li R0 nula
	cpi r16, 0x03
	in r17, SREG	//Ako nije nula, zavrsi
	sbrs r17, 1 //skipaj ako je Z clearan 
	jmp KRAJ_DEKREMENTA

	//Provjeri je li zarez na bit 3
	sbrs r7, 3 //Ako je zarez na 3, nemoj zavrsiti
	jmp KRAJ_DEKREMENTA
	
	//Ako je zarez na 3, provjeri je li R1 nula
	mov r16, r1
	cpi r16, 0x03
	BRNE KRAJ_DEKREMENTA	//Ako nije nula, zavrsi
	
	//Ako je R1 nula, provjeri je li R2 nula
	mov r16, r2
	cpi r16, 0x03
	BRNE KRAJ_DEKREMENTA	//Ako nije nula, zavrsi

	//Ako je R2 nula, provjeri je li R3 nula
	mov r16, r3
	cpi r16, 0x03
	BRNE KRAJ_DEKREMENTA	//Ako nije nula, zavrsi
	
	//Ako je, Brojac je na nuli - resetiraj program
	//jmp 0x0000

SMANJI_R1:
	mov r16, r1
	call DEKREMENT_ZNAMENKE
	mov r1, r16	

	cpi r16, 0x84	//Ako se R1 prebacio sa 0 na 9, smanji R2
	BREQ SMANJI_R2

	jmp KRAJ_DEKREMENTA

SMANJI_R2:
	mov r16, r2
	call DEKREMENT_ZNAMENKE
	mov r2, r16	

	cpi r16, 0x84	//Ako se R2 prebacio sa 0 na 9, smanji R3
	BREQ SMANJI_R3

	jmp KRAJ_DEKREMENTA

SMANJI_R3:
	mov r16, r3
	call DEKREMENT_ZNAMENKE
	mov r3, r16

	cpi r16, 0x84	//Ako se R3 prebacio sa 0 na 9, smanji R4
	BREQ SMANJI_R4

	jmp KRAJ_DEKREMENTA

SMANJI_R4:
	mov r16, r4
	call DEKREMENT_ZNAMENKE
	mov r4, r16	

	cpi r16, 0x84	//Ako se R4 prebacio sa 0 na 9, smanji R5
	BREQ SMANJI_R5

	cpi r16, 0x03	//Ako je R4 nula i zarez je na bit 2 (R4 R3 , R2 R1), prebaci zarez u lijevo
	BRNE KRAJ_DEKREMENTA	//Ako nije nula, zavrsi

	sbrc r7, 2		//Ako zarez nije na bit 2, skipaj pomak zareza
	lsl r7

	jmp KRAJ_DEKREMENTA

SMANJI_R5:
	mov r16, r5
	call DEKREMENT_ZNAMENKE
	mov r5, r16	

	cpi r16, 0x84	//Ako se R5 prebacio sa 0 na 9, smanji R6
	BREQ SMANJI_R6

	cpi r16, 0x03	//Ako je R5 nula i zarez je na bit 1 (R5 R4 R3 , R2), prebaci zarez u lijevo
	BRNE KRAJ_DEKREMENTA	//Ako nije nula, zavrsi

	sbrc r7, 1		//Ako zarez nije na bit 1, skipaj pomak zareza
	lsl r7

	jmp KRAJ_DEKREMENTA

SMANJI_R6:
	mov r16, r6
	call DEKREMENT_ZNAMENKE
	mov r6, r16	

	cpi r16, 0x03			//Ako je R6 nula (i zarez je na bit 0) (R6 R5 R4 R3 ,), prebaci zarez u lijevo
	BRNE KRAJ_DEKREMENTA	//Ako nije nula, zavrsi

	lsl r7

