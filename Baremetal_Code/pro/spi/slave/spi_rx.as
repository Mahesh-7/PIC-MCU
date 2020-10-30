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
	FNCALL	_main,_spi_slave_init
	FNCALL	_main,_lcd_init
	FNCALL	_main,_slave_read
	FNCALL	_main,_lcd_char
	FNCALL	_lcd_init,_lcd_cmd
	FNROOT	_main
	global	_data
	global	_index
	global	_temp
	global	_PORTB
psect	text111,local,class=CODE,delta=2
global __ptext111
__ptext111:
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
	global	_SSPSTAT
_SSPSTAT	set	148
	global	_TRISB
_TRISB	set	134
	global	_TRISC
_TRISC	set	135
	global	_TRISE
_TRISE	set	137
	file	"spi_rx.as"
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
	global	?_spi_slave_init
?_spi_slave_init:	; 0 bytes @ 0x0
	global	??_spi_slave_init
??_spi_slave_init:	; 0 bytes @ 0x0
	global	?_lcd_init
?_lcd_init:	; 0 bytes @ 0x0
	global	??_slave_read
??_slave_read:	; 0 bytes @ 0x0
	global	?_lcd_char
?_lcd_char:	; 0 bytes @ 0x0
	global	??_lcd_char
??_lcd_char:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_lcd_cmd
?_lcd_cmd:	; 0 bytes @ 0x0
	global	??_lcd_cmd
??_lcd_cmd:	; 0 bytes @ 0x0
	global	?_slave_read
?_slave_read:	; 1 bytes @ 0x0
	ds	2
	global	lcd_cmd@cmd
lcd_cmd@cmd:	; 1 bytes @ 0x2
	global	lcd_char@data
lcd_char@data:	; 1 bytes @ 0x2
	ds	1
	global	??_lcd_init
??_lcd_init:	; 0 bytes @ 0x3
	global	??_main
??_main:	; 0 bytes @ 0x3
	ds	3
;;Data sizes: Strings 0, constant 0, data 0, bss 34, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      6       8
;; BANK0           80      0      32
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_lcd_char
;;   _lcd_init->_lcd_cmd
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
;; (0) _main                                                 3     3      0      30
;;                                              3 COMMON     3     3      0
;;                     _spi_slave_init
;;                           _lcd_init
;;                         _slave_read
;;                           _lcd_char
;; ---------------------------------------------------------------------------------
;; (1) _lcd_init                                             0     0      0      15
;;                            _lcd_cmd
;; ---------------------------------------------------------------------------------
;; (2) _lcd_cmd                                              3     3      0      15
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; (1) _lcd_char                                             3     3      0      15
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; (1) _slave_read                                           0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _spi_slave_init                                       0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _spi_slave_init
;;   _lcd_init
;;     _lcd_cmd
;;   _slave_read
;;   _lcd_char
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      6       8       1       57.1%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       2       2        0.0%
;;ABS                  0      0      28       3        0.0%
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
;;DATA                 0      0      2A      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 9 in file "C:\Users\user.user-PC\Desktop\Devlps\PIC-MCU\Baremetal_Code\app\src\spi_slave.c"
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
;;      Temps:          3       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_spi_slave_init
;;		_lcd_init
;;		_slave_read
;;		_lcd_char
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\user.user-PC\Desktop\Devlps\PIC-MCU\Baremetal_Code\app\src\spi_slave.c"
	line	9
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 8
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	12
	
l2963:	
;spi_slave.c: 12: spi_slave_init();
	fcall	_spi_slave_init
	line	14
	
l2965:	
;spi_slave.c: 14: _delay((unsigned long)((500)*(4000000/4000.0)));
	opt asmopt_off
movlw  3
movwf	((??_main+0)+0+2),f
movlw	136
movwf	((??_main+0)+0+1),f
	movlw	86
movwf	((??_main+0)+0),f
u2207:
	decfsz	((??_main+0)+0),f
	goto	u2207
	decfsz	((??_main+0)+0+1),f
	goto	u2207
	decfsz	((??_main+0)+0+2),f
	goto	u2207
opt asmopt_on

	line	16
	
l2967:	
;spi_slave.c: 16: lcd_init();
	fcall	_lcd_init
	line	18
;spi_slave.c: 18: while(1)
	
l571:	
	line	20
	
