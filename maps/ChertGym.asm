	object_const_def

ChertGym_MapScripts:
	def_scene_scripts

	def_callbacks

ChertGymBG_Statue:
	gettrainername STRING_BUFFER_4, KATRINA, KATRINA1
	checkflag ENGINE_BADGE1
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	jumpstd GymStatue2Script

ChertGymOB_Trixie:
	faceplayer
	opentext
	checkevent EVENT_TRAINER_KATRINA
	iftrue .Done
	writetext .Text_PreBattle
	waitbutton
	closetext
	winlosstext .Text_Win, 0
	loadtrainer KATRINA, KATRINA1
	startbattle
	reloadmapafterbattle
	setevent EVENT_TRAINER_KATRINA
	opentext
	writetext .Text_GotBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_BADGE1
.Done:
	checkevent EVENT_GOT_TM_CONFIDE
	iftrue .GotTM
	setevent EVENT_TRAINER_YOUNGSTER_JUSTIN
	setevent EVENT_TRAINER_BUG_CATCHER_GEOFF
	setevent EVENT_TRAINER_LASS_LILLY
	writetext .Text_BadgeExplanation
	promptbutton
	verbosegiveitem TM_CONFIDE
	iffalse .NoRoom
	setevent EVENT_GOT_TM_CONFIDE
	writetext .Text_Confide
	waitbutton
	closetext
	end

.GotTM:
	writetext .Text_After
	waitbutton
.NoRoom:
	closetext
	end

.Text_PreBattle:
	text "SEEN"
	done

.Text_Win:
	text "WIN"
	done

.Text_GotBadge:
	text "BADGE"
	done

.Text_BadgeExplanation:
	text "BADGE INFO"
	done

.Text_Confide:
	text "CONFIDE"
	done

.Text_After:
	text "AFTER"
	done

ChertGymOB_Danpei:
	opentext
	faceplayer
	checkevent EVENT_TRAINER_KATRINA
	iftrue .After
	writetext .Text_Help
	waitbutton
	closetext
	end

.After
	writetext .Text_Congrats
	waitbutton
	closetext
	end

.Text_Help:
	text "HELP"
	done
.Text_Congrats:
	text "CONGRATS"
	done

Trainer_YoungsterJustin:
	trainer YOUNGSTER, YOUNGSTER_JUSTIN, EVENT_TRAINER_YOUNGSTER_JUSTIN, .SeenText, .BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext .AfterText
	waitbutton
	closetext
	end
.SeenText:
	text "SEEN"
	done
.BeatenText:
	text "BEAT"
	done
.AfterText:
	text "OVER"
	done

Trainer_BugCatcher_Geoff:
	trainer BUG_CATCHER, BUG_CATCHER_GEOFF, EVENT_TRAINER_BUG_CATCHER_GEOFF, .SeenText, .BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext .AfterText
	waitbutton
	closetext
	end
.SeenText:
	text "SEEN"
	done
.BeatenText:
	text "BEAT"
	done
.AfterText:
	text "OVER"
	done

Trainer_LassLilly:
	trainer LASS, LASS_LILLY, EVENT_TRAINER_LASS_LILLY, .SeenText, .BeatenText, 0, .Script
.Script:
	endifjustbattled
	opentext
	writetext .AfterText
	waitbutton
	closetext
	end
.SeenText:
	text "SEEN"
	done
.BeatenText:
	text "BEAT"
	done
.AfterText:
	text "OVER"
	done

ChertGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6, 13, CHERT_CITY, 5
	warp_event  7, 13, CHERT_CITY, 5

	def_coord_events

	def_bg_events
	bg_event  5, 11, BGEVENT_READ, ChertGymBG_Statue
	bg_event  8, 11, BGEVENT_READ, ChertGymBG_Statue

	def_object_events
	object_event  6,  1, SPRITE_FALKNER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ChertGymOB_Trixie, -1
	object_event  7, 11, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ChertGymOB_Danpei, -1
	object_event  3,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, Trainer_YoungsterJustin, -1
	object_event  7,  6, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, Trainer_BugCatcher_Geoff, -1
	object_event 11,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, Trainer_LassLilly, -1

	def_berry_events
