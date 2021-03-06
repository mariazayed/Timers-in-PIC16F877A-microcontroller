;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Eman Karaja

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



	PROCESSOR '16F877A'

	INCLUDE <P16F877A.INC>



	__CONFIG _XT_OSC & _WDT_OFF & _PWRTE_OFF & _CP_OFF & _LVP_OFF & _BODEN_OFF


;;--------------------- Variables to carry the multiple of 0.1 sec ------------------------

LED1 EQU 0x20 ;DELAY COUNTER: COUNTS THE INTERUPS FROM TMR0
LED2 EQU 0x21 ;DELAY COUNTER: COUNTS THE INTERUPS FROM TMR0
LED3 EQU 0x22 ;DELAY COUNTER: COUNTS THE INTERUPS FROM TMR0
LED4 EQU 0x23 ;DELAY COUNTER: COUNTS THE INTERUPS FROM TMR0
LED5 EQU 0x24 ;DELAY COUNTER: COUNTS THE INTERUPS FROM TMR0
LED6 EQU 0x25 ;DELAY COUNTER: COUNTS THE INTERUPS FROM TMR0
LED7 EQU 0x26 ;DELAY COUNTER: COUNTS THE INTERUPS FROM TMR0
LED8 EQU 0x27 ;DELAY COUNTER: COUNTS THE INTERUPS FROM TMR0
LED9 EQU 0x28 ;DELAY COUNTER: COUNTS THE INTERUPS FROM TMR0
LED10 EQU 0x29 ;DELAY COUNTER: COUNTS THE INTERUPS FROM TMR0
LED11 EQU 0x30 ;DELAY COUNTER: COUNTS THE INTERUPS FROM TMR0
LED12 EQU 0x31 ;DELAY COUNTER: COUNTS THE INTERUPS FROM TMR0
LED13 EQU 0x32 ;DELAY COUNTER: COUNTS THE INTERUPS FROM TMR0
LED14 EQU 0x33 ;DELAY COUNTER: COUNTS THE INTERUPS FROM TMR0
LED15 EQU 0x34 ;DELAY COUNTER: COUNTS THE INTERUPS FROM TMR0
LED16 EQU 0x35 ;DELAY COUNTER: COUNTS THE INTERUPS FROM TMR0
LED17 EQU 0x36 ;DELAY COUNTER: COUNTS THE INTERUPS FROM TMR0
LED18 EQU 0x37 ;DELAY COUNTER: COUNTS THE INTERUPS FROM TMR0
LED19 EQU 0x38 ;DELAY COUNTER: COUNTS THE INTERUPS FROM TMR0
LED20 EQU 0x39 ;DELAY COUNTER: COUNTS THE INTERUPS FROM TMR0

ACTIVE1 EQU 0x40
ACTIVE2 EQU 0x41
ACTIVE3 EQU 0x42


	ORG 0x0000

	GOTO INIT

	ORG 0x0004

	GOTO TMR_CNT

	

INIT:

	BSF STATUS, RP0 ;SELECT BANK 01

	MOVLW B'11000111' ; PSA = 1/256 (THE TIMER WILL COUNT ONCE EVERY 256 CYCLES)

	MOVWF OPTION_REG ;AND USE INTERNAL INSTRUCTION CYCLE CLOCK


;-------------- initialize the PORTS as output ---------------------------------------	
	MOVLW 0x00
	MOVWF TRISB ;SET PB as output

	MOVLW 0x00
	MOVWF TRISC ;SET PB as output

	MOVLW 0x00
	MOVWF TRISD ;SET PB as output


	BCF STATUS, RP0 ;SELECT BANK 00
	
;---------------------------------- GIVE THE PORTS value of ZERO ------------------------------
	MOVLW 0x00
	MOVWF PORTB ;SET PB as 0

	MOVLW 0x00
	MOVWF PORTC ;SET PB as 0

	MOVLW 0x00
	MOVWF PORTD ;SET PB as 0

	
;	MOVLW 0
	;MOVWF TMR0 
	CLRF TMR0
	MOVLW B'11100000' ;ENABLE TIMER 0 INTERUPT

	MOVWF INTCON

	
