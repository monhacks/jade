SECTION "Map Blocks 1", ROMX

Pokecenter2F_Blocks:    INCBIN "maps/Pokecenter2F.ablk"
PlayersHouse1F_Blocks:  INCBIN "maps/PlayersHouse1F.ablk"
Colosseum_Blocks:       INCBIN "maps/Colosseum.ablk"
ObsidianTown_Blocks:    INCBIN "maps/ObsidianTown.ablk"
PlayersHouse2F_Blocks:  INCBIN "maps/PlayersHouse2F.ablk"
VictoryRoad_Blocks:     INCBIN "maps/VictoryRoad.ablk"
RouteN01_Blocks:        INCBIN "maps/RouteN01.ablk"
ParksLab_Blocks:        INCBIN "maps/ParksLab.ablk"
ObsidianMeadow_Blocks:  INCBIN "maps/ObsidianMeadow.ablk"


SECTION "Map Blocks 2", ROMX
SECTION "Map Blocks 3", ROMX

TradeCenter_Blocks:
TimeCapsule_Blocks:     INCBIN "maps/TradeCenter.ablk"
_House_Blocks:          INCBIN "maps/House1.ablk"
_NorthSouthGate_Blocks: INCBIN "maps/NorthSouthGate.ablk"
_EastWestGate_Blocks:   INCBIN "maps/EastWestGate.ablk"
_Mart_Blocks:           INCBIN "maps/Mart.ablk"
_Pokecenter1F_Blocks:   INCBIN "maps/Pokecenter1F.ablk"
IF DEF(_DEBUG)
DebugRoom_Blocks:       INCBIN "maps/DebugRoom.ablk"
ENDC

ENDSECTION
