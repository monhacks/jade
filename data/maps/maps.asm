MACRO map
;\1: map name: for the MapAttributes pointer (see data/maps/attributes.asm)
;\2: tileset: a TILESET_* constant
;\3: environment: TOWN, ROUTE, INDOOR, CAVE, ENVIRONMENT_5, GATE, or DUNGEON
;\4: location: a LANDMARK_* constant
;\5: music: a MUSIC_* constant
;\6: phone service flag: TRUE to prevent phone calls
;\7: time of day: a PALETTE_* constant
;\8: fishing group: a FISHGROUP_* constant
	db BANK(\1_MapAttributes), \2, \3
	dw \1_MapAttributes
	db \4, \5
	dn \6, \7
	db \8
ENDM

MapGroupPointers::
; pointers to the first map of each map group
	table_width 2, MapGroupPointers
	dw MapGroup_CableClub   ;  1
	dw MapGroup_Dungeons    ;  2
	dw MapGroup_Obsidian    ;  3
	dw MapGroup_Shale       ;  4
	dw MapGroup_City03      ;  5
	dw MapGroup_City04      ;  6
	dw MapGroup_Coquina     ;  7
	dw MapGroup_Town06      ;  8
	dw MapGroup_City05      ;  9
	dw MapGroup_Town08      ; 10
	dw MapGroup_Town09      ; 11
	dw MapGroup_City10      ; 12
	dw MapGroup_City11      ; 13
	dw MapGroup_Town12      ; 14
	dw MapGroup_City13      ; 15
	assert_table_length NUM_MAP_GROUPS

MapGroup_CableClub:
	table_width MAP_LENGTH, MapGroup_CableClub
	map Pokecenter2F, TILESET_POKECENTER, INDOOR, LANDMARK_SPECIAL, MUSIC_POKEMON_CENTER, TRUE, PALETTE_DAY, FISHGROUP_SHORE
	map TradeCenter, TILESET_GATE, INDOOR, LANDMARK_SPECIAL, MUSIC_CHERRYGROVE_CITY, TRUE, PALETTE_DAY, FISHGROUP_SHORE
	map Colosseum, TILESET_GATE, INDOOR, LANDMARK_SPECIAL, MUSIC_CHERRYGROVE_CITY, TRUE, PALETTE_DAY, FISHGROUP_SHORE
	map TimeCapsule, TILESET_GATE, INDOOR, LANDMARK_SPECIAL, MUSIC_CHERRYGROVE_CITY, TRUE, PALETTE_DAY, FISHGROUP_SHORE
IF DEF(_DEBUG)
	map DebugRoom, TILESET_KANTO, TOWN, LANDMARK_OBSIDIAN_TOWN, MUSIC_OBSIDIAN_TOWN, TRUE, PALETTE_AUTO, FISHGROUP_SHORE
ENDC
	assert_table_length NUM_CABLE_CLUB_MAPS

MapGroup_Dungeons:
	table_width MAP_LENGTH, MapGroup_Dungeons
	map VictoryRoad, TILESET_CAVE, CAVE, LANDMARK_VICTORY_ROAD, MUSIC_VICTORY_ROAD, TRUE, PALETTE_NITE, FISHGROUP_SHORE
	assert_table_length NUM_DUNGEONS_MAPS

MapGroup_Obsidian:
	table_width MAP_LENGTH, MapGroup_Obsidian
	map ObsidianTown, TILESET_JOHTO, TOWN, LANDMARK_OBSIDIAN_TOWN, MUSIC_OBSIDIAN_TOWN, FALSE, PALETTE_AUTO, FISHGROUP_OCEAN
	map ObsidianMeadow, TILESET_JOHTO, ROUTE, LANDMARK_OBSIDIAN_MEADOW, MUSIC_OBSIDIAN_TOWN, FALSE, PALETTE_AUTO, FISHGROUP_OCEAN
	map RouteN01, TILESET_JOHTO, ROUTE, LANDMARK_ROUTE_N01, MUSIC_ROUTE_29, FALSE, PALETTE_AUTO, FISHGROUP_OCEAN
	map PlayersHouse1F, TILESET_PLAYERS_HOUSE, INDOOR, LANDMARK_OBSIDIAN_TOWN, MUSIC_OBSIDIAN_TOWN, FALSE, PALETTE_DAY, FISHGROUP_SHORE
	map PlayersHouse2F, TILESET_PLAYERS_ROOM, INDOOR, LANDMARK_OBSIDIAN_TOWN, MUSIC_OBSIDIAN_TOWN, FALSE, PALETTE_DAY, FISHGROUP_SHORE
	map ParksLab, TILESET_LAB, INDOOR, LANDMARK_OBSIDIAN_TOWN, MUSIC_PROF_ELM, FALSE, PALETTE_DAY, FISHGROUP_SHORE
	map RivalsHouse, TILESET_PLAYERS_HOUSE, INDOOR, LANDMARK_OBSIDIAN_TOWN, MUSIC_OBSIDIAN_TOWN, FALSE, PALETTE_DAY, FISHGROUP_SHORE
	assert_table_length NUM_OBSIDIAN_MAPS

