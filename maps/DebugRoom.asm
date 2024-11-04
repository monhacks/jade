	object_const_def

DebugRoom_MapScripts:
	def_scene_scripts

	def_callbacks

DebugRoomBG_TestGenMon:
	jumptext .Text
.Text:
;             123456789123456789
	text "This is a test of"
	line "the new textbox"
	next "engine."
	done
;             123456789123456789
	para "Hopefully this"
	line "works ok and looks"
	next "good… Otherwise,"
	cont "I wasted a bunch"
	cont "of time for abso-"
	cont "lutely nothing!"
	done

DebugRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  5, OBSIDIAN_TOWN, 1

	def_coord_events

	def_bg_events
	bg_event  9,  5, BGEVENT_READ, DebugRoomBG_TestGenMon

	def_object_events

	def_berry_events
