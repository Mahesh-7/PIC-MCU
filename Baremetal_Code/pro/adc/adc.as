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
	FNCALL	_main,_lcd_cmd
	FNCALL	_main,_lcd_string
	FNCALL	_main,_adc_value
	FNCALL	_main,_display
	FNCALL	_main,_temp_value
	FNCALL	_main,_display1
	FNCALL	_display1,_lcd_cmd
	FNCALL	_display1,___lwdiv
	FNCALL	_display1,_lcd_char
	FNCALL	_display1,___lwmod
	FNCALL	_display,_lcd_cmd
	FNCALL	_display,___lwdiv
	FNCALL	_display,_lcd_char
	FNCALL	_display,___lwmod
	FNCALL	_lcd_string,_lcd_char
	FNCALL	_lcd_init,_lcd_cmd
	FNCALL	_temp_value,_adc_init
	FNCALL	_temp_value,___lwtoft
	FNCALL	_temp_value,___ftdiv
	FNCALL	_temp_value,___ftmul
	FNCALL	_temp_value,___fttol
	FNCALL	___lwtoft,___ftpack
	FNCALL	___ftmul,___ftpack
	FNCALL	___ftdiv,___ftpack
	FNCALL	_adc_value,_adc_init
	FNROOT	_main
	global	main@F569
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"../../app/inc/..\..\platform\..\core\drv\adc\inc\adc_driver.h"
	line	24

;initializer for main@F569
	retlw	070h
	retlw	06Fh
	retlw	074h
	retlw	020h
	retlw	076h
	retlw	061h
	retlw	06Ch
	retlw	03Ah
	retlw	0
	global	_ADCON0
_ADCON0	set	31
	global	_ADRESH
_ADRESH	set	30
	global	_PORTB
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
	global	_ADRESL
_ADRESL	set	158
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
	btfsc	(btemp+1),7
	ljmp	stringcode
	bcf	status,7
	btfsc	(btemp+1),0
	bsf	status,7
	movf	indf,w
	incf fsr
skipnz
incf btemp+1
	return
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
	retlw	116	;'t'
	retlw	101	;'e'
	retlw	109	;'m'
	retlw	112	;'p'
	retlw	32	;' '
	retlw	118	;'v'
	retlw	97	;'a'
	retlw	108	;'l'
	retlw	58	;':'
	retlw	0
psect	strings
	file	"adc.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"../../app/inc/..\..\platform\..\core\drv\adc\inc\adc_driver.h"
main@F569:
       ds      9

global btemp
psect inittext,class=CODE,delta=2
global init_fetch,btemp
;	Called with low address in FSR and high address in W
init_fetch:
	movf btemp,w
	movwf pclath
	movf btemp+1,w
	movwf pc
global init_ram
;Called with:
;	high address of idata address in btemp 
;	low address of idata address in btemp+1 
;	low address of data in FSR
;	high address + 1 of data in btemp-1
init_ram:
	fcall init_fetch
	movwf indf,f
	incf fsr,f
	movf fsr,w
	xorwf btemp-1,w
	btfsc status,2
	retlw 0
	incf btemp+1,f
	btfsc status,2
	incf btemp,f
	goto init_ram
; Initialize objects allocated to BANK0
psect cinit,class=CODE,delta=2
global init_ram, __pidataBANK0
	bcf	status, 7	;select IRP bank0
	movlw low(__pdataBANK0+9)
	movwf btemp-1,f
	movlw high(__pidataBANK0)
	movwf btemp,f
	movlw low(__pidataBANK0)
	movwf btemp+1,f
	movlw low(__pdataBANK0)
	movwf fsr,f
	fcall init_ram
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_lcd_init
?_lcd_init:	; 0 bytes @ 0x0
	global	?_lcd_cmd
?_lcd_cmd:	; 0 bytes @ 0x0
	global	??_lcd_cmd
??_lcd_cmd:	; 0 bytes @ 0x0
	global	?_lcd_char
?_lcd_char:	; 0 bytes @ 0x0
	global	??_lcd_char
??_lcd_char:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_adc_init
?_adc_init:	; 2 bytes @ 0x0
	global	?___lwmod
?___lwmod:	; 2 bytes @ 0x0
	global	?___ftpack
?___ftpack:	; 3 bytes @ 0x0
	global	___lwmod@divisor
___lwmod@divisor:	; 2 bytes @ 0x0
	global	___ftpack@arg
___ftpack@arg:	; 3 bytes @ 0x0
	ds	1
	global	lcd_cmd@cmd
lcd_cmd@cmd:	; 1 bytes @ 0x1
	global	lcd_char@data
lcd_char@data:	; 1 bytes @ 0x1
	ds	1
	global	??_lcd_init
??_lcd_init:	; 0 bytes @ 0x2
	global	?_lcd_string
?_lcd_string:	; 0 bytes @ 0x2
	global	??_adc_init
??_adc_init:	; 0 bytes @ 0x2
	global	lcd_string@ptr
lcd_string@ptr:	; 2 bytes @ 0x2
	global	___lwmod@dividend
___lwmod@dividend:	; 2 bytes @ 0x2
	ds	1
	global	___ftpack@exp
___ftpack@exp:	; 1 bytes @ 0x3
	ds	1
	global	??_lcd_string
??_lcd_string:	; 0 bytes @ 0x4
	global	??___lwmod
??___lwmod:	; 0 bytes @ 0x4
	global	___ftpack@sign
___ftpack@sign:	; 1 bytes @ 0x4
	global	adc_init@value
adc_init@value:	; 2 bytes @ 0x4
	ds	1
	global	??___ftpack
??___ftpack:	; 0 bytes @ 0x5
	global	___lwmod@counter
___lwmod@counter:	; 1 bytes @ 0x5
	ds	1
	global	?___lwdiv
?___lwdiv:	; 2 bytes @ 0x6
	global	adc_init@channel
adc_init@channel:	; 1 bytes @ 0x6
	global	___lwdiv@divisor
___lwdiv@divisor:	; 2 bytes @ 0x6
	ds	1
	global	?_adc_value
?_adc_value:	; 2 bytes @ 0x7
	ds	1
	global	?___fttol
?___fttol:	; 4 bytes @ 0x8
	global	___lwdiv@dividend
___lwdiv@dividend:	; 2 bytes @ 0x8
	global	___fttol@f1
___fttol@f1:	; 3 bytes @ 0x8
	ds	1
	global	??_adc_value
??_adc_value:	; 0 bytes @ 0x9
	global	adc_value@channel
adc_value@channel:	; 1 bytes @ 0x9
	ds	1
	global	??___lwdiv
??___lwdiv:	; 0 bytes @ 0xA
	ds	1
	global	___lwdiv@quotient
___lwdiv@quotient:	; 2 bytes @ 0xB
	ds	1
	global	??___lwtoft
??___lwtoft:	; 0 bytes @ 0xC
	ds	1
	global	??_temp_value
??_temp_value:	; 0 bytes @ 0xD
	global	temp_value@channel
temp_value@channel:	; 1 bytes @ 0xD
	global	___lwdiv@counter
___lwdiv@counter:	; 1 bytes @ 0xD
	ds	1
	global	??_display
??_display:	; 0 bytes @ 0xE
	global	??_display1
??_display1:	; 0 bytes @ 0xE
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	?_display
?_display:	; 0 bytes @ 0x0
	global	??___fttol
??___fttol:	; 0 bytes @ 0x0
	global	display@value
display@value:	; 2 bytes @ 0x0
	ds	2
	global	display@location
display@location:	; 1 bytes @ 0x2
	ds	2
	global	___fttol@sign1
___fttol@sign1:	; 1 bytes @ 0x4
	ds	1
	global	___fttol@lval
___fttol@lval:	; 4 bytes @ 0x5
	ds	4
	global	___fttol@exp1
___fttol@exp1:	; 1 bytes @ 0x9
	ds	1
	global	?___lwtoft
?___lwtoft:	; 3 bytes @ 0xA
	global	___lwtoft@c
___lwtoft@c:	; 2 bytes @ 0xA
	ds	3
	global	?___ftdiv
?___ftdiv:	; 3 bytes @ 0xD
	global	___ftdiv@f2
___ftdiv@f2:	; 3 bytes @ 0xD
	ds	3
	global	___ftdiv@f1
___ftdiv@f1:	; 3 bytes @ 0x10
	ds	3
	global	??___ftdiv
??___ftdiv:	; 0 bytes @ 0x13
	ds	4
	global	___ftdiv@cntr
___ftdiv@cntr:	; 1 bytes @ 0x17
	ds	1
	global	___ftdiv@f3
___ftdiv@f3:	; 3 bytes @ 0x18
	ds	3
	global	___ftdiv@exp
___ftdiv@exp:	; 1 bytes @ 0x1B
	ds	1
	global	___ftdiv@sign
___ftdiv@sign:	; 1 bytes @ 0x1C
	ds	1
	global	?___ftmul
?___ftmul:	; 3 bytes @ 0x1D
	global	___ftmul@f1
___ftmul@f1:	; 3 bytes @ 0x1D
	ds	3
	global	___ftmul@f2
___ftmul@f2:	; 3 bytes @ 0x20
	ds	3
	global	??___ftmul
??___ftmul:	; 0 bytes @ 0x23
	ds	4
	global	___ftmul@exp
___ftmul@exp:	; 1 bytes @ 0x27
	ds	1
	global	___ftmul@f3_as_product
___ftmul@f3_as_product:	; 3 bytes @ 0x28
	ds	3
	global	___ftmul@cntr
___ftmul@cntr:	; 1 bytes @ 0x2B
	ds	1
	global	___ftmul@sign
___ftmul@sign:	; 1 bytes @ 0x2C
	ds	1
	global	?_temp_value
?_temp_value:	; 2 bytes @ 0x2D
	ds	2
	global	?_display1
?_display1:	; 0 bytes @ 0x2F
	global	display1@value
display1@value:	; 2 bytes @ 0x2F
	ds	2
	global	display1@location
display1@location:	; 1 bytes @ 0x31
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x32
	ds	4
	global	main@a
main@a:	; 9 bytes @ 0x36
	ds	9
