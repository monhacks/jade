; sprite_anim_struct members (see macros/ram.asm)
rsreset
DEF SPRITEANIMSTRUCT_INDEX           rb ; 0
DEF SPRITEANIMSTRUCT_FRAMESET_ID     rb ; 1
DEF SPRITEANIMSTRUCT_ANIM_SEQ_ID     rb ; 2
DEF SPRITEANIMSTRUCT_TILE_ID         rb ; 3
DEF SPRITEANIMSTRUCT_XCOORD          rb ; 4
DEF SPRITEANIMSTRUCT_YCOORD          rb ; 5
DEF SPRITEANIMSTRUCT_XOFFSET         rb ; 6
DEF SPRITEANIMSTRUCT_YOFFSET         rb ; 7
DEF SPRITEANIMSTRUCT_DURATION        rb ; 8
DEF SPRITEANIMSTRUCT_DURATIONOFFSET  rb ; 9
DEF SPRITEANIMSTRUCT_FRAME           rb ; a
DEF SPRITEANIMSTRUCT_JUMPTABLE_INDEX rb ; b
DEF SPRITEANIMSTRUCT_VAR1            rb ; c
DEF SPRITEANIMSTRUCT_VAR2            rb ; d
DEF SPRITEANIMSTRUCT_VAR3            rb ; e
DEF SPRITEANIMSTRUCT_VAR4            rb ; f
DEF SPRITEANIMSTRUCT_LENGTH EQU _RS
DEF NUM_SPRITE_ANIM_STRUCTS EQU 10 ; see wSpriteAnimationStructs

; wSpriteAnimDict keys (see wram.asm)
; UnusedSpriteAnimGFX indexes (see data/sprite_anims/unused_gfx.asm)
	const_def
	const SPRITE_ANIM_DICT_DEFAULT      ; 0
	const_skip 4                        ; unused
	const SPRITE_ANIM_DICT_TEXT_CURSOR  ; 5
	const SPRITE_ANIM_DICT_GS_SPLASH    ; 6
	const SPRITE_ANIM_DICT_SLOTS        ; 7
	const SPRITE_ANIM_DICT_ARROW_CURSOR ; 8
DEF NUM_SPRITE_ANIM_GFX EQU const_value

; wSpriteAnimDict size (see wram.asm)
DEF NUM_SPRITEANIMDICT_ENTRIES EQU 10

