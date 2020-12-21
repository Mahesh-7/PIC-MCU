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
	FNCALL	_main,_lcd_init
	FNCALL	_main,_lcd_string
	FNCALL	_main,_lcd_cmd
	FNCALL	_main,_lcd_char
	FNCALL	_lcd_init,_lcd_cmd
	FNCALL	_lcd_string,_lcd_char
	FNROOT	_main
	global	_PORTB
psect	text84,local,class=CODE,delta=2
global __ptext84
__ptext84:
_PORTB	set	6
	global	_PORTE
_PORTE	set	9
	global	_RE0
_RE0	set	72
	global	_RE1
_RE1	set	73
	global	_RE2
_RE2	set	74
	global	_ADCON1
_ADCON1	set	159
	global	_TRISB
_TRISB	set	134
	global	_TRISE
_TRISE	set	137
psect	strings,class=STRING,delta=2
global __pstrings
__pstrings:
;	global	stringdir,stringtab,__stringbase
stringtab:
;	String table - string pointers are 1 byte each
stringcode:stringdir:
movlw high(stringdir)
movwf pclath
movf fsr,w
incf fsr
	addwf pc
__stringbase:
	retlw	0
psect	strings
	
STR_1:	
	retlw	104	;'h'
	retlw	101	;'e'
	retlw	108	;'l'
	retlw	108	;'l'
	retlw	111	;'o'
	retlw	32	;' '
	retlw	119	;'w'
	retlw	111	;'o'
	retlw	114	;'r'
	retlw	108	;'l'
	retlw	100	;'d'
	retlw	0
psect	strings
	file	"lcd.as"
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
	global	?_lcd_cmd
?_lcd_cmd:	; 0 bytes @ 0x0
	global	??_lcd_cmd
??_lcd_cmd:	; 0 bytes @ 0x0
	global	?_lcd_char
?_lcd_char:	; 0 bytes @ 0x0
	global	??_lcd_char
??_lcd_char:	; 0 bytes @ 0x0
	global	?_lcd_string
?_lcd_string:	; 0 bytes @ 0x0
	global	?_lcd_init
?_lcd_init:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	ds	2
	global	lcd_cmd@cmd
lcd_cmd@cmd:	; 1 bytes @ 0x2
	global	lcd_char@data
lcd_char@data:	; 1 bytes @ 0x2
	ds	1
	global	??_lcd_string
??_lcd_string:	; 0 bytes @ 0x3
	global	??_lcd_init
??_lcd_init:	; 0 bytes @ 0x3
	ds	1
	global	lcd_string@ptr
