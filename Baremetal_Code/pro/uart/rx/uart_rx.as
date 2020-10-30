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
	FNCALL	_main,_lcd_init
	FNCALL	_main,_delay1
	FNCALL	_main,_uart_read
	FNCALL	_main,_lcd_char
	FNCALL	_lcd_init,_lcd_cmd
	FNROOT	_main
	global	_temp
	global	_index
	global	_PORTB
psect	text121,local,class=CODE,delta=2
global __ptext121
__ptext121:
_PORTB	set	6
	global	_PORTE
_PORTE	set	9
	global	_RCREG
_RCREG	set	26
	global	_RCSTA
_RCSTA	set	24
	global	_TXREG
_TXREG	set	25
	global	_RCIF
_RCIF	set	101
	global	_RE0
_RE0	set	72
	global	_RE2
_RE2	set	74
	global	_SPEN
_SPEN	set	199
	global	_ADCON1
_ADCON1	set	159
	global	_SPBRG
_SPBRG	set	153
	global	_TRISB
_TRISB	set	134
	global	_TRISC
_TRISC	set	135
	global	_TRISE
_TRISE	set	137
	global	_TXSTA
_TXSTA	set	152
	global	_TRMT
_TRMT	set	1217
	global	_TXEN
_TXEN	set	1221
	file	"uart_rx.as"
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
	global	?_lcd_init
?_lcd_init:	; 0 bytes @ 0x0
	global	??_uart_read
??_uart_read:	; 0 bytes @ 0x0
	global	?_lcd_char
?_lcd_char:	; 0 bytes @ 0x0
	global	??_lcd_char
??_lcd_char:	; 0 bytes @ 0x0
	global	?_delay1
?_delay1:	; 0 bytes @ 0x0
	global	??_delay1
??_delay1:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_lcd_cmd
?_lcd_cmd:	; 0 bytes @ 0x0
	global	??_lcd_cmd
??_lcd_cmd:	; 0 bytes @ 0x0
	global	?_uart_read
?_uart_read:	; 1 bytes @ 0x0
	global	delay1@j
delay1@j:	; 2 bytes @ 0x0
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
	ds	1
;;Data sizes: Strings 0, constant 0, data 0, bss 33, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      4       5
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
;;Main: autosize = 0, tempsize = 1, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 1     1      0      60
;;                                              3 COMMON     1     1      0
;;                          _uart_init
;;                           _lcd_init
;;                             _delay1
;;                          _uart_read
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
;; (1) _uart_read                                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _uart_init                                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _delay1                                               4     4      0      30
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _uart_init
;;   _lcd_init
;;     _lcd_cmd
;;   _delay1
;;   _uart_read
;;   _lcd_char
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
;;		line 15 in file "C:\Users\user.user-PC\Desktop\Devlps\PIC-MCU\Baremetal_Code\app\src\uart_rx.c"
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
;;      Temps:          1       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_uart_init
;;		_lcd_init
;;		_delay1
;;		_uart_read
;;		_lcd_char
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\user.user-PC\Desktop\Devlps\PIC-MCU\Baremetal_Code\app\src\uart_rx.c"
	line	15
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 8
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	16
	
l2963:	
;uart_rx.c: 16: uart_init();
	fcall	_uart_init
	line	17
;uart_rx.c: 17: lcd_init();
	fcall	_lcd_init
	line	18
;uart_rx.c: 18: delay1();
	fcall	_delay1
	line	20
;uart_rx.c: 20: while(1)
	
l576:	
	line	22
	