;---------- fill the value of each counter  --------------------------------- ------------------

	MOVLW 0x01 ;256 * 256 * 15 = ABOUT 1S

	MOVWF LED1 ;SO WE SET THE DELAY COUNTER TO COUNT 15 INTERUPTS

	MOVLW 0x02 

	MOVWF LED2 ;SO WE SET THE DELAY COUNTER TO COUNT 15 INTERUPTS

	MOVLW 0x03 

	MOVWF LED3 ;SO WE SET THE DELAY COUNTER TO COUNT 15 INTERUPTS
	
	MOVLW 0x04 

	MOVWF LED4 ;SO WE SET THE DELAY COUNTER TO COUNT 15 INTERUPTS

	MOVLW 0x05 

	MOVWF LED5 ;SO WE SET THE DELAY COUNTER TO COUNT 15 INTERUPTS

	MOVLW 0x06 

	MOVWF LED6 ;SO WE SET THE DELAY COUNTER TO COUNT 15 INTERUPTS
	MOVLW 0x07 

	MOVWF LED7 ;SO WE SET THE DELAY COUNTER TO COUNT 15 INTERUPTS
	
	MOVLW 0x08 

	MOVWF LED8 ;SO WE SET THE DELAY COUNTER TO COUNT 15 INTERUPTS

	MOVLW 0x09 

	MOVWF LED9 ;SO WE SET THE DELAY COUNTER TO COUNT 15 INTERUPTS

	MOVLW 0x0a 

	MOVWF LED10 ;SO WE SET THE DELAY COUNTER TO COUNT 15 INTERUPTS
	MOVLW 0x0b 

	MOVWF LED11 ;SO WE SET THE DELAY COUNTER TO COUNT 15 INTERUPTS
	
	MOVLW 0x0c

	MOVWF LED12 ;SO WE SET THE DELAY COUNTER TO COUNT 15 INTERUPTS

	MOVLW 0x0d

	MOVWF LED13 ;SO WE SET THE DELAY COUNTER TO COUNT 15 INTERUPTS

	MOVLW 0x0e 

	MOVWF LED14 ;SO WE SET THE DELAY COUNTER TO COUNT 15 INTERUPTS

	MOVLW 0x0f 

	MOVWF LED15 ;SO WE SET THE DELAY COUNTER TO COUNT 15 INTERUPTS

	MOVLW 0x10 

	MOVWF LED16 ;SO WE SET THE DELAY COUNTER TO COUNT 15 INTERUPTS

	MOVLW 0x11 

	MOVWF LED17 ;SO WE SET THE DELAY COUNTER TO COUNT 15 INTERUPTS
	MOVLW 0x12 

	MOVWF LED18 ;SO WE SET THE DELAY COUNTER TO COUNT 15 INTERUPTS
	
	MOVLW 0x13

	MOVWF LED19 ;SO WE SET THE DELAY COUNTER TO COUNT 15 INTERUPTS

	MOVLW 0x14

	MOVWF LED20 ;SO WE SET THE DELAY COUNTER TO COUNT 15 INTERUPTS

;------------ Initialize the ACTIVE ---------------------------------------------------------
	MOVLW 0xff
	MOVWF ACTIVE1 ;SO WE SET THE DELAY COUNTER TO COUNT 15 INTERUPTS
	MOVLW 0xff
	MOVWF ACTIVE2 ;SO WE SET THE DELAY COUNTER TO COUNT 15 INTERUPTS
	MOVLW 0xff
	MOVWF ACTIVE3 ;SO WE SET THE DELAY COUNTER TO COUNT 15 INTERUPTS

;------------------------ MAIN -----------------------------------------------------------------
MAIN:

	GOTO $ ;DO NOTHING, JUST WAIT FOR AN INTERUPT

	

TMR_CNT:

	BCF INTCON, GIE ;DISABLE ALL INTERUPTS

	BCF INTCON, TMR0IF ;CLEAR TMR0 OVERFLOW FLAG


