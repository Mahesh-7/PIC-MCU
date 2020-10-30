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
	FNCALL	_main,_I2C_slave_init
	FNCALL	_main,_lcd_init
	FNCALL	_main,_delay
	FNCALL	_main,_I2C_read_byte
	FNCALL	_main,_lcd_char
	FNCALL	_lcd_init,_lcd_cmd
	FNROOT	_main
	global	_PORTB
psect	text127,local,class=CODE,delta=2
global __ptext127
__ptext127:
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
	file	"I2C_read.as"
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
	global	?_I2C_slave_init
?_I2C_slave_init:	; 0 bytes @ 0x0
	global	??_I2C_slave_init
??_I2C_slave_init:	; 0 bytes @ 0x0
	global	?_lcd_init
?_lcd_init:	; 0 bytes @ 0x0
	global	??_I2C_read_byte
??_I2C_read_byte:	; 0 bytes @ 0x0
	global	?_lcd_char
?_lcd_char:	; 0 bytes @ 0x0
	global	??_lcd_char
??_lcd_char:	; 0 bytes @ 0x0
	global	?_delay
?_delay:	; 0 bytes @ 0x0
	global	??_delay
??_delay:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_lcd_cmd
?_lcd_cmd:	; 0 bytes @ 0x0
	global	??_lcd_cmd
??_lcd_cmd:	; 0 bytes @ 0x0
	global	?_I2C_read_byte
?_I2C_read_byte:	; 1 bytes @ 0x0
	global	delay@i
delay@i:	; 2 bytes @ 0x0
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
	global	main@temp
main@temp:	; 1 bytes @ 0x4
	ds	1
;;Data sizes: Strings 0, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      5       5
;; BANK0           80      0       0
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
;; (0) _main                                                 2     2      0      75
;;                                              3 COMMON     2     2      0
;;                     _I2C_slave_init
;;                           _lcd_init
;;                              _delay
;;                      _I2C_read_byte
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
;; (1) _I2C_read_byte                                        0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _I2C_slave_init                                       0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _delay                                                2     2      0      30
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _I2C_slave_init
;;   _lcd_init
;;     _lcd_cmd
;;   _delay
;;   _I2C_read_byte
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
;;		line 12 in file "C:\Users\user.user-PC\Desktop\Devlps\PIC-MCU\Baremetal_Code\app\src\i2c_slave.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  temp            1    4[COMMON] unsigned char 
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
;;      Locals:         1       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_I2C_slave_init
;;		_lcd_init
;;		_delay
;;		_I2C_read_byte
;;		_lcd_char
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\user.user-PC\Desktop\Devlps\PIC-MCU\Baremetal_Code\app\src\i2c_slave.c"
	line	12
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 8
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	13
	
l3000:	
;i2c_slave.c: 13: unsigned char temp=0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(main@temp)
	line	15
	
l3002:	
;i2c_slave.c: 15: I2C_slave_init();
	fcall	_I2C_slave_init
	line	17
	
l3004:	
;i2c_slave.c: 17: lcd_init();
	fcall	_lcd_init
	line	19
	
l3006:	
;i2c_slave.c: 19: delay();
	fcall	_delay
	line	22
;i2c_slave.c: 22: while(1)
	
l572:	
	line	25
	
