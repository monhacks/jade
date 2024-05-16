BattleCommand_selfdestruct:
	farcall GetUserAbility
	cp DAMP
	jr z, .fail_user
	farcall GetOpponentAbility
	cp DAMP
	jr z, .fail_opp

	farcall PlayerStats_Selfdestruct
	ld a, BATTLEANIM_PLAYER_DAMAGE
	ld [wNumHits], a
	ld c, 3
	call DelayFrames
	ld a, BATTLE_VARS_STATUS
	call GetBattleVarAddr
	xor a
	ld [hli], a
	inc hl
	ld [hli], a
	ld [hl], a
	ld a, $1
	ld [wBattleAnimParam], a
	call BattleCommand_lowersub
	call LoadMoveAnim
	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVarAddr
	res SUBSTATUS_LEECH_SEED, [hl]
	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVarAddr
	res SUBSTATUS_DESTINY_BOND, [hl]
	call _CheckBattleScene
	ret nc
	farcall DrawPlayerHUD
	farcall DrawEnemyHUD
	call WaitBGMap
	jmp RefreshBattleHuds

.fail_user
	farcall AnimateUserAbility
	jr .fail

.fail_opp
	farcall AnimateOppAbility
.fail
	call AnimateFailedMove
	call PrintButItFailed
	jmp EndMoveEffect