MapGroup_Shale:
	table_width MAP_LENGTH, MapGroup_Shale
	map ShaleCity, TILESET_JOHTO, TOWN, LANDMARK_SHALE_CITY, MUSIC_CHERRYGROVE_CITY, FALSE, PALETTE_AUTO, FISHGROUP_OCEAN
	map RouteN02, TILESET_JOHTO, ROUTE, LANDMARK_ROUTE_N02, MUSIC_ROUTE_26, FALSE, PALETTE_AUTO, FISHGROUP_SHORE
	map ShalePokecenter1F, TILESET_POKECENTER, INDOOR, LANDMARK_SHALE_CITY, MUSIC_POKEMON_CENTER, FALSE, PALETTE_DAY, FISHGROUP_SHORE
	map ShaleMart, TILESET_MART, INDOOR, LANDMARK_SHALE_CITY, MUSIC_CHERRYGROVE_CITY, FALSE, PALETTE_DAY, FISHGROUP_SHORE
	map ShaleHouse1, TILESET_HOUSE, INDOOR, LANDMARK_SHALE_CITY, MUSIC_CHERRYGROVE_CITY, FALSE, PALETTE_DAY, FISHGROUP_SHORE
	map ShaleHouse2, TILESET_HOUSE, INDOOR, LANDMARK_SHALE_CITY, MUSIC_CHERRYGROVE_CITY, FALSE, PALETTE_DAY, FISHGROUP_SHORE
	assert_table_length NUM_SHALE_MAPS

MapGroup_City03:
	table_width MAP_LENGTH, MapGroup_City03
	map City03, TILESET_JOHTO, TOWN, LANDMARK_CITY_03, MUSIC_VIRIDIAN_CITY, FALSE, PALETTE_AUTO, FISHGROUP_SHORE
	map RouteN03, TILESET_JOHTO, ROUTE, LANDMARK_ROUTE_N03, MUSIC_ROUTE_26, FALSE, PALETTE_AUTO, FISHGROUP_SHORE
	map RouteN08, TILESET_JOHTO, ROUTE, LANDMARK_ROUTE_N08, MUSIC_ROUTE_26, FALSE, PALETTE_AUTO, FISHGROUP_SHORE
	map RouteN09, TILESET_JOHTO, ROUTE, LANDMARK_ROUTE_N09, MUSIC_ROUTE_26, FALSE, PALETTE_AUTO, FISHGROUP_SHORE
	assert_table_length NUM_CITY03_MAPS

MapGroup_City04:
	table_width MAP_LENGTH, MapGroup_City04
	map City04, TILESET_JOHTO, TOWN, LANDMARK_CITY_04, MUSIC_VIRIDIAN_CITY, FALSE, PALETTE_AUTO, FISHGROUP_SHORE
	map RouteN04, TILESET_JOHTO, ROUTE, LANDMARK_ROUTE_N04, MUSIC_ROUTE_26, FALSE, PALETTE_AUTO, FISHGROUP_SHORE
	assert_table_length NUM_CITY04_MAPS

MapGroup_Coquina:
	table_width MAP_LENGTH, MapGroup_Coquina
	map CoquinaTown, TILESET_JOHTO, TOWN, LANDMARK_COQUINA_TOWN, MUSIC_VIRIDIAN_CITY, FALSE, PALETTE_AUTO, FISHGROUP_SHORE
	map RouteN06, TILESET_JOHTO, ROUTE, LANDMARK_ROUTE_N06, MUSIC_ROUTE_26, FALSE, PALETTE_AUTO, FISHGROUP_SHORE
	map RouteN07, TILESET_JOHTO, ROUTE, LANDMARK_ROUTE_N07, MUSIC_ROUTE_26, FALSE, PALETTE_AUTO, FISHGROUP_SHORE
	assert_table_length NUM_COQUINA_MAPS