; SpriteAnimObjects indexes (see data/sprite_anims/objects.asm)
	const_def
	const SPRITE_ANIM_OBJ_PARTY_MON                 ; 00
	const SPRITE_ANIM_OBJ_GS_TITLE_TRAIL            ; 01
	const SPRITE_ANIM_OBJ_NAMING_SCREEN_CURSOR      ; 02
	const SPRITE_ANIM_OBJ_GAMEFREAK_LOGO            ; 03
	const SPRITE_ANIM_OBJ_GS_GAMEFREAK_LOGO_STAR    ; 04
	const SPRITE_ANIM_OBJ_GS_GAMEFREAK_LOGO_SPARKLE ; 05
	const SPRITE_ANIM_OBJ_SLOTS_GOLEM               ; 06
	const SPRITE_ANIM_OBJ_SLOTS_CHANSEY             ; 07
	const SPRITE_ANIM_OBJ_SLOTS_EGG                 ; 08
	const SPRITE_ANIM_OBJ_COMPOSE_MAIL_CURSOR       ; 09
	const SPRITE_ANIM_OBJ_RED_WALK                  ; 0a
	const SPRITE_ANIM_OBJ_UNUSED_CURSOR             ; 0b
	const SPRITE_ANIM_OBJ_MEMORY_GAME_CURSOR        ; 0c
	const SPRITE_ANIM_OBJ_POKEGEAR_ARROW            ; 0d
	const SPRITE_ANIM_OBJ_TRADE_POKE_BALL           ; 0e
	const SPRITE_ANIM_OBJ_TRADE_POOF                ; 0f
	const SPRITE_ANIM_OBJ_TRADE_TUBE_BULGE          ; 10
	const SPRITE_ANIM_OBJ_TRADEMON_ICON             ; 11
	const SPRITE_ANIM_OBJ_TRADEMON_BUBBLE           ; 12
	const SPRITE_ANIM_OBJ_EVOLUTION_BALL_OF_LIGHT   ; 13
	const SPRITE_ANIM_OBJ_RADIO_TUNING_KNOB         ; 14
	const SPRITE_ANIM_OBJ_MAGNET_TRAIN              ; 15
	const SPRITE_ANIM_OBJ_LEAF                      ; 16
	const SPRITE_ANIM_OBJ_CUT_TREE                  ; 17
	const SPRITE_ANIM_OBJ_FLY_LEAF                  ; 18
	const SPRITE_ANIM_OBJ_EGG_CRACK                 ; 19
	const SPRITE_ANIM_OBJ_GS_INTRO_HO_OH_LUGIA      ; 1a
	const SPRITE_ANIM_OBJ_HEADBUTT                  ; 1b
	const SPRITE_ANIM_OBJ_EGG_HATCH                 ; 1c
	const SPRITE_ANIM_OBJ_EZCHAT_CURSOR             ; 1d
	const SPRITE_ANIM_OBJ_BLUE_WALK                 ; 1e
	const SPRITE_ANIM_OBJ_MOBILE_TRADE_SENT_BALL    ; 1f
	const SPRITE_ANIM_OBJ_MOBILE_TRADE_OT_BALL      ; 20
	const SPRITE_ANIM_OBJ_MOBILE_TRADE_CABLE_BULGE  ; 21
	const SPRITE_ANIM_OBJ_MOBILE_TRADE_SENT_PULSE   ; 22
	const SPRITE_ANIM_OBJ_MOBILE_TRADE_OT_PULSE     ; 23
	const SPRITE_ANIM_OBJ_MOBILE_TRADE_PING         ; 24
	const SPRITE_ANIM_OBJ_INTRO_SUICUNE             ; 25
	const SPRITE_ANIM_OBJ_INTRO_PICHU               ; 26
	const SPRITE_ANIM_OBJ_INTRO_WOOPER              ; 27
	const SPRITE_ANIM_OBJ_INTRO_UNOWN               ; 28
	const SPRITE_ANIM_OBJ_INTRO_UNOWN_F             ; 29
	const SPRITE_ANIM_OBJ_INTRO_SUICUNE_AWAY        ; 2a
	const SPRITE_ANIM_OBJ_CELEBI                    ; 2b
	const SPRITE_ANIM_OBJ_PC_CURSOR                 ; 2c
	const SPRITE_ANIM_OBJ_PC_QUICK                  ; 2d
	const SPRITE_ANIM_OBJ_PC_MODE                   ; 2e
	const SPRITE_ANIM_OBJ_PC_MODE2                  ; 2f
	const SPRITE_ANIM_OBJ_PC_PACK                   ; 30
DEF NUM_SPRITE_ANIM_OBJS EQU const_value

