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
	FNCALL	_main,_I2C_master_init
	FNCALL	_main,_delay
	FNCALL	_main,_I2C_start
	FNCALL	_main,_I2C_write_byte
	FNCALL	_main,_I2C_write_string
	FNCALL	_main,_I2C_stop
	FNCALL	_I2C_write_string,_I2C_write_byte
	FNCALL	_I2C_write_string,_delay1
	FNROOT	_main
	global	_PORTB
psect	text126,local,class=CODE,delta=2
global __ptext126
__ptext126:
_PORTB	set	6
	global	_PORTE
_PORTE	set	9
	global	_SSPBUF
_SSPBUF	set	19
	global	_SSPCON
_SSPCON	set	20
	global	_RE0
_RE0	set	72
	global	_RE2
_RE2	set	74
	global	_SSPIF
_SSPIF	set	99
	global	_ADCON1
_ADCON1	set	159
	global	_SSPADD
_SSPADD	set	147
	global	_SSPSTAT
_SSPSTAT	set	148
	global	_TRISB
_TRISB	set	134
	global	_TRISC
_TRISC	set	135
	global	_TRISE
_TRISE	set	137
	global	_ACKDT
_ACKDT	set	1165
	global	_ACKEN
_ACKEN	set	1164
	global	_ACKSTAT
_ACKSTAT	set	1166
	global	_PEN
_PEN	set	1162
	global	_RCEN
_RCEN	set	1163
	global	_RSEN
_RSEN	set	1161
	global	_SEN
_SEN	set	1160
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
	file	"I^2_C.as"
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
	global	?_delay1
?_delay1:	; 0 bytes @ 0x0
	global	??_delay1
??_delay1:	; 0 bytes @ 0x0
	global	?_I2C_master_init
?_I2C_master_init:	; 0 bytes @ 0x0
	global	??_I2C_master_init
??_I2C_master_init:	; 0 bytes @ 0x0
	global	?_I2C_start
?_I2C_start:	; 0 bytes @ 0x0
	global	??_I2C_start
??_I2C_start:	; 0 bytes @ 0x0
	global	?_I2C_stop
?_I2C_stop:	; 0 bytes @ 0x0
	global	??_I2C_stop
??_I2C_stop:	; 0 bytes @ 0x0
	global	??_I2C_write_byte
??_I2C_write_byte:	; 0 bytes @ 0x0
	global	?_I2C_write_string
?_I2C_write_string:	; 0 bytes @ 0x0
	global	?_delay
?_delay:	; 0 bytes @ 0x0
	global	??_delay
??_delay:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_I2C_write_byte
?_I2C_write_byte:	; 1 bytes @ 0x0
	global	I2C_write_byte@byte
I2C_write_byte@byte:	; 1 bytes @ 0x0
	global	delay1@i
delay1@i:	; 2 bytes @ 0x0
	global	delay@i
delay@i:	; 2 bytes @ 0x0
	ds	2
	global	??_I2C_write_string
??_I2C_write_string:	; 0 bytes @ 0x2
	ds	1
	global	I2C_write_string@data
