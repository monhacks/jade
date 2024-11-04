	object_const_def

DebugRoom_MapScripts:
	def_scene_scripts

	def_callbacks

DebugRoomBG_TestGenMon:
	jumptext .Text
.Text:
;             123456789123456789
	text "This is a test of"
	feed "the new textbox"
	feed "engine."
;             123456789123456789
	para "Hopefully this"
	feed "works ok and looks"
	feed "good… Otherwise,"
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
