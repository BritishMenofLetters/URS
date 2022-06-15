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