I2C_write_string@data:	; 1 bytes @ 0x3
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x4
;;Data sizes: Strings 12, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      4       4
;; BANK0           80      0       0
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; I2C_write_string@data	PTR unsigned char  size(1) Largest target is 12
;;		 -> STR_1(CODE[12]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_I2C_write_string
;;   _I2C_write_string->_delay1
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
;; (0) _main                                                 0     0      0     120
;;                    _I2C_master_init
;;                              _delay
;;                          _I2C_start
;;                     _I2C_write_byte
;;                   _I2C_write_string
;;                           _I2C_stop
;; ---------------------------------------------------------------------------------
;; (1) _I2C_write_string                                     2     2      0      75
;;                                              2 COMMON     2     2      0
;;                     _I2C_write_byte
;;                             _delay1
;; ---------------------------------------------------------------------------------
;; (1) _delay                                                2     2      0      30
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; (2) _I2C_write_byte                                       1     1      0      15
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _I2C_stop                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _I2C_start                                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _I2C_master_init                                      0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _delay1                                               2     2      0      30
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _I2C_master_init
;;   _delay
;;   _I2C_start
;;   _I2C_write_byte
;;   _I2C_write_string
;;     _I2C_write_byte
;;     _delay1
;;   _I2C_stop
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      4       4       1       28.6%
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
;;		line 11 in file "C:\Users\user.user-PC\Desktop\Devlps\PIC-MCU\Baremetal_Code\app\src\i2c_master.c"
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
;;		_I2C_master_init
;;		_delay
;;		_I2C_start
;;		_I2C_write_byte
;;		_I2C_write_string
;;		_I2C_stop
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\user.user-PC\Desktop\Devlps\PIC-MCU\Baremetal_Code\app\src\i2c_master.c"
	line	11
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 8
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	12
	
l3008:	
;i2c_master.c: 12: I2C_master_init();
	fcall	_I2C_master_init
	line	13
;i2c_master.c: 13: delay();
	fcall	_delay
	line	15
	
l3010:	
;i2c_master.c: 15: I2C_start();delay();
	fcall	_I2C_start
	
l3012:	
	fcall	_delay
	line	16
	
l3014:	
;i2c_master.c: 16: I2C_write_byte(0x26);delay();
	movlw	(026h)
	fcall	_I2C_write_byte
	
l3016:	
	fcall	_delay
	line	18
	
l3018:	
;i2c_master.c: 18: I2C_write_byte('a');delay();
	movlw	(061h)
	fcall	_I2C_write_byte
	
l3020:	
	fcall	_delay
	line	19
	
l3022:	
;i2c_master.c: 19: I2C_write_byte('b');delay();
	movlw	(062h)
	fcall	_I2C_write_byte
	
l3024:	
	fcall	_delay
	line	20
	
l3026:	
;i2c_master.c: 20: I2C_write_byte('c');delay();
	movlw	(063h)
	fcall	_I2C_write_byte
	
l3028:	
	fcall	_delay
	line	21
	
l3030:	
;i2c_master.c: 21: I2C_write_string("hello world");delay();
	movlw	((STR_1-__stringbase))&0ffh
	fcall	_I2C_write_string
	
l3032:	
	fcall	_delay
	line	22
	
l3034:	
;i2c_master.c: 22: I2C_stop();delay();
	fcall	_I2C_stop
	
l3036:	
	fcall	_delay
	line	24
;i2c_master.c: 24: while(1);
	
l1762:	
	
l1763:	
	goto	l1762
	
l1764:	
	line	25
	
l1765:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_I2C_write_string
psect	text127,local,class=CODE,delta=2
global __ptext127
__ptext127:

;; *************** function _I2C_write_string *****************
;; Defined at:
;;		line 86 in file "C:\Users\user.user-PC\Desktop\Devlps\PIC-MCU\Baremetal_Code\core\drv\i2c\src\I2C_driver.c"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     PTR unsigned char 
;;		 -> STR_1(12), 
;; Auto vars:     Size  Location     Type
;;  data            1    3[COMMON] PTR unsigned char 
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
;;		_I2C_write_byte
;;		_delay1
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text127
	file	"C:\Users\user.user-PC\Desktop\Devlps\PIC-MCU\Baremetal_Code\core\drv\i2c\src\I2C_driver.c"
	line	86
	global	__size_of_I2C_write_string
	__size_of_I2C_write_string	equ	__end_of_I2C_write_string-_I2C_write_string
	
_I2C_write_string:	
	opt	stack 7
; Regs used in _I2C_write_string: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;I2C_write_string@data stored from wreg
	movwf	(I2C_write_string@data)
	line	87
	
l2998:	
;I2C_driver.c: 87: while(*data)
	goto	l612
	
l613:	
	line	89
	
l3000:	
;I2C_driver.c: 88: {
;I2C_driver.c: 89: I2C_write_byte(*data++);
	movf	(I2C_write_string@data),w
	movwf	fsr0
	fcall	stringdir
	fcall	_I2C_write_byte
	
l3002:	
	movlw	(01h)
	movwf	(??_I2C_write_string+0)+0
	movf	(??_I2C_write_string+0)+0,w
	addwf	(I2C_write_string@data),f
	line	90
	
l3004:	
;I2C_driver.c: 90: delay1();
	fcall	_delay1
	line	91
	
l612:	
	line	87
	
l3006:	
	movf	(I2C_write_string@data),w
	movwf	fsr0
	fcall	stringdir
	iorlw	0
	skipz
	goto	u2261
	goto	u2260
u2261:
	goto	l613
u2260:
	
l614:	
	line	92
	
l615:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_write_string
	__end_of_I2C_write_string:
;; =============== function _I2C_write_string ends ============

	signat	_I2C_write_string,4216
	global	_delay
psect	text128,local,class=CODE,delta=2
global __ptext128
__ptext128:

;; *************** function _delay *****************
;; Defined at:
;;		line 6 in file "C:\Users\user.user-PC\Desktop\Devlps\PIC-MCU\Baremetal_Code\app\src\i2c_master.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               2    0[COMMON] unsigned int 
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
;;      Locals:         2       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text128
	file	"C:\Users\user.user-PC\Desktop\Devlps\PIC-MCU\Baremetal_Code\app\src\i2c_master.c"
	line	6
	global	__size_of_delay
	__size_of_delay	equ	__end_of_delay-_delay
	
_delay:	
	opt	stack 7
; Regs used in _delay: [wreg]
	line	8
	
l2206:	
;i2c_master.c: 7: unsigned int i;
;i2c_master.c: 8: for(i=0;i<10000;i++);
	movlw	low(0)
	movwf	(delay@i)
	movlw	high(0)
	movwf	((delay@i))+1
	movlw	high(02710h)
	subwf	(delay@i+1),w
	movlw	low(02710h)
	skipnz
	subwf	(delay@i),w
	skipc
	goto	u111
	goto	u110
u111:
	goto	l1757
u110:
	
l2208:	
	goto	l1758
	
l1757:	
	
l2210:	
	movlw	low(01h)
	addwf	(delay@i),f
	skipnc
	incf	(delay@i+1),f
	movlw	high(01h)
	addwf	(delay@i+1),f
	movlw	high(02710h)
	subwf	(delay@i+1),w
	movlw	low(02710h)
	skipnz
	subwf	(delay@i),w
	skipc
	goto	u121
	goto	u120
u121:
	goto	l1757
u120:
	
l1758:	
	line	9
	
l1759:	
	return
	opt stack 0
GLOBAL	__end_of_delay
	__end_of_delay:
;; =============== function _delay ends ============

	signat	_delay,88
	global	_I2C_write_byte
psect	text129,local,class=CODE,delta=2
global __ptext129
__ptext129:

;; *************** function _I2C_write_byte *****************
;; Defined at:
;;		line 68 in file "C:\Users\user.user-PC\Desktop\Devlps\PIC-MCU\Baremetal_Code\core\drv\i2c\src\I2C_driver.c"
;; Parameters:    Size  Location     Type
;;  byte            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  byte            1    0[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_I2C_write_string
;;		_main
;; This function uses a non-reentrant model
;;
psect	text129
	file	"C:\Users\user.user-PC\Desktop\Devlps\PIC-MCU\Baremetal_Code\core\drv\i2c\src\I2C_driver.c"
	line	68
	global	__size_of_I2C_write_byte
	__size_of_I2C_write_byte	equ	__end_of_I2C_write_byte-_I2C_write_byte
	
_I2C_write_byte:	
	opt	stack 6
; Regs used in _I2C_write_byte: [wreg]
;I2C_write_byte@byte stored from wreg
	movwf	(I2C_write_byte@byte)
	line	69
	
l2158:	
;I2C_driver.c: 69: SSPBUF=byte;
	movf	(I2C_write_byte@byte),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(19)	;volatile
	line	70
;I2C_driver.c: 70: while(!SSPIF);
	goto	l600
	
l601:	
	
l600:	
	btfss	(99/8),(99)&7
	goto	u81
	goto	u80
u81:
	goto	l601
u80:
	
l602:	
	line	71
;I2C_driver.c: 71: SSPIF=0;
	bcf	(99/8),(99)&7
	line	72
;I2C_driver.c: 72: return ACKSTAT;
;	Return value of _I2C_write_byte is never used
	line	73
	
l603:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_write_byte
	__end_of_I2C_write_byte:
;; =============== function _I2C_write_byte ends ============

	signat	_I2C_write_byte,4217
	global	_I2C_stop
psect	text130,local,class=CODE,delta=2
global __ptext130
__ptext130:

;; *************** function _I2C_stop *****************
;; Defined at:
;;		line 45 in file "C:\Users\user.user-PC\Desktop\Devlps\PIC-MCU\Baremetal_Code\core\drv\i2c\src\I2C_driver.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
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
psect	text130
	file	"C:\Users\user.user-PC\Desktop\Devlps\PIC-MCU\Baremetal_Code\core\drv\i2c\src\I2C_driver.c"
	line	45
	global	__size_of_I2C_stop
	__size_of_I2C_stop	equ	__end_of_I2C_stop-_I2C_stop
	
_I2C_stop:	
	opt	stack 7
; Regs used in _I2C_stop: []
	line	46
	
l2152:	
;I2C_driver.c: 46: PEN=1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1162/8)^080h,(1162)&7
	line	47
;I2C_driver.c: 47: while(!SSPIF);
	goto	l582
	
l583:	
	
l582:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(99/8),(99)&7
	goto	u51
	goto	u50
u51:
	goto	l583
u50:
	
l584:	
	line	48
;I2C_driver.c: 48: SSPIF=0;
	bcf	(99/8),(99)&7
	line	49
	
l585:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_stop
	__end_of_I2C_stop:
;; =============== function _I2C_stop ends ============

	signat	_I2C_stop,88
	global	_I2C_start
psect	text131,local,class=CODE,delta=2
global __ptext131
__ptext131:

;; *************** function _I2C_start *****************
;; Defined at:
;;		line 31 in file "C:\Users\user.user-PC\Desktop\Devlps\PIC-MCU\Baremetal_Code\core\drv\i2c\src\I2C_driver.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
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
psect	text131
	file	"C:\Users\user.user-PC\Desktop\Devlps\PIC-MCU\Baremetal_Code\core\drv\i2c\src\I2C_driver.c"
	line	31
	global	__size_of_I2C_start
	__size_of_I2C_start	equ	__end_of_I2C_start-_I2C_start
	
_I2C_start:	
	opt	stack 7
; Regs used in _I2C_start: []
	line	32
	
l2148:	
;I2C_driver.c: 32: SEN=1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1160/8)^080h,(1160)&7
	line	33
;I2C_driver.c: 33: while(!SSPIF);
	goto	l570
	
l571:	
	
l570:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(99/8),(99)&7
	goto	u31
	goto	u30
u31:
	goto	l571
u30:
	
l572:	
	line	34
;I2C_driver.c: 34: SSPIF=0;
	bcf	(99/8),(99)&7
	line	35
	
l573:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_start
	__end_of_I2C_start:
;; =============== function _I2C_start ends ============

	signat	_I2C_start,88
	global	_I2C_master_init
psect	text132,local,class=CODE,delta=2
global __ptext132
__ptext132:

;; *************** function _I2C_master_init *****************
;; Defined at:
;;		line 15 in file "C:\Users\user.user-PC\Desktop\Devlps\PIC-MCU\Baremetal_Code\core\drv\i2c\src\I2C_driver.c"
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
psect	text132
	file	"C:\Users\user.user-PC\Desktop\Devlps\PIC-MCU\Baremetal_Code\core\drv\i2c\src\I2C_driver.c"
	line	15
	global	__size_of_I2C_master_init
	__size_of_I2C_master_init	equ	__end_of_I2C_master_init-_I2C_master_init
	
_I2C_master_init:	
	opt	stack 7
; Regs used in _I2C_master_init: [wreg]
	line	16
	
l2144:	
;I2C_driver.c: 16: TRISC=0X18;
	movlw	(018h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(135)^080h	;volatile
	line	17
;I2C_driver.c: 17: SSPADD=9;
	movlw	(09h)
	movwf	(147)^080h	;volatile
	line	18
;I2C_driver.c: 18: SSPSTAT=0X80;
	movlw	(080h)
	movwf	(148)^080h	;volatile
	line	19
;I2C_driver.c: 19: SSPCON=0X38;
	movlw	(038h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(20)	;volatile
	line	20
	
l564:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_master_init
	__end_of_I2C_master_init:
;; =============== function _I2C_master_init ends ============

	signat	_I2C_master_init,88
	global	_delay1
psect	text133,local,class=CODE,delta=2
global __ptext133
__ptext133:

;; *************** function _delay1 *****************
;; Defined at:
;;		line 9 in file "C:\Users\user.user-PC\Desktop\Devlps\PIC-MCU\Baremetal_Code\core\drv\i2c\src\I2C_driver.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               2    0[COMMON] unsigned int 
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
;;      Locals:         2       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_I2C_write_string
;; This function uses a non-reentrant model
;;
psect	text133
	file	"C:\Users\user.user-PC\Desktop\Devlps\PIC-MCU\Baremetal_Code\core\drv\i2c\src\I2C_driver.c"
	line	9
	global	__size_of_delay1
	__size_of_delay1	equ	__end_of_delay1-_delay1
	
_delay1:	
	opt	stack 6
; Regs used in _delay1: [wreg]
	line	11
	
l2138:	
;I2C_driver.c: 10: unsigned int i;
;I2C_driver.c: 11: for(i=0;i<10000;i++);
	movlw	low(0)
	movwf	(delay1@i)
	movlw	high(0)
	movwf	((delay1@i))+1
	movlw	high(02710h)
	subwf	(delay1@i+1),w
	movlw	low(02710h)
	skipnz
	subwf	(delay1@i),w
	skipc
	goto	u11
	goto	u10
u11:
	goto	l559
u10:
	
l2140:	
	goto	l560
	
l559:	
	
l2142:	
	movlw	low(01h)
	addwf	(delay1@i),f
	skipnc
	incf	(delay1@i+1),f
	movlw	high(01h)
	addwf	(delay1@i+1),f
	movlw	high(02710h)
	subwf	(delay1@i+1),w
	movlw	low(02710h)
	skipnz
	subwf	(delay1@i),w
	skipc
	goto	u21
	goto	u20
u21:
	goto	l559
u20:
	
l560:	
	line	12
	
l561:	
	return
	opt stack 0
GLOBAL	__end_of_delay1
	__end_of_delay1:
;; =============== function _delay1 ends ============

	signat	_delay1,88
psect	text134,local,class=CODE,delta=2
global __ptext134
__ptext134:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
