; Loads tile patterns for tiles used in the pokedex.
; SPEx: Pokeball tile load was moved to LoadPokedexTilePokeball.
LoadPokedexTilePatterns:
	call LoadHpBarAndStatusTilePatterns
	ld de, PokedexTileGraphics
	ld hl, vChars2 tile $60
	lb bc, BANK(PokedexTileGraphics), (PokedexTileGraphicsEnd - PokedexTileGraphics) / TILE_SIZE
	jp CopyVideoData

LoadPokedexTilePokeball:
	ld de, PokeballTileGraphics
	ld hl, vChars2 tile '▼'
	lb bc, BANK(PokeballTileGraphics), 1
	jp CopyVideoData ; load pokeball tile for marking caught mons

UnloadPokedexTilePokeball:
	ld de, TextBoxGraphics + (('▼' - $60) * TILE_1BPP_SIZE)
	ld hl, vChars2 tile '▼'
	lb bc, BANK(TextBoxGraphics), 1
	jp CopyVideoDataDouble ; replace pokeball tile with down arrow again