;;Data sizes: Strings 10, constant 0, data 9, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     14      14
;; BANK0           80     63      72
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?___ftpack	float  size(1) Largest target is 0
;;
;; ?___lwmod	unsigned int  size(1) Largest target is 0
;;
;; ?___lwdiv	unsigned int  size(1) Largest target is 0
;;
;; ?___fttol	long  size(1) Largest target is 0
;;
;; ?_temp_value	unsigned short  size(1) Largest target is 0
;;
;; ?___ftdiv	float  size(1) Largest target is 0
;;
;; ?___lwtoft	float  size(1) Largest target is 0
;;
;; ?___ftmul	float  size(1) Largest target is 0
;;
;; ?_adc_value	unsigned short  size(1) Largest target is 0
;;
;; ?_adc_init	unsigned short  size(1) Largest target is 0
;;
;; lcd_string@ptr	PTR const unsigned char  size(2) Largest target is 10
;;		 -> STR_1(CODE[10]), main@a(BANK0[9]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_temp_value
;;   _display1->___lwdiv
;;   _display1->_temp_value
;;   _display->___lwdiv
;;   _lcd_string->_lcd_char
;;   _lcd_init->_lcd_cmd
;;   _temp_value->___lwtoft
;;   ___lwtoft->___fttol
;;   ___ftmul->___lwtoft
;;   ___ftdiv->___lwtoft
;;   _adc_value->_adc_init
;;   ___fttol->___ftpack
;;   ___lwdiv->___lwmod
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_display1
;;   _display1->_temp_value
;;   _temp_value->___ftmul
;;   ___lwtoft->___fttol
;;   ___ftmul->___ftdiv
;;   ___ftdiv->___lwtoft
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
;;Main: autosize = 0, tempsize = 4, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                13    13      0    2773
;;                                             50 BANK0     13    13      0
;;                           _lcd_init
;;                            _lcd_cmd
;;                         _lcd_string
;;                          _adc_value
;;                            _display
;;                         _temp_value
;;                           _display1
;; ---------------------------------------------------------------------------------
;; (1) _display1                                             3     0      3     475
;;                                             47 BANK0      3     0      3
;;                            _lcd_cmd
;;                            ___lwdiv
;;                           _lcd_char
;;                            ___lwmod
;;                         _temp_value (ARG)
;; ---------------------------------------------------------------------------------
;; (1) _display                                              3     0      3     475
;;                                              0 BANK0      3     0      3
;;                            _lcd_cmd
;;                            ___lwdiv
;;                           _lcd_char
;;                            ___lwmod
;;                          _adc_value (ARG)
;; ---------------------------------------------------------------------------------
;; (1) _lcd_string                                           2     0      2      67
;;                                              2 COMMON     2     0      2
;;                           _lcd_char
;; ---------------------------------------------------------------------------------
;; (1) _lcd_init                                             0     0      0      22
;;                            _lcd_cmd
;; ---------------------------------------------------------------------------------
;; (1) _temp_value                                           3     1      2    1597
;;                                             13 COMMON     1     1      0
;;                                             45 BANK0      2     0      2
;;                           _adc_init
;;                           ___lwtoft
;;                            ___ftdiv
;;                            ___ftmul
;;                            ___fttol
;; ---------------------------------------------------------------------------------
;; (2) ___lwtoft                                             4     1      3     231
;;                                             12 COMMON     1     1      0
;;                                             10 BANK0      3     0      3
;;                           ___ftpack
;;                           _adc_init (ARG)
;;                            ___fttol (ARG)
;; ---------------------------------------------------------------------------------
;; (2) ___ftmul                                             16    10      6     535
;;                                             29 BANK0     16    10      6
;;                           ___ftpack
;;                            ___ftdiv (ARG)
;;                           ___lwtoft (ARG)
;;                           _adc_init (ARG)
;;                            ___fttol (ARG)
;; ---------------------------------------------------------------------------------
;; (2) ___ftdiv                                             16    10      6     489
;;                                             13 BANK0     16    10      6
;;                           ___ftpack
;;                           ___lwtoft (ARG)
;;                           _adc_init (ARG)
;;                            ___fttol (ARG)
;; ---------------------------------------------------------------------------------
;; (2) _lcd_char                                             2     2      0      22
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; (2) _lcd_cmd                                              2     2      0      22
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; (1) _adc_value                                            3     1      2      90
;;                                              7 COMMON     3     1      2
;;                           _adc_init
;; ---------------------------------------------------------------------------------
;; (2) ___fttol                                             14    10      4     252
;;                                              8 COMMON     4     0      4
;;                                              0 BANK0     10    10      0
;;                           ___ftpack (ARG)
;;                           _adc_init (ARG)
;; ---------------------------------------------------------------------------------
;; (3) ___ftpack                                             8     3      5     209
;;                                              0 COMMON     8     3      5
;; ---------------------------------------------------------------------------------
;; (2) ___lwmod                                              6     2      4     159
;;                                              0 COMMON     6     2      4
;; ---------------------------------------------------------------------------------
;; (2) ___lwdiv                                              8     4      4     162
;;                                              6 COMMON     8     4      4
;;                            ___lwmod (ARG)
;; ---------------------------------------------------------------------------------
;; (2) _adc_init                                             7     5      2      68
;;                                              0 COMMON     7     5      2
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _lcd_init
;;     _lcd_cmd
;;   _lcd_cmd
;;   _lcd_string
;;     _lcd_char
;;   _adc_value
;;     _adc_init
;;   _display
;;     _lcd_cmd
;;     ___lwdiv
;;       ___lwmod (ARG)
;;     _lcd_char
;;     ___lwmod
;;     _adc_value (ARG)
;;       _adc_init
;;   _temp_value
;;     _adc_init
;;     ___lwtoft
;;       ___ftpack
;;       _adc_init (ARG)
;;       ___fttol (ARG)
;;         ___ftpack (ARG)
;;         _adc_init (ARG)
;;     ___ftdiv
;;       ___ftpack
;;       ___lwtoft (ARG)
;;         ___ftpack
;;         _adc_init (ARG)
;;         ___fttol (ARG)
;;           ___ftpack (ARG)
;;           _adc_init (ARG)
;;       _adc_init (ARG)
;;       ___fttol (ARG)
;;         ___ftpack (ARG)
;;         _adc_init (ARG)
;;     ___ftmul
;;       ___ftpack
;;       ___ftdiv (ARG)
;;         ___ftpack
;;         ___lwtoft (ARG)
;;           ___ftpack
;;           _adc_init (ARG)
;;           ___fttol (ARG)
;;             ___ftpack (ARG)
;;             _adc_init (ARG)
;;         _adc_init (ARG)
;;         ___fttol (ARG)
;;           ___ftpack (ARG)
;;           _adc_init (ARG)
;;       ___lwtoft (ARG)
;;         ___ftpack
;;         _adc_init (ARG)
;;         ___fttol (ARG)
;;           ___ftpack (ARG)
;;           _adc_init (ARG)
;;       _adc_init (ARG)
;;       ___fttol (ARG)
;;         ___ftpack (ARG)
;;         _adc_init (ARG)
;;     ___fttol
;;       ___ftpack (ARG)
;;       _adc_init (ARG)
;;   _display1
;;     _lcd_cmd
;;     ___lwdiv
;;       ___lwmod (ARG)
;;     _lcd_char
;;     ___lwmod
;;     _temp_value (ARG)
;;       _adc_init
;;       ___lwtoft
;;         ___ftpack
;;         _adc_init (ARG)
;;         ___fttol (ARG)
;;           ___ftpack (ARG)
;;           _adc_init (ARG)
;;       ___ftdiv
;;         ___ftpack
;;         ___lwtoft (ARG)
;;           ___ftpack
;;           _adc_init (ARG)
;;           ___fttol (ARG)
;;             ___ftpack (ARG)
;;             _adc_init (ARG)
;;         _adc_init (ARG)
;;         ___fttol (ARG)
;;           ___ftpack (ARG)
;;           _adc_init (ARG)
;;       ___ftmul
;;         ___ftpack
;;         ___ftdiv (ARG)
;;           ___ftpack
;;           ___lwtoft (ARG)
;;             ___ftpack
;;             _adc_init (ARG)
;;             ___fttol (ARG)
;;               ___ftpack (ARG)
;;               _adc_init (ARG)
;;           _adc_init (ARG)
;;           ___fttol (ARG)
;;             ___ftpack (ARG)
;;             _adc_init (ARG)
;;         ___lwtoft (ARG)
;;           ___ftpack
;;           _adc_init (ARG)
;;           ___fttol (ARG)
;;             ___ftpack (ARG)
;;             _adc_init (ARG)
;;         _adc_init (ARG)
;;         ___fttol (ARG)
;;           ___ftpack (ARG)
;;           _adc_init (ARG)
;;       ___fttol
;;         ___ftpack (ARG)
;;         _adc_init (ARG)
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BANK3               60      0       0       9        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;BANK2               60      0       0      11        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR1                 0      0       0       2        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      59      12        0.0%
;;ABS                  0      0      56       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       3       2        0.0%
;;BANK0               50     3F      48       5       90.0%
;;BITBANK0            50      0       0       4        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      E       E       1      100.0%
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 18 in file "../../app/inc/..\..\platform\..\core\drv\adc\inc\adc_driver.h"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  a               9   54[BANK0 ] unsigned char [9]
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       9       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         0      13       0       0       0
;;Total ram usage:       13 bytes
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_lcd_init
;;		_lcd_cmd
;;		_lcd_string
;;		_adc_value
;;		_display
;;		_temp_value
;;		_display1
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"../../app/inc/..\..\platform\..\core\drv\adc\inc\adc_driver.h"
	line	18
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 8
; Regs used in _main: [wreg-fsr0h+status,2-btemp+1+pclath+cstack]
	line	20
	
l3688:	
;..\..\platform\..\core\drv\adc\inc\adc_driver.h: 20: lcd_init();
	fcall	_lcd_init
	line	22
;..\..\platform\..\core\drv\adc\inc\adc_driver.h: 22: lcd_cmd(0X80);
	movlw	(080h)
	fcall	_lcd_cmd
	line	24
	
l3690:	
;..\..\platform\..\core\drv\adc\inc\adc_driver.h: 24: unsigned char a[]="pot val:";
	movlw	(main@a)&0ffh
	movwf	fsr0
	movlw	low(main@F569)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	fsr0,w
	movwf	((??_main+0)+0+1)
	movlw	9
	movwf	((??_main+0)+0+2)
u3150:
	movf	(??_main+0)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	
	movf	indf,w
	movwf	((??_main+0)+0+3)
	incf	(??_main+0)+0,f
	movf	((??_main+0)+0+1),w
	movwf	fsr0
	
	movf	((??_main+0)+0+3),w
	movwf	indf
	incf	((??_main+0)+0+1),f
	decfsz	((??_main+0)+0+2),f
	goto	u3150
	line	26
	
l3692:	
;..\..\platform\..\core\drv\adc\inc\adc_driver.h: 26: lcd_string(a);
	movlw	(main@a&0ffh)
	movwf	(?_lcd_string)
	movlw	(0x0/2)
	movwf	(?_lcd_string+1)
	fcall	_lcd_string
	line	28
	
l3694:	
;..\..\platform\..\core\drv\adc\inc\adc_driver.h: 28: lcd_cmd(0xc0);
	movlw	(0C0h)
	fcall	_lcd_cmd
	line	30
	
l3696:	
;..\..\platform\..\core\drv\adc\inc\adc_driver.h: 30: lcd_string("temp val:");
	movlw	low((STR_1-__stringbase))
	movwf	(?_lcd_string)
	movlw	80h
	movwf	(?_lcd_string+1)
	fcall	_lcd_string
	line	33
;..\..\platform\..\core\drv\adc\inc\adc_driver.h: 33: while(1)
	
l1151:	
	line	36
	
l3698:	
;..\..\platform\..\core\drv\adc\inc\adc_driver.h: 34: {
;..\..\platform\..\core\drv\adc\inc\adc_driver.h: 36: display(adc_value(0),0x8a);
	movlw	(0)
	fcall	_adc_value
	movf	(1+(?_adc_value)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(?_display+1)
	addwf	(?_display+1)
	movf	(0+(?_adc_value)),w
	clrf	(?_display)
	addwf	(?_display)

	movlw	(08Ah)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_display)+02h
	fcall	_display
	line	38
	
l3700:	
;..\..\platform\..\core\drv\adc\inc\adc_driver.h: 38: display1(temp_value(1),0xca);
	movlw	(01h)
	fcall	_temp_value
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?_temp_value)),w
	clrf	(?_display1+1)
	addwf	(?_display1+1)
	movf	(0+(?_temp_value)),w
	clrf	(?_display1)
	addwf	(?_display1)

	movlw	(0CAh)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_display1)+02h
	fcall	_display1
	line	41
	
