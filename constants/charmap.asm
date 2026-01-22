; Macro that creates two charmap entries, one with a trailing space, and one without.
; For example, this:
;     sitelen_pona  "akesi",  $81
; is equivalent to this:
;     charmap       "akesi",  $81
;     charmap       "akesi ", $81
MACRO sitelen_pona
    charmap \1, \2
    charmap STRCAT(\1, " "), \2
ENDM

newcharmap base

; $00-$17 are TX_* constants (see macros/scripts/text.asm)

; Control characters (see home/text.asm)

	charmap "<NULL>",    $00
	charmap "<PAGE>",    $49
	charmap "<PKMN>",    $4a ; "<PK><MN>"
	charmap "<_CONT>",   $4b ; implements "<CONT>"
	charmap "<SCROLL>",  $4c
	charmap "<NEXT>",    $4e
	charmap "<LINE>",    $4f
	charmap "@",         $50 ; string terminator
	charmap "<PARA>",    $51
	charmap "<PLAYER>",  $52 ; wPlayerName
	charmap "<RIVAL>",   $53 ; wRivalName
	charmap "#",         $54 ; "POKé"
	charmap "<CONT>",    $55
	charmap "<……>",      $56 ; "……"
	charmap "<DONE>",    $57
	charmap "<PROMPT>",  $58
	charmap "<TARGET>",  $59
	charmap "<USER>",    $5a
	charmap "<PC>",      $5b ; "PC"
	charmap "<TM>",      $5c ; "TM"
	charmap "<TRAINER>", $5d ; "TRAINER"
	charmap "<ROCKET>",  $5e ; "ROCKET"
	charmap "<DEXEND>",  $5f

; Actual characters (from gfx/font/font_extra.png)

	charmap "<BOLD_V>",  $69
	charmap "<BOLD_S>",  $6a
	charmap "<COLON>",   $6d ; colon with tinier dots than ":"
	charmap "‘",         $70 ; opening single quote
	charmap "’",         $71 ; closing single quote
	; SPEX: The place opening quote used to be, $72, is now the 'down arrow'.
	charmap "”",         $73 ; closing quote
	charmap "·",         $74 ; middle dot, unused
	charmap "…",         $75 ; ellipsis
	charmap "“",         $76 ; opening quote

; SPEx: Moved to both 'extra' sheets like the general-purpose window tiles below:
	charmap "▼",         $72

	charmap "┌",         $79
	charmap "─",         $7a
	charmap "┐",         $7b
	charmap "│",         $7c
	charmap "└",         $7d
	charmap "┘",         $7e
	charmap " ",         $7f

; Actual characters (from gfx/font/font_battle_extra.png)

	charmap "<LV>",      $6e

	charmap "<to>",      $70 ; narrow "to"

	charmap "<ID>",      $73
	charmap "№",         $74

; Actual characters (from other graphics files)

	; needed for ShowPokedexDataInternal (see engine/menus/pokedex.asm)
	charmap "′",         $60 ; gfx/pokedex/pokedex.png
	charmap "″",         $61 ; gfx/pokedex/pokedex.png

	; needed for StatusScreen (see engine/pokemon/status_screen.asm)
	charmap "<BOLD_P>",  $72 ; gfx/font/P.1bpp

	; needed for LoadTownMap_Fly (see engine/items/town_map.asm)
	charmap "▲",         $ed ; gfx/town_map/up_arrow.1bpp

	; needed for PrintAlphabet (see engine/menus/naming_screen.asm)
	; SPEx: We need to move this somewhere that meets the following requirements:
	; 1. Doesn't break the naming screen itself,
	;     **even if a localizer turns pokedollars into a typable character** (for our purposes, 'mani')
	; 2. Gets cleaned up afterwards so that the following dialogue survives.
	; So we hide it in what is one of font_battle_extra's 'ramp' tiles.
	charmap "<ED>",      $78 ; gfx/font/ED.1bpp