l2969:	
;spi_slave.c: 19: {
;spi_slave.c: 20: temp=slave_read();
	fcall	_slave_read
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(_temp)
	line	22
	
l2971:	
;spi_slave.c: 22: lcd_char(temp);
	movf	(_temp),w
	fcall	_lcd_char
	line	23
	
l572:	
	line	18
	goto	l571
	
l573:	
	line	27
	
l574:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_lcd_init
psect	text112,local,class=CODE,delta=2
global __ptext112
__ptext112:

;; *************** function _lcd_init *****************
;; Defined at:
;;		line 39 in file "C:\Users\user.user-PC\Desktop\Devlps\PIC-MCU\Baremetal_Code\core\drv\lcd\src\lcd_driver.c"
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
psect	text112
	file	"C:\Users\user.user-PC\Desktop\Devlps\PIC-MCU\Baremetal_Code\core\drv\lcd\src\lcd_driver.c"
	line	39
	global	__size_of_lcd_init
	__size_of_lcd_init	equ	__end_of_lcd_init-_lcd_init
	
_lcd_init:	
	opt	stack 7
; Regs used in _lcd_init: [wreg+status,2+status,0+pclath+cstack]
	line	40
	
l2947:	
;lcd_driver.c: 40: ADCON1=0x06;
	movlw	(06h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(159)^080h	;volatile
	line	41
	
l2949:	
;lcd_driver.c: 41: TRISB=0X00;
	clrf	(134)^080h	;volatile
	line	42
	
l2951:	
;lcd_driver.c: 42: PORTB=0X00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(6)	;volatile
	line	43
	
l2953:	
;lcd_driver.c: 43: TRISE=0X00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(137)^080h	;volatile
	line	44
	
l2955:	
;lcd_driver.c: 44: PORTE=0X00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(9)	;volatile
	line	45
	
l2957:	
;lcd_driver.c: 45: lcd_cmd(0x38);
	movlw	(038h)
	fcall	_lcd_cmd
	line	46
	
l2959:	
;lcd_driver.c: 46: lcd_cmd(0x0c);
	movlw	(0Ch)
	fcall	_lcd_cmd
	line	47
	
l2961:	
;lcd_driver.c: 47: lcd_cmd(0x80);
	movlw	(080h)
	fcall	_lcd_cmd
	line	48
	
l1738:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_init
	__end_of_lcd_init:
;; =============== function _lcd_init ends ============

	signat	_lcd_init,88
	global	_lcd_cmd
psect	text113,local,class=CODE,delta=2
global __ptext113
__ptext113:

;; *************** function _lcd_cmd *****************
;; Defined at:
;;		line 10 in file "C:\Users\user.user-PC\Desktop\Devlps\PIC-MCU\Baremetal_Code\core\drv\lcd\src\lcd_driver.c"
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
;; This function uses a non-reentrant model
;;
psect	text113
	file	"C:\Users\user.user-PC\Desktop\Devlps\PIC-MCU\Baremetal_Code\core\drv\lcd\src\lcd_driver.c"
	line	10
	global	__size_of_lcd_cmd
	__size_of_lcd_cmd	equ	__end_of_lcd_cmd-_lcd_cmd
	
_lcd_cmd:	
	opt	stack 6
; Regs used in _lcd_cmd: [wreg]
;lcd_cmd@cmd stored from wreg
	movwf	(lcd_cmd@cmd)
	line	11
	
l2939:	
;lcd_driver.c: 11: RE0=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(72/8),(72)&7
	line	12
	
l2941:	
;lcd_driver.c: 12: PORTB=cmd;
	movf	(lcd_cmd@cmd),w
	movwf	(6)	;volatile
	line	13
	
l2943:	
;lcd_driver.c: 13: RE2=1;
	bsf	(74/8),(74)&7
	line	14
;lcd_driver.c: 14: _delay((unsigned long)((1)*(40000000/4000.0)));
	opt asmopt_off
movlw	13
movwf	((??_lcd_cmd+0)+0+1),f
	movlw	251
movwf	((??_lcd_cmd+0)+0),f
u2217:
	decfsz	((??_lcd_cmd+0)+0),f
	goto	u2217
	decfsz	((??_lcd_cmd+0)+0+1),f
	goto	u2217
	nop2
opt asmopt_on

	line	15
	
l2945:	
;lcd_driver.c: 15: RE2=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(74/8),(74)&7
	line	16
	
l1726:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_cmd
	__end_of_lcd_cmd:
;; =============== function _lcd_cmd ends ============

	signat	_lcd_cmd,4216
	global	_lcd_char
psect	text114,local,class=CODE,delta=2
global __ptext114
__ptext114:

;; *************** function _lcd_char *****************
;; Defined at:
;;		line 19 in file "C:\Users\user.user-PC\Desktop\Devlps\PIC-MCU\Baremetal_Code\core\drv\lcd\src\lcd_driver.c"
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
;;		_main
;;		_lcd_string
;; This function uses a non-reentrant model
;;
psect	text114
	file	"C:\Users\user.user-PC\Desktop\Devlps\PIC-MCU\Baremetal_Code\core\drv\lcd\src\lcd_driver.c"
	line	19
	global	__size_of_lcd_char
	__size_of_lcd_char	equ	__end_of_lcd_char-_lcd_char
	
_lcd_char:	
	opt	stack 7
; Regs used in _lcd_char: [wreg]
;lcd_char@data stored from wreg
	line	21
	movwf	(lcd_char@data)
	
l2931:	
;lcd_driver.c: 21: RE0=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(72/8),(72)&7
	line	22
	
l2933:	
;lcd_driver.c: 22: PORTB=data;
	movf	(lcd_char@data),w
	movwf	(6)	;volatile
	line	23
	
l2935:	
;lcd_driver.c: 23: RE2=1;
	bsf	(74/8),(74)&7
	line	24
;lcd_driver.c: 24: _delay((unsigned long)((1)*(40000000/4000.0)));
	opt asmopt_off
movlw	13
movwf	((??_lcd_char+0)+0+1),f
	movlw	251
movwf	((??_lcd_char+0)+0),f
u2227:
	decfsz	((??_lcd_char+0)+0),f
	goto	u2227
	decfsz	((??_lcd_char+0)+0+1),f
	goto	u2227
	nop2
opt asmopt_on

	line	25
	
l2937:	
;lcd_driver.c: 25: RE2=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(74/8),(74)&7
	line	27
	
l1729:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_char
	__end_of_lcd_char:
;; =============== function _lcd_char ends ============

	signat	_lcd_char,4216
	global	_slave_read
psect	text115,local,class=CODE,delta=2
global __ptext115
__ptext115:

;; *************** function _slave_read *****************
;; Defined at:
;;		line 52 in file "C:\Users\user.user-PC\Desktop\Devlps\PIC-MCU\Baremetal_Code\core\drv\spi\src\spi_driver.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
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
psect	text115
	file	"C:\Users\user.user-PC\Desktop\Devlps\PIC-MCU\Baremetal_Code\core\drv\spi\src\spi_driver.c"
	line	52
	global	__size_of_slave_read
	__size_of_slave_read	equ	__end_of_slave_read-_slave_read
	
_slave_read:	
	opt	stack 7
; Regs used in _slave_read: [wreg]
	line	54
	
l2111:	
;spi_driver.c: 54: while(!SSPIF);
	goto	l1162
	
l1163:	
	
l1162:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(99/8),(99)&7
	goto	u11
	goto	u10
u11:
	goto	l1163
u10:
	
l1164:	
	line	55
;spi_driver.c: 55: SSPIF=0;
	bcf	(99/8),(99)&7
	line	56
	
l2113:	
;spi_driver.c: 56: return SSPBUF;
	movf	(19),w	;volatile
	
l2115:	
	line	60
	
l1165:	
	return
	opt stack 0
GLOBAL	__end_of_slave_read
	__end_of_slave_read:
;; =============== function _slave_read ends ============

	signat	_slave_read,89
	global	_spi_slave_init
psect	text116,local,class=CODE,delta=2
global __ptext116
__ptext116:

;; *************** function _spi_slave_init *****************
;; Defined at:
;;		line 22 in file "C:\Users\user.user-PC\Desktop\Devlps\PIC-MCU\Baremetal_Code\core\drv\spi\src\spi_driver.c"
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
psect	text116
	file	"C:\Users\user.user-PC\Desktop\Devlps\PIC-MCU\Baremetal_Code\core\drv\spi\src\spi_driver.c"
	line	22
	global	__size_of_spi_slave_init
	__size_of_spi_slave_init	equ	__end_of_spi_slave_init-_spi_slave_init
	
_spi_slave_init:	
	opt	stack 7
; Regs used in _spi_slave_init: [wreg+status,2]
	line	24
	
l2107:	
;spi_driver.c: 24: TRISC=0X18;
	movlw	(018h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(135)^080h	;volatile
	line	25
;spi_driver.c: 25: SSPCON=0X25;
	movlw	(025h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(20)	;volatile
	line	26
	
l2109:	
;spi_driver.c: 26: SSPSTAT=0X00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(148)^080h	;volatile
	line	27
	
l1147:	
	return
	opt stack 0
GLOBAL	__end_of_spi_slave_init
	__end_of_spi_slave_init:
;; =============== function _spi_slave_init ends ============

	signat	_spi_slave_init,88
psect	text117,local,class=CODE,delta=2
global __ptext117
__ptext117:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
