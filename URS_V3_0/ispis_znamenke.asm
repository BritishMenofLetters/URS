ISPIS_ZNAMENKE:

	CPI r16, 0x03
	BRNE JEDAN
	LDI r17, 0X3F
	out portc, r17 
	RET

	JEDAN:
	CPI R16, 0x06
	BRNE DVA
	LDI r17, 0X06
	out portc, r17 
	RET

	DVA:
	CPI R16, 0x0C
	BRNE TRI
	LDI r17, 0X5B
	out portc, r17 
	RET

	TRI:
	CPI R16, 0x18
	BRNE CETIRI
	LDI r17, 0X4F
	out portc, r17 
	RET

	CETIRI:
	CPI R16, 0x30
	BRNE PET
	LDI r17, 0X66
	out portc, r17 
	RET

	PET:
	CPI R16,0x60
	BRNE SEST
	LDI r17, 0X6D
	out portc, r17 
	RET

	SEST:
	CPI R16, 0xC0
	BRNE SEDAM
	LDI r17, 0X7D
	out portc, r17 
	RET

	SEDAM:
	CPI R16, 0x21
	BRNE OSAM
	LDI r17, 0X07
	out portc, r17 
	RET

	OSAM:
	CPI R16, 0x42
	BRNE DEVET
	LDI r17, 0X7F
	out portc, r17 
	RET

	DEVET:
	CPI R16, 0x84
	LDI r17, 0X6F
	out portc, r17 
	RET