T1:
	DECFSZ LED1 ;WHEN THE DELAY COUNTER BECOMES ZERO(go to CONTINUE of it's zero)

	GOTO T2

	BTFSC PORTB, 0 ;THEN IF PB0 IS SET

	GOTO CLR_1 ;CLEAR IT
	
	BTFSS ACTIVE1, 0 ;IF pin IS 0, then skip making it ON
	GOTO DISABLE1
	BSF PORTB, 0 ;ELSE IF IS CLEARED, THEN SET IT
	DISABLE1:

	GOTO CONTINUE_1
T2:

	
	DECFSZ LED2 ;WHEN THE DELAY COUNTER BECOMES ZERO(go to CONTINUE of it's zero)

	GOTO T3
	
	BTFSC PORTB, 1 ;THEN IF PB0 IS SET

	GOTO CLR_2 ;CLEAR IT

	BTFSS ACTIVE1, 1 ;IF pin IS 0, then skip making it ON
	GOTO DISABLE2
	BSF PORTB, 1 ;ELSE IF IS CLEARED, THEN SET IT
	DISABLE2:
	
	GOTO CONTINUE_2

T3:

	
	DECFSZ LED3 ;WHEN THE DELAY COUNTER BECOMES ZERO(go to CONTINUE of it's zero)

	GOTO T4
	
	BTFSC PORTB, 2 ;THEN IF PB0 IS SET

	GOTO CLR_3 ;CLEAR IT

	BTFSS ACTIVE1, 2 ;IF pin IS 0, then skip making it ON
	GOTO DISABLE3
	BSF PORTB, 2 ;ELSE IF IS CLEARED, THEN SET IT
	DISABLE3:
	
	GOTO CONTINUE_3


T4:

	
	DECFSZ LED4 ;WHEN THE DELAY COUNTER BECOMES ZERO(go to CONTINUE of it's zero)

	GOTO T5
	
	BTFSC PORTB, 3 ;THEN IF PB0 IS SET

	GOTO CLR_4 ;CLEAR IT

	BTFSS ACTIVE1, 3 ;IF pin IS 0, then skip making it ON
	GOTO DISABLE4
	BSF PORTB, 3 ;ELSE IF IS CLEARED, THEN SET IT
	DISABLE4:
	
	GOTO CONTINUE_4

T5:

	
	DECFSZ LED5 ;WHEN THE DELAY COUNTER BECOMES ZERO(go to CONTINUE of it's zero)

	GOTO T6
	
	BTFSC PORTB, 4 ;THEN IF PB0 IS SET

	GOTO CLR_5 ;CLEAR IT

	BTFSS ACTIVE1, 4 ;IF pin IS 0, then skip making it ON
	GOTO DISABLE5
	BSF PORTB, 4 ;ELSE IF IS CLEARED, THEN SET IT
	DISABLE5:
	
	GOTO CONTINUE_5

T6:

	
	DECFSZ LED6 ;WHEN THE DELAY COUNTER BECOMES ZERO(go to CONTINUE of it's zero)

	GOTO T7
	
	BTFSC PORTB, 5 ;THEN IF PB0 IS SET

	GOTO CLR_6 ;CLEAR IT

	BTFSS ACTIVE1, 5 ;IF pin IS 0, then skip making it ON
	GOTO DISABLE6
	BSF PORTB, 5 ;ELSE IF IS CLEARED, THEN SET IT
	DISABLE6:
	
	GOTO CONTINUE_6


T7:

	
	DECFSZ LED7 ;WHEN THE DELAY COUNTER BECOMES ZERO(go to CONTINUE of it's zero)

	GOTO T8
	
	BTFSC PORTB, 6 ;THEN IF PB0 IS SET

	GOTO CLR_7 ;CLEAR IT

	BTFSS ACTIVE1, 6 ;IF pin IS 0, then skip making it ON
	GOTO DISABLE7
	BSF PORTB, 6 ;ELSE IF IS CLEARED, THEN SET IT
	DISABLE7:
	
	GOTO CONTINUE_7

T8:

	
	DECFSZ LED8 ;WHEN THE DELAY COUNTER BECOMES ZERO(go to CONTINUE of it's zero)

	GOTO T9
	
	BTFSC PORTB, 7 ;THEN IF PB0 IS SET

	GOTO CLR_8 ;CLEAR IT

	BTFSS ACTIVE1, 7 ;IF pin IS 0, then skip making it ON
	GOTO DISABLE8
	BSF PORTB, 7 ;ELSE IF IS CLEARED, THEN SET IT
	DISABLE8:
	
	GOTO CONTINUE_8


T9:

	
	DECFSZ LED9 ;WHEN THE DELAY COUNTER BECOMES ZERO(go to CONTINUE of it's zero)

	GOTO T10
	
	BTFSC PORTC, 0 ;THEN IF PB0 IS SET

	GOTO CLR_9 ;CLEAR IT

	BTFSS ACTIVE2, 0 ;IF pin IS 0, then skip making it ON
	GOTO DISABLE9
	BSF PORTC, 0 ;ELSE IF IS CLEARED, THEN SET IT
	DISABLE9:
	
	GOTO CONTINUE_9

T10:

	
	DECFSZ LED10 ;WHEN THE DELAY COUNTER BECOMES ZERO(go to CONTINUE of it's zero)

	GOTO T11
	
	BTFSC PORTC, 1 ;THEN IF PB0 IS SET

	GOTO CLR_10 ;CLEAR IT

	BTFSS ACTIVE2, 1 ;IF pin IS 0, then skip making it ON
	GOTO DISABLE10
	BSF PORTC, 1 ;ELSE IF IS CLEARED, THEN SET IT
	DISABLE10:
	
	GOTO CONTINUE_10



T11:

	
	DECFSZ LED11 ;WHEN THE DELAY COUNTER BECOMES ZERO(go to CONTINUE of it's zero)

	GOTO T12
	
	BTFSC PORTC, 2 ;THEN IF PB0 IS SET

	GOTO CLR_11 ;CLEAR IT

	BTFSS ACTIVE2, 2 ;IF pin IS 0, then skip making it ON
	GOTO DISABLE11
	BSF PORTC, 2 ;ELSE IF IS CLEARED, THEN SET IT
	DISABLE11:
	
	GOTO CONTINUE_11


T12:

	
	DECFSZ LED12 ;WHEN THE DELAY COUNTER BECOMES ZERO(go to CONTINUE of it's zero)

	GOTO T13
	
	BTFSC PORTC, 3 ;THEN IF PB0 IS SET

	GOTO CLR_12 ;CLEAR IT

	BTFSS ACTIVE2, 3 ;IF pin IS 0, then skip making it ON
	GOTO DISABLE12
	BSF PORTC, 3 ;ELSE IF IS CLEARED, THEN SET IT
	DISABLE12:
	
	GOTO CONTINUE_12

T13:

	
	DECFSZ LED13 ;WHEN THE DELAY COUNTER BECOMES ZERO(go to CONTINUE of it's zero)

	GOTO T14
	
	BTFSC PORTC, 4 ;THEN IF PB0 IS SET

	GOTO CLR_13 ;CLEAR IT

	BTFSS ACTIVE2, 4 ;IF pin IS 0, then skip making it ON
	GOTO DISABLE13
	BSF PORTC, 4 ;ELSE IF IS CLEARED, THEN SET IT
	DISABLE13:
	
	GOTO CONTINUE_13

T14:

	
	DECFSZ LED14 ;WHEN THE DELAY COUNTER BECOMES ZERO(go to CONTINUE of it's zero)

	GOTO T15
	
	BTFSC PORTC, 5 ;THEN IF PB0 IS SET

	GOTO CLR_14 ;CLEAR IT

	BTFSS ACTIVE2, 5 ;IF pin IS 0, then skip making it ON
	GOTO DISABLE14
	BSF PORTC, 5 ;ELSE IF IS CLEARED, THEN SET IT
	DISABLE14:
	
	GOTO CONTINUE_14


T15:

	
	DECFSZ LED15 ;WHEN THE DELAY COUNTER BECOMES ZERO(go to CONTINUE of it's zero)

	GOTO T16
	
	BTFSC PORTC, 6 ;THEN IF PB0 IS SET

	GOTO CLR_15 ;CLEAR IT

	BTFSS ACTIVE2, 6 ;IF pin IS 0, then skip making it ON
	GOTO DISABLE15
	BSF PORTC, 6 ;ELSE IF IS CLEARED, THEN SET IT
	DISABLE15:
	
	GOTO CONTINUE_15


T16:

	
	DECFSZ LED16 ;WHEN THE DELAY COUNTER BECOMES ZERO(go to CONTINUE of it's zero)

	GOTO T17
	
	BTFSC PORTC, 7 ;THEN IF PB0 IS SET

	GOTO CLR_16 ;CLEAR IT

	BTFSS ACTIVE2, 7 ;IF pin IS 0, then skip making it ON
	GOTO DISABLE16
	BSF PORTC, 7 ;ELSE IF IS CLEARED, THEN SET IT
	DISABLE16:
	
	GOTO CONTINUE_16

T17:

	
	DECFSZ LED17 ;WHEN THE DELAY COUNTER BECOMES ZERO(go to CONTINUE of it's zero)

	GOTO T18
	
	BTFSC PORTD, 0 ;THEN IF PB0 IS SET

	GOTO CLR_17 ;CLEAR IT

	BTFSS ACTIVE3, 0 ;IF pin IS 0, then skip making it ON
	GOTO DISABLE17
	BSF PORTD, 0 ;ELSE IF IS CLEARED, THEN SET IT
	DISABLE17:
	
	GOTO CONTINUE_17


T18:

	
	DECFSZ LED18 ;WHEN THE DELAY COUNTER BECOMES ZERO(go to CONTINUE of it's zero)

	GOTO T19
	
	BTFSC PORTD, 1 ;THEN IF PB0 IS SET

	GOTO CLR_18 ;CLEAR IT

	BTFSS ACTIVE3, 1 ;IF pin IS 0, then skip making it ON
	GOTO DISABLE18
	BSF PORTD, 1 ;ELSE IF IS CLEARED, THEN SET IT
	DISABLE18:
	
	GOTO CONTINUE_18

T19:

	
	DECFSZ LED19 ;WHEN THE DELAY COUNTER BECOMES ZERO(go to CONTINUE of it's zero)

	GOTO T20
	
	BTFSC PORTD, 2 ;THEN IF PB0 IS SET

	GOTO CLR_19 ;CLEAR IT

	BTFSS ACTIVE3, 2 ;IF pin IS 0, then skip making it ON
	GOTO DISABLE19
	BSF PORTD, 2 ;ELSE IF IS CLEARED, THEN SET IT
	DISABLE19:
	
	GOTO CONTINUE_19

T20:

	
	DECFSZ LED20 ;WHEN THE DELAY COUNTER BECOMES ZERO(go to CONTINUE of it's zero)

	GOTO T21
	
	BTFSC PORTD, 3 ;THEN IF PB0 IS SET

	GOTO CLR_20 ;CLEAR IT

	BTFSS ACTIVE3, 3 ;IF pin IS 0, then skip making it ON
	GOTO DISABLE20
	BSF PORTD, 3 ;ELSE IF IS CLEARED, THEN SET IT
	DISABLE20:
	
	GOTO CONTINUE_20
T21:



	GOTO CONTINUE
	


;; Counter 1 --------------------------------
CLR_1:

	BCF PORTB, 0

CONTINUE_1:

	MOVLW 0x01 ;RESET THE DELAY COUNTER

	MOVWF LED1
	GOTO T2
;--------------------------------------------


;; Counter 2 --------------------------------
CLR_2:

	BCF PORTB, 1

CONTINUE_2:

	MOVLW 0x02 ;RESET THE DELAY COUNTER

	MOVWF LED2
	GOTO T3
;--------------------------------------------

;; Counter 3 --------------------------------
CLR_3:

	BCF PORTB, 2

CONTINUE_3:

	MOVLW 0x03 ;RESET THE DELAY COUNTER

	MOVWF LED3
	GOTO T4
;--------------------------------------------

;; Counter 4 --------------------------------
CLR_4:

	BCF PORTB, 3

CONTINUE_4:

	MOVLW 0x04 ;RESET THE DELAY COUNTER

	MOVWF LED4
	GOTO T5
;--------------------------------------------

;; Counter 5 --------------------------------
CLR_5:

	BCF PORTB, 4

CONTINUE_5:

	MOVLW 0x05 ;RESET THE DELAY COUNTER

	MOVWF LED5
	GOTO T6
;--------------------------------------------

;; Counter 6 --------------------------------
CLR_6:

	BCF PORTB, 5

CONTINUE_6:

	MOVLW 0x06 ;RESET THE DELAY COUNTER

	MOVWF LED6
	GOTO T7
;--------------------------------------------

;; Counter 7 --------------------------------
CLR_7:

	BCF PORTB, 6

CONTINUE_7:

	MOVLW 0x07 ;RESET THE DELAY COUNTER

	MOVWF LED7
	GOTO T7
;--------------------------------------------

;; Counter 8 --------------------------------
CLR_8:

	BCF PORTB, 7

CONTINUE_8:

	MOVLW 0x08 ;RESET THE DELAY COUNTER

	MOVWF LED8
	GOTO T9
;--------------------------------------------

;; Counter 9 --------------------------------
CLR_9:

	BCF PORTC, 0

CONTINUE_9:

	MOVLW 0x09 ;RESET THE DELAY COUNTER

	MOVWF LED9
	GOTO T10
;--------------------------------------------

;; Counter 10 --------------------------------
CLR_10:

	BCF PORTC, 1

CONTINUE_10:

	MOVLW 0x0a ;RESET THE DELAY COUNTER

	MOVWF LED10
	GOTO T11
;--------------------------------------------

;; Counter 11 --------------------------------
CLR_11:

	BCF PORTC, 2

CONTINUE_11:

	MOVLW 0x0b ;RESET THE DELAY COUNTER

	MOVWF LED11
	GOTO T12
;--------------------------------------------

;; Counter 12 --------------------------------
CLR_12:

	BCF PORTB, 3

CONTINUE_12:

	MOVLW 0x012 ;RESET THE DELAY COUNTER

	MOVWF LED12
	GOTO T13
;--------------------------------------------

;; Counter 13 --------------------------------
CLR_13:

	BCF PORTC, 4

CONTINUE_13:

	MOVLW 0x0c ;RESET THE DELAY COUNTER

	MOVWF LED13
	GOTO T14
;--------------------------------------------

;; Counter 14 --------------------------------
CLR_14:

	BCF PORTC, 5

CONTINUE_14:

	MOVLW 0x0d ;RESET THE DELAY COUNTER

	MOVWF LED14
	GOTO T15
;--------------------------------------------

;; Counter 15 --------------------------------
CLR_15:

	BCF PORTC, 6

CONTINUE_15:

	MOVLW 0x0f ;RESET THE DELAY COUNTER

	MOVWF LED15
	GOTO T16
;--------------------------------------------

;; Counter 16 --------------------------------
CLR_16:

	BCF PORTC, 7

CONTINUE_16:

	MOVLW 0x10 ;RESET THE DELAY COUNTER

	MOVWF LED16
	GOTO T17
;--------------------------------------------

;; Counter 17 --------------------------------
CLR_17:

	BCF PORTD, 0

CONTINUE_17:

	MOVLW 0x11 ;RESET THE DELAY COUNTER

	MOVWF LED17
	GOTO T18
;--------------------------------------------

;; Counter 18 --------------------------------
CLR_18:

	BCF PORTD, 1

CONTINUE_18:

	MOVLW 0x12 ;RESET THE DELAY COUNTER

	MOVWF LED18
	GOTO T19
;--------------------------------------------

;; Counter 19 --------------------------------
CLR_19:

	BCF PORTD, 2

CONTINUE_19:

	MOVLW 0x13 ;RESET THE DELAY COUNTER

	MOVWF LED19
	GOTO T20
;--------------------------------------------

;; Counter 20 --------------------------------
CLR_20:

	BCF PORTD, 3

CONTINUE_20:

	MOVLW 0x14 ;RESET THE DELAY COUNTER

	MOVWF LED20
	GOTO T21
;--------------------------------------------







CONTINUE:

	BSF INTCON, GIE ;RENABLE THE INTERUPTS

	RETFIE

	

	END