MapGroup_Town06:
	table_width MAP_LENGTH, MapGroup_Town06
	map Town06, TILESET_JOHTO, TOWN, LANDMARK_TOWN_06, MUSIC_VIRIDIAN_CITY, FALSE, PALETTE_AUTO, FISHGROUP_SHORE
	map RouteN05, TILESET_JOHTO, ROUTE, LANDMARK_ROUTE_N05, MUSIC_ROUTE_26, FALSE, PALETTE_AUTO, FISHGROUP_SHORE
	assert_table_length NUM_TOWN06_MAPS

MapGroup_City05:
	table_width MAP_LENGTH, MapGroup_City05
	map City05West, TILESET_JOHTO, TOWN, LANDMARK_CITY_05_WEST, MUSIC_VIRIDIAN_CITY, FALSE, PALETTE_AUTO, FISHGROUP_SHORE
	map City05East, TILESET_JOHTO, TOWN, LANDMARK_CITY_05_EAST, MUSIC_VIRIDIAN_CITY, FALSE, PALETTE_AUTO, FISHGROUP_SHORE
	assert_table_length NUM_CITY05_MAPS

MapGroup_Town08:
	table_width MAP_LENGTH, MapGroup_Town08
	map Town08, TILESET_JOHTO, TOWN, LANDMARK_TOWN_08, MUSIC_VIRIDIAN_CITY, FALSE, PALETTE_AUTO, FISHGROUP_SHORE
	map RouteN10, TILESET_JOHTO, ROUTE, LANDMARK_ROUTE_N10, MUSIC_ROUTE_26, FALSE, PALETTE_AUTO, FISHGROUP_SHORE
	assert_table_length NUM_TOWN08_MAPS

MapGroup_Town09:
	table_width MAP_LENGTH, MapGroup_Town09
	map Town09, TILESET_JOHTO, TOWN, LANDMARK_TOWN_09, MUSIC_VIRIDIAN_CITY, FALSE, PALETTE_AUTO, FISHGROUP_SHORE
	map RouteN11, TILESET_JOHTO, ROUTE, LANDMARK_ROUTE_N11, MUSIC_ROUTE_26, FALSE, PALETTE_AUTO, FISHGROUP_SHORE
	map RouteN12, TILESET_JOHTO, ROUTE, LANDMARK_ROUTE_N12, MUSIC_ROUTE_26, FALSE, PALETTE_AUTO, FISHGROUP_SHORE
	assert_table_length NUM_TOWN09_MAPS

MapGroup_City10:
	table_width MAP_LENGTH, MapGroup_City10
	map City10, TILESET_JOHTO, TOWN, LANDMARK_CITY_10, MUSIC_VIRIDIAN_CITY, FALSE, PALETTE_AUTO, FISHGROUP_SHORE
	map RouteN13, TILESET_JOHTO, ROUTE, LANDMARK_ROUTE_N13, MUSIC_ROUTE_26, FALSE, PALETTE_AUTO, FISHGROUP_SHORE
	assert_table_length NUM_CITY10_MAPS

MapGroup_City11:
	table_width MAP_LENGTH, MapGroup_City11
	map City11, TILESET_JOHTO, TOWN, LANDMARK_CITY_11, MUSIC_VIRIDIAN_CITY, FALSE, PALETTE_AUTO, FISHGROUP_SHORE
	map RouteN14, TILESET_JOHTO, ROUTE, LANDMARK_ROUTE_N14, MUSIC_ROUTE_26, FALSE, PALETTE_AUTO, FISHGROUP_SHORE
	assert_table_length NUM_CITY11_MAPS

MapGroup_Town12:
	table_width MAP_LENGTH, MapGroup_Town12
	map Town12, TILESET_JOHTO, TOWN, LANDMARK_TOWN_12, MUSIC_VIRIDIAN_CITY, FALSE, PALETTE_AUTO, FISHGROUP_SHORE
	map RouteN15, TILESET_JOHTO, ROUTE, LANDMARK_ROUTE_N15, MUSIC_ROUTE_26, FALSE, PALETTE_AUTO, FISHGROUP_SHORE
	assert_table_length NUM_TOWN12_MAPS

MapGroup_City13:
	table_width MAP_LENGTH, MapGroup_City13
	map City13, TILESET_JOHTO, TOWN, LANDMARK_CITY_13, MUSIC_VIRIDIAN_CITY, FALSE, PALETTE_AUTO, FISHGROUP_SHORE
	assert_table_length NUM_CITY13_MAPS