; DoSpriteAnimFrame.Jumptable indexes (see engine/sprite_anims/functions.asm)
	const_def
	const SPRITE_ANIM_FUNC_NULL                      ; 00
	const SPRITE_ANIM_FUNC_PARTY_MON                 ; 01
	const SPRITE_ANIM_FUNC_PARTY_MON_SWITCH          ; 02
	const SPRITE_ANIM_FUNC_PARTY_MON_SELECTED        ; 03
	const SPRITE_ANIM_FUNC_GS_TITLE_TRAIL            ; 04
	const SPRITE_ANIM_FUNC_NAMING_SCREEN_CURSOR      ; 05
	const SPRITE_ANIM_FUNC_GAMEFREAK_LOGO            ; 06
	const SPRITE_ANIM_FUNC_GS_GAMEFREAK_LOGO_STAR    ; 07
	const SPRITE_ANIM_FUNC_GS_GAMEFREAK_LOGO_SPARKLE ; 08
	const SPRITE_ANIM_FUNC_SLOTS_GOLEM               ; 09
	const SPRITE_ANIM_FUNC_SLOTS_CHANSEY             ; 0a
	const SPRITE_ANIM_FUNC_SLOTS_EGG                 ; 0b
	const SPRITE_ANIM_FUNC_MAIL_CURSOR               ; 0c
	const SPRITE_ANIM_FUNC_UNUSED_CURSOR             ; 0d
	const SPRITE_ANIM_FUNC_MEMORY_GAME_CURSOR        ; 0e
	const SPRITE_ANIM_FUNC_POKEGEAR_ARROW            ; 0f
	const SPRITE_ANIM_FUNC_TRADE_POKE_BALL           ; 10
	const SPRITE_ANIM_FUNC_TRADE_TUBE_BULGE          ; 11
	const SPRITE_ANIM_FUNC_TRADEMON_IN_TUBE          ; 12
	const SPRITE_ANIM_FUNC_REVEAL_NEW_MON            ; 13
	const SPRITE_ANIM_FUNC_RADIO_TUNING_KNOB         ; 14
	const SPRITE_ANIM_FUNC_CUT_LEAVES                ; 15
	const SPRITE_ANIM_FUNC_FLY_FROM                  ; 16
	const SPRITE_ANIM_FUNC_FLY_LEAF                  ; 17
	const SPRITE_ANIM_FUNC_FLY_TO                    ; 18
	const SPRITE_ANIM_FUNC_GS_INTRO_HO_OH_LUGIA      ; 19
	const SPRITE_ANIM_FUNC_EZCHAT_CURSOR             ; 1a
	const SPRITE_ANIM_FUNC_MOBILE_TRADE_SENT_PULSE   ; 1b
	const SPRITE_ANIM_FUNC_MOBILE_TRADE_OT_PULSE     ; 1c
	const SPRITE_ANIM_FUNC_INTRO_SUICUNE             ; 1d
	const SPRITE_ANIM_FUNC_INTRO_PICHU_WOOPER        ; 1e
	const SPRITE_ANIM_FUNC_CELEBI                    ; 1f
	const SPRITE_ANIM_FUNC_INTRO_UNOWN               ; 20
	const SPRITE_ANIM_FUNC_INTRO_UNOWN_F             ; 21
	const SPRITE_ANIM_FUNC_INTRO_SUICUNE_AWAY        ; 22
	const SPRITE_ANIM_FUNC_PC_CURSOR                 ; 23
	const SPRITE_ANIM_FUNC_PC_QUICK                  ; 24
	const SPRITE_ANIM_FUNC_PC_MODE                   ; 25
	const SPRITE_ANIM_FUNC_PC_PACK                   ; 26
DEF NUM_SPRITE_ANIM_FUNCS EQU const_value

