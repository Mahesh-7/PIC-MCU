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
	FNCALL	_main,_uart_init
	FNCALL	_main,_delay
	FNCALL	_main,_uart_write
	FNCALL	_main,_delay1
	FNCALL	_main,_uart_string
	FNCALL	_uart_string,_uart_write
	FNCALL	_uart_string,_delay
	FNROOT	_main
	global	_temp
	global	_index
	global	_RCREG
psect	text86,local,class=CODE,delta=2
global __ptext86
__ptext86:
_RCREG	set	26
	global	_RCSTA
_RCSTA	set	24
	global	_TXREG
_TXREG	set	25
	global	_RCIF
_RCIF	set	101
	global	_SPEN
_SPEN	set	199
	global	_SPBRG
_SPBRG	set	153
	global	_TRISC
_TRISC	set	135
	global	_TXSTA
_TXSTA	set	152
	global	_TRMT
_TRMT	set	1217
	global	_TXEN
_TXEN	set	1221
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
	file	"uart_tx_rx.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_index:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_temp:
       ds      32

psect clrtext,class=CODE,delta=2
global clear_ram
;	Called with FSR containing the base address, and
;	W with the last address+1
clear_ram:
	clrwdt			;clear the watchdog before getting into this loop
clrloop:
	clrf	indf		;clear RAM location pointed to by FSR
	incf	fsr,f		;increment pointer
	xorwf	fsr,w		;XOR with final address
	btfsc	status,2	;have we reached the end yet?
	retlw	0		;all done for this memory range, return
	xorwf	fsr,w		;XOR again to restore value
	goto	clrloop		;do the next byte

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK0)
	movwf	fsr
	movlw	low((__pbssBANK0)+020h)
	fcall	clear_ram
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_uart_init
?_uart_init:	; 0 bytes @ 0x0
	global	??_uart_init
??_uart_init:	; 0 bytes @ 0x0
	global	?_delay
?_delay:	; 0 bytes @ 0x0
	global	??_delay
??_delay:	; 0 bytes @ 0x0
	global	?_uart_write
?_uart_write:	; 0 bytes @ 0x0
	global	??_uart_write
??_uart_write:	; 0 bytes @ 0x0
	global	?_uart_string
?_uart_string:	; 0 bytes @ 0x0
	global	?_delay1
?_delay1:	; 0 bytes @ 0x0
	global	??_delay1
??_delay1:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	uart_write@data
uart_write@data:	; 1 bytes @ 0x0
	global	delay1@i
delay1@i:	; 2 bytes @ 0x0
	global	delay@j
delay@j:	; 2 bytes @ 0x0
	ds	2
	global	??_uart_string
??_uart_string:	; 0 bytes @ 0x2
	ds	1
	global	uart_string@data
