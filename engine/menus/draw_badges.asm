DrawBadges:
; Draw 4x2 gym leader faces, with the faces replaced by
; badges if they are owned. Used in the player status screen.

; In Japanese versions, names are displayed above faces.
; Instead of removing relevant code, the name graphics were erased.

; Tile ids for face/badge graphics.
	ld de, wBadgeOrFaceTiles
	ld hl, .FaceBadgeTiles
	ld bc, NUM_BADGES
	call CopyData

; Booleans for each badge.
	ld hl, wTempObtainedBadgesBooleans
	ld bc, NUM_BADGES
	xor a
	call FillMemory

; Alter these based on owned badges.
	ld de, wTempObtainedBadgesBooleans
	ld hl, wBadgeOrFaceTiles
	ld a, [wObtainedBadges]
	ld b, a
	ld c, NUM_BADGES
.CheckBadge
	srl b
	jr nc, .NextBadge
	ld a, [hl]
	add 4 ; Badge graphics are after each face
	ld [hl], a
	ld a, 1
	ld [de], a
.NextBadge
	inc hl
	inc de
	dec c
	jr nz, .CheckBadge

; Draw two rows of badges.
	ld hl, wBadgeNumberTile
	ld a, '<TC_1>' ; [1] ; SPEx: Adjusted
	ld [hli], a
	xor a
	ld [hl], a ; First name base (SPEx: 0)

	hlcoord 2, 11
	ld de, wTempObtainedBadgesBooleans
	call .DrawBadgeRow

	hlcoord 2, 14
	ld de, wTempObtainedBadgesBooleans + 4
	; fallthrough

.DrawBadgeRow
; Draw 4 badges.

	ld c, 4
.DrawBadge
	push de
	push hl

; Badge no.
	ld a, [wBadgeNumberTile]
	ld [hli], a
	inc a
	ld [wBadgeNumberTile], a

; Names aren't printed if the badge is owned.
	ld a, [de]
	and a
	ld a, [wBadgeNameTile]
	jr nz, .SkipName

	push af
	push bc
	push de
	; SPEx: Revised-revised gym leader name print routine.
	ld de, .GymLeaderNames
	add a, e
	ld e, a
	call PlaceString
	pop de
	pop bc
	pop af

	; jr .NoSkipName
.NoSkipName

.SkipName
	inc hl

	inc a
	inc a
	inc a

.PlaceBadge
	ld [wBadgeNameTile], a
	ld de, SCREEN_WIDTH - 1
	add hl, de
	ld a, [wBadgeOrFaceTiles]
	call .PlaceTiles
	add hl, de
	call .PlaceTiles

; Shift badge array back one byte.
	push bc
	ld hl, wBadgeOrFaceTiles + 1
	ld de, wBadgeOrFaceTiles
	ld bc, NUM_BADGES
	call CopyData
	pop bc

	pop hl
	ld de, 4
	add hl, de

	pop de
	inc de
	dec c
	jr nz, .DrawBadge
	ret

.PlaceTiles
	ld [hli], a
	inc a
	ld [hl], a
	inc a
	ret

.FaceBadgeTiles
	db $20, $28, $30, $38, $40, $48, $50, $58

; SPEx: Gym leader names are stored here in a definitely-not-at-all-questionably-sane format.
; Due to size constraints, we kind of just have to hope we don't have a page boundary in here.
.GymLeaderNames
IF DEF(_DEBUG)
	db "G0@"
	db "G1@"
	db "G2@"
	db "G3@"
	db "G4@"
	db "G5@"
	db "G6@"
	db "G7@"
ELSE
	db "  @"
	db "  @"
	db "  @"
	db "  @"
	db "  @"
	db "  @"
	db "  @"
	db "  @"
ENDC

GymLeaderFaceAndBadgeTileGraphics:
	INCBIN "gfx/trainer_card/badges.2bpp"
