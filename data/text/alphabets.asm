; SPEx: Table of alphabets.
; See engine/menus/naming_screen.asm
Alphabets:
dw .lowerCase
dw .upperCase
IF DEF(_DEBUG)
	dw .debugCase1
	dw .debugCase2
ENDC
.end::

.lowerCase:
	db "abcdefghi"
	db "jklmnopqr"
	db "stuvwxyz "
	db "×():;[]<PK><MN>"
	db "-?!♂♀/<DOT>,<ED>"
	db "UPPER CASE@"

.upperCase:
	db "ABCDEFGHI"
	db "JKLMNOPQR"
	db "STUVWXYZ "
	db "×():;[]<PK><MN>"
	db "-?!♂♀/<DOT>,<ED>"
	db "lower case@"

IF DEF(_DEBUG)
	.debugCase1:
		db $01, $02, $03, $04, $05, $06, $07, $08, $09
		db $0A, $0B, $0C, $0D, $0E, $0F, $10, $11, $12
		db $13, $14, $15, $16, $17, $18, $19, $1A, $1B
		db $1C, $1D, $1E, $1F, $20, $21, $22, $23, $24
		db $25, $26, $27, $28, $29, $2A, $2B, $2C, "<ED>"
		db "dbg1@"
	.debugCase2:
		db $2D, $2E, $2F, $30, $31, $32, $33, $34, $35
		db $36, $37, $38, $39, $3A, $3B, $3C, $3D, $3E
		db $3F, $40, $41, $42, $43, $44, $45, $46, $47
		db $48, "():;[]<PK><MN>"
		db "-?!♂♀/<DOT>,<ED>"
		db "dbg2@"
ENDC

