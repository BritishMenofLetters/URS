delay:

		ldi	iLoopRl,LOW(iVal)	; intialize inner loop count in inner
		ldi	iLoopRh,HIGH(iVal)	; loop high and low registers

iLoop:	sbiw	iLoopRl,1		; decrement inner loop registers
		brne	iLoop			; branch to iLoop if iLoop registers != 0

		brne	delay			; branch to oLoop if outer loop register != 0
ret