; SpriteAnimFrameData indexes (see data/sprite_anims/framesets.asm)
	const_def
	const SPRITE_ANIM_FRAMESET_00                        ; 00
	const SPRITE_ANIM_FRAMESET_PARTY_MON                 ; 01
	const SPRITE_ANIM_FRAMESET_PARTY_MON_WITH_MAIL       ; 02
	const SPRITE_ANIM_FRAMESET_PARTY_MON_WITH_ITEM       ; 03
	const SPRITE_ANIM_FRAMESET_PARTY_MON_FAST            ; 04
	const SPRITE_ANIM_FRAMESET_PARTY_MON_WITH_MAIL_FAST  ; 05
	const SPRITE_ANIM_FRAMESET_PARTY_MON_WITH_ITEM_FAST  ; 06
	const SPRITE_ANIM_FRAMESET_GS_TITLE_TRAIL            ; 07
	const SPRITE_ANIM_FRAMESET_TEXT_ENTRY_CURSOR         ; 08
	const SPRITE_ANIM_FRAMESET_TEXT_ENTRY_CURSOR_BIG     ; 09
	const SPRITE_ANIM_FRAMESET_GAMEFREAK_LOGO            ; 0a
	const SPRITE_ANIM_FRAMESET_GS_GAMEFREAK_LOGO_STAR    ; 0b
	const SPRITE_ANIM_FRAMESET_GS_GAMEFREAK_LOGO_SPARKLE ; 0c
	const SPRITE_ANIM_FRAMESET_SLOTS_GOLEM               ; 0d
	const SPRITE_ANIM_FRAMESET_SLOTS_CHANSEY             ; 0e
	const SPRITE_ANIM_FRAMESET_SLOTS_CHANSEY_2           ; 0f
	const SPRITE_ANIM_FRAMESET_SLOTS_EGG                 ; 10
	const SPRITE_ANIM_FRAMESET_RED_WALK                  ; 11
	const SPRITE_ANIM_FRAMESET_STILL_CURSOR              ; 12
	const SPRITE_ANIM_FRAMESET_TRADE_POKE_BALL           ; 13
	const SPRITE_ANIM_FRAMESET_TRADE_POKE_BALL_WOBBLE    ; 14
	const SPRITE_ANIM_FRAMESET_TRADE_POOF                ; 15
	const SPRITE_ANIM_FRAMESET_TRADE_TUBE_BULGE          ; 16
	const SPRITE_ANIM_FRAMESET_TRADEMON_ICON             ; 17
	const SPRITE_ANIM_FRAMESET_TRADEMON_BUBBLE           ; 18
	const SPRITE_ANIM_FRAMESET_EVOLUTION_BALL_OF_LIGHT   ; 19
	const SPRITE_ANIM_FRAMESET_RADIO_TUNING_KNOB         ; 1a
	const SPRITE_ANIM_FRAMESET_MAGNET_TRAIN              ; 1b
	const SPRITE_ANIM_FRAMESET_UNUSED_1C                 ; 1c
	const SPRITE_ANIM_FRAMESET_LEAF                      ; 1d
	const SPRITE_ANIM_FRAMESET_CUT_TREE                  ; 1e
	const SPRITE_ANIM_FRAMESET_EGG_CRACK                 ; 1f
	const SPRITE_ANIM_FRAMESET_EGG_HATCH_1               ; 20
	const SPRITE_ANIM_FRAMESET_EGG_HATCH_2               ; 21
	const SPRITE_ANIM_FRAMESET_EGG_HATCH_3               ; 22
	const SPRITE_ANIM_FRAMESET_EGG_HATCH_4               ; 23
	const SPRITE_ANIM_FRAMESET_GS_INTRO_HO_OH_LUGIA      ; 24
	const SPRITE_ANIM_FRAMESET_HEADBUTT                  ; 25
	const SPRITE_ANIM_FRAMESET_EZCHAT_CURSOR_1           ; 26
	const SPRITE_ANIM_FRAMESET_EZCHAT_CURSOR_2           ; 27
	const SPRITE_ANIM_FRAMESET_EZCHAT_CURSOR_3           ; 28
	const SPRITE_ANIM_FRAMESET_EZCHAT_CURSOR_4           ; 29
	const SPRITE_ANIM_FRAMESET_EZCHAT_CURSOR_5           ; 2a
	const SPRITE_ANIM_FRAMESET_EZCHAT_CURSOR_6           ; 2b
	const SPRITE_ANIM_FRAMESET_EZCHAT_CURSOR_7           ; 2c
	const SPRITE_ANIM_FRAMESET_BLUE_WALK                 ; 2d
	const SPRITE_ANIM_FRAMESET_MOBILE_TRADE_SENT_BALL    ; 2e
	const SPRITE_ANIM_FRAMESET_MOBILE_TRADE_OT_BALL      ; 2f
	const SPRITE_ANIM_FRAMESET_MOBILE_TRADE_CABLE_BULGE  ; 30
	const SPRITE_ANIM_FRAMESET_MOBILE_TRADE_SENT_PULSE   ; 31
	const SPRITE_ANIM_FRAMESET_MOBILE_TRADE_OT_PULSE     ; 32
	const SPRITE_ANIM_FRAMESET_MOBILE_TRADE_PING         ; 33
	const SPRITE_ANIM_FRAMESET_INTRO_SUICUNE             ; 34
	const SPRITE_ANIM_FRAMESET_INTRO_SUICUNE_2           ; 35
	const SPRITE_ANIM_FRAMESET_INTRO_PICHU               ; 36
	const SPRITE_ANIM_FRAMESET_INTRO_WOOPER              ; 37
	const SPRITE_ANIM_FRAMESET_INTRO_UNOWN_1             ; 38
	const SPRITE_ANIM_FRAMESET_INTRO_UNOWN_2             ; 39
	const SPRITE_ANIM_FRAMESET_INTRO_UNOWN_3             ; 3a
	const SPRITE_ANIM_FRAMESET_INTRO_UNOWN_4             ; 3b
	const SPRITE_ANIM_FRAMESET_INTRO_UNOWN_F_2           ; 3c
	const SPRITE_ANIM_FRAMESET_INTRO_SUICUNE_AWAY        ; 3d
	const SPRITE_ANIM_FRAMESET_INTRO_UNOWN_F             ; 3e
	const SPRITE_ANIM_FRAMESET_CELEBI_LEFT               ; 3f
	const SPRITE_ANIM_FRAMESET_CELEBI_RIGHT              ; 40
	const SPRITE_ANIM_FRAMESET_PC_CURSOR                 ; 41
	const SPRITE_ANIM_FRAMESET_PC_CURSOR_ITEM            ; 42
	const SPRITE_ANIM_FRAMESET_PC_QUICK                  ; 43
	const SPRITE_ANIM_FRAMESET_PC_MODE                   ; 44
	const SPRITE_ANIM_FRAMESET_PC_MODE2                  ; 45
	const SPRITE_ANIM_FRAMESET_PC_PACK                   ; 46