; Actual characters (from gfx/font/font.png)

	charmap "(",         $45 ; cartouche open
	charmap ")",         $46 ; cartouche close
	charmap ":",         $48 ; SP colon
	charmap ";",         $48 ; SP colon
	charmap "[",         $45 ; cartouche open
	charmap "]",         $46 ; cartouche close

	charmap "'",         $a8 ; lili
	charmap "<PK>",      $09 ; monsuta
	charmap "<MN>",      $d3 ; poki
	charmap "-",         $44 ; hyphen

	charmap "?",         $d8 ; seme
	charmap "!",         $c4 ; o
	charmap ".",         $47 ; SP middot

	charmap ",",         $47 ; SP middot
	charmap "♀",         $b3 ; meli
	charmap "♂",         $b5 ; mije

	sitelen_pona "te"    $42 ; SP open quote
	sitelen_pona "to"    $43 ; SP close quote
	
	; SPEx: Rearranged characters so the last row is the 'permanent' set.
	; (That is, the stuff we can't just ditch at will.)
DEF FONT_COMMON_TILE_START EQU $f0
	charmap "¥",         $f0
	charmap "×",         $f1
	charmap "<DOT>",     $f2 ; decimal point; same as "." in English
	charmap "/",         $f3
	charmap "▷",         $f4
	charmap "▶",         $f5
	charmap "0",         $f6
	charmap "1",         $f7
	charmap "2",         $f8
	charmap "3",         $f9
	charmap "4",         $fa
	charmap "5",         $fb
	charmap "6",         $fc
	charmap "7",         $fd
	charmap "8",         $fe
	charmap "9",         $ff

; SPEx: Trainer card characters.
	charmap "<TC_COLON>", $66
	charmap "<TC_BKG>",   $67
	charmap "<TC_1>",     $68
	charmap "<TC_2>",     $69
	charmap "<TC_3>",     $6A
	charmap "<TC_4>",     $6B
	charmap "<TC_5>",     $6C
	charmap "<TC_6>",     $6D
	charmap "<TC_7>",     $6E
	charmap "<TC_8>",     $6F









newcharmap english, base

; To add Toki Pona words:
; 1. First, copy one of the words from gfx/font/unused_sp.png to one of the
;    blank spaces on gfx/font/font.png, or draw your own.
; 2. Then, on the corresponding line below, change the "____" to your word.
; 3. Then, remove the `;` at the far left to activate the line.

; Row #0 (counting from 0)
	; sitelen_pona   "RESERVED", $00 ; \\\ ; Don't use this one!
	sitelen_pona          "uta", $01
	sitelen_pona        "utala", $02
	sitelen_pona         "walo", $03
	sitelen_pona          "wan", $04
	sitelen_pona         "waso", $05
	sitelen_pona         "wawa", $06
	sitelen_pona         "weka", $07
	sitelen_pona         "wile", $08
	sitelen_pona      "monsuta", $09
	sitelen_pona            "n", $0a
	; sitelen_pona       "____", $0a ; You can use these ones!
	; sitelen_pona       "____", $0a ; Remove the `;` at the far left to activate.
	; sitelen_pona       "____", $0a
	; sitelen_pona       "____", $0a
	; sitelen_pona       "____", $0a

; Row #1
	; sitelen_pona       "____", $10
	; sitelen_pona       "____", $11
	; sitelen_pona       "____", $12
	; sitelen_pona       "____", $13
	; sitelen_pona       "____", $14
	; sitelen_pona       "____", $15
	; sitelen_pona       "____", $16
	; sitelen_pona       "____", $17
	; sitelen_pona       "____", $18
	; sitelen_pona       "____", $19
	; sitelen_pona       "____", $1a
	; sitelen_pona       "____", $1b
	; sitelen_pona       "____", $1c
	; sitelen_pona       "____", $1d
	; sitelen_pona       "____", $1e
	; sitelen_pona       "____", $1f

; Row #2
	; sitelen_pona       "____", $20
	; sitelen_pona       "____", $21
	; sitelen_pona       "____", $22
	; sitelen_pona       "____", $23
	; sitelen_pona       "____", $24
	; sitelen_pona       "____", $25
	; sitelen_pona       "____", $26
	; sitelen_pona       "____", $27
	; sitelen_pona       "____", $28
	; sitelen_pona       "____", $29
	; sitelen_pona       "____", $2a
	; sitelen_pona       "____", $2b
	; sitelen_pona       "____", $2c
	; sitelen_pona       "____", $2d
	; sitelen_pona       "____", $2e
	; sitelen_pona       "____", $2f

; Row #3
	; sitelen_pona       "____", $30
	; sitelen_pona       "____", $31
	; sitelen_pona       "____", $32
	; sitelen_pona       "____", $33
	; sitelen_pona       "____", $34
	; sitelen_pona       "____", $35
	; sitelen_pona       "____", $36
	; sitelen_pona       "____", $37
	; sitelen_pona       "____", $38
	; sitelen_pona       "____", $39
	; sitelen_pona       "____", $3a
	; sitelen_pona       "____", $3b
	; sitelen_pona       "____", $3c
	; sitelen_pona       "____", $3d
	; sitelen_pona       "____", $3e
	; sitelen_pona       "____", $3f

; Row #4
	; sitelen_pona       "____", $40
	; sitelen_pona       "____", $41
	; sitelen_pona       "____", $42
	; sitelen_pona       "____", $43
	; sitelen_pona       "____", $44
	; sitelen_pona       "____", $45
	; sitelen_pona       "____", $46
	; sitelen_pona       "____", $47
	; sitelen_pona       "____", $48
	; sitelen_pona   "RESERVED", $49 ; \\\ ; Reserved by the system. Don't use
	; sitelen_pona   "RESERVED", $4a ; \\\ ; these ones!
	; sitelen_pona   "RESERVED", $4b ; \\\
	; sitelen_pona   "RESERVED", $4c ; \\\
	; sitelen_pona   "RESERVED", $4d ; \\\
	; sitelen_pona   "RESERVED", $4e ; \\\
	; sitelen_pona   "RESERVED", $4f ; \\\

; Row #5
	; sitelen_pona   "RESERVED", $50 ; \\\
	; sitelen_pona   "RESERVED", $51 ; \\\
	; sitelen_pona   "RESERVED", $52 ; \\\
	; sitelen_pona   "RESERVED", $53 ; \\\
	; sitelen_pona   "RESERVED", $54 ; \\\
	; sitelen_pona   "RESERVED", $55 ; \\\
	; sitelen_pona   "RESERVED", $56 ; \\\
	; sitelen_pona   "RESERVED", $57 ; \\\
	; sitelen_pona   "RESERVED", $58 ; \\\
	; sitelen_pona   "RESERVED", $59 ; \\\
	; sitelen_pona   "RESERVED", $5a ; \\\
	; sitelen_pona   "RESERVED", $5b ; \\\
	; sitelen_pona   "RESERVED", $5c ; \\\
	; sitelen_pona   "RESERVED", $5d ; \\\
	; sitelen_pona   "RESERVED", $5e ; \\\
	; sitelen_pona   "RESERVED", $5f ; \\\

; Row #6
	; sitelen_pona   "RESERVED", $60 ; \\\
	; sitelen_pona   "RESERVED", $61 ; \\\
	; sitelen_pona   "RESERVED", $62 ; \\\
	; sitelen_pona   "RESERVED", $63 ; \\\
	; sitelen_pona   "RESERVED", $64 ; \\\
	; sitelen_pona   "RESERVED", $65 ; \\\
	; sitelen_pona   "RESERVED", $66 ; \\\
	; sitelen_pona   "RESERVED", $67 ; \\\
	; sitelen_pona   "RESERVED", $68 ; \\\
	; sitelen_pona   "RESERVED", $69 ; \\\
	; sitelen_pona   "RESERVED", $6a ; \\\
	; sitelen_pona   "RESERVED", $6b ; \\\
	; sitelen_pona   "RESERVED", $6c ; \\\
	; sitelen_pona   "RESERVED", $6d ; \\\
	; sitelen_pona   "RESERVED", $6e ; \\\
	; sitelen_pona   "RESERVED", $6f ; \\\

; Row #7
	; sitelen_pona   "RESERVED", $70 ; \\\
	; sitelen_pona   "RESERVED", $71 ; \\\
	; sitelen_pona   "RESERVED", $72 ; \\\
	; sitelen_pona   "RESERVED", $73 ; \\\
	; sitelen_pona   "RESERVED", $74 ; \\\
	; sitelen_pona   "RESERVED", $75 ; \\\
	; sitelen_pona   "RESERVED", $76 ; \\\
	; sitelen_pona   "RESERVED", $77 ; \\\
	; sitelen_pona   "RESERVED", $78 ; \\\
	; sitelen_pona   "RESERVED", $79 ; \\\
	; sitelen_pona   "RESERVED", $7a ; \\\
	; sitelen_pona   "RESERVED", $7b ; \\\
	; sitelen_pona   "RESERVED", $7c ; \\\
	; sitelen_pona   "RESERVED", $7d ; \\\
	; sitelen_pona   "RESERVED", $7e ; \\\
	; sitelen_pona   "RESERVED", $7f ; \\\

; Row #8
	sitelen_pona            "a", $80 ; 120 nimi pu, but replacing "pu" with "tonsi".
	sitelen_pona        "akesi", $81
	sitelen_pona          "ala", $82
	sitelen_pona        "alasa", $83
	sitelen_pona          "ale", $84
	sitelen_pona         "anpa", $85
	sitelen_pona         "ante", $86
	sitelen_pona          "anu", $87
	sitelen_pona         "awen", $88
	sitelen_pona            "e", $89
	sitelen_pona           "en", $8a
	sitelen_pona         "esun", $8b
	sitelen_pona          "ijo", $8c
	sitelen_pona          "ike", $8d
	sitelen_pona          "ilo", $8e
	sitelen_pona         "insa", $8f

; Row #9
	sitelen_pona         "jaki", $90
	sitelen_pona          "jan", $91
	sitelen_pona         "jelo", $92
	sitelen_pona           "jo", $93
	sitelen_pona         "kala", $94
	sitelen_pona       "kalama", $95
	sitelen_pona         "kama", $96
	sitelen_pona         "kasi", $97
	sitelen_pona          "ken", $98
	sitelen_pona      "kepeken", $99
	sitelen_pona         "kili", $9a
	sitelen_pona        "kiwen", $9b
	sitelen_pona           "ko", $9c
	sitelen_pona          "kon", $9d
	sitelen_pona         "kule", $9e
	sitelen_pona       "kulupu", $9f

; Row #A (10 in decimal)
	sitelen_pona         "kute", $a0
	sitelen_pona           "la", $a1
	sitelen_pona         "lape", $a2
	sitelen_pona         "laso", $a3
	sitelen_pona         "lawa", $a4
	sitelen_pona          "len", $a5
	sitelen_pona         "lete", $a6
	sitelen_pona           "li", $a7
	sitelen_pona         "lili", $a8
	sitelen_pona        "linja", $a9
	sitelen_pona         "lipu", $aa
	sitelen_pona         "loje", $ab
	sitelen_pona          "lon", $ac
	sitelen_pona         "luka", $ad
	sitelen_pona        "lukin", $ae
	sitelen_pona         "lupa", $af

; Row #B (11)
	sitelen_pona           "ma", $b0
	sitelen_pona         "mama", $b1
	sitelen_pona         "mani", $b2
	sitelen_pona         "meli", $b3
	sitelen_pona           "mi", $b4
	sitelen_pona         "mije", $b5
	sitelen_pona         "moku", $b6
	sitelen_pona         "moli", $b7
	sitelen_pona        "monsi", $b8
	sitelen_pona           "mu", $b9
	sitelen_pona          "mun", $ba
	sitelen_pona         "musi", $bb
	sitelen_pona         "mute", $bc
	sitelen_pona        "nanpa", $bd
	sitelen_pona         "nasa", $be
	sitelen_pona        "nasin", $bf

; Row #C (12)
	sitelen_pona         "nena", $c0
	sitelen_pona           "ni", $c1
	sitelen_pona         "nimi", $c2
	sitelen_pona         "noka", $c3
	sitelen_pona            "o", $c4
	sitelen_pona         "olin", $c5
	sitelen_pona          "ona", $c6
	sitelen_pona         "open", $c7
	sitelen_pona       "pakala", $c8
	sitelen_pona         "pali", $c9
	sitelen_pona       "palisa", $ca
	sitelen_pona          "pan", $cb
	sitelen_pona         "pana", $cc
	sitelen_pona           "pi", $cd
	sitelen_pona        "pilin", $ce
	sitelen_pona       "pimeja", $cf

; Row #D (13)
	sitelen_pona         "pini", $d0
	sitelen_pona         "pipi", $d1
	sitelen_pona         "poka", $d2
	sitelen_pona         "poki", $d3
	sitelen_pona         "pona", $d4
	sitelen_pona         "sama", $d5
	sitelen_pona         "seli", $d6
	sitelen_pona         "selo", $d7
	sitelen_pona         "seme", $d8
	sitelen_pona         "sewi", $d9
	sitelen_pona       "sijelo", $da
	sitelen_pona         "sike", $db
	sitelen_pona          "sin", $dc
	sitelen_pona         "sina", $dd
	sitelen_pona       "sinpin", $de
	sitelen_pona      "sitelen", $df

; Row #E (14)
	sitelen_pona         "sona", $e0
	sitelen_pona       "soweli", $e1
	sitelen_pona         "suli", $e2
	sitelen_pona         "suno", $e3
	sitelen_pona         "supa", $e4
	sitelen_pona         "suwi", $e5
	sitelen_pona          "tan", $e6
	sitelen_pona         "taso", $e7
	sitelen_pona         "tawa", $e8
	sitelen_pona         "telo", $e9
	sitelen_pona        "tenpo", $ea
	sitelen_pona         "toki", $eb
	sitelen_pona         "tomo", $ec
	sitelen_pona        "tonsi", $ed
	sitelen_pona           "tu", $ee
	sitelen_pona         "unpa", $ef ; The rest of the nimi pu are on Row #0.

; Row #F (15)
	; sitelen_pona   "RESERVED", $f0 ; ¥     ; Reserved by the system.
	; sitelen_pona   "RESERVED", $f1 ; ×     ; Don't use these ones!
	; sitelen_pona   "RESERVED", $f2 ; <DOT> ; (You can edit font.png to 
	; sitelen_pona   "RESERVED", $f3 ; /     ; change how they look, though.)
	; sitelen_pona   "RESERVED", $f4 ; ▷
	; sitelen_pona   "RESERVED", $f5 ; ▶
	; sitelen_pona   "RESERVED", $f6 ; 0
	; sitelen_pona   "RESERVED", $f7 ; 1
	; sitelen_pona   "RESERVED", $f8 ; 2
	; sitelen_pona   "RESERVED", $f9 ; 3
	; sitelen_pona   "RESERVED", $fa ; 4
	; sitelen_pona   "RESERVED", $fb ; 5
	; sitelen_pona   "RESERVED", $fc ; 6
	; sitelen_pona   "RESERVED", $fd ; 7
	; sitelen_pona   "RESERVED", $fe ; 8
	; sitelen_pona   "RESERVED", $ff ; 9









; Fallback characters with a fake Latin alphabet, for English that hasn't been
; translated yet.

	charmap "A",         $80 ; a
	charmap "B",         $dd ; sina
	charmap "C",         $45 ; cartouche open
	charmap "D",         $83 ; alasa
	charmap "E",         $f9 ; 3
	charmap "F",         $d1 ; pipi
	charmap "G",         $93 ; jo
	charmap "H",         $bd ; nanpa
	charmap "I",         $d0 ; pini
	charmap "J",         $43 ; to (close quote)
	charmap "K",         $98 ; ken
	charmap "L",         $cd ; pi
	charmap "M",         $da ; sijelo
	charmap "N",         $c0 ; nena
	charmap "O",         $f6 ; 0
	charmap "P",         $b4 ; mi
	charmap "Q",         $b1 ; mama
	charmap "R",         $42 ; te (open quote)
	charmap "S",         $fb ; 5
	charmap "T",         $fd ; 7
	charmap "U",         $af ; lupa
	charmap "V",         $e2 ; suli
	charmap "W",         $08 ; wile
	charmap "X",         $82 ; ala
	charmap "Y",         $87 ; anu
	charmap "Z",         $f8 ; 2

	;charmap "a",        $80 ; toki pona word
	charmap "b",         $dd
	charmap "c",         $45
	charmap "d",         $83
	;charmap "e",        $f9 ; toki pona word
	charmap "f",         $d1
	charmap "g",         $93
	charmap "h",         $bd
	charmap "i",         $d0
	charmap "j",         $43
	charmap "k",         $98
	charmap "l",         $cd
	charmap "m",         $da
	;charmap "n",        $c0 ; toki pona word
	;charmap "o",        $f6 ; toki pona word
	charmap "p",         $b4
	charmap "q",         $b1
	charmap "r",         $42
	charmap "s",         $fb
	charmap "t",         $fd
	charmap "u",         $af
	charmap "v",         $e2
	charmap "w",         $08
	charmap "x",         $82
	charmap "y",         $87
	charmap "z",         $f8

	charmap "é",         $f9 ; 3
	charmap "'d",        $83 ; alasa
	charmap "'l",        $cd ; pi
	; done the above three
	charmap "'s",        $fb ; 5
	charmap "'t",        $fd ; 7
	charmap "'v",        $e2 ; suli
	charmap "'r",        $42 ; te (open quote)
	charmap "'m",        $da ; sijelo

newcharmap japanese, base

; Japanese kana, for those bits of text that were not translated to English

	charmap "ァ",         $e9 ; katakana small a, unused

	charmap "ガ", $05
	charmap "ギ", $06
	charmap "グ", $07
	charmap "ゲ", $08
	charmap "ゴ", $09
	charmap "ザ", $0a
	charmap "ジ", $0b
	charmap "ズ", $0c
	charmap "ゼ", $0d
	charmap "ゾ", $0e
	charmap "ダ", $0f
	charmap "ヂ", $10
	charmap "ヅ", $11
	charmap "デ", $12
	charmap "ド", $13

	charmap "バ", $19
	charmap "ビ", $1a
	charmap "ブ", $1b
	charmap "ボ", $1c

	charmap "が", $26
	charmap "ぎ", $27
	charmap "ぐ", $28
	charmap "げ", $29
	charmap "ご", $2a
	charmap "ざ", $2b
	charmap "じ", $2c
	charmap "ず", $2d
	charmap "ぜ", $2e
	charmap "ぞ", $2f
	charmap "だ", $30
	charmap "ぢ", $31
	charmap "づ", $32
	charmap "で", $33
	charmap "ど", $34

	charmap "ば", $3a
	charmap "び", $3b
	charmap "ぶ", $3c
	charmap "べ", $3d
	charmap "ぼ", $3e

	charmap "パ", $40
	charmap "ピ", $41
	charmap "プ", $42
	charmap "ポ", $43
	charmap "ぱ", $44
	charmap "ぴ", $45
	charmap "ぷ", $46
	charmap "ぺ", $47
	charmap "ぽ", $48

	charmap "「", $70
	charmap "」", $71
	charmap "』", $73
	charmap "⋯", $75

	charmap "　", $7f

	charmap "ア", $80
	charmap "イ", $81
	charmap "ウ", $82
	charmap "エ", $83
	charmap "オ", $84
	charmap "カ", $85
	charmap "キ", $86
	charmap "ク", $87
	charmap "ケ", $88
	charmap "コ", $89
	charmap "サ", $8a
	charmap "シ", $8b
	charmap "ス", $8c
	charmap "セ", $8d
	charmap "ソ", $8e
	charmap "タ", $8f
	charmap "チ", $90
	charmap "ツ", $91
	charmap "テ", $92
	charmap "ト", $93
	charmap "ナ", $94
	charmap "ニ", $95
	charmap "ヌ", $96
	charmap "ネ", $97
	charmap "ノ", $98
	charmap "ハ", $99
	charmap "ヒ", $9a
	charmap "フ", $9b
	charmap "ホ", $9c
	charmap "マ", $9d
	charmap "ミ", $9e
	charmap "ム", $9f
	charmap "メ", $a0
	charmap "モ", $a1
	charmap "ヤ", $a2
	charmap "ユ", $a3
	charmap "ヨ", $a4
	charmap "ラ", $a5
	charmap "ル", $a6
	charmap "レ", $a7
	charmap "ロ", $a8
	charmap "ワ", $a9
	charmap "ヲ", $aa
	charmap "ン", $ab
	charmap "ッ", $ac
	charmap "ャ", $ad
	charmap "ュ", $ae
	charmap "ョ", $af
	charmap "ィ", $b0

	charmap "あ", $b1
	charmap "い", $b2
	charmap "う", $b3
	charmap "え", $b4
	charmap "お", $b5
	charmap "か", $b6
	charmap "き", $b7
	charmap "く", $b8
	charmap "け", $b9
	charmap "こ", $ba
	charmap "さ", $bb
	charmap "し", $bc
	charmap "す", $bd
	charmap "せ", $be
	charmap "そ", $bf
	charmap "た", $c0
	charmap "ち", $c1
	charmap "つ", $c2
	charmap "て", $c3
	charmap "と", $c4
	charmap "な", $c5
	charmap "に", $c6
	charmap "ぬ", $c7
	charmap "ね", $c8
	charmap "の", $c9
	charmap "は", $ca
	charmap "ひ", $cb
	charmap "ふ", $cc
	charmap "へ", $cd
	charmap "ほ", $ce
	charmap "ま", $cf
	charmap "み", $d0
	charmap "む", $d1
	charmap "め", $d2
	charmap "も", $d3
	charmap "や", $d4
	charmap "ゆ", $d5
	charmap "よ", $d6
	charmap "ら", $d7
	charmap "り", $d8
	charmap "る", $d9
	charmap "れ", $da
	charmap "ろ", $db
	charmap "わ", $dc
	charmap "を", $dd
	charmap "ん", $de
	charmap "っ", $df
	charmap "ゃ", $e0
	charmap "ゅ", $e1
	charmap "ょ", $e2

	charmap "ー", $e3
	charmap "ﾟ", $e4
	charmap "ﾞ", $e5

	charmap "？", $e6
	charmap "！", $e7
	charmap "。", $e8

	charmap "円", $f0

	charmap "．", $f2
	charmap "／", $f3

	charmap "ォ", $f4

	charmap "０", $f6
	charmap "１", $f7
	charmap "２", $f8
	charmap "３", $f9
	charmap "４", $fa
	charmap "５", $fb
	charmap "６", $fc
	charmap "７", $fd
	charmap "８", $fe
	charmap "９", $ff

; Default charmap.
setcharmap english