lcd_string@ptr:	; 1 bytes @ 0x4
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x5
;;Data sizes: Strings 12, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      5       5
;; BANK0           80      0       0
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; lcd_string@ptr	PTR const unsigned char  size(1) Largest target is 12
;;		 -> STR_1(CODE[12]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_lcd_string
;;   _lcd_init->_lcd_cmd
;;   _lcd_string->_lcd_char
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
;;                           _lcd_init
;;                         _lcd_string
;;                            _lcd_cmd
;;                           _lcd_char
;; ---------------------------------------------------------------------------------
;; (1) _lcd_init                                             0     0      0      15
;;                            _lcd_cmd
;; ---------------------------------------------------------------------------------
;; (1) _lcd_string                                           2     2      0      45
;;                                              3 COMMON     2     2      0
;;                           _lcd_char
;; ---------------------------------------------------------------------------------
;; (1) _lcd_char                                             3     3      0      15
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; (1) _lcd_cmd                                              3     3      0      15
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 1
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _lcd_init
;;     _lcd_cmd
;;   _lcd_string
;;     _lcd_char
;;   _lcd_cmd
;;   _lcd_char
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      5       5       1       35.7%
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
;;		line 10 in file "../../app/inc/..\..\platform\..\core\drv\uart\inc\uart_driver.h"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
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
;;		_lcd_init
;;		_lcd_string
;;		_lcd_cmd
;;		_lcd_char
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"../../app/inc/..\..\platform\..\core\drv\uart\inc\uart_driver.h"
	line	10
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 8
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	11
	
l2344:	
;..\..\platform\..\core\drv\uart\inc\uart_driver.h: 11: lcd_init();
	fcall	_lcd_init
	line	12
	
l2346:	
;..\..\platform\..\core\drv\uart\inc\uart_driver.h: 12: lcd_string("hello world");
	movlw	((STR_1-__stringbase))&0ffh
	fcall	_lcd_string
	line	13
	
l2348:	
;..\..\platform\..\core\drv\uart\inc\uart_driver.h: 13: lcd_cmd(0xc0);
	movlw	(0C0h)
	fcall	_lcd_cmd
	line	14
	
l2350:	
;..\..\platform\..\core\drv\uart\inc\uart_driver.h: 14: lcd_char('d');
	movlw	(064h)
	fcall	_lcd_char
	line	16
;..\..\platform\..\core\drv\uart\inc\uart_driver.h: 16: while(1)
	
l1140:	
	line	19
;..\..\platform\..\core\drv\uart\inc\uart_driver.h: 17: {
	
l1141:	
	line	16
	goto	l1140
	
l1142:	
	line	21
	
l1143:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_lcd_init
psect	text85,local,class=CODE,delta=2
global __ptext85
__ptext85:

;; *************** function _lcd_init *****************
;; Defined at:
;;		line 40 in file "C:\Users\user.user-PC\Desktop\PIC-MCU\Baremetal_Code\core\drv\lcd\src\lcd_driver.c"
;; Parameters:    Size  Location     Type
;;		None
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
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_lcd_cmd
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text85
	file	"C:\Users\user.user-PC\Desktop\PIC-MCU\Baremetal_Code\core\drv\lcd\src\lcd_driver.c"
	line	40
	global	__size_of_lcd_init
	__size_of_lcd_init	equ	__end_of_lcd_init-_lcd_init
	
_lcd_init:	
	opt	stack 7
; Regs used in _lcd_init: [wreg+status,2+status,0+pclath+cstack]
	line	41
	
l2326:	
;lcd_driver.c: 41: ADCON1=0x06;
	movlw	(06h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(159)^080h	;volatile
	line	42
	
l2328:	
;lcd_driver.c: 42: TRISB=0X00;
	clrf	(134)^080h	;volatile
	line	43
	
l2330:	
;lcd_driver.c: 43: PORTB=0X00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(6)	;volatile
	line	44
	
l2332:	
;lcd_driver.c: 44: TRISE=0X00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(137)^080h	;volatile
	line	45
	
l2334:	
;lcd_driver.c: 45: PORTE=0X00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(9)	;volatile
	line	47
	
l2336:	
;lcd_driver.c: 47: lcd_cmd(0x0e);
	movlw	(0Eh)
	fcall	_lcd_cmd
	line	48
	
l2338:	
;lcd_driver.c: 48: lcd_cmd(0x01);
	movlw	(01h)
	fcall	_lcd_cmd
	line	49
	
l2340:	
;lcd_driver.c: 49: lcd_cmd(0x38);
	movlw	(038h)
	fcall	_lcd_cmd
	line	50
	
l2342:	
;lcd_driver.c: 50: lcd_cmd(0x80);
	movlw	(080h)
	fcall	_lcd_cmd
	line	51
	
l573:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_init
	__end_of_lcd_init:
;; =============== function _lcd_init ends ============

	signat	_lcd_init,88
	global	_lcd_string
psect	text86,local,class=CODE,delta=2
global __ptext86
__ptext86:

;; *************** function _lcd_string *****************
;; Defined at:
;;		line 30 in file "C:\Users\user.user-PC\Desktop\PIC-MCU\Baremetal_Code\core\drv\lcd\src\lcd_driver.c"
;; Parameters:    Size  Location     Type
;;  ptr             1    wreg     PTR const unsigned char 
;;		 -> STR_1(12), 
;; Auto vars:     Size  Location     Type
;;  ptr             1    4[COMMON] PTR const unsigned char 
;;		 -> STR_1(12), 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_lcd_char
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text86
	file	"C:\Users\user.user-PC\Desktop\PIC-MCU\Baremetal_Code\core\drv\lcd\src\lcd_driver.c"
	line	30
	global	__size_of_lcd_string
	__size_of_lcd_string	equ	__end_of_lcd_string-_lcd_string
	
_lcd_string:	
	opt	stack 7
; Regs used in _lcd_string: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;lcd_string@ptr stored from wreg
	movwf	(lcd_string@ptr)
	line	31
	
l2318:	
;lcd_driver.c: 31: while(*ptr)
	goto	l567
	
l568:	
	line	33
	
l2320:	
;lcd_driver.c: 32: {
;lcd_driver.c: 33: lcd_char(*ptr);
	movf	(lcd_string@ptr),w
	movwf	fsr0
	fcall	stringdir
	fcall	_lcd_char
	line	34
	
l2322:	
;lcd_driver.c: 34: ptr++;
	movlw	(01h)
	movwf	(??_lcd_string+0)+0
	movf	(??_lcd_string+0)+0,w
	addwf	(lcd_string@ptr),f
	line	36
	
l567:	
	line	31
	
l2324:	
	movf	(lcd_string@ptr),w
	movwf	fsr0
	fcall	stringdir
	iorlw	0
	skipz
	goto	u2141
	goto	u2140
u2141:
	goto	l568
u2140:
	
l569:	
	line	37
	
l570:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_string
	__end_of_lcd_string:
;; =============== function _lcd_string ends ============

	signat	_lcd_string,4216
	global	_lcd_char
psect	text87,local,class=CODE,delta=2
global __ptext87
__ptext87:

;; *************** function _lcd_char *****************
;; Defined at:
;;		line 19 in file "C:\Users\user.user-PC\Desktop\PIC-MCU\Baremetal_Code\core\drv\lcd\src\lcd_driver.c"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1    2[COMMON] unsigned char 
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
;;      Locals:         1       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_lcd_string
;;		_main
;; This function uses a non-reentrant model
;;
psect	text87
	file	"C:\Users\user.user-PC\Desktop\PIC-MCU\Baremetal_Code\core\drv\lcd\src\lcd_driver.c"
	line	19
	global	__size_of_lcd_char
	__size_of_lcd_char	equ	__end_of_lcd_char-_lcd_char
	
_lcd_char:	
	opt	stack 7
; Regs used in _lcd_char: [wreg]
;lcd_char@data stored from wreg
	line	21
	movwf	(lcd_char@data)
	
l2310:	
;lcd_driver.c: 21: RE0=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(72/8),(72)&7
	line	22
;lcd_driver.c: 22: RE1=0;
	bcf	(73/8),(73)&7
	line	23
	
l2312:	
;lcd_driver.c: 23: PORTB=data;
	movf	(lcd_char@data),w
	movwf	(6)	;volatile
	line	24
	
l2314:	
;lcd_driver.c: 24: RE2=1;
	bsf	(74/8),(74)&7
	line	25
;lcd_driver.c: 25: _delay((unsigned long)((1)*(40000000/4000.0)));
	opt asmopt_off
movlw	13
movwf	((??_lcd_char+0)+0+1),f
	movlw	251
movwf	((??_lcd_char+0)+0),f
u2157:
	decfsz	((??_lcd_char+0)+0),f
	goto	u2157
	decfsz	((??_lcd_char+0)+0+1),f
	goto	u2157
	nop2
opt asmopt_on

	line	26
	
l2316:	
;lcd_driver.c: 26: RE2=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(74/8),(74)&7
	line	28
	
l564:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_char
	__end_of_lcd_char:
;; =============== function _lcd_char ends ============

	signat	_lcd_char,4216
	global	_lcd_cmd
psect	text88,local,class=CODE,delta=2
global __ptext88
__ptext88:

;; *************** function _lcd_cmd *****************
;; Defined at:
;;		line 9 in file "C:\Users\user.user-PC\Desktop\PIC-MCU\Baremetal_Code\core\drv\lcd\src\lcd_driver.c"
;; Parameters:    Size  Location     Type
;;  cmd             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  cmd             1    2[COMMON] unsigned char 
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
;;      Locals:         1       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_lcd_init
;;		_main
;; This function uses a non-reentrant model
;;
psect	text88
	file	"C:\Users\user.user-PC\Desktop\PIC-MCU\Baremetal_Code\core\drv\lcd\src\lcd_driver.c"
	line	9
	global	__size_of_lcd_cmd
	__size_of_lcd_cmd	equ	__end_of_lcd_cmd-_lcd_cmd
	
_lcd_cmd:	
	opt	stack 7
; Regs used in _lcd_cmd: [wreg]
;lcd_cmd@cmd stored from wreg
	movwf	(lcd_cmd@cmd)
	line	10
	
l2302:	
;lcd_driver.c: 10: RE0=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(72/8),(72)&7
	line	11
;lcd_driver.c: 11: RE1=0;
	bcf	(73/8),(73)&7
	line	12
	
l2304:	
;lcd_driver.c: 12: PORTB=cmd;
	movf	(lcd_cmd@cmd),w
	movwf	(6)	;volatile
	line	13
	
l2306:	
;lcd_driver.c: 13: RE2=1;
	bsf	(74/8),(74)&7
	line	14
;lcd_driver.c: 14: _delay((unsigned long)((1)*(40000000/4000.0)));
	opt asmopt_off
movlw	13
movwf	((??_lcd_cmd+0)+0+1),f
	movlw	251
movwf	((??_lcd_cmd+0)+0),f
u2167:
	decfsz	((??_lcd_cmd+0)+0),f
	goto	u2167
	decfsz	((??_lcd_cmd+0)+0+1),f
	goto	u2167
	nop2
opt asmopt_on

	line	15
	
l2308:	
;lcd_driver.c: 15: RE2=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(74/8),(74)&7
	line	16
	
l561:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_cmd
	__end_of_lcd_cmd:
;; =============== function _lcd_cmd ends ============

	signat	_lcd_cmd,4216
psect	text89,local,class=CODE,delta=2
global __ptext89
__ptext89:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
