; LCD handling

LCDGeneric::
	push af
; At this point it's assumed we're in BANK(wLYOverrides)!
	push bc
	ldh a, [rLY]
	cp SCREEN_HEIGHT_PX
	jr c, .continue
	xor a
.continue
	ld c, a
	ld b, HIGH(wLYOverrides)
	ld a, [bc]
	ld b, a
	ldh a, [hLCDCPointer]
	ld c, a
	ld a, b
	ldh [c], a
	pop bc
	pop af
	reti

TextboxHBlank::
	push af
	ldh a, [rLY]
	cp 107
	jr c, .done
	sub 107
	cp 21
	jr c, .continue
	ld a, 20
.continue
	push hl
	add LOW(.ScrollValues)
	ld l, a
	ld h, HIGH(.ScrollValues)
	ld a, [hl]
	ldh [rSCY], a
	pop hl
.done
	pop af
	reti

.ScrollValues:
REPT 8
	db 4
ENDR
	db -12, -12
REPT 8
	db 2
ENDR
	db -20, -20
	db 0

DisableLCD::
; Turn the LCD off

; Don't need to do anything if the LCD is already off
	ldh a, [rLCDC]
	bit rLCDC_ENABLE, a
	ret z

	xor a
	ldh [rIF], a
	ldh a, [rIE]
	ld b, a

; Disable VBlank
	res VBLANK, a
	ldh [rIE], a

.wait
; Wait until VBlank would normally happen
	ldh a, [rLY]
	cp LY_VBLANK + 1
	jr nz, .wait

	ldh a, [rLCDC]
	and ~(1 << rLCDC_ENABLE)
	ldh [rLCDC], a

	xor a
	ldh [rIF], a
	ld a, b
	ldh [rIE], a
	ret

EnableLCD::
	ldh a, [rLCDC]
	set rLCDC_ENABLE, a
	ldh [rLCDC], a
	ret
