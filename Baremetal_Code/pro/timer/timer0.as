opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 6446"

opt pagewidth 120

	opt lm

	processor	16F877A
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
	FNCALL	_main,_Timer0_Init
	FNCALL	_main,_Delay_sec_Timer0
	FNCALL	_Delay_sec_Timer0,___wmul
	FNROOT	_main
	global	_PORTB
psect	text79,local,class=CODE,delta=2
global __ptext79
__ptext79:
_PORTB	set	6
	global	_TMR0
_TMR0	set	1
	global	_T0IF
_T0IF	set	90
	global	_OPTION
_OPTION	set	129
	global	_TRISB
_TRISB	set	134
	file	"timer0.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_Timer0_Init
?_Timer0_Init:	; 0 bytes @ 0x0
	global	??_Timer0_Init
??_Timer0_Init:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?___wmul
?___wmul:	; 2 bytes @ 0x0
	global	___wmul@multiplier
___wmul@multiplier:	; 2 bytes @ 0x0
	ds	2
	global	___wmul@multiplicand
___wmul@multiplicand:	; 2 bytes @ 0x2
	ds	2
	global	??___wmul
??___wmul:	; 0 bytes @ 0x4
	global	___wmul@product
___wmul@product:	; 2 bytes @ 0x4
	ds	2
	global	?_Delay_sec_Timer0
?_Delay_sec_Timer0:	; 0 bytes @ 0x6
	global	Delay_sec_Timer0@Delay
Delay_sec_Timer0@Delay:	; 2 bytes @ 0x6
	ds	2
	global	??_Delay_sec_Timer0
??_Delay_sec_Timer0:	; 0 bytes @ 0x8
	global	??_main
??_main:	; 0 bytes @ 0x8
;;Data sizes: Strings 0, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      8       8
;; BANK0           80      0       0
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?___wmul	unsigned int  size(1) Largest target is 0
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_Delay_sec_Timer0
;;   _Delay_sec_Timer0->___wmul
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 0     0      0      90
;;                        _Timer0_Init
;;                   _Delay_sec_Timer0
;; ---------------------------------------------------------------------------------
;; (1) _Delay_sec_Timer0                                     2     0      2      90
;;                                              6 COMMON     2     0      2
;;                             ___wmul
;; ---------------------------------------------------------------------------------
;; (2) ___wmul                                               6     2      4      60
;;                                              0 COMMON     6     2      4
;; ---------------------------------------------------------------------------------
;; (1) _Timer0_Init                                          0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _Timer0_Init
;;   _Delay_sec_Timer0
;;     ___wmul
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      8       8       1       57.1%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       2       2        0.0%
;;ABS                  0      0       0       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0       0      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 6 in file "../../app/inc/..\..\platform\..\core\drv\adc\inc\adc_driver.h"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_Timer0_Init
;;		_Delay_sec_Timer0
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"../../app/inc/..\..\platform\..\core\drv\adc\inc\adc_driver.h"
	line	6
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 8
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	8
	
l2332:	
;..\..\platform\..\core\drv\adc\inc\adc_driver.h: 8: TRISB=0X00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(134)^080h	;volatile
	line	9
;..\..\platform\..\core\drv\adc\inc\adc_driver.h: 9: PORTB=0X00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(6)	;volatile
	line	10
	
l2334:	
;..\..\platform\..\core\drv\adc\inc\adc_driver.h: 10: Timer0_Init();
	fcall	_Timer0_Init
	line	12
;..\..\platform\..\core\drv\adc\inc\adc_driver.h: 12: while(1)
	
l563:	
	line	16
	
