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
	FNCALL	_main,_spi_master_init
	FNCALL	_main,_master_write
	FNCALL	_main,_master_write_string
	FNCALL	_master_write_string,_master_write
	FNCALL	_master_write_string,_delay
	FNROOT	_main
	global	_data
	global	_index
	global	_temp
	global	_SSPBUF
psect	text82,local,class=CODE,delta=2
global __ptext82
__ptext82:
_SSPBUF	set	19
	global	_SSPCON
_SSPCON	set	20
	global	_SSPIF
_SSPIF	set	99
	global	_SSPSTAT
_SSPSTAT	set	148
	global	_TRISC
_TRISC	set	135
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
	file	"spi.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_index:
       ds      1

_temp:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_data:
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
	clrf	((__pbssCOMMON)+1)&07Fh
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
	global	?_spi_master_init
?_spi_master_init:	; 0 bytes @ 0x0
	global	??_spi_master_init
??_spi_master_init:	; 0 bytes @ 0x0
	global	?_master_write
?_master_write:	; 0 bytes @ 0x0
	global	??_master_write
??_master_write:	; 0 bytes @ 0x0
	global	?_master_write_string
?_master_write_string:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_delay
?_delay:	; 0 bytes @ 0x0
	global	??_delay
??_delay:	; 0 bytes @ 0x0
	global	master_write@data
master_write@data:	; 1 bytes @ 0x0
	global	delay@delay
delay@delay:	; 2 bytes @ 0x0
	ds	2
	global	??_master_write_string
??_master_write_string:	; 0 bytes @ 0x2
	ds	1
	global	master_write_string@data
master_write_string@data:	; 1 bytes @ 0x3
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x4
	ds	3