l1152:	
	line	33
	goto	l1151
	
l1153:	
	line	43
	
l1154:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_display1
psect	text358,local,class=CODE,delta=2
global __ptext358
__ptext358:

;; *************** function _display1 *****************
;; Defined at:
;;		line 59 in file "../../app/inc/..\..\platform\..\core\drv\adc\inc\adc_driver.h"
;; Parameters:    Size  Location     Type
;;  value           2   47[BANK0 ] unsigned short 
;;  location        1   49[BANK0 ] unsigned char 
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
;;      Params:         0       3       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       3       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_lcd_cmd
;;		___lwdiv
;;		_lcd_char
;;		___lwmod
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text358
	file	"../../app/inc/..\..\platform\..\core\drv\adc\inc\adc_driver.h"
	line	59
	global	__size_of_display1
	__size_of_display1	equ	__end_of_display1-_display1
	
_display1:	
	opt	stack 7
; Regs used in _display1: [wreg+status,2+status,0+pclath+cstack]
	line	60
	
l3686:	
;..\..\platform\..\core\drv\adc\inc\adc_driver.h: 60: lcd_cmd(location);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(display1@location),w
	fcall	_lcd_cmd
	line	61
;..\..\platform\..\core\drv\adc\inc\adc_driver.h: 61: lcd_char((value/1000)+0x30);
	movlw	low(03E8h)
	movwf	(?___lwdiv)
	movlw	high(03E8h)
	movwf	((?___lwdiv))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(display1@value+1),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(display1@value),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	movf	(0+(?___lwdiv)),w
	addlw	030h
	fcall	_lcd_char
	line	62
;..\..\platform\..\core\drv\adc\inc\adc_driver.h: 62: lcd_char(((value%1000)/100)+0x30);
	movlw	low(064h)
	movwf	(?___lwdiv)
	movlw	high(064h)
	movwf	((?___lwdiv))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(display1@value+1),w
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(display1@value),w
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	movlw	low(03E8h)
	movwf	(?___lwmod)
	movlw	high(03E8h)
	movwf	((?___lwmod))+1
	fcall	___lwmod
	movf	(1+(?___lwmod)),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(0+(?___lwmod)),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	movf	(0+(?___lwdiv)),w
	addlw	030h
	fcall	_lcd_char
	line	63
;..\..\platform\..\core\drv\adc\inc\adc_driver.h: 63: lcd_char('.');
	movlw	(02Eh)
	fcall	_lcd_char
	line	64
;..\..\platform\..\core\drv\adc\inc\adc_driver.h: 64: lcd_char(((value%100)/10)+0x30);
	movlw	low(0Ah)
	movwf	(?___lwdiv)
	movlw	high(0Ah)
	movwf	((?___lwdiv))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(display1@value+1),w
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(display1@value),w
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	movlw	low(064h)
	movwf	(?___lwmod)
	movlw	high(064h)
	movwf	((?___lwmod))+1
	fcall	___lwmod
	movf	(1+(?___lwmod)),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(0+(?___lwmod)),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	movf	(0+(?___lwdiv)),w
	addlw	030h
	fcall	_lcd_char
	line	65
;..\..\platform\..\core\drv\adc\inc\adc_driver.h: 65: lcd_char((value%10)+0x30);
	movlw	low(0Ah)
	movwf	(?___lwmod)
	movlw	high(0Ah)
	movwf	((?___lwmod))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(display1@value+1),w
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(display1@value),w
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	movf	(0+(?___lwmod)),w
	addlw	030h
	fcall	_lcd_char
	line	67
;..\..\platform\..\core\drv\adc\inc\adc_driver.h: 67: lcd_char('c');
	movlw	(063h)
	fcall	_lcd_char
	line	68
	
l1160:	
	return
	opt stack 0
GLOBAL	__end_of_display1
	__end_of_display1:
;; =============== function _display1 ends ============

	signat	_display1,8312
	global	_display
psect	text359,local,class=CODE,delta=2
global __ptext359
__ptext359:

;; *************** function _display *****************
;; Defined at:
;;		line 47 in file "../../app/inc/..\..\platform\..\core\drv\adc\inc\adc_driver.h"
;; Parameters:    Size  Location     Type
;;  value           2    0[BANK0 ] unsigned short 
;;  location        1    2[BANK0 ] unsigned char 
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
;;      Params:         0       3       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       3       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_lcd_cmd
;;		___lwdiv
;;		_lcd_char
;;		___lwmod
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text359
	file	"../../app/inc/..\..\platform\..\core\drv\adc\inc\adc_driver.h"
	line	47
	global	__size_of_display
	__size_of_display	equ	__end_of_display-_display
	
_display:	
	opt	stack 7
; Regs used in _display: [wreg+status,2+status,0+pclath+cstack]
	line	48
	
l3684:	
;..\..\platform\..\core\drv\adc\inc\adc_driver.h: 48: lcd_cmd(location);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(display@location),w
	fcall	_lcd_cmd
	line	49
;..\..\platform\..\core\drv\adc\inc\adc_driver.h: 49: lcd_char((value/1000)+0x30);
	movlw	low(03E8h)
	movwf	(?___lwdiv)
	movlw	high(03E8h)
	movwf	((?___lwdiv))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(display@value+1),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(display@value),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	movf	(0+(?___lwdiv)),w
	addlw	030h
	fcall	_lcd_char
	line	50
;..\..\platform\..\core\drv\adc\inc\adc_driver.h: 50: lcd_char(((value%1000)/100)+0x30);
	movlw	low(064h)
	movwf	(?___lwdiv)
	movlw	high(064h)
	movwf	((?___lwdiv))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(display@value+1),w
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(display@value),w
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	movlw	low(03E8h)
	movwf	(?___lwmod)
	movlw	high(03E8h)
	movwf	((?___lwmod))+1
	fcall	___lwmod
	movf	(1+(?___lwmod)),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(0+(?___lwmod)),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	movf	(0+(?___lwdiv)),w
	addlw	030h
	fcall	_lcd_char
	line	51
;..\..\platform\..\core\drv\adc\inc\adc_driver.h: 51: lcd_char(((value%100)/10)+0x30);
	movlw	low(0Ah)
	movwf	(?___lwdiv)
	movlw	high(0Ah)
	movwf	((?___lwdiv))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(display@value+1),w
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(display@value),w
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	movlw	low(064h)
	movwf	(?___lwmod)
	movlw	high(064h)
	movwf	((?___lwmod))+1
	fcall	___lwmod
	movf	(1+(?___lwmod)),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(0+(?___lwmod)),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	movf	(0+(?___lwdiv)),w
	addlw	030h
	fcall	_lcd_char
	line	52
;..\..\platform\..\core\drv\adc\inc\adc_driver.h: 52: lcd_char((value%10)+0x30);
	movlw	low(0Ah)
	movwf	(?___lwmod)
	movlw	high(0Ah)
	movwf	((?___lwmod))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(display@value+1),w
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(display@value),w
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	movf	(0+(?___lwmod)),w
	addlw	030h
	fcall	_lcd_char
	line	54
	
l1157:	
	return
	opt stack 0
GLOBAL	__end_of_display
	__end_of_display:
;; =============== function _display ends ============

	signat	_display,8312
	global	_lcd_string
psect	text360,local,class=CODE,delta=2
global __ptext360
__ptext360:

;; *************** function _lcd_string *****************
;; Defined at:
;;		line 34 in file "C:\Users\user.user-PC\Desktop\PIC-MCU\Baremetal_Code\core\drv\lcd\src\lcd_driver.c"
;; Parameters:    Size  Location     Type
;;  ptr             2    2[COMMON] PTR const unsigned char 
;;		 -> STR_1(10), main@a(9), 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+0, btemp+1, pclath, cstack
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
;;		_lcd_char
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text360
	file	"C:\Users\user.user-PC\Desktop\PIC-MCU\Baremetal_Code\core\drv\lcd\src\lcd_driver.c"
	line	34
	global	__size_of_lcd_string
	__size_of_lcd_string	equ	__end_of_lcd_string-_lcd_string
	
_lcd_string:	
	opt	stack 7
; Regs used in _lcd_string: [wreg-fsr0h+status,2-btemp+1+pclath+cstack]
	line	35
	
l3676:	
;lcd_driver.c: 35: while(*ptr)
	goto	l1727
	
l1728:	
	line	37
	
