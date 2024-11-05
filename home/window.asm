ReanchorMap::
	call ClearWindowData
	ldh a, [hROMBank]
	push af
	ld a, BANK(ReanchorBGMap_NoOAMUpdate) ; aka BANK(LoadFonts_NoOAMUpdate)
	rst Bankswitch

	call ReanchorBGMap_NoOAMUpdate
	call HDMATransferTilemapAndAttrmap_Menu
	call LoadFonts_NoOAMUpdate

	pop af
	rst Bankswitch
	ret

CloseText::
	ldh a, [hOAMUpdate]
	push af
	ld a, $1
	ldh [hOAMUpdate], a

	call .CloseText

	pop af
	ldh [hOAMUpdate], a
	ld hl, wStateFlags
	res TEXT_STATE_F, [hl]
	ret

.CloseText:
	call ClearWindowData
	xor a
	ldh [hBGMapMode], a
	call LoadOverworldTilemapAndAttrmapPals
	call HDMATransferTilemapAndAttrmap_Menu

	call ClearTextboxLCD

	xor a
	ldh [hBGMapMode], a
	call SafeUpdateSprites
	farcall RefreshSprites
	ld a, $90
	ldh [hWY], a
	call UpdatePlayerSprite
	xor a
	ldh [hBGMapMode], a
	farjp InitMapNameSign

ClearTextboxLCD:
	ld hl, rIE
	res LCD_STAT, [hl]
	ld a, LOW(LCDGeneric)
	ldh [hFunctionTargetLo], a
	xor a
	ld [wTextboxMode], a
	ret

OpenText::
	call ClearWindowData
	ldh a, [hROMBank]
	push af
	ld a, BANK(ReanchorBGMap_NoOAMUpdate) ; aka BANK(LoadFonts_NoOAMUpdate)
	rst Bankswitch

	call ReanchorBGMap_NoOAMUpdate ; anchor bgmap
	call SpeechTextbox
	call HDMATransferTilemapAndAttrmap_Menu ; transfer bgmap
	call LoadFonts_NoOAMUpdate ; load font
	pop af
	rst Bankswitch

	ret

HDMATransferTilemapAndAttrmap_Menu::
	ldh a, [hOAMUpdate]
	push af
	ld a, $1
	ldh [hOAMUpdate], a

	farcall _HDMATransferTilemapAndAttrmap_Menu

	pop af
	ldh [hOAMUpdate], a
	ret

SafeUpdateSprites::
	ldh a, [hOAMUpdate]
	push af
	ldh a, [hBGMapMode]
	push af
	xor a
	ldh [hBGMapMode], a
	ld a, $1
	ldh [hOAMUpdate], a

	call UpdateSprites

	xor a
	ldh [hOAMUpdate], a
	call DelayFrame
	pop af
	ldh [hBGMapMode], a
	pop af
	ldh [hOAMUpdate], a
	ret