;;Data sizes: Strings 12, constant 0, data 0, bss 34, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      7       9
;; BANK0           80      0      32
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; master_write_string@data	PTR const unsigned char  size(1) Largest target is 12
;;		 -> STR_1(CODE[12]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_master_write_string
;;   _master_write_string->_delay
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
;;Main: autosize = 0, tempsize = 3, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 3     3      0      90
;;                                              4 COMMON     3     3      0
;;                    _spi_master_init
;;                       _master_write
;;                _master_write_string
;; ---------------------------------------------------------------------------------
;; (1) _master_write_string                                  2     2      0      75
;;                                              2 COMMON     2     2      0
;;                       _master_write
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (2) _delay                                                2     2      0      30
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; (2) _master_write                                         1     1      0      15
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _spi_master_init                                      0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _spi_master_init
;;   _master_write
;;   _master_write_string
;;     _master_write
;;     _delay
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      7       9       1       64.3%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       2       2        0.0%
;;ABS                  0      0      29       3        0.0%
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
;;DATA                 0      0      2B      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 8 in file "C:\Users\user.user-PC\Desktop\Devlps\PIC-MCU\Baremetal_Code\app\src\spi_master.c"
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
;;      Temps:          3       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_spi_master_init
;;		_master_write
;;		_master_write_string
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\user.user-PC\Desktop\Devlps\PIC-MCU\Baremetal_Code\app\src\spi_master.c"
	line	8
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 8
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	10
	
l2352:	
;spi_master.c: 10: spi_master_init();
	fcall	_spi_master_init
	line	12
	
l2354:	
;spi_master.c: 12: _delay((unsigned long)((500)*(4000000/4000.0)));
	opt asmopt_off
movlw  3
movwf	((??_main+0)+0+2),f
movlw	136
movwf	((??_main+0)+0+1),f
	movlw	86
movwf	((??_main+0)+0),f
u2197:
	decfsz	((??_main+0)+0),f
	goto	u2197
	decfsz	((??_main+0)+0+1),f
	goto	u2197
	decfsz	((??_main+0)+0+2),f
	goto	u2197
opt asmopt_on

	line	14
	
l2356:	
;spi_master.c: 14: master_write('0');_delay((unsigned long)((200)*(4000000/4000.0)));
	movlw	(030h)
	fcall	_master_write
	opt asmopt_off
movlw  2
movwf	((??_main+0)+0+2),f
movlw	3
movwf	((??_main+0)+0+1),f
	movlw	186
movwf	((??_main+0)+0),f
u2207:
	decfsz	((??_main+0)+0),f
	goto	u2207
	decfsz	((??_main+0)+0+1),f
	goto	u2207
	decfsz	((??_main+0)+0+2),f
	goto	u2207
opt asmopt_on

	line	15
	
l2358:	
;spi_master.c: 15: master_write('1');_delay((unsigned long)((200)*(4000000/4000.0)));
	movlw	(031h)
	fcall	_master_write
	
l2360:	
	opt asmopt_off
movlw  2
movwf	((??_main+0)+0+2),f
movlw	3
movwf	((??_main+0)+0+1),f
	movlw	186
movwf	((??_main+0)+0),f
u2217:
	decfsz	((??_main+0)+0),f
	goto	u2217
	decfsz	((??_main+0)+0+1),f
	goto	u2217
	decfsz	((??_main+0)+0+2),f
	goto	u2217
opt asmopt_on

	line	16
;spi_master.c: 16: master_write('2');_delay((unsigned long)((200)*(4000000/4000.0)));
	movlw	(032h)
	fcall	_master_write
	
l2362:	
	opt asmopt_off
movlw  2
movwf	((??_main+0)+0+2),f
movlw	3
movwf	((??_main+0)+0+1),f
	movlw	186
movwf	((??_main+0)+0),f
u2227:
	decfsz	((??_main+0)+0),f
	goto	u2227
	decfsz	((??_main+0)+0+1),f
	goto	u2227
	decfsz	((??_main+0)+0+2),f
	goto	u2227
opt asmopt_on

	line	17
	
l2364:	
;spi_master.c: 17: master_write('3');_delay((unsigned long)((200)*(4000000/4000.0)));
	movlw	(033h)
	fcall	_master_write
	opt asmopt_off
movlw  2
movwf	((??_main+0)+0+2),f
movlw	3
movwf	((??_main+0)+0+1),f
	movlw	186
movwf	((??_main+0)+0),f
u2237:
	decfsz	((??_main+0)+0),f
	goto	u2237
	decfsz	((??_main+0)+0+1),f
	goto	u2237
	decfsz	((??_main+0)+0+2),f
	goto	u2237
opt asmopt_on

	line	19
	
l2366:	
;spi_master.c: 19: master_write_string("hello world");
	movlw	((STR_1-__stringbase))&0ffh
	fcall	_master_write_string
	line	21
;spi_master.c: 21: while(1);
	
l567:	
	
l568:	
	goto	l567
	
l569:	
	line	22
	
l570:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_master_write_string
psect	text83,local,class=CODE,delta=2
global __ptext83
__ptext83:

;; *************** function _master_write_string *****************
;; Defined at:
;;		line 42 in file "C:\Users\user.user-PC\Desktop\Devlps\PIC-MCU\Baremetal_Code\core\drv\spi\src\spi_driver.c"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     PTR const unsigned char 
;;		 -> STR_1(12), 
;; Auto vars:     Size  Location     Type
;;  data            1    3[COMMON] PTR const unsigned char 
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
;;		_master_write
;;		_delay
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text83
	file	"C:\Users\user.user-PC\Desktop\Devlps\PIC-MCU\Baremetal_Code\core\drv\spi\src\spi_driver.c"
	line	42
	global	__size_of_master_write_string
	__size_of_master_write_string	equ	__end_of_master_write_string-_master_write_string
	
_master_write_string:	
	opt	stack 7
; Regs used in _master_write_string: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;master_write_string@data stored from wreg
	movwf	(master_write_string@data)
	line	43
	
l2342:	
;spi_driver.c: 43: while(*data)
	goto	l1152
	
l1153:	
	line	45
	
l2344:	
;spi_driver.c: 44: {
;spi_driver.c: 45: master_write(*data++);
	movf	(master_write_string@data),w
	movwf	fsr0
	fcall	stringdir
	fcall	_master_write
	
l2346:	
	movlw	(01h)
	movwf	(??_master_write_string+0)+0
	movf	(??_master_write_string+0)+0,w
	addwf	(master_write_string@data),f
	line	46
	
l2348:	
;spi_driver.c: 46: delay();
	fcall	_delay
	line	47
	
l1152:	
	line	43
	
l2350:	
	movf	(master_write_string@data),w
	movwf	fsr0
	fcall	stringdir
	iorlw	0
	skipz
	goto	u2181
	goto	u2180
u2181:
	goto	l1153
u2180:
	
l1154:	
	line	48
	
l1155:	
	return
	opt stack 0
GLOBAL	__end_of_master_write_string
	__end_of_master_write_string:
;; =============== function _master_write_string ends ============

	signat	_master_write_string,4216
	global	_delay
psect	text84,local,class=CODE,delta=2
global __ptext84
__ptext84:

;; *************** function _delay *****************
;; Defined at:
;;		line 7 in file "C:\Users\user.user-PC\Desktop\Devlps\PIC-MCU\Baremetal_Code\core\drv\spi\src\spi_driver.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  delay           2    0[COMMON] unsigned int 
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
;;		_master_write_string
;; This function uses a non-reentrant model
;;
psect	text84
	file	"C:\Users\user.user-PC\Desktop\Devlps\PIC-MCU\Baremetal_Code\core\drv\spi\src\spi_driver.c"
	line	7
	global	__size_of_delay
	__size_of_delay	equ	__end_of_delay-_delay
	
_delay:	
	opt	stack 6
; Regs used in _delay: [wreg]
	line	8
	
l1540:	
;spi_driver.c: 8: unsigned int delay=0;
	movlw	low(0)
	movwf	(delay@delay)
	movlw	high(0)
	movwf	((delay@delay))+1
	line	9
;spi_driver.c: 9: for(delay=0;delay<1000;delay++);
	movlw	low(0)
	movwf	(delay@delay)
	movlw	high(0)
	movwf	((delay@delay))+1
	movlw	high(03E8h)
	subwf	(delay@delay+1),w
	movlw	low(03E8h)
	skipnz
	subwf	(delay@delay),w
	skipc
	goto	u21
	goto	u20
u21:
	goto	l1135
u20:
	
l1542:	
	goto	l1136
	
l1135:	
	
l1544:	
	movlw	low(01h)
	addwf	(delay@delay),f
	skipnc
	incf	(delay@delay+1),f
	movlw	high(01h)
	addwf	(delay@delay+1),f
	movlw	high(03E8h)
	subwf	(delay@delay+1),w
	movlw	low(03E8h)
	skipnz
	subwf	(delay@delay),w
	skipc
	goto	u31
	goto	u30
u31:
	goto	l1135
u30:
	
l1136:	
	line	11
	
l1137:	
	return
	opt stack 0
GLOBAL	__end_of_delay
	__end_of_delay:
;; =============== function _delay ends ============

	signat	_delay,88
	global	_master_write
psect	text85,local,class=CODE,delta=2
global __ptext85
__ptext85:

;; *************** function _master_write *****************
;; Defined at:
;;		line 32 in file "C:\Users\user.user-PC\Desktop\Devlps\PIC-MCU\Baremetal_Code\core\drv\spi\src\spi_driver.c"
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
;;		_master_write_string
;; This function uses a non-reentrant model
;;
psect	text85
	file	"C:\Users\user.user-PC\Desktop\Devlps\PIC-MCU\Baremetal_Code\core\drv\spi\src\spi_driver.c"
	line	32
	global	__size_of_master_write
	__size_of_master_write	equ	__end_of_master_write-_master_write
	
_master_write:	
	opt	stack 6
; Regs used in _master_write: [wreg]
;master_write@data stored from wreg
	line	34
	movwf	(master_write@data)
	
l1538:	
;spi_driver.c: 34: SSPBUF=data;
	movf	(master_write@data),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(19)	;volatile
	line	35
;spi_driver.c: 35: while(!SSPIF);
	goto	l1146
	
l1147:	
	
l1146:	
	btfss	(99/8),(99)&7
	goto	u11
	goto	u10
u11:
	goto	l1147
u10:
	
l1148:	
	line	36
;spi_driver.c: 36: SSPIF=0;
	bcf	(99/8),(99)&7
	line	39
	
l1149:	
	return
	opt stack 0
GLOBAL	__end_of_master_write
	__end_of_master_write:
;; =============== function _master_write ends ============

	signat	_master_write,4216
	global	_spi_master_init
psect	text86,local,class=CODE,delta=2
global __ptext86
__ptext86:

;; *************** function _spi_master_init *****************
;; Defined at:
;;		line 14 in file "C:\Users\user.user-PC\Desktop\Devlps\PIC-MCU\Baremetal_Code\core\drv\spi\src\spi_driver.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
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
psect	text86
	file	"C:\Users\user.user-PC\Desktop\Devlps\PIC-MCU\Baremetal_Code\core\drv\spi\src\spi_driver.c"
	line	14
	global	__size_of_spi_master_init
	__size_of_spi_master_init	equ	__end_of_spi_master_init-_spi_master_init
	
_spi_master_init:	
	opt	stack 7
; Regs used in _spi_master_init: [wreg+status,2]
	line	16
	
l1534:	
;spi_driver.c: 16: TRISC=0X10;
	movlw	(010h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(135)^080h	;volatile
	line	17
;spi_driver.c: 17: SSPCON=0X20 ;
	movlw	(020h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(20)	;volatile
	line	18
	
l1536:	
;spi_driver.c: 18: SSPSTAT=0X00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(148)^080h	;volatile
	line	19
	
l1140:	
	return
	opt stack 0
GLOBAL	__end_of_spi_master_init
	__end_of_spi_master_init:
;; =============== function _spi_master_init ends ============

	signat	_spi_master_init,88
psect	text87,local,class=CODE,delta=2
global __ptext87
__ptext87:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
