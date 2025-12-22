; SPEx: The font megasheet
SPExDynFontMegasheet::
INCBIN "gfx/font/font.1bpp", $00 * $08, $60 * $08
TextBoxGraphics::
INCBIN "gfx/font/font.1bpp", $60 * $08, $20 * $08
TextBoxGraphicsEnd::
INCBIN "gfx/font/font.1bpp", $80 * $08, (FONT_COMMON_TILE_START - $80) * $08
FontCommonGraphics::
INCBIN "gfx/font/font.1bpp", FONT_COMMON_TILE_START * $08, ($100 - FONT_COMMON_TILE_START) * $08
FontCommonGraphicsEnd::

ABTiles: INCBIN "gfx/font/AB.2bpp"

HpBarAndStatusGraphics:: INCBIN "gfx/font/font_battle_extra.2bpp"
HpBarAndStatusGraphicsEnd::

BattleHudTiles1: INCBIN "gfx/battle/battle_hud_1.1bpp"
BattleHudTiles1End:
BattleHudTiles2: INCBIN "gfx/battle/battle_hud_2.1bpp"
BattleHudTiles3: INCBIN "gfx/battle/battle_hud_3.1bpp"
BattleHudTiles3End:

; SPEx: Something important to know is that these three assets are a linked set.
; Note the lack of 'End' on most of them.
NintendoCopyrightLogoGraphics: INCBIN "gfx/splash/copyright.2bpp"
GameFreakLogoGraphics: INCBIN "gfx/title/gamefreak_inc.2bpp"
NineTile: INCBIN "gfx/title/nine.2bpp"
NineTileEnd::

PokedexTileGraphics: INCBIN "gfx/pokedex/pokedex.2bpp"
PokedexTileGraphicsEnd:

WorldMapTileGraphics: INCBIN "gfx/town_map/town_map.2bpp"
WorldMapTileGraphicsEnd:

PlayerCharacterTitleGraphics: INCBIN "gfx/title/player.2bpp"
PlayerCharacterTitleGraphicsEnd:
