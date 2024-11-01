DEF POPUP_NOTIF_TEXT_LINE_1_START EQU $C0
DEF POPUP_NOTIF_TEXT_LINE_2_START EQU $D2
DEF POPUP_NOTIF_TEXT_LINE_SIZE    EQU 18
DEF POPUP_NOTIF_FRAME_START       EQU $F3
DEF POPUP_NOTIF_FRAME_SIZE        EQU 8
DEF POPUP_NOTIF_FRAME_SPACE       EQU $FB

; wNotificationTimer
DEF NOTIFSTAGE_2_LOADGFX  EQU $88
DEF NOTIFSTAGE_3_SLIDEIN  EQU $85
DEF NOTIFSTAGE_4_VISIBLE  EQU $79
DEF NOTIFSTAGE_5_SLIDEOUT EQU $14

PlaceNotification:
	ld a, [wLandmarkSignTimer]
	and a
	ret nz

	ld a, [wNotifQueueReadPointer]
	ld c, a
	ld a, [wNotifQueueSetPointer]
	cp c
	ret z

	ld hl, wNotificationTimer
	ld a, [hl]
	and a
	jr z, .start_next_notif

	dec [hl]
	call z, NextNotification
	sub NOTIFSTAGE_2_LOADGFX
	jr nc, .stage_5_sliding_out
	add NOTIFSTAGE_2_LOADGFX
	cp NOTIFSTAGE_2_LOADGFX - 1
	ret nc

	sub NOTIFSTAGE_3_SLIDEIN
	jr c, .graphics_ok
	jr nz, LoadNotifGFX
	push hl
	call InitNotifFrame
	farcall HDMATransfer_OnlyTopFourRows
	pop hl

.graphics_ok
	ld a, [hl]
	cp NOTIFSTAGE_4_VISIBLE
	jr nc, .stage_3_sliding_in
	cp NOTIFSTAGE_5_SLIDEOUT
	jr c, .stage_5_sliding_out
	ld a, SCREEN_HEIGHT_PX - 4 * TILE_WIDTH
	jr .got_value

.stage_3_sliding_in
	sub NOTIFSTAGE_4_VISIBLE
	add a
	add SCREEN_HEIGHT_PX - 4 * TILE_WIDTH
	jr .got_value

.start_next_notif
	ld a, NOTIFSTAGE_2_LOADGFX
	ld [wNotificationTimer], a
	xor a
.stage_5_sliding_out
	add a
	cpl
	add SCREEN_HEIGHT_PX + TILE_WIDTH + 1
.got_value
	ldh [rWY], a
	ldh [hWY], a
	sub SCREEN_HEIGHT_PX
	ret nz
	ld hl, rIE
	res LCD_STAT, [hl]
	ldh [hLCDCPointer], a
	ret

LoadNotifGFX:
	ld hl, vTiles0 tile POPUP_NOTIF_FRAME_SPACE
	call GetOpaque1bppSpaceTile

	ld de, Signs ; TO-DO
	ld hl, vTiles0 tile POPUP_NOTIF_FRAME_START
	lb bc, Bank(Signs), POPUP_NOTIF_FRAME_SIZE ; TO-DO
	call Get2bpp

	ld hl, vTiles0 tile POPUP_NOTIF_TEXT_LINE_1_START
	ld e, POPUP_NOTIF_TEXT_LINE_SIZE * 2
.clear_loop
	push hl
	push de
	call GetOpaque1bppSpaceTile
	pop de
	pop hl
	ld bc, LEN_2BPP_TILE
	add hl, bc
	dec e
	jr nz, .clear_loop

	call GetNotificationText

	ld de, vTiles3 tile POPUP_NOTIF_TEXT_LINE_1_START
	ld hl, wStringBuffer4
	call .CopyLine

	ld de, vTiles3 tile POPUP_NOTIF_TEXT_LINE_2_START
	ld hl, wStringBuffer5
	call .CopyLine

	ld hl, SignPals ; TO-DO
	ld bc, 1 palettes
	ld de, wBGPals1 palette PAL_BG_TEXT
	call FarCopyColorWRAM
	jmp SetDefaultBGPAndOBP

.CopyLine	
	ld a, [hli]
	cp "@"
	ret z
	cp "^"
	ret z
	push hl
	cp " "
	jr nz, .not_space
	ld hl, TextboxSpaceGFX
	jr .got_tile

.not_space
	sub $80
	push hl
	ld h, 0
	ld l, a
	add hl, hl
	add hl, hl
	add hl, hl
	ld b, h
	ld c, l
	pop hl
	push de
	ld hl, Font
	pop de
	add hl, bc
.got_tile
	call SwapHLDE
	push hl
	call GetOpaque1bppFontTile
	pop hl
	ld bc, LEN_2BPP_TILE
	add hl, bc
	ld d, h
	ld e, l
	pop hl
	jr .CopyLine

InitNotifFrame:
IF 1
	hlcoord 0, 0, wAttrmap
	ld a, PRIORITY | PAL_BG_TEXT
	ld bc, SCREEN_WIDTH * 4
	rst ByteFill

	hlcoord 0, 0
	ld a, $BB
	ld bc, SCREEN_WIDTH
	rst ByteFill

	ld a, POPUP_NOTIF_FRAME_SPACE
	ld [hli], a
	ld a, POPUP_NOTIF_TEXT_LINE_1_START
	ld c, SCREEN_WIDTH - 2
	call .FillTextLine
	ld a, POPUP_NOTIF_FRAME_SPACE

	ld bc, SCREEN_WIDTH + 2
	rst ByteFill

	ld a, POPUP_NOTIF_TEXT_LINE_2_START
	ld c, SCREEN_WIDTH - 2
	call .FillTextLine
	ld a, POPUP_NOTIF_FRAME_SPACE
	ld [hli], a

	ret

.FillTextLine:
	ld [hli], a
	inc a
	dec c
	jr nz, .FillTextLine
	ret
ELSE
	hlcoord 0, 0, wAttrmap
	ld a, PRIORITY | PAL_BG_TEXT
	ld bc, SCREEN_WIDTH - 1
	rst ByteFill
	or X_FLIP
	ld [hli], a
	and ~X_FLIP
	ld [hli], a
	ld bc, SCREEN_WIDTH - 2
	rst ByteFill
	or X_FLIP
	ld [hli], a
	and ~X_FLIP
	ld bc, SCREEN_WIDTH - 1
	rst ByteFill
	or X_FLIP
	ld [hl], a

	hlcoord 0, 0
	ld a, POPUP_NOTIF_FRAME_START
	ld [hli], a
	inc a
	call .FillTopBottom
	dec a
	ld [hli], a
	ld a, POPUP_NOTIF_FRAME_START + 3
	ld [hli], a
	ld a, POPUP_NOTIF_TEXT_START
	ld c, SCREEN_WIDTH - 2
.middle_loop
	ld [hli], a
	inc a
	dec c
	jr nz, .middle_loop

	ld a, POPUP_NOTIF_FRAME_START + 4
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	call .FillTopBottom
	dec a
	ld [hl], a
	ret

.FillTopBottom:
	ld c, 5
	jr .start_loop

.cont_loop
	ld [hli], a
	ld [hli], a
.start_loop
	inc a
	ld [hli], a
	ld [hli], a
	dec a
	dec c
	jr nz, .cont_loop
	ret
ENDC

GetNotificationText:
	ld a, [wNotifQueueReadPointer]
	ld c, a
	ld b, 0
	ld hl, wNotifQueue
	add hl, bc
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld b, h
	ld c, l

	add a
	add LOW(Notifications)
	ld l, a
	ld a, HIGH(Notifications)
	adc 0
	ld h, a

	ld a, [hli]
	ld h, [hl]
	ld l, a

	jp hl

Notifications:
	dw Notif_None
	dw Notif_Pickup
	dw Notif_Test

Notif_None:
	ld de, .String
	jmp Notif_CopyLines

.String
	db "NOTIFICATION^@"
	db "^@"

Notif_Pickup:
	ld a, [bc]
	cp PARTY_LENGTH
	jr nc, .multiple

	ld hl, wPartyMonNicknames
	ld bc, NAME_LENGTH
	rst AddNTimes

	ld de, wStringBuffer1
	ld bc, NAME_LENGTH
	rst CopyBytes

	ld de, .String_Single
	jr Notif_CopyLines

.String_Single:
	db "<BUFFER1> picked^@"
	db "up an item.^@"

.multiple
	ld de, .String_Multiple
	jr Notif_CopyLines

.String_Multiple:
	db "Your #MON^@"
	db "picked up items.^@"

Notif_Test:
	ld a, [bc]
	ld l, a
	inc bc
	ld a, [bc]
	ld h, a
	call GetPokemonIDFromIndex
	ld [wNamedObjectIndex], a
	call GetPokemonName

	ld de, .String1
	jr Notif_CopyLines

	ret

.String1
	db "Your <BUFFER1> is^@"
	db "happy to see you!^@"

Notif_CopyLines:
	ld hl, wStringBuffer4
	rst PlaceString
	inc de
	ld hl, wStringBuffer5
	rst PlaceString
	ret

NextNotification:
	ld a, [wNotifQueueReadPointer]
	inc a
	and $F
	ld [wNotifQueueReadPointer], a

	ld a, 1
	ret

QueueNotification:
; queues a notification of type a w/ argument bc
	ld hl, wNotifQueueSetPointer
	ld e, [hl]
	inc [hl]
	inc hl
	ld d, 0
	add hl, de
	add hl, de
	add hl, de
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, b
	ld [hl], a
	ret

SkipNotification:
	ld a, [wNotificationTimer]
	and a
	ret z
	ld a, [wNotifQueueReadPointer]
	inc a
	ld [wNotifQueueReadPointer], a
	xor a
	ld [wNotificationTimer], a
	ret
