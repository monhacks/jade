	db 0 ; species ID placeholder

	db  50,  70, 100,  30,  40,  40
	evs  0,   0,   1,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db STEEL, ROCK ; type
	db 180 ; catch rate
	db 96 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 35 ; step cycles to hatch
	INCBIN "gfx/pokemon/aron/front.dimensions"
	db STURDY, ROCK_HEAD, HEAVY_METAL ; abilities
	db 0 ; unused
	db GROWTH_SLOW ; growth rate
	db 35 ; base happiness
	dn EGG_MONSTER, EGG_MONSTER ; egg groups

	; tm/hm learnset
	tmhm
	; end