DEF NUM_SPRITE_ANIM_FRAMESETS EQU const_value

; SpriteAnimOAMData indexes (see data/sprite_anims/oam.asm)
	const_def
	const SPRITE_ANIM_OAMSET_RED_WALK_1                  ; 00
	const SPRITE_ANIM_OAMSET_RED_WALK_2                  ; 01
	const SPRITE_ANIM_OAMSET_GS_INTRO_BUBBLE_1           ; 02
	const SPRITE_ANIM_OAMSET_GS_INTRO_BUBBLE_2           ; 03
	const SPRITE_ANIM_OAMSET_GS_INTRO_SHELLDER_1         ; 04
	const SPRITE_ANIM_OAMSET_GS_INTRO_SHELLDER_2         ; 05
	const SPRITE_ANIM_OAMSET_GS_INTRO_MAGIKARP_1         ; 06
	const SPRITE_ANIM_OAMSET_GS_INTRO_MAGIKARP_2         ; 07
	const SPRITE_ANIM_OAMSET_GS_INTRO_UNUSED_LAPRAS      ; 08
	const SPRITE_ANIM_OAMSET_GS_INTRO_LAPRAS_1           ; 09
	const SPRITE_ANIM_OAMSET_GS_INTRO_LAPRAS_2           ; 0a
	const SPRITE_ANIM_OAMSET_GS_INTRO_LAPRAS_3           ; 0b
	const SPRITE_ANIM_OAMSET_GS_INTRO_NOTE               ; 0c
	const SPRITE_ANIM_OAMSET_GS_INTRO_INVISIBLE_NOTE     ; 0d
	const SPRITE_ANIM_OAMSET_GS_INTRO_JIGGLYPUFF_1       ; 0e
	const SPRITE_ANIM_OAMSET_GS_INTRO_JIGGLYPUFF_2       ; 0f
	const SPRITE_ANIM_OAMSET_GS_INTRO_JIGGLYPUFF_3       ; 10
	const SPRITE_ANIM_OAMSET_GS_INTRO_PIKACHU_1          ; 11
	const SPRITE_ANIM_OAMSET_GS_INTRO_PIKACHU_2          ; 12
	const SPRITE_ANIM_OAMSET_GS_INTRO_PIKACHU_3          ; 13
	const SPRITE_ANIM_OAMSET_GS_INTRO_PIKACHU_4          ; 14
	const SPRITE_ANIM_OAMSET_GS_INTRO_PIKACHU_TAIL_1     ; 15
	const SPRITE_ANIM_OAMSET_GS_INTRO_PIKACHU_TAIL_2     ; 16
	const SPRITE_ANIM_OAMSET_GS_INTRO_PIKACHU_TAIL_3     ; 17
	const SPRITE_ANIM_OAMSET_GS_INTRO_SMALL_FIREBALL     ; 18
	const SPRITE_ANIM_OAMSET_GS_INTRO_MED_FIREBALL       ; 19
	const SPRITE_ANIM_OAMSET_GS_INTRO_BIG_FIREBALL       ; 1a
	const SPRITE_ANIM_OAMSET_GS_INTRO_CHIKORITA          ; 1b
	const SPRITE_ANIM_OAMSET_GS_INTRO_CYNDAQUIL          ; 1c
	const SPRITE_ANIM_OAMSET_GS_INTRO_TOTODILE           ; 1d
	const SPRITE_ANIM_OAMSET_GS_TITLE_TRAIL_1            ; 1e
	const SPRITE_ANIM_OAMSET_GS_TITLE_TRAIL_2            ; 1f
	const SPRITE_ANIM_OAMSET_TEXT_ENTRY_CURSOR           ; 20
	const SPRITE_ANIM_OAMSET_TEXT_ENTRY_CURSOR_BIG       ; 21
	const SPRITE_ANIM_OAMSET_GS_GAMEFREAK_LOGO           ; 22
	const SPRITE_ANIM_OAMSET_GS_GAMEFREAK_LOGO_STAR      ; 23
	const SPRITE_ANIM_OAMSET_GS_GAMEFREAK_LOGO_SPARKLE_1 ; 24
	const SPRITE_ANIM_OAMSET_GS_GAMEFREAK_LOGO_SPARKLE_2 ; 25
	const SPRITE_ANIM_OAMSET_GS_GAMEFREAK_LOGO_SPARKLE_3 ; 26
	const SPRITE_ANIM_OAMSET_SLOTS_GOLEM_1               ; 27
	const SPRITE_ANIM_OAMSET_SLOTS_GOLEM_2               ; 28
	const SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_1             ; 29
	const SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_2             ; 2a
	const SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_3             ; 2b
	const SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_4             ; 2c
	const SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_5             ; 2d
	const SPRITE_ANIM_OAMSET_SLOTS_EGG                   ; 2e
	const SPRITE_ANIM_OAMSET_STILL_CURSOR                ; 2f
	const SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_1           ; 30
	const SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_2           ; 31
	const SPRITE_ANIM_OAMSET_TRADE_POOF_1                ; 32
	const SPRITE_ANIM_OAMSET_TRADE_POOF_2                ; 33
	const SPRITE_ANIM_OAMSET_TRADE_POOF_3                ; 34
	const SPRITE_ANIM_OAMSET_TRADE_TUBE_BULGE_1          ; 35
	const SPRITE_ANIM_OAMSET_TRADE_TUBE_BULGE_2          ; 36
	const SPRITE_ANIM_OAMSET_TRADEMON_ICON_1             ; 37
	const SPRITE_ANIM_OAMSET_TRADEMON_ICON_2             ; 38
	const SPRITE_ANIM_OAMSET_TRADEMON_BUBBLE             ; 39
	const SPRITE_ANIM_OAMSET_EVOLUTION_BALL_OF_LIGHT_1   ; 3a
	const SPRITE_ANIM_OAMSET_EVOLUTION_BALL_OF_LIGHT_2   ; 3b
	const SPRITE_ANIM_OAMSET_RADIO_TUNING_KNOB           ; 3c
	const SPRITE_ANIM_OAMSET_PARTY_MON_WITH_MAIL_1       ; 3d
	const SPRITE_ANIM_OAMSET_PARTY_MON_WITH_MAIL_2       ; 3e
	const SPRITE_ANIM_OAMSET_PARTY_MON_WITH_ITEM_1       ; 3f
	const SPRITE_ANIM_OAMSET_PARTY_MON_WITH_ITEM_2       ; 40
	const SPRITE_ANIM_OAMSET_MAGNET_TRAIN_1              ; 41
	const SPRITE_ANIM_OAMSET_MAGNET_TRAIN_2              ; 42
	const SPRITE_ANIM_OAMSET_UNUSED_43                   ; 43
	const SPRITE_ANIM_OAMSET_UNUSED_44                   ; 44
	const SPRITE_ANIM_OAMSET_UNUSED_45                   ; 45
	const SPRITE_ANIM_OAMSET_UNUSED_46                   ; 46
	const SPRITE_ANIM_OAMSET_UNUSED_47                   ; 47
	const SPRITE_ANIM_OAMSET_UNUSED_48                   ; 48
	const SPRITE_ANIM_OAMSET_UNUSED_49                   ; 49
	const SPRITE_ANIM_OAMSET_UNUSED_4A                   ; 4a
	const SPRITE_ANIM_OAMSET_UNUSED_4B                   ; 4b
	const SPRITE_ANIM_OAMSET_UNUSED_4C                   ; 4c
	const SPRITE_ANIM_OAMSET_UNUSED_4D                   ; 4d
	const SPRITE_ANIM_OAMSET_UNUSED_4E                   ; 4e
	const SPRITE_ANIM_OAMSET_LEAF                        ; 4f
	const SPRITE_ANIM_OAMSET_TREE_1                      ; 50
	const SPRITE_ANIM_OAMSET_CUT_TREE_2                  ; 51
	const SPRITE_ANIM_OAMSET_CUT_TREE_3                  ; 52
	const SPRITE_ANIM_OAMSET_CUT_TREE_4                  ; 53
	const SPRITE_ANIM_OAMSET_EGG_CRACK                   ; 54
	const SPRITE_ANIM_OAMSET_EGG_HATCH                   ; 55
	const SPRITE_ANIM_OAMSET_GS_INTRO_HO_OH_LUGIA_1      ; 56
	const SPRITE_ANIM_OAMSET_GS_INTRO_HO_OH_LUGIA_2      ; 57
	const SPRITE_ANIM_OAMSET_GS_INTRO_HO_OH_LUGIA_3      ; 58
	const SPRITE_ANIM_OAMSET_GS_INTRO_HO_OH_LUGIA_4      ; 59
	const SPRITE_ANIM_OAMSET_GS_INTRO_HO_OH_LUGIA_5      ; 5a
	const SPRITE_ANIM_OAMSET_HEADBUTT_TREE_2             ; 5b
	const SPRITE_ANIM_OAMSET_EZCHAT_CURSOR_1             ; 5c
	const SPRITE_ANIM_OAMSET_EZCHAT_CURSOR_2             ; 5d
	const SPRITE_ANIM_OAMSET_EZCHAT_CURSOR_3             ; 5e
	const SPRITE_ANIM_OAMSET_EZCHAT_CURSOR_4             ; 5f
	const SPRITE_ANIM_OAMSET_EZCHAT_CURSOR_5             ; 60
	const SPRITE_ANIM_OAMSET_EZCHAT_CURSOR_6             ; 61
	const SPRITE_ANIM_OAMSET_EZCHAT_CURSOR_7             ; 62
	const SPRITE_ANIM_OAMSET_BLUE_WALK_1                 ; 63
	const SPRITE_ANIM_OAMSET_BLUE_WALK_2                 ; 64
	const SPRITE_ANIM_OAMSET_MOBILE_TRADE_CABLE_BULGE_1  ; 65
	const SPRITE_ANIM_OAMSET_MOBILE_TRADE_CABLE_BULGE_2  ; 66
	const SPRITE_ANIM_OAMSET_MOBILE_TRADE_PING_1         ; 67
	const SPRITE_ANIM_OAMSET_MOBILE_TRADE_PING_2         ; 68
	const SPRITE_ANIM_OAMSET_MOBILE_TRADE_PING_3         ; 69
	const SPRITE_ANIM_OAMSET_MOBILE_TRADE_SENT_PULSE     ; 6a
	const SPRITE_ANIM_OAMSET_MOBILE_TRADE_OT_PULSE       ; 6b
	const SPRITE_ANIM_OAMSET_INTRO_SUICUNE_1             ; 6c
	const SPRITE_ANIM_OAMSET_INTRO_SUICUNE_2             ; 6d
	const SPRITE_ANIM_OAMSET_INTRO_SUICUNE_3             ; 6e
	const SPRITE_ANIM_OAMSET_INTRO_SUICUNE_4             ; 6f
	const SPRITE_ANIM_OAMSET_INTRO_PICHU_1               ; 70
	const SPRITE_ANIM_OAMSET_INTRO_PICHU_2               ; 71
	const SPRITE_ANIM_OAMSET_INTRO_PICHU_3               ; 72
	const SPRITE_ANIM_OAMSET_INTRO_WOOPER                ; 73
	const SPRITE_ANIM_OAMSET_INTRO_UNOWN_1               ; 74
	const SPRITE_ANIM_OAMSET_INTRO_UNOWN_2               ; 75
	const SPRITE_ANIM_OAMSET_INTRO_UNOWN_3               ; 76
	const SPRITE_ANIM_OAMSET_INTRO_UNOWN_F_2_1           ; 77
	const SPRITE_ANIM_OAMSET_INTRO_UNOWN_F_2_2           ; 78
	const SPRITE_ANIM_OAMSET_INTRO_UNOWN_F_2_3           ; 79
	const SPRITE_ANIM_OAMSET_INTRO_UNOWN_F_2_4           ; 7a
	const SPRITE_ANIM_OAMSET_INTRO_UNOWN_F_2_5           ; 7b
	const SPRITE_ANIM_OAMSET_INTRO_SUICUNE_AWAY          ; 7c
	const SPRITE_ANIM_OAMSET_CELEBI_1                    ; 7d
	const SPRITE_ANIM_OAMSET_CELEBI_2                    ; 7e
	const SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_1            ; 7f
	const SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_2            ; 80
	const SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_3            ; 81
	const SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_4            ; 82
	const SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_5            ; 83
	const SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_6            ; 84
	const SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_7            ; 85
	const SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_8            ; 86
	const SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_9            ; 87
	const SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_10           ; 88
	const SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_11           ; 89
	const SPRITE_ANIM_OAMSET_PARTY_MON_1                 ; 8a
	const SPRITE_ANIM_OAMSET_PARTY_MON_2                 ; 8b
	const SPRITE_ANIM_OAMSET_PC_CURSOR                   ; 8c
	const SPRITE_ANIM_OAMSET_PC_CURSOR_ITEM              ; 8d
	const SPRITE_ANIM_OAMSET_PC_QUICK                    ; 8e
	const SPRITE_ANIM_OAMSET_PC_MODE                     ; 8f
	const SPRITE_ANIM_OAMSET_PC_MODE2                    ; 90
	const SPRITE_ANIM_OAMSET_PC_PACK                     ; 91
DEF NUM_SPRITE_ANIM_OAMSETS EQU const_value

assert NUM_SPRITE_ANIM_OAMSETS <= FIRST_OAM_CMD, \
	"SPRITE_ANIM_OAMSET_* constants overlap oam*_command constants"