l2336:	
;..\..\platform\..\core\drv\adc\inc\adc_driver.h: 13: {
;..\..\platform\..\core\drv\adc\inc\adc_driver.h: 16: PORTB = ~PORTB;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	comf	(6),f	;volatile
	line	17
	
l2338:	
;..\..\platform\..\core\drv\adc\inc\adc_driver.h: 17: Delay_sec_Timer0(1);
	movlw	low(01h)
	movwf	(?_Delay_sec_Timer0)
	movlw	high(01h)
	movwf	((?_Delay_sec_Timer0))+1
	fcall	_Delay_sec_Timer0
	line	20
	
l564:	
	line	12
	goto	l563
	
l565:	
	line	21
	
l566:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_Delay_sec_Timer0
psect	text80,local,class=CODE,delta=2
global __ptext80
__ptext80:

;; *************** function _Delay_sec_Timer0 *****************
;; Defined at:
;;		line 29 in file "../../app/inc/..\..\platform\..\core\drv\adc\inc\adc_driver.h"
;; Parameters:    Size  Location     Type
;;  Delay           2    6[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___wmul
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text80
	file	"../../app/inc/..\..\platform\..\core\drv\adc\inc\adc_driver.h"
	line	29
	global	__size_of_Delay_sec_Timer0
	__size_of_Delay_sec_Timer0	equ	__end_of_Delay_sec_Timer0-_Delay_sec_Timer0
	
_Delay_sec_Timer0:	
	opt	stack 7
; Regs used in _Delay_sec_Timer0: [wreg+status,2+status,0+pclath+cstack]
	line	30
	
l2324:	
;..\..\platform\..\core\drv\adc\inc\adc_driver.h: 30: Delay *= 1000;
	movlw	low(03E8h)
	movwf	(?___wmul)
	movlw	high(03E8h)
	movwf	((?___wmul))+1
	movf	(Delay_sec_Timer0@Delay+1),w
	clrf	1+(?___wmul)+02h
	addwf	1+(?___wmul)+02h
	movf	(Delay_sec_Timer0@Delay),w
	clrf	0+(?___wmul)+02h
	addwf	0+(?___wmul)+02h

	fcall	___wmul
	movf	(1+(?___wmul)),w
	clrf	(Delay_sec_Timer0@Delay+1)
	addwf	(Delay_sec_Timer0@Delay+1)
	movf	(0+(?___wmul)),w
	clrf	(Delay_sec_Timer0@Delay)
	addwf	(Delay_sec_Timer0@Delay)

	line	31
;..\..\platform\..\core\drv\adc\inc\adc_driver.h: 31: while(Delay>0)
	goto	l1137
	
l1138:	
	line	34
;..\..\platform\..\core\drv\adc\inc\adc_driver.h: 32: {
;..\..\platform\..\core\drv\adc\inc\adc_driver.h: 34: while(T0IF==0);
	goto	l1139
	
l1140:	
	
l1139:	
	btfss	(90/8),(90)&7
	goto	u2161
	goto	u2160
u2161:
	goto	l1140
u2160:
	
l1141:	
	line	35
	
l2326:	
;..\..\platform\..\core\drv\adc\inc\adc_driver.h: 35: TMR0=0X06;
	movlw	(06h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(1)	;volatile
	line	36
	
l2328:	
;..\..\platform\..\core\drv\adc\inc\adc_driver.h: 36: T0IF=0;
	bcf	(90/8),(90)&7
	line	37
;..\..\platform\..\core\drv\adc\inc\adc_driver.h: 37: Delay--;
	movlw	low(01h)
	subwf	(Delay_sec_Timer0@Delay),f
	movlw	high(01h)
	skipc
	decf	(Delay_sec_Timer0@Delay+1),f
	subwf	(Delay_sec_Timer0@Delay+1),f
	line	38
	
l1137:	
	line	31
	
l2330:	
	movf	((Delay_sec_Timer0@Delay+1)),w
	iorwf	((Delay_sec_Timer0@Delay)),w
	skipz
	goto	u2171
	goto	u2170
u2171:
	goto	l1138
u2170:
	
l1142:	
	line	39
	
l1143:	
	return
	opt stack 0
GLOBAL	__end_of_Delay_sec_Timer0
	__end_of_Delay_sec_Timer0:
;; =============== function _Delay_sec_Timer0 ends ============

	signat	_Delay_sec_Timer0,4216
	global	___wmul
psect	text81,local,class=CODE,delta=2
global __ptext81
__ptext81:

;; *************** function ___wmul *****************
;; Defined at:
;;		line 3 in file "C:\Program Files\HI-TECH Software\PICC\9.71a\sources\wmul.c"
;; Parameters:    Size  Location     Type
;;  multiplier      2    0[COMMON] unsigned int 
;;  multiplicand    2    2[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  product         2    4[COMMON] unsigned int 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         6       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Delay_sec_Timer0
;; This function uses a non-reentrant model
;;
psect	text81
	file	"C:\Program Files\HI-TECH Software\PICC\9.71a\sources\wmul.c"
	line	3
	global	__size_of___wmul
	__size_of___wmul	equ	__end_of___wmul-___wmul
	
___wmul:	
	opt	stack 6
; Regs used in ___wmul: [wreg+status,2+status,0]
	line	4
	
l1546:	
	movlw	low(0)
	movwf	(___wmul@product)
	movlw	high(0)
	movwf	((___wmul@product))+1
	line	6
	
l1152:	
	line	7
	
l1548:	
	btfss	(___wmul@multiplier),(0)&7
	goto	u51
	goto	u50
u51:
	goto	l1153
u50:
	line	8
	
l1550:	
	movf	(___wmul@multiplicand),w
	addwf	(___wmul@product),f
	skipnc
	incf	(___wmul@product+1),f
	movf	(___wmul@multiplicand+1),w
	addwf	(___wmul@product+1),f
	
l1153:	
	line	9
	movlw	01h
	
u65:
	clrc
	rlf	(___wmul@multiplicand),f
	rlf	(___wmul@multiplicand+1),f
	addlw	-1
	skipz
	goto	u65
	line	10
	
l1552:	
	movlw	01h
	
u75:
	clrc
	rrf	(___wmul@multiplier+1),f
	rrf	(___wmul@multiplier),f
	addlw	-1
	skipz
	goto	u75
	line	11
	movf	((___wmul@multiplier+1)),w
	iorwf	((___wmul@multiplier)),w
	skipz
	goto	u81
	goto	u80
u81:
	goto	l1152
u80:
	
l1154:	
	line	12
	
l1554:	
	movf	(___wmul@product+1),w
	clrf	(?___wmul+1)
	addwf	(?___wmul+1)
	movf	(___wmul@product),w
	clrf	(?___wmul)
	addwf	(?___wmul)

	
l1556:	
	line	13
	
l1155:	
	return
	opt stack 0
GLOBAL	__end_of___wmul
	__end_of___wmul:
;; =============== function ___wmul ends ============

	signat	___wmul,8314
	global	_Timer0_Init
psect	text82,local,class=CODE,delta=2
global __ptext82
__ptext82:

;; *************** function _Timer0_Init *****************
;; Defined at:
;;		line 7 in file "../../app/inc/..\..\platform\..\core\drv\adc\inc\adc_driver.h"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text82
	file	"../../app/inc/..\..\platform\..\core\drv\adc\inc\adc_driver.h"
	line	7
	global	__size_of_Timer0_Init
	__size_of_Timer0_Init	equ	__end_of_Timer0_Init-_Timer0_Init
	
_Timer0_Init:	
	opt	stack 7
; Regs used in _Timer0_Init: [wreg]
	line	9
	
l1524:	
;..\..\platform\..\core\drv\adc\inc\adc_driver.h: 9: OPTION=0x01;
	movlw	(01h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(129)^080h	;volatile
	line	10
;..\..\platform\..\core\drv\adc\inc\adc_driver.h: 10: TMR0=0X06;
	movlw	(06h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(1)	;volatile
	line	12
	
l1125:	
	return
	opt stack 0
GLOBAL	__end_of_Timer0_Init
	__end_of_Timer0_Init:
;; =============== function _Timer0_Init ends ============

	signat	_Timer0_Init,88
psect	text83,local,class=CODE,delta=2
global __ptext83
__ptext83:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
