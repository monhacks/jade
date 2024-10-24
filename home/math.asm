SimpleMultiply::
; Return a * c.
	and a
	ret z

	push bc
	ld b, a
	xor a
.loop
	add c
	dec b
	jr nz, .loop
	pop bc
	ret

SimpleDivide::
; Divide a by c. Return quotient b and remainder a.
; Check for divide-by-zero
	ld b, a
	ld a, c
	and a
	jp z, Crash_div0
	ld a, b
	ld b, 0
.loop
	inc b
	sub c
	jr nc, .loop
	dec b
	add c
	ret

Multiply::
; Multiply hMultiplicand (3 bytes) by hMultiplier. Result in hProduct.
; All values are big endian.
	push hl
	push de
	push bc

	farcall _Multiply

	jmp PopBCDEHL

Divide::
; Divide hDividend length b (max 4 bytes) by hDivisor. Result in hQuotient.
; All values are big endian.
; Check for divide-by-zero
	ldh a, [hDivisor]
	and a
	jp z, Crash_div0
	push hl
	push de
	push bc
	farcall _Divide
	jmp PopBCDEHL