l3008:	
;i2c_slave.c: 23: {
;i2c_slave.c: 25: temp=(unsigned char)I2C_read_byte();
	fcall	_I2C_read_byte
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(main@temp)
	line	26
	
l3010:	
;i2c_slave.c: 26: delay();
	fcall	_delay
	line	27
	
l3012:	
;i2c_slave.c: 27: lcd_char(temp);
	movf	(main@temp),w
	fcall	_lcd_char
	line	29
	
l573:	
	line	22
	goto	l572
	
l574:	
	line	32
	
l575:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_lcd_init
psect	text128,local,class=CODE,delta=2
global __ptext128
__ptext128:

;; *************** function _lcd_init *****************
;; Defined at:
;;		line 38 in file "C:\Users\user.user-PC\Desktop\Devlps\PIC-MCU\Baremetal_Code\core\drv\lcd\src\lcd_driver.c"
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
psect	text128
	file	"C:\Users\user.user-PC\Desktop\Devlps\PIC-MCU\Baremetal_Code\core\drv\lcd\src\lcd_driver.c"
	line	38
	global	__size_of_lcd_init
	__size_of_lcd_init	equ	__end_of_lcd_init-_lcd_init
	
_lcd_init:	
	opt	stack 7
; Regs used in _lcd_init: [wreg+status,2+status,0+pclath+cstack]
	line	39
	
l2984:	
;lcd_driver.c: 39: ADCON1=0x06;
	movlw	(06h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(159)^080h	;volatile
	line	40
	
l2986:	
;lcd_driver.c: 40: TRISB=0X00;
	clrf	(134)^080h	;volatile
	line	41
	
l2988:	
;lcd_driver.c: 41: PORTB=0X00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(6)	;volatile
	line	42
	
l2990:	
;lcd_driver.c: 42: TRISE=0X00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(137)^080h	;volatile
	line	43
	
l2992:	
;lcd_driver.c: 43: PORTE=0X00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(9)	;volatile
	line	44
	
l2994:	
;lcd_driver.c: 44: lcd_cmd(0x38);
	movlw	(038h)
	fcall	_lcd_cmd
	line	45
	
l2996:	
;lcd_driver.c: 45: lcd_cmd(0x0c);
	movlw	(0Ch)
	fcall	_lcd_cmd
	line	46
	
l2998:	
;lcd_driver.c: 46: lcd_cmd(0x80);
	movlw	(080h)
	fcall	_lcd_cmd
	line	47
	
l1148:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_init
	__end_of_lcd_init:
;; =============== function _lcd_init ends ============

	signat	_lcd_init,88
	global	_lcd_cmd
psect	text129,local,class=CODE,delta=2
global __ptext129
__ptext129:

;; *************** function _lcd_cmd *****************
;; Defined at:
;;		line 9 in file "C:\Users\user.user-PC\Desktop\Devlps\PIC-MCU\Baremetal_Code\core\drv\lcd\src\lcd_driver.c"
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
psect	text129
	file	"C:\Users\user.user-PC\Desktop\Devlps\PIC-MCU\Baremetal_Code\core\drv\lcd\src\lcd_driver.c"
	line	9
	global	__size_of_lcd_cmd
	__size_of_lcd_cmd	equ	__end_of_lcd_cmd-_lcd_cmd
	
_lcd_cmd:	
	opt	stack 6
; Regs used in _lcd_cmd: [wreg]
;lcd_cmd@cmd stored from wreg
	movwf	(lcd_cmd@cmd)
	line	10
	
l2976:	
;lcd_driver.c: 10: RE0=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(72/8),(72)&7
	line	11
	
l2978:	
;lcd_driver.c: 11: PORTB=cmd;
	movf	(lcd_cmd@cmd),w
	movwf	(6)	;volatile
	line	12
	
l2980:	
;lcd_driver.c: 12: RE2=1;
	bsf	(74/8),(74)&7
	line	13
;lcd_driver.c: 13: _delay((unsigned long)((1)*(40000000/4000.0)));
	opt asmopt_off
movlw	13
movwf	((??_lcd_cmd+0)+0+1),f
	movlw	251
movwf	((??_lcd_cmd+0)+0),f
u2277:
	decfsz	((??_lcd_cmd+0)+0),f
	goto	u2277
	decfsz	((??_lcd_cmd+0)+0+1),f
	goto	u2277
	nop2
opt asmopt_on

	line	14
	
l2982:	
;lcd_driver.c: 14: RE2=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(74/8),(74)&7
	line	15
	
l1136:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_cmd
	__end_of_lcd_cmd:
;; =============== function _lcd_cmd ends ============

	signat	_lcd_cmd,4216
	global	_lcd_char
psect	text130,local,class=CODE,delta=2
global __ptext130
__ptext130:

;; *************** function _lcd_char *****************
;; Defined at:
;;		line 18 in file "C:\Users\user.user-PC\Desktop\Devlps\PIC-MCU\Baremetal_Code\core\drv\lcd\src\lcd_driver.c"
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
psect	text130
	file	"C:\Users\user.user-PC\Desktop\Devlps\PIC-MCU\Baremetal_Code\core\drv\lcd\src\lcd_driver.c"
	line	18
	global	__size_of_lcd_char
	__size_of_lcd_char	equ	__end_of_lcd_char-_lcd_char
	
_lcd_char:	
	opt	stack 7
; Regs used in _lcd_char: [wreg]
;lcd_char@data stored from wreg
	line	20
	movwf	(lcd_char@data)
	
l2968:	
;lcd_driver.c: 20: RE0=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(72/8),(72)&7
	line	21
	
l2970:	
;lcd_driver.c: 21: PORTB=data;
	movf	(lcd_char@data),w
	movwf	(6)	;volatile
	line	22
	
l2972:	
;lcd_driver.c: 22: RE2=1;
	bsf	(74/8),(74)&7
	line	23
;lcd_driver.c: 23: _delay((unsigned long)((1)*(40000000/4000.0)));
	opt asmopt_off
movlw	13
movwf	((??_lcd_char+0)+0+1),f
	movlw	251
movwf	((??_lcd_char+0)+0),f
u2287:
	decfsz	((??_lcd_char+0)+0),f
	goto	u2287
	decfsz	((??_lcd_char+0)+0+1),f
	goto	u2287
	nop2
opt asmopt_on

	line	24
	
l2974:	
;lcd_driver.c: 24: RE2=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(74/8),(74)&7
	line	26
	
l1139:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_char
	__end_of_lcd_char:
;; =============== function _lcd_char ends ============

	signat	_lcd_char,4216
	global	_I2C_read_byte
psect	text131,local,class=CODE,delta=2
global __ptext131
__ptext131:

;; *************** function _I2C_read_byte *****************
;; Defined at:
;;		line 76 in file "C:\Users\user.user-PC\Desktop\Devlps\PIC-MCU\Baremetal_Code\core\drv\i2c\src\I2C_driver.c"
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
psect	text131
	file	"C:\Users\user.user-PC\Desktop\Devlps\PIC-MCU\Baremetal_Code\core\drv\i2c\src\I2C_driver.c"
	line	76
	global	__size_of_I2C_read_byte
	__size_of_I2C_read_byte	equ	__end_of_I2C_read_byte-_I2C_read_byte
	
_I2C_read_byte:	
	opt	stack 7
; Regs used in _I2C_read_byte: [wreg]
	line	78
	
l2140:	
;I2C_driver.c: 78: RCEN=1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1163/8)^080h,(1163)&7
	line	79
;I2C_driver.c: 79: while(!SSPIF);
	goto	l1754
	
l1755:	
	
l1754:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(99/8),(99)&7
	goto	u31
	goto	u30
u31:
	goto	l1755
u30:
	
l1756:	
	line	80
;I2C_driver.c: 80: SSPIF=0;
	bcf	(99/8),(99)&7
	line	81
	
l2142:	
;I2C_driver.c: 81: return SSPBUF;
	movf	(19),w	;volatile
	
l2144:	
	line	83
	
l1757:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_read_byte
	__end_of_I2C_read_byte:
;; =============== function _I2C_read_byte ends ============

	signat	_I2C_read_byte,89
	global	_I2C_slave_init
psect	text132,local,class=CODE,delta=2
global __ptext132
__ptext132:

;; *************** function _I2C_slave_init *****************
;; Defined at:
;;		line 23 in file "C:\Users\user.user-PC\Desktop\Devlps\PIC-MCU\Baremetal_Code\core\drv\i2c\src\I2C_driver.c"
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
	line	23
	global	__size_of_I2C_slave_init
	__size_of_I2C_slave_init	equ	__end_of_I2C_slave_init-_I2C_slave_init
	
_I2C_slave_init:	
	opt	stack 7
; Regs used in _I2C_slave_init: [wreg]
	line	24
	
l2138:	
;I2C_driver.c: 24: TRISC=0X18;
	movlw	(018h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(135)^080h	;volatile
	line	25
;I2C_driver.c: 25: SSPADD=0X26;
	movlw	(026h)
	movwf	(147)^080h	;volatile
	line	26
;I2C_driver.c: 26: SSPSTAT=0X80;
	movlw	(080h)
	movwf	(148)^080h	;volatile
	line	27
;I2C_driver.c: 27: SSPCON=0X36;
	movlw	(036h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(20)	;volatile
	line	28
	
l1715:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_slave_init
	__end_of_I2C_slave_init:
;; =============== function _I2C_slave_init ends ============

	signat	_I2C_slave_init,88
	global	_delay
psect	text133,local,class=CODE,delta=2
global __ptext133
__ptext133:

;; *************** function _delay *****************
;; Defined at:
;;		line 7 in file "C:\Users\user.user-PC\Desktop\Devlps\PIC-MCU\Baremetal_Code\app\src\i2c_slave.c"
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
psect	text133
	file	"C:\Users\user.user-PC\Desktop\Devlps\PIC-MCU\Baremetal_Code\app\src\i2c_slave.c"
	line	7
	global	__size_of_delay
	__size_of_delay	equ	__end_of_delay-_delay
	
_delay:	
	opt	stack 7
; Regs used in _delay: [wreg]
	line	9
	
l2132:	
;i2c_slave.c: 8: unsigned int i;
;i2c_slave.c: 9: for(i=0;i<1000;i++);
	movlw	low(0)
	movwf	(delay@i)
	movlw	high(0)
	movwf	((delay@i))+1
	movlw	high(03E8h)
	subwf	(delay@i+1),w
	movlw	low(03E8h)
	skipnz
	subwf	(delay@i),w
	skipc
	goto	u11
	goto	u10
u11:
	goto	l567
u10:
	
l2134:	
	goto	l568
	
l567:	
	
l2136:	
	movlw	low(01h)
	addwf	(delay@i),f
	skipnc
	incf	(delay@i+1),f
	movlw	high(01h)
	addwf	(delay@i+1),f
	movlw	high(03E8h)
	subwf	(delay@i+1),w
	movlw	low(03E8h)
	skipnz
	subwf	(delay@i),w
	skipc
	goto	u21
	goto	u20
u21:
	goto	l567
u20:
	
l568:	
	line	10
	
l569:	
	return
	opt stack 0
GLOBAL	__end_of_delay
	__end_of_delay:
;; =============== function _delay ends ============

	signat	_delay,88
psect	text134,local,class=CODE,delta=2
global __ptext134
__ptext134:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
