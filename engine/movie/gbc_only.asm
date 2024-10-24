GBCOnlyScreen:
	ldh a, [hCGB]
	and a
	ret nz

	ld de, MUSIC_NONE
	call PlayMusic

	call ClearTilemap

	ld hl, GBCOnlyGFX
	ld de, wGBCOnlyDecompressBuffer
	ldh a, [rSVBK]
	push af
	xor a
	ldh [rSVBK], a
	call Decompress
	pop af
	ldh [rSVBK], a

	ld de, wGBCOnlyDecompressBuffer
	ld hl, vTiles2
	lb bc, BANK(GBCOnlyGFX), 84
	call Get2bpp

	ld de, Font
	ld hl, vTiles1
	lb bc, BANK(Font), $80
	call Get1bpp

	call DrawGBCOnlyScreen

	call WaitBGMap

; better luck next time
.loop
	call DelayFrame
	jr .loop

DrawGBCOnlyScreen:
	call DrawGBCOnlyBorder

	; Pokemon
	hlcoord 3, 2
	lb bc, 14, 4
	ld a, $8
	call DrawGBCOnlyGraphic

	; Crystal
	hlcoord 5, 6
	lb bc, 10, 2
	ld a, $40
	call DrawGBCOnlyGraphic

	ld de, GBCOnlyString
	hlcoord 1, 10
	rst PlaceString

	ret

DrawGBCOnlyBorder:
	hlcoord 0, 0
	xor a ; top-left
	ld [hli], a

	inc a ; top
	call .FillRow

	ld [hl], 2 ; top-right

	hlcoord 0, 1
	ld a, 3 ; left
	call .FillColumn

	hlcoord 19, 1
	ld a, 4 ; right
	call .FillColumn

	hlcoord 0, 17
	ld a, 5 ; bottom-left
	ld [hli], a

	ld a, 6 ; bottom
	call .FillRow

	ld [hl], 7 ; bottom-right
	ret

.FillRow:
	ld c, SCREEN_WIDTH - 2
.next_column
	ld [hli], a
	dec c
	jr nz, .next_column
	ret

.FillColumn:
	ld de, SCREEN_WIDTH
	ld c, SCREEN_HEIGHT - 2
.next_row
	ld [hl], a
	add hl, de
	dec c
	jr nz, .next_row
	ret

DrawGBCOnlyGraphic:
	ld de, SCREEN_WIDTH
.y
	push bc
	push hl
.x
	ld [hli], a
	inc a
	dec b
	jr nz, .x
	pop hl
	add hl, de
	pop bc
	dec c
	jr nz, .y
	ret

GBCOnlyString:
	db   "This Game Pak is"
	next "designed only for"
	next "use on the"
	next "Game Boy Color.@"

GBCOnlyGFX:
INCBIN "gfx/sgb/gbc_only.2bpp.lz"

MBC30FailScreen:
	ldh a, [hHWType]
	and %110 ; MBC30 RAM and ROM
	cp %110
	ret z

	ld de, MUSIC_NONE
	call PlayMusic

	call ClearTilemap

	ld hl, GBCOnlyGFX
	ld de, wGBCOnlyDecompressBuffer
	ldh a, [rSVBK]
	push af
	xor a
	ldh [rSVBK], a
	call Decompress
	pop af
	ldh [rSVBK], a

	ld de, wGBCOnlyDecompressBuffer
	ld hl, vTiles2
	lb bc, BANK(GBCOnlyGFX), 84
	call Get2bpp

	ld de, Font
	ld hl, vTiles1
	lb bc, BANK(Font), $80
	call Get1bpp

	call DrawMBC30ErrorScreen

	call WaitBGMap

	ld b, 5
.loop
	ld c, 60
	call DelayFrames
	dec b
	jr nz, .loop

	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_WIDTH
	ld a, " "
	rst ByteFill

	ret

DrawMBC30ErrorScreen:
	hlcoord 1, 1
	ld de, MBCErrorString_Info
	rst PlaceString

	ld a, [hHWType]
	bit HW_MBC30_ROM, a
	call z, .ROMFail

	ld a, [hHWType]
	bit HW_MBC30_RAM, a
	call z, .RAMFail

	ret

.ROMFail:
	hlcoord 1, 9
	ld de, MBCErrorString_ROM
	rst PlaceString
	ret

.RAMFail:
	hlcoord 1, 13
	ld de, MBCErrorString_RAM
	rst PlaceString
	ret

MBCErrorString_Info:
	db   "Missing support"
	next "for MBC30. The"
	next "following features"
	next "will be disabled:@"

MBCErrorString_ROM:
	db   "- High quality"
	next "  #MON cries@"

MBCErrorString_RAM:
	db   "- Additional save"
	next "  data slot@"

	db   "Oopsie woopsie uwu"
	next "We made a fucky"
	next "wucky! A widdle"
	next "fucko boingo!!@"
