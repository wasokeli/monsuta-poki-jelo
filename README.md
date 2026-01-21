# Pokémon Yellow: Toki Pona Sandbox

This is a disassembly of Pokémon Yellow, with changes so you can translate it into Toki Pona. It's based on [pret](https://github.com/pret/pokeyellow), followed by jan Ketesi's SPEx technology to increase the number of available Sitelen Pona words, followed by waso Keli's changes to set it up for translation.

This repo is *not*, itself, a translation. It's just getting the technicals out of the way so you can translate the game yourself! Click "forks" on the sidebar -> to see what other people have done.

<img width="320" height="288" alt="A screenshot of a Pokemon battle between Pikachu and Eevee. Pikachu used growl!" src="https://github.com/user-attachments/assets/22e28243-cb21-4fa7-91cf-12024cdda2a3" /> <img width="320" height="288" alt="The same screenshot, but translated to Toki Pona. soweli jelo en soweli pi ken mute li utala. soweli jelo li mu tawa monsuta ante a!" src="https://github.com/user-attachments/assets/346079a7-5d45-4823-ad1a-eab8d12fdf75" />

_**Left**: This project. **Right**: The result of changing [Pokemon names](https://github.com/wasokeli/monsuta-poki-jelo/blob/main/data/pokemon/names.asm#L86-L104), [move names](https://github.com/wasokeli/monsuta-poki-jelo/blob/main/data/moves/names.asm#L47), and [battle text](https://github.com/wasokeli/monsuta-poki-jelo/blob/main/data/text/text_2.asm#L1131-L1147)._

## Getting started

- Edit the [font](https://github.com/wasokeli/monsuta-poki-jelo/blob/main/gfx/font/font.png) to your liking. (Right now it uses [leko majuna sin](https://wasokeli.github.io/sp-font-maker/leko-majuna-sin), which defaults to nonstandard *akesi*, *monsi*, and *sinpin*. The standard ones are in [unused_sp.png](https://github.com/wasokeli/monsuta-poki-jelo/blob/main/gfx/font/unused_sp.png).)
- Add new words! Copy glyphs from [unused_sp.png](https://github.com/wasokeli/monsuta-poki-jelo/blob/main/gfx/font/unused_sp.png) to [font.png](https://github.com/wasokeli/monsuta-poki-jelo/blob/main/gfx/font/font.png), and register them in [charmap.asm](https://github.com/wasokeli/monsuta-poki-jelo/blob/main/constants/charmap.asm) so that you can use them in text. By default, the font only includes:
    - The 120 *nimi pu*, but replacing the word *pu* with *tonsi*
    - *monsuta*
    - *n*
    - *te/to* (open and close quotes)
    - cartouche symbols: `[.:]`
    - hyphen
- Start translating! Text is stored in various files, so you'll have to search around. Prof. Oak's introduction is in [text_3.asm](https://github.com/wasokeli/monsuta-poki-jelo/blob/main/data/text/text_3.asm#L435-L495).
- To run the game, see [**INSTALL.md**](INSTALL.md). Ask your fellow tokiponists for help if you need it!

## Resources from pret

- [**Red wiki**](https://github.com/pret/pokeyellow/wiki), [**Yellow wiki**](https://github.com/pret/pokeyellow/wiki)
- [**Yellow symbols**](https://github.com/wasokeli/pokeyellow/tree/symbols)
- [**Tools**](https://github.com/pret/gb-asm-tools)

You can find us on [Discord (pret, #pokered)](https://discord.gg/d5dubZ3).

For other pret projects, see [pret.github.io](https://pret.github.io/).
