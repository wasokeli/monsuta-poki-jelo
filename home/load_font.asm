; SPEx: LoadFontTilePatterns now resets SPEx and only loads the 'common region'.
LoadFontTilePatterns::
	farjp SPExFontResetAndLoadCommon

; SPEx: This is intended to replace existing 'ret's in tight spaces (i.e. party menu)
SPExFontReset_SaveAF::
	push af
	farcall SPExFontReset
	pop af
	ret

; SPEx: Saves HL, BC, DE, and changes A.
SPExFontTranslate_ASaveHLBCDE::
	push hl
	push bc
	push de
	ldh [hSPExTileTranslation], a
	farcall SPExFontTranslate
	ldh a, [hSPExTileTranslation]
	pop de
	pop bc
	pop hl
	ret

LoadTextBoxTilePatterns::
	farjp _LoadTextBoxTilePatterns

LoadHpBarAndStatusTilePatterns::
	farjp _LoadHpBarAndStatusTilePatterns
