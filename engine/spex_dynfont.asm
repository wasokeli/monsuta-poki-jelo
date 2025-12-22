; SPEx: Dynamic Font Engine.

; Resets the dynamic font engine.
SPExFontResetAndLoadCommon::
	; Moved from LoadFontTilePatterns
	ldh a, [rLCDC]
	bit B_LCDC_ENABLE, a
	jr nz, .common_lcdon
.common_lcdoff
	ld hl, FontCommonGraphics
	ld de, vFont + ((FONT_COMMON_TILE_START - $80) tiles)
	ld bc, FontCommonGraphicsEnd - FontCommonGraphics
	ld a, BANK(FontCommonGraphics)
	call FarCopyDataDouble ; if LCD is off, transfer all at once
	jr .main_table_reset
.common_lcdon
	ld de, FontCommonGraphics
	ld hl, vFont + ((FONT_COMMON_TILE_START - $80) tiles)
	lb bc, BANK(FontCommonGraphics), (FontCommonGraphicsEnd - FontCommonGraphics) / $8
	call CopyVideoDataDouble ; if LCD is on, transfer during V-blank
.main_table_reset
SPExFontReset::
	; -- Reset the table itself --
	ld a, BANK(sSPExFontLoadTbl)
	call OpenSRAM
	; Linker guarantees L directly translates to char.
	; That is, L should be zero here.
	ld hl, sSPExFontLoadTbl
	ASSERT LOW(sSPExFontLoadTbl) == $00
	ASSERT BANK(sSPExFontLoadTbl) == BANK(sSPExFontLoadRotator)
.loop:
	ld a, l
	; Common region is static.
	; This can be tile-precise.
	cp a, FONT_COMMON_TILE_START
	jr nc, .static
	; Renderable region
	cp a, $80
	jr nc, .render
	; If NOT the extra region, go to default
	cp a, $60
	jr c, .default
.static:
	; This is a static character and thus always equates to itself.
	ld [hl], l
	jr .anyway
.render:
.default:
	ld [hl], $00
.anyway:
	inc l
	jr nz, .loop
	; This is written this way to clarify what's going on: it is incremented by 1 and then $80 is allocated.
	ld a, $80 - 1
	ld [sSPExFontLoadRotator], a
	; finally, close SRAM
	call CloseSRAM
IF DEF(_DEBUG)
	; In debugging, the renderable region should be deliberately messed with.
	ld hl, vFont
	; It doesn't really matter *what* the nonsense is, just that it's visibly nonsense.
	ld de, $0000
	; this quirk...
	ldh a, [rLCDC]
	bit B_LCDC_ENABLE, a
	jr nz, .lcdon
	; LCD off
	; swap HL/DE
	push hl
	push de
	pop hl
	pop de
	ld a, b
	ld bc, (FONT_COMMON_TILE_START - $80) * TILE_1BPP_SIZE
	jp FarCopyDataDouble
.lcdon:
	ld c, (FONT_COMMON_TILE_START - $80)
	jp CopyVideoDataDouble
ELSE
	ret
ENDC

; This function translates/loads the character in [hSPExTileTranslation].
; To function, it has to open SRAM.
SPExFontTranslate::
	ld a, BANK(sSPExFontLoadTbl)
	call OpenSRAM
	; Linker guarantees L directly translates.
	ld h, HIGH(sSPExFontLoadTbl)
	ldh a, [hSPExTileTranslation]
	ld l, a
	; HL is now tile translation table pointer
	ld a, [hl]
	and a, a
	jr nz, .already_loaded
	; We need to allocate a tile!
	ld a, [sSPExFontLoadRotator]
	inc a
	cp a, FONT_COMMON_TILE_START
	jr c, .rotator_did_not_wrap
	; WE ARE OUT OF TILE MEMORY!!!
	; waso Keli says we should show an error tile in this situation.
	ld a, '▷'
	jr .already_loaded
.rotator_did_not_wrap:
	; a is now allocated tile
	; save it to rotator, tile translation table, and result (it's going to get destroyed)
	ld [sSPExFontLoadRotator], a
	ld [hl], a
	ldh [hSPExTileTranslation], a
	; setup for the tile copy
	; we need to keep our destination in A because we don't want to overwrite L too early
	; meanwhile our existing L is our *source*
	; setup source ; this is why the font sheet was massaged into a single namespace
	ld h, $00 ; HL = source tile
	; multiply HL by 8
	add hl, hl
	add hl, hl
	add hl, hl
	; and merge with megasheet start
	ld de, SPExDynFontMegasheet
	add hl, de
	; a bit backwards, but oh well
	ld d, h
	ld e, l
	; continue
	ld b, BANK(SPExDynFontMegasheet) ; source bank
	ld l, a ; destination
	call SPExLoadTile
	jr .load_complete
.already_loaded:
	ldh [hSPExTileTranslation], a
.load_complete:
	call CloseSRAM
	ret

; l: Destination
; b:de: Source
SPExLoadTile:
	; This is a bit convoluted, but basically it results in vChars0 + (L << 4)
	ld h, $08
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	; this quirk...
	ldh a, [rLCDC]
	bit B_LCDC_ENABLE, a
	jr nz, .lcdon
	; LCD off
	; swap HL/DE
	push hl
	push de
	pop hl
	pop de
	ld a, b
	ld bc, $08
	jp FarCopyDataDouble
.lcdon:
	ld c, 1
	jp CopyVideoDataDouble

; This is a hacky bit of code to make the naming screen happy.
SPExFontTranslateBackwards::
	ld a, BANK(sSPExFontLoadTbl)
	call OpenSRAM
	ld h, HIGH(sSPExFontLoadTbl)
	ld l, $00
	ldh a, [hSPExTileTranslation]
.loop:
	cp a, [hl]
	jr z, .found
	inc l
	jr nz, .loop
	; didn't find it!
	ld a, '!'
.found:
	ld a, l
	ldh [hSPExTileTranslation], a
	call CloseSRAM
	ret
