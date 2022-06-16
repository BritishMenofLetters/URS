INKREMENT_ZNAMENKE:
	//povecaj jos i binarni brojac

	//povecavanje display znamenku
    lsl r16
	in r17, SREG

	sbrs r17, 0 //skipaj ako je C setan 
ret
	lsr r16
	lsr r16
	inc r16
ret


DEKREMENT_ZNAMENKE:
	lsr r16
	in r17, SREG
	
	sbrs r17, 0
ret
	lsl r16
	lsl r16
	ori r16, 0x80
ret