l2965:	
;uart_rx.c: 21: {
;uart_rx.c: 22: temp[index]=uart_read();
	fcall	_uart_read
	movwf	(??_main+0)+0
	movf	(_index),w
	addlw	_temp&0ffh
	movwf	fsr0
	movf	(??_main+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	23
	
l2967:	
;uart_rx.c: 23: lcd_char(temp[index]);
	movf	(_index),w
	addlw	_temp&0ffh
	movwf	fsr0
	movf	indf,w
	fcall	_lcd_char
	line	24
	
l2969:	
;uart_rx.c: 24: index++;
	movlw	(01h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	addwf	(_index),f
	line	26
	
l577:	
	line	20
	goto	l576
	
l578:	
	line	28
	
l579:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_lcd_init
psect	text122,local,class=CODE,delta=2
global __ptext122
__ptext122:

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
psect	text122
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
	
l1732:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_init
	__end_of_lcd_init:
;; =============== function _lcd_init ends ============

	signat	_lcd_init,88
	global	_lcd_cmd
psect	text123,local,class=CODE,delta=2
global __ptext123
__ptext123:

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
psect	text123
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
u2247:
	decfsz	((??_lcd_cmd+0)+0),f
	goto	u2247
	decfsz	((??_lcd_cmd+0)+0+1),f
	goto	u2247
	nop2
opt asmopt_on

	line	15
	
l2945:	
;lcd_driver.c: 15: RE2=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(74/8),(74)&7
	line	16
	
l1720:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_cmd
	__end_of_lcd_cmd:
;; =============== function _lcd_cmd ends ============

	signat	_lcd_cmd,4216
	global	_lcd_char
psect	text124,local,class=CODE,delta=2
global __ptext124
__ptext124:

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
psect	text124
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
u2257:
	decfsz	((??_lcd_char+0)+0),f
	goto	u2257
	decfsz	((??_lcd_char+0)+0+1),f
	goto	u2257
	nop2
opt asmopt_on

	line	25
	
l2937:	
;lcd_driver.c: 25: RE2=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(74/8),(74)&7
	line	27
	
l1723:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_char
	__end_of_lcd_char:
;; =============== function _lcd_char ends ============

	signat	_lcd_char,4216
	global	_uart_read
psect	text125,local,class=CODE,delta=2
global __ptext125
__ptext125:

;; *************** function _uart_read *****************
;; Defined at:
;;		line 42 in file "C:\Users\user.user-PC\Desktop\Devlps\PIC-MCU\Baremetal_Code\core\drv\uart\src\uart_driver.c"
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
psect	text125
	file	"C:\Users\user.user-PC\Desktop\Devlps\PIC-MCU\Baremetal_Code\core\drv\uart\src\uart_driver.c"
	line	42
	global	__size_of_uart_read
	__size_of_uart_read	equ	__end_of_uart_read-_uart_read
	
_uart_read:	
	opt	stack 7
; Regs used in _uart_read: [wreg]
	line	44
	
l2109:	
;uart_driver.c: 44: while(!RCIF);
	goto	l1156
	
l1157:	
	
l1156:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(101/8),(101)&7
	goto	u31
	goto	u30
u31:
	goto	l1157
u30:
	
l1158:	
	line	45
;uart_driver.c: 45: RCIF=0;
	bcf	(101/8),(101)&7
	line	47
	
l2111:	
;uart_driver.c: 47: return RCREG;
	movf	(26),w	;volatile
	
l2113:	
	line	49
	
l1159:	
	return
	opt stack 0
GLOBAL	__end_of_uart_read
	__end_of_uart_read:
;; =============== function _uart_read ends ============

	signat	_uart_read,89
	global	_uart_init
psect	text126,local,class=CODE,delta=2
global __ptext126
__ptext126:

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
psect	text126
	file	"C:\Users\user.user-PC\Desktop\Devlps\PIC-MCU\Baremetal_Code\core\drv\uart\src\uart_driver.c"
	line	12
	global	__size_of_uart_init
	__size_of_uart_init	equ	__end_of_uart_init-_uart_init
	
_uart_init:	
	opt	stack 7
; Regs used in _uart_init: [wreg]
	line	13
	
l2107:	
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
	
l1143:	
	return
	opt stack 0
GLOBAL	__end_of_uart_init
	__end_of_uart_init:
;; =============== function _uart_init ends ============

	signat	_uart_init,88
	global	_delay1
psect	text127,local,class=CODE,delta=2
global __ptext127
__ptext127:

;; *************** function _delay1 *****************
;; Defined at:
;;		line 7 in file "C:\Users\user.user-PC\Desktop\Devlps\PIC-MCU\Baremetal_Code\app\src\uart_rx.c"
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
;; This function uses a non-reentrant model
;;
psect	text127
	file	"C:\Users\user.user-PC\Desktop\Devlps\PIC-MCU\Baremetal_Code\app\src\uart_rx.c"
	line	7
	global	__size_of_delay1
	__size_of_delay1	equ	__end_of_delay1-_delay1
	
_delay1:	
	opt	stack 7
; Regs used in _delay1: [wreg]
	line	9
	
l2101:	
;uart_rx.c: 8: unsigned int i,j;
;uart_rx.c: 9: for (j=0; j<1000; j++);
	movlw	low(0)
	movwf	(delay1@j)
	movlw	high(0)
	movwf	((delay1@j))+1
	movlw	high(03E8h)
	subwf	(delay1@j+1),w
	movlw	low(03E8h)
	skipnz
	subwf	(delay1@j),w
	skipc
	goto	u11
	goto	u10
u11:
	goto	l571
u10:
	
l2103:	
	goto	l572
	
l571:	
	
l2105:	
	movlw	low(01h)
	addwf	(delay1@j),f
	skipnc
	incf	(delay1@j+1),f
	movlw	high(01h)
	addwf	(delay1@j+1),f
	movlw	high(03E8h)
	subwf	(delay1@j+1),w
	movlw	low(03E8h)
	skipnz
	subwf	(delay1@j),w
	skipc
	goto	u21
	goto	u20
u21:
	goto	l571
u20:
	
l572:	
	line	10
	
l573:	
	return
	opt stack 0
GLOBAL	__end_of_delay1
	__end_of_delay1:
;; =============== function _delay1 ends ============

	signat	_delay1,88
psect	text128,local,class=CODE,delta=2
global __ptext128
__ptext128:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