l3678:	
;lcd_driver.c: 36: {
;lcd_driver.c: 37: lcd_char(*ptr);
	movf	(lcd_string@ptr+1),w
	movwf	btemp+1
	movf	(lcd_string@ptr),w
	movwf	fsr0
	fcall	stringtab
	fcall	_lcd_char
	line	38
	
l3680:	
;lcd_driver.c: 38: ptr++;
	movlw	low(01h)
	addwf	(lcd_string@ptr),f
	skipnc
	incf	(lcd_string@ptr+1),f
	movlw	high(01h)
	addwf	(lcd_string@ptr+1),f
	line	40
	
l1727:	
	line	35
	
l3682:	
	movf	(lcd_string@ptr+1),w
	movwf	btemp+1
	movf	(lcd_string@ptr),w
	movwf	fsr0
	fcall	stringtab
	iorlw	0
	skipz
	goto	u3141
	goto	u3140
u3141:
	goto	l1728
u3140:
	
l1729:	
	line	41
	
l1730:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_string
	__end_of_lcd_string:
;; =============== function _lcd_string ends ============

	signat	_lcd_string,4216
	global	_lcd_init
psect	text361,local,class=CODE,delta=2
global __ptext361
__ptext361:

;; *************** function _lcd_init *****************
;; Defined at:
;;		line 44 in file "C:\Users\user.user-PC\Desktop\PIC-MCU\Baremetal_Code\core\drv\lcd\src\lcd_driver.c"
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
psect	text361
	file	"C:\Users\user.user-PC\Desktop\PIC-MCU\Baremetal_Code\core\drv\lcd\src\lcd_driver.c"
	line	44
	global	__size_of_lcd_init
	__size_of_lcd_init	equ	__end_of_lcd_init-_lcd_init
	
_lcd_init:	
	opt	stack 7
; Regs used in _lcd_init: [wreg+status,2+status,0+pclath+cstack]
	line	45
	
l3660:	
;lcd_driver.c: 45: ADCON1=0x02;
	movlw	(02h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(159)^080h	;volatile
	line	46
	
l3662:	
;lcd_driver.c: 46: TRISB=0X00;
	clrf	(134)^080h	;volatile
	line	47
	
l3664:	
;lcd_driver.c: 47: PORTB=0X00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(6)	;volatile
	line	48
	
l3666:	
;lcd_driver.c: 48: TRISE=0X00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(137)^080h	;volatile
	line	49
	
l3668:	
;lcd_driver.c: 49: PORTE=0X00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(9)	;volatile
	line	51
	
l3670:	
;lcd_driver.c: 51: lcd_cmd(0x0e);
	movlw	(0Eh)
	fcall	_lcd_cmd
	line	52
	
l3672:	
;lcd_driver.c: 52: lcd_cmd(0x01);
	movlw	(01h)
	fcall	_lcd_cmd
	line	53
	
l3674:	
;lcd_driver.c: 53: lcd_cmd(0x38);
	movlw	(038h)
	fcall	_lcd_cmd
	line	55
	
l1733:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_init
	__end_of_lcd_init:
;; =============== function _lcd_init ends ============

	signat	_lcd_init,88
	global	_temp_value
psect	text362,local,class=CODE,delta=2
global __ptext362
__ptext362:

;; *************** function _temp_value *****************
;; Defined at:
;;		line 31 in file "../../app/inc/..\..\platform\..\core\drv\adc\inc\adc_driver.h"
;; Parameters:    Size  Location     Type
;;  channel         1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  channel         1   13[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2   45[BANK0 ] unsigned short 
;; Registers used:
;;		wreg, status,2, status,0, btemp+0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       2       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       2       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_adc_init
;;		___lwtoft
;;		___ftdiv
;;		___ftmul
;;		___fttol
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text362
	file	"../../app/inc/..\..\platform\..\core\drv\adc\inc\adc_driver.h"
	line	31
	global	__size_of_temp_value
	__size_of_temp_value	equ	__end_of_temp_value-_temp_value
	
_temp_value:	
	opt	stack 7
; Regs used in _temp_value: [wreg+status,2-btemp+0+pclath+cstack]
;temp_value@channel stored from wreg
	movwf	(temp_value@channel)
	line	32
	
l3656:	
;..\..\platform\..\core\drv\adc\inc\adc_driver.h: 32: return ((adc_init(channel)/2.05)*100);
	movf	(temp_value@channel),w
	fcall	_adc_init
	movf	(1+(?_adc_init)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(?___lwtoft+1)
	addwf	(?___lwtoft+1)
	movf	(0+(?_adc_init)),w
	clrf	(?___lwtoft)
	addwf	(?___lwtoft)

	fcall	___lwtoft
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___lwtoft)),w
	movwf	0+(?___ftdiv)+03h
	movf	(1+(?___lwtoft)),w
	movwf	1+(?___ftdiv)+03h
	movf	(2+(?___lwtoft)),w
	movwf	2+(?___ftdiv)+03h
	movlw	0x33
	movwf	(?___ftdiv)
	movlw	0x3
	movwf	(?___ftdiv+1)
	movlw	0x40
	movwf	(?___ftdiv+2)
	fcall	___ftdiv
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftdiv)),w
	movwf	0+(?___ftmul)+03h
	movf	(1+(?___ftdiv)),w
	movwf	1+(?___ftmul)+03h
	movf	(2+(?___ftdiv)),w
	movwf	2+(?___ftmul)+03h
	movlw	0x0
	movwf	(?___ftmul)
	movlw	0xc8
	movwf	(?___ftmul+1)
	movlw	0x42
	movwf	(?___ftmul+2)
	fcall	___ftmul
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftmul)),w
	movwf	(?___fttol)
	movf	(1+(?___ftmul)),w
	movwf	(?___fttol+1)
	movf	(2+(?___ftmul)),w
	movwf	(?___fttol+2)
	fcall	___fttol
	movf	1+(((0+(?___fttol)))),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(?_temp_value+1)
	addwf	(?_temp_value+1)
	movf	0+(((0+(?___fttol)))),w
	clrf	(?_temp_value)
	addwf	(?_temp_value)

	
l3658:	
	line	33
	
l569:	
	return
	opt stack 0
GLOBAL	__end_of_temp_value
	__end_of_temp_value:
;; =============== function _temp_value ends ============

	signat	_temp_value,4218
	global	___lwtoft
psect	text363,local,class=CODE,delta=2
global __ptext363
__ptext363:

