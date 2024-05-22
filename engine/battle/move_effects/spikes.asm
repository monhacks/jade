BattleCommand_spikes:
	ld hl, wEnemyScreens
	ldh a, [hBattleTurn]
	and a
	jr z, .got_screens
	ld hl, wPlayerScreens
.got_screens

; Fails if 3 layers of spikes are already put down
	ld a, [hl]
	and SCREENS_SPIKES_MASK
	cp SCREENS_SPIKES_3
	jr z, .failed

; Otherwise, increment spikes counter
	inc [hl]
	call AnimateCurrentMove
	ld hl, SpikesText
	jmp StdBattleTextbox

.failed
	jmp FailMove

BattleCommand_stealthrock:
	ld hl, wEnemyScreens
	ldh a, [hBattleTurn]
	and a
	jr z, .got_screens
	ld hl, wPlayerScreens
.got_screens

; Fails if rocks are already out
	bit SCREENS_STEALTH_ROCK, [hl]
	jr nz, .failed

; Otherwise, set
	set SCREENS_STEALTH_ROCK, [hl]
	call AnimateCurrentMove
	ld hl, StealthRockText
	jmp StdBattleTextbox

.failed
	jmp FailMove

BattleCommand_toxicspikes:
	ld hl, wEnemyScreens
	ldh a, [hBattleTurn]
	and a
	jr z, .got_screens
	ld hl, wPlayerScreens
.got_screens

; Fails if two layers already set
	ld a, [hl]
	and SCREENS_TOXIC_SPIKES_MASK
	cp SCREENS_TOXIC_SPIKES_2
	jr z, .failed

; Otherwise, set
	ld a, [hl]
	add SCREENS_TOXIC_SPIKES_1
	ld [hl], a
	call AnimateCurrentMove
	ld hl, ToxicSpikesText
	jmp StdBattleTextbox

.failed
	jmp FailMove