uart_string@data:	; 1 bytes @ 0x3
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x4
;;Data sizes: Strings 12, constant 0, data 0, bss 33, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      4       5
;; BANK0           80      0      32
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; uart_string@data	PTR unsigned char  size(1) Largest target is 12
;;		 -> STR_1(CODE[12]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_uart_string
;;   _uart_string->_delay
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
;; (0) _main                                                 0     0      0     150
;;                          _uart_init
;;                              _delay
;;                         _uart_write
;;                             _delay1
;;                        _uart_string
;; ---------------------------------------------------------------------------------
;; (1) _uart_string                                          2     2      0      75
;;                                              2 COMMON     2     2      0
;;                         _uart_write
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (2) _uart_write                                           1     1      0      15
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (2) _delay                                                4     4      0      30
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; (1) _uart_init                                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _delay1                                               2     2      0      30
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _uart_init
;;   _delay
;;   _uart_write
;;   _delay1
;;   _uart_string
;;     _uart_write
;;     _delay
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      4       5       1       35.7%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       2       2        0.0%
;;ABS                  0      0      25       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50      0      20       5       40.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0      27      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 11 in file "C:\Users\user.user-PC\Desktop\Devlps\PIC-MCU\Baremetal_Code\app\src\uart_tx.c"
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
;;		_uart_init
;;		_delay
;;		_uart_write
;;		_delay1
;;		_uart_string
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\user.user-PC\Desktop\Devlps\PIC-MCU\Baremetal_Code\app\src\uart_tx.c"
	line	11
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 8
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	13
	
l2362:	
;uart_tx.c: 13: uart_init();
	fcall	_uart_init
	line	16
;uart_tx.c: 16: delay();
	fcall	_delay
	line	19
;uart_tx.c: 19: uart_write('a');
	movlw	(061h)
	fcall	_uart_write
	line	20
;uart_tx.c: 20: delay1();
	fcall	_delay1
	line	21
;uart_tx.c: 21: uart_write('b');
	movlw	(062h)
	fcall	_uart_write
	line	22
;uart_tx.c: 22: delay1();
	fcall	_delay1
	line	23
;uart_tx.c: 23: uart_write('c');
	movlw	(063h)
	fcall	_uart_write
	line	24
;uart_tx.c: 24: delay1();
	fcall	_delay1
	line	25
;uart_tx.c: 25: uart_write('d');
	movlw	(064h)
	fcall	_uart_write
	line	26
;uart_tx.c: 26: delay1();
	fcall	_delay1
	line	27
	
l2364:	
;uart_tx.c: 27: uart_string("hello world");
	movlw	((STR_1-__stringbase))&0ffh
	fcall	_uart_string
	line	28
	
l2366:	
;uart_tx.c: 28: delay1();
	fcall	_delay1
	line	30
;uart_tx.c: 30: while(1)
	
l576:	
	line	33
;uart_tx.c: 31: {
	
l577:	
	line	30
	goto	l576
	
l578:	
	line	37
	
l579:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_uart_string
psect	text87,local,class=CODE,delta=2
global __ptext87
__ptext87:

;; *************** function _uart_string *****************
;; Defined at:
;;		line 34 in file "C:\Users\user.user-PC\Desktop\Devlps\PIC-MCU\Baremetal_Code\core\drv\uart\src\uart_driver.c"
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
;;		_uart_write
;;		_delay
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text87
	file	"C:\Users\user.user-PC\Desktop\Devlps\PIC-MCU\Baremetal_Code\core\drv\uart\src\uart_driver.c"
	line	34
	global	__size_of_uart_string
	__size_of_uart_string	equ	__end_of_uart_string-_uart_string
	
_uart_string:	
	opt	stack 7
; Regs used in _uart_string: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;uart_string@data stored from wreg
	movwf	(uart_string@data)
	line	35
	
l2352:	
;uart_driver.c: 35: while(*data)
	goto	l1154
	
l1155:	
	line	37
	
l2354:	
;uart_driver.c: 36: {
;uart_driver.c: 37: uart_write(*data++);
	movf	(uart_string@data),w
	movwf	fsr0
	fcall	stringdir
	fcall	_uart_write
	
l2356:	
	movlw	(01h)
	movwf	(??_uart_string+0)+0
	movf	(??_uart_string+0)+0,w
	addwf	(uart_string@data),f
	line	38
	
l2358:	
;uart_driver.c: 38: delay();
	fcall	_delay
	line	39
	
l1154:	
	line	35
	
l2360:	
	movf	(uart_string@data),w
	movwf	fsr0
	fcall	stringdir
	iorlw	0
	skipz
	goto	u2221
	goto	u2220
u2221:
	goto	l1155
u2220:
	
l1156:	
	line	40
	
l1157:	
	return
	opt stack 0
GLOBAL	__end_of_uart_string
	__end_of_uart_string:
;; =============== function _uart_string ends ============

	signat	_uart_string,4216
	global	_uart_write
psect	text88,local,class=CODE,delta=2
global __ptext88
__ptext88:

;; *************** function _uart_write *****************
;; Defined at:
;;		line 23 in file "C:\Users\user.user-PC\Desktop\Devlps\PIC-MCU\Baremetal_Code\core\drv\uart\src\uart_driver.c"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1    0[COMMON] unsigned char 
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
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;;		_uart_string
;; This function uses a non-reentrant model
;;
psect	text88
	file	"C:\Users\user.user-PC\Desktop\Devlps\PIC-MCU\Baremetal_Code\core\drv\uart\src\uart_driver.c"
	line	23
	global	__size_of_uart_write
	__size_of_uart_write	equ	__end_of_uart_write-_uart_write
	
_uart_write:	
	opt	stack 6
; Regs used in _uart_write: [wreg]
;uart_write@data stored from wreg
	line	25
	movwf	(uart_write@data)
	
l1550:	
;uart_driver.c: 25: if(TRMT ==1 && SPEN==1 &&TXEN==1)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfss	(1217/8)^080h,(1217)&7
	goto	u51
	goto	u50
u51:
	goto	l1150
u50:
	
l1552:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(199/8),(199)&7
	goto	u61
	goto	u60
u61:
	goto	l1150
u60:
	
l1554:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfss	(1221/8)^080h,(1221)&7
	goto	u71
	goto	u70
u71:
	goto	l1150
u70:
	line	27
	
l1556:	
;uart_driver.c: 26: {
;uart_driver.c: 27: TXREG=data;
	movf	(uart_write@data),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(25)	;volatile
	line	28
	
l1150:	
	line	31
	
l1151:	
	return
	opt stack 0
GLOBAL	__end_of_uart_write
	__end_of_uart_write:
;; =============== function _uart_write ends ============

	signat	_uart_write,4216
	global	_delay
psect	text89,local,class=CODE,delta=2
global __ptext89
__ptext89:

;; *************** function _delay *****************
;; Defined at:
;;		line 6 in file "C:\Users\user.user-PC\Desktop\Devlps\PIC-MCU\Baremetal_Code\core\drv\uart\src\uart_driver.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  j               2    0[COMMON] unsigned int 
;;  i               2    0        unsigned int 
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
;;		_uart_string
;;		_uart_read
;; This function uses a non-reentrant model
;;
psect	text89
	file	"C:\Users\user.user-PC\Desktop\Devlps\PIC-MCU\Baremetal_Code\core\drv\uart\src\uart_driver.c"
	line	6
	global	__size_of_delay
	__size_of_delay	equ	__end_of_delay-_delay
	
_delay:	
	opt	stack 6
; Regs used in _delay: [wreg]
	line	8
	
l1544:	
;uart_driver.c: 7: unsigned int i,j;
;uart_driver.c: 8: for (j=0; j<1000; j++);
	movlw	low(0)
	movwf	(delay@j)
	movlw	high(0)
	movwf	((delay@j))+1
	movlw	high(03E8h)
	subwf	(delay@j+1),w
	movlw	low(03E8h)
	skipnz
	subwf	(delay@j),w
	skipc
	goto	u31
	goto	u30
u31:
	goto	l1142
u30:
	
l1546:	
	goto	l1143
	
l1142:	
	
l1548:	
	movlw	low(01h)
	addwf	(delay@j),f
	skipnc
	incf	(delay@j+1),f
	movlw	high(01h)
	addwf	(delay@j+1),f
	movlw	high(03E8h)
	subwf	(delay@j+1),w
	movlw	low(03E8h)
	skipnz
	subwf	(delay@j),w
	skipc
	goto	u41
	goto	u40
u41:
	goto	l1142
u40:
	
l1143:	
	line	9
	
l1144:	
	return
	opt stack 0
GLOBAL	__end_of_delay
	__end_of_delay:
;; =============== function _delay ends ============

	signat	_delay,88
	global	_uart_init
psect	text90,local,class=CODE,delta=2
global __ptext90
__ptext90:

;; *************** function _uart_init *****************
;; Defined at:
;;		line 12 in file "C:\Users\user.user-PC\Desktop\Devlps\PIC-MCU\Baremetal_Code\core\drv\uart\src\uart_driver.c"
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
psect	text90
	file	"C:\Users\user.user-PC\Desktop\Devlps\PIC-MCU\Baremetal_Code\core\drv\uart\src\uart_driver.c"
	line	12
	global	__size_of_uart_init
	__size_of_uart_init	equ	__end_of_uart_init-_uart_init
	
_uart_init:	
	opt	stack 7
; Regs used in _uart_init: [wreg]
	line	13
	
l1542:	
;uart_driver.c: 13: TRISC=0X80;
	movlw	(080h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(135)^080h	;volatile
	line	14
;uart_driver.c: 14: TXSTA=0X26;
	movlw	(026h)
	movwf	(152)^080h	;volatile
	line	15
;uart_driver.c: 15: RCSTA=0X90;
	movlw	(090h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(24)	;volatile
	line	16
;uart_driver.c: 16: SPBRG=25;
	movlw	(019h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(153)^080h	;volatile
	line	18
	
l1147:	
	return
	opt stack 0
GLOBAL	__end_of_uart_init
	__end_of_uart_init:
;; =============== function _uart_init ends ============

	signat	_uart_init,88
	global	_delay1
psect	text91,local,class=CODE,delta=2
global __ptext91
__ptext91:

;; *************** function _delay1 *****************
;; Defined at:
;;		line 5 in file "C:\Users\user.user-PC\Desktop\Devlps\PIC-MCU\Baremetal_Code\app\src\uart_tx.c"
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
psect	text91
	file	"C:\Users\user.user-PC\Desktop\Devlps\PIC-MCU\Baremetal_Code\app\src\uart_tx.c"
	line	5
	global	__size_of_delay1
	__size_of_delay1	equ	__end_of_delay1-_delay1
	
_delay1:	
	opt	stack 7
; Regs used in _delay1: [wreg]
	line	7
	
l1536:	
;uart_tx.c: 6: unsigned int i;
;uart_tx.c: 7: for( i=0;i<10000;i++);
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
	goto	l571
u10:
	
l1538:	
	goto	l572
	
l571:	
	
l1540:	
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
	goto	l571
u20:
	
l572:	
	line	8
	
l573:	
	return
	opt stack 0
GLOBAL	__end_of_delay1
	__end_of_delay1:
;; =============== function _delay1 ends ============

	signat	_delay1,88
psect	text92,local,class=CODE,delta=2
global __ptext92
__ptext92:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
