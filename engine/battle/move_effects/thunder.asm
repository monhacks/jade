BattleCommand_thunderaccuracy:
; halve accuracy in sun
; rain check is handled in checkhit
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVarAddr
	inc hl
	farcall GetBattleWeather
	cp WEATHER_SUN
	ret nz
	ld [hl], 50 percent + 1
	ret