;; *************** function ___lwtoft *****************
;; Defined at:
;;		line 29 in file "C:\Program Files\HI-TECH Software\PICC\9.71a\sources\lwtoft.c"
;; Parameters:    Size  Location     Type
;;  c               2   10[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  3   10[BANK0 ] float 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       3       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         1       3       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___ftpack
;; This function is called by:
;;		_temp_value
;; This function uses a non-reentrant model
;;
psect	text363
	file	"C:\Program Files\HI-TECH Software\PICC\9.71a\sources\lwtoft.c"
	line	29
	global	__size_of___lwtoft
	__size_of___lwtoft	equ	__end_of___lwtoft-___lwtoft
	
___lwtoft:	
	opt	stack 6
; Regs used in ___lwtoft: [wreg+status,2+status,0+pclath+cstack]
	line	30
	
l3652:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(___lwtoft@c),w
	movwf	(?___ftpack)
	movf	(___lwtoft@c+1),w
	movwf	(?___ftpack+1)
	clrf	(?___ftpack+2)
	movlw	(08Eh)
	movwf	(??___lwtoft+0)+0
	movf	(??___lwtoft+0)+0,w
	movwf	0+(?___ftpack)+03h
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	0+(?___ftpack)+04h
	fcall	___ftpack
	movf	(0+(?___ftpack)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___lwtoft)
	movf	(1+(?___ftpack)),w
	movwf	(?___lwtoft+1)
	movf	(2+(?___ftpack)),w
	movwf	(?___lwtoft+2)
	
l3654:	
	line	31
	
l1965:	
	return
	opt stack 0
GLOBAL	__end_of___lwtoft
	__end_of___lwtoft:
;; =============== function ___lwtoft ends ============

	signat	___lwtoft,4219
	global	___ftmul
psect	text364,local,class=CODE,delta=2
global __ptext364
__ptext364:

;; *************** function ___ftmul *****************
;; Defined at:
;;		line 52 in file "C:\Program Files\HI-TECH Software\PICC\9.71a\sources\ftmul.c"
;; Parameters:    Size  Location     Type
;;  f1              3   29[BANK0 ] float 
;;  f2              3   32[BANK0 ] float 
;; Auto vars:     Size  Location     Type
;;  f3_as_produc    3   40[BANK0 ] unsigned um
;;  sign            1   44[BANK0 ] unsigned char 
;;  cntr            1   43[BANK0 ] unsigned char 
;;  exp             1   39[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  3   29[BANK0 ] float 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       6       0       0       0
;;      Locals:         0       6       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         0      16       0       0       0
;;Total ram usage:       16 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___ftpack
;; This function is called by:
;;		_temp_value
;; This function uses a non-reentrant model
;;
psect	text364
	file	"C:\Program Files\HI-TECH Software\PICC\9.71a\sources\ftmul.c"
	line	52
	global	__size_of___ftmul
	__size_of___ftmul	equ	__end_of___ftmul-___ftmul
	
___ftmul:	
	opt	stack 6
; Regs used in ___ftmul: [wreg+status,2+status,0+pclath+cstack]
	line	56
	
l3602:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(___ftmul@f1),w
	movwf	((??___ftmul+0)+0)
	movf	(___ftmul@f1+1),w
	movwf	((??___ftmul+0)+0+1)
	movf	(___ftmul@f1+2),w
	movwf	((??___ftmul+0)+0+2)
	clrc
	rlf	(??___ftmul+0)+1,w
	rlf	(??___ftmul+0)+2,w
	movwf	(??___ftmul+3)+0
	movf	(??___ftmul+3)+0,w
	movwf	(___ftmul@exp)
	movf	((___ftmul@exp)),f
	skipz
	goto	u3001
	goto	u3000
u3001:
	goto	l1840
u3000:
	line	57
	
l3604:	
	movlw	0x0
	movwf	(?___ftmul)
	movlw	0x0
	movwf	(?___ftmul+1)
	movlw	0x0
	movwf	(?___ftmul+2)
	
l3606:	
	goto	l1841
	
l1840:	
	line	58
	
l3608:	
	movf	(___ftmul@f2),w
	movwf	((??___ftmul+0)+0)
	movf	(___ftmul@f2+1),w
	movwf	((??___ftmul+0)+0+1)
	movf	(___ftmul@f2+2),w
	movwf	((??___ftmul+0)+0+2)
	clrc
	rlf	(??___ftmul+0)+1,w
	rlf	(??___ftmul+0)+2,w
	movwf	(??___ftmul+3)+0
	movf	(??___ftmul+3)+0,w
	movwf	(___ftmul@sign)
	movf	((___ftmul@sign)),f
	skipz
	goto	u3011
	goto	u3010
u3011:
	goto	l1842
u3010:
	line	59
	
l3610:	
	movlw	0x0
	movwf	(?___ftmul)
	movlw	0x0
	movwf	(?___ftmul+1)
	movlw	0x0
	movwf	(?___ftmul+2)
	
l3612:	
	goto	l1841
	
l1842:	
	line	60
	
l3614:	
	movf	(___ftmul@sign),w
	addlw	07Bh
	movwf	(??___ftmul+0)+0
	movf	(??___ftmul+0)+0,w
	addwf	(___ftmul@exp),f
	line	61
	movf	(___ftmul@f1),w
	movwf	((??___ftmul+0)+0)
	movf	(___ftmul@f1+1),w
	movwf	((??___ftmul+0)+0+1)
	movf	(___ftmul@f1+2),w
	movwf	((??___ftmul+0)+0+2)
	movlw	010h
u3025:
	clrc
	rrf	(??___ftmul+0)+2,f
	rrf	(??___ftmul+0)+1,f
	rrf	(??___ftmul+0)+0,f
u3020:
	addlw	-1
	skipz
	goto	u3025
	movf	0+(??___ftmul+0)+0,w
	movwf	(??___ftmul+3)+0
	movf	(??___ftmul+3)+0,w
	movwf	(___ftmul@sign)
	line	62
	movf	(___ftmul@f2),w
	movwf	((??___ftmul+0)+0)
	movf	(___ftmul@f2+1),w
	movwf	((??___ftmul+0)+0+1)
	movf	(___ftmul@f2+2),w
	movwf	((??___ftmul+0)+0+2)
	movlw	010h
u3035:
	clrc
	rrf	(??___ftmul+0)+2,f
	rrf	(??___ftmul+0)+1,f
	rrf	(??___ftmul+0)+0,f
u3030:
	addlw	-1
	skipz
	goto	u3035
	movf	0+(??___ftmul+0)+0,w
	movwf	(??___ftmul+3)+0
	movf	(??___ftmul+3)+0,w
	xorwf	(___ftmul@sign),f
	line	63
	movlw	(080h)
	movwf	(??___ftmul+0)+0
	movf	(??___ftmul+0)+0,w
	andwf	(___ftmul@sign),f
	line	64
	
l3616:	
	bsf	(___ftmul@f1)+(15/8),(15)&7
	line	66
	
l3618:	
	bsf	(___ftmul@f2)+(15/8),(15)&7
	line	67
	
l3620:	
	movlw	0FFh
	andwf	(___ftmul@f2),f
	movlw	0FFh
	andwf	(___ftmul@f2+1),f
	movlw	0
	andwf	(___ftmul@f2+2),f
	line	68
	
l3622:	
	movlw	0
	movwf	(___ftmul@f3_as_product)
	movlw	0
	movwf	(___ftmul@f3_as_product+1)
	movlw	0
	movwf	(___ftmul@f3_as_product+2)
	line	69
	
l3624:	
	movlw	(07h)
	movwf	(??___ftmul+0)+0
	movf	(??___ftmul+0)+0,w
	movwf	(___ftmul@cntr)
	line	70
	
l1843:	
	line	71
	
l3626:	
	btfss	(___ftmul@f1),(0)&7
	goto	u3041
	goto	u3040
u3041:
	goto	l1844
u3040:
	line	72
	
l3628:	
	movf	(___ftmul@f2),w
	addwf	(___ftmul@f3_as_product),f
	movf	(___ftmul@f2+1),w
	clrz
	skipnc
	incf	(___ftmul@f2+1),w
	skipnz
	goto	u3051
	addwf	(___ftmul@f3_as_product+1),f
u3051:
	movf	(___ftmul@f2+2),w
	clrz
	skipnc
	incf	(___ftmul@f2+2),w
	skipnz
	goto	u3052
	addwf	(___ftmul@f3_as_product+2),f
u3052:

	
l1844:	
	line	73
	
l3630:	
	movlw	01h
u3065:
	clrc
	rrf	(___ftmul@f1+2),f
	rrf	(___ftmul@f1+1),f
	rrf	(___ftmul@f1),f
	addlw	-1
	skipz
	goto	u3065

	line	74
	
l3632:	
	movlw	01h
u3075:
	clrc
	rlf	(___ftmul@f2),f
	rlf	(___ftmul@f2+1),f
	rlf	(___ftmul@f2+2),f
	addlw	-1
	skipz
	goto	u3075
	line	75
	
l3634:	
	movlw	low(01h)
	subwf	(___ftmul@cntr),f
	btfss	status,2
	goto	u3081
	goto	u3080
u3081:
	goto	l1843
u3080:
	
l1845:	
	line	76
	
l3636:	
	movlw	(09h)
	movwf	(??___ftmul+0)+0
	movf	(??___ftmul+0)+0,w
	movwf	(___ftmul@cntr)
	line	77
	
l1846:	
	line	78
	
l3638:	
	btfss	(___ftmul@f1),(0)&7
	goto	u3091
	goto	u3090
u3091:
	goto	l1847
u3090:
	line	79
	
l3640:	
	movf	(___ftmul@f2),w
	addwf	(___ftmul@f3_as_product),f
	movf	(___ftmul@f2+1),w
	clrz
	skipnc
	incf	(___ftmul@f2+1),w
	skipnz
	goto	u3101
	addwf	(___ftmul@f3_as_product+1),f
u3101:
	movf	(___ftmul@f2+2),w
	clrz
	skipnc
	incf	(___ftmul@f2+2),w
	skipnz
	goto	u3102
	addwf	(___ftmul@f3_as_product+2),f
u3102:

	
l1847:	
	line	80
	
l3642:	
	movlw	01h
u3115:
	clrc
	rrf	(___ftmul@f1+2),f
	rrf	(___ftmul@f1+1),f
	rrf	(___ftmul@f1),f
	addlw	-1
	skipz
	goto	u3115

	line	81
	
l3644:	
	movlw	01h
u3125:
	clrc
	rrf	(___ftmul@f3_as_product+2),f
	rrf	(___ftmul@f3_as_product+1),f
	rrf	(___ftmul@f3_as_product),f
	addlw	-1
	skipz
	goto	u3125

	line	82
	
l3646:	
	movlw	low(01h)
	subwf	(___ftmul@cntr),f
	btfss	status,2
	goto	u3131
	goto	u3130
u3131:
	goto	l1846
u3130:
	
l1848:	
	line	83
	
l3648:	
	movf	(___ftmul@f3_as_product),w
	movwf	(?___ftpack)
	movf	(___ftmul@f3_as_product+1),w
	movwf	(?___ftpack+1)
	movf	(___ftmul@f3_as_product+2),w
	movwf	(?___ftpack+2)
	movf	(___ftmul@exp),w
	movwf	(??___ftmul+0)+0
	movf	(??___ftmul+0)+0,w
	movwf	0+(?___ftpack)+03h
	movf	(___ftmul@sign),w
	movwf	(??___ftmul+1)+0
	movf	(??___ftmul+1)+0,w
	movwf	0+(?___ftpack)+04h
	fcall	___ftpack
	movf	(0+(?___ftpack)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___ftmul)
	movf	(1+(?___ftpack)),w
	movwf	(?___ftmul+1)
	movf	(2+(?___ftpack)),w
	movwf	(?___ftmul+2)
	
l3650:	
	line	84
	
l1841:	
	return
	opt stack 0
GLOBAL	__end_of___ftmul
	__end_of___ftmul:
;; =============== function ___ftmul ends ============

	signat	___ftmul,8315
	global	___ftdiv
psect	text365,local,class=CODE,delta=2
global __ptext365
__ptext365:

;; *************** function ___ftdiv *****************
;; Defined at:
;;		line 50 in file "C:\Program Files\HI-TECH Software\PICC\9.71a\sources\ftdiv.c"
;; Parameters:    Size  Location     Type
;;  f2              3   13[BANK0 ] float 
;;  f1              3   16[BANK0 ] float 
;; Auto vars:     Size  Location     Type
;;  f3              3   24[BANK0 ] float 
;;  sign            1   28[BANK0 ] unsigned char 
;;  exp             1   27[BANK0 ] unsigned char 
;;  cntr            1   23[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  3   13[BANK0 ] float 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       6       0       0       0
;;      Locals:         0       6       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         0      16       0       0       0
;;Total ram usage:       16 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___ftpack
;; This function is called by:
;;		_temp_value
;; This function uses a non-reentrant model
;;
psect	text365
	file	"C:\Program Files\HI-TECH Software\PICC\9.71a\sources\ftdiv.c"
	line	50
	global	__size_of___ftdiv
	__size_of___ftdiv	equ	__end_of___ftdiv-___ftdiv
	
___ftdiv:	
	opt	stack 6
; Regs used in ___ftdiv: [wreg+status,2+status,0+pclath+cstack]
	line	55
	
l3560:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(___ftdiv@f1),w
	movwf	((??___ftdiv+0)+0)
	movf	(___ftdiv@f1+1),w
	movwf	((??___ftdiv+0)+0+1)
	movf	(___ftdiv@f1+2),w
	movwf	((??___ftdiv+0)+0+2)
	clrc
	rlf	(??___ftdiv+0)+1,w
	rlf	(??___ftdiv+0)+2,w
	movwf	(??___ftdiv+3)+0
	movf	(??___ftdiv+3)+0,w
	movwf	(___ftdiv@exp)
	movf	((___ftdiv@exp)),f
	skipz
	goto	u2921
	goto	u2920
u2921:
	goto	l1830
u2920:
	line	56
	
l3562:	
	movlw	0x0
	movwf	(?___ftdiv)
	movlw	0x0
	movwf	(?___ftdiv+1)
	movlw	0x0
	movwf	(?___ftdiv+2)
	
l3564:	
	goto	l1831
	
l1830:	
	line	57
	
l3566:	
	movf	(___ftdiv@f2),w
	movwf	((??___ftdiv+0)+0)
	movf	(___ftdiv@f2+1),w
	movwf	((??___ftdiv+0)+0+1)
	movf	(___ftdiv@f2+2),w
	movwf	((??___ftdiv+0)+0+2)
	clrc
	rlf	(??___ftdiv+0)+1,w
	rlf	(??___ftdiv+0)+2,w
	movwf	(??___ftdiv+3)+0
	movf	(??___ftdiv+3)+0,w
	movwf	(___ftdiv@sign)
	movf	((___ftdiv@sign)),f
	skipz
	goto	u2931
	goto	u2930
u2931:
	goto	l1832
u2930:
	line	58
	
l3568:	
	movlw	0x0
	movwf	(?___ftdiv)
	movlw	0x0
	movwf	(?___ftdiv+1)
	movlw	0x0
	movwf	(?___ftdiv+2)
	
l3570:	
	goto	l1831
	
l1832:	
	line	59
	
l3572:	
	movlw	0
	movwf	(___ftdiv@f3)
	movlw	0
	movwf	(___ftdiv@f3+1)
	movlw	0
	movwf	(___ftdiv@f3+2)
	line	60
	
l3574:	
	movlw	(089h)
	addwf	(___ftdiv@sign),w
	movwf	(??___ftdiv+0)+0
	movf	0+(??___ftdiv+0)+0,w
	subwf	(___ftdiv@exp),f
	line	61
	
l3576:	
	movf	(___ftdiv@f1),w
	movwf	((??___ftdiv+0)+0)
	movf	(___ftdiv@f1+1),w
	movwf	((??___ftdiv+0)+0+1)
	movf	(___ftdiv@f1+2),w
	movwf	((??___ftdiv+0)+0+2)
	movlw	010h
u2945:
	clrc
	rrf	(??___ftdiv+0)+2,f
	rrf	(??___ftdiv+0)+1,f
	rrf	(??___ftdiv+0)+0,f
u2940:
	addlw	-1
	skipz
	goto	u2945
	movf	0+(??___ftdiv+0)+0,w
	movwf	(??___ftdiv+3)+0
	movf	(??___ftdiv+3)+0,w
	movwf	(___ftdiv@sign)
	line	62
	
l3578:	
	movf	(___ftdiv@f2),w
	movwf	((??___ftdiv+0)+0)
	movf	(___ftdiv@f2+1),w
	movwf	((??___ftdiv+0)+0+1)
	movf	(___ftdiv@f2+2),w
	movwf	((??___ftdiv+0)+0+2)
	movlw	010h
u2955:
	clrc
	rrf	(??___ftdiv+0)+2,f
	rrf	(??___ftdiv+0)+1,f
	rrf	(??___ftdiv+0)+0,f
u2950:
	addlw	-1
	skipz
	goto	u2955
	movf	0+(??___ftdiv+0)+0,w
	movwf	(??___ftdiv+3)+0
	movf	(??___ftdiv+3)+0,w
	xorwf	(___ftdiv@sign),f
	line	63
	
l3580:	
	movlw	(080h)
	movwf	(??___ftdiv+0)+0
	movf	(??___ftdiv+0)+0,w
	andwf	(___ftdiv@sign),f
	line	64
	
l3582:	
	bsf	(___ftdiv@f1)+(15/8),(15)&7
	line	65
	movlw	0FFh
	andwf	(___ftdiv@f1),f
	movlw	0FFh
	andwf	(___ftdiv@f1+1),f
	movlw	0
	andwf	(___ftdiv@f1+2),f
	line	66
	
l3584:	
	bsf	(___ftdiv@f2)+(15/8),(15)&7
	line	67
	movlw	0FFh
	andwf	(___ftdiv@f2),f
	movlw	0FFh
	andwf	(___ftdiv@f2+1),f
	movlw	0
	andwf	(___ftdiv@f2+2),f
	line	68
	movlw	(018h)
	movwf	(??___ftdiv+0)+0
	movf	(??___ftdiv+0)+0,w
	movwf	(___ftdiv@cntr)
	line	69
	
l1833:	
	line	70
	
l3586:	
	movlw	01h
u2965:
	clrc
	rlf	(___ftdiv@f3),f
	rlf	(___ftdiv@f3+1),f
	rlf	(___ftdiv@f3+2),f
	addlw	-1
	skipz
	goto	u2965
	line	71
	
l3588:	
	movf	(___ftdiv@f2+2),w
	subwf	(___ftdiv@f1+2),w
	skipz
	goto	u2975
	movf	(___ftdiv@f2+1),w
	subwf	(___ftdiv@f1+1),w
	skipz
	goto	u2975
	movf	(___ftdiv@f2),w
	subwf	(___ftdiv@f1),w
u2975:
	skipc
	goto	u2971
	goto	u2970
u2971:
	goto	l1834
u2970:
	line	72
	
l3590:	
	movf	(___ftdiv@f2),w
	subwf	(___ftdiv@f1),f
	movf	(___ftdiv@f2+1),w
	skipc
	incfsz	(___ftdiv@f2+1),w
	subwf	(___ftdiv@f1+1),f
	movf	(___ftdiv@f2+2),w
	skipc
	incf	(___ftdiv@f2+2),w
	subwf	(___ftdiv@f1+2),f
	line	73
	
l3592:	
	bsf	(___ftdiv@f3)+(0/8),(0)&7
	line	74
	
l1834:	
	line	75
	
l3594:	
	movlw	01h
u2985:
	clrc
	rlf	(___ftdiv@f1),f
	rlf	(___ftdiv@f1+1),f
	rlf	(___ftdiv@f1+2),f
	addlw	-1
	skipz
	goto	u2985
	line	76
	
l3596:	
	movlw	low(01h)
	subwf	(___ftdiv@cntr),f
	btfss	status,2
	goto	u2991
	goto	u2990
u2991:
	goto	l1833
u2990:
	
l1835:	
	line	77
	
l3598:	
	movf	(___ftdiv@f3),w
	movwf	(?___ftpack)
	movf	(___ftdiv@f3+1),w
	movwf	(?___ftpack+1)
	movf	(___ftdiv@f3+2),w
	movwf	(?___ftpack+2)
	movf	(___ftdiv@exp),w
	movwf	(??___ftdiv+0)+0
	movf	(??___ftdiv+0)+0,w
	movwf	0+(?___ftpack)+03h
	movf	(___ftdiv@sign),w
	movwf	(??___ftdiv+1)+0
	movf	(??___ftdiv+1)+0,w
	movwf	0+(?___ftpack)+04h
	fcall	___ftpack
	movf	(0+(?___ftpack)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___ftdiv)
	movf	(1+(?___ftpack)),w
	movwf	(?___ftdiv+1)
	movf	(2+(?___ftpack)),w
	movwf	(?___ftdiv+2)
	
l3600:	
	line	78
	
l1831:	
	return
	opt stack 0
GLOBAL	__end_of___ftdiv
	__end_of___ftdiv:
;; =============== function ___ftdiv ends ============

	signat	___ftdiv,8315
	global	_lcd_char
psect	text366,local,class=CODE,delta=2
global __ptext366
__ptext366:

;; *************** function _lcd_char *****************
;; Defined at:
;;		line 23 in file "C:\Users\user.user-PC\Desktop\PIC-MCU\Baremetal_Code\core\drv\lcd\src\lcd_driver.c"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1    1[COMMON] unsigned char 
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
;;      Temps:          1       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_display
;;		_display1
;;		_lcd_string
;; This function uses a non-reentrant model
;;
psect	text366
	file	"C:\Users\user.user-PC\Desktop\PIC-MCU\Baremetal_Code\core\drv\lcd\src\lcd_driver.c"
	line	23
	global	__size_of_lcd_char
	__size_of_lcd_char	equ	__end_of_lcd_char-_lcd_char
	
_lcd_char:	
	opt	stack 6
; Regs used in _lcd_char: [wreg]
;lcd_char@data stored from wreg
	line	25
	movwf	(lcd_char@data)
	
l3552:	
;lcd_driver.c: 25: RE0=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(72/8),(72)&7
	line	26
;lcd_driver.c: 26: RE1=0;
	bcf	(73/8),(73)&7
	line	27
	
l3554:	
;lcd_driver.c: 27: PORTB=data;
	movf	(lcd_char@data),w
	movwf	(6)	;volatile
	line	28
	
l3556:	
;lcd_driver.c: 28: RE2=1;
	bsf	(74/8),(74)&7
	line	29
;lcd_driver.c: 29: _delay((unsigned long)((1)*(4000000/4000.0)));
	opt asmopt_off
movlw	249
movwf	(??_lcd_char+0)+0,f
u3167:
	clrwdt
decfsz	(??_lcd_char+0)+0,f
	goto	u3167
	nop2	;nop
	clrwdt
opt asmopt_on

	line	30
	
l3558:	
;lcd_driver.c: 30: RE2=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(74/8),(74)&7
	line	32
	
l1724:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_char
	__end_of_lcd_char:
;; =============== function _lcd_char ends ============

	signat	_lcd_char,4216
	global	_lcd_cmd
psect	text367,local,class=CODE,delta=2
global __ptext367
__ptext367:

;; *************** function _lcd_cmd *****************
;; Defined at:
;;		line 13 in file "C:\Users\user.user-PC\Desktop\PIC-MCU\Baremetal_Code\core\drv\lcd\src\lcd_driver.c"
;; Parameters:    Size  Location     Type
;;  cmd             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  cmd             1    1[COMMON] unsigned char 
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
;;      Temps:          1       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;;		_display
;;		_display1
;;		_lcd_init
;; This function uses a non-reentrant model
;;
psect	text367
	file	"C:\Users\user.user-PC\Desktop\PIC-MCU\Baremetal_Code\core\drv\lcd\src\lcd_driver.c"
	line	13
	global	__size_of_lcd_cmd
	__size_of_lcd_cmd	equ	__end_of_lcd_cmd-_lcd_cmd
	
_lcd_cmd:	
	opt	stack 6
; Regs used in _lcd_cmd: [wreg]
;lcd_cmd@cmd stored from wreg
	movwf	(lcd_cmd@cmd)
	line	14
	
l3544:	
;lcd_driver.c: 14: RE0=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(72/8),(72)&7
	line	15
;lcd_driver.c: 15: RE1=0;
	bcf	(73/8),(73)&7
	line	16
	
l3546:	
;lcd_driver.c: 16: PORTB=cmd;
	movf	(lcd_cmd@cmd),w
	movwf	(6)	;volatile
	line	17
	
l3548:	
;lcd_driver.c: 17: RE2=1;
	bsf	(74/8),(74)&7
	line	18
;lcd_driver.c: 18: _delay((unsigned long)((1)*(4000000/4000.0)));
	opt asmopt_off
movlw	249
movwf	(??_lcd_cmd+0)+0,f
u3177:
	clrwdt
decfsz	(??_lcd_cmd+0)+0,f
	goto	u3177
	nop2	;nop
	clrwdt
opt asmopt_on

	line	19
	
l3550:	
;lcd_driver.c: 19: RE2=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(74/8),(74)&7
	line	20
	
l1721:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_cmd
	__end_of_lcd_cmd:
;; =============== function _lcd_cmd ends ============

	signat	_lcd_cmd,4216
	global	_adc_value
psect	text368,local,class=CODE,delta=2
global __ptext368
__ptext368:

;; *************** function _adc_value *****************
;; Defined at:
;;		line 26 in file "../../app/inc/..\..\platform\..\core\drv\adc\inc\adc_driver.h"
;; Parameters:    Size  Location     Type
;;  channel         1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  channel         1    9[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    7[COMMON] unsigned short 
;; Registers used:
;;		wreg, status,2, status,0, btemp+0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_adc_init
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text368
	file	"../../app/inc/..\..\platform\..\core\drv\adc\inc\adc_driver.h"
	line	26
	global	__size_of_adc_value
	__size_of_adc_value	equ	__end_of_adc_value-_adc_value
	
_adc_value:	
	opt	stack 7
; Regs used in _adc_value: [wreg+status,2-btemp+0+pclath+cstack]
;adc_value@channel stored from wreg
	movwf	(adc_value@channel)
	line	27
	
l3540:	
;..\..\platform\..\core\drv\adc\inc\adc_driver.h: 27: return (adc_init(channel));
	movf	(adc_value@channel),w
	fcall	_adc_init
	movf	(1+(?_adc_init)),w
	clrf	(?_adc_value+1)
	addwf	(?_adc_value+1)
	movf	(0+(?_adc_init)),w
	clrf	(?_adc_value)
	addwf	(?_adc_value)

	
l3542:	
	line	28
	
l566:	
	return
	opt stack 0
GLOBAL	__end_of_adc_value
	__end_of_adc_value:
;; =============== function _adc_value ends ============

	signat	_adc_value,4218
	global	___fttol
psect	text369,local,class=CODE,delta=2
global __ptext369
__ptext369:

;; *************** function ___fttol *****************
;; Defined at:
;;		line 45 in file "C:\Program Files\HI-TECH Software\PICC\9.71a\sources\fttol.c"
;; Parameters:    Size  Location     Type
;;  f1              3    8[COMMON] float 
;; Auto vars:     Size  Location     Type
;;  lval            4    5[BANK0 ] unsigned long 
;;  exp1            1    9[BANK0 ] unsigned char 
;;  sign1           1    4[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  4    8[COMMON] long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         0       6       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         4      10       0       0       0
;;Total ram usage:       14 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_temp_value
;; This function uses a non-reentrant model
;;
psect	text369
	file	"C:\Program Files\HI-TECH Software\PICC\9.71a\sources\fttol.c"
	line	45
	global	__size_of___fttol
	__size_of___fttol	equ	__end_of___fttol-___fttol
	
___fttol:	
	opt	stack 6
; Regs used in ___fttol: [wreg+status,2+status,0]
	line	49
	
l3428:	
	movf	(___fttol@f1),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	((??___fttol+0)+0)
	movf	(___fttol@f1+1),w
	movwf	((??___fttol+0)+0+1)
	movf	(___fttol@f1+2),w
	movwf	((??___fttol+0)+0+2)
	clrc
	rlf	(??___fttol+0)+1,w
	rlf	(??___fttol+0)+2,w
	movwf	(??___fttol+3)+0
	movf	(??___fttol+3)+0,w
	movwf	(___fttol@exp1)
	movf	((___fttol@exp1)),f
	skipz
	goto	u2741
	goto	u2740
u2741:
	goto	l1851
u2740:
	line	50
	
l3430:	
	movlw	0
	movwf	(?___fttol+3)
	movlw	0
	movwf	(?___fttol+2)
	movlw	0
	movwf	(?___fttol+1)
	movlw	0
	movwf	(?___fttol)

	
l3432:	
	goto	l1852
	
l1851:	
	line	51
	
l3434:	
	movf	(___fttol@f1),w
	movwf	((??___fttol+0)+0)
	movf	(___fttol@f1+1),w
	movwf	((??___fttol+0)+0+1)
	movf	(___fttol@f1+2),w
	movwf	((??___fttol+0)+0+2)
	movlw	017h
u2755:
	clrc
	rrf	(??___fttol+0)+2,f
	rrf	(??___fttol+0)+1,f
	rrf	(??___fttol+0)+0,f
u2750:
	addlw	-1
	skipz
	goto	u2755
	movf	0+(??___fttol+0)+0,w
	movwf	(??___fttol+3)+0
	movf	(??___fttol+3)+0,w
	movwf	(___fttol@sign1)
	line	52
	
l3436:	
	bsf	(___fttol@f1)+(15/8),(15)&7
	line	53
	
l3438:	
	movlw	0FFh
	andwf	(___fttol@f1),f
	movlw	0FFh
	andwf	(___fttol@f1+1),f
	movlw	0
	andwf	(___fttol@f1+2),f
	line	54
	
l3440:	
	movf	(___fttol@f1),w
	movwf	(___fttol@lval)
	movf	(___fttol@f1+1),w
	movwf	((___fttol@lval))+1
	movf	(___fttol@f1+2),w
	movwf	((___fttol@lval))+2
	clrf	((___fttol@lval))+3
	line	55
	
l3442:	
	movlw	low(08Eh)
	subwf	(___fttol@exp1),f
	line	56
	
l3444:	
	btfss	(___fttol@exp1),7
	goto	u2761
	goto	u2760
u2761:
	goto	l1853
u2760:
	line	57
	
l3446:	
	movf	(___fttol@exp1),w
	xorlw	80h
	addlw	-((-15)^80h)
	skipnc
	goto	u2771
	goto	u2770
u2771:
	goto	l1854
u2770:
	line	58
	
l3448:	
	movlw	0
	movwf	(?___fttol+3)
	movlw	0
	movwf	(?___fttol+2)
	movlw	0
	movwf	(?___fttol+1)
	movlw	0
	movwf	(?___fttol)

	
l3450:	
	goto	l1852
	
l1854:	
	line	59
	
l1855:	
	line	60
	
l3452:	
	movlw	01h
u2785:
	clrc
	rrf	(___fttol@lval+3),f
	rrf	(___fttol@lval+2),f
	rrf	(___fttol@lval+1),f
	rrf	(___fttol@lval),f
	addlw	-1
	skipz
	goto	u2785

	line	61
	movlw	(01h)
	movwf	(??___fttol+0)+0
	movf	(??___fttol+0)+0,w
	addwf	(___fttol@exp1),f
	btfss	status,2
	goto	u2791
	goto	u2790
u2791:
	goto	l1855
u2790:
	
l1856:	
	line	62
	goto	l1857
	
l1853:	
	line	63
	
l3454:	
	movlw	(018h)
	subwf	(___fttol@exp1),w
	skipc
	goto	u2801
	goto	u2800
u2801:
	goto	l1858
u2800:
	line	64
	
l3456:	
	movlw	0
	movwf	(?___fttol+3)
	movlw	0
	movwf	(?___fttol+2)
	movlw	0
	movwf	(?___fttol+1)
	movlw	0
	movwf	(?___fttol)

	
l3458:	
	goto	l1852
	
l1858:	
	line	65
	goto	l1859
	
l1860:	
	line	66
	
l3460:	
	movlw	01h
	movwf	(??___fttol+0)+0
u2815:
	clrc
	rlf	(___fttol@lval),f
	rlf	(___fttol@lval+1),f
	rlf	(___fttol@lval+2),f
	rlf	(___fttol@lval+3),f
	decfsz	(??___fttol+0)+0
	goto	u2815
	line	67
	movlw	low(01h)
	subwf	(___fttol@exp1),f
	line	68
	
l1859:	
	line	65
	
l3462:	
	movf	(___fttol@exp1),f
	skipz
	goto	u2821
	goto	u2820
u2821:
	goto	l1860
u2820:
	
l1861:	
	line	69
	
l1857:	
	line	70
	
l3464:	
	movf	(___fttol@sign1),w
	skipz
	goto	u2830
	goto	l1862
u2830:
	line	71
	
l3466:	
	comf	(___fttol@lval),f
	comf	(___fttol@lval+1),f
	comf	(___fttol@lval+2),f
	comf	(___fttol@lval+3),f
	incf	(___fttol@lval),f
	skipnz
	incf	(___fttol@lval+1),f
	skipnz
	incf	(___fttol@lval+2),f
	skipnz
	incf	(___fttol@lval+3),f
	
l1862:	
	line	72
	
l3468:	
	movf	(___fttol@lval+3),w
	movwf	(?___fttol+3)
	movf	(___fttol@lval+2),w
	movwf	(?___fttol+2)
	movf	(___fttol@lval+1),w
	movwf	(?___fttol+1)
	movf	(___fttol@lval),w
	movwf	(?___fttol)

	
l3470:	
	line	73
	
l1852:	
	return
	opt stack 0
GLOBAL	__end_of___fttol
	__end_of___fttol:
;; =============== function ___fttol ends ============

	signat	___fttol,4220
	global	___ftpack
psect	text370,local,class=CODE,delta=2
global __ptext370
__ptext370:

;; *************** function ___ftpack *****************
;; Defined at:
;;		line 63 in file "C:\Program Files\HI-TECH Software\PICC\9.71a\sources\float.c"
;; Parameters:    Size  Location     Type
;;  arg             3    0[COMMON] unsigned um
;;  exp             1    3[COMMON] unsigned char 
;;  sign            1    4[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  3    0[COMMON] float 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         5       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          3       0       0       0       0
;;      Totals:         8       0       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		___ftdiv
;;		___ftmul
;;		___lwtoft
;;		___ftadd
;;		___lbtoft
;;		___abtoft
;;		___awtoft
;;		___altoft
;;		___lltoft
;;		___attoft
;;		___lttoft
;; This function uses a non-reentrant model
;;
psect	text370
	file	"C:\Program Files\HI-TECH Software\PICC\9.71a\sources\float.c"
	line	63
	global	__size_of___ftpack
	__size_of___ftpack	equ	__end_of___ftpack-___ftpack
	
___ftpack:	
	opt	stack 5
; Regs used in ___ftpack: [wreg+status,2+status,0]
	line	64
	
l3392:	
	movf	(___ftpack@exp),w
	skipz
	goto	u2630
	goto	l2076
u2630:
	
l3394:	
	movf	(___ftpack@arg+2),w
	iorwf	(___ftpack@arg+1),w
	iorwf	(___ftpack@arg),w
	skipz
	goto	u2641
	goto	u2640
u2641:
	goto	l2074
u2640:
	
l2076:	
	line	65
	
l3396:	
	movlw	0x0
	movwf	(?___ftpack)
	movlw	0x0
	movwf	(?___ftpack+1)
	movlw	0x0
	movwf	(?___ftpack+2)
	
l3398:	
	goto	l2077
	
l2074:	
	line	66
	goto	l2078
	
l2079:	
	line	67
	
l3400:	
	movlw	(01h)
	movwf	(??___ftpack+0)+0
	movf	(??___ftpack+0)+0,w
	addwf	(___ftpack@exp),f
	line	68
	movlw	01h
u2655:
	clrc
	rrf	(___ftpack@arg+2),f
	rrf	(___ftpack@arg+1),f
	rrf	(___ftpack@arg),f
	addlw	-1
	skipz
	goto	u2655

	line	69
	
l2078:	
	line	66
	
l3402:	
	movlw	low highword(0FE0000h)
	andwf	(___ftpack@arg+2),w
	btfss	status,2
	goto	u2661
	goto	u2660
u2661:
	goto	l2079
u2660:
	
l2080:	
	line	70
	goto	l2081
	
l2082:	
	line	71
	
l3404:	
	movlw	(01h)
	movwf	(??___ftpack+0)+0
	movf	(??___ftpack+0)+0,w
	addwf	(___ftpack@exp),f
	line	72
	
l3406:	
	movlw	01h
	addwf	(___ftpack@arg),f
	movlw	0
	skipnc
movlw 1
	addwf	(___ftpack@arg+1),f
	movlw	0
	skipnc
movlw 1
	addwf	(___ftpack@arg+2),f
	line	73
	
l3408:	
	movlw	01h
u2675:
	clrc
	rrf	(___ftpack@arg+2),f
	rrf	(___ftpack@arg+1),f
	rrf	(___ftpack@arg),f
	addlw	-1
	skipz
	goto	u2675

	line	74
	
l2081:	
	line	70
	movlw	low highword(0FF0000h)
	andwf	(___ftpack@arg+2),w
	btfss	status,2
	goto	u2681
	goto	u2680
u2681:
	goto	l2082
u2680:
	
l2083:	
	line	75
	goto	l2084
	
l2085:	
	line	76
	
l3410:	
	movlw	low(01h)
	subwf	(___ftpack@exp),f
	line	77
	movlw	01h
u2695:
	clrc
	rlf	(___ftpack@arg),f
	rlf	(___ftpack@arg+1),f
	rlf	(___ftpack@arg+2),f
	addlw	-1
	skipz
	goto	u2695
	line	78
	
l2084:	
	line	75
	
l3412:	
	btfss	(___ftpack@arg+1),(15)&7
	goto	u2701
	goto	u2700
u2701:
	goto	l2085
u2700:
	
l2086:	
	line	79
	btfsc	(___ftpack@exp),(0)&7
	goto	u2711
	goto	u2710
u2711:
	goto	l2087
u2710:
	line	80
	
l3414:	
	movlw	0FFh
	andwf	(___ftpack@arg),f
	movlw	07Fh
	andwf	(___ftpack@arg+1),f
	movlw	0FFh
	andwf	(___ftpack@arg+2),f
	
l2087:	
	line	81
	clrc
	rrf	(___ftpack@exp),f

	line	82
	
l3416:	
	movf	(___ftpack@exp),w
	movwf	((??___ftpack+0)+0)
	clrf	((??___ftpack+0)+0+1)
	clrf	((??___ftpack+0)+0+2)
	movlw	010h
u2725:
	clrc
	rlf	(??___ftpack+0)+0,f
	rlf	(??___ftpack+0)+1,f
	rlf	(??___ftpack+0)+2,f
u2720:
	addlw	-1
	skipz
	goto	u2725
	movf	0+(??___ftpack+0)+0,w
	iorwf	(___ftpack@arg),f
	movf	1+(??___ftpack+0)+0,w
	iorwf	(___ftpack@arg+1),f
	movf	2+(??___ftpack+0)+0,w
	iorwf	(___ftpack@arg+2),f
	line	83
	
l3418:	
	movf	(___ftpack@sign),w
	skipz
	goto	u2730
	goto	l2088
u2730:
	line	84
	
l3420:	
	bsf	(___ftpack@arg)+(23/8),(23)&7
	
l2088:	
	line	85
	line	86
	
l2077:	
	return
	opt stack 0
GLOBAL	__end_of___ftpack
	__end_of___ftpack:
;; =============== function ___ftpack ends ============

	signat	___ftpack,12411
	global	___lwmod
psect	text371,local,class=CODE,delta=2
global __ptext371
__ptext371:

;; *************** function ___lwmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files\HI-TECH Software\PICC\9.71a\sources\lwmod.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[COMMON] unsigned int 
;;  dividend        2    2[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  counter         1    5[COMMON] unsigned char 
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
;;      Locals:         1       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         6       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_display
;;		_display1
;; This function uses a non-reentrant model
;;
psect	text371
	file	"C:\Program Files\HI-TECH Software\PICC\9.71a\sources\lwmod.c"
	line	5
	global	__size_of___lwmod
	__size_of___lwmod	equ	__end_of___lwmod-___lwmod
	
___lwmod:	
	opt	stack 6
; Regs used in ___lwmod: [wreg+status,2+status,0]
	line	8
	
l3298:	
	movf	(___lwmod@divisor+1),w
	iorwf	(___lwmod@divisor),w
	skipnz
	goto	u2331
	goto	u2330
u2331:
	goto	l1758
u2330:
	line	9
	
l3300:	
	clrf	(___lwmod@counter)
	bsf	status,0
	rlf	(___lwmod@counter),f
	line	10
	goto	l1759
	
l1760:	
	line	11
	
l3302:	
	movlw	01h
	
u2345:
	clrc
	rlf	(___lwmod@divisor),f
	rlf	(___lwmod@divisor+1),f
	addlw	-1
	skipz
	goto	u2345
	line	12
	
l3304:	
	movlw	(01h)
	movwf	(??___lwmod+0)+0
	movf	(??___lwmod+0)+0,w
	addwf	(___lwmod@counter),f
	line	13
	
l1759:	
	line	10
	
l3306:	
	btfss	(___lwmod@divisor+1),(15)&7
	goto	u2351
	goto	u2350
u2351:
	goto	l1760
u2350:
	
l1761:	
	line	14
	
l1762:	
	line	15
	
l3308:	
	movf	(___lwmod@divisor+1),w
	subwf	(___lwmod@dividend+1),w
	skipz
	goto	u2365
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),w
u2365:
	skipc
	goto	u2361
	goto	u2360
u2361:
	goto	l1763
u2360:
	line	16
	
l3310:	
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),f
	movf	(___lwmod@divisor+1),w
	skipc
	decf	(___lwmod@dividend+1),f
	subwf	(___lwmod@dividend+1),f
	
l1763:	
	line	17
	
l3312:	
	movlw	01h
	
u2375:
	clrc
	rrf	(___lwmod@divisor+1),f
	rrf	(___lwmod@divisor),f
	addlw	-1
	skipz
	goto	u2375
	line	18
	
l3314:	
	movlw	low(01h)
	subwf	(___lwmod@counter),f
	btfss	status,2
	goto	u2381
	goto	u2380
u2381:
	goto	l1762
u2380:
	
l1764:	
	line	19
	
l1758:	
	line	20
	
l3316:	
	movf	(___lwmod@dividend+1),w
	clrf	(?___lwmod+1)
	addwf	(?___lwmod+1)
	movf	(___lwmod@dividend),w
	clrf	(?___lwmod)
	addwf	(?___lwmod)

	
l3318:	
	line	21
	
l1765:	
	return
	opt stack 0
GLOBAL	__end_of___lwmod
	__end_of___lwmod:
;; =============== function ___lwmod ends ============

	signat	___lwmod,8314
	global	___lwdiv
psect	text372,local,class=CODE,delta=2
global __ptext372
__ptext372:

;; *************** function ___lwdiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files\HI-TECH Software\PICC\9.71a\sources\lwdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    6[COMMON] unsigned int 
;;  dividend        2    8[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  quotient        2   11[COMMON] unsigned int 
;;  counter         1   13[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    6[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         3       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         8       0       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_display
;;		_display1
;; This function uses a non-reentrant model
;;
psect	text372
	file	"C:\Program Files\HI-TECH Software\PICC\9.71a\sources\lwdiv.c"
	line	5
	global	__size_of___lwdiv
	__size_of___lwdiv	equ	__end_of___lwdiv-___lwdiv
	
___lwdiv:	
	opt	stack 6
; Regs used in ___lwdiv: [wreg+status,2+status,0]
	line	9
	
l3274:	
	movlw	low(0)
	movwf	(___lwdiv@quotient)
	movlw	high(0)
	movwf	((___lwdiv@quotient))+1
	line	10
	movf	(___lwdiv@divisor+1),w
	iorwf	(___lwdiv@divisor),w
	skipnz
	goto	u2261
	goto	u2260
u2261:
	goto	l1748
u2260:
	line	11
	
l3276:	
	clrf	(___lwdiv@counter)
	bsf	status,0
	rlf	(___lwdiv@counter),f
	line	12
	goto	l1749
	
l1750:	
	line	13
	
l3278:	
	movlw	01h
	
u2275:
	clrc
	rlf	(___lwdiv@divisor),f
	rlf	(___lwdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u2275
	line	14
	
l3280:	
	movlw	(01h)
	movwf	(??___lwdiv+0)+0
	movf	(??___lwdiv+0)+0,w
	addwf	(___lwdiv@counter),f
	line	15
	
l1749:	
	line	12
	
l3282:	
	btfss	(___lwdiv@divisor+1),(15)&7
	goto	u2281
	goto	u2280
u2281:
	goto	l1750
u2280:
	
l1751:	
	line	16
	
l1752:	
	line	17
	
l3284:	
	movlw	01h
	
u2295:
	clrc
	rlf	(___lwdiv@quotient),f
	rlf	(___lwdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u2295
	line	18
	movf	(___lwdiv@divisor+1),w
	subwf	(___lwdiv@dividend+1),w
	skipz
	goto	u2305
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),w
u2305:
	skipc
	goto	u2301
	goto	u2300
u2301:
	goto	l1753
u2300:
	line	19
	
l3286:	
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),f
	movf	(___lwdiv@divisor+1),w
	skipc
	decf	(___lwdiv@dividend+1),f
	subwf	(___lwdiv@dividend+1),f
	line	20
	
l3288:	
	bsf	(___lwdiv@quotient)+(0/8),(0)&7
	line	21
	
l1753:	
	line	22
	
l3290:	
	movlw	01h
	
u2315:
	clrc
	rrf	(___lwdiv@divisor+1),f
	rrf	(___lwdiv@divisor),f
	addlw	-1
	skipz
	goto	u2315
	line	23
	
l3292:	
	movlw	low(01h)
	subwf	(___lwdiv@counter),f
	btfss	status,2
	goto	u2321
	goto	u2320
u2321:
	goto	l1752
u2320:
	
l1754:	
	line	24
	
l1748:	
	line	25
	
l3294:	
	movf	(___lwdiv@quotient+1),w
	clrf	(?___lwdiv+1)
	addwf	(?___lwdiv+1)
	movf	(___lwdiv@quotient),w
	clrf	(?___lwdiv)
	addwf	(?___lwdiv)

	
l3296:	
	line	26
	
l1755:	
	return
	opt stack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
;; =============== function ___lwdiv ends ============

	signat	___lwdiv,8314
	global	_adc_init
psect	text373,local,class=CODE,delta=2
global __ptext373
__ptext373:

;; *************** function _adc_init *****************
;; Defined at:
;;		line 9 in file "../../app/inc/..\..\platform\..\core\drv\adc\inc\adc_driver.h"
;; Parameters:    Size  Location     Type
;;  channel         1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  channel         1    6[COMMON] unsigned char 
;;  value           2    4[COMMON] unsigned short 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] unsigned short 
;; Registers used:
;;		wreg, status,2, status,0, btemp+0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         3       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         7       0       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_adc_value
;;		_temp_value
;; This function uses a non-reentrant model
;;
psect	text373
	file	"../../app/inc/..\..\platform\..\core\drv\adc\inc\adc_driver.h"
	line	9
	global	__size_of_adc_init
	__size_of_adc_init	equ	__end_of_adc_init-_adc_init
	
_adc_init:	
	opt	stack 6
; Regs used in _adc_init: [wreg+status,2-btemp+0]
;adc_init@channel stored from wreg
	movwf	(adc_init@channel)
	line	10
	
l3260:	
;..\..\platform\..\core\drv\adc\inc\adc_driver.h: 10: unsigned short int value=0;
	movlw	low(0)
	movwf	(adc_init@value)
	movlw	high(0)
	movwf	((adc_init@value))+1
	line	13
;..\..\platform\..\core\drv\adc\inc\adc_driver.h: 13: if(channel<8)
	movlw	(08h)
	subwf	(adc_init@channel),w
	skipnc
	goto	u2221
	goto	u2220
u2221:
	goto	l559
u2220:
	line	15
	
l3262:	
;..\..\platform\..\core\drv\adc\inc\adc_driver.h: 14: {
;..\..\platform\..\core\drv\adc\inc\adc_driver.h: 15: ADCON1=0X82;
	movlw	(082h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(159)^080h	;volatile
	line	16
	
l3264:	
;..\..\platform\..\core\drv\adc\inc\adc_driver.h: 16: ADCON0 =0b11000001|channel<<3;
	movf	(adc_init@channel),w
	movwf	(??_adc_init+0)+0
	movlw	(03h)-1
u2235:
	clrc
	rlf	(??_adc_init+0)+0,f
	addlw	-1
	skipz
	goto	u2235
	clrc
	rlf	(??_adc_init+0)+0,w
	iorlw	0C1h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(31)	;volatile
	line	17
	
l3266:	
;..\..\platform\..\core\drv\adc\inc\adc_driver.h: 17: ADCON0|=1<<2;
	bsf	(31)+(2/8),(2)&7	;volatile
	line	18
;..\..\platform\..\core\drv\adc\inc\adc_driver.h: 18: while((ADCON0&1<<2));
	goto	l560
	
l561:	
	
l560:	
	btfsc	(31),(2)&7
	goto	u2241
	goto	u2240
u2241:
	goto	l561
u2240:
	
l562:	
	line	19
	
l3268:	
;..\..\platform\..\core\drv\adc\inc\adc_driver.h: 19: value=(ADRESL)|(ADRESH<<8);
	movf	(30),w	;volatile
	movwf	(??_adc_init+0)+0
	clrf	(??_adc_init+0)+0+1
	movlw	08h
	movwf	btemp+0
u2255:
	clrc
	rlf	(??_adc_init+0)+0,f
	rlf	(??_adc_init+0)+1,f
	decfsz	btemp+0,f
	goto	u2255
	movf	0+(??_adc_init+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	iorwf	(158)^080h,w	;volatile
	movwf	(adc_init@value)
	movf	1+(??_adc_init+0)+0,w
	movwf	1+(adc_init@value)
	line	20
	
l559:	
	line	21
	
l3270:	
;..\..\platform\..\core\drv\adc\inc\adc_driver.h: 20: }
;..\..\platform\..\core\drv\adc\inc\adc_driver.h: 21: return value;
	movf	(adc_init@value+1),w
	clrf	(?_adc_init+1)
	addwf	(?_adc_init+1)
	movf	(adc_init@value),w
	clrf	(?_adc_init)
	addwf	(?_adc_init)

	
l3272:	
	line	23
	
l563:	
	return
	opt stack 0
GLOBAL	__end_of_adc_init
	__end_of_adc_init:
;; =============== function _adc_init ends ============

	signat	_adc_init,4218
psect	text374,local,class=CODE,delta=2
global __ptext374
__ptext374:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
