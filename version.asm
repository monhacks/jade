DEF VER_MAJOR EQU 0
DEF VER_MINOR EQU 1
DEF VER_PATCH EQU 0

IF DEF(_DEBUG)

DEF VER_STRING EQUS "D-{u:VER_MAJOR}.{02u:VER_MINOR}.{03u:VER_PATCH}"

ELIF DEF(_DEMO)

DEF VER_STRING EQUS "M-{u:VER_MAJOR}.{02u:VER_MINOR}.{03u:VER_PATCH}"

ELSE

DEF VER_STRING EQUS "V-{u:VER_MAJOR}.{02u:VER_MINOR}.{03u:VER_PATCH}"

ENDC